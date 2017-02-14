<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/13
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>

  <meta name="viewport"content="width=device-width, initial-scale=1">

</header>
<script>
  document.write(${page}
</script>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Access-Control-Allow-Origin" content="*">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <title>

  </title>
  <script src="../js/jquery-1.11.2.min.js"></script>
  <style type="text/css">
  html { width:96%; margin: 0; padding: 0 2%; }

  .top_ad  img{ width: 100%; max-height: 100px; margin: 0; }

  .bot_ad { position: fixed; width: 100%; bottom: 0; left: 0; }
  .bot_ad .bot_ad_img { width: 100%;  margin: 0; max-height: 100px; }
  .bot_ad .bot_ad_tel { position: absolute; right: 5%; top: -20px; width: 15%; }

  .QR_Code { text-align: center; width: 100%; }
  .QR_Code img { width: 80%; margin: 20px 10% 0 10%; }

  #bot_ad_welcome { height: 100px; padding: 10px; background: #858585;color: #fff; margin-top: 20px; }
  #bot_ad_welcome img { float:left; width: 60px; height: 60px; border-radius:50%; margin: 10px 10px; }
</style>
  <style id="appendcss" type="text/css"></style>
<body>
  <h1 style="text-align:center;display:none" ></h1>
    <div style="width:100%;">
      <img src="" style="width: 100%;  margin: 0; max-height: 100px;">
    </div> <div id="content"></div>
  <div class="QR_Code">
    <img src="../images/${username}/picture1.jpg">
    <img src="../images/${username}/picture2.jpg">
    <p>
      ${ad.word}
    </p>
    <img src="../images/erweima.jpg">
  </div>
  <div class="bot_ad">
    <a href="tel:23929999">
      <img class="bot_ad_tel" src="../images/tel.gif" />
    </a>
    <a id="common_ad" href="http://www.weidianpu.net.cn/weiweb/197/index.html">
      <img class="bot_ad_img" src="../images/${username}/turn1.jpg">
    </a>
  </div>
  <div id="bot_ad_welcome" style="visibility: hidden;">
    <img src="../images/logo.png" />
    <div>
      <p>
        ${username}欢迎您！
      </p>
      <p>长按二维码加我好友</p>
    </div>
  </div>
  <script type="text/javascript">
  // 是否正在执行轮播动画
  var isAnimating = false;
  var curr_slider_page = 1;
  var images = "../images/${username}/turn1.jpg|../images/${username}/turn2.jpg";

  var imagesArr = images.split("|");
  var adObj = document.getElementById("common_ad");
  if (imagesArr.length > 1) {
    var html = "";
    for (var i = 0; i < imagesArr.length; i++) {
      var style = "display: block;";
      if (i == 0) style = "display: none;";
      html += "<img id='ad_" + (i+1) + "' class='bot_ad_img' style='" + style + "' src='" + imagesArr[i] + "' />";
    }
    adObj.innerHTML = html;
    setTimeout(function() {
      autoSlider();
    }, 3000);
  }

  //判断是否旋转手机
  var h = $(window).height();
  function orient() {
    if (window.orientation == 0 || window.orientation == 180) {
      $("body").removeClass('landscape').addClass('portrait');
      $("html,body").css("height","100%");
      orientation = 'portrait';
      return false;
    } else if (window.orientation == 90 || window.orientation == -90) {
      //横屏状态
      $("body").removeClass('portrait').addClass('landscape');
      $("html,body").css("height","auto");

      //横屏判断body的高度是否小于window的高度
      if( $(".landscape").height() < h ) {
        $("html,body").css("height","100%");
      } else {
        $("html,body").css("height","auto");
      }
      orientation = 'landscape';
      return false;
    }
  }
  orient(); //判断手机旋转
  $(window).bind( 'orientationchange', function(e){
    orient();
  });

  $(window).scroll(function() {
    var scrollTop = $(this).scrollTop();
    var scrollHeight = $(document).height();
    var windowHeight = $(this).height();
    if (scrollTop + windowHeight == scrollHeight) {
      $('.bot_ad').hide();
      $('#bot_ad_welcome').css('visibility', 'visible');
    } else {
      $('.bot_ad').show();
      $('#bot_ad_welcome').css('visibility', 'hidden');
    }
  });

  // 动态控制广告高度
  var winWidth = $(window).width();
  $("#appendcss").html = ".bot_ad .bot_ad_img { height: " + winWidth*0.3 + "px; }";

  // 轮播
  function autoSlider() {
    isAnimating = true;
    var next_slider_page = 1;
    if (curr_slider_page != imagesArr.length) {
      next_slider_page = curr_slider_page + 1;
    }
    setTimeout(function() {
      isAnimating = false;
      $('#ad_' + curr_slider_page).css("display", "none");
      $('#ad_' + next_slider_page).css("display", "block");
      curr_slider_page = next_slider_page;
      autoSlider();
    }, 3000);
  }
</script>
</body>
</html>