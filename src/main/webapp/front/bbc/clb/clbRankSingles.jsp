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
		<title>${label.单打}${label.排名查询}</title>
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
						<p class="flex1 title-icon">${label.单打}${label.排名查询}</p>
						<button class="add-btn" onclick="window.location='/front/bbc/clb/gameRegSingle.htm?intClbsq=${amsClb.CLB_SQ}';"></button>
				</div>
				<div class="module list-head">
					<ul class="flex">
						<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">${label.排序}</li>
						<li class="flex2 cell-2 cell">${label.姓名}</li>
						<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=GAME_CNT';">${label.比赛数}</li>
						<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
						<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=WIN_RATE';">${label.胜率}</li>
						<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">BB Coin</li>
<%-- 						<li class="flex2 cell-7 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=LASTDAY_BBC';">${label.对比前天}</li> --%>
					</ul>
				</div>
				<div class="module" style="border:none;background:#fff;padding-bottom:0.6rem;">
				
					<!-- START Data Loop -->
					<c:forEach var="amsMbrRankList" items="${amsMbrRankList}" varStatus="status">  
				

						<c:if test="${status.count%10 == 1 and status.count > 1}">
						<div class="module list-head">
							<ul class="flex">
								<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">${label.排序}</li>
								<li class="flex2 cell-2 cell">${label.姓名}</li>
								<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=GAME_CNT';">${label.比赛数}</li>
								<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
								<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=WIN_RATE';">${label.胜率}</li>
								<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=CLB_RANK';">BB Coin</li>
		<%-- 						<li class="flex2 cell-7 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}&strOrderby=LASTDAY_BBC';">${label.对比前天}</li> --%>
							</ul>
						</div>
						</c:if>
										
						
						<!-- 랭크 -->
						<ul class="flex list78 ul-list word">
							<li class="flex2 cell-1 cell">${amsMbrRankList.CLB_SINGLES_RANK}</li>
<%-- 							<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}';">${amsMbrRankList.CLB_NIK_NM}</li> --%>
							<li class="flex2 cell-2 cell">${amsMbrRankList.CLB_NIK_NM}</li>
							<li class="flex2 cell-3 cell">${amsMbrRankList.GAME_CNT}</li>
							<li class="flex2 cell-4 cell">${amsMbrRankList.WIN}/${amsMbrRankList.LOSE}</li>
							<li class="flex2 cell-5 cell">${amsMbrRankList.WIN_RATE}%</li>
							<li class="flex2 cell-5 cell">${amsMbrRankList.CLB_BBC}</li>
<%-- 							<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsMbrRankList.CLB_SQ}&intMbrsq=${amsMbrRankList.MBR_SQ}&strOrderby=&datFrdt=${amsMbrRankList.LASTDAY}&datTodt=${amsMbrRankList.LASTDAY}';">${amsMbrRankList.LASTDAY_BBC_TAG}</li> --%>
						</ul>
					
					 </c:forEach>
					<!-- END Data Loop -->
					
				</div>
			</div>
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		
		<c:set var="helpTag" value="15" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="단식 경기의 순위(랭킹)을 조회하는 화면입니다.<BR><BR>단식은 자신을 기준으로 상위 2단계 하위 2단계의 상대와 경기를 하였을 경우에만 순위에 반영되며 그 이외 경기는 순위와 상관없이 경기 기록에만 등록됩니다.<BR><BR>경기 기록이 없는 사람과의 랭킹은 복식의 BB COIN 기준으로 정해집니다.<BR><BR>예) 자신이 4위인 경우 2~6위와의 경기만 순위에 반영되며 승/패 순위가 서로 바뀝니다. 4위가 6위에게 패했을 경우 바로 6위로 강등됩니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是查看单打的排名。<br><br>单打的话,以自己为基准，只能在排名前第二段和后二段的对手比赛时生效。<br><br>其余的比赛不管排什么名只能记录比赛结果。<br><br>排名是以双打的BB COIN为基准。" />
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