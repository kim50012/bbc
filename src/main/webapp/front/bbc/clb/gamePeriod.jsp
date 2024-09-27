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
		<title>${label.期间别比赛现况}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery-weui.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
				.month input{
					width:1.4rem;
					height:0.4rem;
					padding:0 0.2rem;
					border:1px solid #d2d2d2;
					font-size:0.2rem;
					border-radius:0.04rem;
					color:#aaa;
				}
				.cell-1{
					width:0.5rem; 
				}
				.cell-2{
					width:1rem; 
				}
				.cell-3{
					width:0.97rem; 
				}
				.cell-4 {
					width:0.74rem; 
				}
				.cell-5{
					width:0.7rem; 
				}
				.cell-6 {
					width:1rem; 
				}
				.cell-7 {
					width:0.5rem; 
				}
				.cell-8 {
					width:0.7rem; 
				}
				.single{
					width:0.69rem;
					
				}
				.btn-borders{
					margin-top: 0.18rem;
				}
				.screen{
					position: absolute;
				    width: 0.9rem;
				    right: 0;
				    font-size:0.22rem;
				    top: 0.65rem;
				}
				.r_pg_top {
					display: none;
				}
		</style>
	</head>
	<body>
		<div class="content">
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
			<div class="modules" style>
				<div class="" style="height:0.7rem;width:100%;border-bottom:1px solid #ddd;">
					<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
						<div class="flex">
							<p class="flex1 title-icon">${label.期间别比赛现况}</p>
							<button class="add-btn" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';"></button>
						</div>
					</div>
				</div>
				
				<div class="" style="height:0.7rem;width:100%;">
					<div class="month float" style="width:2rem;height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
						<input type="text" style="" name="datFrdt" id="datFrdt" value="${datFrdt }" placeholder="选择日期">
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">~</div>
					<div class="month float" style="width:2rem;height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
						<input type="text" style="" name="datTodt" id="datTodt" value="${datTodt }" placeholder="选择日期">
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;padding-right:0;">
						<button class="btn-borders float1" onclick="search('');" style="width:1rem;vertical-align:middle;background:#01cfb9;color:#fff;">${label.查询}</button>
					</div>
				</div>
			</div>
			<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-7 cell">팀</li>
					<li class="flex2 cell-3 cell" style="text-decoration:underline;" onclick="search('GAME_CNT');">${label.比赛数}</li>
					<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
					<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="search('WIN_RATE');">${label.胜率}</li>
					<li class="flex2 cell-8 cell">득실</li>
					<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="search('BBC');">BBCoin</li>
				</ul>
			</div>
			<div class="module" style="border-top:none;background:#fff;">
				
				<!-- START Data Loop -->
				<c:forEach var="atrMtcList" items="${atrMtcList}" varStatus="status">  
						
				<ul class="flex list78 ul-list word">
					<li class="flex2 cell-1 cell">${status.count}</li>
					<li class="flex2 cell-2 cell">${atrMtcList.CLB_NIK_NM}</li>
					<li class="flex2 cell-7 cell">${atrMtcList.TEAM_NM_L}</li>
					<li class="flex2 cell-3 cell">${atrMtcList.GAME_CNT}</li>
					<li class="flex2 cell-4 cell">${atrMtcList.WIN}/${atrMtcList.LOSE}</li>
					<li class="flex2 cell-5 cell">${atrMtcList.WIN_RATE}%</li>
					<li class="flex2 cell-8 cell">${atrMtcList.SCR_MBR}</li>
					<li class="flex2 cell-6 cell" onclick="searchToday('${atrMtcList.MBR_SQ}');">${atrMtcList.LASTDAY_BBC_TAG}</li>
				</ul>
				
				 </c:forEach>
				<!-- END Data Loop -->
					
				
<!-- 				<ul class="flex list90 ul-list" style="border-bottom:none;padding-bottom:0.6rem;"> -->
<!-- 					<div class="button flex2"> -->
<!-- 						<button class="btn-stop">上一页</button> -->
<!-- 						<button class="btn-stop">下一页</button> -->
<!-- 					</div> -->
<!-- 				</ul> -->
			</div>
		</div>
			<script type="text/javascript">
			$(document).ready(function(){
				$(".down").click(function(){
					$(".screen").toggle();
				});
				$(".single").click(function(){
					$(".down").html($(this).html());
					$(".screen").hide();
				});
			});
			function search(strOrderby) {
				window.location='gamePeriod.htm?intClbsq=${intClbsq}&strOrderby='+strOrderby+'&datFrdt='+$("#datFrdt").val()+"&datTodt="+$("#datTodt").val();
			}
			function searchToday(intMbrsq) {
				window.location='gameTody.htm?intClbsq=${intClbsq}&intMbrsq='+intMbrsq+'&datFrdt='+$("#datFrdt").val()+"&datTodt="+$("#datTodt").val();
			}
     		$(function(){
     		 	$("#datFrdt").calendar({
			        onChange: function (p, values, displayValues) {
	
			          $("#datFrdt").siblings("p").hide()
			        }
		      	});
     		 	$("#datTodt").calendar({
			        onChange: function (p, values, displayValues) {
	
			          $("#datTodt").siblings("p").hide()
			        }
		      	});
			});
		</script>		
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		
		<c:set var="helpTag" value="15" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="당일, 기간별 경기 결과를 조회하는 화면입니다.<BR><BR>※ 특정 기간동안 자신, 혹은 다른 회원의 결과를 조회하며 BB COIN의 증감으로 실력 성장을 가늠해볼 수 있습니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是当天，期间别查看比赛的结果。<br><br>※可以查看自己或者其他人的成长速度。" />
		</c:if>
		
<%-- 		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 		 --%>
		

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
<%-- 		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	 --%>
				
		
	</body>
</html>