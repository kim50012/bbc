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
<title>예선 전체현황</title>
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
.drag-table td {
	padding: 0.1rem 0 0.1rem 0;
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
	
	helpHtmlTag = "※ 회원정보를 엑셀로 다운로드 받습니다..";
	
</script>
</head>

  <body>

    <div class="app pop-page" style="padding-top: 0rem;">
      <div class="content">
        <div class="container" style="padding-top: 0.32rem; height: 100%;display: flex;" id="dataList">
        

          
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
		getGameList(true);
	});

	function getData() {

		var load = loading();
		load.show()
	
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


	function getGameList(autoRefresh) {
		
		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_COURT_GAME_LIST_PC"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					var j = 0;
					var tag = "";
					var thisTag = "";
					var gCnt = 1;
					var tagT = "";
					var thisTagT = "";
					
					if (data.list.length != 0) {

						$("#dataList").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							thisTag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP;
							thisTagT = data.list[i].COURT;
							
							if (tagT != thisTagT) {
								gCnt = 1;
								htm = ''
									+ '          <div class="scroll-wrap f-col" style="border-right: solid 1px #0000ff;">'
									+ '          	<div>'
									+ '		    	<div class="title" style="text-align: center;">'
									+ '			    	<span class="font24 bold" id="areaTitleNm1">'+data.list[i].COURT+'번 코트</span>'
									+ '		       	</div>'
									+ '		        <div class="table">'
									+ '		        	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
									+ '				<thead>'
									+ '		                <tr>'
									+ '							<th>순서</th>'
									+ '							<th>현황</th>'
									+ '		                </tr>'
									+ '				</thead>'
									+ '		                <tbody id="arealist'+thisTagT+'">'
									+ '		         	</tbody>'
									+ '		       		</table>'
									+ '		       	</div>'
									+ '          	</div>'
									+ '          </div>'
								;
								$("#dataList").append(htm);
							}
							
							if (i%2 == 0) {
								
								var winFlgA = "";
								var winFlgB = "";
								var end = true;
								var tagBtn = '<span class="endSpan">수정</span>';
								var scoreaa = parseInt(data.list[i].SCORE_A);
								var scorebb = parseInt(data.list[i].SCORE_B);
								if (scoreaa > scorebb) {
									winFlgA = '<span style="color:blue;">'+data.list[i].MBR_NM_A_A+','+data.list[i].MBR_NM_B_A+'</span>';
									winFlgB = '<span>'+data.list[i].MBR_NM_A_B+','+data.list[i].MBR_NM_B_B+'</span>';
								}
								else if (scoreaa < scorebb) {
									winFlgA = '<span>'+data.list[i].MBR_NM_A_A+','+data.list[i].MBR_NM_B_A+'</span>';
									winFlgB = '<span style="color:blue;">'+data.list[i].MBR_NM_A_B+','+data.list[i].MBR_NM_B_B+'</span>';
								}
								else {
									winFlgA = '<span>'+data.list[i].MBR_NM_A_A+','+data.list[i].MBR_NM_B_A+'</span>';
									winFlgB = '<span>'+data.list[i].MBR_NM_A_B+','+data.list[i].MBR_NM_B_B+'</span>';
									tagBtn = '<span class="endSpanIng">입력</span>';
									end = false;
								}
								//  '+data.list[i].GAME_SEQ+'
								var tagBack = "";
								if (end) {
									tagBack = "background-color:#d8d8d8;";
								}
								htm = ''
									+ '			<tr>'
									+ '				<td class="center" style="white-space: nowrap;'+tagBack+'" onclick="gameResult('+data.list[i].MCH_REQ_A+', '+data.list[i].MCH_REQ_B+', '+scoreaa+', '+scorebb+');"><b>'+gCnt+'</b> <span style="color:blue;">'+data.list[i].START_TM+'</span><br>'+tagBtn+'</td>'
									+ '				<td class="center" style="white-space: nowrap;'+tagBack+'">'+winFlgA+'<br>'+winFlgB+'</td>'
									+ '			</tr>'
									;
								j++;
								gCnt++;
								$("#arealist"+thisTagT).append(htm);
								tag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP;
								tagT = data.list[i].COURT;
							}
							
						}
						
					} else {
						
					}

					load.hide();					

					if (autoRefresh) {
						setTimeout(function(){ getGameList(true); }, 10000);
					}
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
					if (autoRefresh) {
						setTimeout(function(){ getGameList(true); }, 10000);
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
    				alert("Error : " + status);
    			}
    		});
    	
    }
</script>
</html>
