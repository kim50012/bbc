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
							${amsClb.CLB_NM}???<span>${amsClb.CLB_MBR_CNT}</span>??????
						</p>
						<div class="number-information float" style="padding-right: 0.2rem;right: 0;position: absolute;">
							<div class="number-name" >${amsClb.MBR_NM}</div> 
							<div class="number-level" >${amsClb.CLB_GD_NM}</div>
						</div>
					</div>
			</div>
			
			
			<!-- ---------------------- A ???????????? ---------------------- -->
			<!-- ---------------------- A ???????????? ---------------------- -->
			<!-- ---------------------- A ???????????? ---------------------- -->
			<!-- ---------------------- A ???????????? ---------------------- -->
			<c:if test="${amsClb.CLB_TYPE == 'A'}">
			
			<div class="modules">
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.??????}${label.????????????}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRank.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????}${label.????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsClb.CLB_SQ}';">${label.??????????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';">${label.??????????????????}</button>
<%-- 						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">LEVEL${label.??????}</button> --%>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bbcBestAward.htm?intClbsq=${amsClb.CLB_SQ}');">?????????TOP5</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bestPartner.htm?intClbsq=${amsClb.CLB_SQ}');">${label.Best????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameTeam.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gamePeriod.htm?intClbsq=${amsClb.CLB_SQ}');">${label.?????????????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/gamePointInput2.html');">?????????</button>
						<c:if test="${amsClb.CLB_SQ == 9}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/exc/msgDoList.htm?intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
						</c:if>						
					</div>
				</div>
				<div class="" style="background:#fff;border-bottom:1px dashed #ddd;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" onclick="$('#singleLayout').toggle();">${label.??????}${label.????????????}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;display:none;" id="singleLayout">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRankSingles.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????}${label.????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameSingleList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????}${label.????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameRegSingle.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gamePeriodSingle.htm?intClbsq=${amsClb.CLB_SQ}');">${label.?????????????????????}</button>
					</div>
				</div>
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.???????????????}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????}${amsClb.NOTICE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}${amsClb.RULE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.?????????????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">????????????</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
						<c:if test="${amsClb.CLB_SQ == 9}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/web/publish/mobile/product/communityList.htm?displayId=8');">??????????????????<c:if test="${amsClb.BBC_REVIEW_CNT > 0}"><font color="red">(${amsClb.BBC_REVIEW_CNT})</font></c:if></button>
						</c:if>
						<c:if test="${amsClb.CLB_SQ != 9}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/web/publish/mobile/product/communityList.htm?displayId=1');">${label.????????????}</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page18&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbExcReg.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????????????????}</button>
						</c:if>
					</div>
				</div>
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.????????????}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/clbMbrMonthly.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}&datFrdt=${amsClb.THISMONTH }');">??????????????????</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('clbMbrCard.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.????????????}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.??????????????????}</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B' || amsClb.MBR_SQ == '679'}">
							<c:if test="${amsClb.CLB_SQ == 9}">
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?intClbsq=${amsClb.CLB_SQ}&pageName=page3');">????????????</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page6&intClbsq=${amsClb.CLB_SQ}');">????????????</button>
						</c:if>
					</div>
				</div>
				<div class="" style="height:2rem;background:#fff;">
					&nbsp;
				</div>
			</div>			
			
			</c:if>
			
			
			<!-- ---------------------- C A,B,C,D Level ?????? ---------------------- -->
			<!-- ---------------------- C A,B,C,D Level ?????? ---------------------- -->
			<!-- ---------------------- C A,B,C,D Level ?????? ---------------------- -->
			<!-- ---------------------- C A,B,C,D Level ?????? ---------------------- -->
			<c:if test="${amsClb.CLB_TYPE == 'C'}">
				
				<c:if test="${amsClb.CLB_SQ != 11}">	<!--  ?????? ?????? -->
				<div class="modules">
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.??????}${label.????????????}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">${label.????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${amsClb.CLB_SQ}';">${label.??????????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gamePeriod.htm?intClbsq=${amsClb.CLB_SQ}');">${label.?????????????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bestPartner.htm?intClbsq=${amsClb.CLB_SQ}');">${label.Best????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/gameTeam.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';">${label.??????????????????}</button>
						</div>
					</div>
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.???????????????}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????}${amsClb.NOTICE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}${amsClb.RULE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.?????????????????????}</button>
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbExcReg.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????????????????}</button>
							</c:if>
	<%-- 						<c:if test="${amsClb.CLB_SQ == 9}"> --%>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
	<%-- 						</c:if> --%>
							<c:if test="${amsClb.CLB_SQ == 9}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/exc/msgDoList.htm?intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/web/publish/mobile/product/communityList.htm?displayId=8');">??????????????????<c:if test="${amsClb.BBC_REVIEW_CNT > 0}"><font color="red">(${amsClb.BBC_REVIEW_CNT})</font></c:if></button>
							</c:if>
							<c:if test="${amsClb.CLB_SQ != 9}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/web/publish/mobile/product/communityList.htm?displayId=1');">${label.????????????}</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/bbcBestAward.htm?intClbsq=${amsClb.CLB_SQ}');">?????????TOP5</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page18&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/gamePointInput2.html');">?????????</button>
						</div>
					</div>
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.????????????}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/clbMbrMonthly.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}&datFrdt=${amsClb.THISMONTH }');">??????????????????</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('clbMbrCard.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.??????????????????}</button>
						</div>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}</button>
							</c:if>
							<c:if test="${amsClb.CLB_SQ == 9}">
								<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B' || amsClb.MBR_SQ == '679'}">
									<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
									<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?intClbsq=${amsClb.CLB_SQ}&pageName=page3');">????????????</button>
									<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem; border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
								</c:if>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">????????????</button>
							
						</div>
					</div>
					<div class="" style="height:2rem;background:#fff;">
						&nbsp;
					</div>
				</div>			
				</c:if>			
			
				<c:if test="${amsClb.CLB_SQ == 11}">	<!--  ????????? -->
				<div class="modules">
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >???????????????</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????}${amsClb.NOTICE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}${amsClb.RULE_TAG}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.?????????????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/badMatch/gamePointInput.html');">?????????(??????)</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/badMatch/gamePointInput2.html');">?????????(??????)</button>
						</div>
					</div>
					<div class="" style="background:#fff;">
						<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.????????????}</p>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">????????? ????????????</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.??????????????????}</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">????????????</button>
						</div>
						<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem border:solid 1px #01cfb9; color: #01cfb9;" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}</button>
								<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem border:solid 1px #01cfb9;"" onclick="windowlocation('/front/bbc/badMatch/getPage.htm?pageName=page25');">??????????????????</button>
							</c:if>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
							<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
							</c:if>
							
						</div>
					</div>
					<div class="" style="height:2rem;background:#fff;">
						&nbsp;
					</div>
				</div>			
				</c:if>			
			
			</c:if>
			
			
			
			<!-- ---------------------- D ?????? ???????????? ---------------------- -->
			<!-- ---------------------- D ?????? ???????????? ---------------------- -->
			<!-- ---------------------- D ?????? ???????????? ---------------------- -->
			<!-- ---------------------- A ?????? ???????????? ---------------------- -->
			<c:if test="${amsClb.CLB_TYPE == 'D'}">
			

			<div class="modules">
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.???????????????}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbNotice.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????}${amsClb.NOTICE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbRule.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}${amsClb.RULE_TAG}</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbDet.htm?intClbsq=${amsClb.CLB_SQ}');">${label.?????????????????????}</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbExcReg.htm?intClbsq=${amsClb.CLB_SQ}');">${label.??????????????????}</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('/front/bbc/clb/clbEventList.htm?intClbsq=${amsClb.CLB_SQ}');">EVENT<c:if test="${amsClb.EVE_CNT > 0}"><font color="red">(${amsClb.EVE_CNT})</font></c:if></button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/web/publish/mobile/product/communityList.htm?displayId=1');">${label.????????????}</button>
					</div>
				</div>
				<div class="" style="background:#fff;">
					<p class="title-icon title-icon1" style="line-height:0.8rem;font-weight:normal;font-size:0.24rem;" >${label.????????????}</p>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/clbMbrMonthly.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}&datFrdt=${amsClb.THISMONTH }');">??????????????????</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}');">${label.????????????}</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem" onclick="windowlocation('clbMyInfo.htm?intClbsq=${amsClb.CLB_SQ}&intMbrsq=${loginMbrSq}');">${label.??????????????????}</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
							<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?intClbsq=${amsClb.CLB_SQ}&pageName=page3');">????????????</button>
						</c:if>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}');">????????????</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/gamePointInput2.html');">?????????</button>
						
					</div>
					<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;border-bottom:1px dashed #ddd;">
						
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/clb/getPage.htm?pageName=page19&intClbsq=${amsClb.CLB_SQ}');">???????????????</button>
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page4&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
						<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
						<button class="btn-big btn-text btn-h70" style="margin:0 0.015rem 0.22rem;" onclick="windowlocation('/front/bbc/exc/getPage.htm?pageName=page2&intClbsq=${amsClb.CLB_SQ}');">??????????????????</button>
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
				alert("${label.????????????}.");
				return;
			}
			window.location = url;
		}
		
		$(function(){ 
			  wx.config({
				    debug: false, // ??????????????????,???????????????api???????????????????????????alert????????????????????????????????????????????????pc?????????????????????????????????log???????????????pc?????????????????????
				    appId: "${appInfo.appId }", // ?????????????????????????????????
				    timestamp: "${signInfo.timestamp }", // ?????????????????????????????????
				    nonceStr: "${signInfo.nonceStr }", // ?????????????????????????????????
				    signature: "${signInfo.signature }",// ???????????????????????????1
				    jsApiList: [//????????????
				       		 	 'onMenuShareTimeline'		//??????????????????????????????????????????????????????????????????????????????
				        		,'onMenuShareAppMessage'	//???????????????????????????????????????????????????????????????????????????
				                ] // ????????????????????????JS?????????????????????JS?????????????????????2
				});  
			  
			  	wx.ready(function(){
			  		
			  		wx.onMenuShareTimeline({
			  		    title: '${amsClb.CLB_NM} ${label.??????}', // ????????????
			  		    link: '${shareInfo.link}', // ????????????
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // ????????????
			  		    success: function () { 
			  		        // ??????????????????????????????????????????
			  		    },
			  		    cancel: function () { 
			  		        // ??????????????????????????????????????????
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${amsClb.CLB_NM}', // ????????????
			  		    desc: '${label.??????}', // ???????????? 
			  		    link: '${shareInfo.link}', // ????????????
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // ????????????
			  		    success: function () { 
			  		        // ??????????????????????????????????????????
			  		       // alert('success 11');
			  		    },
			  		    cancel: function () { 
			  		        // ??????????????????????????????????????????
			  		    	// alert('error 11');
			  		    }
			  		});
				});
			  	
			  	
			  	wx.error(function(res){
			  	    // config???????????????????????????error???????????????????????????????????????????????????????????????????????????config???debug????????????????????????????????????res????????????????????????SPA??????????????????????????????
		
			  	});
			  
		});
	</script>

			<!-- START bottom menu -->
			<c:set var="menuTag" value="2" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			
		<c:set var="helpTag" value="65" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="????????? ?????? ?????? ?????? ?????????.<br><br>??????,?????? ????????? ?????? ???????????? ??????, ????????????, ???????????? ???<br><br>??????????????????, ??????????????????, ???????????? ?????? ?????? ???????????? ????????? ????????????." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="??????????????????????????????<br><br>??????,????????????????????????????????????,???????????????????????????????????????????????????????????????????????????????????????????????????" />
		</c:if>
		
		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 
	

	</body>
</html>