<%--
  Created by IntelliJ IDEA.
  User: GuXinYu
  Date: 2019/11/6
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台首页</title>
    <link rel="stylesheet" href="../static/common/layui/css/layui.css">
    <link rel="stylesheet" href="../static/admin/css/style.css">
    <script src="../static/common/layui/layui.js"></script>
    <script src="../static/common/jquery-3.3.1.min.js"></script>
    <script src="../static/common/vue.min.js"></script>
    <script src="../static/common/echarts.min.js"></script>
    <style>
        .right h2{
            margin: 10px 0;
        }
        .right li{
            margin-bottom: 10px;
        }
    </style>
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
                    <a href="javascript:;" :class="{active:vo.active}" @click="onActive(index)">
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
    <%--            <blockquote class="layui-elem-quote">--%>
    <%--                <h2>QAdmin 轻量级后台模板</h2>--%>
    <%--                <p>基于layui框架与Vue.js构建</p>--%>
    <%--                <p>轻量不复杂 简洁不简单</p>--%>
    <%--            </blockquote>--%>

            <div class="layui-row">
                <div class="layui-col-md4">
                    <div class="layui-card">
                        <div class="layui-card-header"><h2>注册人数统计</h2></div>
                        <div class="layui-card-body" style="height: 250px;" id="main" >

                        </div>
                    </div>
                </div>
                <div class="layui-col-md4">
                    <div class="layui-card">
                        <div class="layui-card-header"><h2>各商品销量</h2></div>
                        <div class="layui-card-body" style="height: 250px;" id="main2" >
<%--                           --%>
                        </div>
                    </div>
                </div>

                <div class="layui-col-md4">

                    <div class="layui-card">
                        <div class="layui-card-header"><h2>商品库存</h2></div>
                        <div class="layui-card-body" style="height: 250px;" id="main3">

                        </div>
                    </div>

                </div>
            </div>


            <div class="layui-row">
                <div class="layui-col-md9" style="padding-right: 20px">
                    <h2>最新会员</h2>

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
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="u">
                            <tr class="id36567">
                                <td>${u.id}</td>
                                <td>${u.phone}</td>
                                <td>${u.username}</td>
                                <td>${u.nickname}</td>
                                <td>${u.email}</td>
                                <td>${u.createDate}</td>
                                <td>${u.updateDate}</td>
                                <td>${u.loginNumber}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="layui-col-md3">
                    <h2>会员统计</h2>

                    <table class="layui-table layui-form">
                        <tr>
                            <th>今天登录</th>
                            <td>555</td>
                        </tr>
                        <tr>
                            <th>昨天登录</th>
                            <td>5552</td>
                        </tr>
                        <tr>
                            <th>会员总数</th>
                            <td>224555</td>
                        </tr>
                        <tr>
                            <th>月活跃数</th>
                            <td>55885</td>
                        </tr>
                        <tr>
                            <th>季活跃数</th>
                            <td>5485885</td>
                        </tr>
                        <tr>
                            <th>vip用户</th>
                            <td>65885</td>
                        </tr>
                        <tr>
                            <th>过期vip</th>
                            <td>525885</td>
                        </tr>

                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="../static/admin/js/config.js"></script>
<script src="../static/admin/js/script.js"></script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"/manage/user/countloginer.do",
            type:"get",
            // dataType:"json",
            // async:false,
            success:function (e) {
                var date = []
                var count = []
                $(e).each(function (index,element) {
                    date[index] = element.createDate
                    count[index] = element.countuser
                })
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '注册人数'
                    },
                    tooltip: {},
                    legend: {
                        data:['人数']
                    },
                    xAxis: {
                        data: date
                    },
                    yAxis: {},
                    series: [{
                        name: '人数',
                        type: 'bar',
                        data: count
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        })



        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));
       var option = {
            legend: {},
            tooltip: {},
            dataset: {
                dimensions: ['product', '2015', '2016', '2017'],
                source: [
                    {product: '手机', '2015': 43.3, '2016': 85.8, '2017': 93.7},
                    {product: '服装', '2015': 83.1, '2016': 73.4, '2017': 55.1},
                    {product: '家电', '2015': 86.4, '2016': 65.2, '2017': 82.5},
                    {product: '动漫', '2015': 72.4, '2016': 53.9, '2017': 39.1}
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {},
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: [
                {type: 'bar'},
                {type: 'bar'},
                {type: 'bar'}
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

        $.get(
            "/manage/product/toprolist.do",
            function (e){
                var proName = []
                var count = []
                $(e).each(function (index,element) {
                    proName[index] = element.name
                    count[index] = element.stock
                    console.log(proName[index])
                    console.log(count[index])
                })
                var proN = []
                for (var i = 0; i <5 ; i++) {
                    proN[i]=proName[i]
                }
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main3'));
                option = {
                    title : {
                        text: '各商品库存',
                        subtext: '纯属虚构',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data:proName
                            // ['手机','家电','服装','动漫','其他']
                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:335, name:'其他'},
                                {value:310, name:'动漫'},
                                {value:234, name:'服装'},
                                {value:135, name:'家电'},
                                {value:1548, name:'手机'}
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        )

    })

</script>
</body>
</html>

