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

<title>个人中心</title>

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
	href="${pageContext.request.contextPath}/css/personal.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css">
<link href="${pageContext.request.contextPath}/css/bored.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.tn3lite.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	{{#each user}}
		<div class="main">
		<div class="user">
			<img src="image/07.jpg" class="img-circle userimage"
				style="width:100px;height:100px;">
			<div class="username">
				<p>用户名 : {{user_name}}</p>
			</div>
			<div class="usercredit">
				<p>积分 : {{credit}}</p>
			</div>
			<div class="userlocked">
				<p>状态 : {{locked}}  (0:正常使用 1:暂停)</p>
			</div>
			<div class="usertype">
				<p>用户类型 : {{user_type}}  (0:普通用户 1:板块管理员 2:总管理员)</p>
			</div>
		</div>
			{{#compare user_type 1}}
				{{#compare user_type 2}}
					<button class="haveposted"
						onclick="javascript:window.open('personal/vn_user_post.jsp?user_id={{user_id}}');">
						<p>已发布帖子</p>
					</button>
					<button class="posted"
						onclick="javascript:window.open('personal/uploadpost.jsp?user_id={{user_id}}');">
						<p>发布帖子</p>
					</button>
					<button class="posted"
						onclick="javascript:window.open('personal/add_board.jsp?user_id={{user_id}}');">
						<p>增加板块</p>
					</button>
				{{else}}
					<button class="haveposted"
						onclick="javascript:window.open('personal/vn_user_post.jsp?user_id={{user_id}}');">
						<p>已发布帖子</p>
					</button>
					<button class="posted"
						onclick="javascript:window.open('personal/uploadpost.jsp?user_id={{user_id}}');">
						<p>发布帖子</p>
					</button>
				{{/compare}}
			{{else}}
			{{/compare}}
	</div>
	{{/each}}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var user_d = user_getall();
		console.log(user_d);
		var master = {
			user : user_d,
		};
		console.log(master);
		var template = $("#commentTmpl").template(master).appendTo("body");
		//var template = $("#commentTmpl").template(topic_d).appendTo(".block_bored");

	});
	function user_getall() {
		var a = getUrlParam("user_id");
		console.log("user_id是:" + a);
		var params = {};
		params.user_id = a;
		var result;
		$.ajax({
			type : "POST",
			async : false,
			url : "user/getoneuser",
			data : params,
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
	function getUrlParam(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg); //匹配目标参数
		if (r != null)
			return unescape(r[2]);
		return null; //返回参数值
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
					<li><a class="llii" href="personal/personal.jsp?user_id=${sessionScope.user_name.user_id}"><span
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
	<%-- 	<div class="main">
		<div class="user">
			<img src="image/07.jpg" class="img-circle userimage"
				style="width:100px;height:100px;">
			<div class="username">
				<p>用户名 : ${sessionScope.user_name}</p>
			</div>
			<div class="usercredit">
				<p>积分 : ${sessionScope.user_name}</p>
			</div>
			<div class="userlocked">
				<p>状态 : ${sessionScope.user_name}</p>
			</div>
			<div class="usertype">
				<p>用户类型 : ${sessionScope.user_name}</p>
			</div>
		</div>
			<button class="haveposted" target="menuFrame"
				onclick="menuFrame.location='login.jsp'">
				<p>已发布帖子</p>
			</button>
			<button class="posted" target="menuFrame"
				onclick="menuFrame.location='personal/uploadpost.jsp'">
				<p>发布帖子</p>
			</button>
	</div> --%>
</body>
</html>
