<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加品类</title>
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
            <fieldset class="layui-elem-field layui-field-title">
                <legend>添加品类</legend>
            </fieldset>
            <form class="layui-form " action="/manage/product/doaddcategory.do" style="height: 800px">
                <div class="layui-form-item">
                    <label class="layui-form-label">品类名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <br>
                <div class="layui-form-item">
                    <label class="layui-form-label">类别状态</label>
                    <div class="layui-input-inline">
                        <select name="status" lay-verify="required">
                            <option value="1">正常</option>
                            <option value="0">废弃</option>
                        </select>
                    </div>
                </div>
                <br>

                <div class="layui-form-item">
                    <label class="layui-form-label">品类排序</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sortOrder" placeholder="数小靠前 " autocomplete="off" class="layui-input">
                    </div>
                </div>
                <br>
                <div class="layui-form-item">
                    <label class="layui-form-label">所属分类</label>
                    <div class="layui-input-inline">
                        <select name="parentId" lay-verify="required">
                            <option value="0">顶级分类</option>
                            <c:forEach items="${category}" var="c">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
<%--                <div class="layui-form-item">--%>
<%--                    <label class="layui-form-label">类别状态</label>--%>
<%--                    <div class="layui-input-block">--%>
<%--                        <input type="checkbox" value="0" name="status" lay-text="正常|废弃" checked lay-skin="switch">--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="submit" class="layui-btn" lay-submit lay-filter="submit" value="立即提交"/>

                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script src="../static/admin/js/config.js"></script>
<script src="../static/admin/js/script.js"></script>
</body>
</html>
