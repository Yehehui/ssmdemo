package cn.mju.edu.controller;

import cn.mju.edu.javabean.Resource;
import cn.mju.edu.javabean.Role;
import cn.mju.edu.javabean.User;
import cn.mju.edu.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class loginController {
    @Autowired
    UserService userService;
    @RequestMapping(value = {"/login","/"},method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value = "userlogin",method = RequestMethod.POST)
    public String userlogin(User user){
        System.out.println(user);
            Subject loginuser= SecurityUtils.getSubject();
            UsernamePasswordToken token=new UsernamePasswordToken(user.getUsername(),user.getPassword());
            try{
            loginuser.login(token);
        }catch (Exception e){
            e.getMessage();
        }
        return "redirect:admin/admin";
    }
//    @GetMapping("/logout")
//    public String logout(){
//        return "redirect:admin/admin";
//    }
}
