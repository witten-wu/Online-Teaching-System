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
			<div class="form-group">
		    <select class="form-control" id="showClubList" onchange="selectOnchang(this)"> 
		    	<option value="">请选择相对应的课程</option>
		    </select>
		     <select class="form-control" style="margin: 15px 0 0 0 " id="showCourse2List" onchange="selectOnchang2(this)"> 
		    	<option value="">请选择相对应的章节</option>
		    </select>
			</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第一题</span>
					<input type="text" class="form-control" id="First"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="FirA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="FirB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="FirC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="FirD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="FirR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第二题</span>
					<input type="text" class="form-control" id="Second"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="SecA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="SecB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="SecC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="SecD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="SecR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第三题</span>
					<input type="text" class="form-control" id="Third"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="ThiA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="ThiB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="ThiC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="ThiD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="ThiR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第四题</span>
					<input type="text" class="form-control" id="Forth"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="ForA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="ForB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="ForC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="ForD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="ForR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第五题</span>
					<input type="text" class="form-control" id="Fifth"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="FifA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="FifB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="FifC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="FifD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="FifR"/>
				</div>
				<!-- <div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第六题</span>
					<input type="text" class="form-control" id="Sixth"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="SixA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="SixB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="SixC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="SixD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="SixR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第七题</span>
					<input type="text" class="form-control" id="Seventh"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="SevA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="SevB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="SevC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="SevD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="SevR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第八题</span>
					<input type="text" class="form-control" id="Eighth"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="EigA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="EigB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="EigC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="EigD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="EigR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第九题</span>
					<input type="text" class="form-control" id="Ninth"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="NinA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="NinB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="NinC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="NinD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="NinR"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第十题</span>
					<input type="text" class="form-control" id="Tenth"/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" id="TenA"/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" id="TenB"/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" id="TenC"/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" id="TenD"/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" id="TenR"/>
				</div> -->
				<button class="btn btn-warning btn-lg btn-block" style="width:300px;height:45px;margin:15px 0 15px 0;margin-left:auto;margin-right:auto;" id="sureAlter">确认修改</button>
         	</div>
        </div>
    </div>
</body>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
var Fir = null;
var Sec = null;
var Thi = null;
var For = null;
var Fif = null;

function selectOnchang(){
	var cid = $('#showClubList option:selected').val();
	$("#showCourse2List").empty();
	var fRow = document.createElement("option");
	var text = document.createTextNode("请选择章节");
	fRow.append(text);
	fRow.value="";
	$("#showCourse2List").append(fRow);
	$.ajax({
		url:"./user/showCourses2",
		type:"POST",
		data:{"cid":cid},
		datatype:"json",
		success:function(data){
			data= JSON.parse(data);
			dataList = data.data; 
			for(var i=0;i < dataList.length;i++){
				var newRow = document.createElement("option");
				var ss = document.createTextNode(dataList[i].cname);
				newRow.append(ss);
				newRow.value=dataList[i].fileId;
				$("#showCourse2List").append(newRow);
			}
		}
	});
};


function selectOnchang2(){
	var cid = $('#showClubList option:selected').val();
	var ccid = $("#showCourse2List option:selected").val();
	if(cid==""||ccid==""){
		window.location.reload();
	}else{
	$.ajax({
		url:"./user/showExamByCcid",
		type:"POST",
		data:{"ccid":ccid},
		datatype:"json",
		success:function(data){
			data= JSON.parse(data);
			if(data.code==0){
				alert(data.msg)
				window.location.reload();
			}		
			dataList =data.data;
			Fir = dataList[0].titleid;
			Sec = dataList[1].titleid;
			Thi = dataList[2].titleid;
			For = dataList[3].titleid;
			Fif = dataList[4].titleid;
			var FirTitle = $("#First").val(dataList[0].title);
			var FirA =$("#FirA").val(dataList[0].optionA);
			var FirB =$("#FirB").val(dataList[0].optionB);
			var FirC =$("#FirC").val(dataList[0].optionC);
			var FirD =$("#FirD").val(dataList[0].optionD);
			var FirR =$("#FirR").val(dataList[0].optionR);
			var SecTitle = $("#Second").val(dataList[1].title);
			var SecA =$("#SecA").val(dataList[1].optionA);
			var SecB =$("#SecB").val(dataList[1].optionB);
			var SecC =$("#SecC").val(dataList[1].optionC);
			var SecD =$("#SecD").val(dataList[1].optionD);
			var SecR =$("#SecR").val(dataList[1].optionR);
			var ThiTitle = $("#Third").val(dataList[2].title);
			var ThiA =$("#ThiA").val(dataList[2].optionA);
			var ThiB =$("#ThiB").val(dataList[2].optionB);
			var ThiC =$("#ThiC").val(dataList[2].optionC);
			var ThiD =$("#ThiD").val(dataList[2].optionD);
			var ThiR =$("#ThiR").val(dataList[2].optionR);
			var ForTitle = $("#Forth").val(dataList[3].title);
			var ForA =$("#ForA").val(dataList[3].optionA);
			var ForB =$("#ForB").val(dataList[3].optionB);
			var ForC =$("#ForC").val(dataList[3].optionC);
			var ForD =$("#ForD").val(dataList[3].optionD);
			var ForR =$("#ForR").val(dataList[3].optionR);
			var FifTitle = $("#Fifth").val(dataList[4].title);
			var FifA =$("#FifA").val(dataList[4].optionA);
			var FifB =$("#FifB").val(dataList[4].optionB);
			var FifC =$("#FifC").val(dataList[4].optionC);
			var FifD =$("#FifD").val(dataList[4].optionD);
			var FifR =$("#FifR").val(dataList[4].optionR);
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
				newRow.value=dataList[i].cid;
				$("#showClubList").append(newRow);
			}
		}
	});
	
	$("#sureAlter").click(function(){
		var cid = $("#showClubList option:selected").val();
		var ccid = $("#showCourse2List option:selected").val();
		var FirTitle = $("#First").val();
		var FirA =$("#FirA").val();
		var FirB =$("#FirB").val();
		var FirC =$("#FirC").val();
		var FirD =$("#FirD").val();
		var FirR =$("#FirR").val();
		var SecTitle = $("#Second").val();
		var SecA =$("#SecA").val();
		var SecB =$("#SecB").val();
		var SecC =$("#SecC").val();
		var SecD =$("#SecD").val();
		var SecR =$("#SecR").val();
		var ThiTitle = $("#Third").val();
		var ThiA =$("#ThiA").val();
		var ThiB =$("#ThiB").val();
		var ThiC =$("#ThiC").val();
		var ThiD =$("#ThiD").val();
		var ThiR =$("#ThiR").val();
		var ForTitle = $("#Forth").val();
		var ForA =$("#ForA").val();
		var ForB =$("#ForB").val();
		var ForC =$("#ForC").val();
		var ForD =$("#ForD").val();
		var ForR =$("#ForR").val();
		var FifTitle = $("#Fifth").val();
		var FifA =$("#FifA").val();
		var FifB =$("#FifB").val();
		var FifC =$("#FifC").val();
		var FifD =$("#FifD").val();
		var FifR =$("#FifR").val();
		if(cid==""){
			alert("请选择课程")
		}else if(ccid==""){
			alert("请选择章节")
		}else if(FirTitle==""||SecTitle==""||ThiTitle==""||ForTitle==""||FifTitle==""){
			alert("存在题目为空")
		}else if(FirA==""||FirB==""||FirC==""||FirD==""||FirR==""||SecA==""||SecB==""||SecC==""||SecD==""||SecR==""||ThiA==""||ThiB==""||
				ThiC==""||ThiD==""||ThiR==""||ForA==""||ForB==""||ForC==""||ForD==""||ForR==""||FifA==""||FifB==""||FifC==""||FifD==""||FifR==""){
			alert("存在选项为空")
		}else{
			if(confirm("确认修改？")){
				$.ajax({
					url:"./admin/alterExam",
					type:"POST",
					data:{"titleid":Fir,"title":FirTitle,"option_a":FirA,"option_b":FirB,"option_c":FirC,"option_d":FirD,"option_r":FirR,"cid":cid,"ccid":ccid},
					datatype:"json",
					success:function(data){
						data=JSON.parse(data);
						if(data.code==1){
						}else if(data.code==0){
							alert(data.msg)
						}
					}
				});
				$.ajax({
					url:"./admin/alterExam",
					type:"POST",
					data:{"titleid":Sec,"title":SecTitle,"option_a":SecA,"option_b":SecB,"option_c":SecC,"option_d":SecD,"option_r":SecR,"cid":cid,"ccid":ccid},
					datatype:"json",
					success:function(data){
						data=JSON.parse(data);
						if(data.code==1){
						}else if(data.code==0){
							alert(data.msg)
						}
					}
				});
				$.ajax({
					url:"./admin/alterExam",
					type:"POST",
					data:{"titleid":Thi,"title":ThiTitle,"option_a":ThiA,"option_b":ThiB,"option_c":ThiC,"option_d":ThiD,"option_r":ThiR,"cid":cid,"ccid":ccid},
					datatype:"json",
					success:function(data){
						data=JSON.parse(data);
						if(data.code==1){
						}else if(data.code==0){
							alert(data.msg)
						}
					}
				});
				$.ajax({
					url:"./admin/alterExam",
					type:"POST",
					data:{"titleid":For,"title":ForTitle,"option_a":ForA,"option_b":ForB,"option_c":ForC,"option_d":ForD,"option_r":ForR,"cid":cid,"ccid":ccid},
					datatype:"json",
					success:function(data){
						data=JSON.parse(data);
						if(data.code==1){
						}else if(data.code==0){
							alert(data.msg)
						}
					}
				});
				$.ajax({
					url:"./admin/alterExam",
					type:"POST",
					data:{"titleid":Fif,"title":FifTitle,"option_a":FifA,"option_b":FifB,"option_c":FifC,"option_d":FifD,"option_r":FifR,"cid":cid,"ccid":ccid},
					datatype:"json",
					success:function(data){
						data=JSON.parse(data);
						if(data.code==1){
							alert(data.msg)
							window.location.reload();
						}else if(data.code==0){
							alert(data.msg)
						}
					}
				});
			}
		}
	});
});
</script>
</html>　　　　　　　　　　　　　　