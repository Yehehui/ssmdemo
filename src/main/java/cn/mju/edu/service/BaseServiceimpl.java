package cn.mju.edu.service;

import cn.mju.edu.DAO.BaseDao;
import cn.mju.edu.utils.MapToEntityTool;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class BaseServiceimpl<T> implements  BaseService<T> {

    public abstract BaseDao getBaseDao();
    public Class<?> clazz;
    public String tablename;
    public BaseServiceimpl(){
        Type type =this.getClass().getGenericSuperclass();
        ParameterizedType tp= (ParameterizedType) type;
        clazz= (Class<?>) tp.getActualTypeArguments()[0];
        tablename="t_"+clazz.getSimpleName().toLowerCase();
    }
    @Override
    public void add(T t) {
        List<Object> list =new ArrayList<>();
        for(Field field:t.getClass().getDeclaredFields()){
            field.setAccessible(true);
            try {
                if(field.getName()!="roleList")
                    list.add(field.get(t));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        System.out.println(list);
        getBaseDao().add(tablename,list.toArray());
    }
    @Override
    public void delete(int id) {
        getBaseDao().delete(tablename,id);
    }

    @Override
    public void update(T t) {
        List<Object> list=new ArrayList<>();
        int id=0;
        for(Field field:t.getClass().getDeclaredFields()){
            field.setAccessible(true);
            try {
                if(field.get(t)==null){
                    continue;
                }
                if("id".equals(field.getName())){
                    id= (int) field.get(t);
                    continue;
                }
                list.add(field.getName()+"='"+field.get(t)+"'");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        getBaseDao().update(tablename,id,list.toArray());
    }

    @Override
    public T select(int id) {
        Map<Object,Object> map=getBaseDao().select(tablename,id);
        return (T) MapToEntityTool.maptoentity(map,clazz);
    }

    @Override
    public List<T> selectAll() {
        List<Map<Object,Object>> mapList=getBaseDao().selectAll(tablename);
        List<T> list=new ArrayList<>();
        for(Map<Object,Object> map:mapList){
            list.add((T) MapToEntityTool.maptoentity(map,clazz));
        }
        return list;
    }
}
