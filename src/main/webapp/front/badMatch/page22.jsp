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
<title>대회 진행 현황</title>
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
.endSpan1 {
	background: #999999;
    color: #ffffff;
    padding-left: 0.2rem;
    padding-right: 0.2rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
    padding: 0.1rem;
}
.endSpan2 {
	background: #000000;
    color: #ffffff;
    padding-left: 0.2rem;
    padding-right: 0.2rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
    padding: 0.1rem;
}
.endSpan3 {
	background: #f81d1d;
    color: #ffffff;
    padding-left: 0.2rem;
    padding-right: 0.2rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
    padding: 0.1rem;
}
</style>
<script>
helpHtmlTag = "※ 대회 진행 현황 페이지 입니다.<br><br>각 종목별 진행 현황을 조회 할 수 있습니다.<br><br>코트별 현황 페이지에서는 각 코트별 현재 진행 현황을 조회 가능합니다.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>대회 진행 현황</span>
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
            <div class="tabSelected" onclick="changeTab(this, 1)">종목별 진행 현황</div>
            <div onclick="changeTab(this, 2)">코트별 진행 현황</div>
          </div>
          
          <div class="scroll-wrap f-col" id="gameTable2" style="padding-bottom:1.64rem;">
          

            
          </div>
          
          <div class="scroll-wrap f-col" id="gameTable1" style="display:none;padding-bottom:1.64rem;">
          

            
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
		 	 			para1 : "BADMATCH_SELECT_SUMMARY_REPORT_GAME_TYPE"
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

							thisTag = "gameTypeSumReport";
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
								wechatShareMsg = data.list[0].MCH_NM;

								htm = ''
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr>'
								+ '				<th>종목</th>'
								+ '				<th>예선</th>'
								+ '				<th>본선</th>'
								+ '				<th>상태</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable2").append(htm);
							}

							var endTagA = "";
							if (data.list[i].FINALN_CNT == data.list[i].FINALN_TCNT) {
								if (data.list[i].FINALY_CNT == data.list[i].FINALY_TCNT) {
									endTagA = '<br><span class="endSpan3">'+data.list[i].STS_NM+'</span>';
								}
								else {
									endTagA = '<br><span class="endSpan2">'+data.list[i].STS_NM+'</span>';
								}
							}
							else {
								endTagA = '<br><span class="endSpan1">'+data.list[i].STS_NM+'</span>';
							}
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'</td>'
								+ '				<td class="center">'+data.list[i].FINALN_CNT+'/'+data.list[i].FINALN_TCNT+'</td>'
								+ '				<td class="center">'+data.list[i].FINALY_CNT+'/'+data.list[i].FINALY_TCNT+'</td>'
								+ '				<td class="center">'+endTagA+'</td>'
								+ '			</tr>'
								;
								$("#tbodyList-"+thisTag).append(htm);
							
							
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
		 	 			para1 : "BADMATCH_SELECT_SUMMARY_REPORT_COURT"
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

							thisTag = "gameTypeSumReport2";
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
								wechatShareMsg = data.list[0].MCH_NM;

								htm = ''
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr>'
								+ '				<th>코트</th>'
								+ '				<th>예선</th>'
								+ '				<th>본선</th>'
								+ '				<th>상태</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable1").append(htm);
							}

							var endTagA = "";
							if (data.list[i].FINALN_CNT == data.list[i].FINALN_TCNT) {
								if (data.list[i].FINALY_CNT == data.list[i].FINALY_TCNT) {
									endTagA = '<br><span class="endSpan3">'+data.list[i].STS_NM+'</span>';
								}
								else {
									endTagA = '<br><span class="endSpan2">'+data.list[i].STS_NM+'</span>';
								}
							}
							else {
								endTagA = '<br><span class="endSpan1">'+data.list[i].STS_NM+'</span>';
							}
							htm = ''
								+ '			<tr>'
								+ '				<td class="center" onclick="gotoCourtList('+data.list[i].COURT+');" style="text-decoration: underline;color: #006ecd;">'+data.list[i].COURT+'</td>'
								+ '				<td class="center">'+data.list[i].FINALN_CNT+'/'+data.list[i].FINALN_TCNT+'</td>'
								+ '				<td class="center">'+data.list[i].FINALY_CNT+'/'+data.list[i].FINALY_TCNT+'</td>'
								+ '				<td class="center">'+endTagA+'</td>'
								+ '			</tr>'
								;
								$("#tbodyList-"+thisTag).append(htm);
							
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
	function gotoCourtList(court) {
		window.location = '/front/bbc/badMatch/getPage.htm?pageName=page21&para3=${para3}&para4='+court;	
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
