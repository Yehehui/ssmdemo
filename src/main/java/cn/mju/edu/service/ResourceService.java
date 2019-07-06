package cn.mju.edu.service;

import cn.mju.edu.javabean.Resource;

import java.util.List;

public interface ResourceService extends BaseService<Resource> {
    void batchInsertResource(List<String> resources);
}
