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
		<title>${label.俱乐部}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<%@ include file="/front/bbc/inc/tags.jsp"%>
	<body>
	<div class="wrap">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">Club</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
				<div class="fixed" style="top: 0;">
					<div class="module">
						<div class="list60 flex">
							<p class="flex1 club-search"><a style="color:#fff;" href="/front/bbc/clb/clbSearch.htm">${label.俱乐部查询}</a></p>
							<p class="flex1 club-settled"><a style="color:#fff;" href="/front/bbc/clb/clbReg.htm">${label.俱乐部入驻}</a></p>
						</div>
					</div>
					<div class="module">
						<div class="list68 flex">
							<p class="flex1 switch-btn switch-btn1 active"><span>${label.我的俱乐部}</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn2"><span>${label.所有俱乐部}</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn3"><span>${label.友谊赛}</span></p>
						</div>
					</div>
				</div>
				<div class="switcharea-all"  id="all" >
					
					<!-- START Data Loop -->
					<c:forEach var="amsClbListMy" items="${amsClbListMy}" varStatus="status">  
				
						<div class="modules" style="margin-top:0;">
								<div class="list178 flex">
									<div style="width: 1.78rem;text-align: center;" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClbListMy.CLB_SQ}';">
										<img class="club-big" src="${amsClbListMy.CLB_MAI_IMG_PTH}"/>
									</div>
									<div class="flex1" style="padding-top: 0.3rem;">
										<p class="lh20 word-title" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClbListMy.CLB_SQ}';">${amsClbListMy.CLB_NM}【${amsClbListMy.CLB_MBR_CNT} ${label.人}】</p>
										<p class="small22-text small22">${label.联系人}：${amsClbListMy.CTT_NM}</p>
										<div class="flex small22-text small22">
											<p class="flex1"><!-- ${amsClbListMy.ATD_ADR} -->${amsClbListMy.ATD_ADR_DTL}</p>
											<span class="nowrap open" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClbListMy.CLB_SQ}';">${label.展开}</span>
										</div>
									</div>
								</div>
						</div>
					
					</c:forEach>
					<!-- END Data Loop -->
				
				</div>
				<div class="switcharea-mine" id="mine" style="display:none;">
				
					<!-- START Data Loop -->
					<c:forEach var="amsClbList" items="${amsClbList}" varStatus="status">  
				
						<div class="modules" style="margin-top:0;">
								<div class="list178 flex">
									<div style="width: 1.78rem;text-align: center;" onclick="window.location='/front/bbc/clb/clbDet.htm?intClbsq=${amsClbList.CLB_SQ}';">
										<img class="club-big" src="${amsClbList.CLB_MAI_IMG_PTH}"/>
									</div>
									<div class="flex1" style="padding-top: 0.3rem;">
										<p class="lh20 word-title" onclick="window.location='/front/bbc/clb/clbDet.htm?intClbsq=${amsClbList.CLB_SQ}';">${amsClbList.CLB_NM}【${amsClbList.CLB_MBR_CNT} ${label.人}】</p>
										<p class="small22-text small22">${label.联系人}：${amsClbList.CTT_NM}</p>
										<div class="flex small22-text small22">
											<p class="flex1">${amsClbList.ATD_ADR}${amsClbList.ATD_ADR_DTL}</p>
											<span class="nowrap open" onclick="window.location='/front/bbc/clb/clbDet.htm?intClbsq=${amsClbList.CLB_SQ}';">${label.展开}</span>
										</div>
									</div>
								</div>
						</div>
					
					</c:forEach>
					<!-- END Data Loop -->
				
				</div>
				<div class="switcharea-match" id="match" style="margin-top:1.3rem;display:none;">
				
					<!-- START Data Loop -->
					<c:forEach var="amsClbListMatch" items="${amsClbListMatch}" varStatus="status">  
				
						<div class="modules" style="margin-top:0;">
								<div class="list178 flex">
									<div style="width: 1.78rem;text-align: center;" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClbListMatch.CLB_SQ}';">
										<img class="club-big" src="${amsClbListMatch.CLB_MAI_IMG_PTH}"/>
									</div>
									<div class="flex1" style="padding-top: 0.3rem;">
										<p class="lh20 word-title" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClbListMatch.CLB_SQ}';">${amsClbListMatch.CLB_NM}【${amsClbListMatch.CLB_MBR_CNT} ${label.人}】</p>
										<p class="small22-text small22">${label.联系人}：${amsClbListMatch.CTT_NM}</p>
										<div class="flex small22-text small22">
											<p class="flex1">${amsClbListMatch.ATD_ADR}${amsClbListMatch.ATD_ADR_DTL}</p>
											<span class="nowrap open" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClbListMatch.CLB_SQ}';">${label.展开}</span>
										</div>
									</div>
								</div>
						</div>
					
					</c:forEach>
					<!-- END Data Loop -->
				
				</div>
			</div>
	</div>

			<!-- START bottom menu -->
			<c:set var="menuTag" value="2" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			

		<script type="text/javascript">
		$(document).ready(function(){
				$(".switch-btn").on("click",function(){
					$(".switch-btn").removeClass("active");
					$(this).addClass("active");
					if($(this).attr("class").indexOf("switch-btn1") >= 0){
						$(".switcharea-all").show();
						$(".switcharea-mine").hide();
						$(".switcharea-match").hide();
						/*显示所有俱乐部的内容*/
					}
					else if($(this).attr("class").indexOf("switch-btn2") >= 0){
						$(".switcharea-all").hide();
						$(".switcharea-mine").show();
						$(".switcharea-match").hide();
						/*显示我的俱乐部的内容*/
					}
					else if($(this).attr("class").indexOf("switch-btn3") >= 0){
						$(".switcharea-all").hide();
						$(".switcharea-mine").hide();
						$(".switcharea-match").show();
						/*显示我的俱乐部的内容*/
					}
			});
		});
	</script>
	
	
		<c:set var="helpTag" value="65" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="클럽 회장일 경우 클럽을 생성할 수 있으며<br><br>일반 회원인 경우 생성된 클럽을 검색, 조회 하여 가입하고자 하는 클럽에 가입 신청을 하는 화면 입니다.<br><br>※ 클럽에 가입을 하지 않고 시스템 사용이 불가능 합니다. <br>클럽을 선택하여 가입 신청을 하면 해당 클럽의 관리자 승인 후 가입이 완료됩니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="如您是在俱乐部的队长可以创造俱乐部，一般会员的话只能查看已创造的俱乐部，这画面就是可以申请加入会员。<br><br>※如果没有加入任何俱乐部的话不能使用这个平台。<br><br>首先选好俱乐部后申请加入，然后由管理者承认后即可使用。" />
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