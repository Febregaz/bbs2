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

<title>发布界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/bootstrap-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/uploadpost.css">
<style>
body {
	padding-top: 70px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/webuploader.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/handlebars-jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/webuploader.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/dist/js/bootstrap-select.js"></script>

</head>

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


	<div class="vtitlee">
		<p>照片</p>
	</div>
	<div class="vdo">
		<!--dom结构部分-->
		<div id="uploader-demo">
			<!--用来存放item-->
			<div id="fileList" class="uploader-list"></div>
			<div id="upInfo"></div>
			<div id="filePicker">选择照片</div>
		</div>
		<div class="none"></div>
		<input class="btn btn-default btn-info" type="button" id="btn"
			value="Submit">
		<script>
			// 图片上传demo
			jQuery(function() {
				var $ = jQuery, $list = $('#fileList'),
				// 优化retina, 在retina下这个值是2
				ratio = window.devicePixelRatio || 1,
				// 缩略图大小
				thumbnailWidth = 100 * ratio, thumbnailHeight = 100 * ratio,
				// Web Uploader实例
				uploader;
				// 初始化Web Uploader
				uploader = WebUploader
						.create({
							// 自动上传。
							auto : false,
							// swf文件路径
							swf : 'js/Uploader.swf',
							// 文件接收服务端。
							server : 'uploader?user_id=${sessionScope.user_name.user_id}',
							threads : '5', //同时运行5个线程传输
							fileNumLimit : '10', //文件总数量只能选择10个 

							// 选择文件的按钮。可选。
							pick : {
								id : '#filePicker', //选择文件的按钮
								multiple : true
							}, //允许可以同时选择多个图片
							// 图片质量，只有type为`image/jpeg`的时候才有效。
							quality : 90,

						//限制传输文件类型，accept可以不写 
						/* 					accept : {
						 title : 'Images',//描述
						 extensions : 'gif,jpg,jpeg,bmp,png,zip',//类型
						 mimeTypes : 'image/*'//mime类型
						 } */
						});

				// 当有文件添加进来的时候，创建img显示缩略图使用
				uploader
						.on(
								'fileQueued',
								function(file) {
									var $li = $('<div id="' + file.id + '" class="file-item thumbnail">'
											+ '<img>'
											+ '<div class="info">'
											+ file.name + '</div>' + '</div>'), $img = $li
											.find('img');

									// $list为容器jQuery实例
									$list.append($li);

									// 创建缩略图
									// 如果为非图片文件，可以不用调用此方法。
									// thumbnailWidth x thumbnailHeight 为 100 x 100
									uploader
											.makeThumb(
													file,
													function(error, src) {
														if (error) {
															$img
																	.replaceWith('<span>不能预览</span>');
															return;
														}

														$img.attr('src', src);
													}, thumbnailWidth,
													thumbnailHeight);
								});

				// 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
				uploader.on('uploadProgress', function(file, percentage) {
					var $li = $('#' + file.id), $percent = $li
							.find('.progress span');

					// 避免重复创建
					if (!$percent.length) {
						$percent = $('<p class="progress"><span></span></p>')
								.appendTo($li).find('span');
					}

					$percent.css('width', percentage * 100 + '%');

				});

				// 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，    response：服务器返回数据
				uploader.on('uploadSuccess', function(file, response) {
					$('#' + file.id).addClass('upload-state-done');
					//console.info(response);
					$("#upInfo").html(
							"<font color='red'>" + response._raw + "</font>");
				});

				// 文件上传失败                                file:文件对象 ， code：出错代码
				uploader.on('uploadError', function(file, code) {
					var $li = $('#' + file.id), $error = $li.find('div.error');

					// 避免重复创建
					if (!$error.length) {
						$error = $('<div class="error"></div>').appendTo($li);
					}

					$error.text('上传失败!');
				});

				// 不管成功或者失败，文件上传完成时触发。 file： 文件对象
				uploader.on('uploadComplete', function(file) {
					$('#' + file.id).find('.progress').remove();
				});

				//绑定提交事件
				$("#btn").click(function() {
					console.log("上传...");
					layer.msg('玩命上传中');
					var index = layer.load(0, {
						shade : false,
						offset : '370px'
					});
					uploader.upload(); //执行手动提交
					layer.closeAll();
					console.log("上传成功");

				});

			});
		</script>
	</div>

	<div class="vtitle">
		<p>视频</p>
	</div>
	<div class="vdo">
		<!--dom结构部分-->
		<div id="uploader-demo">
			<!--用来存放item-->
			<div id="fileList" class="uploader-list"></div>
			<div id="upInfo"></div>
			<div id="filePicker">
				<form id="fileForm"
					action="uploaderr?user_id=${sessionScope.user_name.user_id}"
					method="post" enctype="multipart/form-data">
					<input type="file" name="file" class="btn btn-default btn-success" />
					<input type="submit" value="Submit"
						class="btn btn-default btn-success" id="btnn" />
				</form>
			</div>
		</div>
		<div class="none"></div>
	</div>

	<div class="vtitle">
		<p>文字</p>
	</div>
	<div class="vdo">
		<form id="myform"
			action="text/addtext?user_id=${sessionScope.user_name.user_id}"
			role="form" method="post">
			<div class="form-group">
				<label for="name">想说些什么吗？</label>
				<textarea name="area" class="form-control" rows="5"></textarea>
			</div>
			<input type="submit" value="Submit"
				class="btn btn-default btn-warning font" />
		</form>
	</div>

	<script type="text/javascript">
		$(function() {
			var index;
			$("#fileForm").ajaxForm({
				//定义返回JSON数据，还包括xml和script格式
				dataType : 'json',
				beforeSend : function() {
					//表单提交前做表单验证
					layer.msg('玩命上传中');
					index = layer.load(0, {
						shade : false,
						offset : '370px'
					});
				},
				error : function(data) {
					//提交成功后调用
					layer.closeAll();
					alert("视频上传成功!");
				}
			});
		});
	</script>

	<script type="text/javascript">
		$(function() {
			var index;
			$("#myform").ajaxForm({
				//定义返回JSON数据，还包括xml和script格式
				dataType : 'json',
				beforeSend : function() {
					//表单提交前做表单验证
					layer.msg('玩命上传中');
					index = layer.load(0, {
						shade : false,
						offset : '370px'
					});
				},
				error : function(data) {
					//提交成功后调用
					layer.closeAll();
					alert("文章上传成功!");
				}
			});
		});
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

	<script id="commentTmpl" type="text/x-handlebars-template">

		<div class="container">
		<hr>
		<form class="form-horizontal" role="form">
			<label for="basic" class="col-lg-4 control-label"> 选择BOARD： </label>
			<div class="col-lg-5">
				<select id="basic" onchange="abc()" class="gg selectpicker show-tick form-control"
					data-live-search="true">
					<option class="oo" selected>请选择</option>
					{{#each board}}
						<option value="{{board_id}}" class="oo">	
							{{board_name}}
						</option>
					{{/each}}
				</select>
			</div>
			<br>
			<label for="basic" class="cc col-lg-4 control-label"> 选择TOPIC： </label>
			<div class="col-lg-5 cc">
				<select id="basicc" onchange="cba()" class="tt selectpicker show-tick form-control"
					data-live-search="true">
					<option class="oo" selected>请选择</option>
					{{#each topic}}
						<option value="{{topic_id}}" class="oo">
							{{#each ../board}}	
								{{#compare board_id ../b_id}}
									{{../../topic_title}}&nbsp&nbsp({{board_name}})
								{{else}}
								{{/compare}}
							{{/each}}
						</option>
					{{/each}}
				</select>
			</div>
			<br>
			<br>
			<br>
			<br>
		</form>
		<input type="text" placeholder="请输入帖子名称" id="tie" />
		<br>
		<br>
  		<div class="radio">
      		<label>
        		<input type="radio" name="optionsRadios" id="optionsRadios1" value="1" checked>
        		私密
      		</label>
 		</div>
 		<div class="radio">
      		<label>
        		<input type="radio" name="optionsRadios" id="optionsRadios2" value="0">
        		公开 
      		</label>
 		</div>
		<br>
		<br>
		<br>
		<button onclick="go()" class="all btn btn-danger">Submit All</button>
	</div>
</script>

	<script>
		var a;
		var b;
		$(document).ready(function() {

			var topic_d = topic_getall();
			console.log(topic_d);
			var board_d = board_getall();
			console.log(board_d);
			var master = {
				board : board_d,
				topic : topic_d
			};
			console.log("d:" + master);
			var template = $("#commentTmpl").template(master).appendTo("body");

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
		function abc() {
			var myselect = document.getElementById("basic");
			var index = myselect.selectedIndex;
			a = myselect.options[index].value;
			console.log("index:" + a);
		}
		function cba() {
			var myselect = document.getElementById("basicc");
			var index = myselect.selectedIndex;
			b = myselect.options[index].value;
			console.log("index:" + b);
			console.log("value:" + myselect);
		}
		function go() {
			console.log("能进来吗？");
			console.log("后来:" + a);
			console.log("后来:" + b);
			var user = "${sessionScope.user_name.user_id}";
			console.log("ID:" + user);
			var title = $('#tie').val();
			console.log("贴子:" + title);
			var pri=$("input[name='optionsRadios']:checked").val();
			console.log("私密:"+pri);
			var params = {};
			params.board_id = a;
			params.topic_id = b;
			params.user_id = user;
			params.text = title;
			params.privacy=pri;
			$.ajax({
				type : "POST",
				async : false,
				url : "vnpost/add",
				data : params,
				dataType : "json",
				error : function(data, status) {
					console.log("??");
					alert("发布成功");
					window.location.href = 'personal/uploadpost.jsp';
				}
			});
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