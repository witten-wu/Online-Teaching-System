<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<title>老师主页</title>
</head>
<body>
	<div id="loading" style="width:100%;height:100%">
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
		    	<option value="10000">选择课程</option>
		    </select>
			</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">章节名</span>
					<input type="text" class="form-control" id="inputClubName"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">章节简介</span>
					<textarea rows="3" class="form-control" id="inputClubDes"></textarea>
				</div>
				<div style="margin: 15px 0 0 0 ">			           
        		<form  id="upload" method="post" enctype="multipart/form-data">
					<input type="file" name="file" id="file">			                 
          		</form>
          		</div>
          		<div id="load" hidden>
          		<img src="image/load3.gif"  style="margin-left:350px" ></img>
          		</div>
				<button class="btn btn-info btn-lg btn-block" style="width:300px;height:45px;margin:15px 0 15px 0;margin-left:auto;margin-right:auto;" id="sureAlter">确认提交</button>
         	</div>
        </div>
    </div>
    </div>
</body>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

var filed=null;
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
				newRow.value=dataList[i].cid;
				$("#showClubList").append(newRow);
			}
		}
	});
	
	$("#sureAlter").click(function(){
		var cid = $("#showClubList option:selected").val();
		var cName = $("#inputClubName").val();
		var cDescription =$("#inputClubDes").val();
		var File = $("#file").val();
		if(cid=="10000"){
			alert("请选择课程")
		}else if(cName==""||cDescription==""){
			alert("请完善信息")
		}else if(File==""){
			alert("请上传视频文件")
		}else{
			var formData = new FormData($("#upload")[0]);
			formData.append("cid",cid);
			formData.append("cName",cName);
			formData.append("cDes",cDescription);
			$.ajax({
				url:"./file/upload",
				type:"POST",
				cache: false,
			    data: formData,
			    processData: false,
			    contentType: false,
			    beforeSend: function () {
					$("#load").show();
					$("#loading").css("opacity","0.6");
			    },
			    success:function(data){
					data=JSON.parse(data);
					entity = data.data; 
					if(data.code==1){
					}else if(data.code==0){
						alert(data.msg)
					}
					window.location.reload();
				}
			});
		}
	});
});
</script>
</html>　　　　　　　　　　　　　　