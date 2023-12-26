<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
  <head>
    <title>식자재 견적비교</title>
    <meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<link rel="apple-touch-icon" href="/images/bbcicon2.png" />
    <link rel="stylesheet" type="text/css" href="../css/font.css" /> <!--字体图标：公用-->
    <link rel="stylesheet" type="text/css" href="../css/reset.css" /> <!--reset：公用-->
    <link rel="stylesheet" type="text/css" href="../css/common.css" /> <!--公共：公用-->
    <link rel="stylesheet" type="text/css" href="../css/button.css" /> <!--按钮：公用-->
    <script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script> <!--jquery公用-->
    <script src="../js/rem5.js" type="text/javascript" charset="utf-8"></script> <!--rem公用-->
    <style>
    	.loginContent {
    		background-image: url(/front/bbc/img_prod/bg.jpg);
    	}
    	.loginLogo {
		    font-size: 0.7rem;
		    width: 100%;
		    margin-bottom: 0.7rem;
		    align-content: center;
		    color: #ffff;
		    text-align: center;
		    font-weight: bold;
		    border: solid 1px;
		    padding: 0.2rem;
		}
		#fountainG{
			position:relative;
			width:234px;
			height:28px;
			margin:auto;
			top:45%;
			background-color:rgb(f,f,f);
		
		}
		.fountainG{
			position:absolute;
			top:0;
			background-color:rgb(0,0,0);
			width:28px;
			height:28px;
			animation-name:bounce_fountainG;
				-o-animation-name:bounce_fountainG;
				-ms-animation-name:bounce_fountainG;
				-webkit-animation-name:bounce_fountainG;
				-moz-animation-name:bounce_fountainG;
			animation-duration:1.5s;
				-o-animation-duration:1.5s;
				-ms-animation-duration:1.5s;
				-webkit-animation-duration:1.5s;
				-moz-animation-duration:1.5s;
			animation-iteration-count:infinite;
				-o-animation-iteration-count:infinite;
				-ms-animation-iteration-count:infinite;
				-webkit-animation-iteration-count:infinite;
				-moz-animation-iteration-count:infinite;
			animation-direction:normal;
				-o-animation-direction:normal;
				-ms-animation-direction:normal;
				-webkit-animation-direction:normal;
				-moz-animation-direction:normal;
			transform:scale(.3);
				-o-transform:scale(.3);
				-ms-transform:scale(.3);
				-webkit-transform:scale(.3);
				-moz-transform:scale(.3);
			border-radius:19px;
				-o-border-radius:19px;
				-ms-border-radius:19px;
				-webkit-border-radius:19px;
				-moz-border-radius:19px;
		}
		
		#fountainG_1{
			left:0;
			animation-delay:0.6s;
				-o-animation-delay:0.6s;
				-ms-animation-delay:0.6s;
				-webkit-animation-delay:0.6s;
				-moz-animation-delay:0.6s;
		}
		
		#fountainG_2{
			left:29px;
			animation-delay:0.75s;
				-o-animation-delay:0.75s;
				-ms-animation-delay:0.75s;
				-webkit-animation-delay:0.75s;
				-moz-animation-delay:0.75s;
		}
		
		#fountainG_3{
			left:58px;
			animation-delay:0.9s;
				-o-animation-delay:0.9s;
				-ms-animation-delay:0.9s;
				-webkit-animation-delay:0.9s;
				-moz-animation-delay:0.9s;
		}
		
		#fountainG_4{
			left:88px;
			animation-delay:1.05s;
				-o-animation-delay:1.05s;
				-ms-animation-delay:1.05s;
				-webkit-animation-delay:1.05s;
				-moz-animation-delay:1.05s;
		}
		
		#fountainG_5{
			left:117px;
			animation-delay:1.2s;
				-o-animation-delay:1.2s;
				-ms-animation-delay:1.2s;
				-webkit-animation-delay:1.2s;
				-moz-animation-delay:1.2s;
		}
		
		#fountainG_6{
			left:146px;
			animation-delay:1.35s;
				-o-animation-delay:1.35s;
				-ms-animation-delay:1.35s;
				-webkit-animation-delay:1.35s;
				-moz-animation-delay:1.35s;
		}
		
		#fountainG_7{
			left:175px;
			animation-delay:1.5s;
				-o-animation-delay:1.5s;
				-ms-animation-delay:1.5s;
				-webkit-animation-delay:1.5s;
				-moz-animation-delay:1.5s;
		}
		
		#fountainG_8{
			left:205px;
			animation-delay:1.64s;
				-o-animation-delay:1.64s;
				-ms-animation-delay:1.64s;
				-webkit-animation-delay:1.64s;
				-moz-animation-delay:1.64s;
		}

		@keyframes bounce_fountainG{
			0%{
			transform:scale(1);
				background-color:rgb(0,0,0);
			}
		
			100%{
			transform:scale(.3);
				background-color:rgb(255,255,255);
			}
		}
		
		@-o-keyframes bounce_fountainG{
			0%{
			-o-transform:scale(1);
				background-color:rgb(0,0,0);
			}
		
			100%{
			-o-transform:scale(.3);
				background-color:rgb(255,255,255);
			}
		}
		
		@-ms-keyframes bounce_fountainG{
			0%{
			-ms-transform:scale(1);
				background-color:rgb(0,0,0);
			}
		
			100%{
			-ms-transform:scale(.3);
				background-color:rgb(255,255,255);
			}
		}
		
		@-webkit-keyframes bounce_fountainG{
			0%{
			-webkit-transform:scale(1);
				background-color:rgb(0,0,0);
			}
		
			100%{
			-webkit-transform:scale(.3);
				background-color:rgb(255,255,255);
			}
		}
		
		@-moz-keyframes bounce_fountainG{
			0%{
			-moz-transform:scale(1);
				background-color:rgb(0,0,0);
			}
		
			100%{
			-moz-transform:scale(.3);
				background-color:rgb(255,255,255);
			}
		}
		.page-overlay {
			background: rgba(0, 0, 0, .2);
			width: 100%;
			height: 100%;
			position: fixed;
			left: 0;
			top: 0;
			z-index: 2000;
			display:none;
		}
    </style>
</head>
      
  <body>
    <div class="loginContent" id="demoDiv1">
      <div class="loginLogo">
        식자재 견적비교
      </div>
      <div class="loginInput">
<!--         <form onsubmit="return check(this)" action=""> -->
	        <div class="input-wrap contentText">
	          <input type="" name="" id="userName" value="" />
	          <div id="inputID">아이디 입력</div>
	        </div>
	        
	        <div class="input-wrap contentPassword">
	          <input type="password" name="" id="passWord" value="" />
	          <div id="inputPW">패스워드 입력</div>
	        </div>
	        <div class="switchLabel">
	          <div class="switchIcon">
	            <label class="switch">
	              <input type="checkbox" name="saveId" id="saveId" checked/>
	              <i class="switch-btn"></i>
	            </label> 
	          </div>
	          <div class="switchWord">아이디 저장</div>
	        </div>
	        <button class="loginBtn" id="bbcLogin" style="width: 100%;height: 1rem;">로그인</button>
	        <button class="loginBtn light" id="bbcLogin2" style="width: 100%;height: 1rem;">신규회원가입</button>
	        <div class="explain">
	          <p class="exWord"><span class="dian">식자재 견적비교 데모사이트 입니다.</span></p>
	          <p class="exWord"><span class="dian">Small Revolution 허가를 받은 사용자에 한해 사용할 수 있습니다.</span></p>
	          <p class="exWord"><span class="dian">문의 사항은 아래 연락처로 문의 하세요.</span></p>
	        </div>
<!-- 	      </form> onclick="window.location = 'http://39.104.55.19/bbcApp.apk';"  -->

			<button class="loginBtn light" id="downloadApp" style="width: 30%;height:0.5rem;background: #e9711a;font-size: 0.25rem;margin-left: 70%;">0877337318</button>
      </div>
    </div>
		<div class="page-overlay" id="page-overlay">
			<div id="fountainG">
				<div id="fountainG_1" class="fountainG"></div>
				<div id="fountainG_2" class="fountainG"></div>
				<div id="fountainG_3" class="fountainG"></div>
				<div id="fountainG_4" class="fountainG"></div>
				<div id="fountainG_5" class="fountainG"></div>
				<div id="fountainG_6" class="fountainG"></div>
				<div id="fountainG_7" class="fountainG"></div>
				<div id="fountainG_8" class="fountainG"></div>
			</div>
		</div>  
  </body>
  <script type="text/javascript">
	$(document).ready(function(){
		
		$('input').on('input',function() {
			if($(this).val()) {
				$(this).css('background-color','#FFFFFF')
			} else {
				$(this).css('background-color','none')
			}
		});
		
		$("input").keyup(function(){
			usrValue = $("#userName").val();
			passWord = $("#passWord").val();
			if(usrValue!=""&&passWord!=""){
				$("#bbcLogin").addClass("light")
			}else{
				$("#bbcLogin").removeClass("light")
			}
		});

		$('#bbcLogin').click(function(e) {
// 			e.preventDefault();
			var sId = $(this).attr("id");
			switch (sId) {
				case "bbcLogin":
					appLogin.biz.login();
					break;
			}
		});

		$('#bbcLogin2').click(function(e) {
// 			e.preventDefault();
// 			window.location='userAddRequest.htm';
			alert("아래 Small Revolution 담당자 연락처로 연락 바랍니다.");
		});

		var bbcUserid = getCookie("usrValue");
		var bbcUserpw = getCookie("passWord");

		if (bbcUserid != "") {
			$("#userName").val(bbcUserid);
			$("#passWord").val(bbcUserpw);


			$("#inputID").html("");
			$("#inputPW").html("");
			
			
			usrValue = $("#userName").val();
			passWord = $("#passWord").val();
			if(usrValue!=""&&passWord!=""){
				$("#bbcLogin").addClass("light")
			}else{
				$("#bbcLogin").removeClass("light")
			}
		}
		
	}); 

	var appLogin = {
			biz: {
				login: function() {
					var usrValue = $("#userName").val();
					var passWord = $("#passWord").val();
					

					if ($("#saveId").is(":checked")) {
						setCookie("usrValue", usrValue, 360); // 360일 동안 쿠키 보관
						setCookie("passWord", passWord, 360); // 360일 동안 쿠키 보관
					}
					else { // ID 저장하기 체크 해제 시,
						deleteCookie("usrValue");
						deleteCookie("passWord");
					}					

					loadingShow();
					
					$.ajax({
				 	 		data:{
				 	 			strMbrid : usrValue
				 	 			,strMbrpw : passWord
				 	 		},
							type : "POST",
							url : "/front/bbc/clb/bbcLoginCheck.htm",
							success : function(data) {
// 								window.location = "/front/bbc/exc/excDoList.htm";
// 									window.location = "/front/bbc/exc/excDoList.htm?shopId=68";
								console.log(data.ret);
								if(data.ret=="success"){

									var strNatcd = "ko-KR";

									 $.ajax({
									 	 		data:{
									 	 			strNatcd : strNatcd
									 	 		},
											type : "POST",
											url : "/front/bbc/mbr/myPageLang.htm",
											success : function(data) {
												window.location = "/front/bbc/badMatch/getPage.htm?pageName=page28&shopId=68";
											},
											error : function(xhr, status, e) {
												alert("Error : " + status);
											}
										});										
									
								}else{
									loadingHide();
				     				alert("${label.失败了}");
								}
							},
							error : function(xhr, status, e) {
								loadingHide();
								alert("Error : " + status);
							}
					});
					return false; //此处必须返回false，阻止常规的form提交
				}
			}
		};	
	
	function loginCheck() {
	}

	function loadingShow() {
		$("#page-overlay").show();
	}
	function loadingHide() {
		$("#page-overlay").hide();
	}
	
	function setCookie(cookieName, value, exdays){
		 var exdate = new Date();
		 exdate.setDate(exdate.getDate() + exdays);
		 var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		 document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName){
		 var expireDate = new Date();
		 expireDate.setDate(expireDate.getDate() - 1);
		 document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}

		function getCookie(cookieName) {
		 cookieName = cookieName + '=';
		 var cookieData = document.cookie;
		 var start = cookieData.indexOf(cookieName);
		 var cookieValue = '';
		 if(start != -1){
		  start += cookieName.length;
		  var end = cookieData.indexOf(';', start);
		  if(end == -1)end = cookieData.length;
		  cookieValue = cookieData.substring(start, end);
		 }
		 return unescape(cookieValue);
		}
	
  </script>	
</html>