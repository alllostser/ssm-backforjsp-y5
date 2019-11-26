package com.neuedu.web;

import com.neuedu.common.ResponseCode;
import com.neuedu.pojo.CountUsers;
import com.neuedu.pojo.Users;
import com.neuedu.service.UsersService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/manage/user")
public class UsersWeb {
    @Resource
    private UsersService service;

    /**
     * 主页用户列表
     * @param map
     * @return
     */
    @RequestMapping("/list.do")
    public String userList(ModelMap map){
        ResponseCode rs = service.getUsers();
        map.addAttribute("users", rs.getData());
        return "index";
    }
    /**
     * 用户登录模块
     * @param username
     * @param password
     * @param request
     * @return
     */
    @RequestMapping("/islogin.do")
    public String isLogin(String username, String password,HttpServletRequest request,HttpServletResponse response){
        ResponseCode rs = service.login(username, password);
        HttpSession session = request.getSession();
        if (rs.getData()!=null) {
           Users us = (Users) rs.getData();
//            if (us.getType()!=1 && us.getType()!=null){
//                return "login";
//            }

            session.setAttribute("user", rs.getData());
            Cookie cookie = new Cookie("username",us.getUsername());
            Cookie cookie2 = new Cookie("password",us.getPassword());
            response.addCookie(cookie);
            response.addCookie(cookie2);
            return "redirect:list.do";
        }else {
            return "login";
        }
    }
    /**
     * 用户模块列表
     * @param map
     * @return
     */
    @RequestMapping("/userlist.do")
    public String users(ModelMap map, String pageNum){
        ResponseCode rs = service.getUserList(pageNum);
        map.addAttribute("rs", rs);
        return "user_index";
    }

    /**
     * 进入用户修改操作页面
     * @param map
     * @return
     */
    @RequestMapping("/updateuser.do")
    public String uadateUser(@RequestParam("id") String id, ModelMap map){
        System.out.println(id);
        ResponseCode rs = service.getUserList(Integer.parseInt(id));
        map.addAttribute("rs", rs);
        return "update_user";
    }

    /**
     * 执行修改操作
     * @return
     */
    @RequestMapping("/doUpdate.do")
    public String doUpdate(Users users,ModelMap map){
        int i = service.updateUserByusername(users);
        ResponseCode rs = ResponseCode.successRs(null);
        map.addAttribute("rs", rs);
        return "redirect:userlist.do";
    }

    /**
     * 用户模糊查询
     * @param map
     * @param param
     * @param pageNum
     * @return
     */
    @RequestMapping("/search.do")
    public String Search(ModelMap map,String param,String pageNum){
        ResponseCode rs = service.Search(param,pageNum);
        map.addAttribute("rs", rs);
        return "user_index";
    }

    /**
     * 添加用户
     * @return
     */
    @RequestMapping("/adduser.do")
    public String addUser(){
        return "user_add";
    }
    @RequestMapping("doAdd.do")
    public String doAdd(Users users){
        int i = service.addUser(users);
        return "redirect:userlist.do";
    }

    /**
     * 登录统计
     * @return
     */
    @RequestMapping("/countloginer.do")
    @ResponseBody
    public List<CountUsers> countLoinger(){
        List<CountUsers> countUsers = service.countUsers();
//        String str = JSONObject.toJSONString(countUsers);
        return countUsers;
    }

    /**
     * 修改密码
     * @param session
     * @param password
     * @return
     */
    @RequestMapping("/do_update_psd.do")
    public String updatePsd(HttpSession session,String password){
       Users user = (Users) session.getAttribute("user");
        int i = service.updatePassworById(user.getId(), password);
        session.setAttribute("user",null);
        return "redirect:islogin.do";

    }

    /**
     * 退出
     * @param request
     * @return
     */
    @RequestMapping("/exit.do")
    public String Exit(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("user",null);
        return "redirect:islogin.do";
    }

}
