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
		<title>${amsClb.CLB_NM}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.btn-h70{
				width:31%;
				height:0.68rem;
				line-height:0.7rem;
				padding:0rem 0.1rem;
				text-align:center;
			}
			.message-number{
			    background: #f54141;
			    height: 0.2rem;
			    width: 0.2rem;
			    border-radius: 50%;
			    text-align: center;
			    vertical-align: middle;
			    line-height: 0.2rem;
			    font-size: 0.17rem;
			    color: #fff;
			    position: absolute;
/* 			    overflow: hidden; */
/* 			    text-overflow: ellipsis; */
			    left: 1.89rem;
			    margin-top: -0.64rem;
			}
			
			.message-number2{
			    background: #f54141;
			    height: 0.2rem;
			    width: 0.2rem;
			    border-radius: 50%;
			    text-align: center;
			    vertical-align: middle;
			    line-height: 0.2rem;
			    font-size: 0.17rem;
			    color: #fff;
			    position: absolute;
/* 			    overflow: hidden; */
/* 			    text-overflow: ellipsis; */
			    left: 3.89rem;
			    margin-top: -0.64rem;
			}
		</style>
	</head>
	<body>
		<div class="head-information">
			<div class="module">
					<div class="list-110">
						<p  class="club-logo1 float" >
							<img src="${amsClb.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="word-title float" style="white-space:nowrap;overflow:ellipsis;" onclick="window.location='/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}';">
							${amsClb.CLB_NM}【<span>${amsClb.CLB_MBR_CNT}</span>人】
						</p>
						<div class="number-information float" style="padding-right: 0.2rem;right: 0;position: absolute;">
							<div class="number-name" >${amsClb.MBR_NM}</div> 
							<div class="number-level" >${amsClb.CLB_GD_NM}</div>
						</div>
					</div>
			</div>
			
			
			<!-- ---------------------- A 랭킹모드 ---------------------- -->
			<!-- ---------------------- A 랭킹모드 ---------------------- -->
			<!-- ---------------------- A 랭킹모드 ---------------------- -->
			<!-- ---------------------- A 랭킹모드 ---------------------- -->
			<c:if test="${amsClb.CLB_TYPE == 'A'}">
			
			<div class="modules">
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.双打}${label.比赛管理}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}');">${label.双打}${label.排名查询}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsClb.CLB_SQ}';">${label.每日比赛结果}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';">${label.输入比赛结果}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bbcBestAward.htm?intClbsq=${amsClb.CLB_SQ}');">베스트TOP5</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bestPartner.htm?intClbsq=${amsClb.CLB_SQ}');">${label.Best伙伴查询}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameTeam.htm?intClbsq=${amsClb.CLB_SQ}');">${label.伙伴比赛列表}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}');">월별현황</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gamePeriod.htm?intClbsq=${amsClb.CLB_SQ}');">${label.期间别比赛现况}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page8&intClbsq=${amsClb.CLB_SQ}');">경기점수판</button>
					</div>
				</div>
				<div class="" style="background:#fff;border-bottom:1px dashed #ddd;display:none;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" onclick="$('#singleLayout').toggle();">${label.单打}${label.比赛管理}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;display:none;" id="singleLayout">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}');">${label.单打}${label.排名查询}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameSingleList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.单打}${label.比赛列表}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameRegSingle.htm?intClbsq=${amsClb.CLB_SQ}');">${label.输入比赛结果}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gamePeriodSingle.htm?intClbsq=${amsClb.CLB_SQ}');">${label.期间别比赛现况}</button>
					</div>
				</div>
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.俱乐部管理}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.公告}${amsClb.NOTICE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会规管理}${amsClb.RULE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.俱乐部基准信息}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">회원조사</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page18&intClbsq=${amsClb.CLB_SQ}');">미니게임결과</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbExcReg.htm?intClbsq=${amsClb.CLB_SQ}');">${label.设定定期活动}</button>
						</c:if>
					</div>
				</div>
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.会员管理}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/clbMbrMonthly.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}&datFrdt=${amsClb.THISMONTH }');">나의월간현황</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('clbMbrCard.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.个人情况}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.个人信息修改}</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B' || amsClb.MBR_SQ == '679'}">
							<c:if test="${amsClb.CLB_SQ == 9 || amsClb.CLB_SQ == 59}">
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">정회원관리</button>
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">월회비명단</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?intClbsq=${amsClb.CLB_SQ}&pageName=page3');">회비관리</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">초심자시험</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">예절지수평가</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">시험평가결과</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会员管理}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page6&intClbsq=${amsClb.CLB_SQ}');">휴가관리</button>
						</c:if>
					</div>
				</div>
				<div class="" style="height:2rem;background:#fff;">
					&nbsp;
				</div>
			</div>			
			
			</c:if>
			
			
			<!-- ---------------------- C A,B,C,D Level 모드 ---------------------- -->
			<!-- ---------------------- C A,B,C,D Level 모드 ---------------------- -->
			<!-- ---------------------- C A,B,C,D Level 모드 ---------------------- -->
			<!-- ---------------------- C A,B,C,D Level 모드 ---------------------- -->
			<c:if test="${amsClb.CLB_TYPE == 'C'}">
				
				<c:if test="${amsClb.CLB_SQ != 11}">	<!--  일반 클럽 -->
				<div class="modules">
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.双打}${label.比赛管理}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">${label.排名查询}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsClb.CLB_SQ}';">${label.每日比赛结果}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gamePeriod.htm?intClbsq=${amsClb.CLB_SQ}');">${label.期间别比赛现况}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bestPartner.htm?intClbsq=${amsClb.CLB_SQ}');">${label.Best伙伴查询}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameTeam.htm?intClbsq=${amsClb.CLB_SQ}');">${label.伙伴比赛列表}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';">${label.输入比赛结果}</button>
						</div>
					</div>
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.俱乐部管理}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.公告}${amsClb.NOTICE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会规管理}${amsClb.RULE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.俱乐部基准信息}</button>
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbExcReg.htm?intClbsq=${amsClb.CLB_SQ}');">${label.设定定期活动}</button>
							</c:if>
	<%-- 						<c:if test="${amsClb.CLB_SQ == 9}"> --%>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
	<%-- 						</c:if> --%>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bbcBestAward.htm?intClbsq=${amsClb.CLB_SQ}');">베스트TOP5</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page18&intClbsq=${amsClb.CLB_SQ}');">미니게임결과</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/gamePointInput2.html');">점수판</button>
						</div>
					</div>
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.会员管理}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/clbMbrMonthly.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}&datFrdt=${amsClb.THISMONTH }');">나의월간현황</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('clbMbrCard.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.个人情况}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.个人信息修改}</button>
						</div>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会员管理}</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">초심자시험</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">예절지수평가</button>
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">시험평가결과</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">회원조사</button>
							
						</div>
					</div>
					<div class="" style="height:2rem;background:#fff;">
						&nbsp;
					</div>
				</div>			
				</c:if>			
			
				<c:if test="${amsClb.CLB_SQ == 11}">	<!--  연합회 -->
				<div class="modules">
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >연합회관리</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.公告}${amsClb.NOTICE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会规管理}${amsClb.RULE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.俱乐部基准信息}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/badMatch/gamePointInput.html');">점수판(자동)</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/badMatch/gamePointInput2.html');">점수판(세로)</button>
						</div>
					</div>
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.会员管理}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">개인별 급수조회</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.个人信息修改}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">회원조사</button>
						</div>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会员管理}</button>
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem border:solid 1px #01cfb9;"" onclick="windowlocation('/front/bbc/badMatch/getPage.htm?pageName=page25');">엑셀다운로드</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">초심자시험</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">예절지수평가</button>
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">시험평가결과</button>
							</c:if>
							
						</div>
					</div>
					<div class="" style="height:2rem;background:#fff;">
						&nbsp;
					</div>
				</div>			
				</c:if>			
			
			</c:if>
			
			
			
			<!-- ---------------------- D 클럽 관리모드 ---------------------- -->
			<!-- ---------------------- D 클럽 관리모드 ---------------------- -->
			<!-- ---------------------- D 클럽 관리모드 ---------------------- -->
			<!-- ---------------------- A 클럽 관리모드 ---------------------- -->
			<c:if test="${amsClb.CLB_TYPE == 'D'}">
			

			<div class="modules">
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.俱乐部管理}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.公告}${amsClb.NOTICE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会规管理}${amsClb.RULE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.俱乐部基准信息}</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbExcReg.htm?intClbsq=${amsClb.CLB_SQ}');">${label.设定定期活动}</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/web/publish/mobile/product/communityList.htm?displayId=1');">${label.商户社区}</button>
					</div>
				</div>
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.会员管理}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/clbMbrMonthly.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}&datFrdt=${amsClb.THISMONTH }');">나의월간현황</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.会员管理}</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.个人信息修改}</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?intClbsq=${amsClb.CLB_SQ}&pageName=page3');">회비관리</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">회원조사</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/gamePointInput2.html');">점수판</button>
						
					</div>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">초심자시험</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">예절지수평가</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">시험평가결과</button>
						</c:if>
						
					</div>
				</div>
				<div class="" style="height:2rem;background:#fff;">
					&nbsp;
				</div>
			</div>			
			
			</c:if>
			
			
		</div>
		
	
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
		if ("${amsClb.CLB_SQ}" == "") {
			window.location = "/front/bbc/clb/clbDet.htm?intClbsq=${intClbsq}";
		}
	
		function windowlocation(url) {
			if ("${amsClb.CLB_GD}" == "X") {
				alert("${label.没有权限}.");
				return;
			}
			window.location = url;
		}
		
		$(function(){ 
			  wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
				    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
				    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
				    signature: "${signInfo.signature }",// 必填，签名，见附录1
				    jsApiList: [//分享接口
				       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
				        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
				                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});  
			  
			  	wx.ready(function(){
			  		
			  		wx.onMenuShareTimeline({
			  		    title: '${amsClb.CLB_NM} ${label.加入}', // 分享标题
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${amsClb.CLB_NM}', // 分享标题
			  		    desc: '${label.加入}', // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		       // alert('success 11');
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    	// alert('error 11');
			  		    }
			  		});
				});
			  	
			  	
			  	wx.error(function(res){
			  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		
			  	});
			  
		});
	</script>

			<!-- START bottom menu -->
			<c:set var="menuTag" value="2" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			
		<c:set var="helpTag" value="65" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="가입된 클럽 메인 화면 입니다.<br><br>복식,단식 경기에 대한 경기기록 등록, 현황보기, 랭킹보기 및<br><br>클럽회원관리, 공지사항등록, 정규운동 자동 생성 설정등의 기능이 있습니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="已被加入的主页画面。<br><br>双打,单打，比赛登录，查看现况,排名，会员管理，公告登录，设定定期运动自动创造等可以操作这些功能。" />
		</c:if>
		
		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 
	

	</body>
</html>