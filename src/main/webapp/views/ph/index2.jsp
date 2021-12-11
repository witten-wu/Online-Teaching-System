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
<title>参考学案</title>
<script type="text/javascript" src="${contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${contextPath}/ueditor/ueditor.all.js"></script>
<link rel="stylesheet" href="${contextPath}/ueditor/themes/default/css/ueditor.css">
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="${contextPath}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
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
	<form action="${contextPath}/demo/rhandout" method="post">
	<h1>参考学案名称：<input type="text" name="title" class="textField" /></h1>
        
         <h3>请选择科目：  
        <select name="catalog" id="catalog" onchange="catalogABC();" >	
        <option value="">请选择科目</option> 
        <option value="a" <c:if test="${param.catalog == 'a'} ">selected</c:if> >语文</option>
        <option value="b" <c:if test="${param.catalog == 'b'} ">selected</c:if> >数学</option>
        <option value="c" <c:if test="${param.catalog == 'c'} ">selected</c:if> >英语</option>
        </select>
        </h3>
        <div class="col-xs-8"> 
        <h3>请选择模块:
        <select name="second" id="second" onchange="secondQuery();" >
        <option value="">请选择模块</option>   
        </select>  
        </h3> 
        </div> 
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
				<td class="key">一、学习目标：</td>
			</tr>
			<tr>
				<td><textarea id="content1" name="content1"
						style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">二、重点难点：</td>
			</tr>
			<tr>
				<td><textarea id="content2" name="content2"
				style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">三、课前学习：</td>
			</tr>
			<tr>
				<td><textarea id="content3" name="content3"
				style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">四、课中学习：</td>
			</tr>
			<tr>
				<td><textarea id="content4" name="content4"
				style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">五、课后学习：</td>
			</tr>
			<tr>
				<td><textarea id="content5" name="content5"
				style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="保存Word文档" /></td>
			</tr>
		</table>
		<script type="text/javascript">
				UE.getEditor("content1");
				UE.getEditor("content2");
				UE.getEditor("content3");
				UE.getEditor("content4");
				UE.getEditor("content5");
		</script>
	</form>
</body>
<script type="text/javascript">

function catalogABC(){	
	var object = $("#catalog").val();	
	if(object !=null){
		 $.ajax({
				url : "${contextPath}/demo/findObject?object="+object,
				type : 'post',
				dataType : 'json',
				async : false,
				//contentType: "application/json; charset=utf-8",
				success : function(data) {
					console.log(data);					
					   if(data!=null){
						    $.each(data,function(i,item){
				            	  $.each(item,function(j,val){
				            		  $("#second").append("<option value="+val.bookid+">"+val.bookname+"</option>");
				            	  })
				                 
				              }); 
					   }			          		         				
				}
		 })
	}else{
		alert("请选择科目！！");
	}
		
	
}


function secondQuery(){
	var object = $("#second option:selected").val();	
	 $.ajax({
			url : "${contextPath}/demo/findThird?object="+object,
			type : 'post',
			dataType : 'json',
			async : false,			
			success : function(data) {
				console.log(data);	
				   if(data!=null){
					  
					    $.each(data,function(i,item){
			            	  $.each(item,function(j,val){
			            		  $("#third").append("<option value="+val.chapterid+" <c:if test="${param.third} == val.chapterid">selected</c:if>>"+val.chaptername+"</option>");
			            	  })
			                 
			              }); 
				   }			          		         				
			}
	 })
}

function thirdQuery(){
	var object = $("#third option:selected").val();	
	 $.ajax({
			url : "${contextPath}/demo/findForth?object="+object,
			type : 'post',
			dataType : 'json',
			async : false,			
			success : function(data) {
				console.log(data);	
				   if(data!=null){
					    $.each(data,function(i,item){
			            	  $.each(item,function(j,val){
			            		  $("#forth").append("<option value="+val.chapterid+" <c:if test="${param.forth} == val.chapterid">selected</c:if> >"+val.chaptername+"</option>");
			            	  })
			                 
			              }); 
				   }			          		         				
			}
	 })
}

</script>
</html>
