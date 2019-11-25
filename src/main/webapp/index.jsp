<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<meta charset="utf-8">
<body>
<%--${pageContext.request.contextPath}--%>
<%--<form action="/manage/user/islogin.do" method="post">--%>
<%--    用户名：<input type="text" name="username"><br>--%>
<%--    <br>--%>
<%--    密码：<input type="password" name="psd"><br><br>--%>
<%--    <input type="submit" value="登录">--%>
<%--    <a href="Register.jsp">注册</a>--%>
<%--    <span style="font-size:18px;">3秒后跳回登录页面...</span><span style="font-size:24px;"><meta http-equiv="refresh" content="3;/manage/user/islogin.do"> </span>--%>
<%--</form>--%>
</body>
<script src="manage/static/common/jquery-3.3.1.min.js"></script>
<script>
    $(function () {
        window.location.href="/manage/user/islogin.do"
    })
</script>
</html>
