package com.neuedu.web.test;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.neuedu.dao.ProductDao;
import com.neuedu.dao.UsersDao;
import com.neuedu.pojo.CountUsers;
import com.neuedu.pojo.Product;
import com.neuedu.pojo.Users;
import com.neuedu.service.ProductService;
import com.neuedu.vo.ProductVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext.xml")
public class UserDaoTestDemo {
    @Resource
    private ProductService service;
    @Test
    public void test1(){
//        List<Users> users = dao.getUsers();
//        System.out.println(users);
//        Users users = new Users();
//        users.setNickname("大章鱼");
//        users.setUsername("linjing1");
//        users.setPassword("123456");
//        users.setEmail("lingjing1@sina.com");
//        users.setPhone("13072119948");
//        users.setType(0);
//        users.setStatus(0);
//        int i = dao.addUser(users);
//        List<Users> i = dao.Search("流年");
        HashMap<String, Object> hashMap = service.selectAll("1");
        Set<String> strings = hashMap.keySet();
        Iterator iterator = strings.iterator();
        while (iterator.hasNext()){
            String next = (String) iterator.next();
            System.out.println(next);
        }
        Collection<Object> values = hashMap.values();
        for (Object value : values) {
            System.out.println(value);
        }
        System.out.println("==================================");
        List<ProductVo> vos = (List<ProductVo>) hashMap.get("vos");
        System.out.println(vos);
        System.out.println("===================================");
        PageInfo pageInfo = (PageInfo) hashMap.get("pageInfo");
        System.out.println(pageInfo);
    }

    @Test
    public void test2(){
        Product product =new Product();
        product.setCategoryId(2);
        product.setName("小洋人");
        product.setPrice(BigDecimal.valueOf(100));
        product.setStock(100);
        int i = service.insertSelective(product);
        System.out.println(i);

    }
    @Test
    public void test3(){
        int a =100,b=50,c=a---b,d=a---b;
    }
    @Test
    public void test4(){
        System.out.println(anInt());
    }



    public int anInt(){

        try {
            int a = 1/1;
            return 1;
        }catch (Exception e){
            return 2;
        }finally {
            return 3;
        }
    }
}

