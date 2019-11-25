package com.neuedu.pojo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
@Data
public class Product {
    private Integer id;

    private Integer categoryId;

    private String name;

    private String subtitle;

    private String mainImage;

    private BigDecimal price;

    private String detail;

    private Integer stock;

    private Integer status;

    private Boolean isNew;

    private Boolean isHot;

    private Boolean isBanner;

    private String subImages;

    private Date createTime;

    private Date updateTime;

}