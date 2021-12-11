<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MediaPlayer播放</title>
</head>
<body>
<object id="MediaPlayer" classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" width="800" height="600" standby="Loading Windows Media Player components…" type="application/x-oleobject" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,7,1112">
    <param name="FileName" value="${contextPath}/${t4}">
    <param name="AutoStart" value="true">
    <param name="ShowControls" value="true">
    <param name="BufferingTime" value="2">
    <param name="ShowStatusBar" value="true">
    <param name="AutoSize" value="true">
    <param name="InvokeURLs" value="false">
    <param name="AnimationatStart" value="1">
    <param name="TransparentatStart" value="1">
    <param name="Loop" value="1">
    <embed type="application/x-mplayer2" src="${contextPath}/${t4}" name="MediaPlayer" autostart="1" showstatusbar="1" showdisplay="1" showcontrols="1" loop="0" videoborder3d="0" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" width="800" height="600"></embed>
  </object>
</body>
</html>