package cn.mju.edu.utils;

import cn.mju.edu.service.ResourceService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.File;
import java.io.FilenameFilter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class initWebServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static ApplicationContext applicationContext;

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);

        try {
            String controllerPath = "cn/mju/edu/controller";
            String path = this.getClass().getClassLoader().getResource(controllerPath).getPath();
            File file = new File(path);
            String[] filenamelist = file.list(new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    if (name.endsWith(".class"))
                        return true;
                    return false;
                }
            });
            List<String>  resources=new ArrayList<>();
            for (String classname : filenamelist) {
                classname = classname.substring(0, classname.indexOf(".class"));
                classname = controllerPath.replaceAll("/",".") +"."+ classname;
                Class clazz = Class.forName(classname);
                if (!clazz.isAnnotationPresent(AuthClass.class)) continue;
                Method[] methods = clazz.getDeclaredMethods();
                for (Method method : methods) {
                    if (!method.isAnnotationPresent(AuthMethod.class)) continue;
                    RequestMapping mapping=method.getAnnotation(RequestMapping.class);
                    resources.add(mapping.value()[0]);
                }
            }
            ResourceService resourceService= (ResourceService) applicationContext.getBean("resourceService");
            resourceService.batchInsertResource(resources);
            context.setAttribute("resources",resources);
        }catch(Exception e){
                e.printStackTrace();
            }
        }

}
