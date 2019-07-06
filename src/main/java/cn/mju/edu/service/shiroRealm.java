package cn.mju.edu.service;
import cn.mju.edu.DAO.UserDao;
import cn.mju.edu.javabean.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.Realm;
import org.springframework.beans.factory.annotation.Autowired;

public class shiroRealm extends AuthenticatingRealm {
    @Autowired
    UserDao userDao;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken loginuser= (UsernamePasswordToken) authenticationToken;
        User user =userDao.selectUserByName(loginuser.getUsername());
        if(user==null){
            throw  new UnknownAccountException();
        }
        AuthenticationInfo authenticationInfo=new SimpleAuthenticationInfo(user,user.getPassword(),null,getName());
        return authenticationInfo;
    }
}
