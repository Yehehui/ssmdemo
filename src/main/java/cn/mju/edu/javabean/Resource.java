package cn.mju.edu.javabean;

import java.util.Objects;

public class Resource {
    private Integer id;
    private String path;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", path='" + path + '\'' +
                '}';
    }

    public Resource() {
    }

    public Resource(String path) {
        this.path = path;
    }

}
