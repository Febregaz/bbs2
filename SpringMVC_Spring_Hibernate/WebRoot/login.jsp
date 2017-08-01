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

<title>登陆。。。</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" id="css" />
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/login.js"></script>

<style>
@-webkit-keyframes progressbar {
  0% {
    width: 0%;
    background-color: black;
  }
  10% {
    width: 34%;
  }
  21% {
    width: 40%;
  }
  29% {
    width: 40%;
    background-color: black;
  }
  57% {
    width: 64%;
  }
  70% {
    width: 82%;
  }
  84% {
    width: 82%;
    background-color: black;
  }
  100% {
    width: 100%;
  }
}

.progress {
  height: 15px;
  border-radius: 10px;
  background-color: #E6E6E6;
  box-shadow: inset 14px 15px 10px rbga(0, 0, 0, 0.9);
}
#progress-1 {
  -webkit-animation-name: progressbar;
  animation-name: progressbar;
  -webkit-animation-iteration-count: infinite;
  animation-iteration-count: infinite;
  -webkit-animation-timing-function: ease;
  animation-timing-function: ease;
  -webkit-animation-delay: 15s;
  animation-delay: 3600s;
  -webkit-animation-duration: 34s;
  animation-duration: 0.1s;
  -webkit-animation-direction: normal;
  animation-direction: normal;
}	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(".progress").hide();
		$("#loginbtn").click(function(){
			$(".progress").show();
			$("#progress-1").animate({'animation-delay':'0.01s'});
			alert("欢迎来到617博物馆");
		});
	});
</script>

</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<form action="user/login" method="post">
				<div class="loginpanel">
					<i id="loading" class="fa fa-spin fa-spinner bigicon hidden"></i>
					<h2>
						<span class="fa fa-quote-right"></span> 登录 <span
							class="fa fa-quote-right"></span>
					</h2>
					<div>
						<input id="username" name="user_id" type="text" placeholder="登录账号"
							onkeypress="check_value();" /> <input id="password"
							type="password" name="password" placeholder="输入密码"
							onkeypress="check_value();" />
						<div class="buttonwrapper">
							<input id="loginbtn" class="btn btn-warning loginbutton"
								type="submit" value="登录" /> <span id="lockbtn"
								class="lockbutton redborder fa fa-lock"></span>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="progress">
		<div role="progressbar" aria-valuenow="0" aria-valuemin="0"
			aria-valuemax="100" style="width: 0%" id="progress-1"
			class="progress-bar"></div>
	</div>
</body>
</html>
