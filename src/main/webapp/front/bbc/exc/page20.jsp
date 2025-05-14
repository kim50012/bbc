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
<title>전체현황</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem5.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/jsPC.jsp"%> 
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
	font-size: 0.5rem;
	line-height: 0.6rem;
}
.drag-table td {
	padding: 0.1rem 0 0.1rem 0;
	font-size: 0.5rem;
	line-height: 0.6rem;
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
    line-height: 0.6rem;
    border-radius: 0.2rem;
}
.endSpanIng {
	background: blue;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.6rem;
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
    font-size: 0.60rem;
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
        <div class="container" style="padding-top: 0.32rem; height: 100%; width: 0%; display: flex;" id="dataList1">
        
		</div>
		<div class="container" style="font-size: 1rem; padding: 0; height: 100%; width: 3%; display: flex; flex-direction: column; justify-content: center; align-items: center;" id="divBtn">
			<span class="mdi mdi-arrow-left-bold-box" onclick="setLayout(true);"></span>
			<span class="mdi mdi-arrow-right-bold-box-outline" onclick="setLayout(false);"></span>
		</div>
        <div class="container" style="padding-top: 0.32rem; height: 100%; width: 97%; display: flex;" id="dataList">
			
        </div>
      </div>
    </div>
    
	<div class="radio-pop" id="userSelectPop" style="display:none;">
		<input type="hidden" id="selectUserObjNm" />
		<input type="hidden" id="round" />
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
                <div class="orangeBtn subBtn f-col font26" onclick="saveGameResult($('#mchReqA').val(), $('#mchReqB').val(), $('#scoreA').val(), $('#scoreB').val());">경기결과저장</div>
              </div>
            </div>
		</div>
	</div>    
      
  </body>
<script>

	$(function() {
// 		getTeamResult(true);
		getTeamRank(true, "A");
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
	
	function setLayout(a) {
		if (a) {
			$("#dataList").css("width", "97%");
			$("#dataList1").css("width", "0%");
		}
		else {
			$("#dataList").css("width", "0%");
			$("#dataList1").css("width", "97%");
		}
	}
	
	function getGameList(autoRefresh) {
		
		var load = loading();
// 		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "SELECT_MINI_GAME_LIST"
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

					$("#dataList").html("");
					
					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {

							thisTagT = data.list[i].COURT;
							
							if (tagT != thisTagT) {
								gCnt = 1;
								htm = ''
									+ '<div class="scroll-wrap f-col" style="border-right: solid 1px #0000ff;">'
									+ '	<div>'
									+ '		<div class="title" style="text-align: center;">'
									+ '			<span class="font24 bold" id="areaTitleNm1">'+data.list[i].COURT+'번 코트</span>'
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
								tagTitle = "background: #006ecd; color: white; height: 0.8rem; font-size: 0.5rem;";
								tagBold = "font-weight: 600;";
							}
							else {
								tagTitle = "background: #4CAF50; color: white; height: 0.8rem; font-size: 0.5rem;";
								tagBold = "font-weight: normal;";
							}
							
							htm = ''
								+ '					<tr>'
								+ '						<td colspan="3" style="text-align: center;'+tagTitle+'">'+data.list[i].GAME_STATUS+'</td>'
								+ '					</tr>'
								+ '					<tr style="height:1rem;">'
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
						$("#dataList").hide();
						$("#dataList1").css("width", "100%");
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
	

	function getTeamRank(autoRefresh, teamTag) {
		
		var load = loading();
// 		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "SELECT_DAILY_GAME_MULTI_RANK"
		 	 			,para2 : "${intClbsq}"
		 	 			,para3 : "${para1}"
// 				 	 	,para4 : teamTag
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

					$("#dataList1").html("");
					
					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {

							thisTagT = data.list[i].TEAM_NM;
							
							if (tagT != thisTagT) {
								gCnt = 1;
								htm = ''
									+ '<div class="scroll-wrap f-col" style="border-right: solid 1px #0000ff;">'
									+ '	<div>'
									+ '		<div class="title" style="text-align: center;">'
									+ '			<span class="font24 bold" id="areaTitleNm1">'+data.list[i].TEAM_NM+'팀 순위</span>'
									+ '		</div>'
									+ '		<div class="table">'
									+ '			<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
									+ '				<thead>'
									+ '					<tr>'
									+ '						<th style="border-bottom: 1px solid #006ecd;font-size:0.4rem;">순위</th>'
									+ '						<th style="border-bottom: 1px solid #006ecd;font-size:0.4rem;">이름</th>'
									+ '						<th style="border-bottom: 1px solid #006ecd;font-size:0.4rem;">승</th>'
									+ '						<th style="border-bottom: 1px solid #006ecd;font-size:0.4rem;">패</th>'
									+ '						<th style="border-bottom: 1px solid #006ecd;font-size:0.4rem;">득실</th>'
									+ '					</tr>'
									+ '				</thead>'
									+ '				<tbody id="arealist'+thisTagT+'">'
									+ '				</tbody>'
									+ '			</table>'
									+ '		</div>'
									+ '	</div>'
									+ '</div>'
								;
									
								$("#dataList1").append(htm);
							}
							
							tagTitle = "";
							var tagBold = "";
							if (data.list[i].TEAM_RANK <= 3) {
								tagTitle = "background: #006ecd; color: white; height: 0.8rem; font-size: 0.5rem;";
								tagBold = "font-weight: 600;";
							}
							else {
								tagTitle = "background: height: 0.8rem; font-size: 0.5rem;";
								tagBold = "font-weight: normal;";
							}
							
							htm = ''
								+ '					<tr style="height:1.2rem;">'
								+ '						<td style="text-align: center;border: 1px solid #006ecd;font-size:0.4rem;'+tagTitle+'">'+data.list[i].TEAM_RANK+'</td>'
								+ '						<td style="text-align: center;border: 1px solid #006ecd;font-size:0.4rem;'+tagBold+'">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '						<td style="text-align: center;border: 1px solid #006ecd;font-size:0.4rem;'+tagBold+'">'+data.list[i].WIN+'</td>'
								+ '						<td style="text-align: center;border: 1px solid #006ecd;font-size:0.4rem;'+tagBold+'">'+data.list[i].LOSE+'</td>'
								+ '						<td style="text-align: center;border: 1px solid #006ecd;font-size:0.4rem;'+tagBold+'">'+data.list[i].SCR_MBR+'</td>'
								+ '					</tr>'
								;
							j++;
							gCnt++;
							$("#arealist"+thisTagT).append(htm);
							tagT = data.list[i].TEAM_NM;
							
						}
						
					} else {
// 						$("#dataList").hide();
// 						$("#dataList1").css("width", "97%");
					}

					load.hide();					

					if (autoRefresh) {
// 						setTimeout(function(){ getTeamRank(true); }, 3000);
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

    function saveGameResult(para4, para5, para6, para7) {

    	var load = loading();
    	var finalYn = "N";
//     	load.show();
    	
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
    	 	 			,para3 : finalYn
    	 	 			,para4 : para4
    	 	 			,para5 : para5
    	 	 			,para6 : para6
    	 	 			,para7 : para7
    	 	 			,para8 : "${loginMbrSq}"
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

       		    	 $.ajax({
       		    	 	 		data:{
       		    	 	 			para1 : data.list[0].OPENIDA
       		    	 	 			,para2 : data.list[0].OPENIDB
       		    	 	 			,para3 : data.list[0].OPENIDC
       		    	 	 			,para4 : data.list[0].OPENIDD
       		    	 	 			,para5 : data.list[0].MCH_NM + " - 예선\n" + data.list[0].B_LVL_NM + " / " + data.list[0].GAME_TYPE_NM + " / " + data.list[0].GAME_GROUP_NM + " 경기결과 " +  para6 + " : " + para7
       		    	 	 			,para6 : data.list[0].NAMEA
       		    	 	 			,para7 : data.list[0].NAMEB
       		    	 	 			,para8 : data.list[0].NAMEC
       		    	 	 			,para9 : data.list[0].NAMED
       		    	 	 			,para10 : vicName
       		    	 	 			,para11 : "승패에 문제가 있는 경우 대회 관리자에게 문의 하세요."
       		    	 	 			,para12 : "/front/bbc/badMatch/getPage.htm?pageName=page15&para3=${para3}"
       		    	 	 		},
       		    			type : "POST",
       		    			url : "/front/bbc/badMatch/sendMsg.htm",
       		    			success : function(data) {
       		    			},
       		    			error : function(xhr, status, e) {
       		    			}
       		    		});
       				
    		    	}

    				messageBox({
    					title : '알림',
    					message : '저장되었습니다.',
    					type : 'alert',
    					callback : function() {
    						getGameList(false);
    						$("#userSelectPop").hide();
    					}
    				});
    				
//     				alert("저장되었습니다.");
//     				$("#userSelectPop").hide();
    				
					load.hide();	
    			},
    			error : function(xhr, status, e) {
    				load.hide();
//     				alert("Error : " + status);
    			}
    		});
    	
    }
</script>
</html>
