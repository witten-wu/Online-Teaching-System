<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数学教案</title>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/kityformula-plugin/addKityFormulaDialog.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/kityformula-plugin/getKfContent.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/kityformula-plugin/defaultFilterFix.js"></script>
<link rel="stylesheet" href="ueditor/themes/default/css/ueditor.css">
<style type="text/css">
div {
	width: 100%;
}
</style>

</head>
<body>
	<form action="/springmvc_demo_02/test" id="form" method="post">
		<h1>
			教案名称：<input type="text" name="title" class="textField" />
		</h1>
		<hr />
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
				<td class="key">四、预设教学路线图：</td>
			</tr>
			<tr>
				<td><textarea id="content4" name="content4"
						style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td class="key">五、教学过程：</td>
			</tr>
			<tr>
				<td><textarea id="content5" name="content5"
						style="width: 800px; height: 400px; margin: 0 auto;"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="提交"/></td>
			</tr>
		</table>
		<button onclick="ReplaceImage()">imagebase64替换为image</button>
	<button onclick="getContent()">获得内容</button>
	</form>
	
</body>
<script type="text/javascript">
			var ue1 = UE.getEditor('content1', {
				//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
				toolbars : [ [ 'fullscreen', 'source', 'undo', 'redo', 'bold',
						'italic', 'underline', 'fontborder', 'backcolor',
						'fontsize', 'fontfamily', 'justifyleft',
						'justifyright', 'justifycenter', 'justifyjustify',
						'strikethrough', 'superscript', 'subscript',
						'removeformat','kityformula' ] ],
				//关闭字数统计
				wordCount : false,
				//关闭elementPath
				elementPathEnabled : false,
				//默认的编辑区域高度
				initialFrameHeight : 300 
			//更多其他参数，请参考ueditor.config.js中的配置项
			});
			function ReplaceImage() {
				ue1.getKfContent(function(content) {
				});//将image的src从base64替换为文件名
			}
			function getContent() {
			var arr = [];
			arr.push("使用editor.getContent()方法可以获得编辑器的内容");
			arr.push("内容为：");
			arr.push(UE.getEditor('content1').getContent());
			alert(arr.join("\n"));
		}
			var ue2 = UE.getEditor('content2', {
				//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
				toolbar : [ [ 'fullscreen', 'source', 'undo', 'redo', 'bold',
						'italic', 'underline', 'fontborder', 'backcolor',
						'fontsize', 'fontfamily', 'justifyleft',
						'justifyright', 'justifycenter', 'justifyjustify' ] ],
				//focus时自动清空初始化时的内容

				//关闭字数统计
				wordCount : false,
				//关闭elementPath
				elementPathEnabled : false,
				//默认的编辑区域高度
				initialFrameHeight : 300
			//更多其他参数，请参考ueditor.config.js中的配置项
			});
			var ue3 = UE.getEditor('content3', {
				//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
				toolbar : [ [ 'fullscreen', 'source', 'undo', 'redo', 'bold',
						'italic', 'underline', 'fontborder', 'backcolor',
						'fontsize', 'fontfamily', 'justifyleft',
						'justifyright', 'justifycenter', 'justifyjustify',
						'strikethrough', 'superscript', 'subscript',
						'removeformat' ] ],
				//focus时自动清空初始化时的内容

				//关闭字数统计
				wordCount : false,
				//关闭elementPath
				elementPathEnabled : false,
				//默认的编辑区域高度
				initialFrameHeight : 300
			//更多其他参数，请参考ueditor.config.js中的配置项
			});
			UE.getEditor("content4");
			UE.getEditor("content5");
		
		</script>
</html>
