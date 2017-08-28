<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jxust.svsh.entity.User"%>
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
<meta name="baidu-site-verification" content="ebAx8gG0A0" />
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

<script type="text/javascript">
	Handlebars.registerHelper("ma", function(v1) {
		var a=encodeURI(encodeURI(v1));
		return a;
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
								<img alt="" src="myimage/{{image_url}}" class="img-circle" /> <a href="{{topic_post_url}}&topic_title={{#ma topic_title}}{{/ma}}">{{topic_title}}</a>
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
								<img alt="" src="myimage/{{image_url}}" class="img-circle" /> <a href="{{topic_post_url}}&topic_title={{#ma topic_title}}{{/ma}}">{{topic_title}}</a>
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
								<img alt="" src="myimage/{{image_url}}" class="img-circle" /> <a href="{{topic_post_url}}&topic_title={{#ma topic_title}}{{/ma}}">{{topic_title}}</a>
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
	<p class="dplay">617博物馆？</p>
	<img src="image/hand in hand.jpg" class="introduce" />
	<div id="circle" class="intro"><span class="fa fa-bug fa-3x" style="margin-top:10px;margin-left:15px;"></span><div class="font-intro"><p class="zi">程序员难免会遇到bug，bug不可怕，可怕的是懒。</p></div></div>
	<div id="circle" class="intro1"><span class="fa fa-bomb fa-3x" style="margin-top:10px;margin-left:15px;"></span><div class="font-intro"><p class="zi">记录自己的猛然醒悟</p></div></div>
	<div id="circle" class="intro2"><span class="fa fa-comment-o fa-3x" style="margin-top:10px;margin-left:15px;"></span><div class="font-intro"><p class="zi">人与人之间可以深刻交流</p></div></div>
	<div id="circle" class="intro3"><span class="fa fa-eye fa-3x" style="margin-top:10px;margin-left:15px;"></span><div class="font-intro"><p class="zi">视频才是王道，看字太累</p></div></div>
	<p class="ddplay">对我影响深刻的。。。</p>
	<div class="blockk"><a href="http://www.360doc.com/showweb/0/0/682833719.aspx"><img src="image/english.jpg" class="deep" /><p class="zi">不懂英语，造就13亿人的信息孤岛</p></a></div>
	<div class="blockk1"><a href="https://git-scm.com/book/zh/v2"><img src="image/git.jpg" class="deep" /><p class="zi" style="margin-left:80px;">GIT-BOOK</p></a></div>
	<p class="dddplay">与我联系</p>
	<div class="QQ">
		<div id="circle" class="c1"><span class="fa fa-qq fa-3x" style="margin-top:10px;margin-left:15px;"></span></div>
		<p class="qzi">1844927304</p>
	</div>
	<div class="Tel">
		<div id="circle" class="c2"><span class="fa fa-phone fa-3x" style="margin-top:10px;margin-left:18px;"></span></div>
		<p class="tzi">18818429769</p>
	</div>
	<div class="Email">
		<div id="circle" class="c3"><span class="fa fa-google fa-3x" style="margin-top:10px;margin-left:18px;"></span></div>
		<p class="ezi">febregazz@gmail.com</p>
	</div>
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var topic_d = topic_getall();
		var board_d = board_getall();
		var user_d = user_getall();
		var master = {
			board : board_d,
			topic : topic_d,
			user : user_d
		};
		var template = $("#commentTmpl").template(master).appendTo("body");
		//var template = $("#commentTmpl").template(topic_d).appendTo(".block_bored");
		
		$(".haodongxi").click(function(){
			alert("好东西正在完善中...");
			window.open ('http://sites.simbla.com/8f9cec59-5aef-95ab-01dd-3282b6d062da/Home');
		});
		
		$(".regist").click(function(){
			alert("注册暂停...");
		});

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
			<form class="navbar-form navbar-left" role="search" action="vnpost/sou" method="post">
				<div class="form-group">
					<input type="text" name="sousuo" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
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
				<img src="image/explicit innocence2.png" alt="">
				<div class="carousel-caption">KBS--explicit innocence</div>
			</div>
			<div class="item">
				<img src="image/1708091.png" alt="">
				<div class="carousel-caption">python爬虫初涉</div>
			</div>
			<div class="item">
				<img src="image/yumingbangding.png" alt="">
				<div class="carousel-caption">域名的解析和服务器绑定</div>
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
	<p class="dplay">陈列馆</p>
	<audio class="playmusic" controls="controls" autoplay="autoplay"> 
		<source src="myimage/Rainyseason.mp3" type="audio/mpeg" /> Your browser does not support the audio element.
	</audio>

</body>
</html>
