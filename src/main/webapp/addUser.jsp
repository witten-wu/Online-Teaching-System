<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<title>老师主页</title>
<script src="bootstrap/js/modernizr.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="bootstrap/css/reset.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/demo2.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/style3.css">
</head>
<body>
    <div class="container" style="margin-top: 10px">
        <div class="row clearfix">
        	<div class="col-md-12">
        		<jsp:include page="header.jsp"/>
        	</div>
        </div>
        <div class="row clearfix" style="margin: 10px 0 0 -10px">
            <div class="col-md-2">
				<jsp:include page="slideBarTeacher.jsp"/>
            </div>
            <div class="containe">
            <div class="accordion">
			<dl id="piano">
			<script type="text/javascript">	
		var str="";
		$.ajax({
			url:"./user/showQuestion2",
			type:"POST",
			datatype:"json",
			success:function(data){
				data=JSON.parse(data);
				dataList =data.data;
				if(data.code==1){
					for(var i=0;i<dataList.length;i++){
						str1=dataList[i].question;
						str2=dataList[i].answer;
						str14=dataList[i].questionid+" ";
						str17="text"+dataList[i].questionid+" ";
						str3='<textarea rows="5" cols="120" id=';
						str16='style="margin:10px 10px 10px 10px;float:left">';
						str4='</textarea>';
						str5='<button class="btn-warning btn-lg btn-block" id=';
						str15='style="float:left;margin-top:10px;width:60px;height:110px;" onclick=answer(this)>';
						str6='提交';
						str7='</button>';
						str8='<dt>';
						str9='<a href="#accordion1" aria-expanded="false" aria-controls="accordion1" class="accordion-title accordionTitle js-accordionTrigger">';
						str10='</a>';
						str11='</dt>';
						str12='<dd class="accordion-content accordionItem is-collapsed" id="accordion2" aria-hidden="true">';
						str13='</dd>';
						if(str2==null){
							var box=document.getElementById("piano")
							str +=str8+str9+str1+str10+str11+str12+str3+str17+str16+str4+str5+str14+str15+str6+str7+str13;
							box.innerHTML=str;
						}
					}	
				}else if(data.code==0){
					alert(data.msg);
				}
			}
		});
		function answer(obj){
			var questionid=obj.id;
			textId = "#text"+questionid;
			textCot = $(textId).val();
			$.ajax({
				url:"./admin/addAnswer",
				type:"POST",
				data:{"questionid":questionid,"answer":textCot},
				datatype:"json",
				success:function(data){
					data=JSON.parse(data);
					if(data.code==1){
						window.location.reload();
					}else if(data.code==0){
						alert(data.msg);
					}
				}
			});
		};
		</script>
			</dl>
			</div>
			</div>
			<jsp:include page="footer.jsp"/>
        </div>
    </div>
</body>
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
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
</html>