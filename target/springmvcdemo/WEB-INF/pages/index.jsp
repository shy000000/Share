<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/12
  Time: 15:22
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
  <title>百客汇 互联网广告分享平台</title>
  <link href="../css/index.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery-1.11.2.min.js"></script>
  <script src="../js/prefixfree.min.js"></script>
  <script src="../js/jquery.imgpreload.min.js"></script>

  <style type="text/css">
    html,
    body
    { height:100%; width:100%; overflow:hidden; }
    body{background:url(../images/56e921eaeb060.jpg) no-repeat;     background-size: 100% 100% !important;}
  </style>
</head>
<body >
<section class="wrapper">
  <h1 class="index-logo" align="center">
    <font color="#ffd700">
      <%--<img class="img" src="/tpl/simplebootx/Portal/images/index-logo.png" title="美文分享" />--%>
      <p>
        <strong>
          百客汇
        </strong>
      </p>
      <p><font size="2px">互联网广告分享平台</font> </p>
        <p><font size="2px">当前用户：${username}</font> </p>
    </font>
  </h1>


  <form:form id="form1" class="submit-form clearfix" action="/front/share" method="get">
    <input class="textbox" type="text" id="url" name="url" placeholder="原文链接" />
    <input class="submit" type="button" value="分享" onclick="goform()"/>
    <input type="hidden" name="uid" id="uid" value="${uid}">
  </form:form>


  <nav class="footer-nav clearfix">
    <a href="/front/allessay?uid=${uid}">
      <img class="img" src="../images/index-nav1.png" />
      <p>美文广场</p>
    </a>
    <a href="/front/myessay?uid=${uid}">
      <img class="img" src="../images/index-nav2.png" />
      <p>我的文章</p>
    </a>
    <a href="/front/my?uid=${uid}">
      <img class="img" src="../images/index-nav3.png" />
      <p>我的</p>
    </a>
  </nav>
</section>
<div class="loading-load">
  <div class="loading">

  </div>
</div>
<script type="text/javascript">
  //判断是否旋转手机
  var h = $(window).height();
  function orient() {
    if (window.orientation == 0 || window.orientation == 180) {
      $("body").removeClass('landscape').addClass('portrait');
      $("html,body").css("height","100%");
      $(".footer-nav").css({
        position:"absolute",
        marginTop:"0"
      });
      $(".index-logo").css("margin-top","30%");
      orientation = 'portrait';
      return false;
    } else if (window.orientation == 90 || window.orientation == -90) {
      //横屏状态
      $("body").removeClass('portrait').addClass('landscape');
      $("html,body").css("height","auto");
      $(".index-logo").css("margin-top","5%");

      //横屏判断body的高度是否小于window的高度
      if( $(".landscape").height() < h ) {
        $("html,body").css("height","100%");
        $(".footer-nav").css({
          position:"absolute",
          marginTop:"0"
        });
      } else {
        $("html,body").css("height","auto");
        $(".footer-nav").css({
          position:"static",
          marginTop:"5%"
        });
      }

      orientation = 'landscape';
      return false;
    }
  }
  orient(); //判断手机旋转
  $(window).bind( 'orientationchange', function(e){
    orient();
  });

  $(function(){
    $('.textbox').focus();

    //预加载图片
    var imgUrlArr = [
      '../images/index-bg.jpg',
      '/tpl/simplebootx/Portal/images/index-logo.png',
      '../images/index-nav1.png',
      '../images/index-nav2.png',
      '../images/index-nav3.png'
    ];

    $.imgpreload(imgUrlArr,{
      all: function () {
        /*this will be called after all images loaded*/
        $(".loading-load").fadeOut();
        $(".wrapper").show().addClass('loadedWrapper');
      }
    });
  });
</script>
<script type="text/javascript">
  function goform() {

    var url = document.getElementById("url").value;
    if (url=='') {
      alert("请输入原文链接！");
      return;
    }
    document.getElementById("form1").submit();
  }

</script> </body> </html>