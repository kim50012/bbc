<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
  <head>
    <meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>BBC</title>
    <link rel="stylesheet" type="text/css" href="../css/font.css" /> <!--字体图标：公用-->
    <link rel="stylesheet" type="text/css" href="../css/reset.css" /> <!--reset：公用-->
    <link rel="stylesheet" type="text/css" href="../css/commonA1.css" /> <!--公共：公用-->
    <link rel="stylesheet" type="text/css" href="../css/button.css" /> <!--按钮：公用-->
    <script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script> <!--jquery公用-->
    <script src="../js/rem.js" type="text/javascript" charset="utf-8"></script> <!--rem公用-->
    <style>
    	.loginContent {
    		background-image: url(../image/bg3.jpg);
    	}
   	@media(min-width:720px) {
    	body {
    		width:450px;
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
        <div id="inputNick" style="color: #ffffff;font-size: 0.6rem;text-align: center;-webkit-text-stroke-width: medium;">신규회원 가입</div>
      </div>
      <div class="loginInput">
			<div style="text-align: center; padding-bottom: 10px; ">
			    <img src="${thumbnail_image}" style=" height: 2rem; width: auto; margin: auto;">	          
			</div>
	        <div class="input-wrap contentText">
	          <input type="" name="" id="userID" value="${email}" readonly/>
	        </div>
	        <div class="input-wrap contentText">
	          <input type="" name="" id="userNm" value="" />
	          <div>이름 (실명)</div>
	        </div>
	        <div class="switchLabel">
	          <div class="switchWord">여자&nbsp;&nbsp;</div>
	          <div class="switchIcon">
	            <label class="switch">
	              <input type="checkbox" name="sex" id="sex" checked/>
	              <i class="switch-btn"></i>
	            </label> 
	          </div>
	          <div class="switchWord">남자</div>
	        </div>
	        <div style="height:0.3rem;"></div>
	        <div class="input-wrap contentText">
	          <input type="" name="" id="cmt" value="" />
	          <div id="inputCmt">인사말</div>
	        </div>
	        <button class="loginBtn" id="bbcLogin" style="width: 100%;height: 1rem;">가입하기</button>
	        <div class="explain">
	          <p class="exWord"><span class="dian">카카오톡 연동 로그인시 비밀번호는 필요 없습니다.</span></p>
	          <p class="exWord"><span class="dian">이름은 실명으로 등록 해주세요.</span></p>
	        </div>
<!-- 	      </form> -->

      </div>
    </div>
  </body>
  <script type="text/javascript">
	$(document).ready(function(){
		
		if ("${ret}" == "success") {
			if ("${strPtourl}" == "") {
// 				window.location = "/front/bbc/badMatch/getPage.htm?pageName=home&shopId=68";
// 				window.location = "/front/bbc/clb/clbDetMy.htm?intClbsq=59&shopId=68";
				if ("${sessoinMember.clubSeq}" == "0") {
					window.location = "/front/bbc/badMatch/getPage.htm?pageName=home";
				}
				else {
					window.location = "/front/bbc/clb/clb.htm?shopId=68";
				}
			}
			else {
				window.location = "${strPtourl}&shopId=68";
			}
		}
		
		$('input').on('input',function() {
			if($(this).val()) {
				$(this).css('background-color','#FFFFFF')
			} else {
				$(this).css('background-color','none')
			}
		});
		
		$("input").keyup(function(){
			usrValue = $("#userID").val();
			if(usrValue!=""){
				$(".loginBtn").addClass("light")
			}else{
				$(".loginBtn").removeClass("light")
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
		
	}); 
	
	var appLogin = {
			biz: {
				login: function() {
					var userID = $("#userID").val();
					var sex = "1";
					
					if ($("#saveId").is(":checked")) {
						sex = "2";
					}
					else { // ID 저장하기 체크 해제 시,
						sex = "1";
					}		

					var userNm = $("#userNm").val();
					
					var cmt = $("#cmt").val();

					if (userID == "") {
						alert("아이디를 입력하세요.");
						return false;
					}
					if (userNm == "") {
						alert("실명으로 이름을 입력하세요.");
						return false;
					}
					loadingShow();

					var jopType = "I"; 

					 $.ajax({
					 	 		data:{
					 	 			para1 : "AMS_USER_INSERT"
					 	 			,para2 : "1"
					 	 			,para3 : userID
					 	 			,para4 : userNm
					 	 			,para5 : sex
					 	 			,para6 : "${thumbnail_image}"
						 	 		,para7 : "KAKAO"
					 	 		},
							type : "POST",
							url : "/front/bbc/badMatch/userInsert.htm",
							success : function(data) {
								console.log(data);
								var statusFlag = data.list[0].RSLT;
								
								if (statusFlag == 'FAIL') {
									alert("이미 가입되어 있는 아이디 입니다.");
									loadingHide();
									return;
								}

								alert("정상 가입 되었습니다. \n다시 한번 로그인 해주세요.");
								window.location = "/front/bbc/mbr/bbcLogin.htm";
								
							},
							error : function(xhr, status, e) {
								loadingHide();
								alert("Error : " + status);
							}
						});					
					
					
					return false;
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