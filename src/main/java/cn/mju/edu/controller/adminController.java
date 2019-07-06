package cn.mju.edu.controller;

import cn.mju.edu.javabean.Role;
import cn.mju.edu.javabean.User;
import cn.mju.edu.service.RoleService;
import cn.mju.edu.service.UserService;
import cn.mju.edu.utils.AuthClass;
import cn.mju.edu.utils.AuthMethod;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
@AuthClass
@Controller
public class adminController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;
    @AuthMethod
    @RequestMapping(value = "/admin/admin",method = RequestMethod.GET)
    public String admin(){
        return "admin/admin";
    }
    @RequestMapping(value = "/admin/admin_user",method = RequestMethod.GET)
    public String adminuser(Model model,Integer pageNum,Integer pageSize){
        List<Role>  roles=roleService.selectAll();
        if(pageNum==null) pageNum=1;
        if(pageSize==null) pageSize=5;
        PageInfo<User> users=userService.selectUserByPager(pageNum,pageSize);
        model.addAttribute("roles",roles);
        model.addAttribute("userDatasByPager",users);
        return "admin/admin_user";
    }
    @RequestMapping(value = "/admin/admin_role",method = RequestMethod.GET)
    public String adminrole(){
        return "admin/admin_role";
    }
    @RequestMapping(value = "/admin/admin_res",method = RequestMethod.GET)
    public String adminres(){
        return "admin/admin_res";
    }
}
