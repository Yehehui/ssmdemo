package cn.mju.edu.service;

import cn.mju.edu.DAO.BaseDao;
import cn.mju.edu.DAO.ResourceDao;
import cn.mju.edu.javabean.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("resourceService")
public class ResourceServiceimpl extends BaseServiceimpl<Resource> implements ResourceService {
    @Autowired
    ResourceDao resourceDao;
    @Override
    public BaseDao getBaseDao() {
        return resourceDao;
    }

    @Override
    public void batchInsertResource(List<String> resources) {
        for(String res:resources){
            if(resourceDao.getResByPath(res)==0){
                this.add(new Resource(res));
            }else{
                continue;
            }
        }
    }
}
