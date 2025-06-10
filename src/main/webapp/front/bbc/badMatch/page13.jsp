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
.drag-table td {
    padding: 0.24rem 0 0.24rem 0;
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
          
          <div class="scroll-wrap f-col" >
          
          		<div id="match10027" style="display:none;">
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">A조 남복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr>
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr>
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22238);" style="text-decoration: underline;color: #006ecd;">김승호</td>
									<td class="center" onclick="gotoPlayerPage(22240);" style="text-decoration: underline;color: #006ecd;">김정환</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22192);" style="text-decoration: underline;color: #006ecd;">박성현</td>
									<td class="center" onclick="gotoPlayerPage(22246);" style="text-decoration: underline;color: #006ecd;">송상민</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22253);" style="text-decoration: underline;color: #006ecd;">진태주</td>
									<td class="center" onclick="gotoPlayerPage(22236);" style="text-decoration: underline;color: #006ecd;">김재은</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">B조 남복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(20);" style="text-decoration: underline;color: #006ecd;">김동일</td>
									<td class="center" onclick="gotoPlayerPage(22160);" style="text-decoration: underline;color: #006ecd;">전진규</td>
									<td class="center" style="width: 2rem;">신민회</td>
									<td class="center">승급</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22205);" style="text-decoration: underline;color: #006ecd;">임성섭</td>
									<td class="center" onclick="gotoPlayerPage(22189);" style="text-decoration: underline;color: #006ecd;">장재훈</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22222);" style="text-decoration: underline;color: #006ecd;">김형석</td>
									<td class="center" onclick="gotoPlayerPage(22175);" style="text-decoration: underline;color: #006ecd;">박주호</td>
									<td class="center" style="width: 2rem;">ABC</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">B조 여복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22133);" style="text-decoration: underline;color: #006ecd;">팜티투현</td>
									<td class="center" onclick="gotoPlayerPage(22230);" style="text-decoration: underline;color: #006ecd;">꾸엔</td>
									<td class="center" style="width: 2rem;">VHB</td>
									<td class="center">승급</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22239);" style="text-decoration: underline;color: #006ecd;">강은덕</td>
									<td class="center" onclick="gotoPlayerPage(22241);" style="text-decoration: underline;color: #006ecd;">Trabi</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22162);" style="text-decoration: underline;color: #006ecd;">오미영</td>
									<td class="center" onclick="gotoPlayerPage(22228);" style="text-decoration: underline;color: #006ecd;">팜티뜽비</td>
									<td class="center" style="width: 2rem;">ABC</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">B조 혼복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22226);" style="text-decoration: underline;color: #006ecd;">판당쭝</td>
									<td class="center" onclick="gotoPlayerPage(22230);" style="text-decoration: underline;color: #006ecd;">꾸엔</td>
									<td class="center" style="width: 2rem;">VHB</td>
									<td class="center">승급<br>(남자)</td>
								</tr>
								<tr class="activeTr">
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22205);" style="text-decoration: underline;color: #006ecd;">임성섭</td>
									<td class="center" onclick="gotoPlayerPage(22239);" style="text-decoration: underline;color: #006ecd;">강은덕</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">승급<br>(남자)</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22160);" style="text-decoration: underline;color: #006ecd;">전진규</td>
									<td class="center" onclick="gotoPlayerPage(22193);" style="text-decoration: underline;color: #006ecd;">조보경</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">C조 남복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22204);" style="text-decoration: underline;color: #006ecd;">김대호</td>
									<td class="center" onclick="gotoPlayerPage(22211);" style="text-decoration: underline;color: #006ecd;">정성규</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">승급</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22221);" style="text-decoration: underline;color: #006ecd;">백남현</td>
									<td class="center" onclick="gotoPlayerPage(22179);" style="text-decoration: underline;color: #006ecd;">최정기</td>
									<td class="center" style="width: 2rem;">FBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22178);" style="text-decoration: underline;color: #006ecd;">김혜종</td>
									<td class="center" onclick="gotoPlayerPage(22226);" style="text-decoration: underline;color: #006ecd;">판당쭝</td>
									<td class="center" style="width: 2rem;">VHB</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">C조 여복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22173);" style="text-decoration: underline;color: #006ecd;">조이슬</td>
									<td class="center" onclick="gotoPlayerPage(22231);" style="text-decoration: underline;color: #006ecd;">응우옌티응안안</td>
									<td class="center" style="width: 2rem;">ABC</td>
									<td class="center">승급</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22147);" style="text-decoration: underline;color: #006ecd;">박민영</td>
									<td class="center" onclick="gotoPlayerPage(22161);" style="text-decoration: underline;color: #006ecd;">장소영</td>
									<td class="center" style="width: 2rem;">PBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(1638);" style="text-decoration: underline;color: #006ecd;">신은아</td>
									<td class="center" onclick="gotoPlayerPage(22156);" style="text-decoration: underline;color: #006ecd;">김춘향</td>
									<td class="center" style="width: 2rem;">신민회</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">C조 혼복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22170);" style="text-decoration: underline;color: #006ecd;">원준영</td>
									<td class="center" onclick="gotoPlayerPage(22234);" style="text-decoration: underline;color: #006ecd;">쩐헌</td>
									<td class="center" style="width: 2rem;">VHB</td>
									<td class="center">승급<br>(남자)</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22216);" style="text-decoration: underline;color: #006ecd;">신재호</td>
									<td class="center" onclick="gotoPlayerPage(22241);" style="text-decoration: underline;color: #006ecd;">Trabi</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22136);" style="text-decoration: underline;color: #006ecd;">임인규</td>
									<td class="center" onclick="gotoPlayerPage(22161);" style="text-decoration: underline;color: #006ecd;">장소영</td>
									<td class="center" style="width: 2rem;">SBC</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">D조 남복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22180);" style="text-decoration: underline;color: #006ecd;">임일순</td>
									<td class="center" onclick="gotoPlayerPage(22206);" style="text-decoration: underline;color: #006ecd;">한영기</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">승급</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(1642);" style="text-decoration: underline;color: #006ecd;">조영신</td>
									<td class="center" onclick="gotoPlayerPage(22142);" style="text-decoration: underline;color: #006ecd;">이동호</td>
									<td class="center" style="width: 2rem;">신민회</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22182);" style="text-decoration: underline;color: #006ecd;">이진수</td>
									<td class="center" onclick="gotoPlayerPage(22181);" style="text-decoration: underline;color: #006ecd;">석영주</td>
									<td class="center" style="width: 2rem;">FBC</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">D조 여복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22138);" style="text-decoration: underline;color: #006ecd;">김형경</td>
									<td class="center" onclick="gotoPlayerPage(22141);" style="text-decoration: underline;color: #006ecd;">이성희</td>
									<td class="center" style="width: 2rem;">PBC</td>
									<td class="center">승급</td>
								</tr>
								<tr>
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22158);" style="text-decoration: underline;color: #006ecd;">최경희</td>
									<td class="center" onclick="gotoPlayerPage(22153);" style="text-decoration: underline;color: #006ecd;">임선아</td>
									<td class="center" style="width: 2rem;">PBC</td>
									<td class="center">-</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22207);" style="text-decoration: underline;color: #006ecd;">전민아</td>
									<td class="center" onclick="gotoPlayerPage(22237);" style="text-decoration: underline;color: #006ecd;">이후남</td>
									<td class="center" style="width: 2rem;">KBC</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
          			
          			<!-- ---------------------------------------------- -->
	          		<div class="title2">
						<span class="font24 bold">D조 혼복</span>
					</div>
					<div class="table">
						<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
							<tbody id="tbodyList">
								<tr class="activeTr">
									<th>순위</th>
									<th>이름</th>
									<th>이름</th>
									<th>클럽</th>
									<th>승급</th>
								</tr>
								<tr class="activeTr">
									<td class="center">우승</td>
									<td class="center" onclick="gotoPlayerPage(22134);" style="text-decoration: underline;color: #006ecd;">정영오</td>
									<td class="center" onclick="gotoPlayerPage(22185);" style="text-decoration: underline;color: #006ecd;">당하이하</td>
									<td class="center" style="width: 2rem;">SBC</td>
									<td class="center">승급<br>(남자)</td>
								</tr>
								<tr class="activeTr">
									<td class="center">준우승</td>
									<td class="center" onclick="gotoPlayerPage(22135);" style="text-decoration: underline;color: #006ecd;">이일</td>
									<td class="center" onclick="gotoPlayerPage(22138);" style="text-decoration: underline;color: #006ecd;">김형경</td>
									<td class="center" style="width: 2rem;">SBC</td>
									<td class="center">승급<br>(남자)</td>
								</tr>
								<tr>
									<td class="center">3위</td>
									<td class="center" onclick="gotoPlayerPage(22165);" style="text-decoration: underline;color: #006ecd;">김재인</td>
									<td class="center" onclick="gotoPlayerPage(22235);" style="text-decoration: underline;color: #006ecd;">라이</td>
									<td class="center" style="width: 2rem;">VHB</td>
									<td class="center">-</td>
								</tr>
							</tbody>
						</table>
					</div>
          			<!-- ---------------------------------------------- -->
					
          		</div>
          
				<div id="gameTable2" >
				
				
				
				</div>


          		<div class="title2" style="padding-top: 1rem;">
          			<span class="font24 bold">축하의 메시지 남기기 !!</span>
          			<span class="font20 fontOrange" id="addMessage">글쓰기</span>
          		</div>
          
          		<div id="tab1" class="f-col">

            		<ul class="tabAllList" style="padding-bottom:2rem;" id="replyHtml">
            		</ul>
          		</div>

          		<div id="tab3" style="display: none;" class="f-col">
            		<div class="tabContent" style="padding-bottom: 2rem;">
              			<div>
                			<textarea class="textWord fontBlack font20" id="replyText" name="replyText" placeholder="텍스트를 입력해 주세요. (请输入内容)" cols="80" rows="10"></textarea>
                			<input type="hidden" id="replySq" />
              			</div>
	          			<div class="btn-wrap">
	          	  			<div class="buttons">
					      		<div class="orangeBtn subBtn f-col font26" id="cancelReply">취소</div>
					      		<div class="blueBtn subBtn f-col font26" id="saveReply">저장</div>
	              			</div>
	            		</div>
            		</div>
          		</div>

            
          </div>
          
	        <c:if test="${userInfo.AUTH == 'A'}">
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
		getReplyData();
	});

	function changeTab(index){
	  	if(index == 1) {
	      $("#tab3").hide();
	      $("#tab1").show();
	  	} else if(index == 3) {
	      $("#tab1").hide();
	      $("#tab3").show();
	  	}
	}

	function addReply(replySq){
	  	$("#replySq").val(replySq);
		$('#replyText').val("");
		changeTab(3);
	}
	
	$('#cancelReply').click(function(e) {
		changeTab(1);
	});

	$('#addMessage').click(function(e) {
	  	$("#replySq").val("");
		$('#replyText').val("");
		changeTab(3);
	});
	
	$('#saveReply').click(function(e) {
		saveMessage();
	});

	function saveMessage() {

		var para3 = $('#replySq').val();
 		var para4 = "${loginMbrSq}";
 		var para5 = $('#replyText').val();
 		
 		if (para5 =="") {
     		alert("${label.请输入您的备注信息}.");	
     		return;
 		}

 		$("#saveReply").hide();

 		var load = loading();
 		load.show()
 		
 		$.ajax({
 	 		data:{
 	 			para1 : "ADD_MATCH_REPLY"
 	 			,para2 : "${para3}"
 	 			,para3 : para3
 	 			,para4 : "${loginMbrSq}"
 	 			,para5 : para5
 	 		},
			type : "POST",
			url : "/front/bbc/badMatch/getData.htm",
 			success : function(data) {
 				load.hide();
 		 		$("#saveReply").show();
 				getReplyData();
 			},
 			error : function(xhr, status, e) {
 				load.hide();
 		 		$("#saveReply").show();
 				alert("Error : " + status);
 			}
 		});
	}
	

	function getReplyData() {

 		var load = loading();
 		load.show()
 		
 		$.ajax({
 	 		data:{
 	 			para1 : "SEARCH_MATCH_REPLY"
 	 			,para2 : "${para3}"
 	 		},
			type : "POST",
			url : "/front/bbc/badMatch/getData.htm",
 			success : function(data) {

				if (data.list.length != 0) {

					$("#replyHtml").html("");
					var htm = '';
					
					for (var i = 0; i < data.list.length; i++) {
						if (data.list[i].REPLY_TYPE == "MAIN") {
							htm = ''
								+ '<li style="background-image: url('+data.list[i].MBR_BAK_IMG_PTH+');background-repeat: no-repeat;background-size: 0.8rem;background-position: 0 0.28rem;">'
								+ '	<div class="title" style="margin-left: 1rem;">'
								+ '		<div class="date-wrap">'
								+ '			<div class="imgTab" style="height: 0.5rem;">'
								+ '				<span style="font-size: 0.3rem;position: absolute;top: 0.12rem;padding-left: 0.2rem;">'
								+ data.list[i].MBR_NM
								+ '				</span>'
								+ '			</div>'
								+ '			<span onclick="addReply('+data.list[i].REPLY_SQ+')" style="font-size: 0.2rem;">댓글쓰기</span>'
								+ '		</div>'
								+ '		<div class="riskTitle">'
								+ '			<div style="max-width: 4.6rem;">'
								+ '				<span style="line-height: 1.3;font-size: 0.28rem;color: #0080c6;font-weight: initial;">'
								+ data.list[i].CMT
								+ '				</span>'
								+ '			</div>'
								+ '			<span style="text-align: right;">'+data.list[i].REG_DT+'</span>'
								+ '		</div>'
								+ '	</div>'
								+ '	<div class="gray-model" style="display:none;" id="replyItem'+data.list[i].REPLY_SQ+'">'
								+ '	</div>'
								+ '</li> '
							;
							$("#replyHtml").append(htm);
						}
						else {
							htm = ''
								+ '		<p style="line-height: 0.4rem;position: relative;">'
								+ '			<span style="font-weight: bold;">'+data.list[i].MBR_NM+'</span> : '+data.list[i].CMT
								+ '		</p>'
							;
							$("#replyItem"+data.list[i].TOP_REPLY_SQ).show();
							$("#replyItem"+data.list[i].TOP_REPLY_SQ).append(htm);
						}
					}
					
				} else {
					
				}
 				changeTab(1);
 				load.hide();
 			},
 			error : function(xhr, status, e) {
 				load.hide();
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

							if ("${para3}" == "10027") {
								$("#match10027").show();
								load.hide();
								return;
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
								+ '				<th>클럽</th>'
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
