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
<title>권한 관리</title>
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
helpHtmlTag = "※ 권한관리 페이지 입니다.<br><br>A:시스템 관리 권한<br>-권한관리<br>-모든기능<br><br>B:대회 관리자 권한<br>-본선 진출자 조정<br>-본선 진출자 확정 및 예선 종료<br>-예선/본선 코트 설정<br>-예선/본선 경기 결과 등록<br>-대회 종료<br><br>C:경기시간 및 코트 관리, 경기기록 관리<br>-예선/본선 코트 설정<br>-예선/본선 경기 결과 등록<br><br>D:심판 & 경기기록 관리자<br>-예선/본선 경기 결과 등록";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page11&para3=${para3}";'/>
          <span>권한 관리</span>
      	  <a onclick="gotoHelp();" class="matchHelp" style="bottom: 65px;">help</a>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
          
          <div class="scroll-wrap f-col" id="gameTable1" style="padding-bottom:1.64rem;">
          
          </div>

        </div>
      </div>

    </div>
    
	<div class="radio-pop" id="userSelectPop" style="display:none;">
		<input type="hidden" id="selectUserObjNm" />
		<div class="radio-wrap" style="padding:0;width:6.5rem;margin-top: 2rem;">
			  <div class="model-gray" style="margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
	          
	            <div class="bottom-model" style="padding-top: 0;">
					<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
						<input class="imgContent" type="text" name="userNm" id="userNm" placeholder="이름을 입력 후 조회하세요.">
					</div>
	              	<button class="confirmBtn" id="confirmBtn" onclick="searchUser($('#userNm').val());">조회</button>
	            </div>
	          </div>		
			<div class="radio-content">

				<div class="container mt10">
		      		<div class="title2">
		              <span class="font24 bold">선수 검색</span>
		          	</div>
		            <div class="scroll-wrap" style="padding-bottom:0.5rem;min-height:5rem;height:5rem;">
		         		<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="userResultTbody">
		                <tr>
		                  <th class="noWrapCell">클럽</th>
		                  <th class="noWrapCell">이릅</th>
		                  <th class="noWrapCell">급수</th>
		                  <th class="noWrapCell">선택</th>
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
			<div class="radio-button" style="padding: 0.5rem;">
				<div onclick="$('#userSelectPop').hide();">확인</div>
			</div>
		</div>
	</div>    
    
        
  </body>
<script>

	$(function() {
		getData();
	});
	
	function getData() {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT_AUTH"
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

							if (i == 0) {
								htm = ''
									+ '<div class="title2">'
									+ '	<span class="font24 bold">권한관리</span><span class="font20 fontOrange" onclick="$(\'#userSelectPop\').show();">권한등록</span>'
									+ '</div>'
								+ '<div class="table">'
								+ '	<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">'
								+ '		<tbody id="tbodyList-auth">'
								+ '			<tr>'
								+ '				<th>이름</th>'
								+ '				<th>권한</th>'
								+ '				<th>경기</th>'
								+ '				<th>입력</th>'
								+ '			</tr>'
								+ '		</tbody>'
								+ '	</table>'
								+ '</div>'
								;
								$("#gameTable1").append(htm);
							}

							var btnTag = '';
							if (data.list[i].AUTH == 'A') {
								btnTag = '				<td class="center">-</td>';
							}
							else {
								btnTag = '				<td class="center" onclick="saveAuthMatch('+data.list[i].MBR_SQ+', \'N\');">삭제</td>';
							}
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].MBR_NM+'</td>'
								+ '				<td class="center">'+data.list[i].AUTH+'</td>'
								+ '				<td class="center" style="max-width: 3rem;">'+data.list[i].MCH_NM+'</td>'
								+ btnTag
								+ '			</tr>'
								;
								$("#tbodyList-auth").append(htm);
							
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


	function searchUser(para2) {
	
		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SEARCH_USER_ALL"
		 	 			,para2 : para2
		 	 			,para3 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					
					$("#userResultTbody").html("");

					htm = ''
						+ '<tr>'
						+ '<th class="noWrapCell">클럽</th>'
						+ '<th class="noWrapCell">이릅</th>'
						+ '<th class="noWrapCell">B권한</th>'
						+ '<th class="noWrapCell">C권한</th>'
						+ '<th class="noWrapCell">D권한</th>'
						+ '</tr>';

					$("#userResultTbody").append(htm);
					
					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {
							
							htm = ''
								+ '<tr>'  
								+ '	<td class="noWrapCell center" style="max-width: 1.2rem;" onclick="msgBox(\''+data.list[i].CLB_NM+'\');">'+data.list[i].CLB_NM+'</td>'
								+ '	<td class="noWrapCell center" style="max-width: 1.2rem;">'+data.list[i].MBR_NM+'</td>'
								+ '	<td class="center" onclick="saveAuthMatch('+data.list[i].MBR_SQ+', \'B\');">저장</td>'
								+ '	<td class="center" onclick="saveAuthMatch('+data.list[i].MBR_SQ+', \'C\');">저장</td>'
								+ '	<td class="center" onclick="saveAuthMatch('+data.list[i].MBR_SQ+', \'D\');">저장</td>'
								+ '</tr>'
							;
							$("#userResultTbody").append(htm);

						}
					} else {
						
						htm = '';
						$("#userResultTbody").append(htm);
					}
					load.hide();					
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
	

	function saveAuthMatch(para3, para4) {
		
		if (!("${userInfo.AUTH}" == "A")) {
			messageBox({
				title : '알림',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {}
			});	
			return;
		}
		
		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_AUTH_MERGE"
		 	 			,para2 : "${para3}"
		 	 			,para3 : para3
		 	 			,para4 : para4
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

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
