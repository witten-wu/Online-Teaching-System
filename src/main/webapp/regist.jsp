<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<title>注册</title>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="col-md-4 col-md-push-4" style="margin: 50px 0 0 0">
<!-- 			<div class="input-group" style="margin: 15px 0 0 0 "> -->
<!-- 				<span class="input-group-addon">邮箱</span> -->
<!-- 				<input type="text" class="form-control" placeholder="email" id="setEmail"/> -->
<!-- 			</div> -->
			<div class="input-group" style="margin: 15px 0 0 0 ">
				<span class="input-group-addon">学号</span>
				<input type="text" class="form-control" placeholder="username" id="setUsername"/>
			</div>
			<div class="input-group" style="margin: 15px 0 0 0 ">
				<span class="input-group-addon">密码</span>
				<input type="password" class="form-control" placeholder="password" id="setPassword"/>
			</div>
			<div class="input-group" style="margin: 15px 0 0 0 ">
				<span class="input-group-addon">重复密码</span>
				<input type="password" class="form-control" placeholder="rePassword" id="repeatPassword"/>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					 <button class="btn btn-warning" style="margin:15px 0 15px 0" id="sureRegist">注册</button>
					 <button id="reset" type="button" class="btn btn-default" style="margin: 15px 0 15px 80px" id="goBack">重置</button>
				</div>
			</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#sureRegist").click(function(){
		var userId=$("#setUsername").val();
		var password=$("#setPassword").val();
		var rePassword=$("#repeatPassword").val();
		if(userId==null||password==""||rePassword==""){
			alert("请完善信息")
		}else if(password!=rePassword){
			alert("两次密码不一致")
		}else if(userId<20144400 || userId>20144800){
			alert("学号非法")
		}else{
			$.ajax({
				url:"./regist",
				type:"POST",
				data:{"userId":userId,"password":password},
				datatype:"json",
				success:function(data){
					data = JSON.parse(data)
					window.location.href="homepage.jsp";
					if(data.code==100001){
						alert(data.msg)
					}else if(data.code==1){
						alert(data.msg)
					}else if(data.code==0){
						alert(data.msg)
					}else if(data.code==500){
						alert(data.msg)
					}else if(data.code==-4){
						alert(data.msg)
					}
				}
			});
		}

	});
	
	$("#reset").click(function(){
		$("#setUsername").val("");
		$("#setPassword").val("");
		$("#repeatPassword").val("");
	});
});
</script>
</body>
</html>