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
</head>
      
  <body>
    <div class="loginContent" id="demoDiv1">
      <div class="loginLogo">
        <div id="inputNick" style="color: #ffffff;font-size: 0.5rem;text-align: center;">WEB SYSTEM 사용자 신청</div>
      </div>
      <div class="loginInput">
<!--         <form onsubmit="return check(this)" action=""> -->
	        <div class="input-wrap contentText">
				<select type="" id="clbSq">
					<option value="">클럽선택</option>
					<option value="9">북경 배드민턴 클럽</option>
					<option value="23">TJKBC</option>
					<option value="27">중경아이콕</option>
					<option value="31">누구라도배드민턴</option>
					<option value="33">북경 위러 조선족 배드민턴 클럽</option>
				</select>
	        </div>
	        <div class="input-wrap contentText">
	          <input type="" name="" id="userNick" value="" />
	          <div id="inputNick">위챗 닉네임 입력</div>
	        </div>
	        <div class="input-wrap contentText">
	          <input type="" name="" id="userClbNick" value="" />
	          <div id="inputClbNick">클럽내 이름</div>
	        </div>
	        <div class="input-wrap contentText">
	          <input type="" name="" id="userName" value="" />
	          <div id="inputID">사용하실 신규 아이디 입력</div>
	        </div>
	        
	        <div class="input-wrap contentPassword">
	          <input type="password" name="" id="passWord" value="" />
	          <div id="inputPW">패스워드 입력</div>
	        </div>
	        <div class="input-wrap contentPassword">
	          <input type="password" name="" id="passWord2" value="" />
	          <div id="inputPW">패스워드 확인</div>
	        </div>
	        <div class="input-wrap contentText">
	          <input type="" name="" id="cmt" value="" />
	          <div id="inputCmt">비고</div>
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
	        <button class="loginBtn" id="bbcLogin" style="width: 100%;height: 1rem;">신청하기</button>
	        <div class="explain">
	          <p class="exWord"><span class="dian">신청하신 아이디는 기존 사용하던 위챗 아이디와 통합됩니다.</span></p>
	          <p class="exWord"><span class="dian">신청 후 최대 2일 이내 관리자 승인 후 사용이 가능합니다.</span></p>
	          <p class="exWord"><span class="dian">단, 본 시스템은 위챗 공증계정에서 계정 등록 한 사용자에 한해 사용할 수 있습니다.</span></p>
	        </div>
<!-- 	      </form> -->

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
				$(".loginBtn").addClass("light")
			}else{
				$(".loginBtn").removeClass("light")
			}
		}
		
	}); 
	
	var appLogin = {
			biz: {
				login: function() {
					var userName = $("#userName").val();
					var passWord = $("#passWord").val();
					var passWord2 = $("#passWord2").val();
					
					var clbSq = $("#clbSq").val();
					var userNick = $("#userNick").val();
					var userClbNick = $("#userClbNick").val();
					var cmt = $("#cmt").val();

					if (passWord != passWord2) {
						alert("비밀번호가 일치하지 않습니다.");
						return false;
					}
					if (clbSq == "") {
						alert("가입된 클럽 하나를 선택하세요.");
						return false;
					}
					if (userNick == "") {
						alert("위챗 닉네임을 선택하세요.");
						return false;
					}
					if (userClbNick == "") {
						alert("클럽내 사용했던 이름을 입력하세요.");
						return false;
					}
					if (userName == "") {
						alert("아이디를 입력하세요.");
						return false;
					}
					if (passWord == "") {
						alert("비밀번호를 입력하세요.");
						return false;
					}
					
					loadingShow();

					if ($("#saveId").is(":checked")) {
						setCookie("usrValue", userName, 360); // 360일 동안 쿠키 보관
						setCookie("passWord", passWord, 360); // 360일 동안 쿠키 보관
					}
					else { // ID 저장하기 체크 해제 시,
						deleteCookie("usrValue");
						deleteCookie("passWord");
					}

					var clbSq = $("#clbSq").val();
					var userNick = $("#userNick").val();
					var userClbNick = $("#userClbNick").val();
					var userName = $("#userName").val();
					
					var jopType = "I"; 
					
					$.ajax({
				 	 		data:{
				 	 			strJobtype : jopType
				 	 			,intClbsq : clbSq
				 	 			,strMbrid : userName
				 	 			,strMbrnm : userNick
				 	 			,strLnkactid : userNick
				 	 			,strClbniknm : userClbNick
				 	 			,strMbrpw : passWord
				 	 			,strMmo : cmt
				 	 		},
							type : "POST",
							url : "/front/bbc/mbr/userAddSave.htm",
							success : function(data) {
								console.log(data);
								alert("회원신청이 완료되었습니다. \n2일 이내 승인이 완료됩니다.");
								window.location = "/front/bbc/mbr/bbcLogin.htm";
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