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
<title>본선 대진표</title>
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
	border-right: 0px;
	border-left: 1px solid #ededed;
	text-align: center;
}
.drag-table th:after, .drag-table td:after {
	border-right: 0px;
}
.winnerTd {
	background: url(/front/bbc/img/winner.png) no-repeat 0 0 !important;
	background-size: 1rem !important;
}
.drag-table tr:first-of-type td:nth-of-type(2n) {
    border-left: 2px solid #ff9800;
}
.drag-table tr:nth-of-type(3n) td:nth-of-type(2n) {
    border-left: 2px solid #4caf50;
}
.drag-table tr:first-of-type td:nth-of-type(3n) {
    border-left: 2px solid #006ecd;
/*     e33143 */
}

.drag-table tr:nth-of-type(2n) td:first-of-type {
    border-bottom: 2px solid #ff9800;
}
.drag-table tr:first-of-type td:nth-of-type(2n) {
    border-left: 2px solid #ff9800;
}
.drag-table tr:nth-of-type(3n) td:nth-of-type(2n) {
    border-left: 2px solid #ff9800;
}
.drag-table tr:first-of-type td:nth-of-type(3n) {
    border-left: 2px solid #ff9800;
/*     e33143 */
}

</style>
<script>
helpHtmlTag = "※ 본선 대진표 조회 화면 입니다.<br><br>본선은 토너먼트로 진행하게 됩니다.<br><br>경기 결과가 입력되면 다음 라운드 토너먼트 대상자가 자동으로 보여집니다.<br><br>대회 운영진은 우측 상단의 경기결과 등록 버튼으로 경기 결과 입력 화면으로 이동하여 결과를 입력하세요.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>본선 대진표</span>
      	  <a onclick="$('#helpHtmlTag').attr('style','text-align:left');gotoHelp();" class="matchHelp" style="bottom: 65px;">help</a>
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
            
          <div class="scroll-wrap f-col" id="gameTable2" style="padding-bottom:1.64rem;">
          

            
          </div>
        </div>
      </div>

    </div>
    
      
  </body>
<script>

	$(function() {
		getRank();
	});
	
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
		 	 			para1 : "BADMATCH_SELECT_FINAL_TEAM_LIST"
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

								if (data.list[i].FINAL_GAME_LAYOUT == "2") {

									htm = ''
									+ '<div class="title2">'
									+ '		<span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+' 본선 대진표</span>'
									+ '		<span class="font20 fontOrange" onclick="finalGameReg(\''+data.list[i].B_LVL+'\',\''+data.list[i].GAME_TYPE+'\');">경기결과등록</span>'
									+ '</div>'
									+ '<div class="table">'
									+ '	<table class="drag-table table-cos" id="table2" cellspacing="0" cellpadding="2" width="100%" border="1">'
									+ '		<colgroup>'
									+ '			<col width="50%">'
									+ '			<col width="50%">'
									+ '		</colgroup>'
									+ '		<tbody id="tbodyList-'+thisTag+'">'
									+ '		<tr>'
									+ '			<th>결승</th>'
									+ '			<th>우승</th>'
									+ '		</tr>'
									+ '		</tbody>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-2-1">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts01-1">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-2-2" style="border-bottom: 1px solid #ededed;">-</td>'
									+ '		</tr>'
									+ '	</table>'
									+ '</div>'
									;
								}

								if (data.list[i].FINAL_GAME_LAYOUT == "4") {

									htm = ''
									+ '<div class="title2">'
									+ '		<span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+' 본선 대진표</span>'
									+ '		<span class="font20 fontOrange" onclick="finalGameReg(\''+data.list[i].B_LVL+'\',\''+data.list[i].GAME_TYPE+'\');">경기결과등록</span>'
									+ '</div>'
									+ '<div class="table">'
									+ '	<table class="drag-table table-cos" id="table2" cellspacing="0" cellpadding="2" width="100%" border="1">'
									+ '		<colgroup>'
									+ '			<col width="33%">'
									+ '			<col width="33%">'
									+ '			<col width="33%">'
									+ '		</colgroup>'
									+ '		<tbody id="tbodyList-'+thisTag+'">'
									+ '		<tr>'
									+ '			<th>준결승</th>'
									+ '			<th>결승</th>'
									+ '			<th>우승</th>'
									+ '		</tr>'
									+ '		</tbody>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-4-1">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts02-1">-</td><td rowspan="4" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts01-1">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-4-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-4-3">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts02-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-4-4" style="border-bottom: 1px solid #ededed;">-</td>'
									+ '		</tr>'
									+ '	</table>'
									+ '</div>'
									;
								}

								if (data.list[i].FINAL_GAME_LAYOUT == "8") {

									htm = ''
									+ '<div class="title2">'
									+ '		<span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+' 본선 대진표</span>'
									+ '		<span class="font20 fontOrange" onclick="finalGameReg(\''+data.list[i].B_LVL+'\',\''+data.list[i].GAME_TYPE+'\');">경기결과등록</span>'
									+ '</div>'
									+ '<div class="table">'
									+ '	<table class="drag-table table-cos" id="table2" cellspacing="0" cellpadding="2" width="100%" border="1">'
									+ '		<colgroup>'
									+ '			<col width="25%">'
									+ '			<col width="25%">'
									+ '			<col width="25%">'
									+ '			<col width="25%">'
									+ '		</colgroup>'
									+ '		<tbody id="tbodyList-'+thisTag+'">'
									+ '		<tr>'
									+ '			<th>8강</th>'
									+ '			<th>준결승</th>'
									+ '			<th>결승</th>'
									+ '			<th>우승</th>'
									+ '		</tr>'
									+ '		</tbody>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-1">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-1">-</td><td rowspan="4" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts02-1">-</td><td rowspan="8" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts01-1">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-3">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-4">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-5">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-3">-</td><td rowspan="4" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts02-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-6">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-7">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-4">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-8" style="border-bottom: 1px solid #ededed;">-</td>'
									+ '		</tr>'
									+ '	</table>'
									+ '</div>'
									;
								}

								if (data.list[i].FINAL_GAME_LAYOUT == "16") {

									htm = ''
									+ '<div class="title2">'
									+ '		<span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+' 본선 대진표</span>'
									+ '		<span class="font20 fontOrange" onclick="finalGameReg(\''+data.list[i].B_LVL+'\',\''+data.list[i].GAME_TYPE+'\');">경기결과등록</span>'
									+ '</div>'
									+ '<div class="table">'
									+ '	<table class="drag-table table-cos" id="table2" cellspacing="0" cellpadding="2" width="100%" border="1">'
									+ '		<colgroup>'
									+ '			<col width="20%">'
									+ '			<col width="20%">'
									+ '			<col width="20%">'
									+ '			<col width="20%">'
									+ '			<col width="20%">'
									+ '		</colgroup>'
									+ '		<tbody id="tbodyList-'+thisTag+'">'
									+ '		<tr>'
									+ '			<th>16강</th>'
									+ '			<th>8강</th>'
									+ '			<th>준결승</th>'
									+ '			<th>결승</th>'
									+ '			<th>우승</th>'
									+ '		</tr>'
									+ '		</tbody>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-1">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-1">-</td><td rowspan="4" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-1">-</td><td rowspan="8" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts02-1">-</td><td rowspan="16" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts01-1">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-3">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-4">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-5">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-3">-</td><td rowspan="4" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-6">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-7">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-4">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-16-8" style="border-bottom: 1px solid #ededed;">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-9">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-5">-</td><td rowspan="4" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-3">-</td><td rowspan="8" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts02-2">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-10">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-11">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-6">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-12">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-13">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-7">-</td><td rowspan="4" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts04-4">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-14">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-15">-</td><td rowspan="2" id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-sts08-8">-</td>'
									+ '		</tr>'
									+ '		<tr>'
									+ '			<td id="'+data.list[i].B_LVL+'-'+data.list[i].GAME_TYPE+'-final-8-16" style="border-bottom: 1px solid #ededed;">-</td>'
									+ '		</tr>'
									+ '	</table>'
									+ '</div>'
									;
								}								
								$("#gameTable2").append(htm);
							}

							var brTag = "";
							if (data.list[i].FINAL_GAME_LAYOUT == "2") {
								brTag = ",";
							}
							else {
								brTag = "<br>";
							}

							$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-final-"+data.list[i].FINAL_GAME_LAYOUT+"-"+data.list[i].FINAL_GAME_SEQ).html(data.list[i].MBR_NM_A+brTag+data.list[i].MBR_NM_B);
							
							tag = "R-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
							
						}
						

						for (var i = 0; i < data.list.length; i++) {

							thisTag = "R-" + data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE;
							
							var brTag = "<br>";

							if (data.list[i].STS08 != "0") {
								$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts08-"+data.list[i].STS08).html(data.list[i].MBR_NM_A+brTag+data.list[i].MBR_NM_B);
								if (data.list[i].STS04 != "0") {
									$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-final-8-"+data.list[i].STS08).css('color', '#006ecd');
									$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts08-"+data.list[i].STS08).css('color', '#006ecd');
								}
							}

							if (data.list[i].STS04 != "0") {
								$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts04-"+data.list[i].STS04).html(data.list[i].MBR_NM_A+brTag+data.list[i].MBR_NM_B);
								if (data.list[i].STS02 != "0") {
									$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-final-4-"+data.list[i].STS04).css('color', '#006ecd');
									$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts04-"+data.list[i].STS04).css('color', '#006ecd');
								}
							}

							if (data.list[i].STS02 != "0") {
								$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts02-"+data.list[i].STS02).html(data.list[i].MBR_NM_A+brTag+data.list[i].MBR_NM_B);
								if (data.list[i].STS01 != "0") {
									$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-final-2-"+data.list[i].STS02).css('color', '#006ecd');
									$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts02-"+data.list[i].STS02).css('color', '#006ecd');
								}
							}

							if (data.list[i].STS01 != "0") {
								$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts01-"+data.list[i].STS01).html(data.list[i].MBR_NM_A+brTag+data.list[i].MBR_NM_B);	
								$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts01-"+data.list[i].STS01).css('color', '#006ecd');
								$("#"+data.list[i].B_LVL+"-"+data.list[i].GAME_TYPE+"-sts01-"+data.list[i].STS01).addClass("winnerTd");
							}
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
	
	function finalGameReg(a,b) {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page12&para3=${para3}&para4="+a+"&para5="+b;
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
