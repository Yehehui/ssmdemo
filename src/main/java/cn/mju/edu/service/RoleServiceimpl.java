package cn.mju.edu.service;

import cn.mju.edu.DAO.BaseDao;
import cn.mju.edu.DAO.RoleDao;
import cn.mju.edu.javabean.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("roleService")
public class RoleServiceimpl extends BaseServiceimpl<Role> implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public BaseDao getBaseDao() {
        return roleDao;
    }
}
