<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/24
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=9" />
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <meta http-equiv="Access-Control-Allow-Origin" content="*">
  <title>
    百客汇-我的文章
  </title>
  <link href="../css/index.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery-1.11.2.min.js"></script>
  <script src="../js/iscroll.js"></script>
  <script src="../js/article.js"></script>
  <script>
  var uid = 106;

  </script>
</head>
<body>
<input id="classify_index" type="hidden" value="" />
<div class="loading-list">
  <div class="text">
    正在加载中，请稍候...
  </div>
</div>
<input type="hidden" name="cid" id="cid" value="783">
<section class="headBox">
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
  <menu class="menu">
    <ul class="clearfix">
      <li>
        <a href="javascript:;" data-index="1">
          娱乐
        </a>
      </li>
      <li>
        <a href="javascript:;" data-index="5">
          新闻
        </a>
      </li>
      <li>
        <a href="javascript:;" data-index="6">
          资讯
        </a>
      </li>
      <li>
        <a href="javascript:;" data-index="7">
          搞笑
        </a>
      </li>
    </ul>
  </menu>
</section>
<div id="contentWrap">
  <div id="scroller">
    <div class="listDiv">

    </div>
    <div id="pullUp">
      <p class="pullUpLabel">
        ↑上拉加载更多...
      </p>
    </div>
  </div>
</div>
</body>
</html>
