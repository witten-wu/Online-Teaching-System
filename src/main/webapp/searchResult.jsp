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
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs">
				<ul class="nav nav-tabs" id="clubNameBar">
				<!-- 空白ul，用js填充 -->
				</ul>
				<div class="tab-content" id="tabContent">
						<!-- 空白 用js填充 -->
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
		url:"./user/showClubs",
		type:"POST", 
		datatype:"json",	 
		success:function(data){
			var str =""; 
			data = JSON.parse(data); 
			dataList = data.data; 
			for(var i=0;i < dataList.length;i++){
				var newRow='<li id="club'+i+'"><a href="#panel-1000'+i+'" class="clubHref" id="'+dataList[i].cid+'" data-toggle="tab">'+dataList[i].cname+'</a></li>' ;
				$("#clubNameBar").append(newRow);
			}
			for(var i=0;i<dataList.length;i++){
				var newContentRow ='<div class="tab-pane" id="panel-1000'+i+'"><p><strong>'+dataList[i].cdescription+'</strong></p></div>';
				$("#tabContent").append(newContentRow);
			}
		} 
	}); 
}); 
</script>
</body>
</html>