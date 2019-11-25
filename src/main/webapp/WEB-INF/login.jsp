<%--
  Created by IntelliJ IDEA.
  User: GuXinYu
  Date: 2019/11/6
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员登陆</title>
    <link rel="stylesheet" href="../static/admin/css/login.css">
    <link rel="stylesheet" href="../static/common/layui/css/layui.css">
    <script src="../static/common/layui/layui.js"></script>
</head>
<body id="login">
<div class="login">
    <h2>QAdmin后台</h2>
    <form class="layui-form" method="post"  action="/manage/user/islogin.do">
        <div class="layui-form-item">
            <input type="username" name="username" placeholder="用户名" value="${cookie.username.value}" class="layui-input" lay-verify="required|password">
            <i class="layui-icon input-icon">&#xe66f;</i>
        </div>
        <div class="layui-form-item">
            <input type="password" name="password" placeholder="密码" value="" class="layui-input" lay-verify="required|password">
            <i class="layui-icon input-icon">&#xe673;</i>
        </div>
        <div class="layui-form-item">
            <input id="checks"  type="checkbox" name="box" lay-skin="primary" title="记住密码" checked=""> <a class="back" href="javascript:;"  style="margin-top: 10px">忘记密码</a>
        </div>
        <div class="layui-form-item"><span style="color: red;"></span></div>
        <div class="layui-form-item">
<%--            <input class="layui-btn layui-btn-fluid layui-btn-normal " lay-submit="/manage/user/islogin.do" type="button" value="Login" lay-filter="login-submit">--%>
            <input id="lg" type="submit" style="width: 100%" class="layui-btn" lay-submit lay-filter="login" value="立即登录"/>

        </div>
    </form>
    <script src="../static/common/jquery-3.3.1.min.js"></script>
    <script>
        layui.use('form', function () {
            var form = layui.form,
                layer = layui.layer,
                $ = layui.jquery;


        });



    </script>
</div>
</body>

</html>
