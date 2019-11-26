<%--
  Created by IntelliJ IDEA.
  User: GuXinYu
  Date: 2019/11/26
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改密码</title>
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
                <legend>修改密码</legend>
            </fieldset>
            <form class="layui-form " action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="psd1" name="password" lay-verify="required|password" placeholder=""  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">重复新密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="psd2"  value=""  lay-verify="required"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <div class="layui-btn" id="sub"  lay-submit lay-filter="submit">立即提交</div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script src="../static/admin/js/config.js"></script>
<script src="../static/admin/js/script.js"></script>
<script>
    layui.use('layer', function () {
        var $ = layui.jquery
        $("#psd2").blur(function () {
            var ps1 = $("#psd1").val()
            var ps2 = $("#psd2").val()
            if (ps1 != ps2){
                layer.msg("密码输入不一致")
            }
        })
        $("#sub").click(function () {
            var ps1 = $("#psd1").val()
            var ps2 = $("#psd2").val()
            if (ps1 != ps2 || ps1=="" || ps2 ==""){
                alert("密码输入不一致或为空")
            }else {
                layer.msg('<h2>修改成功</h2> <p id="">即将跳转登录页面  <a id="href" href="/manage/user/do_update_psd.do?password='+ps1+'">跳转</a> 等待时间： <b id="wait">3</b></p> ', {icon: 1,shade:0.5});
                !(function run(wait){
                    if(wait <= 0) {
                        location.href = "/manage/user/do_update_psd.do?password="+ps1+"";
                    }else{
                        wait--;
                        setTimeout(function(){
                            document.getElementById("wait").innerHTML = wait;
                            run(wait);
                        },1000);
                    }
                })(3);
            }
        })

    })

</script>
</body>
</html>
