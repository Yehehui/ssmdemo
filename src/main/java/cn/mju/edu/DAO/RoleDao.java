package cn.mju.edu.DAO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RoleDao extends BaseDao {
    void deleteByUid(@Param("uid") Integer uid);
}
