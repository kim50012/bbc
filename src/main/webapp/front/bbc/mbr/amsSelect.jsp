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
		<title>${label.会员管理}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script type="text/javascript">
			function goPage(a, b, c) {
				window.location="/front/bbc/mbr/amsSelect.htm?strJobtype="+a+"&strExcFrtme1="+b+"&strExcFrtme2="+c;
			}
			function goExcPage(a) {
				window.location="/front/bbc/exc/excJin.htm?intExcsq="+a;
			}
		</script>
	</head>
	<body>
		<div class="content">
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="" style="height:0.7rem;width:100%;">
					<div class="float" style="width:100%;">
						<div class="list68 flex" style="padding:0;">
							<c:set var="widthA" value="" />
							<c:set var="widthB" value="" />
							<c:set var="widthC" value="" />
							<c:set var="widthD" value="" />
							<c:set var="widthE" value="" />
							<c:set var="widthF" value="" />
							<c:set var="widthG" value="" />
							<c:if test="${strJobtype == 'D'}">
								<p class="flex1 switch-btn switch-btn1 active" ><span>금일 운동 예상 참석자</span></p>
							</c:if>
							<c:if test="${strJobtype == 'C'}">
								<p class="flex1 switch-btn switch-btn1 active" ><span>최근 한달 접속 기록</span></p>
							</c:if>
							<c:if test="${strJobtype == 'E'}">
								<c:set var="widthA" value="width: 0.9rem;" />
								<c:set var="widthB" value="width: 1.7rem;" />
								<c:set var="widthC" value="width: 3rem;" />
								<p class="flex1 switch-btn switch-btn1 active" ><span>사용자별 접속 페이지</span></p>
							</c:if>
							<c:if test="${strJobtype == 'A'}">
								<p class="flex1 switch-btn switch-btn1 active" ><span>꿈나무</span></p>
							</c:if>
							<c:if test="${strJobtype == 'B'}">
								<c:set var="widthA" value="width: 1rem;text-align:center;" />
								<c:set var="widthB" value="width: 1rem;text-align:center;" />
								<c:set var="widthC" value="width: 1rem;text-align:center;" />
								<c:set var="widthD" value="width: 1rem;text-align:center;" />
								<p class="flex1 switch-btn switch-btn1 active" ><span>이벤트 배팅 승률</span></p>
							</c:if>
							<c:if test="${strJobtype == 'F'}">
								<c:set var="widthA" value="width: 1.6rem;" />
								<c:set var="widthB" value="width: 2.4rem;" />
								<c:set var="widthC" value="width: 2.5rem;" />
								<p class="flex1 switch-btn switch-btn1 active" ><span>지난 운동 목록</span></p>
							</c:if>
							<p><div class="parting-line"></div></p>
						</div>
					</div>
				</div>
			</div>
			<div class="switcharea-apply">
				<!-- 
				<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">신청번호</li>
					<li class="flex2 cell-2 cell">클럽</li>
					<li class="flex2 cell-3 cell">이름</li>
					<li class="flex2 cell-4 cell">클럽이름</li>
					<li class="flex2 cell-5 cell">ID</li>
					<li class="flex2 cell-6 cell">버튼</li>
				</ul>
				</div>
				 -->
				<div class="module" style="border-top:none;background:#fff;">
				
					<!-- 가입신청 -->
						<c:forEach var="amsSelect" items="${amsSelect}" varStatus="status">
							<ul class="flex ul-list">
								<c:if test="${amsSelect.A != null}">
									<li class="flex2" style="${widthA}padding:0.1rem;line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsSelect.A}</pre></li>
								</c:if>
								<c:if test="${amsSelect.B != null}">
									<c:if test="${strJobtype == 'F'}">
											<li class="flex2" style="${widthB}padding:0.1rem;line-height:0.4rem;color: #01cfb9;" onclick="goExcPage('${amsSelect.EXC_SQ}')"><pre style="white-space: pre-wrap;">${amsSelect.B}</pre></li>
									</c:if>
									<c:if test="${strJobtype != 'F'}">
											<li class="flex2" style="${widthB}padding:0.1rem;line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsSelect.B}</pre></li>
									</c:if>
								</c:if>
								
								<c:if test="${amsSelect.C != null}">
									<c:if test="${strJobtype == 'C'}">
											<li class="flex2" style="${widthC}padding:0.1rem;line-height:0.4rem;color: #01cfb9;" onclick="goPage('E', '${amsSelect.OPENID}', '${amsSelect.B}')"><pre style="white-space: pre-wrap;">${amsSelect.C}</pre></li>
									</c:if>
									<c:if test="${strJobtype != 'C'}">
											<li class="flex2" style="${widthC}padding:0.1rem;line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsSelect.C}</pre></li>
									</c:if>
								</c:if>
								
								<c:if test="${amsSelect.D != null}">
									<li class="flex2" style="${widthD}padding:0.1rem;line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsSelect.D}</pre></li>
								</c:if>
								<c:if test="${amsSelect.E != null}">
									<li class="flex2" style="${widthE}padding:0.1rem;line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsSelect.E}</pre></li>
								</c:if>
								<c:if test="${amsSelect.F != null}">
									<li class="flex2" style="${widthF}padding:0.1rem;line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsSelect.F}</pre></li>
								</c:if>
								<c:if test="${amsSelect.G != null}">
									<li class="flex2" style="${widthG}padding:0.1rem;line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsSelect.G}</pre></li>
								</c:if>
							</ul>
					 	</c:forEach>
				
				<ul class="flex list90 ul-list" style="border-bottom:none;padding-bottom:0.6rem;">
<!-- 					<div class="button flex2"> -->
<!-- 						<button class="btn-stop">上一页</button> -->
<!-- 						<button class="btn-stop">下一页</button> -->
<!-- 					</div> -->
				</ul>
				</div>
			</div>
			
			
	
		<a href="/front/bbc/mbr/myPage.htm" class="r_pg_top show">홈으로</a>
		<%@ include file="/front/bbc/inc/loading.jsp"%>
		 
	</body>
</html>