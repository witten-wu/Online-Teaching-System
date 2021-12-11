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
	<input type="text" style="margin:0 0 0 80px;width:500px;font-size:20px;background:none; border:none;" id="title" disabled/>
	<div>
		<div id="a1" style="margin:0 0 20px 70px;float:left" ></div>
		<input type="text" style="background:#99CC99;font-style: italic;text-align: center;font-size:20px;width:265px;height:40px;margin-left:50px;float:left;" value="我要提问" disabled>
		<textarea style="width:265px;height:250px;margin-left:50px;float:left" id="question" ></textarea>
		<button class="btn btn-block" style="font-size:18px;background:#99CC99;width:265px;height:35px;float:left;margin-left:50px;margin-top:20px" id="submit">发表</button>
	</div>
	<div >
		<table id="showCourses" class="table">
				<tbody id="showDes">
				</tbody>
		</table>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script type="text/javascript" src="ckplayer/ckplayer.js" charset="utf-8"></script>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
/* var watchTime=0;
var setT=null;
function loadedHandler(){
  if(CKobject.getObjectById('ckplayer_a1').getType()){
    CKobject.getObjectById('ckplayer_a1').addListener('paused',pausedHandler);
  }
  else{
    CKobject.getObjectById('ckplayer_a1').addListener('paused','pausedHandler');
  }
}
function pausedHandler(b){
  if(setT){
    window.clearInterval(setT);
  }
  if(!b){
    setT=window.setInterval(setFunction,1000);
  }
}
function setFunction(){
  watchTime+=1;
}
 */
var path = null;
var cTeacher=null;
function play(){
	var flashvars = {
			f : path,//项目的相对路径WebContent下
			c : 0,
			b : 1
		};
		var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode : 'transparent'};
		CKobject.embedSWF('ckplayer/ckplayer.swf','a1','ckplayer_a1','750','450',flashvars,params); 
	
}


$(document).ready(function(){
	var fileId = window.location.search.substr(1);
	var filePath = null;
	var cid = null;
	$.ajax({
		url:"./user/showCourses3",
		type:"POST",
		data:{"fileId":fileId},
		datatype:"json",
		async:false,
		success:function(data){
			data=JSON.parse(data);
			dataList =data.data;
			for(var i=0;i<dataList.length;i++){
				var newTr = document.createElement("tr");
				var newTd1 = document.createElement("td");
				var cName = dataList[i].cname;
				$("#title").val(cName);
				var cDes = document.createTextNode("章节简介："+dataList[i].cdescription);
				path = dataList[i].path;
				cid = dataList[i].cid;
				play();
				newTd1.append(cDes);
				newTr.append(newTd1);
				$("tbody#showDes").append(newTr);
			}
		}
	});
	
	$.ajax({
		url:"./user/showCourseByCid",
		type:"POST",
		data:{"cid":cid},
		datatype:"json",
		async:false,
		success:function(data){
			data= JSON.parse(data);
			if(data.code==1){
				cTeacher=data.data.cteacher;
			}else if(data.code==0){
				alert(data.msg);
			}
		}
	});
	$("#submit").click(function(){
		var question = $("#question").val();
		if(question==""){
			alert("请输入问题内容!");
		}else{
		$.ajax({
			url:"./user/addQuestion",
			type:"POST",
			data:{"question":question,"cTeacher":cTeacher},
			datatype:"json",
			success:function(data){
				data=JSON.parse(data);
				if(data.code==1){
					$("#question").val("");
					alert(data.msg);
				}else if(data.code==0){
					alert(data.msg);
				}				
			}
		});
		}
	});

});
</script>
</body>
</html>