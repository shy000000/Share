<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/19
  Time: 11:37
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
  <div class="container">
    <h3>用户信息详情</h3>
    <div class="contact-form">
      <table class="table tavble-bordered table-striped">
        <tr>
          <th>用户</th>
          <td>${wantedman.id}</td>
        </tr>
        <tr>
          <th>用户名</th>
          <td>${wantedman.name}</td>
        </tr>
        <tr>
          <th>开户时间</th>
          <td>${wantedman.cometime}</td>
        </tr>
        <tr>
          <th>联系电话</th>
          <td>${wantedman.phone}</td>
        </tr>
        <tr>
          <th>地址</th>
          <td>${wantedman.address}</td>
        </tr>
        <tr>
          <th>服务截止日期</th>
          <td>${wantedman.deadline}</td>
        </tr>
        <tr>
          <th>广告文字</th>
          <td>${ad.word}</td>
        </tr>
        <tr>
          <th>广告图片1</th>
          <c:if test="${ad.picture1 =='无'}">
            <td>${ad.picture1}</td>
          </c:if>
          <c:if test="${ad.picture1 !='无'}">
            <td><img src="${ad.picture1}"></td>
          </c:if>
        </tr>
        <tr>
          <th>广告图片2</th>
          <c:if test="${ad.picture2 =='无'}">
            <td>${ad.picture2}</td>
          </c:if>
          <c:if test="${ad.picture2 !='无'}">
            <td><img src="${ad.picture2}"></td>
          </c:if>
        </tr>
        <tr>
          <th>轮播图片1</th>
          <c:if test="${ad.turn1 =='无'}">
            <td>${ad.turn1}</td>
          </c:if>
          <c:if test="${ad.turn1 !='无'}">
            <td><img src="${ad.turn1}"></td>
          </c:if>
        </tr>
        <tr>
          <th>轮播图片2</th>
          <c:if test="${ad.turn2 =='无'}">
            <td>${ad.turn2}</td>
          </c:if>
          <c:if test="${ad.turn2 !='无'}">
            <td><img src="${ad.turn2}"></td>
          </c:if>
        </tr>
      </table>
    </div>
  </div>
</div>

</body>
</html>
