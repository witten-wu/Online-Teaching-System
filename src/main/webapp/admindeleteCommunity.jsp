<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<title>管理员主页</title>
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
	            <table class="table">
					<thead>
						<tr>
							<th>选择</th>
							<th>课程ID</th>
							<th>课程名</th>
						</tr>
					</thead>
					<tbody id="showClubList">
						
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
$(document).ready(function(){
	$.ajax({ 
		url:"./user/showAllCourses",
		type:"POST", 
		datatype:"json",	 
		async:"false",
		success:function(data){
			var str =""; 
			data = JSON.parse(data); 
			dataList = data.data; 
			if(data.code==1){
				for(var i=0;i < dataList.length;i++){
					var  trRow = document.createElement("tr");
					var  inputRow= document.createElement("input");
					var inputTdRow =document.createElement("td");
					var  cidRow = document.createElement("td");
					var  cnameRow = document.createElement("td");
					var cid = document.createTextNode(dataList[i].cid);
					var cname = document.createTextNode(dataList[i].cname);
					inputRow.type="checkbox";
					cidRow.append(cid);
					cnameRow.append(cname);
					inputRow.id=dataList[i].cid;
					inputRow.name="check[]";
					inputRow.id=dataList[i].cid;
					inputTdRow.append(inputRow);
					trRow.append(inputTdRow);
					trRow.append(cidRow);
					trRow.append(cnameRow);
					$("tbody#showClubList").append(trRow);
				}
			}else if(data.code==0){
				alert(data.msg)
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
					cid =checks[i].id;
					$.ajax({
						url:"./admin/deleteCourse",
						type:"POST",
						data:{"cid":cid},
						datatype:"json",
						success:function(data){
							data=JSON.parse(data);
							if(data.code==1){
							}else{
								alert(data.msg)
							}
						}
					});
				}
				window.location.reload();
			}
		}
	});

});
</script>
</html>