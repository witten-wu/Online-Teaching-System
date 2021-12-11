<%@ page language="java"  import="com.Train.model.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
</head>
<body>
    <%String uid = null;%>
	<%User user =(User)session.getAttribute("user"); 
	if(user!=null){ 
		uid = Integer.toString(user.getUid());
	}
	else{
		uid = " ";
	}%>
	<div class="row clearfix header" id="header">
		<div class="col-md-8 column logo">
			<img alt="logo" src="${pageContext.request.contextPath}/image/logo.png"/>
		</div>
		<div class="col-md-4 column">
			<ul class="nav navbar-nav navbar-right">
			    <li><a id="showUserName" href="#"><span class="glyphicon glyphicon-user"></span><%=uid %></a></li>
			    <li><a id="logOut" href="#"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>
			</ul>
		</div>
	</div>
</body>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#logOut").click(function(){
		$.ajax({
			url:"./exit",
			type:"POST",
			datatype:"json",
			success:function(data){
				data=JSON.parse(data)
				if(data.code==1){
					window.location.href="homepage.jsp";
				}else if(data.code==0){
					alert(data.msg);
				}
			}
		});
	});
	$("#showUserName").click(function(){
		window.location.href="checkUserInfo.jsp";
	});
});
</script>
</html>