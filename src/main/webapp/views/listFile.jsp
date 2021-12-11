<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 遍历Map集合 -->
     <c:forEach var="list" items="${list}">
         <c:url value="download" var="downurl">
             <c:param name="filename" value="${list}"></c:param>
         </c:url>
         ${list}<a href="${downurl}">下载</a>
         <br/>
    </c:forEach>
</body>
</html>