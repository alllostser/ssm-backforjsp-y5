<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户列表</title>
    <link rel="stylesheet" href="../static/common/layui/css/layui.css">
    <link rel="stylesheet" href="../static/admin/css/style.css">
    <script src="../static/common/layui/layui.js"></script>
    <script src="../static/common/jquery-3.3.1.min.js"></script>
    <script src="../static/common/vue.min.js"></script>

</head>
<body>
<div id="app">
    <!--顶栏-->
    <header>
        <h1 v-text="webname"></h1>
        <div class="breadcrumb">
            <i class="layui-icon">&#xe715;</i>
            <ul>
                <li v-for="vo in address">
                    <a  v-text="vo.name" :href="vo.url" ></a> <span>/</span>
                </li>
            </ul>
        </div>
    </header>

    <div class="main" id="app">
        <!--左栏-->
        <div class="left">
            <ul class="cl" >
                <!--顶级分类-->
                <li v-for="vo,index in menu" :class="{hidden:vo.hidden}">
                    <a href="javascript:;"  :class="{active:vo.active}"  @click="onActive(index)">
                        <i class="layui-icon" v-html="vo.icon"></i>
                        <span v-text="vo.name"></span>
                        <i class="layui-icon arrow" v-show="vo.url.length==0">&#xe61a;</i> <i v-show="vo.active" class="layui-icon active">&#xe623;</i>
                    </a>
                    <!--子级分类-->
                    <div v-for="vo2,index2 in vo.list">
                        <a href="javascript:;" :class="{active:vo2.active}" @click="onActive(index,index2)" v-text="vo2.name"></a>
                        <i v-show="vo2.active" class="layui-icon active">&#xe623;</i>
                    </div>
                </li>
            </ul>
        </div>
        <!--右侧-->
        <div class="right">


            <div class="layui-row">
                <div class="layui-col-lg8">
<%--                    <a href="?/admin/user/index/connect/qq.html" class="layui-btn">QQ</a>--%>

<%--                    <a href="?/admin/user/index/connect/weibo.html" class="layui-btn">微博</a>--%>
<%--                    <a href="?/admin/user/index/connect/weixin.html" class="layui-btn">微信</a>--%>
<%--                    <a href="?/admin/user/index/connect/alipay.html" class="layui-btn">支付宝</a>--%>
<%--                    <a href="?/admin/user/index/connect/xcx.html" class="layui-btn">小程序</a>--%>
                </div>

                <form  class="layui-col-lg4" style="text-align: right;float: right" action="/manage/user/search.do">

                    <div class="layui-input-inline" style="width: 300px">
                        <input type="text" name="param" value="" placeholder="手机/用户名/邮箱/昵称" class="layui-input key">
                    </div>
                    <input type="submit" class="layui-btn sou" value="搜索"/>
                </form>
            </div>

            <table class="layui-table layui-form">

                <thead>
                <tr>
                    <th><a href="?/admin/user/index/order/uid.html">UID</a></th>
                    <th>手机</th>
                    <th>用户名</th>
                    <th>昵称</th>

                    <th>邮箱</th>
                    <th><a href="?/admin/user/index/order/reg_time.html">注册时间</a></th>
                    <th><a href="?/admin/user/index/order/login_time.html">登录时间</a></th>
                    <th><a href="?/admin/user/index/order/login.html">登录次数</a></th>
                    <th><a href="?/admin/user/index/order/state.html">状态</a></th>
                    <th>权限</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${rs.data.list}" var="user">
                    <tr class="id36567">
                        <td>${user.id}</td>
                        <td>${user.phone}</td>
                        <td>${user.username}</td>
                        <td>${user.nickname}</td>
                        <td>${user.email}</td>
                        <td>${user.createDate}</td>
                        <td>${user.updateDate}</td>
                        <td>${user.loginNumber}</td>
                        <td>
                            <input type="checkbox"<c:if test="${user.status==1}">checked </c:if> readonly="readonly" lay-filter="state" data-uid="36567" lay-text="正常|封禁" name="switch" class="switch"  lay-skin="switch"></input>
                        </td>

                        <td><c:if test="${user.type==1}">管理员</c:if><c:if test="${user.type==0}">会员</c:if></td>
                        <td><a href="/manage/user/updateuser.do?id=${user.id}">修改</a></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <div class="page">
                <ul class="pagination">
                    <li class="disabled">
                        <c:if test="${rs.data.hasPreviousPage}">
                            <a href="/manage/user/userlist.do?pageNum=${rs.data.pageNum-1}">&laquo;</a>
                        </c:if>
                    </li>
                    <c:forEach items="${rs.data.navigatepageNums}" var="p">
                        <li>
                            <c:if test="${rs.data.pageNum==p}">
                                <span>${p}</span>
                            </c:if>
                            <c:if test="${rs.data.pageNum!=p}">
                                <a href="/manage/user/userlist.do?pageNum=${p}">${p}</a>
                            </c:if>
                        </li>
                    </c:forEach>
                    <li class="disabled">
                        <c:if test="${rs.data.hasNextPage}">
                            <a href="/manage/user/userlist.do?pageNum=${rs.data.nextPage}">&raquo;</a>
                        </c:if>
                    </li>
                </ul>
            </div>


        </div>
    </div>
</div>
<script src="../static/admin/js/config.js"></script>
<script src="../static/admin/js/script.js"></script>
<script>
</script>
</body>
</html>
