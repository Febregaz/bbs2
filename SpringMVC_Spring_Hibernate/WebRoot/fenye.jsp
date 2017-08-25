<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'fenye.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="dist/pagination.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/dist/pagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars-jquery.js"></script>

</head>

<body>
	<div id="data-container"></div>
	<div id="pagination-container"></div>

	<script type="text/x-handlebars-template" id="template-demo">
    <ul>
    	{{#each comment}}
       		<li>{{area}}</li>
    	{{/each}}
    </ul>
</script>

	<script type="text/javascript">
		$('#pagination-container').pagination({
			pageSize :4,
			className: 'paginationjs-theme-blue',
			dataSource : function(done) {
/* 				$.ajax({
					type : 'POSt',
					url : 'gall',
					success : function(response) {
						done(response);
					}
				}); */
				$.when(  
   						$.getJSON('gallson'),   
    					$.getJSON('gall')  
					).then(function(a,b) {
						console.log("a:"+a);
						console.log("b:"+b);    
						done(a+b);						
				});
			},
			callback : function(data, pagination) {
				// template method of yourself
				console.log("data:"+data);
				var master={
					comment:data
				}
				console.log("master:"+master);
				var template = $("#template-demo").template(master);
				$('#data-container').html(template);
			},
		});

	</script>

</body>
</html>
