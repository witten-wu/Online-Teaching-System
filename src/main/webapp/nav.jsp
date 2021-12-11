<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#search").click(function(){
		var search = $("#getParme").val();
		window.open(encodeURI('chooseCourse2.jsp?'+search));
	});
})
</script>
</head>
<body>
	<div class="row clearfix nav" id="nav">
		<div class="col-md-12 column">
			<div class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="homepage.jsp">首页</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse">
					<ul class="nav navbar-nav">
						<li>
							 <a href="checkUserInfo.jsp">我的信息</a>
						</li>
						<li>
							 <a  id="myCourse" href="myCourses.jsp">我的课程</a>
						</li>
						<li>
							 <a  id="chooseCourse" href="chooseCourse.jsp">选择课程</a>
						</li>
						<li>
							 <a  id="takeExam" href="takeExam.jsp">综合测验</a>
						</li>
						<li>
							 <a  id="checkGrade" href="checkGrade.jsp">查看成绩</a>
						</li>
						<li>
							 <a  id="myQuestion" href="MyQuestion.jsp">我的问答</a>
						</li>
						<li>
							 <a  id="alterPassword" href="alterPassword.jsp">修改密码</a>
						</li>
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" id="getParme" placeholder="输入您要搜索的课程" />
						</div> <button type="button" class="btn btn-default" id="search" >搜索</button>
					</form>					
				</div>
			</div>
		</div>
	</div>
</body>
</html>