<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>

<title>学生主页</title>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="row clearfix">
		<div class="col-md-6 col-md-push-3">
			<table class="table" style="margin: 20px 0 0 0">
				<tr>
					<td><strong>姓名：</strong></td>
					<td><p class="text-left" id="userName"></p></td>
					<td><strong>性别:</strong></td>
					<td><p class="text-left" id="userSex"></p></td>
				</tr>
				<tr>
					<td><strong>学号：</strong></td>
					<td><p class="text-left" id="userId"></p></td>
					<td><strong>电话：</strong></td>
					<td><p class="text-left" id="phoneNum"></p></td>
				</tr>
				<tr>
					<td><strong>学院：</strong></td>
					<td><p class="text-left" id="college"></p></td>
					<td><strong>邮箱：</strong></td>
					<td><p class="text-left" id="email"></p></td>
				</tr>
			</table>
			<div class="form-group" style="margin: 15px 0 0 0">
				<div class="col-sm-offset-2 col-sm-10">
					 <button class="btn btn-warning" style="margin:15px 0 15px 0" id="alterUserInfo">修改信息</button>
					 <button class="btn btn-default" style="margin: 15px 0 15px 80px" id="goBack">返回首页</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"./user/getUserInfo",
		type:"POST",
		datatype:"json",
		success:function(data){
			data=JSON.parse(data);
			if(data.code==1){
				$("p#userName").html(data.data.username);
				$("p#userSex").html(data.data.gender);
				$("p#userId").html(data.data.uid);
				$("p#phoneNum").html(data.data.phonenumber);
				$("p#college").html(data.data.academy);
				$("p#email").html(data.data.email);
				var image = document.getElementById("showUserHeadImg");
				image.src="http://localhost:8080/Train/headImg/"+data.data.headimgurl;
			}else{
				alert(data.msg)
			}
		}
	});
	$("#alterUserInfo").click(function(){
		window.location.href="alterUserInfo.jsp";
	});
	$("#goBack").click(function(){
		window.location.href="homepage.jsp";
	});
});
</script>
</body>
</html>
	                     
