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
    <title>${label.每日比赛结果}</title>
    <!--bootstarp：公用-->
    <link rel="stylesheet" type="text/css" href="../css/font.css" />
    <!--字体图标：公用-->
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <!--reset：公用-->
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <!--公共：公用-->
    <link rel="stylesheet" type="text/css" href="../css/button.css" />
    <!--按钮：公用-->
    <link rel="stylesheet" type="text/css" href="../css/date.css" />
    <!--首页：index-->
    <script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <!--jquery公用-->
    <script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
    <!--rem公用-->
    <script src="../js/bootstrap.min.js"></script>
    <!--bootstarp公用-->
    <script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/gameTody.js" type="text/javascript" charset="utf-8"></script>
    <!--run 首页用-->
    <style>
    .app-header .logo img {
    	width: 0.60rem;
    }
    .right-model h4 span img {
    	display: initial;
    	height: 0.22rem;
	    width: 0.22rem;
	    margin-left: 0.06rem;
    }
    
    .alignRightTable tr td img{
    	display: initial;
    	height: 0.17rem;
	    width: 0.17rem;
	    margin-left: 0.06rem;
    }
    .drag-table td {
	    font-size: 0.28rem;
	    line-height: 0.34rem;
	    padding: 0.3rem 0.1rem;
    }
    div {
    	line-height: 1.3;
    }
    .app {
    	padding-top: 0;
    }
    .app-header {
    	position: relative;
    }
    
    .threeSpan {
	    border: 1px solid #0080c6;
	    border-radius: 0.2rem;
	    margin-left: 1%;
	    color: #0080c6;
	    padding-left: 0.1rem;
	    padding-right: 0.1rem;
	    width: 30%;
    	display: inline-block;
    	text-align: center;
    }
    
    .threeSpan2 {
	    border: 1px solid #ec8921;
	    border-radius: 0.2rem;
	    margin-left: 1%;
	    color: #0080c6;
	    padding-left: 0.1rem;
	    padding-right: 0.1rem;
	    width: 30%;
    	display: inline-block;
    	text-align: center;
    }
    
    .nameLabel {
    	overflow: hidden;
    	width: 1rem;
    }
    </style>  
    <script>
    $(function() {
		//if($("body > div").attr("id") === 'appGameTody') {
		  // 这里是生成header
		  var htm = '<header class="app-header"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		  $("#appGameTody").prepend(htm)
		//}
		$(".app-header").click(function() {
			window.location.href='/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
		});
	});
    </script>
  </head>

  <body>
    <div class="app schedule">
      <div class="content" style="padding-bottom:0;">
        <div class="scroll-wrap refresh-wrap" id="appGameTody">
        
          <div class="model-gray" style="margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
          
            <div class="bottom-model" style="padding-top: 0;">
				<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
					<input class="imgContent" style="padding-left: 0.1rem;width:45%;padding-right: 0;" type="date" name="datFrdt" id="datFrdt" value="${datFrdt }" />
					<input class="imgContent" style="padding-left: 0.1rem;width:45%;padding-right: 0;" type="date" name="datTodt" id="datTodt" value="${datTodt }" />
				</div>             
              	<button class="confirmBtn" id="confirmBtn" onclick="search('${intMbrsq}');">${label.查询}</button>
            </div>
          </div>
          
          	<div class="btn-wrap" style="padding-top: 0;">
          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
                <div class="orangeBtn subBtn f-col font26" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}';">복식랭킹<br>조회</div>
                <div class="blueBtn subBtn f-col font26" onclick="search('');">전체현황<br>조회</div>
                <div class="blueBtn subBtn f-col font26" onclick="gotoGameToday('${loginMbrSq}');">나의현황<br>조회</div>
                <div class="orangeBtn subBtn f-col font26" onclick="window.location.href='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';">경기결과<br>등록</div>
              </div>
            </div>
            
          
		  <c:if test="${atrMtcListP != null}">
          <div class="container"  id="displayThree">
        	<div id="tableWrap">
              <div class="title1">
                <div>
                  <i class="fourDPlex icon-sanjiao"></i>
                  <span class="bold">경기 참여 현황</span>
                </div>
                <i class="fourDPlex icon-jian" id="tableUp"></i>
              </div>
              <div class="table" style="padding-bottom: 0.24rem;">
	              <table class="drag-table" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
	                <colgroup>
	                	<col width="26%" />
	                	<col width="74%" />
	                </colgroup>

	                <tr>
	                  <th style="padding: 0.2rem;"><div class="green-solid fontGreen">3경기 미만<br>회원</div></th>
	                  <td>
	                  	<div style="line-height: 2;">
	                  	
						  <c:set var="THREECNT" value="" />
						  <c:set var="spanType" value="2" />
						  <c:set var="displayThree" value="none" />
						  <!-- START Data Loop -->
						  <c:forEach var="atrMtcListP" items="${atrMtcListP}" varStatus="status">
						  
							<c:if test="${THREECNT == 0 and atrMtcListP.GAME_LESSON_CNT < 3}">

						  		<c:set var="displayThree" value="block" />
						  		
								<c:if test="${atrMtcListP.GAME_LESSON_CNT > 1}">
							  		<c:set var="spanType" value="" />
								</c:if>
								
							  	<c:set var="imgUrl" value="" />
							  	
								<c:if test="${atrMtcListP.LESSON == 0}">
									<c:if test="${status.count == 1}">
								  		<div class="threeSpan${spanType}" onclick="gotoGameToday('${atrMtcListP.MBR_SQ}');">${atrMtcListP.CLB_NIK_NM}(${atrMtcListP.GAME_CNT})</div>
									</c:if>
									<c:if test="${status.count > 1}">
								  		 <div class="threeSpan${spanType}" onclick="gotoGameToday('${atrMtcListP.MBR_SQ}');">${atrMtcListP.CLB_NIK_NM}(${atrMtcListP.GAME_CNT})</div>
									</c:if>
								</c:if>
								<c:if test="${atrMtcListP.LESSON == 1}">
							  		<c:set var="imgUrl" value="<img style='border-radius: 0;width:0.25rem;height:0.25rem;margin-top:0.01rem;;display:inline;' src='/front/bbc/img/em/4.gif'>" />
									<c:if test="${status.count == 1}">
								  		<div class="threeSpan${spanType}" onclick="gotoGameToday('${atrMtcListP.MBR_SQ}');">${atrMtcListP.CLB_NIK_NM} ${imgUrl }</div>
									</c:if>
									<c:if test="${status.count > 1}">
								  		 <div class="threeSpan${spanType}" onclick="gotoGameToday('${atrMtcListP.MBR_SQ}');">${atrMtcListP.CLB_NIK_NM} ${imgUrl }</div>
									</c:if>
								</c:if>
							
							</c:if>
							
						  	
						  
          				  </c:forEach>
          				  
						  <c:if test="${displayThree == 'none'}">
					  		<script>$("#displayThree").hide();</script>
						  </c:if>

	                  	</div>
	                  </td>
	                </tr>
	              </table>
            	</div>
            	
            </div>
          </div>
          </c:if>
          
		  <c:if test="${atrMtcMbrList != null}">
          <div class="container mt10">
            <div class="title2">
              <span class="font24 bold"><span style="color:#0080c6;">${atrMtcMbrList.CLB_NIK_NM}</span>님 일일경기 현황</span><p class="small row1">${label.总} <strong class="number yellow">${atrMtcMbrList.GAME_CNT}</strong>${label.战} <strong class="number yellow">${atrMtcMbrList.WIN}</strong>${label.胜} <strong class="number yellow">${atrMtcMbrList.LOSE}</strong>${label.负}</p>
            </div>
            
            <div class="date mt10 date_schedule pb12">
            	<div class="date-model">
            		<div class="left-model"><p>${label.胜率}</p><h4><span>${atrMtcMbrList.WIN_RATE}%</span></h4></div>
            		<div class="right-model"><p>BB Coin</p><h4><span>${atrMtcMbrList.LASTDAY_BBC_TAG}</span></h4></div>
            	</div>
            </div>
          </div>
          </c:if>
          
          
          <div class="container mt10">
      		<div class="title2">
              <span class="font24 bold">일일경기목록</span><span class="font20 fontOrange">총 ${atrMtcListCnt }게임</span>
          	</div>
            <div class="table1" style="padding-bottom:1.5rem;">
         		<table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
                <tr>
                  <th class="noWrapCell">일자</th>
                  <th class="noWrapCell">Coin</th>
                  <th class="noWrapCell">승리팀</th>
                  <th class="noWrapCell">점수</th>
                  <th class="noWrapCell">패배팀</th>
                  <th class="noWrapCell">Coin</th>
                  <th class="noWrapCell">등록</th>
                </tr>
                
				<!-- START Data Loop -->
				<c:forEach var="atrMtcList" items="${atrMtcList}" varStatus="status">  
					
					<c:if test="${atrMtcList.A_TEM_SCR == 0 and atrMtcList.B_TEM_SCR == 0 and atrMtcList.EXC_SQ > 0}">
						
						<c:set var="backColor" value="background:#ebebeb;" />
						
						<c:if test="${atrMtcList.MOD_CORT_SEQ > 0}">
							<c:set var="backColor" value="background:#ffe7e7;" />
						</c:if>

					</c:if>
						
					<c:set var="myTaga" value="" />
					<c:set var="myTagb" value="" />
					<c:set var="selectMbrsq" value="${loginMbrSq}" />
					
					<c:if test="${atrMtcMbrList != null}">
						<c:set var="selectMbrsq" value="${atrMtcMbrList.MBR_SQ}" />
					</c:if>
					
					<c:if test="${atrMtcList.MBR_SQ_A1 == selectMbrsq || atrMtcList.MBR_SQ_A2 == selectMbrsq}">
						<c:set var="myTaga" value="style='background-color:#c8fcf7;'" />
						<c:set var="myTagb" value="" />
					</c:if>
					<c:if test="${atrMtcList.MBR_SQ_B1 == selectMbrsq || atrMtcList.MBR_SQ_B2 == selectMbrsq}">
						<c:set var="myTaga" value="" />
						<c:set var="myTagb" value="style='background-color:#c8fcf7;'" />
					</c:if>
						
                <tr>  
                
                  <td class="center">[${status.count}]<br>${atrMtcList.MTC_MMDD}</td>
                  
					<c:if test="${atrMtcList.VTC_TEM_DV == 'A'}">
						<td class="noWrapCell center">${atrMtcList.BBC_TAG_A1}</td>
						<td class="noWrapCell center" ${myTaga }><div style="line-height:0.26rem;"><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A1});">${atrMtcList.MBR_NM_A1}</div><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A2});">${atrMtcList.MBR_NM_A2}</div></div></td>
						<td class="noWrapCell center">${atrMtcList.A_TEM_SCR}:${atrMtcList.B_TEM_SCR}</td>
						<td class="noWrapCell center" ${myTagb }><div style="line-height:0.26rem;"><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B1});">${atrMtcList.MBR_NM_B1}</div><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B2});">${atrMtcList.MBR_NM_B2}</div></td>
						<td class="noWrapCell center">${atrMtcList.BBC_TAG_B1}</td>
					</c:if>
					<c:if test="${atrMtcList.VTC_TEM_DV == 'B'}">
						<td class="noWrapCell center">${atrMtcList.BBC_TAG_B1}</td>
						<td class="noWrapCell center" ${myTagb }><div style="line-height:0.26rem;"><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B1});">${atrMtcList.MBR_NM_B1}</div><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B2});">${atrMtcList.MBR_NM_B2}</div></td>
						<td class="noWrapCell center">${atrMtcList.B_TEM_SCR}:${atrMtcList.A_TEM_SCR}</td>
						<td class="noWrapCell center" ${myTaga }><div style="line-height:0.26rem;"><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A1});">${atrMtcList.MBR_NM_A1}</div><div class="nameLabel" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A2});">${atrMtcList.MBR_NM_A2}</div></div></td>
						<td class="noWrapCell center">${atrMtcList.BBC_TAG_A1}</td>
					</c:if>
							
					<c:if test="${atrMtcList.REG_MBR_SQ == null || atrMtcList.REG_MBR_SQ == loginMbrSq || amsClb.CLB_GD == 'A' || amsClb.CLB_GD == 'B'}">
						<td class="center" onclick="window.location='gameView.htm?intClbsq=${amsClb.CLB_SQ}&intMtcsq=${atrMtcList.MTC_SQ}&datFrdt='+$('#datFrdt').val()+'&datTodt='+$('#datTodt').val();"><div class="nameLabel">${atrMtcList.REG_MBR_NM}</div><div class="name1"><img src="../img/modify-btn3.png" ></div></td>
					</c:if>
					<c:if test="${atrMtcList.REG_MBR_SQ != null && atrMtcList.REG_MBR_SQ != loginMbrSq && amsClb.CLB_GD != 'A' && amsClb.CLB_GD != 'B'}">
						<td class="center"><div class="nameLabel">${atrMtcList.REG_MBR_NM}</div></td>
					</c:if>
                </tr>
                
				</c:forEach>
         		</table>
         		<br>
         		<br>
         		<br>
        	</div>
        	
            
          </div>
        </div>
      </div>
      
    </div>

  </body>
  
		<script type="text/javascript">

			function search(intMbrsq) {
				window.location='gameTody.htm?intClbsq=${intClbsq}&intMbrsq='+intMbrsq+'&datFrdt='+$("#datFrdt").val()+"&datTodt="+$("#datTodt").val();
			}
			function gotoGameToday(intMbrsq) {
				window.location='gameTody.htm?intClbsq=${intClbsq}&intMbrsq='+intMbrsq+'&datFrdt='+$("#datFrdt").val()+"&datTodt="+$("#datTodt").val();
			}
			
		</script>	
</html>