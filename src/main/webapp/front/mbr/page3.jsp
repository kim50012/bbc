<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원 조사 안건 신규 생성</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick="history.back(-1);"/>
          <span>회원 조사 안건 신규 생성</span>
        </div>
      </header>
      <div class="content">
        <div class="container f-column refresh-wrap" style="padding-top: 0.32rem; height: 100%;">
          <div class="model-gray">
            <div class="top-model" style="padding-bottom: 0;border: none;">
              <div class="f-row scroll-title">
                <!--<p class="font24 bold fontGrey">(수신) </p>-->
                <p class="font24 bold fontColor5">클럽 회원에게 조사할 안건을 생성하세요.</p>
              </div>
              <div class="f-row-x-s">
                <div class="f-row">
                  <p class="fullname" style="max-width: 4rem;">${amsClb.CLB_NM}</p>
                </div>
                <p class="date">${amsClb.TODAY}</p>
              </div>
            </div>
          </div>
          
          <div class="scroll-wrap f-col">
            <div class="tab-con-wrap">
  
              <div id="tab3" class="tab" style="padding-top: 0.2rem;">
                <div class="textarea-wrap" style="height: 1rem;">
                  <textarea id="strExctit" placeholder="제목을 입력하세요. (请输入题目)"></textarea>
                </div>
              </div>
              
              <div id="tab3" class="tab" style="padding-top: 0.2rem;">
                <div class="textarea-wrap">
                  <textarea id="strExcdct" placeholder="텍스트를 입력해 주세요. (请输入内容)"></textarea>
                </div>
              </div>
  
              <div class="btn-area">
                <button class="fourD-blue-btn" onclick="submit()">등록하기</button>
              </div>
            </div>
          </div>

        </div>
      </div>

    </div>  
  </body>
<script>

	function submit() {
		
		var strExctp = "1003";
		var intClbsq = "${intClbsq }";
		var intAtdcnt = "1";
		var strExcdct = $('#strExcdct').val();
		var strExctit = $('#strExctit').val();

		if (strExcdct == "") {
			alert("${label.请输入内容}");
			return;
		}

		if (strExctit == "") {
			alert("${label.请输入题目}");
			return;
		}

		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			strExctp : strExctp
		 	 			,intClbsq : intClbsq
		 	 			,strExcdct : strExcdct
		 	 			,intAtdcnt : intAtdcnt
		 	 			,strExctit : strExctit
		 	 		},
				type : "POST",
				url : "/front/bbc/exc/msgRegSave.htm",
				success : function(data) {
					window.location.href="/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}";
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
</script>
</html>
