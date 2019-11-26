package com.neuedu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neuedu.common.ResponseCode;
import com.neuedu.dao.UsersDao;
import com.neuedu.pojo.CountUsers;
import com.neuedu.pojo.Users;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Resource
    private UsersDao dao;

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    @Override
    public ResponseCode login(String username, String password) {
        if (username == null || password== null||username==""||password==""){
            ResponseCode rs = ResponseCode.defeatedRs("用户名或密码为空");
            return rs;
        }
        Users user = dao.getUserByUsernameAndPassword(username, password);
        if (user == null){
            ResponseCode rs = ResponseCode.defeatedRs("用户名或密码错误");
            return rs;
        }
        int i = dao.addLoginNumber(username);
        if (i == 1){
            Users user1 = dao.getUserByUsernameAndPassword(username, password);
            ResponseCode rs = ResponseCode.successRs(user1);
            return rs;
        }
        ResponseCode rs = ResponseCode.defeatedRs("未知错误，登录失败！");
        return rs;
    }

    /**
     * 主页用户列表
     * @return
     */
    @Override
    public ResponseCode getUsers() {
        List<Users> users = dao.getUsers();
//        for (Users u : users) {
//            u.setCreateDate(DateUtils.toDateString(u.getCreateDate()));
//        }
        ResponseCode rs = ResponseCode.successRs(users);
        return rs;
    }

    /**
     * 用户列表
     * @return
     */
    @Override
    public ResponseCode getUserList(String pageNum) {
        if (pageNum==null || "".equals(pageNum)){
            pageNum="1";
        }
        int page = Integer.parseInt(pageNum);
        PageHelper.startPage(page,10);
        List<Users> list = dao.getUserList(null);
        PageInfo<Users> pageInfo = new PageInfo<>(list);
        ResponseCode rs = ResponseCode.successRs(pageInfo);
        return rs;
    }

    /**
     * 通过id查用户
     * @param id
     * @return
     */
    @Override
    public ResponseCode getUserList(Integer id) {
        List<Users> user = dao.getUserList(id);
        ResponseCode rs = ResponseCode.successRs(user);
        return rs;
    }

    /**
     * 修改用户
     * @param users
     * @return
     */
    @Override
    public int updateUserByusername(Users users) {
        int i = dao.updateUserByusername(users);
        if (i<=0){
            ResponseCode.defeatedRs("未知错误，修改失败！");
        }
        return i;
    }

    /**
     * 模糊查询
     * @param param
     * @return
     */
    @Override
    public ResponseCode Search(String param,String pageNum) {
        if (pageNum==null || "".equals(pageNum)){
            pageNum="1";
        }
        int page = Integer.parseInt(pageNum);
        PageHelper.startPage(page,10);
        List<Users> search = dao.Search(param);
        PageInfo<Users> pageInfo = new PageInfo<>(search);
        ResponseCode rs = ResponseCode.successRs(pageInfo);
        return rs;
    }

    /**
     * 添加用户
     * @param users
     * @return
     */
    @Override
    public int addUser(Users users) {
        int i = dao.addUser(users);
        return i;
    }

    /**
     * 统计用户注册
     * @return
     */
    @Override
    public List<CountUsers> countUsers() {
        List<CountUsers> countUsers = dao.countUsers();
        return countUsers;
    }

    /**
     * 修改密码
     * @param id
     * @return
     */
    @Override
    public int updatePassworById(Integer id,String password) {
        return dao.updatePasswordById(id,password);
    }
}
