package com.neuedu.dao;

import com.neuedu.pojo.CountUsers;
import com.neuedu.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface UsersDao {
    List<Users> getUsers();
    List<Users> getUserList(@Param("id") Integer id);
    Users getUserByUsernameAndPassword(@Param("username") String username,@Param("password") String password);
    int addLoginNumber(String username);//统计登录次数
    int updateUserByusername(Users users);
    List<Users> Search(@Param("param") String param);
    int addUser(Users users);
    List<CountUsers> countUsers();
}
