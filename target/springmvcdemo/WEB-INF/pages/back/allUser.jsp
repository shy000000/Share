<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/19
  Time: 10:57
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
<link href="../../css/bootstrap.css" rel='stylesheet' type='text/css'/>
<!-- Content -->
<div id="content" class="shell">
  <div class="contact-form">
    <c:if test="${users == '0'}">
      <p class="bg-warning">
        <br/>
        没有用户= =!
        <br/>
        <br/>
      </p>
    </c:if>
    <c:if test="${!empty users && users != '0'}">
      <table class="table tavble-bordered table-striped">
        <table class="table tavble-bordered table-striped">
          <tr>
            <th>用户id</th>
            <th>用户名</th>
            <th>用户状态</th>
            <th>联系电话</th>
            <th>操作</th>
          </tr>
          <c:forEach items="${users}" var="wanted">
            <tr>
              <td>${wanted.id}</td>
              <td>${wanted.name}</td>
              <td>${wanted.state}</td>
              <td>${wanted.phone}</td>
              <td>
                <a href="/back/updateUser?userid=${wanted.id}&pageNow=${page.pageNow}" type="button" class="btn btn-sm btn-default">修改</a>
                <a href="/back/detailUser?userid=${wanted.id}&pageNow=${page.pageNow}" type="button" class="btn btn-sm btn-default">详细</a>
                <%--<a href="javascript:if(confirm('确认注销吗，将会停止对该用户的服务?'))window.location='/back/outUserGet?userid=${wanted.id}&pageNow=${page.pageNow}'" type="button" class="btn btn-sm btn-default">注销</a>--%>
              </td>
            </tr>
          </c:forEach>
        </table>
        <!-- 分页功能 start -->
        <div align="center">
          <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
          ${page.pageNow} 页</font> <a href="/back/allUser?pageNow=1">首页</a>
          <c:choose>
            <c:when test="${page.pageNow - 1 > 0}">
              <a href="/back/allUser?pageNow=${page.pageNow - 1}">上一页</a>
            </c:when>
            <c:when test="${page.pageNow - 1 <= 0}">
              <a href="/back/allUser?pageNow=1">上一页</a>
            </c:when>
          </c:choose>
          <c:choose>
            <c:when test="${page.totalPageCount==0}">
              <a href="/back/allUser?pageNow=${page.pageNow}">下一页</a>
            </c:when>
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">
              <a href="/back/allUser?pageNow=${page.pageNow + 1}">下一页</a>
            </c:when>
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
              <a href="/back/allUser?pageNow=${page.totalPageCount}">下一页</a>
            </c:when>
          </c:choose>
          <c:choose>
            <c:when test="${page.totalPageCount==0}">
              <a href="/back/allUser?pageNow=${page.pageNow}">尾页</a>
            </c:when>
            <c:otherwise>
              <a href="/back/allUser?pageNow=${page.totalPageCount}">尾页</a>
            </c:otherwise>
          </c:choose>
        </div>
        <!-- 分页功能 End -->
    </c:if>
  </div>

</div>

</body>
</html>
