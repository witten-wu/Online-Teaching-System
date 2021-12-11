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
				<jsp:include page="slideBar.jsp"/>
            </div>
			
            <div class="col-md-10">
            <select class="form-control" id="showClubList" onchange="selectOnchang(this)"> 
		    	<option value="">请选择相对应的课程</option>
		    </select>
	            <table class="table">
					<thead>
						<tr>
							<th>选择</th>
							<th>章节ID</th>
							<th>章节名</th>
						</tr>
					</thead>
					<tbody id="showCourses2">
						
					</tbody>
				</table>
				<button id="sureDelete" style="width:300px;height:45px;margin:15px 0 15px 0;margin-left:auto;margin-right:auto;" class="btn btn-danger btn-lg btn-block">删除选中的</button>
            </div>
        </div>
    </div>
</body>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function selectOnchang(){
	var cid = $('#showClubList option:selected').val();
	$("#showCourses2").empty();
	$.ajax({
		url:"./user/showCourses2",
		type:"POST",
		data:{"cid":cid},
		datatype:"json",
		success:function(data){
			data= JSON.parse(data);
			dataList = data.data; 
			if(data.code==1){
				for(var i=0;i < dataList.length;i++){
					var  trRow = document.createElement("tr");
					var  inputRow= document.createElement("input");
					var inputTdRow =document.createElement("td");
					var  cidRow = document.createElement("td");
					var  cnameRow = document.createElement("td");
					var fileId = document.createTextNode(dataList[i].fileId);
					var cname = document.createTextNode(dataList[i].cname);
					inputRow.type="checkbox";
					cidRow.append(fileId);
					cnameRow.append(cname);
					inputRow.id=dataList[i].fileId;
					inputRow.name="check[]";
					inputRow.id=dataList[i].fileId;
					inputTdRow.append(inputRow);
					trRow.append(inputTdRow);
					trRow.append(cidRow);
					trRow.append(cnameRow);
					$("tbody#showCourses2").append(trRow);
				}
		}
		}
	});
};
$(document).ready(function(){
	$.ajax({ 
		url:"./user/showAllCourses",
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
				newRow.value=dataList[i].cid;
				$("#showClubList").append(newRow);
			}
		}
	});
	
	$("#sureDelete").click(function(){
			var checks = $("input[name='check[]']:checked");
			if(checks.length==0){
				alert("未选中任何一行！")
			}else{
				if(confirm("确定要删除？")){
				for(var i=0;i<checks.length;i++){
					fileId =checks[i].id;
					$.ajax({
						url:"./admin/deleteCourse2",
						type:"POST",
						data:{"fileId":fileId},
						datatype:"json",
						success:function(data){
							data=JSON.parse(data);
							if(data.code==1){
								selectOnchang();
							}else{
								alert(data.msg)
							}
						}
					});
				}
			}
		}
	});

});
</script>
</html>