<%@ page language="java" import="com.Train.model.*" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<title>学生主页</title>
<script src="bootstrap/js/clock-1.1.0.js" type="text/javascript"></script>
<link href="bootstrap/css/style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/clock.css" rel="stylesheet" type="text/css">
<style type=text/css>
</style>
</head>
<body>
	<%User user =(User)session.getAttribute("user");%>
<div class="container">
	<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />				
		
		<div class="row clearfix">
			<div class="col-md-9 column">
				<div class="carousel slide" id="carousel-181541">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel-181541">
						</li>
						<li data-slide-to="1" data-target="#carousel-181541">
						</li>
						<li data-slide-to="2" data-target="#carousel-181541">
						</li>
						<li data-slide-to="3" data-target="#carousel-181541">
						</li>
						<li data-slide-to="4" data-target="#carousel-181541">
						</li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<a href="chooseCourse2.jsp?C"><img alt="" src="${pageContext.request.contextPath}/image/messi.jpg" /></a>
							<div class="carousel-caption">								
							</div>
						</div>
						<div class="item">
							<a href="chooseCourse2.jsp?Database"><img alt="" src="${pageContext.request.contextPath}/image/rock-climbing.jpg" /></a>
							<div class="carousel-caption">								
							</div>
						</div>
						<div class="item">
							<a href="chooseCourse2.jsp?Java"><img alt="" src="${pageContext.request.contextPath}/image/calligraphy.jpg" /></a>
							<div class="carousel-caption">								
							</div>
						</div>
						<div class="item">
							<a href="chooseCourse2.jsp?JavaWeb"><img alt="" src="${pageContext.request.contextPath}/image/james.jpg" /></a>
							<div class="carousel-caption">								
							</div>
						</div>
						<div class="item">
							<a href="chooseCourse2.jsp?Computer Science"><img alt="" src="${pageContext.request.contextPath}/image/lindan.jpg" /></a>
							<div class="carousel-caption">
							</div>
						</div>
					</div> <a class="left carousel-control" href="#carousel-181541" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-181541" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
			<div id="login" class="col-md-3 column">
				<form role="form" method="post">
					<div class="form-group">
						 <label for="InputUsername">用户名</label><input type="text" class="form-control" id="inputUsername" />
					</div>
					<div class="form-group">
						 <label for="InputPassword">密码</label><input type="password" class="form-control" id="inputPassword"/>
					</div>
					<button type="button"  class="btn btn-warning" id="goLogin">登陆</button>
					<button type="button"  class="btn btn-default" id="goRegist" >注册</button>
					<a href="forgetPassword.jsp">忘记密码</a>
				</form>				
			</div>
			<div class="clock" id="Note" style="width: 210px; height:305px;margin-top:0px;margin-left:30px;border:none" hidden>
			<canvas width="210" height="210" style="position: absolute;"></canvas>
			<canvas width="210" height="290" style="position: absolute;"></canvas>
			</div>	
		</div>
		<div class="row clearfix">
			<div class="col-md-6 column" style="margin:20px 0 0 0">
				<blockquote>
					<p>
						Some men give up their designs when they have almost reached the goal; While others, on the contrary, obtain a victory by exerting, at the last moment, more vigorous efforts than ever before.
					</p> <small><cite>Herodotus, Greek Historian</cite></small>
				</blockquote>
			</div>
			<div class="col-md-6 column"style="margin:20px 0 0 0">
				<div class="alert alert-success alert-dismissable">
					 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<h4>
						Warning!
					</h4> <strong></strong> 本系统由重庆大学计算机学院2014级学生吴一都开发，未经允许不得擅自盗用，否则承担法律后果！如有问题，请发邮件至 <a href="#" class="alert-link">m18852592121@163.com</a>
				</div>
			</div>
		</div>
		
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/clock-1.1.0.min.js" type="text/javascript"></script>
<script>
	var d = new Date();
	d.setHours(9);
	d.setMinutes(51);
	d.setSeconds(20);

	var clock2 = $("#Note").clock({
		width: 210,
		height: 290,
		theme: 't3'
	});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var uid="<%=user%>";
	if(uid != "null"){
		$("div#login").hide();
		$("div#Note").show();
	}
	
	$("#goLogin").click(function(){
		var userId = $("#inputUsername").val();
		var password = $("#inputPassword").val();
		$.ajax({
			url:"./login",
			type:"POST",
			data:{"userId":userId,"password":password},
			datatype:"json",
			success:function(data){
				data=JSON.parse(data);
				if(data.code==100001){
					alert(data.msg)
				}else if(data.code==100018){
					alert(data.msg)
				}else if(data.code==1){
					if(data.data.grade==1){
						window.location.href="checkAllCommunity.jsp";
					}else if(data.data.grade==2){
						window.location.href="admincheckAllCommunity.jsp";
					}else{
						location.reload();
					}
				}else if(data.code==-4){
					alert(data.msg)
				}
			}
		});
	});
	//注册按钮点击跳转
	$("#goRegist").click(function(){
		window.location.href="regist.jsp";
	});
});
</script>
</body>
</html>