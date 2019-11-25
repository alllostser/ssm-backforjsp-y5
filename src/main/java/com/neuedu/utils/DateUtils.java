package com.neuedu.utils;

import com.neuedu.dao.UsersDao;
import com.neuedu.pojo.Users;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class DateUtils {
    public static String toDateString(Date date){
        Date d = null;
        //yyyy-MM-dd HH:mm:ss表示24时间进制
        SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String da=sDateFormat.format(date);
//        try {
//             d= sDateFormat.parse(da);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//注:MySQL数据库中date和datetime数据类型可接收日期格式数据，若通过String类型插入数据库，需要在日期字符串上加上标即'1970-01-01 01:01:01'
        return da;
    }
    public static void main(String[] args) {
        ApplicationContext context= new ClassPathXmlApplicationContext("classpath:ApplicationContext.xml");
        UsersDao bean = context.getBean(UsersDao.class);
        List<Users> users = bean.getUsers();
        for (Users u : users) {
            System.out.println(u.getCreateDate());
        }
    }
}
