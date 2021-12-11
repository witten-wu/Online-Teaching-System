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
		$("#userManage").click(function(){
			$(".userManage").toggle(500);
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
	    		  <li id="backHome" class="active"><a href="admincheckAllCommunity.jsp">主页</a></li>
	    		  	<li  class="communityManage"><a href="admincheckAllCommunity.jsp">所有课程</a></li>
	              <li id="communityManage" class="active"><a href="#">课程管理</a></li>
		              <li  class="communityManage"><a href="admindeleteCommunity.jsp">删除课程</a></li>
		              <li  class="communityManage"><a href="adminalterCommunity.jsp">修改课程</a></li>
		          <li id="checkApplicationList" class="active"><a href="#">课程章节管理</a></li>
		          	  <li  class="checkApplicationList"><a href="admindeleteFile.jsp">删除章节内容</a></li>
		          	  <li  class="checkApplicationList"><a href="adminalterFile.jsp">修改章节内容</a></li>
		     	  <li id="memberManage" class="active"><a href="#">考试管理</a></li>
		     	  	  <li  class="memberManage"><a href="adminalterExam.jsp">修改试卷</a></li>
		     		  <li  class="memberManage"><a href="admincheckAllUser.jsp">查看学员成绩</a></li>
		     	  
	    </ul>
	</body>
</body>
</html>