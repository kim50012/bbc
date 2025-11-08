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
		<title>${label.个人中心}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
				.bg{
					width:6.4rem;
					height:1.9rem;
					background-image:url(../img/bg.png);
					background-size:6.4rem;
					background-repeat:no-repeat;
					position:relative;
					padding-top:0.8rem;
					}
				.Trbg{
					width:2.3rem;
					height:0.4rem;
					text-align:center;
					background-color:rgb(255,255,255);
					opacity:0.4;
					border-radius:0.2rem;
					margin:0.16rem auto 0;
					color:#000;
				}
				.inform-message{
					position:absolute;
					right:0.2rem;
					top:0.14rem;
				}
				.inform-message img{
					width:0.4rem;
					height:0.46rem;
				}
				.sub-content img{
					width:0.24rem;
					height:0.24rem;
					padding-right:0.16rem;
				}
				.message-number{
					background:#f54141;
					height:0.2rem;
					width:0.2rem;
					border-radius:50%;
					text-align:center;
					vertical-align:middle;
					line-height:0.2rem;
					font-size:0.04rem;
					color:#fff;
					position:absolute;
					right:0.42rem;
					top:0.17rem;
					overflow:hidden;
					text-overflow:ellipsis;
				}
	@media(min-width:720px) {
 		body {
 			width:450px;
 		}
 		.module {
 			width:450px;
 		}
 		.footer {
			position: fixed;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 450px;
 		}
		.bg {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 450px;
		    background-size: 8.4rem;
		}
		.module {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 450px;
		    top: 2.9rem;
		}
		.modules {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 450px;
		    top: 4.63rem;
		}
	}
		</style>
	</head>
	<body>
			<div class="bg">
					<div  class="club-logo-120"><img style="width:1.2rem;height:1.2rem;" src="${amsMbr.MBR_MAI_IMG_PTH}"/></div>
					<div class="Trbg""><b>${amsMbr.MBR_NM}</b></div>
<!-- 					<div class="inform-message"><img src="../img/inform-message.png"> -->
<!-- 					</div> -->
<!-- 					<div class="message-number">5</div> -->
			</div>
			<div class="sub-content1 h164 flex module" style="background:#fff;">
					<div class="flex flex1">
						<div class="flex1" style="padding-top:0.2rem;text-align:center;line-height:0.82rem;">
							<p>${label.所有比赛现况}</p>
							<p class="small row1">${label.总}<strong class="number yellow">${amsMbr.GAME_CNT}</strong>${label.战}<strong class="number yellow">${amsMbr.WIN}</strong>${label.胜}<strong class="number yellow">${amsMbr.LOSE}</strong >${label.负}</p>
						</div>
					</div>
					<div class="right-part flex left-dashed"  style="padding-top:0.45rem;">
						<div class="flex1">
							<p class="lh20 cen">${label.胜率}</p>
							<p class="lh20 cen red">${amsMbr.WIN_RATE}%</p>
						</div>
						<div class="flex1">
							<p class="lh20 cen">BB Coin</p>
							<p class="lh20 cen red">${amsMbr.BBC}</p>
						</div>
					</div>
			</div>
			<div class="modules">
					<div class="sub-content"  style="padding-bottom:2.1rem;">
						<c:if test="${amsMbr.MBR_SQ == 22 or amsMbr.MBR_SQ == 29 or amsMbr.MBR_SQ == 34}">
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/perinfo.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/mbr/report.html';">리포트</p>
							<p class="right-btn"></p>
						</div>
						</c:if>
						<c:if test="${amsMbr.MBR_SQ == 20}">
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/perinfo.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/clb/mbrReqList.htm';">회원승인</p>
							<p class="right-btn"></p>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/perinfo.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/mbr/amsSelect.htm?strJobtype=C';">접속이력</p>
							<p class="right-btn"></p>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/manage-btn3.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/mbr/getPage.htm?pageName=page5&intClbsq=9';">QUERY</p>
							<p class="right-btn"></p>
						</div>
						</c:if>
												
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/manage-btn3.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/mbr/myPageLang.html';">${label.语言设置}</p>
							<p class="right-btn"></p>
						</div>
						<div class="list90 bottom-dashed flex">	
							<p class="float"><img src="../img/club-pic.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/clb/clb.htm';">${label.我的俱乐部}</p>
							<p class="right-btn"></p>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/club-add.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/clb/clbReg.htm';">${label.俱乐部入驻}</p>
							<p class="right-btn"></p>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/active.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/exc/excReg.htm';">${label.活动新建}</p>
							<p class="right-btn"></p>
						</div>
						
						<c:if test="${amsMbr.MBR_SQ == 20 || amsMbr.MBR_SQ == 22 || amsMbr.MBR_SQ == 24 || amsMbr.MBR_SQ == 28 || amsMbr.MBR_SQ == 29}">
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="/front/web/publish/img/content/ico-category03.png"></p>
							<p class="flex1" onclick="window.location='/front/web/publish/mobile/main/index.htm';">쇼핑몰</p>
							<p class="right-btn"></p>
						</div>
						</c:if>
						<c:if test="${amsMbr.MBR_SQ == 20}">
						<div class="list90 bottom-dashed flex">
							<p class="float"><img src="../img/perinfo.png"></p>
							<p class="flex1" onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page21&intClbsq=59&shopId=68';">직원목록</p>
							<p class="right-btn"></p>
						</div>
						</c:if>

					</div>
			</div>
			
			<!-- START bottom menu -->
			<c:set var="menuTag" value="5" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
				
	</body>
</html>