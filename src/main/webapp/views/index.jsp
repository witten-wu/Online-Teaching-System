<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%= request.getContextPath() %>  
 <%  String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
    <%=basePath %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线视频播放</title>
</head>
<body>

<div id="a1">成功</div>
<button onclick="play()">播放</button>
</body>
<script type="text/javascript" src="/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
function play(){
	var flashvars={
	        f:'video/1.flv', //项目的相对路径WebContent下
	        c:0,
	        s:0,
	        p:1   
	    };
	    var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'}; 
	    CKobject.embed('../ckplayer/ckplayer.swf','a1','ckplayer_a1','600','400',false,flashvars,params);    
}
 
</script>
</html>