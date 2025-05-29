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
<title>코트별 경기시간표</title>
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
.tabHead .tabSelected:before {
    width: 1rem;
    transition: width 0.3s;
}
.selected {
  color:#e42e43;
  border-color: #e42e43;
}
.tabPointer2 {
  padding: 0.3rem 0.24rem 0.16rem;
  position: absolute;
  top: 0;
  left: 0;
  background: #ffffff;  
  display: flex; 
  flex-flow: row wrap;
  justify-content: space-between;
}
.tabPointer2 a {
  display: block;
  outline: none;
  text-decoration: none;
}
.tab-img img:first-of-type {
	height: 0.23rem;
    border: 0;
    padding-left: 0.1rem;
    margin: 0;
    vertical-align: initial;
}
.tabPointer2 {
	justify-content: left;
}
.tabPointer2 a:first-of-type {
	margin-right: 0.2rem;
}
.tabPointer2 a:last-of-type {
	margin-left: 0.2rem;
}
.endSpan {
	background: #000000;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.extInline {
	overflow: hidden;
    display: inline-block;
    width: 0.7rem;
    white-space: nowrap;
}
</style>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>코트별 경기시간표</span>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="height: 100%;">
          
		  <div class="title2">
			<span class="font24 bold">코트 목록</span>
			<span class="font20 fontOrange" id="modifyMatchHead">코트를 클릭하세요.</span>
		  </div>   
		  <div class="tabPointer" id="areaSgroup" style="position: initial;justify-content: flex-start;padding-top:0;">
           	
		  </div>
          <div class="scroll-wrap f-col" id="gameTable1" style="padding-bottom:1.64rem;">
          

            
          </div>
          
         
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
                <div class="orangeBtn subBtn f-col font26" onclick="saveGameResult($('#mchReqA').val(), $('#mchReqB').val(), $('#scoreA').val(), $('#scoreB').val(), $('#round').val());">경기결과저장</div>
              </div>
            </div>
		</div>
	</div>    
        
    
      
  </body>
<script>

	$(function() {
		getData();
		if ("${para4}" != "") {
			getGameList("${para4}", true);	
		}
	});
	
	var searchlvl = "";
	var searchgType = "";
	var searchgroup = "";
	var glrobalCourt = "";
	
	function getData(para2, para3) {
	
		var load = loading();
		load.show() 	
		
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_GET_COURT2"
		 	 			,para2 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					
					var htm = '';
					if (data.list.length != 0) {
						$("#mchNm").html(data.list[0].MCH_NM);
						$("#place").html(data.list[0].PLACE);
						$("#mchDt").html(data.list[0].MCH_DT);
						wechatShareMsg = data.list[0].MCH_NM;

						for (var i = 0; i < data.list.length; i++) {
							
							var tag = "";
							if (data.list[i].END_COURT == 'Y') {
								tag = '<img src="/front/bbc/img/tick.png"/>';
							}
							
							htm = ''
								+ '<a class="tabList tab-img font20 mb10" href="#jump1" style="width: 1rem;margin-right: 0.2rem;" onclick="getGameList(\''+data.list[i].COURT+'\', true);">'+data.list[i].COURT+' '+tag+'</a>'  
							;
								
							$("#areaSgroup").append(htm);
							
						}
					} else {
						
					}
					
					load.hide();
					return true;
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
					return false;
				}
			});
	}

	function msgBox(msg) {
		
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {
				console.log("ok");
			}
		});
	}	

	function getGameList(court, refreshFlag) {
		
		glrobalCourt = court;
		
		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_COURT_GAME_LIST_REPORT"
		 	 			,para2 : "${para3}"
		 	 			,para3 : court
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

							thisTag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP + '-' + data.list[i].FINAL_YN;
							
							if (i == 0) {
								
								htm = ''
								+ '<div class="title2">'
								+ '	<span class="font24 bold">'+data.list[i].COURT+'번 코트</span>'
								+ ' <span class="font20 fontOrange" id="gameCnt">0</span>'
								+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignCenterTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-gameTable-list">'
								+ '			<tr>'
								+ '				<th>경기<br>순서</th>'
								+ '				<th>시작<br>시간</th>'
								+ '				<th>조순서<br>심판</th>'
								+ '				<th>팀 A</th>'
								+ '				<th>결과</th>'
								+ '				<th>팀 B</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable1").append(htm);
							}
							
							
							if (tag != thisTag) {
								htm = ''
									+ '			<tr>'
									+ '				<td colspan="6" style="text-align: center;background: #fffefe;">'+data.list[i].B_LVL_NM+' / '+data.list[i].GAME_TYPE_NM+' / '+data.list[i].GAME_GROUP_NM+'</th>'
									+ '			</tr>'
								;
								$("#tbodyList-gameTable-list").append(htm);
							}

							j = i + 1;
							var winFlgA = "";
							var winFlgB = "";
							var scoreaa = parseInt(data.list[i].SCORE_A);
							var scorebb = parseInt(data.list[i].SCORE_B);
							if (scoreaa > scorebb) {
								winFlgA = data.list[i].SCORE_A+':'+data.list[i].SCORE_B;
								winFlgB = '<br><span class="endSpan">종료</span>';
							}
							else if (scoreaa < scorebb) {
								winFlgA = data.list[i].SCORE_A+':'+data.list[i].SCORE_B;
								winFlgB = '<br><span class="endSpan">종료</span>';
							}
							else {
								winFlgA = '';
								winFlgB = '';
							}

							var tagRef = "";
							if (data.list[i].REFEREE_NM != "" && data.list[i].REFEREE_NM != null) {
								tagRef = '<br><span style="color:blue;">'+data.list[i].REFEREE_NM+'</span>';
							}
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+j+'</td>'
								+ '				<td class="center">'+data.list[i].START_TM+'</td>'
								+ '				<td class="center">'+data.list[i].GAME_SEQ+tagRef+'</td>'
								+ '				<td class="center"><span class="extInline">'+data.list[i].MBR_NM_A_A+'</span><br><span>'+data.list[i].MBR_NM_A_B+'</span></td>'
								+ '				<td class="center">'+winFlgA+winFlgB+'</td>'
								+ '				<td class="center"><span class="extInline">'+data.list[i].MBR_NM_B_A+'</span><br><span>'+data.list[i].MBR_NM_B_B+'</span></td>'
								+ '			</tr>'
								;
							j++;
							$("#tbodyList-gameTable-list").append(htm);
							tag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP + '-' + data.list[i].FINAL_YN;
							
						}
						
						$("#gameCnt").html("총 "+j+" 게임");
						
					} else {

						$("#gameTable1").html("");
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
    
    function gameResult(a, b, c, d, e) {

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
    	$("#round").val(e);
    	$("#userSelectPop").show();
    }
    

    function saveGameResult(para4, para5, para6, para7, round) {

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
       		    	 	 			,para5 : $("#mchNm").html() + " - 예선\n" + data.list[0].B_LVL_NM + " / " + data.list[0].GAME_TYPE_NM + " / " + data.list[0].GAME_GROUP_NM + " 경기결과 " +  para6 + " : " + para7
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
    						getGameList(glrobalCourt, false);
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
<script>
try {
	wechatShareMsg = "${userInfo.MCH_NM}";
} catch (e) {
  console.log('error');
}	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
