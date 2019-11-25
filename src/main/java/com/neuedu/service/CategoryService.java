package com.neuedu.service;

import com.github.pagehelper.PageInfo;
import com.neuedu.pojo.Category;

import java.util.List;

public interface CategoryService {
    PageInfo<Category> selectAll(String pageNum);
    List<Category> selectAll();
    int insert(Category record);
    int update(Category category);

    Category selectById(Integer id);
}
