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
		<title>${label.每日比赛结果}</title>
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
					width:0.8rem; 
				}
				.cell-2{
					width:0.9rem; 
				}
				.cell-3{
					width:1.1rem; 
				}
				.cell-4 {
					width:1.1rem; 
				}
				.cell-5{
					width:0.9rem; 
				}
				.cell-6 {
					width:1rem; 
				}
				.cell-7 {
					width:0.8rem; 
				}
			
				.cell-6 img{
					height:0.17rem;
					width:0.17rem;
					margin-left:0.06rem;
				}
				.single{
					width:0.86rem;
					
				}
				.btn-borders{
					margin-top: 0.18rem;
				}
				.screen{
					position: absolute;
				    width: 1.06rem;
				    right: 0;
				    font-size:0.22rem;
				    top: 0.65rem;
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
			<div class="modules" style="overflow-x: hidden;">
				<div class="" style="height:0.7rem;width:100%;border-bottom:1px solid #ddd;">
					<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
						<div class="flex">
							<p class="flex1 title-icon">${label.今日比赛列表}</p>
							<button class="add-btn" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';"></button>
						</div>
					</div>
				</div>
				

				<c:if test="${atrMtcMbrList != null}">
				<div class="modules" style="margin-top:0;">
					
					<div class="sub-content1 h164 flex">
						<div class="flex flex1">
							<div class="member-head-big-wrap"><img class="member-head-big" src="${atrMtcMbrList.MBR_MAI_IMG_PTH}"/></div>
							<div class="flex1" style="padding-top:0.45rem;">
								<h3 class="list">${atrMtcMbrList.CLB_NIK_NM}</h3>
								<p class="small row1">${label.总}<strong class="number yellow">${atrMtcMbrList.GAME_CNT}</strong>${label.战}<strong class="number yellow">${atrMtcMbrList.WIN}</strong>${label.胜}<strong class="number yellow">${atrMtcMbrList.LOSE}</strong>${label.负}</p>
							</div>
						</div>
						<div class="right-part flex left-dashed"  style="padding-top:0.45rem;">
							<div class="flex1">
								<p class="lh20 cen">${label.胜率}</p>
								<p class="lh20 cen red">${atrMtcMbrList.WIN_RATE}%</p>
							</div>
							<div class="flex1">
								<p class="lh20 cen">BB Coin</p>
								<p class="flex2 cell-6 cell" style="line-height: 2;font-weight:bold;">${atrMtcMbrList.LASTDAY_BBC_TAG}</p>
							</div>
						</div>
					</div>
				</div>		
				<div class="modules" style="margin-top:0;height:2px;">
				</div>
				</c:if>		
							
				
				<div class="" style="height:0.7rem;width:100%;border-bottom:1px solid #ddd;padding-left: 0.4rem;overflow:hidden;">
					<div class="month float" style="width:2rem;height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
						<input type="text" style="" name="datFrdt" id="datFrdt" value="${datFrdt }" placeholder="选择日期">
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">~</div>
					<div class="month float" style="width:2rem;height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
						<input type="text" style="" name="datTodt" id="datTodt" value="${datTodt }" placeholder="选择日期">
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;padding-right:0;">
						<button class="btn-borders float1" onclick="search('${intMbrsq}');" style="width:1rem;vertical-align:middle;background:#01cfb9;color:#fff;">${label.查询}</button>
					</div>
				</div>			
			
				<div class="" style="height:0.7rem;border-bottom:1px solid #ddd;padding-left: 0.4rem;overflow:hidden;">
					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;padding-right:0;">
						<button class="btn-borders float1" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}';" style="border: 1px solid #ea701a;width:1.3rem;vertical-align:middle;background:#ea701a;color:#fff;">복식랭킹</button>
					</div>
					<div class="float" >
						&nbsp;&nbsp;
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;padding-right:0;">
						<button class="btn-borders float1" onclick="search('');" style="width:2rem;vertical-align:middle;background:#01cfb9;color:#fff;">전체현황보기</button>
					</div>
					<div class="float" >
						&nbsp;&nbsp;
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;padding-right:0;">
						<button class="btn-borders float1" onclick="gotoGameToday('${loginMbrSq}');"  style="width:2rem;vertical-align:middle;background:#01cfb9;color:#fff;">나의현황보기</button>
					</div>
				</div>	
				
				<div class="switcharea-apply">
					<div class="module list-head" style="border-top:none;background:#fff;">
						<ul class="flex">
							<li class="flex3 cell-1 cell">${label.日期}</li>
							<li class="flex3 cell-2 cell">Coin</li>
							<li class="flex3 cell-3 cell">${label.胜队}</li>
							<li class="flex3 cell-7 cell"></li>
							<li class="flex3 cell-4 cell">${label.败队}</li>
							<li class="flex3 cell-5 cell">Coin</li>
							<li class="flex3 cell-6 cell">${label.注册}</li>
						</ul>
					</div>
					<div class="module" style="border:none;background:#fff;font-size:0.22rem;">
					
					<!-- START Data Loop -->
					<c:forEach var="atrMtcList" items="${atrMtcList}" varStatus="status">  
						
						<c:if test="${atrMtcList.A_TEM_SCR == 0 and atrMtcList.B_TEM_SCR == 0 and atrMtcList.EXC_SQ > 0}">
							
							<c:set var="backColor" value="background:#ebebeb;" />
							
							<c:if test="${atrMtcList.MOD_CORT_SEQ > 0}">
								<c:set var="backColor" value="background:#ffe7e7;" />
							</c:if>
							
							<ul class="flex" style="${backColor}">
								<li class="flex3 cell">코인 (${atrMtcList.A_BBC} vs ${atrMtcList.B_BBC})</li>
								<li class="flex3 cell">${atrMtcList.CORT} 코트, ${atrMtcList.CORT_SEQ} 경기</li>
							</ul>
						</c:if>
						
						<!-- 경기기록 -->
						<ul class="flex list110 ul-list word">
							<li class="flex3 cell-1 cell"><div style="line-height:0.26rem;"><span class="name1">[${status.count}]</span><br><span class="name1">${atrMtcList.MTC_MMDD}</span></div></li>
							
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
								
							<c:if test="${atrMtcList.VTC_TEM_DV == 'A'}">
								<li class="flex3 cell-2 cell">${atrMtcList.BBC_TAG_A1}</li>
								<li class="flex3 cell-3 cell" ${myTaga }><div style="line-height:0.26rem;"><div class="name1" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A1});">${atrMtcList.MBR_NM_A1}</div><div class="name1" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A2});">${atrMtcList.MBR_NM_A2}</div></div></li>
								<li class="flex3 cell-7 cell">${atrMtcList.A_TEM_SCR}:${atrMtcList.B_TEM_SCR}</li>
								<li class="flex3 cell-4 cell" ${myTagb }><div style="line-height:0.26rem;"><div class="name2" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B1});">${atrMtcList.MBR_NM_B1}</div><div class="name2" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B2});">${atrMtcList.MBR_NM_B2}</div></li>
								<li class="flex3 cell-5 cell">${atrMtcList.BBC_TAG_B1}</li>
							</c:if>
							<c:if test="${atrMtcList.VTC_TEM_DV == 'B'}">
								<li class="flex3 cell-2 cell">${atrMtcList.BBC_TAG_B1}</li>
								<li class="flex3 cell-3 cell" ${myTagb }><div style="line-height:0.26rem;"><div class="name1" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B1});">${atrMtcList.MBR_NM_B1}</div><div class="name1" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_B2});">${atrMtcList.MBR_NM_B2}</div></li>
								<li class="flex3 cell-7 cell">${atrMtcList.B_TEM_SCR}:${atrMtcList.A_TEM_SCR}</li>
								<li class="flex3 cell-4 cell" ${myTaga }><div style="line-height:0.26rem;"><div class="name2" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A1});">${atrMtcList.MBR_NM_A1}</div><div class="name2" style="text-decoration:underline;" onclick="gotoGameToday(${atrMtcList.MBR_SQ_A2});">${atrMtcList.MBR_NM_A2}</div></div></li>
								<li class="flex3 cell-5 cell">${atrMtcList.BBC_TAG_A1}</li>
							</c:if>
							<c:if test="${atrMtcList.REG_MBR_SQ == null || atrMtcList.REG_MBR_SQ == loginMbrSq || amsClb.CLB_GD == 'A' || amsClb.CLB_GD == 'B'}">
								<li class="flex3 cell-6 cell" onclick="window.location='gameView.htm?intClbsq=${amsClb.CLB_SQ}&intMtcsq=${atrMtcList.MTC_SQ}&datFrdt='+$('#datFrdt').val()+'&datTodt='+$('#datTodt').val();"><div class="name1">${atrMtcList.REG_MBR_NM}</div><div class="name1"><img src="../img/modify-btn3.png" ></div></li>
							</c:if>
							<c:if test="${atrMtcList.REG_MBR_SQ != null && atrMtcList.REG_MBR_SQ != loginMbrSq && amsClb.CLB_GD != 'A' && amsClb.CLB_GD != 'B'}">
								<li class="flex3 cell-6 cell"><div class="name1">${atrMtcList.REG_MBR_NM}</div></li>
							</c:if>
							
						</ul>
					
					 </c:forEach>
					<!-- END Data Loop -->
					<BR><BR><BR>
					</div>
				</div>
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
			function search(intMbrsq) {
				window.location='gameTody.htm?intClbsq=${intClbsq}&intMbrsq='+intMbrsq+'&datFrdt='+$("#datFrdt").val()+"&datTodt="+$("#datTodt").val();
			}
			function gotoGameToday(intMbrsq) {
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
			<c:set var="helpMsg" value="당일, 기간별 경기 결과를 조회하는 화면입니다.<BR><BR>이름을 클릭할 경우 해당 선수의 현황이 함께 조회됩니다.<BR><BR>※ 이 화면은 정규운동 혹은 번개운동 시 사용하기에 최적화 되어 있습니다.운동 참여시 자신의 현황을 모니터링하면서 해보세요 ^^" />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是当天，期间别查看比赛的结果。<br><br>如点击名字的话,相应选手的情况也会一起查到的。<br><br>※这画面是非常适于在定期运动或非定期运动。" />
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