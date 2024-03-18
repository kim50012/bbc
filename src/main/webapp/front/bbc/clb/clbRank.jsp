<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>${label.双打}${label.排名查询}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
	</head>
	<style type="text/css">
				.month input{
					width:3.7rem;
					height:0.4rem;
					padding:0 0.2rem;
					border:1px solid #d2d2d2;
					font-size:0.2rem;
					border-radius:0.04rem;
					color:#aaa;
				}
				.cell-1{
					width:0.7rem; 
				}
				.cell-2{
					width:1rem; 
				}
				.cell-3{
					width:1rem; 
				}
				.cell-4 {
					width:0.94rem; 
				}
				.cell-5{
					width:1.1rem; 
				}
				.cell-6 {
					width:1.17rem; 
				}
				.cell-7 {
					width:1.17rem; 
				}
	</style>
	<body>
			<div class="content">
				<div class="fixed" style="top: 0;">
					<div class="module">
						<div class="list-110">
							<p  class="club-logo1 float" >
								<img src="${amsClb.CLB_MAI_IMG_PTH}"/>
							</p>
							<p class="word-title float" style="white-space:nowrap;overflow:ellipsis;" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClb.CLB_SQ}';">
								${amsClb.CLB_NM}【<span>${amsClb.CLB_MBR_CNT}</span>人】
							</p>
							<div class="number-information float" style="padding-right: 0.2rem;right: 0;position: absolute;">
								<div class="number-name" >${amsClb.MBR_NM}</div> 
								<div class="number-level" >${amsClb.CLB_GD_NM}</div>
							</div>
						</div>
						
						<div class="list68 flex">
							<p class="flex1 switch-btn switch-btn1 active"><span>${label.排名查询}</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn2"><span>전체조별</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn3"><span>남자조별</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn4"><span>여자조별</span></p>
<%-- 							<c:if test="${amsClb.CLB_GD == 'A' or amsClb.CLB_GD == 'B'}"> --%>
<%-- 							</c:if> --%>
						</div>
						
					</div>
				</div>
					
				
				
				
				<div class="modules" id="rankA" style="padding-top:1rem;">
					<div class="flex" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
							<p class="flex1 title-icon">${label.双打}${label.排名查询}</p>
					</div>
					<div class="module list-head">
						<ul class="flex">
							<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">${label.排序}</li>
							<li class="flex2 cell-2 cell">${label.姓名}</li>
							<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=GAME_CNT';">${label.比赛数}</li>
							<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
							<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=WIN_RATE';">${label.胜率}</li>
							<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">BB Coin</li>
							<li class="flex2 cell-7 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=LASTDAY_BBC';">${label.对比前天}</li>
						</ul>
					</div>
					<div class="module" style="border:none;background:#fff;padding-bottom:0.6rem;">
					
						<c:set var="abc" value="1" />
						
						<!-- START Data Loop -->
						<c:forEach var="amsMbrRankList" items="${amsMbrRankList}" varStatus="status">  
							
							<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
								<c:set var="abc" value="${abc+1}" />
							</c:if>
									
							<c:if test="${status.count%10 == abc and status.count > 10}">
							<div class="module list-head">
								<ul class="flex">
									<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">${label.排序}</li>
									<li class="flex2 cell-2 cell">${label.姓名}</li>
									<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=GAME_CNT';">${label.比赛数}</li>
									<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
									<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=WIN_RATE';">${label.胜率}</li>
									<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">BB Coin</li>
									<li class="flex2 cell-7 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=LASTDAY_BBC';">${label.对比前天}</li>
								</ul>
							</div>
							</c:if>
							
							
							
							<!-- 랭크 -->
							<ul class="flex list78 ul-list word">
								<li class="flex2 cell-1 cell">
									
									<c:if test="${amsMbrRankList.CLB_GD == 'A' or amsMbrRankList.CLB_GD == 'B' or amsMbrRankList.CLB_GD == 'C'}">
										${amsMbrRankList.CLB_RANK} ${amsMbrRankList.RANK_TREND_TAG}
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<img src="/front/bbc/image/c.jpg" style="height: 0.5rem;margin-left: -0.2rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'F'}">
										<c:if test="${amsMbrRankList.WIN_RATE >= 50}">
											<img src="/front/bbc/image/f.jpg" style="height: 0.5rem;margin-left: -0.1rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
										</c:if>
										<c:if test="${amsMbrRankList.WIN_RATE < 50}">
											<img src="/front/bbc/image/e.jpg" style="height: 0.5rem;margin-left: -0.1rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
										</c:if>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD != 'A' and amsMbrRankList.CLB_GD != 'B' and amsMbrRankList.CLB_GD != 'C' and amsMbrRankList.CLB_GD != 'E' and amsMbrRankList.CLB_GD != 'F'}">
										<img src="/front/bbc/image/g.jpg" style="height: 0.5rem;margin-left: -0.2rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
								</li>
								<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}';">${amsMbrRankList.CLB_NIK_NM}</li>
								<c:if test="${amsMbrRankList.CLB_GD == 'E' || amsMbrRankList.CLB_GD == 'F'}">
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<li class="flex2 cell-3 cell">-</li>
										<li class="flex2 cell-4 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
								</c:if>
								<c:if test="${amsMbrRankList.CLB_GD != 'E' && amsMbrRankList.CLB_GD != 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
									<li class="flex2 cell-5 cell">${amsMbrRankList.CLB_BBC}</li>
								</c:if>
								<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}&strOrderby=&datFrdt=${amsMbrRankList.LASTDAY}&datTodt=${amsMbrRankList.LASTDAY}';">${amsMbrRankList.LASTDAY_BBC_TAG}</li>
							</ul>
						
						 </c:forEach>
						<!-- END Data Loop -->
						
					</div>
				</div>		

				<div class="modules" id="rankB" style="padding-top:1rem;display:none;">
					<div class="flex" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
							<p class="flex1 title-icon">${label.双打}${label.排名查询}</p>
					</div>
					<div class="module" style="border:none;background:#fff;padding-bottom:0.6rem;">
					
						<c:set var="lvl" value="" />
						
						<!-- START Data Loop -->
						<c:forEach var="amsMbrRankList" items="${amsMbrRankListA}" varStatus="status">  
							
							<c:if test="${lvl != amsMbrRankList.CLB_LEVEL}">
							<div class="module list-head">
								<ul class="flex">
									<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">${label.排序}</li>
									<li class="flex2 cell-2 cell">${label.姓名}</li>
									<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=GAME_CNT';">${label.比赛数}</li>
									<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
									<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=WIN_RATE';">${label.胜率}</li>
									<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">BB Coin</li>
									<li class="flex2 cell-7 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=LASTDAY_BBC';">${label.对比前天}</li>
								</ul>
							</div>
							</c:if>
							
							<c:set var="lvl" value="${amsMbrRankList.CLB_LEVEL}" />
							
							<!-- 랭크 -->
							<ul class="flex list78 ul-list word">
								<li class="flex2 cell-1 cell">
									<c:if test="${amsMbrRankList.CLB_GD == 'A' or amsMbrRankList.CLB_GD == 'B' or amsMbrRankList.CLB_GD == 'C' or amsMbrRankList.CLB_GD == 'F'}">
										<c:choose>
										    <c:when test="${amsMbrRankList.CLB_LEVEL eq 'A'}">
										        <img src="/front/bbc/image/A.png" style="height: 0.4rem;margin-left: -0.1rem;padding-top: 0.15rem;margin-right:0;width: 0.4rem;">
										    </c:when>
										    <c:otherwise>
										        ${amsMbrRankList.CLB_LEVEL}
										    </c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<img src="/front/bbc/image/c.jpg" style="height: 0.5rem;margin-left: -0.1rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD != 'A' and amsMbrRankList.CLB_GD != 'B' and amsMbrRankList.CLB_GD != 'C' and amsMbrRankList.CLB_GD != 'E' and amsMbrRankList.CLB_GD != 'F'}">
										<img src="/front/bbc/image/g.jpg" style="height: 0.5rem;margin-left: -0.2rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
								</li>
								<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}';">${amsMbrRankList.CLB_NIK_NM}</li>
								<c:if test="${amsMbrRankList.CLB_GD == 'E' || amsMbrRankList.CLB_GD == 'F'}">
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<li class="flex2 cell-3 cell">-</li>
										<li class="flex2 cell-4 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
								</c:if>
								<c:if test="${amsMbrRankList.CLB_GD != 'E' && amsMbrRankList.CLB_GD != 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
									<li class="flex2 cell-5 cell">${amsMbrRankList.CLB_BBC}</li>
								</c:if>
								<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}&strOrderby=&datFrdt=${amsMbrRankList.LASTDAY}&datTodt=${amsMbrRankList.LASTDAY}';">${amsMbrRankList.LASTDAY_BBC_TAG}</li>
							</ul>
						
						 </c:forEach>
						<!-- END Data Loop -->
						
					</div>
				</div>			
				
				
				
				<div class="modules" id="rankC" style="padding-top:1rem;display:none;">
					<div class="flex" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
							<p class="flex1 title-icon">${label.双打}${label.排名查询}</p>
					</div>
					<div class="module" style="border:none;background:#fff;padding-bottom:0.6rem;">
					
						<c:set var="lvl" value="" />
						
						<!-- START Data Loop -->
						<c:forEach var="amsMbrRankList" items="${amsMbrRankListM}" varStatus="status">  
							
							<c:if test="${lvl != amsMbrRankList.CLB_LEVEL}">
							<div class="module list-head">
								<ul class="flex">
									<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">${label.排序}</li>
									<li class="flex2 cell-2 cell">${label.姓名}</li>
									<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=GAME_CNT';">${label.比赛数}</li>
									<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
									<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=WIN_RATE';">${label.胜率}</li>
									<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">BB Coin</li>
									<li class="flex2 cell-7 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=LASTDAY_BBC';">${label.对比前天}</li>
								</ul>
							</div>
							</c:if>
							
							<c:set var="lvl" value="${amsMbrRankList.CLB_LEVEL}" />
							
							<!-- 랭크 -->
							<ul class="flex list78 ul-list word">
								<li class="flex2 cell-1 cell">
									<c:if test="${amsMbrRankList.CLB_GD == 'A' or amsMbrRankList.CLB_GD == 'B' or amsMbrRankList.CLB_GD == 'C' or amsMbrRankList.CLB_GD == 'F'}">
										<c:choose>
										    <c:when test="${amsMbrRankList.CLB_LEVEL eq 'A'}">
										        <img src="/front/bbc/image/A.png" style="height: 0.4rem;margin-left: -0.1rem;padding-top: 0.15rem;margin-right:0;width: 0.4rem;">
										    </c:when>
										    <c:otherwise>
										        ${amsMbrRankList.CLB_LEVEL}
										    </c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<img src="/front/bbc/image/c.jpg" style="height: 0.5rem;margin-left: -0.2rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD != 'A' and amsMbrRankList.CLB_GD != 'B' and amsMbrRankList.CLB_GD != 'C' and amsMbrRankList.CLB_GD != 'E' and amsMbrRankList.CLB_GD != 'F'}">
										<img src="/front/bbc/image/g.jpg" style="height: 0.5rem;margin-left: -0.2rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
								</li>
								<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}';">${amsMbrRankList.CLB_NIK_NM}</li>
								<c:if test="${amsMbrRankList.CLB_GD == 'E' || amsMbrRankList.CLB_GD == 'F'}">
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<li class="flex2 cell-3 cell">-</li>
										<li class="flex2 cell-4 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
								</c:if>
								<c:if test="${amsMbrRankList.CLB_GD != 'E' && amsMbrRankList.CLB_GD != 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
									<li class="flex2 cell-5 cell">${amsMbrRankList.CLB_BBC}</li>
								</c:if>
								<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}&strOrderby=&datFrdt=${amsMbrRankList.LASTDAY}&datTodt=${amsMbrRankList.LASTDAY}';">${amsMbrRankList.LASTDAY_BBC_TAG}</li>
							</ul>
						
						 </c:forEach>
						<!-- END Data Loop -->
						
					</div>
				</div>			
				
				
				
				<div class="modules" id="rankD" style="padding-top:1rem;display:none;">
					<div class="flex" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
							<p class="flex1 title-icon">${label.双打}${label.排名查询}</p>
					</div>
					<div class="module" style="border:none;background:#fff;padding-bottom:0.6rem;">
					
						<c:set var="lvl" value="" />
						
						<!-- START Data Loop -->
						<c:forEach var="amsMbrRankList" items="${amsMbrRankListW}" varStatus="status">  
							
							<c:if test="${lvl != amsMbrRankList.CLB_LEVEL}">
							<div class="module list-head">
								<ul class="flex">
									<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">${label.排序}</li>
									<li class="flex2 cell-2 cell">${label.姓名}</li>
									<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=GAME_CNT';">${label.比赛数}</li>
									<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
									<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=WIN_RATE';">${label.胜率}</li>
									<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">BB Coin</li>
									<li class="flex2 cell-7 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=LASTDAY_BBC';">${label.对比前天}</li>
								</ul>
							</div>
							</c:if>
							
							<c:set var="lvl" value="${amsMbrRankList.CLB_LEVEL}" />
							
							<!-- 랭크 -->
							<ul class="flex list78 ul-list word">

								<li class="flex2 cell-1 cell">
									<c:if test="${amsMbrRankList.CLB_GD == 'A' or amsMbrRankList.CLB_GD == 'B' or amsMbrRankList.CLB_GD == 'C' or amsMbrRankList.CLB_GD == 'F'}">
										<c:choose>
										    <c:when test="${amsMbrRankList.CLB_LEVEL eq 'A'}">
										        <img src="/front/bbc/image/A.png" style="height: 0.4rem;margin-left: -0.1rem;padding-top: 0.15rem;margin-right:0;width: 0.4rem;">
										    </c:when>
										    <c:otherwise>
										        ${amsMbrRankList.CLB_LEVEL}
										    </c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<img src="/front/bbc/image/c.jpg" style="height: 0.5rem;margin-left: -0.2rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD != 'A' and amsMbrRankList.CLB_GD != 'B' and amsMbrRankList.CLB_GD != 'C' and amsMbrRankList.CLB_GD != 'E' and amsMbrRankList.CLB_GD != 'F'}">
										<img src="/front/bbc/image/g.jpg" style="height: 0.5rem;margin-left: -0.2rem;padding-top: 0.1rem;margin-right:0;width: 0.5rem;">
									</c:if>
								</li>
								<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}';">${amsMbrRankList.CLB_NIK_NM}</li>
								<c:if test="${amsMbrRankList.CLB_GD == 'E' || amsMbrRankList.CLB_GD == 'F'}">
									<c:if test="${amsMbrRankList.CLB_GD == 'E'}">
										<li class="flex2 cell-3 cell">-</li>
										<li class="flex2 cell-4 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
									<c:if test="${amsMbrRankList.CLB_GD == 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
										<li class="flex2 cell-5 cell">-</li>
									</c:if>
								</c:if>
								<c:if test="${amsMbrRankList.CLB_GD != 'E' && amsMbrRankList.CLB_GD != 'F'}">
								<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
								<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
								<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
									<li class="flex2 cell-5 cell">${amsMbrRankList.CLB_BBC}</li>
								</c:if>
								<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}&strOrderby=&datFrdt=${amsMbrRankList.LASTDAY}&datTodt=${amsMbrRankList.LASTDAY}';">${amsMbrRankList.LASTDAY_BBC_TAG}</li>
							</ul>
						
						 </c:forEach>
						<!-- END Data Loop -->
						
					</div>
				</div>				
				
			</div>

		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		
		<c:set var="helpTag" value="15" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="BB Coin 으로 A,B,C,D,E 조가 정해집니다.<br>BB Coin 기준은 아래를 참고하세요.<br>매월 1일 해당 점수 기준으로 등급(조)이 업데이트 됩니다.<br><br>※ 조별 랭킹 기준<br>● 남자<br>A : 800이상<br>B : 600~799<br>C : 400~599<br>D : 200~399<br>E : 100~199<br><br>● 여자<br>A : 600이상<br>B : 450~599<br>C : 300~449<br>D : 200~299<br>E : 100~199" />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是查看双打的排名。<br><br>可以用BB COIN来定排名，这BB COIN是比赛结束后可以获得了。<br>并且BB COIN是自己和自己的比赛伙伴及对方选手的BB COIN来算定不利条件。<br>不管比赛赢和输可以获得了BB COIN。<br><br>Ex)21:25 虽然输了比赛根据情况可以获得BB COIN。<br>我们队BB COIN的合算是比对方的合算价大的话，比赛赢的话不会减分儿，如果输的话减分儿会更多。" />
		</c:if>
		
		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		


		<script type="text/javascript">
		$(document).ready(function(){
				$(".switch-btn").on("click",function(){
					$(".switch-btn").removeClass("active");
					$(this).addClass("active");
					if($(this).attr("class").indexOf("switch-btn1") >= 0){
						$("#rankA").show();
						$("#rankB").hide();
						$("#rankC").hide();
						$("#rankD").hide();
					}
					else if($(this).attr("class").indexOf("switch-btn2") >= 0){
						$("#rankA").hide();
						$("#rankB").show();
						$("#rankC").hide();
						$("#rankD").hide();
					}
					else if($(this).attr("class").indexOf("switch-btn3") >= 0){
						$("#rankA").hide();
						$("#rankB").hide();
						$("#rankC").show();
						$("#rankD").hide();
					}
					else if($(this).attr("class").indexOf("switch-btn4") >= 0){
						$("#rankA").hide();
						$("#rankB").hide();
						$("#rankC").hide();
						$("#rankD").show();
					}
			});
		});
		</script>		
		
		
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
		
	</body>
</html>