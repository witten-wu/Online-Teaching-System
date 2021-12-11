<%@ page language="java" import="com.Train.model.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<title>学生主页</title>
</head>
<body>
<%Integer uid =((User)session.getAttribute("user")).getUid();%>
<div class="container">
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="row clearfix">
		<div class="col-md-12" >
			<table id="showMyCourses" class="table">
				<thead>
				</thead>
				<tbody id="showMyCourses">
				
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function deleteCourse(obj){ 
	var cid=obj.id;
	var uid="<%=uid%>";
	$.ajax({
		url:"./user/deleteUserCourse",
		type:"POST",
		data:{"uid":uid,"cid":cid},
		datatype:"json",
		success:function(data){
			data=JSON.parse(data);
			if(data.code==1){
			}else if(data.code==0){
				alert(data.msg);
			}
			window.location.reload();
		}
	});
};

function studyCourse(obj){ 
	var cid=obj.id;
	window.open('myCourses2.jsp?'+cid);
};


$(document).ready(function(){
	var uid="<%=uid%>";
	$.ajax({
		url:"./user/showMyCourses",
		type:"POST",
		data:{"uid":uid},
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
				var newTd10 =document.createElement("td");
				var newTd11 =document.createElement("td");
				
				var button1=document.createElement("button");
				var button2=document.createElement("button");
				var str1="开始学习";
				var str2="退选课程";
				button1.className="btn btn-primary btn-xs";
				button2.className="btn btn-danger btn-xs";
				
				button1.append(str1);
				button2.append(str2);
				
				button1.id=dataList[i].cid;
				button1.style="height:30px;margin-top:35px";
				button2.id=dataList[i].cid;
				button2.style="height:30px;margin-top:35px";
				
				var cId = document.createTextNode(dataList[i].cid);
				var cName = document.createTextNode("课程名:"+dataList[i].cname);
				var cTeacher = document.createTextNode("主讲老师:"+dataList[i].cteacher);
				var cDescription = document.createTextNode("课程简介:"+dataList[i].cdescription);
				newTd10.append(button1);
				newTd10.width="50px";
				newTd11.append(button2);

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
				newTr.append(newTd10);
				newTr.append(newTd11);				
				$("tbody#showMyCourses").append(newTr);
				
				button1.addEventListener("click",function(){
					studyCourse(this);
				});
				
				button2.addEventListener("click",function(){
					//退课
					deleteCourse(this);
				});
			}
		}
	});
});
</script>
</body>
</html>