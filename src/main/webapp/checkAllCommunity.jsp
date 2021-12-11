<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<title>老师主页</title>
</head>
<body>
    <div class="container" style="margin-top: 10px">
        <div class="row clearfix">
        	<div class="col-md-12">
        		<jsp:include page="header.jsp"/>
        	</div>
        </div>
        <div class="row clearfix" style="margin: 10px 0 0 0">
            <div class="col-md-2">
				<jsp:include page="slideBarTeacher.jsp"/>
            </div>
            <div class="col-md-10">
            	<table class="table">
            	<thead>
				</thead>
					<tbody id="showAllClubs">

					</tbody>
				</table>	
            </div>
        </div>
    </div>
</body>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
	url:"./user/showTeacherCourses",
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
			var newTd5 = document.createElement("td");
			var newTd6 = document.createElement("td");
			
			var newTable = document.createElement("table");
			var newTr1 = document.createElement("tr");
			var newTr3 = document.createElement("tr");
			var newTd7=document.createElement("td");
			var newTd8 =document.createElement("td");
			var newTr2 = document.createElement("tr");
			var newTd9 =document.createElement("td");
			
			
			var cId = document.createTextNode(dataList[i].cid);
			var cName = document.createTextNode("课程名:"+dataList[i].cname);
			var cTeacher = document.createTextNode("主讲老师:"+dataList[i].cteacher);
			var cDescription = document.createTextNode("课程简介:"+dataList[i].cdescription);
			
			var image = document.createElement("img");
			image.src=dataList[i].cpath;
			image.height=80;
			image.width=160;
			
			
			newTd9.append(cDescription);
			newTr2.append(newTd9);
			newTr2.style="font-size:8px";
			newTd7.append(cName);				
			newTd8.append(cTeacher);
			newTr1.append(newTd7);
			newTr3.append(newTd8);
			newTr1.style="font-size:17px;font-weight:700";
			newTr3.style="font-size:13px;font-weight:600";
			newTable.append(newTr1);
			newTable.append(newTr3);
			newTable.append(newTr2);
			newTd6.append(image);
			newTd3.append(newTable);
			newTr.append(newTd6);
			newTr.append(newTd3);
			newTr.append(newTd4);
			newTr.append(newTd5);
			

			$("tbody#showAllClubs").append(newTr);
			}
		}
	});
});
</script>
</html>