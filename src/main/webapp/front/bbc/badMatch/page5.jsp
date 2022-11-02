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
<title>대회 참가자 조회</title>
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
</style>
<script>
helpHtmlTag = "※ 이번 대회 참가자를 조회 해볼수 있는 페이지 입니다.<br><br>이름을 입력 후 조회 하면 해당 선수가 어느 종목에 어느 파트너와 출전했는지 볼 수 있습니다.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>대회 참가자 조회</span>
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
          
          <div class="model-gray">
            <div class="bottom-model" style="padding-top: 0;">
				<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
					<input class="imgContent" type="text" name="userNm" id="userNm" placeholder="이름을 입력 후 조회하세요." style="background-color: #ffffff;">
				</div>
              	<button class="confirmBtn" id="confirmBtn" onclick="getData('2', '${para3}', $('#userNm').val());">조회</button>
            </div>
          </div>
          
          <div class="scroll-wrap f-col">
          
          	<!--- areaS ------------>
          	<div id="areaS" style="display:none;">
		    	<div class="title2">
			    	<span class="font24 bold">자강조</span><span class="font20 fontOrange">총 <span class="font20 fontOrange"id="areaScnt">0</span>팀</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaSlist">
		                <tr>
		                  <th class="noWrapCell">종목/조</th>
		                  <th class="noWrapCell">신청번호</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">소속클럽</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaA ------------>
          	<div id="areaA" style="display:none;">
		    	<div class="title2">
			    	<span class="font24 bold">A조</span><span class="font20 fontOrange">총 <span class="font20 fontOrange"id="areaAcnt">0</span>팀</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaAlist">
		                <tr>
		                  <th class="noWrapCell">종목/조</th>
		                  <th class="noWrapCell">신청번호</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">소속클럽</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaB ------------>
          	<div id="areaB" style="display:none;">
		    	<div class="title2">
			    	<span class="font24 bold">B조</span><span class="font20 fontOrange">총 <span class="font20 fontOrange"id="areaBcnt">0</span>팀</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaBlist">
		                <tr>
		                  <th class="noWrapCell">종목/조</th>
		                  <th class="noWrapCell">신청번호</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">소속클럽</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaC ------------>
          	<div id="areaC" style="display:none;">
		    	<div class="title2">
			    	<span class="font24 bold">C조</span><span class="font20 fontOrange">총 <span class="font20 fontOrange"id="areaCcnt">0</span>팀</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaClist">
		                <tr>
		                  <th class="noWrapCell">종목/조</th>
		                  <th class="noWrapCell">신청번호</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">소속클럽</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaD ------------>
          	<div id="areaD" style="display:none;">
		    	<div class="title2">
			    	<span class="font24 bold">D조</span><span class="font20 fontOrange">총 <span class="font20 fontOrange"id="areaDcnt">0</span>팀</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaDlist">
		                <tr>
		                  <th class="noWrapCell">종목/조</th>
		                  <th class="noWrapCell">신청번호</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">소속클럽</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          	<!--- areaE ------------>
          	<div id="areaE" style="display:none;">
		    	<div class="title2">
			    	<span class="font24 bold">초심자</span><span class="font20 fontOrange">총 <span class="font20 fontOrange"id="areaEcnt">0</span>팀</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="areaElist">
		                <tr>
		                  <th class="noWrapCell">종목/조</th>
		                  <th class="noWrapCell">신청번호</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">선수</th>
		                  <th class="noWrapCell">소속클럽</th>
		                </tr>
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
            <div class="tab-con-wrap" style="min-height: 0;">
              <div class="btn-area">
                <button class="fourD-blue-btn" onclick="joinMatch()">대회 참가 신청</button>
              </div>
            </div>
            
          </div>

        </div>
      </div>

    </div>
    
      
  </body>
<script>

	$(function() {
		getData("2", "${para3}", null);
	});
	
	function getData(para2, para3, para4) {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_USER_LIST"
		 	 			,para2 : para3
		 	 			,para3 : para4
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					
					console.log(data);
					
					var htm = '';
					var j = 0;
					var tag = "";
					var lineTag = "";
					var thisLineTag = "";
					var lineStyle = "";
					
					if (data.list.length != 0) {

						$("#areaSlist").html("");
						$("#areaAlist").html("");
						$("#areaBlist").html("");
						$("#areaClist").html("");
						$("#areaDlist").html("");
						$("#areaElist").html("");
						
						for (var i = 0; i < data.list.length; i++) {
							
							thisLineTag = data.list[i].B_LVL+data.list[i].GAME_TYPE;
							lineStyle = "";
							
							if (tag != data.list[i].B_LVL) {
								
								$("#area"+data.list[i].B_LVL).show();
								
								if (i == 0) {
									$("#mchNm").html(data.list[i].MCH_NM);
									$("#place").html(data.list[i].PLACE);
									$("#mchDt").html(data.list[i].MCH_DT);
									wechatShareMsg = data.list[0].MCH_NM;
								} else {
									$("#area"+tag+"cnt").html(j);
								}
								
								j = 0;
								$("#area"+data.list[i].B_LVL+"list").html("");

								htm = ''
									+ '<tr>'
									+ '<th class="noWrapCell">종목/조</th>'
									+ '<th class="noWrapCell">신청번호</th>'
									+ '<th class="noWrapCell">선수</th>'
									+ '<th class="noWrapCell">선수</th>'
									+ '<th class="noWrapCell">소속클럽</th>'
									+ '</tr>';
								$("#area"+data.list[i].B_LVL+"list").append(htm);
							}
							
							if (lineTag != thisLineTag) {
								lineStyle = "style='border-top: solid 2px #006ecd;box-sizing: initial;'";
							}
							
							htm = ''
								+ '<tr '+lineStyle+'>'
								+ '	<td class="noWrapCell center"><div class="tab-img mb16 mb10"><img src="../image/u'+data.list[i].GAME_TYPE.toLowerCase()+'.png" style="height: 0.28rem;">'+data.list[i].GAME_TYPE_NM+'/'+data.list[i].GAME_GROUP_NM+'</div></td>'
								+ '	<td class="center" onclick="deleteReq(\''+data.list[i].MCH_REQ+'\');">'+data.list[i].MCH_REQ+'</td>'
								+ '	<td class="noWrapCell center" onclick="gotoPlayerPage('+data.list[i].MBR_A+');" style="text-decoration: underline;color: #006ecd;">'+data.list[i].MBR_NM_A+'</td>'
								+ '	<td class="noWrapCell center" onclick="gotoPlayerPage('+data.list[i].MBR_B+');" style="text-decoration: underline;color: #006ecd;">'+data.list[i].MBR_NM_B+'</td>'
								+ '	<td class="noWrapCell center" style="max-width: 1.5rem;" onclick="msgBox(\''+data.list[i].CLB_NM+'\');">'+data.list[i].CLB_NM+'</td>'
								// + '	<td class="noWrapCell center"><button class="confirmBtn" id="confirmBtn" onclick="pickUser(\''+data.list[i].MBR_SQ+'\', \''+data.list[i].MBR_NM+'\');">선택</button></td>'
								+ '</tr>'
							;
							$("#area"+data.list[i].B_LVL+"list").append(htm);
							j++;

							tag = data.list[i].B_LVL;
							lineTag = data.list[i].B_LVL+data.list[i].GAME_TYPE;
						}
						
						$("#area"+tag+"cnt").html(j);
						
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
	

	function deleteReq(mchReq) {
		
		if ("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B") {
			messageBox({
				title : '알림',
				message : '대회 참가 신청을 취소하시겠습니까?',
				type : 'confirm',
				callback : function() {
					deleteMchReq(mchReq);
				}
			});			
		}
		else {
			msgBox("권한이 없습니다.");
			return;
		}

		
	}	

	function deleteMchReq(para3) {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_DELETE_MATCH_PLR_REQ"
		 	 			,para2 : "${para3}"
		 	 			,para3 : para3
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					msgBox("취소되었습니다.");
					getData("2", "${para3}");
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
