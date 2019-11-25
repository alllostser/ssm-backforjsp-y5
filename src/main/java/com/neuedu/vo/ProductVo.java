package com.neuedu.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProductVo {
    private Integer proId;
    private String proName;
    private String proUrl;
    private BigDecimal price;
    private Integer stock;
    private String categoryName;
    private String proStatus;
    private String proDetail;
    private String createTime;
    private String updateTime;

}
