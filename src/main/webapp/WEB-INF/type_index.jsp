<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>品类管理</title>
    <link rel="stylesheet" href="../static/common/layui/css/layui.css">
    <link rel="stylesheet" href="../static/admin/css/style.css">
    <script src="../static/common/jquery-3.3.1.min.js"></script>
    <script src="../static/common/layui/layui.js"></script>
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

    <div class="main">
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
            <a href="/manage/product/addcategory.do" class="layui-btn"><i class="layui-icon">&#xe654;</i>添加栏目</a>
            <table class="layui-table layui-form" >
                <colgroup>
<%--                    <col width="80">--%>
<%--                    <col width="80">--%>
<%--                    <col width="150">--%>
<%--                    <col width="80">--%>
<%--                    <col width="80">--%>
<%--                    <col width="80">--%>
<%--                    <col>--%>
<%--                    <col width="150">--%>
                </colgroup>
                <thead >
                <tr>
                    <th>ID</th>
                    <th>类别名称</th>
                    <th>所属品类</th>
                    <th>类别状态</th>
                    <th>排序</th>
                    <th>创建时间</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${category.list}" var="c">
                    <tr class="id9">
                        <td>${c.id}</td>
                        <td>${c.name}</td>
                        <td>${c.parentId}</td>
                        <td><c:if test="${c.status==true}">正常</c:if><c:if test="${c.status==false}">废弃</c:if></td>
                        <td>${c.sortOrder}</td>
                        <td>${c.createTime}</td>
                        <td>${c.updateTime}</td>
                        <td><center><a href="/manage/product/to_update.do?id=${c.id}">修改</a></center></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page">
                <ul class="pagination">
                    <li class="disabled">
                        <c:if test="${category.hasPreviousPage}">
                            <a href="/manage/product/getcategorylist.do?pageNum=${category.pageNum-1}">&laquo;</a>
                        </c:if>
                    </li>
                    <c:forEach items="${category.navigatepageNums}" var="p">
                        <li>
                            <c:if test="${category.pageNum==p}">
                                <span>${p}</span>
                            </c:if>
                            <c:if test="${category.pageNum!=p}">
                                <a href="/manage/product/getcategorylist.do?pageNum=${p}">${p}</a>
                            </c:if>
                        </li>
                    </c:forEach>
                    <li class="disabled">
                        <c:if test="${category.hasNextPage}">
                            <a href="/manage/product/getcategorylist.do?pageNum=${category.nextPage}">&raquo;</a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    // layui.use('form', function () {
    //     var form = layui.form, layer = layui.layer, $ = layui.jquery;
    //
    //     form.on('switch(state)', function(data) {
    //         var id = $(data.elem).attr("data-id");
    //         $.ajax({
    //             url: "/admin/category/state/type/state.html",
    //             data: {
    //                 id: id,
    //             },
    //             type: "get",
    //             dataType: "json",
    //             success: function(e) {
    //                 if (e.code== 1) {
    //                     layer.msg(e.msg, {
    //                         icon: 1
    //                     });
    //                 } else {
    //                     layer.msg(e.msg, {
    //                         icon: 2,
    //                         shade: 0.5,
    //                         time: 2000,
    //                         shadeClose: true
    //                     });
    //                 }
    //             }
    //         });
    //     });
    //
    // });
</script>
<script src="../static/admin/js/config.js"></script>
<script src="../static/admin/js/script.js"></script>
</body>
</html>

