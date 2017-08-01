<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'upload.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
</head>

<body>
	<!-- 	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" /> <input type="submit" value="Submit" />
	</form> -->

	<form id="fileForm" method="post" enctype="multipart/form-data"
		action="uploaderr">
		文件名称：<input name="fileName" type="text"><br /> 上传文件：<input
			name="myfile" type="file"><br /> <input id="submitBtn"
			type="submit" value="提交">
	</form>
	<script type="text/javascript">
		$(function() {
			var index;
			$("#fileForm").ajaxForm({
				//定义返回JSON数据，还包括xml和script格式
				dataType : 'json',
				beforeSend : function() {
					//表单提交前做表单验证
					index = layer.load(0, {shade: false});
				},
				success : function(data) {
					//提交成功后调用
					layer.close(index);
					alert("I LOVE YOU");
				}
			});
		});
	</script>

</body>
</html>
