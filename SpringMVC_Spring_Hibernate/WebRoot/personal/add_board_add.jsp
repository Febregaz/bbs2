<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加板块</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/add_board_edit.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/vn_post.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars-jquery.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">

<script id="commentTmpl" type="text/x-handlebars-template">
	{{#each board}}
		<div class="editboard">
		<div class="son">
			<span class="aa label label-danger">板块ID</span><input type="text"
				disabled class="a ca text-control" value="{{board_id}}" />
		</div>
		<div class="son">
			<span class="ab label label-danger">板块描述</span><input type="text"
				class="a cb text-control" value="" />
		</div>
		<div class="son">
			<span class="ab label label-danger">板块名称</span><input type="text"
				class="a cc text-control" value="" />
		</div>
		<div class="son">
			<span class="label label-danger">DearJhon</span><input type="text"
				class="a cd text-control" value="" />
		</div>
		<div class="son">
			<span class="ab label label-danger">主题数目</span><input type="text"
				class="a ce text-control" value="" />
		</div>
		<div class="son">
			<span class="ab label label-danger">是否私密</span><input type="text"
				class="a cf text-control" value="" />
		</div>
		<br>
		<button onclick="goboardc()" class="sb nb btn btn-danger btn-sm">
			提交<span class="fa fa-eraser"></span>
		</button>
		<div class="clear"></div>
	</div>
	{{/each}}
</script>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">617博物馆</a>
		</div>
		<div>
			<button type="button" class="btn btn-default navbar-btn haodongxi">
				好东西</button>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${sessionScope.user_name!=null}">
					<li><a class="llii"
						href="personal/personal.jsp?user_id=${sessionScope.user_name.user_id}"><span
							class="glyphicon glyphicon-home"></span>${sessionScope.user_name.user_name}</a></li>
					<li><a class="llii" href="user/logout"><span
							class="glyphicon glyphicon-log-out"></span> 登出</a></li>
				</c:when>
				<c:otherwise>
					<li><a class="llii regist" href="#"><span
							class="glyphicon glyphicon-user"></span> 注册</a></li>
					<li><a class="llii"
						href="${pageContext.request.contextPath}/login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> 登录</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</nav>



	<script type="text/javascript">
		$(document).ready(
				function() {
					$.ajax({
						type : "POST",
						async : false,
						url : "board/checkmaxid",
						dataType : "json",
						success : function(data, status) {
							var master = {
								board : data
							};
							var template = $("#commentTmpl").template(master)
									.appendTo("body");
						}
					});
				});

		function goboardc() {
			var result;
			var params = {};
			params.board_id = $('.ca').val();
			params.board_desc = $('.cb').val();
			params.board_name = $('.cc').val();
			params.dearjhon = $('.cd').val();
			params.topic_num = $('.ce').val();
			params.privacy = $('.cf').val();
			$.ajax({
				type : "POST",
				async : false,
				url : "board/addboard",
				data : params,
				dataType : "json",
				error : function(data, status) {
					window.location.href = 'personal/add_board.jsp';
				}
			});
			return result;
		}
	</script>
	
	<script type="text/javascript">
		$(".haodongxi").click(function() {
			alert("好东西正在路上...");
		});
		$(".regist").click(function(){
			alert("好东西正在路上...");
		});
	</script>

</body>
</html>
