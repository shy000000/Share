<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/17
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
  <title>欢迎来到百客汇后台管理系统</title>
  <link rel="stylesheet" href="../../css/style.css" type="text/css" media="all" />
</head>
<body>
<!-- Header -->
<%@ include file="header.jsp"%>
<!-- End Header -->

<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>

<!-- Content -->
<div id="content" class="shell">

  <!-- End Help Navigation -->
  <div class="login-content">
    <form:form action="/back/addAdminPost" method="post" commandName="user" role="form">
    <div class="login-info">
      <h1 class="red">用户名</h1>
      <input type="text" id="username" name="username" class="login-input"  required/>
    </div>
    <div class="login-info">
      <h1 class="red">口令</h1>
      <input type="password" id="password" name="password" class="login-input"  required/>
    </div>
    <div class="login-oper">
      <input type="submit" value="添加" class="login-btn"/>
    </div>
  </div>
  <div class="clearfix"></div>

  </form:form>

  <c:if test="${hasname == 0}">
    <div class="message thank-message">
      <p><strong>添加成功!</strong></p>
    </div>
  </c:if>

  <c:if test="${hasname == 1}">
    <div class="message error-message">
      <p><strong>该用户名已存在!</strong></p>
    </div>
  </c:if>

  <!-- End Content -->
</div>


<!-- End Footer -->
</body>
</html>
