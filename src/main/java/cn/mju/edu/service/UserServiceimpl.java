package cn.mju.edu.service;

import cn.mju.edu.DAO.BaseDao;
import cn.mju.edu.DAO.RoleDao;
import cn.mju.edu.DAO.UserDao;
import cn.mju.edu.DAO.UserRoleDao;
import cn.mju.edu.javabean.User;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("userService")
public class UserServiceimpl extends BaseServiceimpl<User> implements UserService  {
    @Autowired
    UserDao userDao;
    @Autowired
    UserRoleDao userRoleDao;
    @Autowired
    private RoleDao roleDao;
    @Override
    public BaseDao getBaseDao() {
        return userDao;
    }

    @Override
    public void addUser(User user, Integer[] roleIds) {
        user.setEnabled(1);
        user.setAddDate(new Date());
        this.add(user);
        User u=userDao.selectUserByName(user.getUsername());
        for(int i:roleIds){
            userRoleDao.add("t_user_role",new Object[]{null,u.getId(),i});
        }
    }

    @Override
    public List<User> selectRelateUser() {
        return userDao.selectRelateUser();
    }

    @Override
    public PageInfo<User> selectUserByPager(int PageNum,int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<User> users=userDao.selectRelateUser();
        PageInfo info = new PageInfo(users);
        return info;
    }

    @Override
    public User selectRelateUserById(Integer id) {
        return userDao.selectRelateUserById(id);
    }

    @Override
    public void updateUser(User user, Integer[] roleIds) {
        roleDao.deleteByUid(user.getId());
        for(int i:roleIds){
            userRoleDao.add("t_user_role",new Object[]{null,user.getId(),i});
        }
        this.update(user);
    }

    @Override
    public void deleteRelateUser(Integer id) {
        roleDao.deleteByUid(id);
        this.delete(id);
    }

    @Override
    public void batchDeleteUser(Integer[] intIds) {
        for(int i:intIds){
            this.deleteRelateUser(i);
        }
    }

    @Override
    public PageInfo<User> searchUserByPager(Integer pageNum, Integer pageSize, String userinfo) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> users=userDao.searchUserByPager("%"+userinfo+"%");
        PageInfo info = new PageInfo(users);
        return info;
    }

    @Override
    public User selectUserRelRoleRelRes(String userinfo) {
       return  userDao.selectUserRelRoleRelRes(userinfo);
    }
}
