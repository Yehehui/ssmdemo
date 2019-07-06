package cn.mju.edu.DAO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
@Mapper
public interface BaseDao {
    public void add(@Param("tablename") String tablename,@Param("params") Object... params);
    public void delete(@Param("tablename") String tablename,@Param("id") int id);
    public void update(@Param("tablename") String tablename,@Param("id")int id,@Param("params") Object... params);
    public Map<Object,Object> select(@Param("tablename") String tablename,@Param("id")int id);
    public List<Map<Object,Object>> selectAll(@Param("tablename") String tablename);
}
