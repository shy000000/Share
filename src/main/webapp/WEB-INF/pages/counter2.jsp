<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: shy
  Date: 2017/1/4
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Access-Control-Allow-Origin" content="*">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <title>计算器2</title>
</head>
<body>
<form:form method="post" action="/front/counter2">
  2 <input type="text" id="1" name="input" class="login-input"  required/>

  <input type="submit" value="计算">

</form:form>
${output}
</body>
</html>
