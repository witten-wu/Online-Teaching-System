<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-body" align="center">
			<div class="panel-heading">
				<h1 class="sub-header h3">上传结果</h1>
			</div>

			<div class="row-fluid">${result}</div>
			<hr>
			<div class="row-fluid">
				<div class="col-lg-12">
					<div class="table-responsive">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>文件名称</th>
									<th>文件大小</th>
									<th>文件类型</th>
									<th>文件路径</th>
									<th>上传时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>${t1}</td>
									<td>${t2}</td>
									<td>${t3}</td>
									<td>${t4}</td>
									<td>${t5}</td>
									<td><button onclick="play()">播放</button></td>
									</td>
								</tr>

							</tbody>
						</table>

					</div>
				</div>
			</div>
			<div id="a1" align="center"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
function play(){
	var flashvars = {
			f : '${contextPath}/${t4}', //项目的相对路径WebContent下
			c : 0,
			s : 0,
			p : 1
		};
		var params = {
			bgcolor : '#FFF',
			allowFullScreen : true,
			allowScriptAccess : 'always',
			wmode : 'transparent'
		};
		CKobject.embed('/ckplayer/ckplayer.swf', 'a1', 'ckplayer_a1',
				'600', '400', false, flashvars, params);
	
}
				
</script>
</html>