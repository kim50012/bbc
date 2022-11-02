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
		<title>${label.现在参加活动}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
	</head>
	<body>
		<div class="wrap no-footer" >
			<div class="header">
				<div class="back">返回</div>
				<div class="title">参加活动</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="space1"></div>
			<div class="content" >
			
			
			<!-- START Data Loop -->
			<c:forEach var="amsExcList" items="${amsExcList}" varStatus="status">  
						<p></p>
				
				<div class="modules">
					<div class="list78 flex">
						<p class="club-logo">
							<img class="club-icon" src="${amsExcList.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="flex1 row1 word-title" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsExcList.HME_CLB_SQ}';">${amsExcList.HME_CLB_NM}</p>
<!-- 						<p class="row1"><span class="number">777</span>km</p> -->
						<p class="row1">
							<div class="sub-content-title" style="margin:0;">
								<span>${amsExcList.EXC_TP_NM}</span>
							</div>						
						</p>
					</div>
					<div class="sub-content" onclick="window.location='excJin.jsp?intExcsq=${amsExcList.EXC_SQ}';">
<!-- 						<div class="sub-content-title"> -->
<%-- 							<span>${amsExcList.EXC_TP_NM}</span> --%>
<!-- 						</div> -->
						<div class="list flex row1"><span class="text-outline">${label.时间}：</span><p>${amsExcList.EXC_DATE}  ${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}</p></div>
						<div class="list flex row1"><span class="text-outline">${label.场地}：</span><p>${amsExcList.EXC_TIT}</p></div>
						<div class="list flex row1"><span class="text-outline">${label.参与人员}：</span><p>${amsExcList.ATD_CNT}</p></div>
						<div class="list flex row1">
							<span class="nowrap text-outline">${label.活动介绍}：</span>
							<p class="flex1">${amsExcList.EXC_DCT}&nbsp;
								<span class="nowrap open" onclick="window.location='excJin.jsp?intExcsq=${amsExcList.EXC_SQ}';">${label.展开} >></span>
							</p>
						</div>
						<div class="top-dashed flex">
							<p class="flex1 beyond">
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_1 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_1}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_2 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_2}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_3 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_3}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_4 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_4}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_5 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_5}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_6 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_6}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_7 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_7}"/></c:if>
							</p>
							<p style="padding-top: 0.15rem; font-size: 0.22rem; color: #555555;" onclick="window.location='excJin.jsp?intExcsq=${amsExcList.EXC_SQ}';">
								<span class="number red">${amsExcList.JIN_CNT}</span>${label.人参与}
							</p>
						</div>
					</div>
					<div class="top-dashed flex" style="text-align:right;height:0.8rem;">
						<div class="sub-content-title" style="margin:0;right:0;padding:0.2rem;float:left;width:100%;">
							<span onclick="delExcGame('${amsExcList.EXC_SQ}');" style="border:1px solid #c0c0c0; background:#c0c0c0;">삭제하기</span>
						</div>
					</div>
				</div>

			 </c:forEach>
			<!-- END Data Loop -->
<%-- 			<c:if test="{atrMtcList == null}"> --%>
				<div class="modules">
					<div class="" style="height:0.7rem;width:100%;border-bottom:1px solid #ddd;">
						<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
							<div class="flex">
								<p class="flex1 title-icon">${label.现在运动情况}</p>
							</div>
						</div>
					</div>
					
					<div class="sub-content1 h164 flex">
						<div class="flex flex1">
							<div class="member-head-big-wrap"><img class="member-head-big" src="${atrMtcList.MBR_MAI_IMG_PTH}"/></div>
							<div class="flex1" style="padding-top:0.45rem;">
								<h3 class="list">${atrMtcList.CLB_NIK_NM}</h3>
								<p class="small row1">
									${label.总}<strong class="number yellow">${atrMtcList.GAME_CNT}</strong>${label.战}
									<strong class="number yellow">${atrMtcList.WIN}</strong>${label.胜}
									<strong class="number yellow">${atrMtcList.LOSE}</strong>${label.负}
								</p>
							</div>
						</div>
						<div class="right-part flex left-dashed"  style="padding-top:0.45rem;">
							<div class="flex1">
								<p class="lh20 cen">${label.胜率}</p>
								<p class="lh20 cen red">${atrMtcList.WIN_RATE}%</p>
							</div>
							<div class="flex1">
								<p class="lh20 cen">BB Coin</p>
								<p class="flex2 cell-6 cell" style="line-height: 2;font-weight:bold;">${atrMtcList.LASTDAY_BBC_TAG}</p>
							</div>
						</div>
					</div>
				</div>
<%-- 				</c:if> --%>
				
				<div class="buttons" style="background:#fff;padding-bottom:2rem;">
					<button class="btn-big btn-write" style="border:solid 1px #01cfb9; color: #01cfb9;" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${intClbsq}&returnPageName=%2ffront%2fbbc%2fexc%2fexcDoList';">${label.输入比赛结果}</button>
					<button class="btn-big btn-search" onclick="window.location='/front/bbc/clb/gameTody.htm?intClbsq=${intClbsq}&returnPageName=%2ffront%2fbbc%2fexc%2fexcDoList';">${label.每日比赛结果}</button>
					<button class="btn-big btn-search" onclick="window.location='/front/bbc/clb/gameTody.htm?intMbrsq=${loginMbrSq}&intClbsq=${intClbsq}&returnPageName=%2ffront%2fbbc%2fexc%2fexcDoList';">${label.我的现在情况}</button>
					<button class="btn-big btn-search" onclick="window.location='/front/bbc/clb/gamePeriod.htm?intClbsq=${intClbsq}&returnPageName=%2ffront%2fbbc%2fexc%2fexcDoList';">${label.期间别比赛现况}</button>
<!-- 					<button class="btn-big btn-search">个人综合卡</button> -->
					<button class="btn-big btn-search" onclick="window.location='/front/bbc/clb/clbRank.htm?intClbsq=${intClbsq}&returnPageName=%2ffront%2fbbc%2fexc%2fexcDoList';">${label.俱乐部排名查询}</button>
					<button class="btn-big btn-search" onclick="window.location='/front/bbc/clb/bestPartner.htm?intClbsq=${intClbsq}&returnPageName=%2ffront%2fbbc%2fexc%2fexcDoList';">${label.Best伙伴查询}</button>
<!-- 					<div class="button"><button class="btn-stop">停止活动</button></div> -->
				</div>
			
				
			</div>
			
			<!-- START bottom menu -->
			<c:set var="menuTag" value="1" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
		</div>
		
			
		<script type="text/javascript">

 		function delExcGame(intExcsq) {
 			
     		if (!confirm("${label.确认删除活动吗}?")) {
 				return;
 			}
 			
 			var intExcsq = intExcsq;
 			
 			loadingShow();
 			
 			 $.ajax({
 			 	 		data:{
 			 	 			intExcsq : intExcsq
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/exc/excDel.htm",
 					success : function(data) {

 						if(data.ret=="success"){
 							window.location.href="/front/bbc/exc/excDoList.htm";
 						}else{
 							loadingHide();
 							alertBbc(data.ret);
 						}
 						
 					},
 					error : function(xhr, status, e) {
 						alert("Error : " + status);
 						loadingHide();
 					}
 				});
 		}			
		
</script>
		
		
		<%@ include file="/front/bbc/inc/loading.jsp"%>
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
		 
	</body>
	
</html>
