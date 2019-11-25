<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>商品管理</title>
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


            <a href="/manage/product/addproduct.do" class="layui-btn"><i class="layui-icon">&#xe654;</i>添加商品</a>

            <table class="layui-table layui-form">
                <colgroup>
                    <col >
                    <col >
                    <col >
                    <col width="220" height="80">
                    <col >
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>缩略图</th>
                    <th>商品名称</th>
                    <th>详情</th>
                    <th>所属品类</th>
                    <th>单价</th>
                    <th>库存</th>
                    <th>创建时间</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${provo}" var="p">
                    <tr class="id71">
                        <td><center>${p.proId}</center></td>
                        <td><center><img src="${p.proUrl}" height="50px"/></center></td>
                        <td><center>${p.proName}</center></td>
                        <td><center>${p.proDetail}</center></td>
                        <td><center>${p.categoryName}</center></td>
                        <td><center>￥${p.price}</center></td>
                        <td><center>${p.stock}</center></td>
                        <td><center>${p.createTime}</center></td>
                        <td><center>${p.updateTime}</center></td>
                        <td><center><a href="/manage/product/update.do?id=${p.proId}">修改</a></center></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>


            <div class="page">
                <ul class="pagination">
                    <li class="disabled">
                        <c:if test="${pages.hasPreviousPage}">
                            <a href="/manage/product/prolist.do?pageNum=${pages.pageNum-1}">&laquo;</a>
                        </c:if>
                    </li>
                    <c:forEach items="${pages.navigatepageNums}" var="p">
                        <li>
                            <c:if test="${pages.pageNum==p}">
                                <span>${p}</span>
                            </c:if>
                            <c:if test="${pages.pageNum!=p}">
                                <a href="/manage/product/prolist.do?pageNum=${p}">${p}</a>
                            </c:if>
                        </li>
                    </c:forEach>
                    <li class="disabled">
                        <c:if test="${pages.hasNextPage}">
                            <a href="/manage/product/prolist.do?pageNum=${pages.nextPage}">&raquo;</a>
                        </c:if>
                    </li>
                </ul>
            </div>


        </div>
    </div>
</div>

<script src="../static/admin/js/config.js"></script>
<script src="../static/admin/js/script.js"></script>
</body>
</html>
