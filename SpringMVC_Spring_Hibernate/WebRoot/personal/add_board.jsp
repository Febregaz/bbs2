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

<title>板块主界面</title>

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
	href="${pageContext.request.contextPath}/css/boardtable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/vn_post.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
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
		<div class="boardtable">
		<table class="table table-bordered table-hover">

			<thead>
				<tr>
					<th class="text-center"><span class="fa fa-table"></span></th>
					<th class="text-center">board_id</th>
					<th class="text-center">board_desc</th>
					<th class="text-center">board_name</th>
					<th class="text-center">dearjhon						<button class="a btn btn-danger btn-xs" data-toggle="tooltip"
							title="关系到board伸缩功能的实现，请按原有的数字顺序排序下去">
							<span class="fa fa-question"></span>
						</button></th>
					<th class="text-center">topic_num</th>
					<th class="text-center">privacy</th>
					<th class="text-center">相关操作</th>
					<th class="text-center">相关操作</th>
				</tr>
			</thead>
			<tbody>
				{{#each board}}
				<tr class="danger myclass">
					<td class="text-center"><span class="fa fa-table"></span></td>
					<td class="text-center id">{{board_id}}</td>
					<td class="text-center desc">{{board_desc}}</td>
					<td class="text-center name">{{board_name}}</td>
					<td class="text-center dear">{{dearjhon}}</td>
					<td class="text-center num">{{topic_num}}</td>
					<td class="text-center num">{{privacy}}</td>
					<td class="text-center">
						<button class="a btn btn-danger btn-sm" data-toggle="tooltip"
							title="修改">
							<span class="fa fa-eraser"></span>
						</button>
					</td>
					<td>
						<button class="b btn btn-danger btn-sm" data-toggle="tooltip"
							title="删除">
							<span class="fa fa-scissors"></span>
						</button>
					</td>
				</tr>
				{{/each}}
			</tbody>
		</table>
	</div>

	<button class="nb btn btn-danger btn-sm" onclick="javascript:window.open('personal/add_board_add.jsp');">
		新增<span class="fa fa-save"></span>
	</button>

	<button class="nbb btn btn-danger btn-sm" onclick="nbb()">
		疑问<span class="fa fa-question"></span>
	</button>
	
</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var board_d = board_getall();
						var master = {
							board : board_d
						};
						console.log("d:" + master);
						var template = $("#commentTmpl").template(master)
								.appendTo("body");

						$("button")
								.click(
										function() {
											//$(this).parent().parent().children("td").get(1).innerHTML;
											var id = $(this).parent().parent()
													.children("td").get(1).innerHTML;
											var desc = $(this).parent()
													.parent().children("td")
													.get(2).innerHTML;
											var name = $(this).parent()
													.parent().children("td")
													.get(3).innerHTML;
											var dearjhon = $(this).parent()
													.parent().children("td")
													.get(4).innerHTML;
											var num = $(this).parent().parent()
													.children("td").get(5).innerHTML;
											var pan = $(this).parent().index();
											if (pan == 6) {
												window.location.href = 'personal/add_board_edit.jsp?bid='
														+ id
														+ '&bdesc='
														+ desc
														+ '&bname='
														+ name
														+ '&dear='
														+ dearjhon
														+ '&bnum=' + num + '';
											} else if(pan==7) {
												var r = confirm("确定要删除Board"
														+ " " + id + "的板块吗？");
												if (r == true) {
													var params = {};
													params.board_id = id;
													$
															.ajax({
																type : "POST",
																async : false,
																url : "board/deleteboard",
																data : params,
																dataType : "json",
																error : function(
																		data,
																		status) {
																	window.location.href = 'personal/add_board.jsp';
																}
															});
												} else {
													
												}
											}
											else{
												window.location.href = 'personal/add_topic_edit.jsp?bid='+id+'';
											}
										});

						/*上面代码的鼻祖程序 			$(".myclass").each(
						 function() {

						 var tmp = $(this).children().eq(7);
						 var btn = tmp.children();

						 btn.bind("click", function() {

						 var id = btn.parent().parent().children("td")
						 .get(1).innerHTML;
						 var name = btn.parent().parent().children("td")
						 .get(2).innerHTML;
						 var age = btn.parent().parent().children("td")
						 .get(3).innerHTML;
						 alert("id=" + id + "  name=" + name + " age="
						 + age);

						 });

						 }); */

					});

	function board_getall() {
		var result;
		$.ajax({
			type : "POST",
			async : false,
			url : "board/getallboard",
			dataType : "json",
			success : function(data, status) {
				console.log(data);
				result = data;
			}
		});
		return result;
	}

	function nbb() {
		layer.open({
			type : 1,
			area : [ '600px', '360px' ],
			shadeClose : true, //点击遮罩关闭
			content : '\<\div style="padding:20px;">此功能为管理员特有，dearjhon的规律如下，dearjhon,dearjhon1,dearjhon2,dearjhon3,dearjhon4...以此类推.另外，主键空留问题我还没有解决...\<\/div>'
		});
	}
</script>

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

	<script>
		$(function() {
			$("[data-toggle='tooltip']").tooltip();
		});
	</script>

</body>
</html>
