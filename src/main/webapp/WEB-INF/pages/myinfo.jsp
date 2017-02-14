<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/17
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Access-Control-Allow-Origin" content="*">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <title>百客汇-客户信息</title>
  <link href="../css/index.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery-1.11.2.min.js"></script>
  <style type="text/css">
    html,body { width:100%; height:100%; overflow:hidden; position:relative; }
body { background:url(/tpl/simplebootx/Portal/images/staffBg.jpg) no-repeat; background-size:100% 100%; }

@media screen and (min-height:600px) {
  .companyList img { width:100px; height:100px; }
}
@media screen and (min-height:500px) and (max-height:600px) {
  .companyList img { width:80px; height:80px; }
}
@media screen and (min-height:360px) and (max-height:480px) {
  .companyList img { width:60px; height:60px; }
}
@media screen and (min-height:300px) and (max-height:380px) {
  body { background-size:100% 110%; }
  .companyList img { width:50px; height:50px; margin-bottom:5px; }
  .companyName { font-size:16px; }
  .companyList figure { padding:0; }
  .companyList figcaption { font-size:14px; }
}
</style> </head>
<body style="background:url(../images/56e921eaeb060.jpg) no-repeat; background-size:100% 100%;">
<header class="header">
  <h3 style="width:100%;text-align:center; color:#ffffff;" >
    <span>百客汇</span>
  </h3>
  <a class="returnMove" href="javascript:history.go(-1);">
    <img class="img" src="../images/return.gif" title="返回上一步" />
  </a>
  <a class="goHome" href="/?id=${uid}">
    首页
  </a>
</header>
<div class="submitDiv">
  <form:form id="form1" class="submit-form clearfix" action="/front/share" method="get">
    <input class="textbox" type="text" id="url" name="long" placeholder="原文链接" />
    <input class="submit" type="button" value="分享" onclick="goform()"/>
    <input type="hidden" name="uid" id="uid" value="${uid}">
  </form:form>
</div>
<div class="staffCon">
  <div class="staffDiv">
    <div class="companyDiv">
      <h3 class="companyName">
        ${username}
        <p>
          服务截止日期：${deadline}
        </p>
      </h3>
      <div class="clearfix companyList">
        <figure><img src="../images/send.png" />
          <figcaption class="fz16">
            文章总数
            <span class="num" style="color:#000000;">
              ${essaycount}篇
            </span>
          </figcaption>
        </figure>
        <figure>
          <img src="../images/browse.png" />
          <figcaption class="fz16">
            广告展示总数
            <span class="num" style="color:#000000;">
              ${lookcount}次
            </span>
          </figcaption>
        </figure>
      </div>
    </div>
  </div>
</div>
<div class="userGrade">
  <h2 style="text-align:center;">

  </h2>
</div>
</body>
<script type="text/javascript">	function goform() {

  var url = document.getElementById("url").value;
  if (url=='') {
    alert("请输入原文链接！");
    return;
  }
  document.getElementById("form1").submit();
}

</script>
</html>
