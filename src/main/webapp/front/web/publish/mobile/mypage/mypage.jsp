<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="My Page" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>
	<div id="wrap">
		<!--  Container : S -->
		<section id="container" class="mypage">
			<div class="location">
				<a href="/front/web/publish/mobile/main/index.htm" class="arrow"><i>back page</i></a>
				<h2>${title }</h2>
			</div>
			
			<div class="mypage-box">
				<div class="mypage-top">

					<!-- 등급 : S.CLUB VIP -->
					<h2 class="sv">
						<i>MB</i>
						${amsMbr.MBR_NM}
						<span>님, 환영합니다.</span>
					</h2>

<!-- 					<a href="#" class="btn-link">查看优惠</a> -->
					
					<p><i class="ico-connet"></i> WeChat으로 로그인 하였습니다. | <a href="/front/bbc/mbr/myPage.htm">배드민턴 My Page 바로가기</a></p>
<!-- 					<p class="lock"><a href="#"><i class="ico-lock"></i>退出登录</a></p> -->
				</div>
				
				<!-- 바로가기 퀵메뉴 및 전체 메뉴 : S  -->
				<div class="box">
					<ul class="link">
						<li>
							<a href="/front/web/publish/mobile/order/goodsReceipt.htm">
								<i class="ico-my-link01"></i>주소지설정
<!-- 								<span class="number">14</span> -->
							</a>
						</li>
						<li>
							<a href="/front/web/publish/mobile/mypage/mypageinterest.htm">
								<i class="ico-my-link02"></i>찜한상품
							</a>
						</li>
						<li>
							<a href="mypageshopcart.htm">
								<i class="ico-my-link03"></i>장바구니
<!-- 								<span class="number">1</span> -->
							</a>
						</li>
						<li>
							<a href="/front/web/publish/mobile/order/orderList.htm?orderIndex=3">
								<i class="ico-my-link04"></i>배송대기
							</a>
						</li>
						<!-- 
						<li>
							<a href="/front/web/publish/mobile/order/orderList.htm?orderIndex=4">
								<i class="ico-my-link04"></i>수령대기
							</a>
						</li>
						 -->
					</ul>
					<p><a href="/front/web/publish/mobile/order/orderList.htm">전체 주문보기</a></p>
				</div>
				<!-- 바로가기 퀵메뉴 및 전체 메뉴 : E  -->
				
				<!-- 나의 정보 : S  -->
				<div class="box">
					<p>
						<a href="/front/web/publish/mobile/product/reviewList.htm">최신상품리뷰</a>
					</p>
					<p>
						<a href="/front/web/publish/mobile/product/communityList.htm?displayId=1">커뮤니티 바로가기</a>
					</p>
					<p>
						<a href="/front/bbc/exc/excDoList.htm">운동참여</a>
					</p>
					<p>
						<a href="/front/bbc/clb/clb.htm">나의 클럽목록</a>
					</p>
				</div>
				<!-- 나의 정보 : E  -->
				
				<!-- 기타퀵메뉴 : S  -->
				<div class="box">
					<ul class="mypage-quick">
						<li class="one"><a href="/front/web/publish/mobile/brand/category.htm">상품분류</a></li>
						<li class="two"><a href="/front/bbc/mbr/myPage.htm">나의페이지</a></li>
						<li class="three bn"><a href="/front/bbc/exc/excDoList.htm">운동참여</a></li>
						<li class="four bn"><a href="/front/bbc/clb/clb.htm">나의클럽목록</a></li>
					</ul>
				</div>
				<!-- 기타퀵메뉴 : E  -->
			</div>
			

		</section>
		<!--  Container : E -->


		<%@ include file="/front/web/publish/mobile/common/menu_bottom.jsp"%> 		

	</div>
	
</body>
</html>

