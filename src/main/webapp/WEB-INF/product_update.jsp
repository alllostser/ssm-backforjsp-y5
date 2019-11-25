<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加商品</title>
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
                    <a v-text="vo.name" :href="vo.url"></a> <span>/</span>
                </li>
            </ul>
        </div>
    </header>

    <div class="main" id="app">
        <!--左栏-->
        <div class="left">
            <ul class="cl">
                <!--顶级分类-->
                <li v-for="vo,index in menu" :class="{hidden:vo.hidden}">
                    <a href="javascript:;" :class="{active:vo.active}" @click="onActive(index)">
                        <i class="layui-icon" v-html="vo.icon"></i>
                        <span v-text="vo.name"></span>
                        <i class="layui-icon arrow" v-show="vo.url.length==0">&#xe61a;</i> <i v-show="vo.active"
                                                                                              class="layui-icon active">&#xe623;</i>
                    </a>
                    <!--子级分类-->
                    <div v-for="vo2,index2 in vo.list">
                        <a href="javascript:;" :class="{active:vo2.active}" @click="onActive(index,index2)"
                           v-text="vo2.name"></a>
                        <i v-show="vo2.active" class="layui-icon active">&#xe623;</i>
                    </div>
                </li>
            </ul>
        </div>
        <!--右侧-->
        <div class="right">

            <fieldset class="layui-elem-field layui-field-title">
                <legend>添加商品</legend>
            </fieldset>



            <form class="layui-form " action="/manage/product/update_product.do">
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <input type="text" name="id" value="${prod.id}" lay-verify="required" readonly placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-block">
                        <img class="pic_url" src="http://127.0.0.1:8080/manage/static/img/${prod.mainImage}" height="200px"/>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">缩略图</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mainImage" id="pic_url" value="${prod.mainImage}" placeholder="不上传就留空" autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-word-aux">
                        <button type="button" class="layui-btn" id="pic">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" value="${prod.name}" lay-verify="required"placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">详情</label>
                    <div class="layui-input-inline">
                        <input type="text" name="detail" value="${prod.detail}" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">商品详细描述</div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">分类</label>
                    <div class="layui-input-inline" style="width: 200px">
                        <select name="categoryId">
                            <c:forEach items="${cag}" var="c">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-inline">
                        <input type="text" name="price" value="${prod.price}" lay-verify="required|number" placeholder="输入正数" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">库存</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stock" value="${prod.stock}" lay-verify="required|number" placeholder="输入0以上的数" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-mid" >
                    <label class="layui-form-label">验证码</label>
                    <div class="layui-input-inline">
                        <input type="text" id="sr" style="width: 90px"  lay-verify="required" placeholder="输入验证码" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form"><img src="/manage/product/code.do" id="yzm" style="height: 35px" alt=""><span class="layui-container" ><a id="bar">看不清，换一张</a></span></label>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="submit"  class="layui-btn" id="test9" lay-submit lay-filter="submit" value="立即提交"/>

                    </div>
                </div>
            </form>


        </div>
    </div>
</div>
<script src="../static/admin/js/config.js"></script>
<script src="../static/admin/js/script.js"></script>
<script>
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;
        //普通图片上传
        upload.render({
            elem: '#pic' //绑定元素
            , url: "/manage/product/uploadHeadImage" //上传接口
            , done: function (res) {
                //上传完毕回调
                var str = res.src.substr(res.src.lastIndexOf("/")+1);
                if (res.code == 0) {
                    $("#pic_url").val(str);
                    $(".pic_url").attr("src", res.src);
                } else {
                    layer.msg(res.msg, function () {
                    })
                }
            }, error: function () {
                layer.msg("上传异常");
            }
        });
        var src = $("#yzm").attr("src")
        $("#bar").click(function () {
            var date = new Date();
            $("#yzm").attr("src",src+"?date="+date.getTime())
        })
        $("#sr").blur(function () {
            $("#ss").empty();
            var code = $("#sr").val()
            $.post(
                "/manage/product/codeCheck.do",
                {"code":code},
                function (e) {
                    if (e!=1){
                        layer.msg("验证码有误！");
                        var date = new Date();
                        $("#yzm").attr("src",src+"?date="+date.getTime())
                        $("#sr").val("")
                    }else {
                        layer.msg("验证码正确！");
                    }
                }
            )
        })
    });


</script>
</body>
</html>
