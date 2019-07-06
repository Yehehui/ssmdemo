package cn.mju.edu.javabean;

import java.util.List;
import java.util.Objects;

public class Role {
    private Integer id;
    private String name;
    private String code;
    private List<Resource> resList;

    public List<Resource> getResList() {
        return resList;
    }

    public void setResList(List<Resource> resList) {
        this.resList = resList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", resList=" + resList +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Role role = (Role) o;
        return Objects.equals(id, role.id);
    }

}
