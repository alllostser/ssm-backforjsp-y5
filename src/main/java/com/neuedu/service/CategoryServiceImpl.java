package com.neuedu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.dao.CategoryDao;
import com.neuedu.pojo.Category;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryDao dao;

    /**
     * 获取全部品类
     * @return
     */
    @Override
    public PageInfo<Category> selectAll(String pageNum) {
        if (pageNum==null || "".equals(pageNum)){
            pageNum="1";
        }
        int page = Integer.parseInt(pageNum);
        PageHelper.startPage(page,10);
        List<Category> categories = dao.selectAll();
        PageInfo<Category> pageInfo = new PageInfo<>(categories);
        return  pageInfo;
    }

    @Override
    public List<Category> selectAll() {
        List<Category> list = dao.selectAll();
        return list;
    }

    /**
     * 添加品类
     * @param record
     * @return
     */
    @Override
    public int insert(Category record) {
        int insert = dao.insert(record);
        return insert;
    }

    /**
     * 根据id查一条
     * @param id
     * @return
     */
    @Override
    public Category selectById(Integer id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 修改品类
     * @param category
     * @return
     */
    @Override
    public int update(Category category) {
        return dao.updateByPrimaryKeySelective(category);
    }
}
