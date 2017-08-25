<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>个人发布的帖子</title>

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
	
		<div class="post_land">
			{{#each post}}
				<div class="post_title">
					<a href="{{post_url}}?post_id={{vn_id}}">{{post_title}}</a>
				</div>
			{{/each}}
			<div class="none"></div>
		</div>
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var vnpost = vnpost_getbyuser();
		console.log(vnpost);
		var master = {
			post : vnpost
		};
		console.log(master);
		var template = $("#commentTmpl").template(master).appendTo("body");
	});

	function vnpost_getbyuser() {
		var a = getUrlParam("user_id");
		console.log("user的id:" + a);
		var params = {};
		params.user_id = a;
		var result;
		$.ajax({
			type : "POST",
			async : false,
			url : "vnpost/getbyuser",
			data : params,
			dataType : "json",
			success : function(data, status) {
				console.log(data);
				result = data; /*要改:传入topic的id，分清隶属于哪一个topic*/
			}
		});
		return result;
	}
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg); //匹配目标参数
		if (r != null)
			return unescape(r[2]);
		return null; //返回参数值
	}
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
	<!-- 	<div class="post_land">
		<div class="post_title">
			<a href="#">vn对线技巧</a>
		</div>
		<div class="post_title">
			<a href="#">vn的对线天敌</a>
		</div>
		<div class="post_title">
			<a href="#">vn团战须知</a>
		</div>
		<div class="post_title">
			<a href="#">vn皮肤秀</a>
		</div>
		<div class="post_title">
			<a href="#">今天玩了一把vn，秀得飞起</a>
		</div>
		<div class="none"></div>
	</div> -->
	
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
