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
<title>본선 진출자 조회 및 확정</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem5.js" type="text/javascript" charset="utf-8"></script>
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
.drag-table td {
	padding: 0.24rem 0;
}
.backGroundRed td {
	background: #fffafa !important;
}
.endSpan {
	background: #ff0000;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
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
helpHtmlTag = "※ 본선 진출자 조회 페이지 입니다.<br><br>본선 진출자 탭에서 본선 진출자 조회가 가능합니다.<br><br>대회 운영진은 본선 진출자 조정 탭에서 조별 순위를 확인하시고 본선 진출자를 확정하게 됩니다.<br><br>본선 진출자는 기본적으로 시스템에서 자동 선정하며 선정된 진출팀 문제가 있을 경우 수동으로 수정 가능합니다.<br><br>대회 운영진은 본선 진출자 조정 탭에서 자동/수동으로 진출자 선정 후 하단 본선 진출자 확정 버튼으로 예선전 종료와 함께 본선 진출자 확정을 합니다.<br><br>본선 진출자 선정시 예로<br>예) 준결승 진출자 선정의 경우 조별 1위 1팀 조별 2위 3팀 과 같은 오류를 범하지 않도록 주의 하세요.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>본선 진출자 조회 및 확정</span>
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
          
		  
	      <c:if test="${userInfo.AUTH == 'A' || userInfo.AUTH == 'B'}">
          <div class="tabHead pb22">
            <div class="tabSelected" onclick="changeTab(this, 1)">본선 진출자</div>
            <div onclick="changeTab(this, 2)">본선 진출자 조정</div>
          </div>      
	      </c:if>    
          
          <div class="scroll-wrap f-col" id="gameTable2" style="padding-bottom:1.64rem;">
          

            
          </div>
          
          <div class="scroll-wrap f-col" id="gameTable1" style="display:none;padding-bottom:1.64rem;">
          

            
          </div>

	        <c:if test="${userInfo.AUTH == 'A' || userInfo.AUTH == 'B'}">
	       	<div>
	      		<div class="blueBtn subBtn f-col font26" id="gotoFinalMatdh">본선 진출자 확정</div>
	      	</div>
	      	</c:if>
        </div>
      </div>

    </div>
    
      

	<div class="radio-pop" id="setupStartTime" style="display:none;">
		<div class="radio-wrap" style="padding:0;width:6.5rem;">
			<div style="padding: 0.2rem;">
				<div class="title1">
                	<div>
                  		<i class="fourDPlex icon-sanjiao"></i>
                  		<span>예선전 경기 결과</span>
                	</div>
              	</div>
			</div>
	        
	        <div class="scroll-wrap f-col" id="gameCourtList" style="padding: 0.2rem;height: 4rem;">
	          
	
	            
	        </div>
	        
			<div class="model-gray" style="border:0;margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
	            <div class="bottom-model" style="padding-top: 0;">
					<button class="btn-white" onclick="$('#setupStartTime').hide();">취소</button>
	            </div>
	        </div>
	        
		</div>
	</div>          
      
  </body>
<script>

	$(function() {
		getRank();
	});

	function changeTab(el, index){
		$(".tabSelected").removeClass("tabSelected")
		$(el).addClass("tabSelected")
		if(index == 1) {
			$("#gameTable1").hide();
			$("#gameTable2").show();
			getRank();
		} else if(index == 2) {
			$("#gameTable1").show();
			$("#gameTable2").hide();
			getData(true);
		}
	}
	
	function msgBox(msg) {
		
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	

	function getRank() {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_TEAM_GAME_RANK_LIST_FINAL"
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

							thisTag = "R-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
								wechatShareMsg = data.list[0].MCH_NM;
							}

							if (tag != thisTag) {
								htm = ''
								+ '<div class="title2">'
								+ '	<span class="font24 bold">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'</span>'
								+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr>'
								+ '				<th>No</th>'
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
								$("#gameTable2").append(htm);
							}
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].FINAL_SEQ+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A+','+data.list[i].MBR_NM_B+'</td>'
								+ '				<td class="center">'+data.list[i].WIN+'</td>'
								+ '				<td class="center">'+data.list[i].LOSE+'</td>'
								+ '				<td class="center">'+data.list[i].SCORE+'</td>'
								+ '				<td class="center">'+data.list[i].AGE+'</td>'
								+ '				<td class="center">'+data.list[i].GAME_GROUP_NM+' '+data.list[i].NUM+'위</td>'
								+ '			</tr>'
								;
								$("#tbodyList-"+thisTag).append(htm);
								tag = "R-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
							
							
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

	function getData(flag) {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_TEAM_GAME_RANK_LIST_FINAL_TARGET"
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
								+ '				<th>No</th>'
								+ '				<th>팀</th>'
								+ '				<th>승</th>'
								+ '				<th>패</th>'
								+ '				<th>득실</th>'
								+ '				<th>나이</th>'
								+ '				<th>조순위</th>'
								+ '				<th>진출</th>'
								+ '				<th>취소</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable1").append(htm);
							}

							var gameEndTag = '';
							var tagFINAL_YN = '';
							if (data.list[i].FINAL_YN == "Y") {
								tagFINAL_YN = ' class="backGroundRed"';
								j++;
							}
							

							if (data.list[i].RANKING_CNT > 1) {
								// gameEndTag = '<br><span class="dupSpan">동률</span>';
								if (data.list[i].PRELIMINARY_END_YN == "Y") {
									if (data.list[i].FINAL_YN == "Y") {
										gameEndTag = '<br><span class="dupSpan">동률대상</span>';
									}
									else {
										gameEndTag = '<br><span class="dupSpan">동률탈락</span>';
									}
								}
								else {
									gameEndTag = '<br><span class="dupSpan">동률</span>';
								}
							}
							else {
								if (data.list[i].PRELIMINARY_END_YN == "Y") {
									if (data.list[i].FINAL_YN == "Y") {
										gameEndTag = '<br><span class="endSpan">대상</span>';
									}
									else {
										gameEndTag = '<br><span class="endSpanNo">탈락</span>';
									}
								}
								else {
									gameEndTag = '<br><span class="endSpanIng">예선중</span>';
								}
							}
							
							htm = ''
								+ '			<tr'+tagFINAL_YN+'>'
								+ '				<td class="center">'+data.list[i].FINAL_SEQ+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].MBR_NM_A+'<br>'+data.list[i].MBR_NM_B+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].WIN+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].LOSE+'</td>'
								+ '				<td class="center" onclick="getLeagueGameList('+data.list[i].MCH_REQ+')";>'+data.list[i].SCORE+'</td>'
								+ '				<td class="center">'+data.list[i].AGE+'</td>'
								+ '				<td class="center">'+data.list[i].LEAGUE_GROUP+'-'+data.list[i].NUM+gameEndTag+'</td>'
								+ '				<td class="center" onclick="gotoFinalTeam('+data.list[i].MCH_REQ+', \'Y\');">진출</td>'
								+ '				<td class="center" onclick="gotoFinalTeam('+data.list[i].MCH_REQ+', \'N\');">취소</td>'
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
					if (flag) {
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

	$('#gotoFinalMatdh').click(function(e) {

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
			message : '예선 종료된 종목의<br>본선 진행을 진행하시겠습니까?<br><br>종목별로 본선 진행 가능합니다.',
			type : 'confirm',
			callback : function() {
				gotoFinalMatdh();
			}
		});
		
	});
	function gotoFinalMatdh() {

		var load = loading();
		load.show();

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_FINAL_TEAM_INSERT"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					msgBox("저장되었습니다.");
					load.hide();
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
	function gotoFinalTeam(para3, para4) {

		var load = loading();
		load.show();

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_FINAL_TEAM_SET_UP"
		 	 			,para2 : "${para3}"
		 	 			,para3 : para3
		 	 			,para4 : para4
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					if (data.list[0].RSLT == "SUCCESS") {
						getData(false);
						msgBox("저장되었습니다.");
					}
					else {
						msgBox("마감되었습니다.");
					}
					load.hide();
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}

	function getLeagueGameList(a) {
		
		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_TEAM_GAME_MYGAME_LIST"
		 	 			,para2 : "${para3}"
		 	 			,para3 : "N"
		 	 			,para4 : a
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

					var htm = '';
					
					if (data.list.length != 0) {

						$("#gameCourtList").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							if (i == 0) {
								htm = ''
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-court">'
								+ '			<tr>'
								+ '				<th>경기<br>순서</th>'
								+ '				<th>팀 A</th>'
								+ '				<th>결과</th>'
								+ '				<th>결과</th>'
								+ '				<th>팀 B</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameCourtList").append(htm);
							}

							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].GAME_SEQ+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_A+'<br>'+data.list[i].MBR_NM_B_A+'</td>'
								+ '				<td class="center">'+data.list[i].WIN_A+'<br>('+data.list[i].SCORE_A+')</td>'
								+ '				<td class="center">'+data.list[i].WIN_B+'<br>('+data.list[i].SCORE_B+')</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_B+'<br>'+data.list[i].MBR_NM_B_B+'</td>'
								+ '			</tr>'
								;
								$("#tbodyList-court").append(htm);
							
						}

					} else {
						
					}
					$("#setupStartTime").show();
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
	wechatShareMsg = "${userInfo.MCH_NM}";
} catch (e) {
  console.log('error');
}	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
