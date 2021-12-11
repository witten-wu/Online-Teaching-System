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
            	<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">课程名</span>
					<input type="text" class="form-control" id="inputCommunityName"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">课程简介</span>
					<textarea rows="3" class="form-control" id="inputCommunityIntro"></textarea>
				</div>
				<div style="margin: 15px 0 0 0 ">			           
        		<form class="form-horizontal" id="upload" method="post" enctype="multipart/form-data">
					<input type="file" name="file" id="file">				                 
          		</form>
          		</div>
    </div>
				<button class="btn btn-info btn-lg btn-block" style="width:300px;height:45px;margin:15px 0 15px 0;margin-left:auto;margin-right:auto;" id="sureAdd">确认添加</button>
            </div>
        </div>
    </div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#sureAdd").click(function(){
		var cName = $("#inputCommunityName").val();
		var cDescription = $("#inputCommunityIntro").val();
		var File = $("#file").val();
		if(cName == ""){
			alert("请输入课程名")
		}else if(cDescription == ""){
			alert("请输入课程简介")
		}else if(File == ""){
			alert("请上传课程封面")
		}else{
			var formData = new FormData($("#upload")[0]);
			formData.append("cName",cName);
			formData.append("cDescription",cDescription);
		$.ajax({
			url:"./admin/addCourse",
			type:"POST",
			cache: false,
		    data: formData,
		    processData: false,
		    contentType: false,
			success:function(data){
				data=JSON.parse(data);
				if(data.code==1){
					alert(data.msg)
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
</body>
</html>