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
    <title>아이디통합</title>
    <link rel="stylesheet" type="text/css" href="../css/font.css" /> <!--字体图标：公用-->
    <link rel="stylesheet" type="text/css" href="../css/reset.css" /> <!--reset：公用-->
    <link rel="stylesheet" type="text/css" href="../css/common.css" /> <!--公共：公用-->
    <link rel="stylesheet" type="text/css" href="../css/button.css" /> <!--按钮：公用-->
    <script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script> <!--jquery公用-->
    <script src="../js/rem.js" type="text/javascript" charset="utf-8"></script> <!--rem公用-->
</head>
      
  <body>
    <div class="loginContent" id="demoDiv1">

      <button class="loginBtn" id="download" style="width: 100%;height: 1rem;background: #000000;">${amsMbr.MBR_NM}</button>
      <div class="loginLogo" style="padding-top:0.3rem;">
        <img src="${amsMbr.MBR_MAI_IMG_PTH}" style="width:2rem;"/>
      </div>
      <div class="loginInput">
<!--         <form onsubmit="return check(this)" action=""> -->
	        <div class="input-wrap contentText">
	          <input type="" name="" id="userName" value="${amsMbr.MBR_ID}" />
	          <div>아이디 입력</div>
	        </div>
	        
	        <div class="input-wrap contentPassword">
	          <input type="password" name="" id="passWord" value="" />
	          <div>패스워드 입력</div>
	        </div>
	        <!--
	        <div class="switchLabel">
	          <div class="switchIcon">
	            <label class="switch">
	              <input type="checkbox" name="saveId" id="saveId"/>
	              <i class="switch-btn"></i>
	            </label> 
	          </div>
	          <div class="switchWord">아이디 저장</div>
	        </div>
	        -->
	        <button class="loginBtn" id="bbcLogin" style="width: 100%;height: 1rem;margin-top: 0;">아이디 통합</button>
	        <div class="explain">
	          <p class="exWord"><span class="dian">아이디와 PW 입력 후 '아이디 통합' 버튼을 누르시면 APP/WEB 버전 시스템 자동 가입이 됩니다.</span></p>
	          <p class="exWord"><span class="dian">아이디 통합 후 아래 다운로드 버튼을 이용하여 APP를 다운받으세요.</span></p>
	          <p class="exWord"><span class="dian">이미 아이디 통합을 하신분은 재 가입시 새로 입력한 아이디와 비밀번호로 재 가입하게 됩니다.</span></p>
	          <p class="exWord"><span class="dian">계정 입력시 대/소문자를 유의해 주세요</span></p>
	        </div>
<!-- 	      </form> -->

	        <button class="loginBtn light" id="downloadApp" onclick="alert('화면이 전환되면 일반 인터넷브라우저로 열어서 로그인 하세요.');window.location = '/front/bbc/mbr/bbcLogin.htm';" style="width: 100%;height: 1rem;background: #00ff00;">APP 다운로드</button>
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
					var usrValue = $("#userName").val();
					var passWord = $("#passWord").val();
					
					loadingShow();
					
					$.ajax({
				 	 		data:{
				 	 			strMbrid : usrValue
				 	 			,strMbrpw : passWord
				 	 		},
							type : "POST",
							url : "/front/bbc/mbr/bbcLoginAssignSave.htm",
							success : function(data) {
								if(data.ret=="success"){
				     				alert("가입되었습니다.");
									window.location = "/front/bbc/mbr/bbcLoginAssign.htm";
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
	
  </script>
  
  <%@ include file="/front/bbc/inc/loading.jsp"%> 
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
			
</html>