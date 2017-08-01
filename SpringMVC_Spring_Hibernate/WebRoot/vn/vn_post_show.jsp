<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String connect_id = request.getParameter("connect_id");   

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>帖子界面</title>

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
	href="${pageContext.request.contextPath}/css/vn_post_show.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zzsc.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qqFace.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.tn3lite.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars-jquery.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sinaFaceAndEffec.css">


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

	<script id="commentTmpl" type="text/x-handlebars-template">

		<div class="text_show">
			{{#each text}}
			<p>{{text_content}}</p>
			{{/each}}
			<div class="none"></div>
		</div>
	
		<div class="image_show">
			<div id="content">
				<div class="mygallery clearfix">
					<div class="tn3 album">
						<h4>Fixed Dimensions</h4>
						<div class="tn3 description">Images with fixed dimensions</div>
						<div class="tn3 thumb">${pageContext.request.contextPath}/upload/07.jpg</div>
						<ol>
							{{#each image}}
							<li> <a
								href="<%=basePath%>upload/{{image_url}}"> <img
									src="<%=basePath%>upload/{{image_url}}" />
							</a>
							</li>
							{{/each}}
						</ol>
					</div>
				</div>
			</div>
		</div>

		<div class="video_show">
			{{#each video}}
			<video class="video_position"
				src="<%=basePath%>upload/{{video_url}}"
				controls="controls" width="620px" length="425px"></video>
			{{/each}}

	<div class="media ping">
		<a class="media-left" href="#"> <img class="media-object"
			src="image/07.jpg" style="width:50px;height:50px;" alt="媒体对象">
		</a>
		<div class="media-body">
			<h4 class="media-heading" style="font-family:STXingkai;">透明人</h4>
				<form id="fileForm" role="form" method="post">
					<textarea id="area" name="area" placeholder="无需账号即可评论" style="font-size:18px;color:#c3b7b5;" class="form-control" rows="8"></textarea>
					<button style="margin-left:340px;" class="butt btn btn-success btn-sm">提交</button>
					<span class="emotion btn btn-success btn-sm">表情</span>
				</form>
		</div>
	</div>	

  	<div class="comment">

  	</div>
	
	<div class="yanchang"></div>

	</div>

	</script>

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
		Handlebars.registerHelper("transform", function(str) {
			str = str.replace(/\</g, '&lt;');

			str = str.replace(/\>/g, '&gt;');

			str = str.replace(/\n/g, '<br/>');

			str = str.replace(/\[em_([0-9]*)\]/g,
					'<img src="arclist/$1.gif" border="0" />');

			return str;
		});
	</script>

	<script id="comm" type="text/x-handlebars-template">
	{{#each comment}}
		{{#compare ${param.post_id} c_vn_post_id }}
		<div class="media comfather">
			<a class="media-left"> <img class="media-object"
			src="image/07.jpg" style="width:50px;height:50px;" alt="媒体对象">
			</a>
			<div class="media-body">
				<h4 class="media-heading" style="font-family:STXingkai;font-size:15x;color:#151414">透明人</h4>
				{{#transform area }}
				{{/transform}}
				<button class="huifu btn btn-default btn-xs" style="margin-top:10px;" value="{{c_id}}">回复</button>
				{{#each ../../comment_son}}
					{{#compare fa_id ../../c_id}}
						<div class="media">
							<a class="media-left"> <img class="media-object"
								src="image/07.jpg" style="width:50px;height:50px;" alt="媒体对象">
							</a>
							<div class="media-body">
								<h4 class="media-heading" style="font-family:STXingkai;font-size:15x;color:#151414">透明人</h4>
								{{../son_area}}
							</div>
						</div>					
					{{else}}
					{{/compare}}
				{{/each}}
			</div>
		</div>
		{{else}}
		{{/compare}}
	{{/each}}
</script>

	<script type="text/javascript">
		//查看结果
	</script>

	<script>
		$(document)
				.ready(
						function() {
							var text_d = text_getall();
							console.log("最终text:" + text_d);
							var image_d = image_getall();
							console.log("最终image:" + image_d);
							var video_d = video_getall();
							console.log("最终video:" + video_d);
							var master = {
								text : text_d,
								image : image_d,
								video : video_d
							};
							console.log(master);
							var template = $("#commentTmpl").template(master)
									.appendTo("body");

							var tn1 = $('.mygallery').tn3({
								skinDir : "skins",
								imageClick : "fullscreen",
								image : {
									maxZoom : 1.5,
									crop : true,
									clickEvent : "dblclick",
									transitions : [ {
										type : "blinds"
									}, {
										type : "grid"
									}, {
										type : "grid",
										duration : 460,
										easing : "easeInQuad",
										gridX : 1,
										gridY : 8,
										// flat, diagonal, circle, random
										sort : "random",
										sortReverse : false,
										diagonalStart : "bl",
										// fade, scale
										method : "scale",
										partDuration : 360,
										partEasing : "easeOutSine",
										partDirection : "left"
									} ]
								}
							});

							$('.emotion').qqFace({

								id : 'facebox',

								assign : 'area',

								path : 'arclist/' //表情存放的路径

							});

							function replace_em(str) {

								str = str.replace(/\</g, '&lt;');

								str = str.replace(/\>/g, '&gt;');

								str = str.replace(/\n/g, '<br/>');

								str = str
										.replace(/\[em_([0-9]*)\]/g,
												'<img src="arclist/$1.gif" border="0" />');

								return str;

							}

							var comment_d = comment_get();
							console.log("comment:" + comment_d);
							var comment_son_d = comment_son_get();
							var masterr = {
								comment : comment_d,
								comment_son : comment_son_d
							};
							console.log("comment的boss:" + masterr);
							var template = $("#comm").template(masterr)
									.appendTo(".comment");

							$(".butt").click(function() {
								var a = $('#area').val();
								var b = getUrlParam("post_id");
								var params = {};
								params.post_id = b;
								params.area = a
								$.ajax({
									type : "POST",
									async : false,
									url : "aedd",
									data : params,
									dataType : "json",
									success : function(data, status) {
										console.log("text返回的:" + data);
										result = data;
									}
								});

							});

							$(".huifu")
									.click(
											function() {
												var a = $(this).val();/*父评论id*/
												var name = prompt("请开始你的表演:",
														"");
												var b = getUrlParam("post_id");/*帖子id*/
												if (name != null && name != "") {
													var params = {};
													params.fa_id = a;
													params.son_area = name;
													params.post_id = b;
													$
															.ajax({
																type : "POST",
																async : false,
																url : "addsoncom",
																data : params,
																dataType : "json",
																error : function(
																		data,
																		status) {
																	window.location.href = "vn/vn_post_show.jsp?post_id="
																			+ b
																			+ "";
																}
															});
												}
											});

							function comment_get() {
								var result;
								$.ajax({
									type : "POST",
									async : false,
									url : "gall",
									dataType : "json",
									success : function(data, status) {
										result = data;
									}
								});
								return result;
							}

							function comment_son_get() {
								var result;
								$.ajax({
									type : "POST",
									async : false,
									url : "gallson",
									dataType : "json",
									success : function(data, status) {
										result = data;
									}
								});
								return result;
							}

							function text_getall() {
								var a = getUrlParam("post_id");
								console.log("text的 a:" + a);
								var params = {};
								params.post_id = a;
								var result;
								$.ajax({
									type : "POST",
									async : false,
									url : "text/getalltext",
									data : params,
									dataType : "json",
									success : function(data, status) {
										console.log("text返回的:" + data);
										result = data;
									}
								});
								return result;
							}

							function image_getall() {
								var a = getUrlParam("post_id");
								console.log("image的a:" + a);
								var params = {};
								params.post_id = a;
								var result;
								$.ajax({
									type : "POST",
									async : false,
									url : "image/getallimage",
									data : params,
									dataType : "json",
									success : function(data, status) {
										console.log("image返回的:" + data);
										result = data;
									}
								});
								return result;
							}

							function video_getall() {
								var a = getUrlParam("post_id");
								console.log("video的a:" + a);
								var params = {};
								params.post_id = a;
								var result;
								$.ajax({
									type : "POST",
									async : false,
									url : "video/getallvideo",
									data : params,
									dataType : "json",
									success : function(data, status) {
										console.log("video返回的:" + data);
										result = data;
									}
								});
								return result;
							}

							function getUrlParam(name) {
								var reg = new RegExp("(^|&)" + name
										+ "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
								var r = window.location.search.substr(1).match(
										reg); //匹配目标参数
								if (r != null)
									return unescape(r[2]);
								return null; //返回参数值
							}

						});
	</script>

</body>
</html>
