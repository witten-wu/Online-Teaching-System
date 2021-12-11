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
		<div class="col-md-5 col-md-push-3" style="margin: 40px 0 0 0">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					 <label for="inputPassword" class="col-sm-2 control-label">旧密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputOldPassword" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputNewPassword" />
					</div>
				</div>
				<div class="form-group">
					 <label for="repeatPassword" class="col-sm-2 control-label">重复新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="repeatNewPassword" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="button" class="btn btn-warning" style="margin: 0 0 0 60px" id="sureAlter">确认修改</button>
						 <button type="button" class="btn btn-default" style="margin: 0 0 0 95px" id="goBackHome">返回首页</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-6 column">
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div><script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#goBackHome").click(function(){
		window.location.href="homepage.jsp";
	});
	
	$("#sureAlter").click(function(){
		var oldPassword = $("#inputOldPassword").val();
		var newPassword = $("#inputNewPassword").val();
		var surePassword = $("#repeatNewPassword").val();
		$.ajax({
			url:"./modifyPassword",
			type:"POST",
			datatype:"json",
			data:{"oldPassword":oldPassword,"newPassword":newPassword,"surePassword":surePassword},
			success:function(data){
				data=JSON.parse(data)
				if(data.code==1){
					alert(data.msg)
					window.location.reload();
				}else if(data.code==100001){
					alert(data.msg)
				}else if(data.code==100018){
					alert(data.msg)
				}else if(data.code==0){
					alert(data.msg)
				}
			}
		});
	});
});
</script>
</body>
</html>