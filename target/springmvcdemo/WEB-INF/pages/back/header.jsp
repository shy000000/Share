<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/17
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="header">
  <div class="shell">

    <div id="head">
      <h1><a href="#">百客汇后台管理系统</a></h1>
      <div class="right">
        <p>
          欢迎 <a href="#"><strong>${username}</strong></a> |
          <a href="#">帮助</a> |
          <a href="/back/loggedout">注销</a>
        </p>
      </div>
    </div>

    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="/back/allUser"><span>用户信息</span></a></li>
        <li><a href="#"><span>用户缴费</span></a></li>
        <li><a href="/back/addUser"><span>新增用户</span></a></li>
        <li><a href="/back/outUser"><span>注销用户</span></a></li>
        <c:if test="${semaphore == 3}">
          <li><a href="/back/allAdmin"><span>管理员信息</span></a></li>
          <li><a href="/back/addAdmin"><span>新增管理员</span></a></li>
        </c:if>

      </ul>
    </div>
    <!-- End Navigation -->
    <tr>

    </tr>
    <tr>

    </tr>
  </div>
</div>