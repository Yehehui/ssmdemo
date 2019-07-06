package cn.mju.edu.service;

import java.util.List;

public interface BaseService<T> {
    public void add(T t);
    public void delete(int id);
    public void update(T t);
    public T select(int id);
    public List<T> selectAll();

}
