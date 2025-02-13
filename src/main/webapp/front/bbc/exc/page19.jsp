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
<title>일일 경기 현황</title>
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
.container > div:first-of-type {
  border-left: solid 1px #0000ff;
}

.drag-table {
    width: 100%;
    border-left: none;
    border-right: none;
    border-top: 2px solid #006ecd;
    border-bottom: 1px solid #CCCCCC;
    z-index: 300;
}
.drag-table th {
	padding: 0.1rem 0 0.1rem 0;
	font-size: 0.3rem;
	line-height: 0.32rem;
}
.drag-table td {
	padding: 0.1rem 0 0.1rem 0;
	font-size: 0.3rem;
	line-height: 0.32rem;
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
	background: blue;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}

@media(min-width:720px) {
		body {
			width:100%;
		}
		.module {
			width:100%;
		}
		.footer {
			width:100%;
		}
		.app {
			width:100%;
		}
}

.font24 {
    font-size: 0.45rem;
    line-height: 1;
}
.bold {
    font-weight: 700 !important;
}
</style>
<script>
	
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="/front/bbc/img/systemLogo2.jpg"></image><p class="headerTitle">배드민턴 대회 관리</p></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
		$("#app").prepend(htm);
	});
	
</script>
</head>

  <body>

    <div class="app pop-page" style="padding-top: 0rem;">
      <div class="content" style="display: flex;">
        <div class="container" style="padding-top: 0.32rem; height: 100%; width: 35%; display: flex;" id="dataList1">
        
			<div class="scroll-wrap f-col" style="border-right: solid 1px #0000ff;">
				<div>
					<div class="title" style="text-align: center;">
						<span class="font24 bold" id="teamNameA"></span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="arealistA1">
								<tr style="height:1rem;">
									<td colspan="2" class="title font24 bold" style="text-align: center; font-size: 0.38rem" id="teamWinA">승율 50% 이상</td>
								</tr>
							</tbody>
						</table>
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<thead>
								<tr>
									<th>순위</th>
									<th>이름</th>
									<th>승</th>
									<th>패</th>
									<th>득실</th>
								</tr>
							</thead>
							<tbody id="teamPlayerRankA">
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="scroll-wrap f-col" style="border-right: solid 1px #0000ff;">
				<div>
					<div class="title" style="text-align: center;">
						<span class="font24 bold" id="teamNameB"></span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="arealistA1">
								<tr style="height:1rem;">
									<td colspan="2" class="title font24 bold" style="text-align: center; font-size: 0.38rem" id="teamWinB">승률 50% 이하</td>
								</tr>
							</tbody>
						</table>
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<thead>
								<tr>
									<th>순위</th>
									<th>이름</th>
									<th>승</th>
									<th>패</th>
									<th>득실</th>
								</tr>
							</thead>
							<tbody id="teamPlayerRankB">
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
		</div>
        <div class="container" style="padding-top: 0.32rem; height: 100%; width: 65%; display: flex;" id="dataList">
			
        </div>
      </div>
    </div>
    
      
  </body>
<script>

	$(document).ready(function () {
	    $("#teamWinA").click(function () {
	        let elem = document.documentElement; // 전체 화면을 위한 요소 (전체 페이지)
	        if (elem.requestFullscreen) {
	            elem.requestFullscreen();
	        } else if (elem.mozRequestFullScreen) { // Firefox 지원
	            elem.mozRequestFullScreen();
	        } else if (elem.webkitRequestFullscreen) { // Chrome, Safari 지원
	            elem.webkitRequestFullscreen();
	        } else if (elem.msRequestFullscreen) { // IE 지원
	            elem.msRequestFullscreen();
	        }
	    });
	});	

	$(function() {
// 		getTeamResult(true);
		getTeamRank(true);
		getGameList(true);
	});

	function getData() {

		var load = loading();
// 		load.show()
	
		var a = getDataMyinfoA();

		if (a) {
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
	
	function getTeamResult(autoRefresh) {
		
		var load = loading();
// 		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "SELECT_MINI_TEAM_RESULT"
		 	 			,para2 : "${intClbsq}"
		 	 			,para3 : "${para1}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
// 					console.log(data.list);
					if (data.list.length != 0) {
						
						for (var i = 0; i < data.list.length; i++) {
							$("#teamNameA").html(data.list[i].EVENT_TEAM_NM_A);
							$("#teamWinA").html(data.list[i].WIN_A + "승 " + data.list[i].WIN_B + "패");
							$("#teamScoreA").html("득실 : " + data.list[i].A_TEM_SCR + "점");
							$("#teamNameB").html(data.list[i].EVENT_TEAM_NM_B);
							$("#teamWinB").html(data.list[i].WIN_B + "승 " + data.list[i].WIN_A + "패");
							$("#teamScoreB").html("득실 : " + data.list[i].B_TEM_SCR + "점");
						}						
					}

					load.hide();					

					if (autoRefresh) {
						setTimeout(function(){ getTeamResult(true); }, 3000);
					}
				},
				error : function(xhr, status, e) {
					load.hide()
// 					alert("Error : " + status);
					if (autoRefresh) {
						setTimeout(function(){ getTeamResult(true); }, 3000);
					}
				}
			});
	}
	

	function getTeamRank(autoRefresh) {
		
		var load = loading();
// 		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "SELECT_DAILY_GAME_RANK"
		 	 			,para2 : "${intClbsq}"
		 	 			,para3 : "${para1}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					if (data.list.length != 0) {

						$("#teamPlayerRankA").html("");
						$("#teamPlayerRankB").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							htm = ''
								+ '<tr style="height:1rem;">'
								+ '	<td style="text-align: center;">'+data.list[i].TEAM_RANK+'</td>'
								+ '	<td style="text-align: center;">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '	<td style="text-align: center;">'+data.list[i].WIN+'승</td>'
								+ '	<td style="text-align: center;">'+data.list[i].LOSE+'패</td>'
								+ '	<td style="text-align: center;">'+data.list[i].BBC+'</td>'
								+ '</tr>'
								;
								
							$("#teamPlayerRank"+data.list[i].MTC_TEM_DV).append(htm);
						}						
					}

					load.hide();					

					if (autoRefresh) {
						setTimeout(function(){ getTeamRank(true); }, 3000);
					}
				},
				error : function(xhr, status, e) {
					load.hide()
// 					alert("Error : " + status);
					if (autoRefresh) {
						setTimeout(function(){ getTeamRank(true); }, 3000);
					}
				}
			});
	}
	

	function getGameList(autoRefresh) {
		
		var load = loading();
// 		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "SELECT_DAILY_GAME_LIST"
		 	 			,para2 : "${intClbsq}"
		 	 			,para3 : "${para1}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					var j = 0;
					var tag = "";
					var gCnt = 1;
					var tagT = "";
					var tagTitle = "";
					var thisTagT = "";
					
					if (data.list.length != 0) {

						$("#dataList").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							thisTagT = data.list[i].COURT;
							
							if (tagT != thisTagT) {
								gCnt = 1;
								htm = ''
									+ '<div class="scroll-wrap f-col" style="border-right: solid 1px #0000ff;">'
									+ '	<div>'
									+ '		<div class="title" style="text-align: center;">'
									+ '			<span class="font24 bold" id="areaTitleNm1">경기결과 '+data.list[i].COURT+'</span>'
									+ '		</div>'
									+ '		<div class="table">'
									+ '			<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
									+ '				<thead>'
									+ '					<tr>'
									+ '						<th>순서</th>'
									+ '						<th>이름</th>'
									+ '						<th>점수</th>'
									+ '					</tr>'
									+ '				</thead>'
									+ '				<tbody id="arealist'+thisTagT+'">'
									+ '				</tbody>'
									+ '			</table>'
									+ '		</div>'
									+ '	</div>'
									+ '</div>'
								;
									
								$("#dataList").append(htm);
							}
							
							var winFlgA = "";
							var winFlgB = "";
							var tagBtn = '<span class="endSpan">수정</span>';
							var scoreaa = parseInt(data.list[i].A_TEM_SCR);
							var scorebb = parseInt(data.list[i].B_TEM_SCR);
							var currScoreTagA = "";
							var currScoreTagB = "";
							if (scoreaa > scorebb) {
								winFlgA = '<span style="color:blue;">'+data.list[i].P_NM_A1+'<br>'+data.list[i].P_NM_A2+'</span>';
								winFlgB = '<span>'+data.list[i].P_NM_B1+'<br>'+data.list[i].P_NM_B2+'</span>';
								currScoreTagA = 'color:blue;';
								currScoreTagB = 'color:red;';
							}
							else if (scoreaa < scorebb) {
								winFlgA = '<span>'+data.list[i].P_NM_A1+'<br>'+data.list[i].P_NM_A2+'</span>';
								winFlgB = '<span style="color:blue;">'+data.list[i].P_NM_B1+'<br>'+data.list[i].P_NM_B2+'</span>';
								currScoreTagA = 'color:red;';
								currScoreTagB = 'color:blue;';
							}
							else {
								winFlgA = '<span>'+data.list[i].P_NM_A1+'<br>'+data.list[i].P_NM_A2+'</span>';
								winFlgB = '<span>'+data.list[i].P_NM_B1+'<br>'+data.list[i].P_NM_B2+'</span>';
								tagBtn = '<span class="endSpanIng">입력</span>';
							}
							
							tagTitle = "";
							var tagBold = "";
							if (data.list[i].DISPLAY_SEQ == 1) {
								tagTitle = "background: #006ecd; color: white; height: 0.8rem; font-size: 0.3rem;";
								tagBold = "font-weight: 600;";
							}
							else {
								tagTitle = "background: #4CAF50; color: white; height: 0.8rem; font-size: 0.3rem;";
								tagBold = "font-weight: normal;";
							}
							
							htm = ''
								+ '					<tr style="display:none;">'
								+ '						<td colspan="3" style="text-align: center;'+tagTitle+'">'+data.list[i].GAME_STATUS+'</td>'
								+ '					</tr>'
								+ '					<tr style="height:1rem;border-top: solid 2px #ff5722;">'
								+ '						<td rowspan="2" style="text-align: center;'+tagBold+'">'+data.list[i].GAME_SEQ+'<br>경기</td>'
								+ '						<td style="text-align: center;'+tagBold+'">'+winFlgA+'</td>'
								+ '						<td style="text-align: center;'+tagBold+currScoreTagA+'">'+scoreaa+'</td>'
								+ '					</tr>'
								+ '					<tr style="height:1rem;">'
								+ '						<td style="text-align: center;'+tagBold+'">'+winFlgB+'</td>'
								+ '						<td style="text-align: center;'+tagBold+currScoreTagB+'">'+scorebb+'</td>'
								+ '					</tr>'
								+ '					<tr>'
								+ '						<td colspan="3">&nbsp;</td>'
								+ '					</tr>'
								;
							j++;
							gCnt++;
							$("#arealist"+thisTagT).append(htm);
							tagT = data.list[i].COURT;
							
						}
						
					} else {
						
					}

					load.hide();					

					if (autoRefresh) {
						setTimeout(function(){ getGameList(true); }, 3000);
					}
				},
				error : function(xhr, status, e) {
					load.hide()
// 					alert("Error : " + status);
					if (autoRefresh) {
						setTimeout(function(){ getGameList(true); }, 3000);
					}
				}
			});
	}
    

	function goUserPage(a,b) {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page15&para3="+a+"&para5="+b;
	}
	function msgBox(msg) {
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	

    function gameResult(a, b, c, d) {
		
    	var load = loading();
//     	load.show()

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
//     				alert("Error : " + status);
    			}
    		});
    	
    	$("#mchReqA").val(a);
    	$("#mchReqB").val(b);
    	$("#scoreA").val(c);
    	$("#scoreB").val(d);
    	if (c == "0") {
    		$("#scoreA").val("");
    	}
    	if (d == "0") {
    		$("#scoreB").val("");
    	}
    	$("#userSelectPop").show();
    }

</script>
</html>
