<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'hello.jsp' starting page</title> 
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<h3>成功。</h3>
    	<hr/>
    	<!-- <a href="javascript:history.go(-1);">向上一页</a> -->
 
 	<input type="button" name="returngo" value="返回上一页"   
    onclick="javascript:window.history.go(-1)" >  
    
    <!-- 	<h1>通过servlet程序下载文件</h1>
	<form action="/springmvc_demo_02/down">
	
	<input type="submit" name="filePath" value="d:/aaaaa.doc">
	<input type="submit" value="下载"> -->

  </body>
  <script>
  </script>
</html>
