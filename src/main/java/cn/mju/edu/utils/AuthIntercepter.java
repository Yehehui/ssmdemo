package cn.mju.edu.utils;

import cn.mju.edu.javabean.Resource;
import cn.mju.edu.javabean.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.List;

public class AuthIntercepter extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session=request.getSession();
        String resource="";
        if(handler instanceof HandlerMethod){
            HandlerMethod handlerMethod= (HandlerMethod) handler;
            Method method =handlerMethod.getMethod();
            RequestMapping mapping=method.getAnnotation(RequestMapping.class);
            resource=mapping.value()[0];
        }else{
            throw new RuntimeException("地址输入错误");
        }
        System.out.println("方法:"+resource);
        List<Resource> resources= (List<Resource>) request.getServletContext().getAttribute("resources");
        System.out.println("全部权限控制的方法："+resources);
        List<Resource> userresource= (List<Resource>) session.getAttribute("userResource");
        System.out.println("用户权限控制的方法："+userresource);
        User user= (User) session.getAttribute("loginuser");
        if (user == null) {
            response.sendRedirect(request.getContextPath()+"/login");
//            return false;
        }else{
            boolean flag= (boolean) session.getAttribute("isadmin");
            if(!flag&&resources.contains(resource)){
//                if(!userresource.contains(resource)){
//                    response.sendRedirect(request.getContextPath()+"/index");
//                }
                boolean test=false;
                for(Resource r:userresource){
                    if(r.getPath().equals(resource)){
                        test=true;
                    }
                }
                if(!test) throw new RuntimeException("权限不够");
            }
        }
        return super.preHandle(request, response, handler);
    }
}
