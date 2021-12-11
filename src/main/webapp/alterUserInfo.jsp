<%@ page language="java" import="com.Train.model.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<title>学生主页</title>
</head>
<body>
 <%Integer uid = null;%>
	<%User user =(User)session.getAttribute("user"); if(user!=null){ uid = user.getUid();};%>
<div class="container">
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="row clearfix">
		<div class="col-md-3 col-md-push-3">
			<div class="input-group" style="margin: 85px 0 0 0">
				<span class="input-group-addon">姓名</span>
				<input type="text" class="form-control" placeholder="name" id="alterUserName"/>
			</div>
		 	<div class="input-group" style="margin: 15px 0 0 0 ">
				<span class="input-group-addon">学号</span>
				<input type="text" class="form-control" placeholder=<%=uid %> id="alterUserAddress" disabled/>
			</div>
			<div class="input-group" style="margin: 15px 0 0 0 ">
				<span class="input-group-addon">学院</span>
				<input type="text" class="form-control" placeholder="college" id="alterUserCollege"/>
			</div>
		</div>
		<div class="col-md-3 col-md-push-3">
			<div class="radio-group" style="margin: 92px 0 0 0">
				<span><h4>性别 </span>
				<input type="radio" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:5px" name="optionsRadios" id="optionsRadios1" value="男" checked>男
				<input type="radio" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:5px" name="optionsRadios" id="optionsRadios2" value="女">女
			</div>
		 	<div class="input-group" style="margin: 23px 0 0 0 ">
				<span class="input-group-addon">电话</span>
				<input type="text" class="form-control" placeholder="phone" id="alterUserPhone"/>
			</div>
			<div class="input-group" style="margin: 15px 0 0 0 ">
				<span class="input-group-addon">邮箱</span>
				<input type="text" class="form-control" placeholder="email" id="alterUserEmail"/>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-6 col-md-push-3">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					 <button class="btn btn-warning" style="margin:15px 0 15px 60px" id="sureAlter">确认修改</button>
					 <button class="btn btn-danger" style="margin: 15px 0 15px 50px" id="cancel">取消</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#sureAlter").click(function(){
		var username=$("#alterUserName").val();
		var gender=$('input[name="optionsRadios"]:checked').val();
		var phonenumber=$("#alterUserPhone").val();
		var academy =$("#alterUserCollege").val();
		var email=$("#alterUserEmail").val();
		var jsonData = new FormData();
		jsonData.append("username",username);
		jsonData.append("gender",gender);
		jsonData.append("academy",academy);
		jsonData.append("phonenumber",phonenumber);
		jsonData.append("email",email);
		$.ajax({
			url:"./user/updateUserInfo",
			type:"POST",
			data:jsonData,
			datatype:"json",
			async:false,
			cache:false,
			processData:false,
			contentType:false,
			success:function(data){
				data = JSON.parse(data)
				if(data.code==1){
					window.location.href="checkUserInfo.jsp";
				}else{
					alert(data.msg)
				}
			}
		});
	});
	
	$("#cancel").click(function(){
		window.location.href="checkUserInfo.jsp";
	});
	
	$.ajax({
		url:"./user/getUserInfo",
		type:"POST",
		datatype:"json",
		success:function(data){
			data=JSON.parse(data);
			if(data.code==1){
				$("input#alterUserName").val(data.data.username);
				$("input#alterUserCollege").val(data.data.academy);
				$("input#alterUserPhone").val(data.data.phonenumber);
				$("input#alterUserEmail").val(data.data.email);
				var image = document.getElementById("image");
				image.src="http://localhost:8080/Train/headImg/"+data.data.headimgurl;
			}else{
				alert(data.msg)
			}
		}
	});
});
</script>
</body>
</html>