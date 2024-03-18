<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
  <head>
    <meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>클럽 베스트 TOP 5</title>
    <!--bootstarp：公用-->
    <link rel="stylesheet" type="text/css" href="../css/font.css" />
    <!--字体图标：公用-->
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <!--reset：公用-->
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <!--公共：公用-->
    <link rel="stylesheet" type="text/css" href="../css/button.css" />
    <!--按钮：公用-->
    <script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <!--jquery公用-->
    <script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
    <!--rem公用-->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/echarts.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bbcBestAward.js" type="text/javascript" charset="utf-8"></script>  
    <style>
    .app-header .logo img {
    	width: 0.60rem;
    }
    .drag-table td {
    	text-align: center;
    }
    </style>  
    <script>
    $(function() {
		if($("body > div").attr("id") === 'appBbcBestAward') {
		  // 这里是生成header
		  var htm = '<header class="app-header"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		  $("#appBbcBestAward").prepend(htm)
		}
		$(".app-header").click(function() {
			window.location.href='/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
		});
	});
    </script>
  </head>
  <body>
    <div class="app top5App" id="appBbcBestAward">
	  	<div class="content">
        <div class="scroll-wrap refresh-wrap">

          
          
          <div class="container">
            <div class="title2">
              <span class="font24 bold">베스트 파트너</span><span class="font20 fontOrange">기준 : 파트너간 최다 코인 획득</span>
            </div>
            <div class="table">
              <table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                <tr class="activePrevTr">
                  <th class="lie">순위</th>
                  <th>이름</th>
                  <th>이름</th>
                  <th>게임수</th>
                  <th>승률</th>
                  <th>BB Coin</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcListE" items="${atrMtcListE}" varStatus="status">  

                <tr id= "openData" <c:if test="${status.count == 1}">class="activeTr"</c:if>>
                  <td class="center">${status.count}</td>
                  <td>${atrMtcListE.MBR_NM_A}</td>
                  <td>${atrMtcListE.MBR_NM_B}</td>
                  <td>${atrMtcListE.GAME_CNT}</td>
                  <td>${atrMtcListE.WIN_RATE}%</td>
                  <td style="color:#e33143;">${atrMtcListE.BBC}</td>
                </tr>
                
				 </c:forEach>
				<!-- END Data Loop -->                
                
                
              </table>
            </div>
          </div>
                    
          
          
		  <c:if test="${atrMtcListB.size() > 0}">
          <div class="container">
            <div class="title2">
              <span class="font24 bold">최고 승률상 평균 경기 이상</span><span class="font20 fontOrange">기준 : ${amsClb.TODAY}</span>
            </div>
            <div class="table">
              <table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                <tr class="activePrevTr">
                  <th class="lie">순위</th>
                  <th>이름</th>
                  <th>경기수</th>
                  <th>승/패</th>
                  <th>승률</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcListB" items="${atrMtcListB}" varStatus="status">  

                <tr id= "openData" <c:if test="${status.count == 1}">class="activeTr"</c:if>>
                  <td class="center">${status.count}</td>
                  <td>${atrMtcListB.CLB_NIK_NM}</td>
                  <td>${atrMtcListB.GAME_CNT}</td>
                  <td>${atrMtcListB.WIN}/${atrMtcListB.LOSE}</td>
                  <td>${atrMtcListB.WIN_RATE}%</td>
                </tr>
                
				 </c:forEach>
				<!-- END Data Loop -->                
                
                
              </table>
            </div>
          </div>
		  </c:if>
          
          
          
		  <c:if test="${atrMtcListBG.size() > 0}">
          <div class="container">
            <div class="title2">
              <span class="font24 bold">최다 연승</span><span class="font20 fontOrange">기준 : ${amsClb.TODAY}</span>
            </div>
            <div class="table">
              <table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                <tr class="activePrevTr">
                  <th class="lie">순위</th>
                  <th>이름</th>
                  <th>연승</th>
                  <th>상태</th>
                  <th>연패</th>
                  <th>상태</th>
                  <th>현재</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcListBG" items="${atrMtcListBG}" varStatus="status">  

                <tr id= "openData" <c:if test="${status.count == 1}">class="activeTr"</c:if>>
                  <td class="center">${status.count}</td>
                  <td>${atrMtcListBG.MBR_NM}</td>
                  <td>${atrMtcListBG.STRAIGHT_WIN}</td>
                  <td <c:if test="${atrMtcListBG.WIN_STATUS_TAG == 1}"> style="color:blue;" </c:if>>${atrMtcListBG.WIN_STATUS}</td>
                  <td>${atrMtcListBG.STRAIGHT_LOSE}</td>
                  <td <c:if test="${atrMtcListBG.LOSE_STATUS_TAG == 1}"> style="color:blue;" </c:if>>${atrMtcListBG.LOSE_STATUS}</td>
                  <td <c:if test="${atrMtcListBG.LATEST_VTR_DV == 'W'}"> style="color:blue;" </c:if><c:if test="${atrMtcListBG.LATEST_VTR_DV == 'L'}"> style="color:red;" </c:if>>${atrMtcListBG.LATEST_CNT} ${atrMtcListBG.LATEST_STS}</td>
                </tr>
                
				 </c:forEach>
				<!-- END Data Loop -->                
                
                
              </table>
            </div>
          </div>
		  </c:if>
          

          
          <div class="container">
            <div class="title2">
              <span class="font24 bold">최대 진보상</span><span class="font20 fontOrange">기준 : 초기 코인 대비</span>
            </div>
            <div class="table">
              <table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                <tr class="activePrevTr">
                  <th class="lie">순위</th>
                  <th>이름</th>
                  <th>순위</th>
                  <th>현재코인</th>
                  <th>BB Coin</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcListD" items="${atrMtcListD}" varStatus="status">  

                <tr id= "openData" <c:if test="${status.count == 1}">class="activeTr"</c:if>>
                  <td class="center">${status.count}</td>
                  <td>${atrMtcListD.CLB_NIK_NM}</td>
                  <td>${atrMtcListD.CLB_RANK}</td>
                  <td>${atrMtcListD.CLB_BBC}</td>
                  <td>${atrMtcListD.LASTDAY_BBC_TAG}</td>
                </tr>
                
				 </c:forEach>
				<!-- END Data Loop -->                
                
                
              </table>
            </div>
          </div>
          
          
          

          <div class="container">
            <div class="title2">
              <span class="font24 bold">핸디별 진보 상세 현황</span><span class="font20 fontOrange">기준 : 클럽 평균 게임 횟수 이상</span>
            </div>
            <div class="table">
              <table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                <tr class="activePrevTr">
                  <th class="lie">순위</th>
                  <th>이름</th>
                  <th>승/패<br>승률 %</th>
                  <th>합계</th>
                  <th>약자<br>상대</th>
                  <th>동급</th>
                  <th>강자<br>상대</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcListC" items="${atrMtcListC}" varStatus="status">  

                <tr id= "openData" <c:if test="${status.count == 1}">class="activeTr"</c:if>>
                  <td class="center" style="padding: 0.12rem 0.12rem;">${status.count}</td>
                  <td style="padding: 0.12rem 0.12rem;text-align: center;">${atrMtcListC.CLB_NIK_NM}</td>
                  <td style="padding: 0.12rem 0.12rem;text-align: center;">${atrMtcListC.WIN}/${atrMtcListC.LOSE}<br>(${atrMtcListC.WIN_RATE})</td>
                  <td style="padding: 0.12rem 0.12rem;text-align: center;<c:if test="${atrMtcListC.BBC >= 0}"> color:blue;</c:if><c:if test="${atrMtcListC.BBC < 0}"> color:red;</c:if>">${atrMtcListC.BBC}</td>
                  <td style="padding: 0.12rem 0.12rem;text-align: center;<c:if test="${atrMtcListC.BBC_MINUS >= 0}"> color:blue;</c:if><c:if test="${atrMtcListC.BBC_MINUS < 0}"> color:red;</c:if>">${atrMtcListC.BBC_MINUS}<br>${atrMtcListC.BBC_MINUS_W}/${atrMtcListC.BBC_MINUS_L}</td>
                  <td style="padding: 0.12rem 0.12rem;text-align: center;<c:if test="${atrMtcListC.BBC_EQUAL >= 0}"> color:blue;</c:if><c:if test="${atrMtcListC.BBC_EQUAL < 0}"> color:red;</c:if>">${atrMtcListC.BBC_EQUAL}<br>${atrMtcListC.BBC_EQUAL_W}/${atrMtcListC.BBC_EQUAL_L}</td>
                  <td style="padding: 0.12rem 0.12rem;text-align: center;<c:if test="${atrMtcListC.BBC_PLUS >= 0}"> color:blue;</c:if><c:if test="${atrMtcListC.BBC_PLUS < 0}"> color:red;</c:if>">${atrMtcListC.BBC_PLUS}<br>${atrMtcListC.BBC_PLUS_W}/${atrMtcListC.BBC_PLUS_L}</td>
                </tr>
                
				 </c:forEach>
				<!-- END Data Loop -->                
                
                
              </table>
            </div>
          </div>
                    
          
          
          <div class="container">
            <div class="title2">
              <span class="font24 bold">최다 경기상</span><span class="font20 fontOrange">경기 기록 입력 기준</span>
            </div>
            <div class="table">
              <table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                <tr class="activePrevTr">
                  <th class="lie">순위</th>
                  <th>이름</th>
                  <th>경기수</th>
                  <th>승/패</th>
                  <th>승률</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcList" items="${atrMtcList}" varStatus="status">  

                <tr id= "openData" <c:if test="${status.count == 1}">class="activeTr"</c:if>>
                  <td class="center">${status.count}</td>
                  <td>${atrMtcList.CLB_NIK_NM}</td>
                  <td>${atrMtcList.GAME_CNT}</td>
                  <td>${atrMtcList.WIN}/${atrMtcList.LOSE}</td>
                  <td>${atrMtcList.WIN_RATE}%</td>
                </tr>
                
				 </c:forEach>
				<!-- END Data Loop -->                
                
                
              </table>
            </div>
          </div>
          
          
          
          
          
		  <c:if test="${atrMtcListF.size() > 0}">
          <div class="container">
            <div class="title2">
              <span class="font24 bold">최다 이벤트 상</span><span class="font20 fontOrange">기준 : 이벤트 횟수</span>
            </div>
            <div class="table" style="padding-bottom: 2rem;">
              <table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                <tr class="activePrevTr">
                  <th class="lie">순위</th>
                  <th>이름</th>
                  <th>이벤트횟수</th>
                  <th>승</th>
                  <th>패</th>
                  <th>승률</th>
                  <th>금액환산</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcListF" items="${atrMtcListF}" varStatus="status">  

                <tr id= "openData" <c:if test="${status.count == 1}">class="activeTr"</c:if>>
                  <td class="center">${status.count}</td>
                  <td>${atrMtcListF.NM}</td>
                  <td style="color:#e33143;">${atrMtcListF.CNT}</td>
                  <td>${atrMtcListF.WIN}</td>
                  <td>${atrMtcListF.LOSE}</td>
                  <td>${atrMtcListF.RATE}%</td>
                  <td>${atrMtcListF.RMB}</td>
                </tr>
                
				 </c:forEach>
				<!-- END Data Loop -->                
                
                
              </table>
            </div>
          </div>
          </c:if>
          
          <br>
          <br>
          <br>
          
          
          <div id ="relevant" class="table-wrap container relevant">
            <div class="title1">
              <div>
                <i class="fourDPlex icon-sanjiao"></i>
                <span>상세 현황</span>
              </div>
            </div>
            <div class="table">
              <table class="drag-table open" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
                <colgroup>
                	<col width="27%"/>
                	<col width="73%"/>
                </colgroup>
                <tr>
                  <td class="right">국가</td>
                  <td class="left">한국</td>
                </tr>
              </table>
            </div>
            <div class="chart" id="chart"></div>
          </div>
        </div>
	  	</div>
	  </div> 
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
  </body>
</html> 