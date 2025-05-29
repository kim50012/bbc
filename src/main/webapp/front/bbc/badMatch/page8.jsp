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
<title>예선 순위 및 결과 조회/등록</title>
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
	padding: 0.24rem 0.1rem 0.24rem 0.1rem;
}
.table {
    padding-bottom: 0.2rem;
}
.activeTr td {
    border-bottom: 1px solid #e42e43 !important;
}
.activeTr th {
    border-bottom: 1px solid #e42e43 !important;
}
.activeTr td {
    color: #333333 !important;
}
.endSpan {
	background: #000000;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.drag-table td {
	white-space: nowrap;
}
.dupSpan {
	background: #006ecd;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.endSpanNo {
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
</style>
<script>
helpHtmlTag = "※ 예선 경기 결과 조회 페이지 입니다.<br><br>조별 순위에서 본선 진출 여부를 확인 할 수 있습니다.<br><br>경기 결과 조회 탭에서는 각 종목 조별 매 경기 결과를 확인 가능합니다.<br><br>대회 운영진은 경기 결과 조회 탭에서 경기 결과 조회 및 경기 결과 수정, 입력 가능합니다.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>예선 순위 및 결과 조회/등록</span>
      	  <a onclick="gotoHelp();" class="matchHelp" style="bottom: 65px;">help</a>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
          <div class="model-gray">
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
          
          <div class="tabHead pb22">
            <div class="tabSelected" onclick="changeTab(this, 1)">조별 순위</div>
            <div onclick="changeTab(this, 3)">종목별 순위</div>
            <div onclick="changeTab(this, 2)">결과 조회/등록</div>
          </div>

          <div class="scroll-wrap f-col" id="gameTable2" style="padding-bottom:1.64rem;">
          </div>
          
          <div class="scroll-wrap f-col" id="gameTable3" style="display:none;padding-bottom:1.64rem;">            
          </div>
          
          <div class="scroll-wrap f-col" id="gameTable1" style="display:none;padding-bottom:1.64rem;">            
          </div>
        </div>
      </div>

    </div>
    
	<div class="radio-pop" id="userSelectPop" style="display:none;">
		<input type="hidden" id="selectUserObjNm" />
		<div class="radio-wrap" style="padding:0;width:6.5rem;">
			
			<div class="radio-content">

				<div class="container mt10">
		      		<div class="title2">
		              <span class="font24 bold">경기 결과</span><span class="font20 fontOrange">스코어입력</span>
		          	</div>
		            <div class="scroll-wrap" style="padding-bottom:0.5rem;min-height:5rem;height:5rem;">
		         		<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="userResultTbody">
		                <tr>
			                <th class="noWrapCell" id="teamA">팀A</th>
			                <th class="noWrapCell" id="teamB">팀B</th>
		                </tr>
		                <tr>
		                	<td>
                    			<div class="input-wrap inContent" style="height: 1rem;">
							          <input type="hidden" id="strFINAL_GAME_LAYOUT" value="" />
							          <input type="hidden" id="strNEXT_SEQ" value="" />
							          <input type="hidden" id="mchReqA" value="" />
							          <input type="tel" id="scoreA" value="" style="font-size: 0.7rem;text-align: center;"/>
							          <div style="font-size: 0.5rem;">점수입력</div>
							        </div>
							</td>
		                	<td>
                    			<div class="input-wrap inContent" style="height: 1rem;">
							          <input type="hidden" id="mchReqB" value="" />
							          <input type="tel" id="scoreB" value="" style="font-size: 0.7rem;text-align: center;"/>
							          <div style="font-size: 0.5rem;">점수입력</div>
							        </div>
							</td>
		                </tr>
						<!-- START Data Loop -->
						
		         		</tbody>
		         		</table>
		         		<br>
		         		<br>
		         		<br>
		        	</div>
          		</div>

			</div>
			<div class="btn-wrap">
          	  <div class="buttons">
                <div class="blueBtn subBtn f-col font26" onclick="$('#userSelectPop').hide();">취소</div>
                <div class="orangeBtn subBtn f-col font26" onclick="saveGameResult($('#mchReqA').val(), $('#mchReqB').val(), $('#scoreA').val(), $('#scoreB').val(), $('#strFINAL_GAME_LAYOUT').val(), $('#strNEXT_SEQ').val());">경기결과저장</div>
              </div>
            </div>
		</div>
	</div>    
      
  </body>
<script>

	$(function() {
		getRank();
	});
	
	function getData(refreshFlag) {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_TEAM_GAME_LIST"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					var j = 0;
					var tag = "";
					var thisTag = "";
					
					if (data.list.length != 0) {

						$("#gameTable1").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							thisTag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP;
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
							}
							
							if (tag != thisTag) {
								htm = ''
								+ '<div class="title2">'
								+ '	<span class="font24 bold">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'/'+data.list[i].GAME_GROUP_NM+'</span>'
								+ ' <span class="font20 fontOrange" onclick="window.location=\'/front/bbc/badMatch/getPage.htm?pageName=page20&para3=${para3}\';">경기기록 등록</span>'
								+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr>'
								+ '				<th>경기순서<br>시작시간</th>'
								+ '				<th>팀 A</th>'
								+ '				<th>결과</th>'
								+ '				<th>결과</th>'
								+ '				<th>팀 B</th>'
								+ '				<th>입력</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable1").append(htm);
							}

							if (i%2 == 0) {

								var winFlgA = "";
								var winFlgB = "";
								var scoreaa = parseInt(data.list[i].SCORE_A);
								var scorebb = parseInt(data.list[i].SCORE_B);
								var gameEndTag = '<br><span class="endSpan">종료</span>';
								var tagBtn = "<span style='color:#006ecd;'>수정</span>";
								if (scoreaa > scorebb) {
									winFlgA = '승<br>('+data.list[i].SCORE_A+')';
									winFlgB = '패<br>('+data.list[i].SCORE_B+')';
								}
								else if (scoreaa < scorebb) {
									winFlgA = '패<br>('+data.list[i].SCORE_A+')';
									winFlgB = '승<br>('+data.list[i].SCORE_B+')';
								}
								else {
									winFlgA = "대기";
									winFlgB = "대기";
									tagBtn = '<span style="text-decoration: underline;color: #006ecd;">입력</span>';
									gameEndTag = "";
								}
								
								
								htm = ''
									+ '			<tr>'
									+ '				<td class="center">'+data.list[i].GAME_SEQ+'<br>'+data.list[i].START_TM+'</td>'
									+ '				<td class="center">'+data.list[i].MBR_NM_A_A+'<br>'+data.list[i].MBR_NM_B_A+'</td>'
									+ '				<td class="center">'+winFlgA+'</td>'
									+ '				<td class="center">'+winFlgB+'</td>'
									+ '				<td class="center">'+data.list[i].MBR_NM_A_B+'<br>'+data.list[i].MBR_NM_B_B+'</td>'
									+ '				<td class="center" onclick="gameResult('+data.list[i].MCH_REQ_A+', '+data.list[i].MCH_REQ_B+', '+data.list[i].FINAL_GAME_LAYOUT+', '+data.list[i].NEXT_SEQ+', '+scoreaa+', '+scorebb+');">'+tagBtn+gameEndTag+'</td>'
									+ '			</tr>'
									;
									$("#tbodyList-"+thisTag).append(htm);
									tag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP;
							}
							
							
						}
						
					} else {
						
					}
					if (refreshFlag) {
						$("#gameTable1").animate({scrollTop: '0px'}, 0);	
					}
					load.hide();					
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
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

	function setGameTime(a,b,c) {

		messageBox({
			title : '알림',
			message : a+'/'+b+'/'+c+"<br>준비중입니다.",
			type : 'alert',
			callback : function() {}
		})
	}
 	
	
	function changeTab(el, index){
		$(".tabSelected").removeClass("tabSelected")
		$(el).addClass("tabSelected")
		if(index == 1) {
			$("#gameTable1").hide();
			$("#gameTable2").show();
			$("#gameTable3").hide();
			getRank();
		} else if(index == 2) {
			$("#gameTable1").show();
			$("#gameTable2").hide();
			$("#gameTable3").hide();
			getData(true);
		} else if(index == 3) {
			$("#gameTable1").hide();
			$("#gameTable2").hide();
			$("#gameTable3").show();
			getRankGameType();
		}
	}

	function getRankGameType() {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_TEAM_GAME_RANK_GAME_TYPE"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					var j = 0;
					var tag = "";
					var thisTag = "";
					
					if (data.list.length != 0) {

						$("#gameTable3").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							thisTag = "T-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
							}
							
							if (tag != thisTag) {
								j = 0;
								htm = ''
								+ '<div class="title2">'
								+ '	<span class="font24 bold">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'</span>'
								+ '	<span class="font20 fontOrange" id="temCntT-'+thisTag+'">최대 : '+data.list[i].FINAL_GAME_LAYOUT+'팀 진출 가능(현재:<span id="temCnt-'+thisTag+'"></span>)</span>'
								+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr>'
								+ '				<th>순위</th>'
								+ '				<th>팀</th>'
								+ '				<th>승</th>'
								+ '				<th>패</th>'
								+ '				<th>득실</th>'
								+ '				<th>나이</th>'
								+ '				<th>조순위</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable3").append(htm);
							}

							var gameEndTag = '';
							var gameEndTag2 = '';
							var tagFINAL_YN = '';
							if (data.list[i].FINAL_YN == "Y") {
								tagFINAL_YN = ' class="backGroundRed"';
								j++;
							}
							if (data.list[i].PRELIMINARY_END_YN == "Y") {
								if (data.list[i].FINAL_YN2 == "Y") {
									gameEndTag2 = '<br><span class="dupSpan">확정</span>';
								}
								if (data.list[i].FINAL_YN2 == "N") {
									gameEndTag2 = '<br><span class="endSpan">탈락</span>';
								}
							}
							else {
								gameEndTag2 = '<br><span class="endSpanIng">예선중</span>';
							}
							
							
							gameEndTag = "";
							
							if (data.list[i].FINAL_SEQ <= data.list[i].FINAL_GAME_LAYOUT) {
								gameEndTag = '<br><span class="dupSpan">대상</span>';
							}
							
							htm = ''
								+ '			<tr'+tagFINAL_YN+'>'
								+ '				<td class="center">'+data.list[i].FINAL_SEQ+gameEndTag+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].MBR_NM_A+'<br>'+data.list[i].MBR_NM_B+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].WIN+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].LOSE+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].SCORE+'</td>'
								+ '				<td class="center">'+data.list[i].AGE+'</td>'
								+ '				<td class="center">'+data.list[i].LEAGUE_GROUP+'조 '+data.list[i].NUM+'위'+gameEndTag2+'</td>'
								+ '			</tr>'
								;
								$("#tbodyList-"+thisTag).append(htm);
								$("#temCnt-"+thisTag).html(j);	
								tag = "T-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
								
								if (data.list[i].FINAL_GAME_LAYOUT != j) {
									$("#temCntT-"+thisTag).removeClass("fontOrange");
									$("#temCntT-"+thisTag).addClass("fontRed");
								}
								else {
									$("#temCntT-"+thisTag).removeClass("fontRed");
									$("#temCntT-"+thisTag).addClass("fontOrange");
								}
								
						}
						
					} else {
						
					}
					
					$("#gameTable3").animate({scrollTop: '0px'}, 0);
					load.hide();					
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}	


	function getRank() {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_TEAM_GAME_RANK_LIST"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					var j = 0;
					var tag = "";
					var thisTag = "";
					
					if (data.list.length != 0) {

						$("#gameTable2").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							thisTag = "R-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP;
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
								wechatShareMsg = data.list[0].MCH_NM;
							}

							var finalTag = '				<td class="center">-</td>';
							var finalTrTag = '';
							
							if (data.list[i].FINAL_YN2 == "Y") {
								finalTag = '				<td class="center">본선</td>';
								finalTrTag = ' class="activeTr"';
							}
							
							if (tag != thisTag) {
								htm = ''
								+ '<div class="title2">'
								+ '	<span class="font24 bold">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'/'+data.list[i].GAME_GROUP_NM+'</span>'
								+ ' <span class="font20 fontOrange" onclick="window.location=\'/front/bbc/badMatch/getPage.htm?pageName=page20&para3=${para3}\';">경기기록 등록</span>'
								+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr '+finalTrTag+'>'
								+ '				<th>순위</th>'
								+ '				<th>팀</th>'
								+ '				<th>승</th>'
								+ '				<th>패</th>'
								+ '				<th>득실</th>'
								+ '				<th>나이</th>'
								+ '				<th>진출여부</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable2").append(htm);
							}

							htm = ''
								+ '			<tr '+finalTrTag+'>'
								+ '				<td class="center">'+data.list[i].NUM+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A+'/'+data.list[i].MBR_NM_B+'</td>'
								+ '				<td class="center">'+data.list[i].WIN+'</td>'
								+ '				<td class="center">'+data.list[i].LOSE+'</td>'
								+ '				<td class="center">'+data.list[i].SCORE+'</td>'
								+ '				<td class="center">'+data.list[i].AGE+'</td>'
								+ finalTag
								+ '			</tr>'
								;
								$("#tbodyList-"+thisTag).append(htm);
								tag = "R-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP;
							
							
						}
						
					} else {
						
					}
					$("#gameTable2").animate({scrollTop: '0px'}, 0);
					load.hide();					
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}	

    function gameResult(a, b, c, d, e, f) {

    	if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B" || "${userInfo.AUTH}" == "C" || "${userInfo.AUTH}" == "D")) {
    		msgBox("권한이 없습니다.");
			return;
    	}
    	
    	if (a == "0" || b == "0") {
			msgBox("아직 대진표가 나오지 않았습니다.");
			return;
    	}
    	
    	var load = loading();
    	load.show()

    	 $.ajax({
    	 	 		data:{
    	 	 			para1 : "BADMATCH_SELECT_TEAM_NAME"
    	 	 			,para2 : a
    	 	 			,para3 : b
    	 	 		},
    			type : "POST",
    			url : "/front/bbc/badMatch/getData.htm",
    			success : function(data) {

					if (data.list.length != 0) {
						for (var i = 0; i < data.list.length; i++) {
							$("#team"+data.list[i].TAG).html(data.list[i].CLB_NM+"<br><br>"+data.list[i].MBR_NM_A+", "+data.list[i].MBR_NM_B);
							$("#mchReq"+data.list[i].TAG).val(data.list[i].MCH_REQ);
						}
					} else {
						
					}
					load.hide();	
    			},
    			error : function(xhr, status, e) {
    				load.hide()
    				alert("Error : " + status);
    			}
    		});
    	
    	$("#mchReqA").val(a);
    	$("#mchReqB").val(b);
    	$("#scoreA").val(e);
    	$("#scoreB").val(f);
    	if (e == "0") {
    		$("#scoreA").val("");
    	}
    	if (f == "0") {
    		$("#scoreB").val("");
    	}
    	$("#strFINAL_GAME_LAYOUT").val(c);
    	$("#strNEXT_SEQ").val(d);
    	$("#userSelectPop").show();
    }

    function saveGameResult(para4, para5, para6, para7, para9, para10) {

    	var load = loading();
    	load.show();
    	
		if (para6 == "" || para7 == "") {
			msgBox("점수를 입력하세요.");
    		load.hide();
			return;
		}

    	if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B" || "${userInfo.AUTH}" == "C" || "${userInfo.AUTH}" == "D")) {
    		msgBox("권한이 없습니다.");
    		load.hide();
			return;
    	}
    	
    	 $.ajax({
    	 	 		data:{
    	 	 			para1 : "BADMATCH_INSERT_GAME_RESULT"
    	 	 			,para2 : "${para3}"
    	 	 			,para3 : "N"
    	 	 			,para4 : para4
    	 	 			,para5 : para5
    	 	 			,para6 : para6
    	 	 			,para7 : para7
    	 	 			,para8 : "${loginMbrSq}"
   	 	 				,para9 : para9
   	 	 				,para10 : para10
    	 	 		},
    			type : "POST",
    			url : "/front/bbc/badMatch/getData.htm",
    			success : function(data) {
    				
    				if (data.list[0].RSLT == "END_MATCH") {

        				messageBox({
        					title : '알림',
        					message : '예선전이 종료 되었습니다.',
        					type : 'alert',
        					callback : function() {
        						load.hide();
        						$("#userSelectPop").hide();
        					}
        				});
        				return;
    				}
    				
    				var scoreA = parseInt(para6);
    				var scoreB = parseInt(para7);
    				var vicName = "";
    				
    				if (scoreA > scoreB) {
    					vicName = data.list[0].NAMEA + ", " + data.list[0].NAMEB + " 승";
    				}
    				else {
    					vicName = data.list[0].NAMEC + ", " + data.list[0].NAMED + " 승";
    				}

    		    	if (!systemTest) {

//        		    	 $.ajax({
//        		    	 	 		data:{
//        		    	 	 			para1 : data.list[0].OPENIDA
//        		    	 	 			,para2 : data.list[0].OPENIDB
//        		    	 	 			,para3 : data.list[0].OPENIDC
//        		    	 	 			,para4 : data.list[0].OPENIDD
//        		    	 	 			,para5 : $("#mchNm").html() + " - 본선\n" + data.list[0].B_LVL_NM + " / " + data.list[0].GAME_TYPE_NM + " 경기결과 " +  para6 + " : " + para7
//        		    	 	 			,para6 : data.list[0].NAMEA
//        		    	 	 			,para7 : data.list[0].NAMEB
//        		    	 	 			,para8 : data.list[0].NAMEC
//        		    	 	 			,para9 : data.list[0].NAMED
//        		    	 	 			,para10 : vicName
//        		    	 	 			,para11 : "승패에 문제가 있는 경우 대회 관리자에게 문의 하세요."
//        		    	 	 			,para12 : "/front/bbc/badMatch/getPage.htm?pageName=page15&para3=${para3}"
//        		    	 	 		},
//        		    			type : "POST",
//        		    			url : "/front/bbc/badMatch/sendMsg.htm",
//        		    			success : function(data) {
//        		    			},
//        		    			error : function(xhr, status, e) {
//        		    			}
//        		    		});
       				
    		    	}

    				messageBox({
    					title : '알림',
    					message : '저장되었습니다.',
    					type : 'alert',
    					callback : function() {
    						$("#userSelectPop").hide();
    						getData(false);
    					}
    				});
    				
//     				alert("저장되었습니다.");
//     				$("#userSelectPop").hide();
    				
					load.hide();	
    			},
    			error : function(xhr, status, e) {
    				load.hide();
    				alert("Error : " + status);
    			}
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
