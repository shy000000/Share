<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/17
  Time: 17:20
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

<link href="../../css/bootstrap.css" rel='stylesheet' type='text/css'/>
<!-- End Header -->

<div class="shell">
  <div class="contact-form">
    <c:if test="${admins == '0'}">
      <p class="bg-warning">
        <br/>
        只有你一个用户
        <br/>
        <br/>
      </p>
    </c:if>
    <c:if test="${!empty admins && admins != '0'}">
    <table class="table tavble-bordered table-striped">
      <table class="table tavble-bordered table-striped">
        <tr>
          <th>用户id</th>
          <th>用户名</th>
          <th>密码</th>
          <th>操作</th>
        </tr>
        <c:forEach items="${admins}" var="wanted">
          <tr>
            <td>${wanted.id}</td>
            <td>${wanted.username}</td>
            <td>${wanted.password}</td>
            <td>
              <%--<a href="/back/updateAdmin?userid=${wanted.id}&pageNow=${page.pageNow}" type="button" class="btn btn-sm btn-default">修改</a>--%>
              <a href="javascript:if(confirm('确认删除吗?'))window.location='/back/deleteAdmin?userid=${wanted.id}&pageNow=${page.pageNow}'" type="button" class="btn btn-sm btn-default">删除</a>
            </td>
          </tr>
        </c:forEach>
      </table>
      <!-- 分页功能 start -->
      <div align="center">
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
          ${page.pageNow} 页</font> <a href="/back/allAdmin?pageNow=1">首页</a>
        <c:choose>
          <c:when test="${page.pageNow - 1 > 0}">
            <a href="/back/allAdmin?pageNow=${page.pageNow - 1}">上一页</a>
          </c:when>
          <c:when test="${page.pageNow - 1 <= 0}">
            <a href="/back/allAdmin?pageNow=1">上一页</a>
          </c:when>
        </c:choose>
        <c:choose>
          <c:when test="${page.totalPageCount==0}">
            <a href="/back/allAdmin?pageNow=${page.pageNow}">下一页</a>
          </c:when>
          <c:when test="${page.pageNow + 1 < page.totalPageCount}">
            <a href="/back/allAdmin?pageNow=${page.pageNow + 1}">下一页</a>
          </c:when>
          <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
            <a href="/back/allAdmin?pageNow=${page.totalPageCount}">下一页</a>
          </c:when>
        </c:choose>
        <c:choose>
          <c:when test="${page.totalPageCount==0}">
            <a href="/back/allAdmin?pageNow=${page.pageNow}">尾页</a>
          </c:when>
          <c:otherwise>
            <a href="/back/allAdmin?pageNow=${page.totalPageCount}">尾页</a>
          </c:otherwise>
        </c:choose>
      </div>
      <!-- 分页功能 End -->
      </c:if>
  </div>

</div>

</body>
</html>
