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
		<select class="form-control" style="width:200px;margin-bottom:15px" id="showCourseList" onchange="selectOnchang(this)"> 
		    	<option value="">筛选老师</option>
		</select>
			<table id="showCourses" class="table">
				<thead>
				</thead>
				<tbody id="showCourses2">
				
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function selectOnchang(obj){
	var uid="<%=uid%>";
	$("#showCourses2").empty();
	var cTeacher = $('#showCourseList option:selected').val();
	if(cTeacher==""){
		$.ajax({
			url:"./user/showCourses",
			type:"POST",
			datatype:"json",
			success:function(data){
				data=JSON.parse(data);
				dataList =data.data;
				if(data.code==1){
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
					
					var button2=document.createElement("button");
					var button3=document.createElement("button");
					var str1="查看目录";
					var str2="选课";
					var str3="已选";
					if(dataList[i].uid !=uid){
						button2.id=dataList[i].cid;
						button2.append(str2);
						button2.className="btn btn-warning btn-xs";
						button2.style="height:30px;width:80px;margin-top:25px";
						newTd5.append(button2);
					}else{
						button3.append(str3);
						button3.className="btn btn-warning disabled btn-xs";
						button3.style="height:30px;width:80px;margin-top:35px";
						newTd5.append(button3);
					}
					
					
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

					$("tbody#showCourses2").append(newTr);
					
					button2.addEventListener("click",function(){
						choose(this);
					});
				}
			}
			}
		});
	}else{
		$.ajax({
			url:"./user/showCoursesByCteacher",
			type:"POST",
			datatype:"json",
			data:{"cTeacher":cTeacher},
			success:function(data){
				data=JSON.parse(data);
				dataList =data.data;
				if(data.code==1){
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
					
					var button2=document.createElement("button");
					var button3=document.createElement("button");
					var str1="查看目录";
					var str2="选课";
					var str3="已选";
					if(dataList[i].uid !=uid){
						button2.id=dataList[i].cid;
						button2.append(str2);
						button2.className="btn btn-warning btn-xs";
						button2.style="height:30px;width:80px;margin-top:25px";
						newTd5.append(button2);
					}else{
						button3.append(str3);
						button3.className="btn btn-warning disabled btn-xs";
						button3.style="height:30px;width:80px;margin-top:35px";
						newTd5.append(button3);
					}
					
					
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

					$("tbody#showCourses2").append(newTr);
					
					button2.addEventListener("click",function(){
						choose(this);
					});
				}
			}
			}
		});
	}
};

function choose(obj){ 
	var cid=obj.id;
	var uid="<%=uid%>";
	$.ajax({
		url:"./user/addUserCourse",
		type:"POST",
		data:{"uid":uid,"cid":cid},
		datatype:"json",
		success:function(data){
			data=JSON.parse(data);
			if(data.code==1){
				window.location.reload();
			}else if(data.code==0){
				alert(data.msg);
			}
		}
	});
};


$(document).ready(function(){
	var uid="<%=uid%>";
	$.ajax({
		url:"./user/showTeacher",
		type:"POST",
		datatype:"json",
		success:function(data){
			data=JSON.parse(data);
			dataList =data.data;
			for(var i=0;i<dataList.length;i++){	
				var newRow = document.createElement("option");
				var ss = document.createTextNode(dataList[i].cteacher);
				newRow.append(ss);
				newRow.id=dataList[i].cid;
				newRow.value=dataList[i].cteacher;
				$("#showCourseList").append(newRow);
			}
		}
	});
	
	$.ajax({
		url:"./user/showCourses",
		type:"POST",
		datatype:"json",
		success:function(data){
			data=JSON.parse(data);
			dataList =data.data;
			if(data.code==1){
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
				
				var button2=document.createElement("button");
				var button3=document.createElement("button");
				var str1="查看目录";
				var str2="选课";
				var str3="已选";
				if(dataList[i].uid !=uid){
					button2.id=dataList[i].cid;
					button2.append(str2);
					button2.className="btn btn-warning btn-xs";
					button2.style="height:30px;width:80px;margin-top:25px";
					newTd5.append(button2);
				}else{
					button3.append(str3);
					button3.className="btn btn-warning disabled btn-xs";
					button3.style="height:30px;width:80px;margin-top:35px";
					newTd5.append(button3);
				}
				
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
				

				$("tbody#showCourses2").append(newTr);
				
				button2.addEventListener("click",function(){
					choose(this);
				});
			}
			}
		}
	});
});
</script>
</body>
</html>