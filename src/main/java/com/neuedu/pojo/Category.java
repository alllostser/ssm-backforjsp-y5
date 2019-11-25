package com.neuedu.pojo;

import lombok.Data;

@Data
public class Category {
    private Integer id;

    private Integer parentId;

    private String name;

    private Boolean status;

    private Integer sortOrder;

    private String createTime;

    private String updateTime;

}