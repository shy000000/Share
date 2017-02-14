<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/17
  Time: 18:49
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

<script type="text/javascript">

  function pidImport() {
    var url = "/back/addUserPost?";
    var inputList = document.getElementsByTagName("input");
    var id = document.upload.name.value;
    url += "id=" + id;
    var name = document.upload.phone.value;
    var gender = document.upload.address.value;
    var high = document.upload.day.value;
    var weight = document.upload.word.value;
    url += "&phone="+name+"&address="+gender+"&day="+high+"&word="+weight;
    document.all.upload.action = url;
    document.all.upload.submit();

  }
</script>
<div id="content" class="shell">
  <form:form action="/back/addUserPost" method="post" role="form" enctype="multipart/form-data">
    <h1 class="red">用户名称</h1>
    <input type="text" id="name" name="name" class="login-input"  required/>
    <h1 class="red">用户电话</h1>
    <input type="text" id="phone" name="phone" required/>
    <h1 class="red">用户地址</h1>
    <input type="text" id="address" name="address" required/>
    <h1 class="red">服务天数</h1>
    <input type="text" id="day" name="day" required/>
    <h1 class="red">广告文字</h1>
    <textarea rows="5" cols="100" id="word" name="word"></textarea>
    <h1 class="red">广告图片1</h1>
    <input type="file"  name="picture1" >
    <h1 class="red">广告图片2</h1>
    <input type="file"  name="picture1" >
    <h1 class="red">轮播图片1</h1>
    <input type="file"  name="picture1" >
    <h1 class="red">轮播图片2</h1>
    <input type="file" name="picture1" >
    <div class="login-oper">
      <input type="submit" value="添加" onclick="pidImport();" class="login-btn"/>
    </div>

  </form:form>

</div>
<c:if test="${haveuser == 0}">
  <div class="message thank-message">
    <p><strong>添加成功!</strong></p>
  </div>
</c:if>
<c:if test="${haveuser == 1}">
  <div class="message error-message">
    <p><strong>该用户名已存在!</strong></p>
  </div>
</c:if>
</body>
</html>
