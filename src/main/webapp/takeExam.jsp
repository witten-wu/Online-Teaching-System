<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<title>学生主页</title>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="row clearfix" id="List">
	<div class="col-md-6 column"style="margin:5px 0 0 0">
				<div class="alert alert-success alert-dismissable">
					 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					<h4>
						温馨提示：
					</h4><strong>请学完相对应的课程以后再参加综合测验！</strong> <a href="myCourses.jsp" class="alert-link">点击此处开始学习</a>
				</div>
			</div>
		<div class="col-md-12" >
			<table id="showMyExam" class="table">
				<thead>
					<tr>
						<th>考试编号</th>
						<th>考试课程</th>
						<th>课程老师</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="showMyExam">
				
				</tbody>
			</table>			
		</div>
	</div>
            <div class="col-md-12" id="Exam" style="margin: 20px 0 0 0 " hidden>
				<div class="input-group" style="margin: 0 0 0 0 ">
					<span class="input-group-addon">第一题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="First" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<input type="radio" id="FirA" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:5px" name="Firan" value="A"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FirAA" disabled/></span>
					<input type="radio" id="FirB" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Firan" value="B"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FirBB" disabled/></span>
					<input type="radio" id="FirC" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Firan" value="C"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FirCC" disabled/></span>
					<input type="radio" id="FirD" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Firan" value="D"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FirDD" disabled/></span>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第二题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="Second" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<input type="radio" id="SecA" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:5px" name="Secan" value="A"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="SecAA" disabled/></span>
					<input type="radio" id="SecB" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Secan" value="B"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="SecBB" disabled/></span>
					<input type="radio" id="SecC" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Secan" value="C"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="SecCC" disabled/></span>
					<input type="radio" id="SecD" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Secan" value="D"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="SecDD" disabled/></span>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第三题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="Third" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<input type="radio" id="ThiA" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:5px" name="Thian" value="A"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ThiAA" disabled/></span>
					<input type="radio" id="ThiB" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Thian" value="B"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ThiBB" disabled/></span>
					<input type="radio" id="ThiC" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Thian" value="C"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ThiCC" disabled/></span>
					<input type="radio" id="ThiD" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Thian" value="D"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ThiDD" disabled/></span>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第四题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="Forth" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<input type="radio" id="ForA" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:5px" name="Foran" value="A"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ForAA" disabled/></span>
					<input type="radio" id="ForB" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Foran" value="B"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ForBB" disabled/></span>
					<input type="radio" id="ForC" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Foran" value="C"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ForCC" disabled/></span>
					<input type="radio" id="ForD" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Foran" value="D"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="ForDD" disabled/></span>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第五题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="Fifth" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<input type="radio" id="FifA" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:5px" name="Fifan" value="A"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FifAA" disabled/></span>
					<input type="radio" id="FifB" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Fifan" value="B"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FifBB" disabled/></span>
					<input type="radio" id="FifC" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Fifan" value="C"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FifCC" disabled/></span>
					<input type="radio" id="FifD" style="vertical-align:middle; margin-top:-2px; margin-bottom:1px; margin-left:30px" name="Fifan" value="D"/><span><input type="text" style="width:235px;margin-left:5px;background:none;border:none;font-size:16px" id="FifDD" disabled/></span>
				</div>
				<button class="btn btn-warning btn-lg btn-block" style="width:300px;height:45px;margin:15px 0 15px 0;margin-left:auto;margin-right:auto;" id="sureAlter">确认交卷</button>
         	</div>
		
			<div class="col-md-12" id="Worng" style="margin: 5px 0 0 0 ">
			<div id="info" hidden>
			<input type="text" style="font-size:18px;background:none; border:none;width:1000px;" id="result" disabled/>
			<div id="T1" hidden>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第一题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="T1T" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T1A" disabled/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T1B" disabled/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T1C" disabled/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T1D" disabled/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T1R" disabled/>
				</div>
			</div>
			<div id="T2" hidden>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第二题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="T2T" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T2A" disabled/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T2B" disabled/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T2C" disabled/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T2D" disabled/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T2R" disabled/>
				</div>
			</div>
			<div id="T3" hidden>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第三题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="T3T" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T3A" disabled/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T3B" disabled/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T3C" disabled/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T3D" disabled/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T3R" disabled/>
				</div>
			</div>
			<div id="T4" hidden>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第四题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="T4T" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T4A" disabled/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T4B" disabled/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T4C" disabled/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T4D" disabled/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T4R" disabled/>
				</div>
			</div>
			<div id="T5" hidden>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">第五题</span>
					<input type="text" class="form-control" style="font-size:17px;background:none;" id="T5T" disabled/>
				</div>
				<div class="input-group" style="margin: 15px 0 0 0 ">
					<span class="input-group-addon">A</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T5A" disabled/>
					<span class="input-group-addon">B</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T5B" disabled/>
					<span class="input-group-addon">C</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T5C" disabled/>
					<span class="input-group-addon">D</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T5D" disabled/>
					<span class="input-group-addon">正确答案</span>
					<input type="text" class="form-control" style="font-size:16px;background:none;" id="T5R" disabled/>
				</div>
			</div>
			<div id="button" hidden>
			<button class="btn btn-default btn-lg btn-block" style="width:200px;height:45px;margin-top:30px;margin-left:auto;margin-right:auto;" id="backtotakeExam">返回</button>
			</div>
			</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
var FiranR=null;
var SecanR=null;
var ThianR=null;
var ForanR=null;
var FifanR=null;
var Score =null;
function takeExam(obj){
	var cid = obj.id;
	$.ajax({
		url:"./user/showExamByCid",
		type:"POST",
		data:{"cid":cid},
		datatype:"json",
		success:function(data){
			data= JSON.parse(data);
			dataList =data.data;
			FiranR=dataList[0].optionR;
			SecanR=dataList[1].optionR;
			ThianR=dataList[2].optionR;
			ForanR=dataList[3].optionR;
			FifanR=dataList[4].optionR;
			
			$("#First").val(dataList[0].title);
			$("#FirAA").val(dataList[0].optionA);
			$("#FirBB").val(dataList[0].optionB);
			$("#FirCC").val(dataList[0].optionC);
			$("#FirDD").val(dataList[0].optionD);
			$("#T1T").val(dataList[0].title);
			$("#T1A").val(dataList[0].optionA);
			$("#T1B").val(dataList[0].optionB);
			$("#T1C").val(dataList[0].optionC);
			$("#T1D").val(dataList[0].optionD);
			$("#T1R").val(dataList[0].optionR);
			
			$("#Second").val(dataList[1].title);
			$("#SecAA").val(dataList[1].optionA);
			$("#SecBB").val(dataList[1].optionB);
			$("#SecCC").val(dataList[1].optionC);
			$("#SecDD").val(dataList[1].optionD);
			$("#T2T").val(dataList[1].title);
			$("#T2A").val(dataList[1].optionA);
			$("#T2B").val(dataList[1].optionB);
			$("#T2C").val(dataList[1].optionC);
			$("#T2D").val(dataList[1].optionD);
			$("#T2R").val(dataList[1].optionR);
			
			$("#Third").val(dataList[2].title);
			$("#ThiAA").val(dataList[2].optionA);
			$("#ThiBB").val(dataList[2].optionB);
			$("#ThiCC").val(dataList[2].optionC);
			$("#ThiDD").val(dataList[2].optionD);
			$("#T3T").val(dataList[2].title);
			$("#T3A").val(dataList[2].optionA);
			$("#T3B").val(dataList[2].optionB);
			$("#T3C").val(dataList[2].optionC);
			$("#T3D").val(dataList[2].optionD);
			$("#T3R").val(dataList[2].optionR);
			
			$("#Forth").val(dataList[3].title);
			$("#ForAA").val(dataList[3].optionA);
			$("#ForBB").val(dataList[3].optionB);
			$("#ForCC").val(dataList[3].optionC);
			$("#ForDD").val(dataList[3].optionD);
			$("#T4T").val(dataList[3].title);
			$("#T4A").val(dataList[3].optionA);
			$("#T4B").val(dataList[3].optionB);
			$("#T4C").val(dataList[3].optionC);
			$("#T4D").val(dataList[3].optionD);
			$("#T4R").val(dataList[3].optionR);
			
			$("#Fifth").val(dataList[4].title);
			$("#FifAA").val(dataList[4].optionA);
			$("#FifBB").val(dataList[4].optionB);
			$("#FifCC").val(dataList[4].optionC);
			$("#FifDD").val(dataList[4].optionD);
			$("#T5T").val(dataList[4].title);
			$("#T5A").val(dataList[4].optionA);
			$("#T5B").val(dataList[4].optionB);
			$("#T5C").val(dataList[4].optionC);
			$("#T5D").val(dataList[4].optionD);
			$("#T5R").val(dataList[4].optionR);
		}
	});
	
	$("#sureAlter").click(function(){
		var Firan=$('input[name="Firan"]:checked').val();
		var Secan=$('input[name="Secan"]:checked').val();
		var Thian=$('input[name="Thian"]:checked').val();
		var Foran=$('input[name="Foran"]:checked').val();
		var Fifan=$('input[name="Fifan"]:checked').val();
		Score = 0;
		$("div#Exam").hide();
		if(Firan==FiranR){
			Score += 20;
		}else{
			$("div#T1").show();
		}
		if(Secan==SecanR){
			Score += 20;
		}else{
			$("div#T2").show();
		}
		if(Thian==ThianR){
			Score += 20;
		}else{
			$("div#T3").show();
		}
		if(Foran==ForanR){
			Score += 20;
		}else{
			$("div#T4").show();
		}
		if(Fifan==FifanR){
			Score += 20;
		}else{
			$("div#T5").show();
		}
		if(Score==100){
			$("div#info").show();
			$("#result").val("所有题目全部答对，本次得分100分！")
		}else{
			$("div#info").show();
			$("#result").val("本次得分为"+Score+"，答错题目如下：")
		}
		$("div#button").show();
		
		$.ajax({
			url:"./admin/addScore",
			type:"POST",
			data:{"cid":cid,"Score":Score},
			datatype:"json",
			success:function(data){
				data=JSON.parse(data);
				if(data.code==1){
				}else if(data.code==0){
					alert(data.msg)
				}
			}
		});
		
	});
};

$("#backtotakeExam").click(function(){
	window.location.reload();
});

$(document).ready(function(){
	$.ajax({
		url:"./user/getMyExam",
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
				
				var button1=document.createElement("button");
				var button2=document.createElement("button");
				var str1="参加考试";
				var str2="已考试"
				if(dataList[i].score ==null){
					button1.id=dataList[i].cid;
					button1.append(str1);
					button1.className="btn btn-success btn-xs";
					newTd4.append(button1);
				}else{
					button2.append(str2);
					button2.className="btn btn-success disabled btn-xs";
					newTd4.append(button2);
				}
				
				var cId = document.createTextNode(dataList[i].cid);
				var cName = document.createTextNode(dataList[i].cname);
				var cTeacher = document.createTextNode(dataList[i].cteacher);
				var cScore = document.createTextNode(dataList[i].score);
				newTd1.append(cId);
				newTd2.append(cName);
				newTd3.append(cTeacher);
				
				newTr.append(newTd1);
				newTr.append(newTd2);
				newTr.append(newTd3);
				newTr.append(newTd4);
				$("tbody#showMyExam").append(newTr);
				
				button1.addEventListener("click",function(){
					if(confirm("确认参加考试？一旦开始请不要离开！")){
						$("div#List").hide();
						$("div#Exam").show();
						takeExam(this);
					}
				});
			}
		}
	});
});
</script>
</body>
</html>