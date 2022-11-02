<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Online Shop" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>

	<div id="wrap">
		<!--  Brand : S -->
		<section id="brand">
			<div class="top-menu">
				<a href="#" class="on">카테고리</a>
				<!-- <a href="#">分类</a> -->
			</div>
			<ul class="tap">
				<!-- 브랜드 세번쨰 : S -->
				<li class="brand-three on">
					<div class="view" style="padding-top: 0px;">
						<div class="left" style="top: 0px;">
							<ul>
								<c:forEach var="classList" items="${classList}" varStatus="status">
									<li <c:if test="${status.count == 1}">class="on"</c:if>><a href='/front/web/publish/mobile/product/productlist.htm?shopGradeClassId=${classList.SGC_ID}'>${classList.SGC_NM}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="right">

							<c:forEach var="classTotalList" items="${classTotalList}" varStatus="status">
								<c:if test="${classTotalList.SGC_TYPE == 1}">
									<c:if test="${status.count > 1}">
										</ul>
									</c:if>
									<h3>${classTotalList.SGC_NM}</h3>
									<ul>
								</c:if>
										<li><a href='/front/web/publish/mobile/product/productlist.htm?shopGradeClassId=${classTotalList.SGC_ID}'>${classTotalList.SGC_NM}</a></li>
							</c:forEach>
									</ul>
							
									<h3></h3>
									<ul>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
										<li><a href='#'></a></li>
									</ul>

						</div>
					</div>
				</li>
				<!-- 브랜드 세번쨰 : E -->
			</ul>
			
			<a href="javascript:history.back();" class="btn-close">close</a>
		</section>
		<!--  Brand : E -->
		
		<%@ include file="/front/web/publish/mobile/common/menu_bottom.jsp"%> 	
	</div>
</body>
</html>

