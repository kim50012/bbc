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
<title>클럽 청백전 관리</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
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
</style>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq}";'/>
          <span>청백전 대회 관리</span>
        </div>
      </header>
      <div class="content">

      
		<div class="tabPointer" id="tabPointer">
		

	        <div class="model-gray" style="padding-top: 0.2rem;background: #fff;margin: 0.2rem 0 0.2rem 0;width: 100%;">
	
				<div class="bottom-model" style="padding-top: 0;">
					<div class="input-wrap" style="width: 100%;margin-right: 0.2rem;">
						<c:if test="${para1 == null}">
							<input class="imgContent" type="date" name="datFrdt" id="datFrdt" value="${amsClb.TODAY}" onchange="getData(this.value);"/>
						</c:if>
						<c:if test="${para1 != null}">
							<input class="imgContent" type="date" name="datFrdt" id="datFrdt" value="${para1}" onchange="getData(this.value);"/>
						</c:if>
						<div></div>
					</div>
				</div>   
			
			</div> 		
		
			<a class="tabList font20 mb10" style="cursor:pointer; width: 3.4rem;" onclick="moveToPage('a');">대시보드<br><span style="color:red;">(PC 화면)</span></a>
			<a class="tabList font20 mb10" style="cursor:pointer; width: 3.4rem;" onclick="moveToPage('b');">경기결과 등록<br><span style="color:red;">(모바일 화면)</span></a>
			
		</div>
		
        <div class="container f-column" style="height: 100%;padding-top: 2rem;">
          <div class="scroll-wrap f-col" id="gameTableList" style="padding-bottom:1.64rem;">
          

            
          </div>
        </div>
          
      </div>

		
          
    </div>
    
        
  </body>
<script>

$(function() {
	<c:if test="${para1 == null}">
		getData("${amsClb.TODAY}");
	</c:if>
	<c:if test="${para1 != null}">
		getData("${para1}");
	</c:if>
});

function moveToPage(type) {
	var aURL = "/front/bbc/exc/getPage.htm?pageName=page14&intClbsq=${intClbsq}&para1=" + $("#datFrdt").val();
	var bURL = "/front/bbc/exc/getPage.htm?pageName=page16&intClbsq=${intClbsq}&para1=" + $("#datFrdt").val();
	if (type == "a") window.open(aURL, "dashboard");
	if (type == "b") window.open(bURL, "gameResultReg");
}

function getData(dt) {

	var load = loading();
	load.show()

	$("#gameTableList").html("");
					
	 $.ajax({
	 	 		data:{
 	 				para1 : "SELECT_MINI_GET_COURT"
		 	 			,para2 : "${intClbsq}"
		 	 			,para3 : dt
		 	 		},
			type : "POST",
			url : "/front/bbc/badMatch/getData.htm",
			success : function(data) {
				var htm = '';
				if (data.list.length != 0) {

					for (var i = 0; i < data.list.length; i++) {

						if (i == 0) {
							htm = ''
							+ '<div class="title2">'
							+ '	<span class="font24 bold">코트별 점수판 Display</span>'
							+ '</div>'
							+ '<div class="table">'
							+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
							+ '		<tbody id="tbodyListCourt">'
							+ '			<tr>'
							+ '				<th>코트</th>'
							+ '				<th>점수판</th>'
							+ '			</tr>'
							+ '		</tbody>'
							+ '	</table>'
							+ '</div>'
							;
							$("#gameTableList").append(htm);
						}

						htm = ''
							+ '			<tr>'
							+ '				<td class="center">'+data.list[i].COURT+'</td>'
							+ '				<td class="center"><a href="/front/bbc/exc/getPage.htm?pageName=page17&intClbsq=${intClbsq}&para1='+data.list[i].COURT+'&para2='+dt+'"><span class="mdi mdi-youtube-tv" style="font-size: 0.5rem;" onclick=""></span></a></td>'
							+ '			</tr>'
							;
							$("#tbodyListCourt").append(htm);
						
						
					}
					
				}
				
				load.hide();					
				
			},
			error : function(xhr, status, e) {
				load.hide()
				alert("Error : " + status);
			}
		});
}
	

function getData2(para2, para3) {

	var load = loading();
	load.show()

	 $.ajax({
	 	 		data:{
	 	 			para1 : "BADMATCH_SELECT_DUPLICATE_PLR_LIST"
	 	 			,para2 : para3
	 	 		},
			type : "POST",
			url : "/front/bbc/badMatch/getData.htm",
			success : function(data) {
				var htm = '';
				if (data.list.length != 0) {

					$("#gameTableList").html("");
					
					for (var i = 0; i < data.list.length; i++) {

						if (i == 0) {
							htm = ''
							+ '<div class="title2">'
							+ '	<span class="font24 bold">선수 경기 시간 중복 배정</span>'
							+ '</div>'
							+ '<div class="table">'
							+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
							+ '		<tbody id="tbodyListCourt">'
							+ '			<tr>'
							+ '				<th>코트</th>'
							+ '				<th>시작시간</th>'
							+ '				<th>종목</th>'
							+ '				<th>조</th>'
							+ '				<th>경기순서</th>'
							+ '				<th>선수</th>'
							+ '			</tr>'
							+ '		</tbody>'
							+ '	</table>'
							+ '</div>'
							;
							$("#gameTableList").append(htm);
						}

						htm = ''
							+ '			<tr>'
							+ '				<td class="center">'+data.list[i].COURT+'</td>'
							+ '				<td class="center">'+data.list[i].START_TM+'</td>'
							+ '				<td class="center">'+data.list[i].B_LVL_NM+'/'+data.list[i].GAME_TYPE_NM+'</td>'
							+ '				<td class="center">'+data.list[i].GAME_GROUP+'조</td>'
							+ '				<td class="center">'+data.list[i].GAME_SEQ+'</td>'
							+ '				<td class="center">'+data.list[i].MBR_NM+'</td>'
							+ '			</tr>'
							;
							$("#tbodyListCourt").append(htm);
							tag = data.list[i].B_LVL + '-' + data.list[i].GAME_TYPE + '-' + data.list[i].GAME_GROUP;
						
						
					}
					
				} else {

					$("#gameTableList").html("");
					htm = ''
					+ '<div class="title2">'
					+ '	<span class="font24 bold">코트 및 시간 중복 배정</span>'
					+ '</div>'
					+ '<div class="table">'
					+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
					+ '		<tbody id="tbodyListCourt">'
					+ '			<tr>'
					+ '				<th>코트</th>'
					+ '				<th>시작시간</th>'
					+ '				<th>종목</th>'
					+ '				<th>조</th>'
					+ '				<th>경기순서</th>'
					+ '				<th>선수</th>'
					+ '			</tr>'
					+ '		</tbody>'
					+ '	</table>'
					+ '</div>'
					;
					$("#gameTableList").append(htm);
					htm = ''
						+ '			<tr>'
						+ '				<td class="center" colspan="6">코트 및 시간 중복된 선수가 없습니다.</td>'
						+ '			</tr>'
						;
						$("#tbodyListCourt").append(htm);
				}
				load.hide();					
				
			},
			error : function(xhr, status, e) {
				load.hide()
				alert("Error : " + status);
			}
		});
}
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
