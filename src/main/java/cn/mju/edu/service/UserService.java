package cn.mju.edu.service;

import cn.mju.edu.javabean.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UserService extends BaseService<User> {
    public void addUser(User user, Integer[] roleIds);

    public List<User> selectRelateUser();

   public PageInfo<User> selectUserByPager(int PageNum,int PageSize);
   public User selectRelateUserById(Integer id);

    void updateUser(User user, Integer[] roleIds);

    void deleteRelateUser(Integer id);

    void batchDeleteUser(Integer[] intIds);

    PageInfo<User> searchUserByPager(Integer pageNum, Integer pageSize, String userinfo);

    User selectUserRelRoleRelRes(String userinfo);
}
