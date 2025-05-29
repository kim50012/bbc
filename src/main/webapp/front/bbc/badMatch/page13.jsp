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
<title>대회 입상자</title>
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
</style>
<script>
helpHtmlTag = "※ 본 대회 입상자를 조회하는 화면입니다.<br><br>순위에서 각 종목별 우승, 준우승 등 입상 결과가 보여지며 승급이 된 경우 승급란에 승급으로 표기됩니다.<br><br>각 종목 5개팀 이상 출전해야 승급이 됩니다.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>대회 입상자</span>
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
          
          <div class="scroll-wrap f-col" id="gameTable2" style="padding-bottom:1.64rem;">
          

            
          </div>
          
          
	        <c:if test="${userInfo.AUTH == 'A' || userInfo.AUTH == 'B'}">
	       	<div>
	      		<div class="blueBtn subBtn f-col font26" id="endFinalMatdh">대회 종료</div>
	      	</div>
	      	</c:if>
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
		 	 			para1 : "BADMATCH_SELECT_FINAL_WINNER_TEAM"
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
								wechatShareMsg = data.list[0].MCH_NM + '조회 및 대회 종료';
							}

							var finalTrTag = '';
							
							if (data.list[i].LEVEL_UP_NM == "승급" || (data.list[i].GROUP_SEQ == "1" && (data.list[i].MCH_SQ == "10026" || data.list[i].MCH_SQ == "10027"))) {
								finalTrTag = ' class="activeTr"';
							}
							
							if (tag != thisTag) {
								htm = ''
								+ '<div class="title2">'
								+ '	<span class="font24 bold">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'</span>'
								+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-'+thisTag+'">'
								+ '			<tr '+finalTrTag+'>'
								+ '				<th>순위</th>'
								+ '				<th>이름</th>'
								+ '				<th>이름</th>'
								+ '				<th>소속클럽</th>'
								+ '				<th>승급</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable2").append(htm);
							}

							htm = ''
								+ '			<tr '+finalTrTag+'>'
								+ '				<td class="center">'+data.list[i].VIC_NM+'</td>'
								+ '				<td class="center" onclick="gotoPlayerPage('+data.list[i].MBR_A+');" style="text-decoration: underline;color: #006ecd;">'+data.list[i].MBR_NM_A+'</td>'
								+ '				<td class="center" onclick="gotoPlayerPage('+data.list[i].MBR_B+');" style="text-decoration: underline;color: #006ecd;">'+data.list[i].MBR_NM_B+'</td>'
								+ '				<td class="center" style="width: 2rem;">'+data.list[i].CLB_NM+'</td>'
								+ '				<td class="center">'+data.list[i].LEVEL_UP_NM+'</td>'
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


	$('#endFinalMatdh').click(function(e) {

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
				endFinalMatdh();
			}
		});
		
	});
	
	function endFinalMatdh() {

		var load = loading();
		load.show();

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_FINAL_GAME_END"
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
