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
		$("#communityManage").click(function(){
			$(".communityManage").toggle(500);
		});
		$("#departmentManage").click(function(){
			$(".departmentManage").toggle(500);
		});
		$("#checkApplicationList").click(function(){
			$(".checkApplicationList").toggle(500);
		});
		$("#activityManage").click(function(){
			$(".activityManage").toggle(500);
		});
		$("#memberManage").click(function(){
			$(".memberManage").toggle(500);
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<body>
	    <ul class="nav nav-pills nav-stacked">
	    		  <li id="backHome" class="active"><a href="checkAllCommunity.jsp">主页</a></li>
	    		  	<li  class="communityManage"><a href="checkAllCommunity.jsp">我的课程</a></li>
	              <li id="communityManage" class="active"><a href="#">课程管理</a></li>	              	  
		              <li  class="communityManage"><a href="addCommunity.jsp">增加课程</a></li>
		              <li  class="communityManage"><a href="deleteCommunity.jsp">删除课程</a></li>
		              <li  class="communityManage"><a href="alterCommunity.jsp">修改课程</a></li>
		          <li id="departmentManage" class="active"><a href="#">课程章节管理</a></li>
		          	  <li  class="departmentManage"><a href="addFile.jsp">增加章节内容</a></li>
		          	  <li  class="departmentManage"><a href="deleteFile.jsp">删除章节内容</a></li>
		          	  <li  class="departmentManage"><a href="alterFile.jsp">修改章节内容</a></li>   
		     	  <li id="memberManage" class="active"><a href="#">考试管理</a></li>
		     	  	  <li  class="memberManage"><a href="addExam.jsp">上传试卷</a></li>
		     	  	  <li  class="memberManage"><a href="alterExam.jsp">修改试卷</a></li>
		     		  <li  class="memberManage"><a href="checkAllUser.jsp">查看学员成绩</a></li>
		     	  <li id="activityManage" class="active"><a href="#">问答管理</a></li>
		     	  	  <li  class="activityManage"><a href="addUser.jsp">待处理提问</a></li>
	    </ul>
	</body>
</body>
</html>