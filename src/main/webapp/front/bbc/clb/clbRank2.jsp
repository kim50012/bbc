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
			<div class="module" >
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
			</div>
			<div class="modules" >
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
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		
		<c:set var="helpTag" value="15" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="복식 경기의 순위(랭킹)을 조회하는 화면입니다.<BR><BR>복식경기의 랭킹은 자신의 BB COIN으로 정해지며, 이 BB COIN은 복식 경기 진행시 결과에 따라 획득이 가능합니다.<BR><BR>그리고 자신과 파트너의 BB COIN과 상대편의 BB COIN을 기준으로 핸디가 부여됩니다. 또한 승패와 상관없이 BB COIN 을 획득 할 수 있습니다.<BR><BR>예) 21:25 로 경기에 졌지만 경우에 따라 BB COIN 획득이 가능합니다. 또한 우리팀의 BB COIN 합이 상대편 BB COIN 합보다 클 경우 경기 승리시 BB COIN 감점은 되지 않지만 이런 상황에서 패할 경우 보다 많은 BB COIN 이 차감될 수 있습니다." />
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
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
		
	</body>
</html>