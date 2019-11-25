package com.neuedu.service;

import com.neuedu.common.ResponseCode;
import com.neuedu.pojo.CountUsers;
import com.neuedu.pojo.Users;

import java.util.List;


public interface UsersService {
    ResponseCode login(String username, String password);
    ResponseCode getUsers();
    ResponseCode getUserList(String pageNum);
    ResponseCode getUserList(Integer id);
    int updateUserByusername(Users users);
    ResponseCode Search(String param,String pageNum);
    int addUser(Users users);
    List<CountUsers> countUsers();
}
