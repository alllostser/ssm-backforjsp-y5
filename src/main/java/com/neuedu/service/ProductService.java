package com.neuedu.service;

import com.neuedu.pojo.Product;

import java.util.HashMap;
import java.util.List;

public interface ProductService {
    HashMap<String, Object> selectAll(String pageNum);
    int insertSelective(Product product);
    int updateByPrimaryKeySelective(Product product);
    Product selectOneById(Integer id);
    List<Product> selectAll();
}
