<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<title>参考教案</title>
<script type="text/javascript" src="${contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${contextPath}/ueditor/ueditor.all.js"></script>
<link rel="stylesheet" href="${contextPath}/ueditor/themes/default/css/ueditor.css">
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="${contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<link href="${contextPath}/js/bootstrap.min.css" rel="stylesheet"></script>

<script type="text/javascript">
if(window.name != "bencalie"){
	location.reload();
	window.name = "bencalie";
}
else{
	window.name = "";
}

</script>
<style type="text/css">
div {
	width: 100%;
}
</style>

</head>
<body>

	<form action="${contextPath}/demo/rplan" method="post" id="selectForm">

	<hr/>   
	<h3>参考教案名称：<input type="text" name="title" id="title" class="textField" /></h3> 
              
        <%-- <h3>
                语文章节:
        <select name="chapterid" id="chapterid">
        <c:forEach var="list" items="${listA}"> 
        <option value="${list.chapterid}" <c:if test="${param.chapterid} == ${list.chapterid}">selected</c:if> >${list.chaptername}</option>
        </c:forEach>
        </select>
                 数学章节:
         <select name="chapterid" id="chapterid">
        <c:forEach var="list" items="${listB}"> 
        <option value="${list.chapterid}" <c:if test="${param.chapterid} == ${list.chapterid}">selected</c:if> >${list.chaptername}</option>
        </c:forEach>
        </select>
                 英语章节:
        <select name="chapterid" id="chapterid">
        <c:forEach var="list" items="${listC}"> 
        <option value="${list.chapterid}" <c:if test="${param.chapterid} == ${list.chapterid}">selected</c:if> >${list.chaptername}</option>
        </c:forEach>
        </select>
        </h3> --%>
        <h3>请选择科目：  
        <select name="catalog" id="catalog" onchange="catalogABC();">	
        <option value="">请选择科目</option> 
        <option value="a" <c:if test="${param.catalog == 'a'} ">selected</c:if> >语文</option>
        <option value="b" <c:if test="${param.catalog == 'b'} ">selected</c:if> >数学</option>
        <option value="c" <c:if test="${param.catalog == 'c'} ">selected</c:if> >英语</option>
        </select>
        </h3>
      
        <h3>请选择模块:
        <select name="second" id="second" onchange="secondQuery();" >
        <option value="">请选择模块</option>   
        </select>  
        </h3> 
       
        <h3>请选择章:
        <select name="third" id="third" onchange="thirdQuery();">
        <option value="">请选择章</option>   
        </select>  
        </h3> 
         <h3>请选择节:
        <select name="forth" id="forth" >
        <option value="" >请选择节</option>   
        </select>  
        </h3>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
        <p/>
        <h3>标签：<input type="text" name="tag1" id="tag1"> <input type="text" name="tag2" id="tag2"> <input type="text" name="tag3" id="tag3"></h3>
		<table border="0px">
			<tr>
				<td class="key">一、学情分析：</td>
			</tr>
			<tr>
				<td><textarea id="content1" name="content1"
						style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">二、教学目标：</td>
			</tr>
			<tr>
				<td><textarea id="content2" name="content2"
				style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">三、重点与难点：</td>
			</tr>
			<tr>
				<td><textarea id="content3" name="content3"
				style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">四、教学过程：</td>
			</tr>
			<tr>
				<td><textarea id="content4" name="content4"
				style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<!-- <td><input type="submit" value="保存Word文档" / ></td> -->
				
			</tr>
		</table>
		<script type="text/javascript">
				UE.getEditor("content1");
				UE.getEditor("content2");
				UE.getEditor("content3");
				UE.getEditor("content4");
		</script>
		<div class="col-md-7 col-xs-12">									
		<div class="alert_bottom page_align_center col-md-9 col-xs-12 right">
		<a class="alert_btn alert_btn_light" onclick="javascript:modifyCertain();"><h3>保存文档</h3> </a> 
		</div>
		</div>
	</form>
	
</body>

<script type="text/javascript">

function catalogABC(){	
	var context = ${contextPath};
	var object = $("#catalog").val();
	$("#second").empty();
	if(object !=null){
		 $.ajax({
				url : "${contextPath}/demo/findObject",
				type : 'post',
				data:{"object":object},
				dataType : 'json',
				async : false,
				//contentType: "application/json; charset=utf-8",
				success : function(data) {
					console.log(data);					
					   if(data!=null){
						   $("#second").prepend("<option value='0'>请选择</option>");
						    $.each(data,function(i,item){
				            	  $.each(item,function(j,val){
				            		  $("#second").append("<option value="+val.bookid+">"+val.bookname+"</option>");				            		  
				            	  })
				                 
				              }); 
					   }			          		         				
				}
				
		 })
		 alert("这是post请求");
	}else{
		alert("请选择科目！！");
	}
		
	
}


function secondQuery(){
	var object = $("#second option:selected").val();	
	$("#third").empty();
	 $.ajax({
			url : "${contextPath}/demo/findThird?object="+object,
			type : 'post',
			dataType : 'json',
			async : false,			
			success : function(data) {
				console.log(data);	
				   if(data!=null){
					   $("#third").prepend("<option value='0'>请选择</option>");
					    $.each(data,function(i,item){
			            	  $.each(item,function(j,val){
			            		  $("#third").append("<option value="+val.chapterid+">"+val.chaptername+"</option>");
			            	  })
			                 
			              }); 
				   }			          		         				
			}
	 })
}

function thirdQuery(){
	$("#forth").empty();
	var object = $("#third option:selected").val();	
	 $.ajax({
			url : "${contextPath}/demo/findForth?object="+object,
			type : 'post',
			dataType : 'json',
			async : false,			
			success : function(data) {
				console.log(data);	
				   if(data!=null){
					   $("#forth").prepend("<option value='0'>请选择</option>");
					    $.each(data,function(i,item){
			            	  $.each(item,function(j,val){
			            		  $("#forth").append("<option value="+val.chapterid+">"+val.chaptername+"</option>");
			            	  })
			                 
			              }); 
				   }			          		         				
			}
	 })
}

function modifyCertain() {
	if (check()) {//校验表单
		$("#selectForm").submit();
	}
}

function check(){
	var name = $("#title").val();
	var catalog=$("#forth").val();
	var content1=$("#content1").val();
	var content2=$("#content2").val();
	var content3=$("#content3").val();
	var content4=$("#content4").val();
	if("" == name){
		alert("请输入参考教案名称");
		$("#title").focus();
		return false;
	}
	if("" == catalog){
		alert("请输入章节名称");
		$("#forth").focus();
		return false;
	}
	return true;
	
}

</script>
</html>
