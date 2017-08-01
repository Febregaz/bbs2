<!doctype html>

<html>
<head>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qqFace.js"></script>
</head>

<body>
	<!--     <textarea class="input" id="area" name="area" placeholder="dfsf"></textarea>
    <input type="button" class="butt" value="提交">
    <span class="emotion">表情</span> -->

	<form id="fileForm" role="form" method="post">
		<textarea id="area" placeholder="无需账号即可评论"
			style="font-size:18px;color:#c3b7b5;" class="form-control" rows="8"></textarea>
		<button style="margin-left:340px;" class="butt btn btn-success btn-sm">提交</button>
		<span class="emotion">表情</span>
	</form>


<script type="text/javascript">
	$(function() {

		$('.emotion').qqFace({

			id : 'facebox',

			assign : 'area',

			path : 'arclist/' //表情存放的路径

		});

		$(".butt").click(function() {

			var str = $("#area").val();

			$("#show").html(replace_em(str));

		});

	});

	//查看结果

	function replace_em(str) {

		str = str.replace(/\</g, '&lt;');

		str = str.replace(/\>/g, '&gt;');

		str = str.replace(/\n/g, '<br/>');

		str = str.replace(/\[em_([0-9]*)\]/g,
				'<img src="arclist/$1.gif" border="0" />');

		return str;

	}
</script>

</body>
</html>
