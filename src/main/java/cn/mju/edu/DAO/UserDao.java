package cn.mju.edu.DAO;

import cn.mju.edu.javabean.Role;
import cn.mju.edu.javabean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface UserDao extends BaseDao {
    public User selectUserByName(@Param("username") String username);
    public Role getRoleByUid(int uid);
    public List<User> selectRelateUser();
    public User selectRelateUserById(Integer id);
    List<User> searchUserByPager(String userinfo);
    User selectUserRelRoleRelRes(String userinfo);
}
