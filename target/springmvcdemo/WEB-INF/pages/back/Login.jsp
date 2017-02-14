<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/12
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>欢迎登录百客汇后台管理系统</title>
  <link href="../../css/login.css" rel="stylesheet" type="text/css" />


</head>

<body>
<div class="main-login">

  <div class="login-content">

      <h2>百客汇-后台管理</h2>

    <h2>用户登录</h2>

    <form:form action="/back/loggedin" method="post" id="login-form" name="login-form">
      <div class="login-info">
        <span class="user">&nbsp;</span>
        <input name="username" id="username" type="text"  value="" class="login-input"/>
      </div>
      <div class="login-info">
        <span class="pwd">&nbsp;</span>
        <input name="password" id="password" type="password"  value="" class="login-input"/>
      </div>
      <div class="login-oper">
        <input style="margin:1px 10px 0px 2px; float:left;" name="" type="checkbox" value="" checked="checked" /><span>记住密码</span>
      </div>
      <div class="login-oper">
        <input name="" type="submit" value="登 录" class="login-btn"/>
        <input name="" type="submit" value="重 置" class="login-reset"/>
      </div>
    </form:form>
    <c:if test="${semaphore == 0}">
      <p class="bg-warning">
        <br/>
        <h2>用户名或密码错误</h2>
        <br/>
        <br/>
      </p>
    </c:if>
  </div>

</div>

</body>
</html>
