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
<title>본선 경기시간표 및 코트 설정</title>
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
	padding: 0.24rem 0.1rem;
}
.tab-img img:first-of-type {
	height: 0.3rem;
    border: 0;
    margin: 0;
    vertical-align: initial;
}
.tab-img {
	display: table-cell;
}
.endSpan {
	background: #000000;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
</style>
<script>
helpHtmlTag = "※ 본선 경시기간표 조회 화면 입니다.<br><br>본선 진출자는 각 종목별 경기 시간 및 코트를 조회할 수 있습니다.<br><br>대회 운영진은 설정 버튼으로 각 경기 시작 시간과 코트를 입력할 수 있습니다.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>본선 경기시간표 조회 및 코트 설정</span>
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
          
          <div class="scroll-wrap f-col" id="gameTableList">
          

            
          </div>

        </div>
      </div>

    </div>
    
	<div class="radio-pop" id="setupStartTime" style="display:none;">
		<input type="hidden" id="selectUserObjNm" />
		<div class="radio-wrap" style="padding:0;width:6.5rem;">
			<input type="hidden" id="strB_LVL">
			<input type="hidden" id="strGAME_TYPE">
			<input type="hidden" id="strGAME_GROUP">
			<input type="hidden" id="strGameSeq">
			
			<div style="padding: 0.2rem;">
				<div class="title1">
                	<div>
                  		<i class="fourDPlex icon-sanjiao"></i>
                  		<span>경기 시작 시간 설정</span>
                	</div>
              	</div>			
				<table class="table-col2 open" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1" style="padding:0.2rem;">
	                  <colgroup>
	                  	<col width="25%">
	                  	<col width="75%">
	                  </colgroup>
					<tbody>
	                  <tr class="getInput intd">
	                    <th class="center noHang2 fontGrey Rword">코트</th>
	                    <td class="left">
	                    	<div class="input-wrap inContent">
					          <input type="number" id="court">
					          <div>코트 입력</div>
					        </div>
	                  	</td>
	                  </tr>
	                  <tr class="getInput intd">
	                    <th class="center noHang2 fontGrey Rword">시간</th>
	                    <td class="left">
	                    	<div class="input-wrap inContent">
					          <select id="startH">
					          	<option value="">시작 시간을 선택하세요.</option>
					          	<option value="07">07</option>
					          	<option value="08">08</option>
					          	<option value="09">09</option>
					          	<option value="10">10</option>
					          	<option value="11">11</option>
					          	<option value="12">12</option>
					          	<option value="13">13</option>
					          	<option value="14">14</option>
					          	<option value="15">15</option>
					          	<option value="16">16</option>
					          	<option value="17">17</option>
					          	<option value="18">18</option>
					          	<option value="19">19</option>
					          	<option value="20">20</option>
					          	<option value="21">21</option>
					          </select>
					        </div>
	                  	</td>
	                  </tr>
	                  <tr class="getInput intd">
	                    <th class="center noHang2 fontGrey Rword">분</th>
	                    <td class="left">
	                    	<div class="input-wrap inContent">
					          <select id="startM">
					          	<option value="00">00</option>
					          	<option value="05">05</option>
					          	<option value="10">10</option>
					          	<option value="15">15</option>
					          	<option value="20">20</option>
					          	<option value="25">25</option>
					          	<option value="30">30</option>
					          	<option value="35">35</option>
					          	<option value="40">40</option>
					          	<option value="45">45</option>
					          	<option value="50">50</option>
					          	<option value="55">55</option>
					          </select>
					        </div>
	                  	</td>
	                  </tr>
					</tbody>
				</table>
			</div>
			<div class="model-gray" style="border:0;margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
	            <div class="bottom-model" style="padding-top: 0;">
					<button class="btn-white" onclick="$('#setupStartTime').hide();">취소</button>
					<button class="confirmBtn" id="confirmBtn" onclick="updateCourtStartTime();" style="margin-left: 0.2rem;padding: 0.18rem 0.28rem;">설정하기</button>
	            </div>
	        </div>
	        
	          <div class="scroll-wrap f-col" id="gameCourtList" style="padding: 0.2rem;height: 4rem;">
	          
	
	            
	          </div>
		</div>
	</div>    
      
  </body>
<script>

	$(function() {
		getData("2", "${para3}");
	});
	
	function getData(para2, para3) {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_FINAL_FINAL_TIME_TABLE"
		 	 			,para2 : para3
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					var j = 0;
					var tag = "";
					var thisTag = "";
					
					if (data.list.length != 0) {

						$("#gameTableList").html("");
						
						for (var i = 0; i < data.list.length; i++) {

							thisTag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
							
							if (i == 0) {
								$("#mchNm").html(data.list[i].MCH_NM);
								$("#place").html(data.list[i].PLACE);
								$("#mchDt").html(data.list[i].MCH_DT);
								wechatShareMsg = data.list[0].MCH_NM;
							}
							
							if (tag != thisTag) {
								htm = ''
								+ '<div class="title2">'
								+ '	<span class="font24 bold">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'</span><span class="font20 fontOrange">설정 버튼으로 코트를 설정하세요</span>'
								+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr>'
								+ '				<th>경기<br>심판</th>'
								+ '				<th>팀 A</th>'
								+ '				<th>팀 B</th>'
								+ '				<th>코트</th>'
								+ '				<th>시작</th>'
								+ '				<th>종료</th>'
								+ '				<th>설정</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTableList").append(htm);
							}

							var gameEndTag = '<br><span class="endSpan">종료</span>';
							if (data.list[i].END_TM == "") {
								gameEndTag = '';
							}

							var tagRef = "";
							if (data.list[i].REFEREE_NM != "" && data.list[i].REFEREE_NM != null) {
								tagRef = '<br><span style="color:blue;line-height: 0.4rem;">'+data.list[i].REFEREE_NM+'</span>';
							}
							htm = ''
								+ '			<tr onclick="updateCourtStartTimeOne(\''+data.list[i].B_LVL+'\', \''+data.list[i].GAME_TYPE+'\', \''+data.list[i].GAME_GROUP+'\', \''+data.list[i].GAME_SEQ+'\', \''+data.list[i].COURT+'\');">'
								+ '				<td class="center">'+data.list[i].FINAL_GAME_LAYOUT_NM+tagRef+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_A+'<br>'+data.list[i].MBR_NM_B_A+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_NM_A_B+'<br>'+data.list[i].MBR_NM_B_B+'</td>'
								+ '				<td class="center">'+data.list[i].COURT+'</td>'
								+ '				<td class="center">'+data.list[i].START_TM+'</td>'
								+ '				<td class="center">'+data.list[i].END_TM+gameEndTag+'</td>'
								+ '				<td class="center tab-img"><img src="/front/bbc/img/gear.png"/></td>'
								+ '			</tr>'
								;
								$("#tbodyList-"+thisTag).append(htm);
								tag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
							
							
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
	}


	function msgBox(msg) {
		
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	

	function updateCourtStartTimeOne(a,b,c,d,e) {
		
		if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B" || "${userInfo.AUTH}" == "C")) {
			messageBox({
				title : '알림',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {}
			});	
			return;
		}		
		
		$("#strB_LVL").val(a);
		$("#strGAME_TYPE").val(b);
		$("#strGAME_GROUP").val(c);
		$("#strGameSeq").val(d);
		$("#court").val(e);
		
		$("#setupStartTime").show();
	}

	function updateCourtStartTime() {

		var para9 = $("#strGameSeq").val();
		
		if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B" || "${userInfo.AUTH}" == "C")) {
			messageBox({
				title : '알림',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {}
			});	
			return;
		}
		
		var para2 = "${para3}";
		var para3 = $("#strB_LVL").val();
		var para4 = $("#strGAME_TYPE").val();
		var para5 = $("#strGAME_GROUP").val();
		var para6 = $("#court").val();
		var para7 = $("#startH").val();
		var para8 = $("#startM").val();

		if (para7 == "") {
			msgBox("코트를 입력하세요.");
			return;
		}

		if (para8 == "") {
			msgBox("시작 시간을 입력하세요.");
			return;
		}

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_MERGE_MATCH_GAME_SET_COURT_ONE_FINAL"
		 	 			,para2 : para2
		 	 			,para3 : para3
		 	 			,para4 : para4
		 	 			,para5 : para5
		 	 			,para6 : para6
		 	 			,para7 : para7
		 	 			,para8 : para8
		 	 			,para9 : para9
		 	 			,para10 : "Y"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

    				if (data.list[0].RSLT == "END_MATCH") {

        				messageBox({
        					title : '알림',
        					message : '본선이 종료 되었습니다.',
        					type : 'alert',
        					callback : function() {
        						load.hide();
        						$("#setupStartTime").hide();
        					}
        				});
        				return;
    				}
    				
					messageBox({
						title : '알림',
						message : "저장되었습니다.",
						type : 'alert',
						callback : function() {
							getData("2", "${para3}");
						}
					});
					load.hide();
					$("#setupStartTime").hide();
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
