package cn.mju.edu.DAO;

import org.apache.ibatis.annotations.Param;

public interface ResourceDao extends BaseDao {
    int getResByPath(@Param("path") String res);
}
