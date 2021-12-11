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
		<div class="col-md-12" >
			<table id="showMyScore" class="table">
				<thead>
					<tr>
						<th>编号</th>
						<th>考试课程</th>
						<th>任课教师</th>
						<th>考试分数</th>
					</tr>
				</thead>
				<tbody id="showMyScore">
				
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"./user/getMyScore",
		type:"POST",
		datatype:"json",
		success:function(data){
			data=JSON.parse(data);
			dataList =data.data;
			for(var i=0;i<dataList.length;i++){
				var newTr = document.createElement("tr");
				var newTd1 = document.createElement("td");
				var newTd2=document.createElement("td");
				var newTd3 =document.createElement("td");
				var newTd4=document.createElement("td");
				var cId = document.createTextNode(dataList[i].cid);
				var cName = document.createTextNode(dataList[i].cname);
				var cTeacher = document.createTextNode(dataList[i].cteacher);
				var cScore = document.createTextNode(dataList[i].score);
				newTd1.append(cId);
				newTd2.append(cName);
				newTd3.append(cTeacher);
				newTd4.append(cScore);
				newTr.append(newTd1);
				newTr.append(newTd2);
				newTr.append(newTd3);
				newTr.append(newTd4);
				$("tbody#showMyScore").append(newTr);				
			}
		}
	});
});
</script>
</body>
</html>