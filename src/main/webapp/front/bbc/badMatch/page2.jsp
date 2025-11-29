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
<title>대회 현황</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="../js/dist/css/swiper.min.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem5.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="/front/bbc/img/systemLogo2.jpg"></image><p class="headerTitle">배드민턴 대회 관리</p></div><div class="font24 bold"></div></header>'
		$("#appPage2").prepend(htm)
		$(".app-header").click(
			function() {
				window.location.href = '/front/bbc/badMatch/getPage.htm?pageName=home';
			});

	});
	helpHtmlTag = "※ 대회 현황 페이지 입니다.<br><br>나의 현황, 참가자 조회, 대진표, 입상자 명단 등 대회 관련 각종 정보 바로가기로 조회가 가능합니다.<br><br>각 조별 종목별 참가 신청 버튼으로 대회에 참가 가능합니다.<br><br>단, 몇몇 대회는 관리자에 의해 참가 가능하니 참고하세요.";
	
</script>
<style>
.category div {
	width: 3.3rem;
}
    .swiper-container {
        width: 100%;
        height: 2.2rem;
        
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    
    .table-col2 td {
    	font-size: 0.24rem;
    	line-height: 0.3rem;
    }
</style>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
          <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=home";'/>
          <span>대회 현황</span>
      	  <a onclick="gotoHelp();" class="matchHelp" style="bottom: 65px;">help</a>
        </div>
      </header>
      <div class="content">
        
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
          <div class="model-gray" style="margin-bottom: 0.3rem;">
			<div class="top-model" style="padding-bottom: 0;border: none;">
              <div class="f-row scroll-title" style="position: relative;">
                <p class="font24 bold fontColor5" id="mchNm">대회명</p>
              </div>
              <div class="f-row-x-s mt12">
                <div class="f-row">
                  <p class="fullname" id="stsNm">-</p>
                </div>
                <p class="font20" id="gameStsNm">-</p>
              </div>
            </div>
          </div>
          
          <div class="scroll-wrap f-col">

            <div class="contentList2 pb16" id="jump1">
			  <div class="title2" style="position: relative;">
				<span class="font24 bold" style="padding-left: 0.4rem;color: #0080c6;">대회 정보</span>
                <i class="fourDPlex icon-jian" id="tableUpSub2" style="position: absolute;left: 0rem;"></i>
                <c:if test="${userInfo.AUTH eq 'A'}">
				<span class="font20 fontOrange" id="modifyMatchHead">대회내용 수정</span>
                </c:if>
			  </div>              
              
              <div class="category" style="margin-top: -0.16rem;">
                <c:if test="${userInfo.AUTH eq 'A' || userInfo.AUTH eq 'B' || userInfo.AUTH eq 'C'}">
                <div class="catigoryElement" onclick="gotoManager();"style="width: 49%;background: #0080c6;color: #ffffff;">대회관리자</div>
                <div class="catigoryElement" onclick="$('#sendMuliMsgPop').show();" style="width: 49%;background: #0080c6;color: #ffffff;">메시지 발송</div>
                </c:if>
                <div class="catigoryElement" id="myInfo" style="width: 49%;">나의 현황</div>
                <div class="catigoryElement" id="entryDtl" style="width: 49%;">참가자 조회</div>
                <div class="catigoryElement" id="matchStatus" style="width: 49%;">대회 진행 현황</div>
                <div class="catigoryElement" id="courtGameList" style="width: 49%;">코트별 경기시간표</div>
                <div class="catigoryElement" id="gamePlan" style="width: 49%;border: 1px solid #4CAF50;">예선 대진표</div>
                <div class="catigoryElement" id="tonTable" style="width: 49%;border: 1px solid #2196F3;">본선 대진표</div>
                <div class="catigoryElement" id="gameTable" style="width: 49%;border: 1px solid #4CAF50;">예선 경기시간표</div>
                <div class="catigoryElement" id="finalGameTime" style="width: 49%;border: 1px solid #2196F3;">본선 경기시간표</div>
                <div class="catigoryElement" id="gameResult" style="width: 49%;border: 1px solid #4CAF50;">예선 결과 ★</div>
                <div class="catigoryElement" id="finalResult" style="width: 49%;border: 1px solid #2196F3;">본선 결과 ★</div>
                <div class="catigoryElement" id="tonEntryList" style="width: 49%;border: 1px solid #FF5722;">본선 진출자 확정</div>
                <div class="catigoryElement" id="victoryList" style="width: 49%;border: 1px solid #FF5722;">입상자 명단</div>
<!--                 <div class="catigoryElement" id="gamePointInput" style="width: 49%;">점수판-자동변환</div> -->
<!--                 <div class="catigoryElement" id="gamePointInput2" style="width: 49%;">점수판-세로고정</div> -->
              </div>
              
            </div>


		    <div class="contentList2 pb16">
              <div class="title1" id="titleLvl2" style="display:none1;">
                <div>
                  <i class="fourDPlex icon-sanjiao"></i>
                  <span>대회 정보</span>
                </div>
              </div>
              
              <div class="table" style="padding-bottom: 0;">
                <table class="table-col2 open" id="tableHead" cellspacing="0" cellpadding="2" width="100%" border="1" style="display:none1;">

                  <colgroup>
                  	<col width="20%"/>
                  	<col width="80%"/>
                  </colgroup>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">지역</th>
                    <td class="left"><span id="city"></span></td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">주체</th>
                    <td class="left"><span id="agent"></span></td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">연락처</th>
                    <td class="left"><span id="contNm"></span></td>
                  </tr>
                  <tr class="getInputDay intd">
                    <th class="right noHang2 fontGrey Rword">대회 일자</th>
                    <td class="left"><span id="mchDt"></span></td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">대회 시간</th>
                    <td class="left"><span id="mchTm"></span></td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">장소</th>
                    <td class="left"><span id="place"></span></td>
                  </tr>
                  <tr class="getTextarea intd">
                    <th class="right noHang2 fontGrey Rword">설명</th>
                    <td class="left">
                    	<pre id="dsc" style="white-space: pre-wrap;">
                    	</pre>
                    </td>
                  </tr>
                  <c:if test="${userInfo.AUTH eq 'A'}">
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">조배정</th>
                    <td class="left">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0.1rem;">
			                <div class="blueBtn subBtn f-col font26" id="createGameGroup" style="padding: 0.1rem 0.2rem;">조배정(3,4)</div>
			                <div class="orangeBtn subBtn f-col font26" id="createGameGroup2" style="padding: 0.1rem 0.2rem;">조배정(3,4,5)</div>
			                <div class="blueBtn subBtn f-col font26" id="createGameGroup3" style="padding: 0.1rem 0.2rem;">조배정(3,4,5,6)</div>
			              </div>
			            </div>                    
                    </td>
                  </tr>
                  </c:if>
                  <c:if test="${userInfo.AUTH eq 'A'}">
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">권한 관리</th>
                    <td class="left">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0.1rem;">
			                <div class="blueBtn subBtn f-col font26" id="gotoAuth" style="padding: 0.15rem 0.3rem;">권한 관리</div>
			              </div>
			            </div>                    
                    </td>
                  </tr>
                  </c:if>
                </table>
              </div>
              
              
            </div>

        	<div id="tableWrap">
              <div class="title1">
                <div>
                  <i class="fourDPlex icon-sanjiao"></i>
                  <span class="bold">대회 참가 현황</span>
                </div>
              </div>
              <div class="table">
	              <table class="drag-table" id="entryListTable" cellspacing="0" cellpadding="2" width="100%" border="1">
	                <colgroup>
	                	<col width="20%" />
	                	<col width="60%" />
	                	<col width="20%" />
	                </colgroup>
	                <!-- ---------- 자강조 ---------- -->
	                <tr style="display:none;">
	                  <th><div class="green-solid fontGreen">자강조</div></th>
	                  <td>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umm.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">남복 참가 : <span id="entryCntSmm">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/uww.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">여복 참가 : <span id="entryCntSww">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umw.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">혼복 참가 : <span id="entryCntSmw">0</span>팀</span>
	                  	</div>
	                  </td>
	                  <td style="padding:0.1rem;">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0;">
			                <div class="orangeBtn subBtn f-col font26" id="enterSbtn" onclick="gotoUrl('S');">참가<br>신청</div>
			              </div>
			            </div>
	                  </td>
	                </tr>
	                
	                
	                <!-- ---------- AAAAA ---------- -->
	                <tr>
	                  <th><div class="blue-solid fontBlue">A조</div></th>
	                  <td>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umm.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">남복 참가 : <span id="entryCntAmm">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/uww.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">여복 참가 : <span id="entryCntAww">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umw.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">혼복 참가 : <span id="entryCntAmw">0</span>팀</span>
	                  	</div>
	                  </td>
	                  <td style="padding:0.1rem;">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0;">
			                <div class="blueBtn subBtn f-col font26" id="enterAbtn" onclick="gotoUrl('A');">참가<br>신청</div>
			              </div>
			            </div>
	                  </td>
	                </tr>
	                
	                
	                <!-- ---------- BBBBB ---------- -->
	                <tr>
	                  <th><div class="green-solid fontGreen">B조</div></th>
	                  <td>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umm.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">남복 참가 : <span id="entryCntBmm">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/uww.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">여복 참가 : <span id="entryCntBww">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umw.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">혼복 참가 : <span id="entryCntBmw">0</span>팀</span>
	                  	</div>
	                  </td>
	                  <td style="padding:0.1rem;">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0;">
			                <div class="orangeBtn subBtn f-col font26" id="enterBbtn" onclick="gotoUrl('B');">참가<br>신청</div>
			              </div>
			            </div>
	                  </td>
	                </tr>
	                
	                
	                <!-- ---------- CCCCC ---------- -->
	                <tr>
	                  <th><div class="blue-solid fontBlue">C조</div></th>
	                  <td>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umm.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">남복 참가 : <span id="entryCntCmm">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/uww.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">여복 참가 : <span id="entryCntCww">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umw.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">혼복 참가 : <span id="entryCntCmw">0</span>팀</span>
	                  	</div>
	                  </td>
	                  <td style="padding:0.1rem;">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0;">
			                <div class="blueBtn subBtn f-col font26" id="enterCbtn" onclick="gotoUrl('C');">참가<br>신청</div>
			              </div>
			            </div>
	                  </td>
	                </tr>
	                
	                
	                <!-- ---------- DDDDD ---------- -->
	                <tr>
	                  <th><div class="green-solid fontGreen">D조</div></th>
	                  <td>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umm.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">남복 참가 : <span id="entryCntDmm">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/uww.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">여복 참가 : <span id="entryCntDww">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umw.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">혼복 참가 : <span id="entryCntDmw">0</span>팀</span>
	                  	</div>
	                  </td>
	                  <td style="padding:0.1rem;">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0;">
			                <div class="orangeBtn subBtn f-col font26" id="enterDbtn" onclick="gotoUrl('D');">참가<br>신청</div>
			              </div>
			            </div>
	                  </td>
	                </tr>
	                
	                
	                <!-- ---------- EEEEE ---------- -->
	                <tr>
	                  <th style="border-bottom: 1px solid #CCCCCC;"><div class="blue-solid fontBlue">초심자</div></th>
	                  <td>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/umm.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">남복 참가 : <span id="entryCntEmm">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10">
	                  		<img src="../image/uww.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">여복 참가 : <span id="entryCntEww">0</span>팀</span>
	                  	</div>
	                  	<div class="tab-img mb16 mb10" style="display:none;">
	                  		<img src="../image/umw.png" style="height:0.28rem;"/><span style="padding-left:0.1rem;">혼복 참가 : <span id="entryCntEmw">0</span>팀</span>
	                  	</div>
	                  </td>
	                  <td style="padding:0.1rem;">
						<div class="btn-wrap" style="padding:0;">
			          	  <div class="buttons" style="padding:0;">
			                <div class="blueBtn subBtn f-col font26" id="enterEbtn" onclick="gotoUrl('E');">참가<br>신청</div>
			              </div>
			            </div>
	                  </td>
	                </tr>
	              </table>
            	</div>
            </div>
			      
			<div class="fontOrange" style="padding:0.2rem;text-align:center;font-size: 0.34rem;line-height: 1.2rem;">
				많은 참가 신청 부탁드립니다.
			</div>
          </div>

        </div>
      </div>

    </div>
    
    
	<div class="radio-pop" id="sendMuliMsgPop" style="display:none;">
		<div class="radio-wrap" style="padding:0;width:6.5rem;">
			<div style="padding: 0.2rem;">
				<div class="title1">
                	<div>
                  		<i class="fourDPlex icon-sanjiao"></i>
                  		<span>전체 메시지 발송</span>
                	</div>
              	</div>			
				<table class="table-col2 open" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1" style="padding:0.2rem;">
	                  <colgroup>
	                  	<col width="25%">
	                  	<col width="75%">
	                  </colgroup>
					<tbody>
	                  <tr class="getInput intd">
	                    <th class="right noHang2 fontGrey Rword">메시지 유형</th>
	                    <td class="left">
							<div class="such mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="msgType" value="START">
	  	                        <span class="Rdefine">예선 시작 공지 (전체 참가자 대상)</span>
	                          </label>
	                        </div>
	                        <br>
	                        <br>
							<div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="msgType" value="TOURNAMENT">
	  	                        <span class="Rdefine">본선 시작 공지 (전체 참가자 대상)</span>
	                          </label>
	                        </div>
	                        <br>
	                        <br>
							<div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="msgType" value="BASIC">
	  	                        <span class="Rdefine">기타 공지 (전체 참가자 대상)</span>
	                          </label>
	                        </div>
	                        <br>
	                        <br>
							<div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="msgType" value="MANAGER">
	  	                        <span class="Rdefine">운영진 공지 (대회 운영진 대상)</span>
	                          </label>
	                        </div>
	                    </td>
	                  </tr>
	                  <tr class="getTextarea intd">
	                    <th class="right noHang2 fontGrey Rword">내용</th>
	                    <td class="left"><textarea class="inContent" id="msgCmt" rows="30" cols="30" placeholder="예선, 본선 시작의 경우 입력하지 않아도 자동으로 기입 됩니다."></textarea></td>
	                  </tr>
					</tbody>
				</table>
			</div>
			<div class="model-gray" style="border:0;margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
	            <div class="bottom-model" style="padding-top: 0;">
					<button class="btn-white" onclick="$('#sendMuliMsgPop').hide();">취소</button>
					<button class="confirmBtn" id="confirmBtn" onclick="sendMuliMsg();" style="margin-left: 0.2rem;padding: 0.18rem 0.28rem;">보내기</button>
	            </div>
	        </div>
	        
		</div>
	</div>    
    
      
  </body>
<script src="../js/dist/js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
<script>
	
	var slideFlag2 = true;
	wechatShareMsg = "${userInfo.MCH_NM}";
	
	$(function() {
		getData(2, "${para3}");

		$('#modifyMatchHead').click(function(e) {
			window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page16&para3=${para3}";
		});
		$('#gotoAuth').click(function(e) {
			window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page17&para3=${para3}";
		});
		$('#enterSbtn').click(function(e) {
			gotoUrl("S");
		});	
		$('#enterAbtn').click(function(e) {
			gotoUrl("A");
		});	
		$('#enterBbtn').click(function(e) {
			gotoUrl("B");
		});	
		$('#enterCbtn').click(function(e) {
			gotoUrl("C");
		});	
		$('#enterDbtn').click(function(e) {
			gotoUrl("D");
		});	
		$('#enterEbtn').click(function(e) {
			gotoUrl("E");
		});	

		$('#gamePointInput').click(function(e) {
			window.location.href="/front/bbc/badMatch/gamePointInput.html";
		});
		$('#gamePointInput2').click(function(e) {
			window.location.href="/front/bbc/badMatch/gamePointInput2.html";
		});
	});

	function getData(para2, para3) {

		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT"
		 	 			,para2 : para2
		 	 			,para3 : para3
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					
					$("#mchNm").html(data.list[0].MCH_NM);
					$("#city").html(data.list[0].CITY);
					$("#agent").html(data.list[0].AGENT);
					$("#contNm").html(data.list[0].CONT_NM);
					$("#mchDt").html(data.list[0].MCH_DT);
					$("#mchTm").html(data.list[0].MCH_TM);
					$("#place").html(data.list[0].PLACE);
					$("#dsc").html(data.list[0].DSC);
					$("#entryCntSmm").html(data.list[0].SMM);
					$("#entryCntSww").html(data.list[0].SWW);
					$("#entryCntSmw").html(data.list[0].SMW);
					$("#entryCntAmm").html(data.list[0].AMM);
					$("#entryCntAww").html(data.list[0].AWW);
					$("#entryCntAmw").html(data.list[0].AMW);
					$("#entryCntBmm").html(data.list[0].BMM);
					$("#entryCntBww").html(data.list[0].BWW);
					$("#entryCntBmw").html(data.list[0].BMW);
					$("#entryCntCmm").html(data.list[0].CMM);
					$("#entryCntCww").html(data.list[0].CWW);
					$("#entryCntCmw").html(data.list[0].CMW);
					$("#entryCntDmm").html(data.list[0].DMM);
					$("#entryCntDww").html(data.list[0].DWW);
					$("#entryCntDmw").html(data.list[0].DMW);
					$("#entryCntEmm").html(data.list[0].EMM);
					$("#entryCntEww").html(data.list[0].EWW);
					$("#entryCntEmw").html(data.list[0].EMW);

					$("#stsNm").html(data.list[0].STSNM);
					$("#gameStsNm").html(data.list[0].GAME_STSNM);

					if (data.list[0].STS == 1 || data.list[0].ATTEND_END == 'Y') {

						$("#enterSbtn").hide();
						$("#enterAbtn").hide();
						$("#enterBbtn").hide();
						$("#enterCbtn").hide();
						$("#enterDbtn").hide();
						$("#enterEbtn").hide();
						$("#createGameGroup").hide();
						$("#createGameGroup2").hide();
						$("#createGameGroup3").hide();
					}
					
					load.hide()
				},
				error : function(xhr, status, e) {
					load.hide()
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
	function gotoUrl(a) {
		if ("${para3}" == "5" && "${userInfo.AUTH}" != "A") {
			messageBox({
				title : '알림',
				message : '대회 참가 신청은<br>각 클럽 회장 및 운영진에게 문의 하세요.',
				type : 'alert',
				callback : function() {}
			})
		}
		else {
			window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page3&para3=${para3}&para4="+a;
		}
		
	}

	$('#myInfo2').click(function(e) {


		if ("${userInfo.B_LVL}" == "N") {
			messageBox({
				title : '알림',
				message : '회원 가입이 필요합니다.',
				type : 'alert',
				callback : function() {
					window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page4';
				}
			})
			return;
		}

		if ("${userInfo.B_LVL}" == "") {
			messageBox({
				title : '알림',
				message : '아래 QR 코드를 꾸욱 눌러 스캔후 가입하세요.<br><br><img src="/uploads/68/2020/08/26/68_material_2020_08_26_14_39_48_16996.jpg" style="width: 4.5rem;"/>',
				type : 'alert',
				callback : function() {
					window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page4';
				}
			})
			return;
		}
		
				
		

		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_MYINFO"
		 	 			,para2 : "${para3}"
		 	 			,para3 : "${loginMbrSq}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

					var msg = "참가하지 않은 대회 입니다.";
					if (data.list.length != 0) {
						msg = "";
						for (var i = 0; i < data.list.length; i++) {
							var x = i + 1;
							var tag = "";
							if (i == 0) {
								tag = "";
							}
							else {
								tag = "<br><br>";
							}
							msg = msg + tag + x + ". 신청번호 : <span style='font-size:0.32rem;'>" + data.list[i].MCH_REQ + "</span> (" + data.list[i].B_LVL_NM + ' / ' + data.list[i].GAME_TYPE_NM + ' / '  + data.list[i].GAME_GROUP_NM + ")";
							msg = msg + "<br>" + "- 팀 : " + data.list[i].MBR_NM_A + ", " + data.list[i].MBR_NM_B;
						}
					}

					messageBox({
						title : '알림',
						message : msg,
						type : 'alert',
						callback : function() {
							load.hide()
						}
					})
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
		
	});

	$('#createGameGroup').click(function(e) {

		if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B")) {
			messageBox({
				title : '알림',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {}
			});	
			return;
		}
		
		messageBox({
			title : '알림',
			message : '조 배정을 다시 할 경우 전체 경기 기록이 삭제 됩니다.<br>조 배정을 다시 하시겠습니까?',
			type : 'confirm',
			callback : function() {
				createGameGroup();
			}
		});
		
	});


	$('#createGameGroup2').click(function(e) {

		if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B")) {
			messageBox({
				title : '알림',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {}
			});	
			return;
		}
		
		messageBox({
			title : '알림',
			message : '조 배정을 다시 할 경우 전체 경기 기록이 삭제 됩니다.<br>조 배정을 다시 하시겠습니까?',
			type : 'confirm',
			callback : function() {
				createGameGroup2();
			}
		});
		
	});

	$('#createGameGroup3').click(function(e) {

		if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B")) {
			messageBox({
				title : '알림',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {}
			});	
			return;
		}
		
		messageBox({
			title : '알림',
			message : '조 배정을 다시 할 경우 전체 경기 기록이 삭제 됩니다.<br>조 배정을 다시 하시겠습니까?',
			type : 'confirm',
			callback : function() {
				createGameGroup3();
			}
		});
		
	});
	function createGameGroup() {

		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_UPDATE_GAME_GROUP"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					msgBox("저장되었습니다.");
					load.hide()
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
	function createGameGroup2() {

		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_UPDATE_GAME_GROUP2"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					msgBox("저장되었습니다.");
					load.hide()
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
	function createGameGroup3() {

		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_UPDATE_GAME_GROUP3"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					msgBox("저장되었습니다.");
					load.hide()
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
	

	function sendMuliMsg() {

		var para3 = $(':radio[name="msgType"]:checked').val();
		var para4 = $('#msgCmt').val();
		var para5 = $('#mchNm').html();
		var para6 = $('#gameStsNm').html();
		
		if (para3 == "") {
			msgBox("보낼 메시지 유형을 선택하세요.");
			return;
		}
		
		if (para3 == "BASIC" && para4 == "") {
			msgBox("메시지 내용을 입력하세요.");
			return;
		}
		
		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SEND_MULTI_MSG_TARGET_USER"
		 	 			,para2 : "${para3}"
		 	 			,para3 : para3
		 	 			,para4 : para4
		 	 			,para5 : para5
		 	 			,para6 : para6
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/sendMultiMsg.htm",
				success : function(data) {
					msgBox("발송되었습니다.");
					load.hide()
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}

	<c:if test="${para3 == '5' || para3 == '14' || para3 == '17' || para3 == '18' }">
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        centeredSlides: true,
        autoHeight: true,
        spaceBetween: 30,
        autoplay: 2500
    });
	</c:if>

    function gotoBanner(a) {

    	if (a == 4 || a == 6 || a == 7) {
    		return;	
    	}
    	
    	if (a == 2 || a == 1 ) {
    		window.location.href="https://mp.weixin.qq.com/s/nhSB35b7InEkeKOvp2Nzew";	
    	}
    	else {
    		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page18&para3=${para3}&para4="+a;
    	}

    	if (a == 14) {
    		window.location.href="/front/bbc/badMatch/match14.html";	
    	}

    	if (a == 17) {
    		window.location.href="/front/bbc/badMatch/match17.html";	
    	}

    	if (a == 18) {
    		window.location.href="/front/bbc/badMatch/match18.html";	
    	}
    }

    function gotoManager() {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page19&para3=${para3}";	
    }

  	$("#tableUpSub2").click(function() {
  		if (slideFlag2) {
        	$("#tableHead").hide();
        	$("#titleLvl2").hide();
        	$("#tableUpSub2").removeClass("icon-jian");
        	$("#tableUpSub2").addClass("icon-jia");
        	slideFlag2 = false;
  		}
  		else {
        	$("#tableHead").show();
        	$("#titleLvl2").show();
        	$("#tableUpSub2").removeClass("icon-jia");
        	$("#tableUpSub2").addClass("icon-jian");
        	slideFlag2 = true;
  		}    
      
    });
    
</script>
<script>
try {
	wechatShareMsg = "${userInfo.MCH_NM}";
} catch (e) {
  console.log('error');
}	
</script>
<!--
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

	$(function(){ 

		var title = $("title").html();
		
		if (wechatShareMsg == "") {
			wechatShareMsg = title;
		}
		
		  wx.config({
			    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
			    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
			    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
			    signature: "${signInfo.signature }",// 必填，签名，见附录1
			    jsApiList: [//分享接口
			       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
			        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
			                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});  
		  
		  	wx.ready(function(){

		  		wx.onMenuShareTimeline({
		  		    title: title, // 分享标题
					link: 'http://bbc.manhuaking.cn/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}&shopId=68',
		  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/systemLogo2.jpg', // 分享图标
		  		    success: function () { 
		  		        // 用户确认分享后执行的回调函数
		  		    },
		  		    cancel: function () { 
		  		        // 用户取消分享后执行的回调函数
		  		    }
		  		});
		  		
		  		wx.onMenuShareAppMessage({
		  		    title: title, // 分享标题
		  		    desc: "${userInfo.MCH_NM}", // 分享描述
		  		  	link: 'http://bbc.manhuaking.cn/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}&shopId=68',
					imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/systemLogo2.jpg', // 分享图标
		  		    success: function () { 
		  		        // 用户确认分享后执行的回调函数
		  		       // alert('success 11');
		  		    },
		  		    cancel: function () { 
		  		        // 用户取消分享后执行的回调函数
		  		    	// alert('error 11');
		  		    }
		  		});
			});
		  	
		  	
		  	wx.error(function(res){
		  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
	
		  	});
		  
	});
</script>
-->
</html>
