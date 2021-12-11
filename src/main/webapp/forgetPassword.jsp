<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html lang="zh-CN">
<head>
<title>学生主页</title>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="row clearfix">
		<div class="col-md-4 col-md-push-4">
			<div id="validateEmail" style="margin: 80px 0 0 0">
				<h4><em>我们需要验证你的<strong>Email</strong>地址!</em></h4>
				<div class="col-md-10">
					<div class="input-group">
						<input type="email" class="form-control" id="inputEmail"/>
						<span class="input-group-btn">
							<button class="btn btn-warning" type="button" id="goValidate">
								验证
							</button>
						</span>
					</div>
				</div>
			</div>
			<div id="validateCode" style="margin: 100px 0 0 0">
				<h4><em>输入您邮箱收到的验证码！</em></h4>
				<div class="col-md-10">
					<div class="input-group">
						<input type="text" class="form-control" id="inputValidate"/>
						<span class="input-group-btn">
							<button class="btn btn-info" type="button" id="ensureCode">
								确认
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("div#validateCode").hide();
	<!--验证邮箱-->
	$("#goValidate").click(function(){
		var email = $("#inputEmail").val();
		if(email!=""){
			$.ajax({
				url:"./verifyEmail",
				type:"POST",
				datatype:"json",
				data:{"email":email},
				success:function(data){
					data=JSON.parse(data);
					if(data.code==1){
						alert(data.msg)
						$("div#validateCode").show();
					}else{
						alert("发送失败，未知错误!")
					}
				}
			});
		}else{
			alert("邮箱为空或者格式有误！")
		}
	});
	<!--验证验证码-->
	$("#ensureCode").click(function(){
		var code = $("#inputValidate").val();
		if(code==""){
			alert("请输入验证吗");
		}else{
			$.ajax({
				url:"./verifyCodeValue",
				type:"POST",
				datatype:"json",
				data:{"code":code},
				success:function(data){
					data=JSON.parse(data);
					if(data.code==1){
						alert(data.msg);
						window.location.href="resetPassword.jsp";
					}else if(data.code==0){
						alert(data.msg);
					}
				}
			});
		}
	});
});
</script>
</body>
</html>