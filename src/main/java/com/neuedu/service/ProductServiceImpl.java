package com.neuedu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.dao.CategoryDao;
import com.neuedu.dao.ProductDao;
import com.neuedu.pojo.Product;
import com.neuedu.utils.TimeUtils;
import com.neuedu.vo.ProductVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductDao dao;
    @Resource
    private CategoryDao categoryDao;
    /**
     * 获取全部商品
     * @return
     */
    @Override
    public HashMap<String, Object> selectAll(String pageNum) {
        HashMap<String,Object> hashMap = new HashMap<String,Object>();
        if (pageNum==null || "".equals(pageNum)){
            pageNum="1";
        }
        /*分页效果*/
        int page = Integer.parseInt(pageNum);
        PageHelper.startPage(page,10);
        ArrayList<ProductVo> vos = new ArrayList<>();
        List<Product> products = dao.selectAll();
        PageInfo<Product> pageInfo = new PageInfo<>(products);
        List<Product> list = pageInfo.getList();
        for (Product pro : list) {
            ProductVo vo = new ProductVo();
            vo.setProId(pro.getId());
            vo.setProName(pro.getName());
            vo.setCategoryName(categoryDao.selectByPrimaryKey(pro.getCategoryId()).getName());
            System.out.println(pro.getCategoryId());
            System.out.println("----------------");
            System.out.println(categoryDao.selectByPrimaryKey(pro.getCategoryId()));
            vo.setPrice(pro.getPrice());
            vo.setProDetail(pro.getDetail());
            vo.setStock(pro.getStock());
            if (pro.getStatus()==0){
                vo.setProStatus("有效");
            }else {
                vo.setProStatus("无效");
            }
            vo.setProUrl("http://127.0.0.1:8080/manage/static/img/"+pro.getMainImage());
            vo.setCreateTime(TimeUtils.dateToStr(pro.getCreateTime()));
            vo.setUpdateTime(TimeUtils.dateToStr(pro.getUpdateTime()));
            vos.add(vo);
        }
        hashMap.put("vos", vos);
        hashMap.put("pageInfo", pageInfo);
        return hashMap;
    }

    /**
     * 新增商品（插入）
     * @param product
     * @return
     */
    @Override
    public int insertSelective(Product product) {
        return dao.insertSelective(product);
    }

    @Override
    public int updateByPrimaryKeySelective(Product product) {
        return dao.updateByPrimaryKeySelective(product);
    }

    /**
     * 根据id查一条
     * @param id
     * @return
     */
    @Override
    public Product selectOneById(Integer id) {
        return dao.selectOneById(id);
    }

    @Override
    public List<Product> selectAll() {
        return dao.selectAll();
    }
}
