package cn.mju.edu.service;

import cn.mju.edu.javabean.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

public class UserServiceimplTest {
    @Autowired
    UserService userService;
    @Test
    public void selectRelateUser() {
        List<User> users = userService.selectRelateUser();
        System.out.println(users);
    }
    @Test
    public void selectRelateUserById(){
        User user=userService.selectRelateUserById(1);
        System.out.println(user);

    }
}