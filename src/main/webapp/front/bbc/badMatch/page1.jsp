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
<title>대회 신규 생성</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick="history.back(-1);"/>
          <span>대회 신규 생성</span>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
          <div class="model-gray">
            <div class="top-model" style="padding-bottom: 0;border: none;">
              <div class="f-row scroll-title">
                <p class="font24 bold fontColor5">대회 정보를 입력하세요.</p>
              </div>
            </div>
          </div>
          
          
          
          <div class="scroll-wrap f-col">

            <div class="contentList2 pb16" id="jump1">
              <div class="title1">
                <div>
                  <i class="fourDPlex icon-sanjiao"></i>
                  <span>대회 정보</span>
                </div>
              </div>
              <div class="table">
                <table class="table-col2 open" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                  <colgroup>
                  	<col width="20%"/>
                  	<col width="80%"/>
                  </colgroup>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">지역</th>
                    <td class="left">
                    	<div class="input-wrap inContent">
							          <input type="text" id="city" value="" />
							          <div>도시 이름 입력</div>
							        </div>
                  	</td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">대회명</th>
                    <td class="left">
                    	<div class="input-wrap inContent">
							          <input type="text" id="mchNm" value="" />
							          <div>대회명 입력</div>
							        </div>
                  	</td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">주체</th>
                    <td class="left">
                    	<div class="input-wrap inContent">
							          <input type="text" id="agent" value="" />
							          <div>대회 주체자 입력</div>
							        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">연락처</th>
                    <td class="left">
                    	<div class="input-wrap inContent">
							          <input type="text" id="contNm" value="" />
							          <div>담당자 연락처 입력</div>
							        </div>
                    </td>
                  </tr>
                  <tr class="getInputDay intd">
                    <th class="right noHang2 fontGrey Rword">대회 일자</th>
                    <td class="left">
                    	<div class="input-wrap">
							          <input class="imgContent" type="date" id="mchDt" value="" />
							          <div></div>
							        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">대회 시간</th>
                    <td class="left">
                    	<div class="input-wrap inContent">
							          <input type="text" id="mchTm" value="" />
							          <div>대회 시간 입력</div>
							        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">장소</th>
                    <td class="left">
                    	<div class="input-wrap inContent">
							          <input type="text" id="place" value="" />
							          <div>대회 장소 입력</div>
							        </div>
                    </td>
                  </tr>
	                  <tr class="getInput intd">
	                    <th class="center noHang2 fontGrey Rword">게임 시간<br>(분)</th>
	                    <td class="left">
	                    	<div class="input-wrap inContent">
					          <select id="gameTm">
					          	<option value="15">15</option>
					          	<option value="20">20</option>
					          </select>
					        </div>
	                  	</td>
	                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">공식대회 여부</th>
                    <td class="left">
						<div class="such mr20">
                        	<label class="radio">
  	                        <input class="" type="radio" name="matchType" value="Y">
  	                        <span class="Rdefine">공식대회</span>
                          </label>
                        </div>
						<div class="trans mr20">
                        	<label class="radio">
  	                        <input class="" type="radio" name="matchType" value="N">
  	                        <span class="Rdefine">일반대회</span>
                          </label>
                        </div>
                    </td>
                  </tr>
                  <tr class="getTextarea intd">
                    <th class="right noHang2 fontGrey Rword">설명</th>
                    <td class="left"><textarea class="inContent" id="dsc" rows="30" cols="30" placeholder="대회 설명 입력"></textarea></td>
                  </tr>
                </table>
              </div>
            </div>

          
          
            <div class="tab-con-wrap" style="min-height: 0;">
              <div class="btn-area">
                <button class="fourD-blue-btn" onclick="submit()">대회 등록하기</button>
              </div>
            </div>
          </div>

        </div>
      </div>

    </div>  
  </body>
<script>

	function submit() {

		if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B")) {
			messageBox({
				title : '알림',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {}
			});	
			return;
		}
		
		var para11 = $(':radio[name="matchType"]:checked').val();
		var city = $('#city').val();
		var mchNm = $('#mchNm').val();
		var mchDt = $('#mchDt').val();
		var mchTm = $('#mchTm').val();
		var agent = $('#agent').val();
		var contNm = $('#contNm').val();
		var place = $('#place').val();
		var dsc = $('#dsc').val();
		var regSq = "${loginMbrSq}";
		var para12 = $('#gameTm').val();

		
		
		if (city == "") {
			msgBox("도시를 입력하세요.");
			return;
		}
		if (mchNm == "") {
			msgBox("대회명을 입력하세요.");
			return;
		}
		if (mchDt == "") {
			msgBox("대회 일자를 입력하세요.");
			return;
		}
		if (mchTm == "") {
			msgBox("시간을 입력하세요.");
			return;
		}
		if (agent == "") {
			msgBox("주체자를 입력하세요.");
			return;
		}
		if (contNm == "") {
			msgBox("담당자 연락처를 입력하세요.");
			return;
		}
		if (place == "") {
			msgBox("장소를 입력하세요.");
			return;
		}
		if (dsc == "") {
			msgBox("대회 설명을 입력하세요.");
			return;
		}
		if (para12 == "") {
			msgBox("한 게임 소요 시간(분)을 입력하세요.");
			return;
		}


		var load = loading();
		load.show();

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_CREATE"
		 	 			,para2 : mchNm
		 	 			,para3 : mchDt
		 	 			,para4 : mchTm
		 	 			,para5 : agent
		 	 			,para6 : contNm
		 	 			,para7 : place
		 	 			,para8 : dsc
		 	 			,para9 : regSq
		 	 			,para10 : city
		 	 			,para11 : para11
		 	 			,para12 : para12
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					window.location.href="/front/bbc/badMatch/getPage.htm?pageName=home";
				},
				error : function(xhr, status, e) {
					load.hide();
					alert("Error : " + status);
				}
			});
	}
	
	function msgBox(msg) {
		
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	
	
</script>
<script>
try {
	wechatShareMsg = "${userInfo.MCH_NM}";
} catch (e) {
  console.log('error');
}	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
