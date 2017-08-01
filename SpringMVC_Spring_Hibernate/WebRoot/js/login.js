// JavaScript Document

function check_value(){
	/*判断输入框是否已经输入数据*/
	if($('#username').val().length !=0 && $('#password').val().length !=0 ){
		$('#loginbtn').animate({left:'0',duration:'slow'});
		$('#lockbtn').animate({left:'260',duration:'slow'});
	}
}

$(document).ready(function(){
	$('#loginbtn').click(function(){
		$('#loading').removeClass('hidden');
	});
});