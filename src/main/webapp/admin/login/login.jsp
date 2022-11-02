<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title id="js-meta-title"><ui:i18n key="登录页面"/></title>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<style type="text/css">
*{
	margin:0px;
	padding:0px;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
body{
	background-color:#f7f7f7;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
.content{
	width:1000px;
	margin-left:13%;
	min-height:400px;
	margin-top:30px;
}
.container {
  box-sizing: border-box;
  margin-left: 0;
  /* width: 910px; */
  width: 100%; 
  margin-left: auto;
  margin-right: auto;
}
.headDiv{
	width:100%;
	height:50px;
	border-bottom:1px solid #d3d7d4;
	background-color:#fafafa;
}
.header-login{
	width:148px;
	height:50px;
	border-right:1px solid #d3d7d4; 
	font-size:15px;
	text-align:center;
	line-height:50px;
	background-color:#ffffff;
	position:relative;
	float:left;
}
.header-zhuce{
	width:148px;
	height:50px;
	border-right:1px solid #d3d7d4; 
	font-size:15px;
	text-align:center;
	line-height:50px;
	background-color:#fafafa;
	position:relative;
	opacity:0.3;
	float:left;
}
.header-login img{
	position:absolute;
}
.header-zhuce img{
	position:absolute;
}
.header-login .left_login_01{
	top:15px;
	left:20px;
}
.header-login .login_head{
	top:0px;
	left:0px;
}
.header-zhuce .login_head{
	top:0px;
	left:0px;
	display:none;
}
.header-zhuce .left_register_01{
	top:15px;
	left:20px;
}
.main .main-login .clearfix{
	width:100%;
	height:350px;
}
.leftPart{
	width:50%;
	height:260px;
	border-right:1px solid #d3d7d4;
	margin-top:40px;
	float:left;
}

.leftPart > div{
	height:50px;
	width:80%;
	margin:0 auto;
	/* border:1px solid #d3d7d4; */
}
.leftPart .name div{
	float:left;
}
.nameImg{
	width:65px;
	height:50px;
	position:relative;
}
.nameImg img{
	top:15px;
	left:20px;
	position:absolute;
	z-index:1000;
} 
 .nameInput{
	height:50px;
	position:relative;
} 
.nameInput  input{
	left:-65px;
	height:40px;
	width:330px;
	position:absolute;
	border-top:0px;
	border:1px solid #d3d7d4;
	z-index:0;
}
.leftPart .pwd div{
	float:left;
}
.pwdImg{
	width:65px;
	height:50px;
	position:relative;
	z-index:1000;
}
.pwdImg img{
	top:15px;
	left:20px;
	position:absolute;
	
} 
 .pwdInput{
	height:50px;
	position:relative;
} 
.pwdInput  input{
	left:-65px;
	height:40px;
	width:330px;
	position:absolute;
	border:1px solid #d3d7d4;
	z-index:0;
}
.forget{
	height:50px;
	line-height:50px;
	text-align:right;
	visibility: hidden;
}
.leftPart .yanzheng div{
	float:left;
}
.yanzhengImg{
	width:65px;
	height:50px;
	position:relative;
	z-index:10000;
}
.yanzhengImg img{
	top:15px;
	left:20px;
	position:absolute;
	
} 
 .yanzhengInput{
	height:50px;
	position:relative;
} 
.yanzhengInput  input{
	left:-65px;
	height:40px;
	width:100px;
	position:absolute;
	border:1px solid #d3d7d4;
	z-index:0;
}
.yanzhengNum{
	width:120px;
	height:48px;
	line-height:48px;
	margin-left:120px;
	text-align:center;
	border:1px solid #d3d7d4;
	border-radius:5px;
	font-size:20px;
	font-family:Arial,宋体;
	font-style:italic;
	color:green;
	letter-spacing:3px;
	font-weight:bolder;
	cursor: pointer; 
}
.yanzhengChange{
	width:80px;
	height:50px;
	margin-left:10px;
	text-align:center;
	margin-top:10px;
	cursor: pointer;
}
.ui-btn-bar  span{
	width:90%;
	height:45px;
	display: inline-block; 
	line-height:45px;
	text-align:center;
	font-size:20px;
	color:#fff;
	letter-spacing:2px; 
	padding-left:20px;
	padding-right:20px;
	background: #ff6d00; 
	}
.rightPart{
	position:relative;
}
.rightPart img{
	position:absolute;
}
.right_01{
	top:50px;
	left:630px;
}
.right_02{
	top:110px;
	left:590px;
}
.right_03{
	top:245px;
	left:700px;
}
.right_04{
	top:200px;
	left:855px;
}
.right_05{
	top:90px;
	left:890px;
}
.right_circle_01{
	top:220px;
	left:675px;
}
.right_circle_02{
	top:260px;
	left:645px;
}
.right_circle_03{
	top:300px;
	left:590px;
}
.right_QRCode{
	top:50px;
	left:680px;
}
.foot{
	width:1000px;
	height:100px;
	margin-left:13%;
	line-height:100px;
	
}
/* .foot table td{
	border:1px solid #d3d7d4;
} */
.rightPart img{
	display:none;
}
.login-register-div{
	width:100%;
	padding-top:40px;
	display:none;
}
.login-register-div table{
	position: relative;
	width:100%;
	color:#5f5f5f;
}
.login-register-div table .name-input-show{
	text-align: right;
	width:270px;
	vertical-align: top;
	font-size:12px;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	padding-top:15px;
}
.login-register-div table .name-input-show span{
	color:#d1102d;
}
.login-register-div table .value-input{
	text-align: left;
	font-size:12px;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	position: relative;
}
.login-register-div table .value-input input{
	margin-left:10px;
	margin-top:10px;
	font-size:12px;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	width:350px;
	margin-bottom: 10px;
	
}
.login-register-div table .value-input div{
	margin-left:10px;
	margin-top:20px;
	font-size:12px;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	width:100px;
	height:100px;
	color:#7f7f7f;
	border:1px solid #d5d5d5;
	margin-bottom:15px;
	text-align: center;
	vertical-align:middle;
	cursor: pointer;
	position: relative;
	display: inline-block;
}
.login-register-div table .value-input .file-upload-input{
	width:80px;
	height:80px;
	position: absolute;
	z-index:12; 
	filter:alpha(opacity:0); 
	opacity:0; 
	border:1px solid red;
	top:10px;
	left:0px;
	cursor: pointer;
}
.login-register-div table .value-input span{
	color:#d1102d;
	margin-left:10px;
}
.login-register-div table .value-input textarea{
	margin-left:10px;
	margin-top:10px;
	font-size:12px;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	width:350px;
	height:85px;
}
.login-register-div table .select-sex{
	padding-top:15px;
}
.login-register-div table .select-sex input{
	margin-right:5px;
	margin-left:15px;
	margin-top:-1px;
}
.login-register-div table tfoot tr td .register-submit{
	width:364px;
	height:45px;
	text-align: center;
	line-height: 45px;
	font-size:18px;
	background-color: #2a9be2;
	margin-left:10px;
	cursor: pointer;
	margin-top:30px;
	margin-bottom:50px;
	color:#fff;
}


.dd .ddArrow {
  width: 16px;
  height: 16px;
  margin-top: -8px;
  background: url(/admin/images/login/dropdown_arrow.gif) no-repeat;
}
.img-preview-div img{
	width:98px;
	height:98px;
}
.img-preview-div a{
	display: inline-block;
  width: 100%;
  height: 100%;
  text-align: center;
  background: url("/admin/images/rouletteActivity/icon_img.png");
  background-position: 38px 33px;
  background-repeat: no-repeat;
  background-color: #f7f7f7;
  cursor: pointer;
  display: inline-block;
    line-height: normal;
}
.login-register-div table .value-input .img-preview-div a span{
	width:100%;
	text-align: center;
	display: inline-block;
	margin-top:60px;
	color:#5f5f5f;
	font-size:12px;
	margin-left:0;
}
.img-width-span{
  color: red;
  position: absolute;
  left: 110px;
  top: 99px;
  width: 220px;
}
.header {
	background-color: #636363;
}

.header-contents{
	/* width:1200px; */
	width:1290px;
	margin-left: auto;
	margin-right: auto; 
	/* background-color: red; */
	 height: 50px;
	 position: relative;
	 margin-bottom:20px;
  }
  
  .header-contents .header-left{
  	float: left;
 /*  	background-color: green; */
  	height: 50px;
  	line-height: 50px;
  }
  .platform-logo{
  	width: 55px; height: 22px;
  	vertical-align: middle;
  	margin-left: 13px;
  	margin-right: 15px;
  	cursor: pointer;
  }
  
  .platform-name{
  	font-size: 18px;
  	color: #fff; 
  	height: 22px;
  	line-height: 22px; 
  	display: inline-block;
  	vertical-align: middle; 
  	margin-left: 5px;
  	margin-right: 5px; 
  }
  .icheckbox_square-firebrick, .iradio_square-firebrick {
	  display: inline-block;
	  vertical-align: middle;
	  vertical-align: middle;
	  margin: 0;
	  padding: 0;
	  width: 14px;
	  height: 14px;
	  border: none;
	  cursor: pointer;
	  margin-left: 10px;
	  margin-right: 5px;
	  margin-top:-2px;
	}
</style>

<script>
// global variables
 
// require common config
var error = '${error}' || '';
if(error !== ''){ 
	alert(error);
}	
//登陆检查
function checkLogin() {
	
	var account = $('#account').val();
	
	var password = $('#password').val();

	if (account == '') {
		alert('<ui:i18n key="请输入账号"/>');
		return false;
	}
	if (password == '') {
		alert('<ui:i18n key="请输入密码"/>');
		return false;
	}
	var inputCode = document.getElementById("import").value.toUpperCase();
	if(inputCode.length <=0) {
   		alert('<ui:i18n key="请输入验证码"/>');
  	 	return false;
	}else if(inputCode != code ){
   		alert('<ui:i18n key="验证码输入错误"/>');
  		createCode();
  		document.getElementById('import').value = '';
   		return false;
	}
	var params = {
		account : account,
		password : password,
	};

	$.ajax({
		data : params,
		url : '/admin/login/loginCheck.htm',
		success : function(res){
			//alert(account+"-"+res.user);
			if(res.success){
				if(res.user == null){
					alert('<ui:i18n key="用户名错误"/>.');
					return;
				}else{
					if(res.user.pwd != res.password ){
						alert('<ui:i18n key="密码错误"/>.');
						return;
					}else{
						/* alert(res.user.userAuth); */
						if(res.user.userAuth != null && res.user.userAuth == 'U'){/* hzm */
 							location.href = '/hzm/portal/hzm_Main.htm';
						} else if(res.user.userAuth != null && res.user.userAuth == 'PC'){ /* 客户 */
 							location.href = '/pms/portal/pms_Main.htm';
						} else if(res.user.userAuth != null && res.user.userAuth == 'PH'){ /* 公司 */
 							location.href = '/pms/portal/pms_Main.htm';
						}
						
						else{
							location.href = '/admin/portal/home.htm';
						}
					}
				}
			}else{
				alert('<ui:i18n key="网络出现故障"/>:'+res.err_msg);
			}
			 
		},
		error : function(a, msg, c){
			console.error('======================');
			console.error(a);
			console.error('======================');
			console.error(msg);
			console.error('======================');
			console.error(c);
			alert('<ui:i18n key="网络出现故障"/>: ' + msg);
		}
	});
	//$('#loginform').submit();
}
//登陆按钮样式
function clickHeadLogin(){
	$('.header-zhuce').css('background-color','#fafafa');
	$('.header-zhuce').css('opacity','0.3');
	$('.header-zhuce .login_head').hide();
	$('.header-login').css('background-color','#ffffff');
	$('.header-login').css('opacity','1');
	$('.header-login .login_head').show();
	$('.main.main-login.clearfix').show();
	$('.login-register-div').hide();
}
//注册按钮样式
function clickHeadZhuCe(){
	$('.header-login').css('background-color','#fafafa');
	$('.header-login').css('opacity','0.3');
	$('.header-login .login_head').hide();
	$('.header-zhuce').css('background-color','#ffffff');
	$('.header-zhuce').css('opacity','1');
	$('.header-zhuce .login_head').show();
	$('.main.main-login.clearfix').hide();
	$('.login-register-div').show();
}
var code ; //在全局 定义验证码
//创建验证码
function createCode(){
	code = new Array();
	var codeLength = 4;//验证码的长度
	var checkCode = document.getElementById('checkCode');
	checkCode.innerHTML = '';
	var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
	for(var i=0;i<codeLength;i++) {
   		var charIndex = Math.floor(Math.random()*32);
   		code += selectChar[charIndex];
   		var colors = new Array('Red','Green','Gray','Blue','Maroon','Aqua','Fuchsia','Lime','Olive','Silver');
   		$('#checkCode').css('color',colors[Math.floor(Math.random()*10)]);
	}
	if(code.length != codeLength){
   		createCode();
	}
	checkCode.innerHTML = code;
	
}
 //验证码验证
 function validate () {
	
	var inputCode = document.getElementById('import').value.toUpperCase();
	if(inputCode.length <= 0) {
   		alert('<ui:i18n key="请输入验证码"/>');
  	 	return false;
	}else if(inputCode != code ){
   		alert('<ui:i18n key="验证码输入错误"/>');
  		createCode();
   		return false;
	}else {
   		//alert('成功！');
   		return true;
	}
}  
//页面加载时执行的方法
$(document).ready( function(){
	$('#account').val('');
	$('#password').val('');
	$('#import').val('');
	$('#img10').show();
    createCode();
});
//右侧图片显示样式
function imgShow(val) {
	for(var i = val;i < 10;i++){
		window.setTimeout('imgShow('+ ++i +')',500);
			if(i >= 0 && i <= 4){
				$('#img'+i).animate({ marginLeft: '-100px' }, 1000, '', function () {
   					$(this).show();
           			$(this).animate({ marginLeft: '0px' }, 1000, '', function () { Fn_Moving($(this)); });
       			});
       			break;
	        }
			else if(i >= 5 && i <= 6){
				$('#img'+i).animate({ marginLeft: '100px' }, 1000, '', function () {
	   				$(this).show();
	            	$(this).animate({ marginLeft: '0px' }, 1000, '', function () { Fn_Moving($(this)); });
	      		});
				break;
			}else{		
				$('#img'+i).animate({ marginTop: '0px' }, 1000, '', function () {
					$(this).show();
    				$(this).animate({ marginTop: '0px' }, 1000, '', function () {  });
				});
				break;
			}
		}
}	
imgShow(0);

function Fn_Moving(object) {
	object
    .animate({ marginTop: '10px' }, 1200, '', function () {
        $(this)
        .animate({ marginTop: '0px' }, 1200, '', function () { 
        //자기 호출
        Fn_Moving(object); });
    });
}

$(function(){
	$('#account,#password,#import').keypress(function(event){
		if(event.keyCode == 13){
			checkLogin();			
		}
	});
	
	$('.img-preview-div').click(function(){
		$('#logo_input').trigger('click');
	});
	
	//////////////// 验证信息开始///////////////////
	$('#userId').blur(function(){
		var userId = $(this).val();
		if(userId == ''){
			$('#userIdMsg').text('<ui:i18n key="请输入账号"/>');
		}else{
			if(!userId.match(/^[a-zA-Z0-9]+$/)){
				$('#userIdMsg').text('<ui:i18n key="只能为数字和字母"/>');
			}else{
				var param = {
								userId : userId
							};
				$.ajax({
					data : param,
					url : '/admin/login/proveUser.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
					success : function(data){
						if(data.result == 'success'){
							$('#userIdMsg').text('<ui:i18n key="此账号已被使用"/>');
						}else if(data.result == 'fail'){
							$('#userIdMsg').text('');
						}
					},
					error : function(a, msg, c) {
						alert('error: ' + msg);
					}
				});
			}
		}
	});
	$('#userNickName').blur(function(){
		var userNickName = $(this).val();
		if(userNickName == ''){
			$('#userNickNameMsg').text('<ui:i18n key="请输入昵称"/>');
		}else{
			var param = {
							userNickName : userNickName
						};
			$.ajax({
				data : param,
				url : '/admin/login/proveUser.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						$('#userNickNameMsg').text('<ui:i18n key="此昵称已被使用"/>');
					}else if(data.result == 'fail'){
						$('#userNickNameMsg').text('');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		}
	});
	$('#userRealName').blur(function(){
		var userRealName = $(this).val();
		if(userRealName == ''){
			$('#userRealNameMsg').text('<ui:i18n key="请输入真实姓名"/>');
		}else{
			$('#userRealNameMsg').text('');
		}
	});
	$('#wxOpendIdU').blur(function(){
		var wxOpendIdU = $(this).val();
		if(wxOpendIdU == ''){
			$('#wxOpendIdUMsg').text('<ui:i18n key="请输入微信账号"/>');
		}else{
			var param = {
							wxOpendIdU : wxOpendIdU
						};
			$.ajax({
				data : param,
				url : '/admin/login/proveUser.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						$('#wxOpendIdUMsg').text('<ui:i18n key="该微信号已绑定"/>');
					}else if(data.result == 'fail'){
						$('#wxOpendIdUMsg').text('');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		}
	});
	$('#email').blur(function(){
		var email = $(this).val();
		if(email == ''){
			$('#emailMsg').text('<ui:i18n key="请输入邮箱"/>');
		}else{
			if(email.match(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/)){
				var param = {
								email : email
							};
				$.ajax({
					data : param,
					url : '/admin/login/proveUser.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
					success : function(data){
						if(data.result == 'success'){
							$('#emailMsg').text('<ui:i18n key="该邮箱已经使用"/>');	
						}else if(data.result == 'fail'){
							$('#emailMsg').text('');	
						}
					},
					error : function(a, msg, c) {
						alert('error: ' + msg);
					}
				});
			}else{
				$('#emailMsg').text('<ui:i18n key="邮箱格式不正确"/>');				
			}
		}
	});
	//检验联系人手机号
	$('#mobileNo').blur(function(){
		var contactMobileNo = $(this).val();
		if(contactMobileNo == '') {
			$('#mobileNoMsg').text('<ui:i18n key="请输入手机号"/>');
		}
		else{
			if(contactMobileNo.match(/^\d{11}$/)){
				var param = {mobileNo : contactMobileNo};
				$.ajax({
					data : param,
					url : '/admin/login/proveUser.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
					success : function(data){
						if(data.result == 'success'){
							$('#mobileNoMsg').text('<ui:i18n key="该手机号已使用"/>');	
						}else if(data.result == 'fail'){
							$('#mobileNoMsg').text('');
						}
					},
					error : function(a, msg, c) {
						alert('error: ' + msg);
					}
				});
			}
			else{
				$('#mobileNoMsg').text('<ui:i18n key="手机号码格式不正确"/>');
			}
		}
	});
	$('#qqId').blur(function(){
		var qqId = $(this).val();
		if(qqId == '') {
		}
		else{
			if(!qqId.match(/^[1-9][0-9]{5,9}$/)){
				$('#qqIdMsg').text('<ui:i18n key="联系人QQ格式不正确"/>');
			}
			else{
				$('#qqIdMsg').text('');
			}
		}
	});
	$('#pwd').blur(function(){
		var pwd = $(this).val();
		if(pwd == ''){
			$('#pwdMsg').text('<ui:i18n key="请输入密码"/>');
		}else{
			if(pwd.match(/^[0-9a-zA-Z]{6,}$/)){
				$('#pwdMsg').text('');
				$('#pwdSubmit').val('');
			}else{
				$('#pwdMsg').text('<ui:i18n key="密码只能为六位以上数字与字母的组合"/>');
			}
		}
	});
	$('#pwdSubmit').blur(function(){
		var pwdSubmit = $(this).val();
		var pwd = $('#pwd').val();
		if(pwdSubmit == ''){
			$('#pwdSubmitMsg').text('<ui:i18n key="请输入确认密码"/>');
		}else{
			if(pwd == pwdSubmit){
				$('#pwdSubmitMsg').text('');
			}else{
				$('#pwdSubmitMsg').text('<ui:i18n key="密码不一致"/>，<ui:i18n key="请重新输入"/>');
			}
		}
	});
	$('#singName').blur(function(){
		var singName = $(this).val();
		if(singName == ''){
			$('#singNameMsg').text('<ui:i18n key="请输入个性签名"/>');
		}else{
			$('#singNameMsg').text('');
		}
	});
	//////////////// 验证信息结束///////////////////
	//////////////// 保存信息开始///////////////////
	$('.register-submit').click(function(){
		var userId = $('#userId').val();
		if(userId == ''){
			alert('<ui:i18n key="请输入账号"/>');
			return;
		}
		var userNickName = $('#userNickName').val();
		if(userNickName == ''){
			alert('<ui:i18n key="请输入昵称"/>');
			return;
		}
		var userRealName = $('#userRealName').val();
		if(userRealName == ''){
			alert('<ui:i18n key="请输入真实姓名"/>');
			return;
		}
		var wxOpendIdU = $('#wxOpendIdU').val();
		if(wxOpendIdU == ''){
			alert('<ui:i18n key="请输入微信账号"/>');
			return;
		}
		var email = $('#email').val();
		if(email == ''){
			alert('<ui:i18n key="请输入邮箱"/>');
			return;
		}
		var mobileNo = $('#mobileNo').val();
		if(mobileNo == ''){
			alert('<ui:i18n key="请输入手机号"/>');
			return;
		}
		var qqId = $('#qqId').val();
		/* if(qqId == ''){
			alert('<ui:i18n key="请输入QQ"/>');
			return;
		} */
		var pwd = $('#pwd').val();
		if(pwd == ''){
			alert('<ui:i18n key="请输入密码"/>');
			return;
		}
		var pwdSubmit = $('#pwdSubmit').val();
		if(pwdSubmit == ''){
			alert('<ui:i18n key="请输入确认密码"/>');
			return;
		}
		var sex = $('input[name="sex"]:checked').val();
		if(sex == '' || (typeof(sex) == 'undefined')){
			alert('<ui:i18n key="请选择性别"/>');
			return;
		}
		//获取店铺logo
        var imgLogoPicture = document.getElementById('logo_input').value;
        if(imgLogoPicture == ''){
        	alert('<ui:i18n key="请选择图片"/>');
        	return;
        }else{
        	 var type = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('.') + 1, imgLogoPicture.length).toLowerCase();
        	    if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
        	        alert('<ui:i18n key="请上传正确的图片格式"/>');
        	        return;
        	    }
        }
		var singName = $('#singName').val();
		if(singName == ''){
			alert('<ui:i18n key="请输入个性签名"/>');
			return;
		}
		
		//获取所有name属性为errorMsg的span中的文档信息
		 var spanMsg = document.getElementsByName('errorMsg');
		for(var i = 0;i<spanMsg.length;i++){
			if(! spanMsg[i].innerHTML == ''){
		   			 alert(spanMsg[i].innerHTML);
		   			 return;
			}
		} 
		//获取照片的文件名
        var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
		var param = {	userId : userId
					,userNickName : userNickName
					,userRealName : userRealName
					,wxOpendIdU : wxOpendIdU
					,email : email
					,mobileNo : mobileNo
					,qqId : qqId
					,pwd : pwd
					,sex : sex
					,singName : singName
					,logoFileName : logoFileName 
					};
		$.ajaxFileUpload ({
			data : param,
			url : '/admin/login/saveUser.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
			secureuri : false,
			fileElementId :'logo_input',
			dataType : 'json',
			type :'post',
			success : function (data){
				if(data.result == 'SUCCESS'){
			        alert('<ui:i18n key="保存成功"/>');
			        window.location.href = '/admin/login/login.htm';
				}else if (data.result == 'FAIL'){
					alert('<ui:i18n key="请检查信息"/>,<ui:i18n key="重新点击添加"/>.');
				}
			},
			error: function (data, e){
				alert(e );
			}
		});	
	});
	//////////////// 保存信息结束///////////////////
});

//店铺logo的上传预览
function logoUpload(file){
	if(checkImage(file)){
		 var prevDiv = document.getElementById('preview');
		 if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt){
		 	prevDiv.innerHTML = '<img id="imgInput" alt="logo" src="' + evt.target.result + '" />';
			}; 
		 reader.readAsDataURL(file.files[0]);
		}
		else{
			prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
		}
	}else{
		var prevDiv = document.getElementById('preview');
		prevDiv.innerHTML ='<a class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>';
	}
}
//检查上传文件是否为图片
function checkImage(file){
	if(file.value==''){
		return false;
	}
	var picPath =file.value;
    var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
    if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
        alert('<ui:i18n key="请上传正确的图片格式"/>');
        return false;
    }
	return true;
}
</script>
<script type="text/javascript">
	$(function() {
		/* $("#selectLanguage").msDropdown({
			on : {
				change : function(data, ui) {
					var val = data.value;
					//alert('data.value='+data.value);
					if (val != "") {
						window.location = val;
					}
				}
			}
		}); */
		
		$('[name="language"]').click(function(){
			window.location = $(this).val();
			
		});
		
	});
</script>
<!-- ▲ Common config -->
<body >

	<!-- End -->
	<!-- ▼ Main container -->
	 <!-- start登陆界面 -->
	 <div class="container"> 
		 <div class="content" role="main" style="min-width:500px;width:30%;margin-left: 35%;">
			 <div class="app"> 
				 <div class="app-init-container"> 
					 <div> 
						 <div class="container"> 
							<!-- end登陆页面头部 -->
							 <div class="main main-login clearfix"> 
								<form id="loginform" class="form-horizontal" method="POST"
									 action="/admin/portal/home.htm">
									 <!-- start左侧部分 -->
									 <div class="leftPart"  style="width:100%;border-right:0;">
										 <div style="margin-top:10px; font-size:3rem;font-weight:bold;text-align:center;">
											LOGIN
										 </div>	
									 	<div class="name">
									 		<div class="nameImg"></div> 
									 		<div class="nameInput"><input type="text" style="padding-left: 60px;"tabindex="1" id="account" value="" name="account" placeholder="<ui:i18n key="账号"/>"/></div>
									 	</div>
									 	<div class="pwd">
									 		<div class="pwdImg"></div> 
									 		<div class="pwdInput"><input type="password" style="padding-left: 60px;border-top:0px;" tabindex="2"id="password" value="" name="password" placeholder="<ui:i18n key="密码"/>" /></div>
									 	</div>
									 	<!-- <div class="forget">
									 		<a href="javascript:void(0);"><img alt="" src="/admin/images/logo/left_Password_02.png" style="margin-bottom:3px"></a>
									 		&nbsp;&nbsp;
									 		<a href="javascript:void(0);"><text style="color:red">忘记密码？<text></a>
									 	</div> -->
									 	<div class="yanzheng">
									 		<div class="yanzhengImg"></div> 
									 		<div class="yanzhengInput"><input type="text" style="padding-left: 60px;" 
									 		tabindex="3" value="" name="" id="import" placeholder="<ui:i18n key="验证码"/>"/></div>
									 		<div class="yanzhengNum"  id="checkCode"></div>	
									 		<div class="yanzhengChange"  onClick="createCode();">
									 			<img alt="" src="/admin/images/logo/left_Refresh.png"><br>
									 			<text style="color:#61a5df"><ui:i18n key="换一张"/></text>
									 		</div>
									 	</div>
									 	<div class="ui-btn-bar clearfix"  >
									 		<a href="javascript:void(0);"><span onClick="return checkLogin();" style="background:red;"><ui:i18n key="立即登录"/></span></a>
									 	</div>
										 <div style="margin-top:10px; ">
											<input type="radio" name="language" value="<%=RequestUtil.getLanguageChangeUrl("zh-CN")%>"
												<%if ("zh-CN".equalsIgnoreCase(LabelUtil.getCurrentLanguage())) {%>
														checked="checked"  <%}%>> 
											<img alt="" src="/admin/images/login/icon.china.active.png">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="language" value="<%=RequestUtil.getLanguageChangeUrl("ko-KR")%>"
												<%if ("ko-KR".equalsIgnoreCase(LabelUtil.getCurrentLanguage())) {%>
														checked="checked"  <%}%>> 
											<img alt="" src="/admin/images/login/icon.korea.active.png">
											<%-- <input type="radio" name="language" value="<%=RequestUtil.getLanguageChangeUrl("en-US")%>"
												<%if ("en-US".equalsIgnoreCase(LabelUtil.getCurrentLanguage())) {%>
														checked="checked"  <%}%>>  
											<img alt="" src="/admin/images/login/icon.usa.active.png"> --%>
										 </div>	
									 </div>
									 <!-- end左侧部分 -->
									 
								</form>
							 </div> 
							 
						 </div> 
					 </div> 
				 </div>
				<div class="notify-bar js-notify animated hinge hide"></div>
			 </div> 
		 </div> 
	 </div> 
					 <div width="100%" style="text-align:center;">
					 	北京爱坤文化有限公司
					 	<br>
						 <a href="http://www.miitbeian.gov.cn/" target="_blank">京ICP备19026706号-1</a>
					 </div>
</body>
</html>
