<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
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
			<div class="form-group">
			    <select class="form-control" id="showClubList" onchange="selectOnchang(this)"> 
			    	<option value="10000">全部</option>
			    </select>
			</div>
				<table class="table">
					<thead>
						<tr>
							<th>用户ID</th>
							<th>用户名</th>
							<th>性别</th>
							<th>电话</th>
							<th>学院</th>
							<th>邮箱</th>
							<th id="grade" hidden>成绩</th>						
						</tr>
					</thead>
					<tbody id="showAllUserInfo">

					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function selectOnchang(obj){
	$("#showAllUserInfo").empty();
	var cid = $('#showClubList option:selected') .val();
	if(cid=="10000"){
		$("#grade").hide();
		$.ajax({
			url:"./admin/showAllUser",
			type:"POST",
			datatype:"json",
			async:"false",
			success:function(data){
				data=JSON.parse(data);
				dataList=data.data;
				if(data.code==0){
					alert(data.msg)
				}else if(data.code==1){
					for(var i=0;i<dataList.length;i++){
		 				var newTrRow = document.createElement("tr");
		 				var newTdRow1 = document.createElement("td");
		 				var newTdRow2 = document.createElement("td");
		 				var newTdRow3 = document.createElement("td");
		 				var newTdRow4 = document.createElement("td");
		 				var newTdRow5 = document.createElement("td");
		 				var newTdRow6 = document.createElement("td");

		 				var uid = document.createTextNode(dataList[i].uid);
		 				var username = document.createTextNode(dataList[i].username);
		 				var gender = document.createTextNode(dataList[i].gender);
		 				var phonenumber = document.createTextNode(dataList[i].phonenumber);
		 				var email = document.createTextNode(dataList[i].email);
		 				var academy = document.createTextNode(dataList[i].academy);
		 				
		 				newTdRow1.append(uid);
		 				newTdRow2.append(username);
		 				newTdRow3.append(gender);
		 				newTdRow4.append(phonenumber);
		 				newTdRow6.append(email);
		 				newTdRow5.append(academy);
		 				
		 				newTrRow.append(newTdRow1);
		 				newTrRow.append(newTdRow2);
		 				newTrRow.append(newTdRow3);
		 				newTrRow.append(newTdRow4);
		 				newTrRow.append(newTdRow5);
		 				newTrRow.append(newTdRow6);
		 				
		 				$("tbody#showAllUserInfo").append(newTrRow);
					}
				}
			}
		});
	}else{
	$("#grade").show();
	$.ajax({
		url:"./admin/showUserScoreByCid",
		type:"POST",
		datatype:"json",
		data:{"cid":cid},
		success:function(data){
			data= JSON.parse(data);
			dataList = data.data;
			if(data.code==0){
				alert(data.msg)
			}else if(data.code==1){
				for(var i=0;i<dataList.length;i++){
	 				var newTrRow = document.createElement("tr");
	 				var newTdRow1 = document.createElement("td");
	 				var newTdRow2 = document.createElement("td");
	 				var newTdRow3 = document.createElement("td");
	 				var newTdRow4 = document.createElement("td");
	 				var newTdRow5 = document.createElement("td");
	 				var newTdRow6 = document.createElement("td");
	 				var newTdRow7 = document.createElement("td");
	 				
	 				var uid = document.createTextNode(dataList[i].uid);
	 				var username = document.createTextNode(dataList[i].username);
	 				var gender = document.createTextNode(dataList[i].gender);
	 				var phonenumber = document.createTextNode(dataList[i].phonenumber);
	 				var email = document.createTextNode(dataList[i].email);
	 				var academy = document.createTextNode(dataList[i].academy);
	 				var score = document.createTextNode(dataList[i].score);
	 				
	 				newTdRow1.append(uid);
	 				newTdRow2.append(username);
	 				newTdRow3.append(gender);
	 				newTdRow4.append(phonenumber);
	 				newTdRow6.append(email);
	 				newTdRow5.append(academy);
	 				newTdRow7.append(score);
	 				
	 				newTrRow.append(newTdRow1);
	 				newTrRow.append(newTdRow2);
	 				newTrRow.append(newTdRow3);
	 				newTrRow.append(newTdRow4);
	 				newTrRow.append(newTdRow5);
	 				newTrRow.append(newTdRow6);
	 				newTrRow.append(newTdRow7);
	 				
	 				$("tbody#showAllUserInfo").append(newTrRow);
				}
			}
		}
	});
	}
};

$(document).ready(function(){
	$.ajax({
		url:"./user/showTeacherCourses",
		type:"POST", 
		datatype:"json",	 
		async:"false",
		success:function(data){
			data = JSON.parse(data); 
			dataList = data.data; 
			for(var i=0;i < dataList.length;i++){
				var newRow = document.createElement("option");
				var ss = document.createTextNode(dataList[i].cname);
				newRow.append(ss);
				newRow.id=dataList[i].cid;
				newRow.value=dataList[i].cid;
				$("#showClubList").append(newRow);
			}
		}
	});
	$.ajax({
		url:"./admin/showAllUser",
		type:"POST",
		datatype:"json",
		async:"false",
		success:function(data){
			data=JSON.parse(data);
			dataList=data.data;
			if(data.code==0){
				alert(data.msg)
			}else if(data.code==1){
				for(var i=0;i<dataList.length;i++){
	 				var newTrRow = document.createElement("tr");
	 				var newTdRow1 = document.createElement("td");
	 				var newTdRow2 = document.createElement("td");
	 				var newTdRow3 = document.createElement("td");
	 				var newTdRow4 = document.createElement("td");
	 				var newTdRow5 = document.createElement("td");
	 				var newTdRow6 = document.createElement("td");

	 				var uid = document.createTextNode(dataList[i].uid);
	 				var username = document.createTextNode(dataList[i].username);
	 				var gender = document.createTextNode(dataList[i].gender);
	 				var phonenumber = document.createTextNode(dataList[i].phonenumber);
	 				var email = document.createTextNode(dataList[i].email);
	 				var academy = document.createTextNode(dataList[i].academy);
	 				
	 				newTdRow1.append(uid);
	 				newTdRow2.append(username);
	 				newTdRow3.append(gender);
	 				newTdRow4.append(phonenumber);
	 				newTdRow6.append(email);
	 				newTdRow5.append(academy);
	 				
	 				newTrRow.append(newTdRow1);
	 				newTrRow.append(newTdRow2);
	 				newTrRow.append(newTdRow3);
	 				newTrRow.append(newTdRow4);
	 				newTrRow.append(newTdRow5);
	 				newTrRow.append(newTdRow6);
	 				
	 				$("tbody#showAllUserInfo").append(newTrRow);
				}
			}
		}
	});
});
</script>
</html>