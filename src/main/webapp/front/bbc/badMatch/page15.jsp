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
<title>나의 현황</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
<style>
.drag-table {
    width: 100%;
    border-left: none;
    border-right: none;
    border-top: 2px solid #006ecd;
    border-bottom: 1px solid #CCCCCC;
    z-index: 300;
}
.drag-table td {
	padding: 0.2rem 0.2rem;
}
.tab-img img:first-of-type {
	height: 0.23rem;
    border: 0;
    padding-left: 0.03rem;
    margin: 0;
    vertical-align: initial;
}
.tab-img {
	display: table-cell;
}
.title2 {
	padding-top: 0;
}
.table {
	padding-bottom: 0.4rem;
}
.endSpan {
	background: #000000;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.endSpanIng {
	background: #999999;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.drag-table tr:last-of-type td {
	white-space: nowrap;
}
.drag-table td {
	padding-right: 0;
    padding-left: 0;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="/front/bbc/img/systemLogo2.jpg"></image><p class="headerTitle">배드민턴 대회 관리</p></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
		$("#app").prepend(htm);

		if ("${userInfo.B_LVL}" == "N") {
			messageBox({
				title : '알림',
				message : '회원 가입이 필요합니다.',
				type : 'alert',
				callback : function() {
					window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page4';
				}
			})
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
		}
		
	});
	
	helpHtmlTag = "※ 나의 현황 페이지 입니다.<br><br>나의 대회 참가 결과 조회가 가능합니다.(승급, 입상)<br><br>예선전 및 본선 경기 예정 시작 시간 및 경기하는 코트를 조회할 수 있습니다.<br><br>개인별 게임 시간 확인 하시고 미리 준비해주세요.";
	
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
          <img src="../image/back.png" class="mr24" onclick='window.history.back();'/>
          <span>나의 현황</span>
      	  <a onclick="gotoHelp();" class="matchHelp" style="bottom: 65px;">help</a>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
          <div class="model-gray" style="margin-bottom: 0.64rem;">
			<div class="top-model" style="padding-bottom: 0;border: none;">
              <div class="f-row scroll-title" style="position: relative;">
                <p class="font24 bold fontColor5" id="mchNm">대회명</p>
                <i class="fourDPlex icon-jia" id="tableUpSub" style="position: absolute;right: 0rem;"></i>
              </div>
              <div class="f-row-x-s mt12">
                <div class="f-row">
                  <p class="fullname" id="place">장소</p>
                </div>
                <p class="font20" id="mchDt">일자</p>
              </div>
            </div>
			<%@ include file="/front/bbc/badMatch/headMenu.jsp"%>  
          </div>
          
          <div class="scroll-wrap f-col">
          
          	<!--- areaS ------------>
          	<div id="areaS">
		    	<div class="title">
			    	<span class="font24 bold" id="userNm"></span><span class="font24 bold">님의 현황</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaSlist">
		                <tr>
		                  <th class="noWrapCell">종목</th>
		                  <th class="noWrapCell">조</th>
		                  <th class="noWrapCell">신청번호</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">현황</th>
		                  <th class="noWrapCell">결과</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaA ------------>
          	<div id="areaA">
		    	<div class="title2">
			    	<span class="font24 bold">예선전 경기시간 및 경기결과</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaAlist">
		                <tr>
		                  <th class="noWrapCell">종목</th>
		                  <th class="noWrapCell">조<br>심판</th>
		                  <th class="noWrapCell">팀A</th>
		                  <th class="noWrapCell">결과</th>
		                  <th class="noWrapCell">팀B</th>
		                  <th class="noWrapCell">코트</th>
		                  <th class="noWrapCell">시작<br>/종료</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaB ------------>
          	<div id="areaB" style="display:none;">
		    	<div class="title2">
			    	<span class="font24 bold">예선전 경기 결과</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaBlist">
		                <tr>
		                  <th class="noWrapCell">종목</th>
		                  <th class="noWrapCell">조<br>심판</th>
		                  <th class="noWrapCell">팀A</th>
		                  <th class="noWrapCell">결과</th>
		                  <th class="noWrapCell">결과</th>
		                  <th class="noWrapCell">팀B</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaC ------------>
          	<div id="areaC" style="padding-bottom:1.64rem;">
		    	<div class="title2">
			    	<span class="font24 bold">본선 경기시간 및 경기결과</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaClist">
		                <tr>
		                  <th class="noWrapCell">종목</th>
		                  <th class="noWrapCell">조<br>심판</th>
		                  <th class="noWrapCell">팀A</th>
		                  <th class="noWrapCell">결과</th>
		                  <th class="noWrapCell">팀B</th>
		                  <th class="noWrapCell">코트</th>
		                  <th class="noWrapCell">시작<br>/종료</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaD ------------>
          	<div id="areaD" style="padding-bottom:1.64rem;">
		    	<div class="title">
			    	<span class="font24 bold" id="userNm2"></span><span class="font24 bold">님의 심판 배정경기</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaDlist">
		                <tr>
		                  <th class="noWrapCell">조</th>
		                  <th class="noWrapCell">종목</th>
		                  <th class="noWrapCell">코트</th>
		                  <th class="noWrapCell">시작시간</th>
		                  <th class="noWrapCell">심판</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
        </div>
	        <c:if test="${userInfo.AUTH == 'A'}">
	       	<div>
	      		<div class="blueBtn subBtn f-col font26" id="resetMatch">대회 상태 초기화</div>
	      	</div>
	      	</c:if>
      </div>

    </div>
    
      
  </body>
<script>

	$(function() {
		getData();
	});

	function getData() {

		var load = loading();
		load.show()
	
		var a = getDataMyinfoA();
		var b = getDataMyinfoB();
		var c = getDataMyinfoC();
		var d = getDataMyinfoD();

		if (a && b && c && d) {
			load.hide();
		}
		else {
			messageBox({
				title : '알림',
				message : '관리자에게 문의 하세요.',
				type : 'alert',
				callback : function() {
					load.hide();
				}
			});
		}
	}


	function getDataMyinfoA() {

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_MYPAGE_INFO"
	 	 				,para2 : "${para3}"
	 	 				,para3 : "${loginMbrSq}"
	 	 				,para4 : "A"
	 	 				,para5 : "${para5}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {

							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
								wechatShareMsg = data.list[0].MCH_NM;
								$("#userNm").html(data.list[i].USER_NM);
								$("#userNm2").html(data.list[i].USER_NM);
							}

							var tag = ' ';
							var tag2 = ' ';
							var tagImg = '';
							var tagImg2 = '';
							
							
							if (data.list[i].STSNM == "우승") {
								tag = ' style="background: #fffafa !important;color: #e33143 !important;"';
								tagImg = '<img src="/front/bbc/img/tick-red.png"/>';
							}
							if (data.list[i].FINAL_STSNM == "승급") {
								tag2 = ' style="background: #fafaff !important;color: #006ecd !important;"';
								tagImg2 = '<img src="/front/bbc/img/arrow-transition-090.png"/>';
							}
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].B_LVL_NM+'<br>'+data.list[i].GAME_TYPE_NM+'</td>'
								+ '				<td class="center">'+data.list[i].GAME_GROUP_NM+'</td>'
								+ '				<td class="center">'+data.list[i].MCH_REQ+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A+'<br>'+data.list[i].MBR_NM_B+'</td>'
								+ '				<td class="center tab-img"'+tag+'>'+data.list[i].STSNM+tagImg+'</td>'
								+ '				<td class="center tab-img"'+tag2+'>'+data.list[i].FINAL_STSNM+tagImg2+'</td>'
								+ '			</tr>'
								;
								$("#areaSlist").append(htm);
						}
						
					} else {

						htm = ''
							+ '			<tr>'
							+ '				<td class="center" colspan="6">참가하지 않은 대회 입니다.</td>'
							+ '			</tr>'
							;
							$("#areaSlist").append(htm);
							$(".top-model").hide();
					}
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
		return true;
	}


	function getDataMyinfoB() {

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_MYPAGE_INFO"
	 	 				,para2 : "${para3}"
	 	 				,para3 : "${loginMbrSq}"
	 	 				,para4 : "B"
		 	 			,para5 : "${para5}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

					if (data.list.length != 0) {
						
						var tagGameType = "";
						var tagGameTypePrev = "";
						
						for (var i = 0; i < data.list.length; i++) {

							tagGameType = data.list[i].B_LVL+data.list[i].GAME_TYPE;
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
							}
							
							var gameEndSpan = "";
							if (data.list[i].END_TM != "-") {
								gameEndSpan = '<br><span class="endSpan">종료</span>';
							}

							var winFlgA = "";
							var winFlgB = "";
							var scoreaa = parseInt(data.list[i].SCORE_A);
							var scorebb = parseInt(data.list[i].SCORE_B);
							var lineTag = '';
							if (scoreaa == 0 || scorebb == 0) {
								winFlgA = '<span class="endSpanIng">대기</span>';
							}
							else {
								winFlgA = data.list[i].SCORE_A + ':' + data.list[i].SCORE_B;
							}
							
							if (tagGameType != tagGameTypePrev && i > 0) {
								lineTag = ' style="border-top: 2px solid #9E9E9E;" ';
							}
							
							var tagRef = "";
							if (data.list[i].REFEREE_NM != "" && data.list[i].REFEREE_NM != null) {
								tagRef = '<br><span style="color:blue;">'+data.list[i].REFEREE_NM+'</span>';
							}
							
							htm = ''
								+ '			<tr '+lineTag+'>'
								+ '				<td class="center">'+data.list[i].B_LVL_NM+'<br>'+data.list[i].GAME_TYPE_NM+'</td>'
								+ '				<td class="center">'+data.list[i].GAME_GROUP_NM+tagRef+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_A+'<br>'+data.list[i].MBR_NM_B_A+'</td>'
								+ '				<td class="center">'+winFlgA+gameEndSpan+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_B+'<br>'+data.list[i].MBR_NM_B_B+'</td>'
								+ '				<td class="center">'+data.list[i].COURT+'</td>'
								+ '				<td class="center">'+data.list[i].START_TM+'<br>'+data.list[i].END_TM+'</td>'
								+ '			</tr>'
								;
								$("#areaAlist").append(htm);
								

							tagGameTypePrev = data.list[i].B_LVL+data.list[i].GAME_TYPE;
						}

						
					} else {
						
					}
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
		return true;
	}


	function getDataMyinfoC() {

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_MYPAGE_INFO"
	 	 				,para2 : "${para3}"
	 	 				,para3 : "${loginMbrSq}"
	 	 				,para4 : "C"
		 	 			,para5 : "${para5}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

					if (data.list.length != 0) {

						
						
						for (var i = 0; i < data.list.length; i++) {

							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
							}

							var gameEndSpan = "";
							var scoreaa = parseInt(data.list[i].SCORE_A);
							var scorebb = parseInt(data.list[i].SCORE_B);
							if (scoreaa > scorebb) {
								winFlgA = data.list[i].SCORE_A + ':' + data.list[i].SCORE_B;
								gameEndSpan = '<br><span class="endSpan">종료</span>';
							}
							else if (scoreaa == 0 || scorebb == 0) {
								winFlgA = '<span class="endSpanIng">대기</span>';
							}
							else {
								winFlgA = data.list[i].SCORE_A + ':' + data.list[i].SCORE_B;
								gameEndSpan = '<br><span class="endSpan">종료</span>';
							}

							var tagRef = "";
							if (data.list[i].REFEREE_NM != "" && data.list[i].REFEREE_NM != null) {
								tagRef = '<br><span style="color:blue;">'+data.list[i].REFEREE_NM+'</span>';
							}
							
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].B_LVL_NM+'<br>'+data.list[i].GAME_TYPE_NM+'</td>'
								+ '				<td class="center">'+data.list[i].FINAL_GAME_LAYOUT_NM+tagRef+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_A+'<br>'+data.list[i].MBR_NM_B_A+'</td>'
								+ '				<td class="center">'+winFlgA+gameEndSpan+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_B+'<br>'+data.list[i].MBR_NM_B_B+'</td>'
								+ '				<td class="center">'+data.list[i].COURT+'</td>'
								+ '				<td class="center">'+data.list[i].START_TM+'<br>'+data.list[i].END_TM+'</td>'
								+ '			</tr>'
								;
								$("#areaClist").append(htm);
						}

						/* for (var i = 0; i < data.list.length; i++) {

							var winFlgA = "";
							var winFlgB = "";
							var scoreaa = parseInt(data.list[i].SCORE_A);
							var scorebb = parseInt(data.list[i].SCORE_B);
							if (scoreaa > scorebb) {
								winFlgA = "승"+'<br>('+data.list[i].SCORE_A+')';
								winFlgB = "패"+'<br>('+data.list[i].SCORE_B+')';
							}
							else if (scoreaa == 0 || scorebb == 0) {
								winFlgA = "대기";
								winFlgB = "대기";
							}
							else {
								winFlgA = "패"+'<br>('+data.list[i].SCORE_A+')';
								winFlgB = "승"+'<br>('+data.list[i].SCORE_B+')';
							}
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].B_LVL_NM+'<br>'+data.list[i].GAME_TYPE_NM+'</td>'
								+ '				<td class="center">'+data.list[i].FINAL_GAME_LAYOUT_NM+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_A+'<br>'+data.list[i].MBR_NM_B_A+'</td>'
								+ '				<td class="center">'+winFlgA+'</td>'
								+ '				<td class="center">'+winFlgB+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_B+'<br>'+data.list[i].MBR_NM_B_B+'</td>'
								+ '			</tr>'
								;
							$("#areaDlist").append(htm);
						} */
						
					} else {
						
					}
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
		return true;
	}

	

	function getDataMyinfoD() {

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_MYPAGE_INFO"
	 	 				,para2 : "${para3}"
	 	 				,para3 : "${loginMbrSq}"
	 	 				,para4 : "D"
		 	 			,para5 : "${para5}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {

							if (i == 0) {
								$("#userNm2").html(data.list[i].USER_NM);
							}
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].B_LVL_NM+'</td>'
								+ '				<td class="center">'+data.list[i].GAME_TYPE_NM+'</td>'
								+ '				<td class="center">'+data.list[i].COURT+'</td>'
								+ '				<td class="center">'+data.list[i].START_TM+'</td>'
								+ '				<td class="center">'+data.list[i].REFEREE_NM+'</td>'
								+ '			</tr>'
								;
								$("#areaDlist").append(htm);
						}

					} else {
						
					}
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
		return true;
	}

	function joinMatch() {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";
	}

	function msgBox(msg) {
		
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	
	

	function deleteReq(mchReq) {
		
		if ("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B") {
			messageBox({
				title : '알림',
				message : '대회 참가 신청을 취소하시겠습니까?',
				type : 'confirm',
				callback : function() {
					deleteMchReq(mchReq);
				}
			});			
		}
		else {
			msgBox("권한이 없습니다.");
			return;
		}

		
	}	

	function deleteMchReq(para3) {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_DELETE_MATCH_PLR_REQ"
		 	 			,para2 : "${para3}"
		 	 			,para3 : para3
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					msgBox("취소되었습니다.");
					getData("2", "${para3}");
					load.hide();
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
	

	$('#resetMatch').click(function(e) {

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
			message : '대회를 종료하시겠습니까?',
			type : 'confirm',
			callback : function() {
				resetMatch();
			}
		});
		
	});
	
	function resetMatch() {

		var load = loading();
		load.show();

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_RESET"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					msgBox("진행중이던 대회 상태가 초기화 되었습니다.");
					load.hide();
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}

</script>
<script>
try {
	wechatShareMsg = "나의 현황";
} catch (e) {
  console.log('error');
}	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
