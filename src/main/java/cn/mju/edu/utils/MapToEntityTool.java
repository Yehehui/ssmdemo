package cn.mju.edu.utils;


import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapToEntityTool {
    public static <T> T maptoentity(Map<Object,Object> map,Class<T> entity){
        List<String> fieldnameList=new ArrayList<>();
        Map<Object, Method> methodmap=new HashMap<>();
        String fieldname;
        String methodname;
        Method setMethod=null;
        for(Field field:entity.getDeclaredFields()){
            field.setAccessible(true);
            fieldname=field.getName();
            fieldnameList.add(fieldname);
            methodname="set"+fieldname.substring(0,1).toUpperCase()+fieldname.substring(1);
            try {
                setMethod=entity.getDeclaredMethod(methodname,field.getType());
            } catch (Exception e) {
                e.printStackTrace();
            }
            methodmap.put(fieldname,setMethod);
        }
        Map<Object,Object> newmap=new HashMap<>();
        String key1=null;
        String key2=null;
        Object temp=null;
        for(Object obj:map.keySet()){
            temp=map.get(obj);
            while(obj.toString().contains("_")){
                key1=obj.toString().substring(0,obj.toString().indexOf("_"));
                key2=obj.toString().substring(obj.toString().indexOf("_")+1);
                obj=key1+key2.substring(0,1).toUpperCase()+key2.substring(1);
            }
            newmap.put(obj,temp);
        }
        T en=null;
        try {
            en=entity.getDeclaredConstructor().newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Object mapfieldvalue;
        Method method;
        Class<?>[] parameterytpes=null;
        for(String fieldname1:fieldnameList){
            mapfieldvalue=newmap.get(fieldname1);
            if (mapfieldvalue == null) continue;
            method=methodmap.get(fieldname1);
            if(method==null) continue;
            parameterytpes=method.getParameterTypes();
            if(parameterytpes==null||parameterytpes.length>1) continue;
            if(parameterytpes[0].isAssignableFrom(mapfieldvalue.getClass())){
                try {
                    method.invoke(en,mapfieldvalue);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return en;
    }
}
