<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
  <head>
    <title>BBC</title>
    <meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<link rel="apple-touch-icon" href="/images/bbcicon2.png" />
    <link rel="stylesheet" type="text/css" href="/front/bbc/css/font.css" /> <!--字体图标：公用-->
    <link rel="stylesheet" type="text/css" href="/front/bbc/css/reset.css" /> <!--reset：公用-->
    <link rel="stylesheet" type="text/css" href="/front/bbc/css/common.css" /> <!--公共：公用-->
    <link rel="stylesheet" type="text/css" href="/front/bbc/css/button.css" /> <!--按钮：公用-->
    <script src="/front/bbc/js/jquery.js" type="text/javascript" charset="utf-8"></script> <!--jquery公用-->
    <script src="/front/bbc/js/rem5.js" type="text/javascript" charset="utf-8"></script> <!--rem公用-->
    <style>
    	.loginContent {
    		background-image: url(/front/bbc/image/bg3.jpg);
    	}
   	@media(min-width:720px) {
    	body {
    		width:450px;
    		background-color: #c0c0c0;
    	}
 		.footer {
 			width:450px;
 		}
		.loginContent {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 450px;
		}
   	}
    </style>
</head>

  <body>
    <div class="loginContent" id="demoDiv1">
      <div class="loginLogo">
        <div id="inputNick" style="color: #ffffff;font-size: 1rem;text-align: center;-webkit-text-stroke-width: medium;">SHUT UP & BANDMINTON</div>
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
	        <button class="loginBtn light" id="kakaoLogin" style="width: 100%;height: 1rem;">카카오톡 로그인</button>
	        <button class="loginBtn light" id="bbcLogin2" style="width: 100%;height: 1rem;display:none;">신규회원가입</button>
	        <div class="explain">
	          <p class="exWord"><span class="dian">WEB 아이디가 없는 사용자는 카카오톡 로그인으로 회원 가입후 사용하세요.</span></p>
	          <p class="exWord"><span class="dian">단, 본 시스템은 관리자가 승인한 사용자에 한하여 사용할 수 있습니다.</span></p>
	          <p class="exWord"><span class="dian">관리자 승인없이 가입된 사용자는 임의로 삭제될 수 있습니다.</span></p>
	        </div>
<!-- 	      </form> -->

<!-- 			<button class="loginBtn light" id="downloadApp" onclick="window.location = 'http://39.104.55.19/bbcApp.apk';" style="width: 30%;height:0.5rem;background: #e9711a;font-size: 0.25rem;margin-left: 70%;">APP 다운로드</button> -->
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
			window.location='userAddRequest.htm';
		});

		$('#kakaoLogin').click(function(e) {
// 			e.preventDefault();
			window.location='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=f8b8ac6fcf571cfe300bc86228b077ce&redirect_uri=http://203.113.146.245:8080/front/bbc/mbr/userAddRequest.htm';
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
					
					loadingShow();

					if ($("#saveId").is(":checked")) {
						setCookie("usrValue", usrValue, 360); // 360일 동안 쿠키 보관
						setCookie("passWord", passWord, 360); // 360일 동안 쿠키 보관
					}
					else { // ID 저장하기 체크 해제 시,
						deleteCookie("usrValue");
						deleteCookie("passWord");
					}					
					
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
									
									if ("${strPtourl}" == "") {
// 										window.location = "/front/bbc/badMatch/getPage.htm?pageName=home&shopId=68";
// 										window.location = "/front/bbc/clb/clbDetMy.htm?intClbsq=59&shopId=68";
										window.location = "/front/bbc/clb/clb.htm?shopId=68";
									}
									else {
										window.location = "${strPtourl}&shopId=68";
									}
								}
								else if (data.ret=="KAKAO_NOT_ASSGIN") {

// 									if ("${strPtourl}" == "") {
// 										window.location = "/front/bbc/badMatch/getPage.htm?pageName=home&shopId=68";
// 									}
// 									else {
// 										window.location = "${strPtourl}&shopId=68";
// 									}
									
									window.location='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=f8b8ac6fcf571cfe300bc86228b077ce&redirect_uri=http://203.113.146.245:8080/front/bbc/mbr/kakaoAssign.htm';
								}
								else{
									loadingHide();
				     				alert("Login failed !");
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
  
  <%@ include file="/front/bbc/inc/loading.jsp"%> 
		
		
</html>