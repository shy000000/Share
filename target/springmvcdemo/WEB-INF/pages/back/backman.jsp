<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2016/3/17
  Time: 15:28
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

  <!-- Help Navigation -->
  <div id="help-nav">
    <a href="#">Dashboard</a> &gt; Current Article
  </div>
  <!-- End Help Navigation -->

  <div class="message thank-message">
    <p><strong>Congratulations your information has been submited!</strong></p>
  </div>

  <div class="message error-message">
    <p><strong>Error! The following fields were not entred correctly...</strong></p>
  </div>


  <h6 class="red">Header styles</h6>
  <h1>Header h1</h1>
  <h2>Header h2</h2>
  <h3>Header h3</h3>
  <h4>Header h4</h4>
  <h5>Header h5</h5>
  <h6>Header h6</h6>
  <br />
  <h6 class="red">Paragraph styles</h6>
  <p>Lorem ipsum dolor sit amet, <a href="#">consectetur adipiscing elit</a>. Aenean non aliquam felis. Sed justo justo, hendrerit vel fermentum nec, pellentesque non ligula. Nulla sodales dictum diam, vel tincidunt lorem commodo non. Vivamus ullamcorper tellus sit amet urna placerat ut egestas ante auctor. Sed arcu justo, iaculis eget pellentesque sit amet, viverra ut mauris. Aliquam erat volutpat. Nulla eget auctor turpis. Ut mi arcu, laoreet ac pretium vel, placerat non velit. Etiam rhoncus dui metus. Quisque ut dictum ante. Morbi pretium nibh sit amet dolor elementum vitae vehicula lacus dignissim.Curabitur non quam et eros lacinia euismod id a felis. </p>

  <p>Nam vestibulum ligula et enim dapibus vitae gravida diam molestie. In mauris ipsum, hendrerit vitae mattis et, aliquet at sem. Aliquam erat volutpat. Nullam suscipit ullamcorper est at placerat. In neque mi, eleifend ac sagittis eu, condimentum in tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam, diam id sagittis dictum, justo est volutpat ligula, sed posuere justo libero ac nisl. Phasellus sed varius arcu. Sed bibendum ante eget ligula euismod sed tempus enim ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam erat volutpat. </p>

  <br />
  <h6 class="red">Unordered List style</h6>
  <ul>
    <li>Sum dolor sit amet</li>
    <li>Consectetur adipiscing elit</li>
    <li>Aenean aliquam, diam id sagittisDictum</li>
    <li>Justo est Sed posuere justo libero</li>
    <li>Phasellus sed varius arcu</li>
  </ul>

  <br />
  <h6 class="red">Ordered List style</h6>
  <ol>
    <li>Sum dolor sit amet</li>
    <li>Consectetur adipiscing elit</li>
    <li>Aenean aliquam, diam id sagittisDictum</li>
    <li>Justo est Sed posuere justo libero</li>
    <li>Phasellus sed varius arcu</li>
  </ol>
</div>

<!-- End Content -->
</div>

<!-- Footer -->
<div id="footer">
  <p>&copy; Sitename.com. Collect from <a href="http://www.cssmoban.com/" title="网站模板" target="_blank">网站模板</a></p>
</div>
<!-- End Footer -->
</body>
</html>