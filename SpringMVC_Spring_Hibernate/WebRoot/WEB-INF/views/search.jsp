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

<title>Search result</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/vn_post.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
</head>

<script type="text/javascript">
		$(".regist").click(function(){
			alert("注册暂停...");
		});
		$(".haodongxi").click(function(){
			alert("好东西正在路上...");
		});

		function a(){
			alert("好东西正在路上...");
		}
		function b(){
			alert("注册暂停...");
		}
</script>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">617博物馆</a>
		</div>
		<div>
			<button type="button" class="btn btn-default navbar-btn haodongxi" onclick="a()">
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
					<li><a class="llii regist" href="javascript:void(0);" onclick="b()"><span
							class="glyphicon glyphicon-user"></span> 注册</a></li>
					<li><a class="llii"
						href="${pageContext.request.contextPath}/login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> 登录</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</nav>

	<div class="post_land">
		<c:forEach items="${result}" var="item">
			<c:choose>
				<c:when test="${item.post_privacy==0}">
						<div class="post_title">
							<a href="JavaScript:void(0);" onclick="go('${item.post_url}','${item.vn_id}','${item.post_title}')">${item.post_title}</a>
						</div>
				</c:when>
				<c:otherwise>
					<c:if test="${sessionScope.user_name!=null}">
						<c:if test="${sessionScope.user_name.user_type>=1}">
							<div class="post_title">
								<a href="JavaScript:void(0);" onclick="go('${item.post_url}','${item.vn_id}','${item.post_title}')">${item.post_title}</a>
							</div>							
						</c:if>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<div class="none"></div>
	</div>

	<script type="text/javascript">
		function go(url,id,title){
			var post_title=encodeURI(encodeURI(title));
			window.location.href='vn/vn_post_show.jsp?post_id='+id+'&post_title='+post_title+'';
		}
	</script>

</body>
</html>
