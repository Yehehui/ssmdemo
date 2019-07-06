package cn.mju.edu.controller;

import cn.mju.edu.DAO.UserDao;
import cn.mju.edu.javabean.Role;
import cn.mju.edu.javabean.User;
import cn.mju.edu.service.RoleService;
import cn.mju.edu.service.UserService;
import cn.mju.edu.service.UserServiceimpl;
import cn.mju.edu.utils.AuthClass;
import cn.mju.edu.utils.AuthMethod;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
@AuthClass
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @GetMapping("/test")
    @ResponseBody
    public String testuser(){
        User user =new User();
        user.setId(3);
        user.setUsername("小巴");
        user.setPassword("123");
        user.setEmail("123@qq.com");
        user.setPhone("123456");
        user.setAddDate(new Date(System.currentTimeMillis()));
        user.setEnabled(1);
        userService.update(user);
        return  "success";
    }
    @AuthMethod
    @RequestMapping(value = "/admin/add",method = RequestMethod.POST)
    public String addUser(User user, Integer[] roleIds){
        System.out.println(user);
        userService.addUser(user,roleIds);
        return "redirect:admin_user?pageNum=1&pageSize=5";
    }
    @AuthMethod
    @ResponseBody
    @RequestMapping(value = "/admin/toupdate",method = RequestMethod.GET,produces = "text/html;charset=utf-8")
    public String toupdateUser(Integer id){
        User user =userService.selectRelateUserById(id);
        List<Role> roles=roleService.selectAll();
        List<Role> roleList=user.getRoleList();
        String str="";
        for(Role role:roles){
            if(roleList.contains(role)) str+="<option selected value=\""+role.getId()+"\">"+role.getName()+"</option>\n";
            else str+="<option  value=\""+role.getId()+"\">"+role.getName()+"</option>\n";
        }
        return "\n" +
                "            <div class=\"modal-header\">\n" +
                "                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
                "                <h4 class=\"modal-title\" id=\"myModalLabel1\">修改用户</h4>\n" +
                "            </div>\n" +
                "            <div class=\"modal-body\">\n" +
                "                <form id=\"updateform\" action=\"./update\" method=\"post\">\n" +
               "<input type=\"hidden\" name='id' value=\""+user.getId()+"\">"+
                "                    <div class=\"form-group\">\n" +
                "                        <label>用户名：</label>\n" +
                "                        <input type=\"text\" name=\"username\" class=\"form-control\" value=\""+user.getUsername()+"\">\n" +
                "                    </div>\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>密码(为空表示不修改)：</label>\n" +
                "                        <input type=\"text\" name=\"password\" class=\"form-control\" >\n" +
                "                    </div>\n" +
                "\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>关联角色：</label>\n" +
                "                        <select name=\"roleIds\" class=\"selectpicker form-control\" multiple>\n" +
                                            str+
                "                        </select>\n" +
                "                    </div>\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>手机号：</label>\n" +
                "                        <input type=\"text\" name=\"phone\" class=\"form-control\" value=\""+user.getPhone()+"\">\n" +
                "                    </div>\n" +
                "                    <div class=\"form-group\">\n" +
                "                        <label>邮箱：</label>\n" +
                "                        <input type=\"text\" name=\"email\" class=\"form-control\" value=\""+user.getEmail()+"\">\n" +
                "                    </div>\n" +
                "                </form>\n" +
                "            </div>\n" +
                "            <div class=\"modal-footer\">\n" +
                "                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button>\n" +
                "                <button onclick=\"submitform()\" type=\"button\" class=\"btn btn-primary\">修改</button>\n" +
                "            </div>";
    }
    @RequestMapping(value = "/admin/update",method = RequestMethod.POST)
    public String updateUser(User user,Integer[] roleIds){
        if(user.getPassword().trim().equals("")){
            user.setPassword(null);
        }
//        System.out.println(roleIds);
        userService.updateUser(user,roleIds);
        return "redirect:admin_user?pageNum=1&pageSize=5";
    }
    @AuthMethod
    @RequestMapping(value = "/admin/delete",method = RequestMethod.GET)
    public String deleteUser(Integer id){
        userService.deleteRelateUser(id);
        return "redirect:admin_user?pageNum=1&pageSize=5";
    }
    @AuthMethod
    @ResponseBody
    @RequestMapping(value = "/admin/batchDeleteUser",method = RequestMethod.POST)
    public String batchUser(@RequestParam("data") String ids){
        String str=ids.substring(1,ids.length()-1);
        String[] strlist=str.split(",");
        Integer[] intIds=new Integer[strlist.length];
        for(int i=0;i<strlist.length;i++){
            intIds[i]=Integer.parseInt(strlist[i].replaceAll("\"",""));
        }
//        userService.batchDeleteUser(intIds);
        return "success";
    }
    @AuthMethod
    @RequestMapping(value = "/admin/search",method = RequestMethod.POST)
    public String searchUser(Model model, String userinfo,Integer pageNum,Integer pageSize){
        if(pageNum==null) pageNum=1;
        if(pageSize==null) pageSize=5;
        PageInfo<User> user=userService.searchUserByPager(pageNum,pageSize,userinfo);
        model.addAttribute("userDatasByPager",user);
        return "redirect:admin_user?pageNum=1&pageSize=5";
    }
}
