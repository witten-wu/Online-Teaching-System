<%@ page language="java" import="com.Train.model.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<title>学生主页</title>
<script src="bootstrap/js/modernizr.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/css/reset.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/demo2.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/style2.css">
</head>
<body>
	<%Integer uid =((User)session.getAttribute("user")).getUid();%>
<div class="container">
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<div class="row clearfix">
		<div class="col-md-12" >
		<div class="accordion">
		<dl id="piano">
		<script type="text/javascript">
		var str="";
		$.ajax({
			url:"./user/showQuestion",
			type:"POST",
			datatype:"json",
			success:function(data){
				data=JSON.parse(data);
				dataList =data.data;
				if(data.code==1){
					for(var i=0;i<dataList.length;i++){
						str1=dataList[i].question;
						str2=dataList[i].answer;
						if(str2==null){
							var box=document.getElementById("piano")
							str += '<dt>'+'<a href="#accordion1" aria-expanded="false" aria-controls="accordion1" class="accordion-title accordionTitle js-accordionTrigger">'+str1+'</a>'+'</dt>'+'<dd class="accordion-content accordionItem is-collapsed" id="accordion2" aria-hidden="true">'+'<p>'+"暂无回答"+'</p>'+'</dd>';
							box.innerHTML=str;
						}else{
							var box=document.getElementById("piano")
							str += '<dt>'+'<a href="#accordion1" aria-expanded="false" aria-controls="accordion1" class="accordion-title accordionTitle js-accordionTrigger">'+str1+'</a>'+'</dt>'+'<dd class="accordion-content accordionItem is-collapsed" id="accordion2" aria-hidden="true">'+'<p>'+str2+'</p>'+'</dd>';
							box.innerHTML=str;
						}
					}	
				}else if(data.code==0){
					alert(data.msg);
				}
			}
		});
		</script>
		</dl>
		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
(function(){
	var d = document,
	accordionToggles = d.querySelectorAll('.js-accordionTrigger'),
	setAria,
	setAccordionAria,
	switchAccordion,
  touchSupported = ('ontouchstart' in window),
  pointerSupported = ('pointerdown' in window);
  
  skipClickDelay = function(e){
	e.preventDefault();
	e.target.click();
  }

		setAriaAttr = function(el, ariaType, newProperty){
		el.setAttribute(ariaType, newProperty);
	};
	setAccordionAria = function(el1, el2, expanded){
		switch(expanded) {
	  case "true":
		setAriaAttr(el1, 'aria-expanded', 'true');
		setAriaAttr(el2, 'aria-hidden', 'false');
		break;
	  case "false":
		setAriaAttr(el1, 'aria-expanded', 'false');
		setAriaAttr(el2, 'aria-hidden', 'true');
		break;
	  default:
				break;
		}
	};
//function
switchAccordion = function(e) {
  console.log("triggered");
	e.preventDefault();
	var thisAnswer = e.target.parentNode.nextElementSibling;
	var thisQuestion = e.target;
	if(thisAnswer.classList.contains('is-collapsed')) {
		setAccordionAria(thisQuestion, thisAnswer, 'true');
	} else {
		setAccordionAria(thisQuestion, thisAnswer, 'false');
	}
	thisQuestion.classList.toggle('is-collapsed');
	thisQuestion.classList.toggle('is-expanded');
		thisAnswer.classList.toggle('is-collapsed');
		thisAnswer.classList.toggle('is-expanded');
	
	thisAnswer.classList.toggle('animateIn');
	};
	for (var i=0,len=accordionToggles.length; i<len; i++) {
		if(touchSupported) {
	  accordionToggles[i].addEventListener('touchstart', skipClickDelay, false);
	}
	if(pointerSupported){
	  accordionToggles[i].addEventListener('pointerdown', skipClickDelay, false);
	}
	accordionToggles[i].addEventListener('click', switchAccordion, false);
  }
})();

</script>
</body>
</html>