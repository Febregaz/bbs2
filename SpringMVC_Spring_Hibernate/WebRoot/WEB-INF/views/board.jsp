<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jxust.svsh.entity.User" %>
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

<title>617 museum</title>

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
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/carousel.css">
<link href="${pageContext.request.contextPath}/css/bored.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bored.js"></script>


<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars-jquery.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sinaFaceAndEffec.css">
	

<script type="text/javascript">
	Handlebars.registerHelper("compare", function(v1, v2, options) {
		if (v1 == v2) {
			//满足添加继续执行
			return options.fn(this);
		} else {
			//不满足条件执行{{else}}部分
			return options.inverse(this);
		}
	});
</script>

<script type="text/javascript">
	Handlebars.registerHelper("comparee", function(v1, v2, options) {
		if (v1 >= v2) {
			//满足添加继续执行
			return options.fn(this);
		} else {
			//不满足条件执行{{else}}部分
			return options.inverse(this);
		}
	});
</script>

<script id="commentTmpl" type="text/x-handlebars-template">
	{{#each board}}
		<c:choose>
		<c:when test="${sessionScope.user_name!=null}">
		{{#comparee ${sessionScope.user_name.user_type} 1}}
		<div class="container-fluid">
		<div class="row">
			<div class="head_bored">
				<div class="title">
					<p>{{board_name}}</p>
				</div>
				<button class="pulldown" onclick="presspulldown('{{dearjhon}}');">
					<span class="fa fa-hand-o-down"></span>
				</button>
			</div>
			<div id="{{dearjhon}}">
				<div class="block_bored">
					{{#each ../../topic}}
						{{#compare b_id ../../board_id}}
							<div class="content_bored">
								<img alt="" src="myimage/{{image_url}}" /> <a href="{{topic_post_url}}">{{topic_title}}</a>
								<p>主题:{{topic_son_num}}</p>
							</div>
						{{else}}
						{{/compare}}
					{{/each}}
					<div class="clear"></div>
				</div>
			</div>
		</div>
		</div>
		{{else}}
		{{#compare privacy 0 }}
		<div class="container-fluid">
		<div class="row">
			<div class="head_bored">
				<div class="title">
					<p>{{board_name}}</p>
				</div>
				<button class="pulldown" onclick="presspulldown('{{dearjhon}}');">
					<span class="fa fa-hand-o-down"></span>
				</button>
			</div>
			<div id="{{dearjhon}}">
				<div class="block_bored">
					{{#each ../../../topic}}
						{{#compare b_id ../../board_id}}
							<div class="content_bored">
								<img alt="" src="myimage/{{image_url}}" /> <a href="{{topic_post_url}}">{{topic_title}}</a>
								<p>主题:{{topic_son_num}}</p>
							</div>
						{{else}}
						{{/compare}}
					{{/each}}
					<div class="clear"></div>
				</div>
			</div>
		</div>
		</div>
		{{else}}
		{{/compare}}
		{{/comparee}}
		</c:when>
		<c:otherwise>
				{{#compare privacy 0 }}
		<div class="container-fluid">
		<div class="row">
			<div class="head_bored">
				<div class="title">
					<p>{{board_name}}</p>
				</div>
				<button class="pulldown" onclick="presspulldown('{{dearjhon}}');">
					<span class="fa fa-hand-o-down"></span>
				</button>
			</div>
			<div id="{{dearjhon}}">
				<div class="block_bored">
					{{#each ../../topic}}
						{{#compare b_id ../../board_id}}
							<div class="content_bored">
								<img alt="" src="myimage/{{image_url}}" /> <a href="{{topic_post_url}}">{{topic_title}}</a>
								<p>主题:{{topic_son_num}}</p>
							</div>
						{{else}}
						{{/compare}}
					{{/each}}
					<div class="clear"></div>
				</div>
			</div>
		</div>
		</div>
		{{else}}
		{{/compare}}
		</c:otherwise>
		</c:choose>
	{{/each}}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var topic_d = topic_getall();
		console.log(topic_d);
		var board_d = board_getall();
		console.log(board_d);
		var user_d = user_getall();
		console.log(user_d);
		var master = {
			board : board_d,
			topic : topic_d,
			user : user_d
		};
		console.log("d:" + master);
		var template = $("#commentTmpl").template(master).appendTo("body");
		//var template = $("#commentTmpl").template(topic_d).appendTo(".block_bored");

	});
	function board_getall() {
		var result;
		$.ajax({
			type : "POST",
			async : false,
			url : "board/getallboard",
			dataType : "json",
			success : function(data, status) {
				//console.log("a");
				//console.log(data);
				//console.log("b");
				//var de = eval("(" + data + ")");
				//console.log("c");
				//console.log(de);
				//console.log("d");
				//				var d = {
				//					board : data
				//				};
				console.log(data);
				result = data;
			}
		});
		return result;
	}
	function topic_getall() {
		var result;
		$.ajax({
			type : "POST",
			async : false,
			url : "topic/getalltopic",
			dataType : "json",
			success : function(data, status) {
				//console.log(data);
				//				var d = {
				//					topic : data
				//				};
				console.log(data);
				result = data;
			}
		});
		return result;
	}

	function user_getall() {
		var result;
		$.ajax({
			type : "POST",
			async : false,
			url : "user/getalluser",
			dataType : "json",
			success : function(data, status) {
				console.log(data);
				result = data;
			}
		});
		return result;
	}
</script>

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">617博物馆</a>
		</div>
		<div>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
			<button type="button" class="btn btn-default navbar-btn">
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
					<li><a class="llii" href="#"><span
							class="glyphicon glyphicon-user"></span> 注册</a></li>
					<li><a class="llii"
						href="${pageContext.request.contextPath}/login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> 登录</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</nav>

	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="image/jinx1.jpg" alt="">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="image/hand in hand.jpg" alt="">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="image/vn2.jpg" alt="">
				<div class="carousel-caption"></div>
			</div>
		</div>

		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

</body>
</html>
