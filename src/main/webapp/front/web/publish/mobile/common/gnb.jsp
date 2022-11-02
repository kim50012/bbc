<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<!-- GNB Menu : S -->
		<section id="gnb-menu">
			<nav>
				<h1>메뉴</h1>
				
				<h2 class="gnb-title">분류</h2>
				<ul class="gnb-depth">
					<li><a href="/front/web/publish/mobile/brand/category.htm"><i class="ico-gnb-menu1"></i>상품분류</a></li>
					<li><a href="/front/web/publish/mobile/brand/brandlist.htm"><i class="ico-gnb-menu2"></i>가맹점</a></li>
					<li><a href="/front/web/publish/mobile/product/productlist.htm?brandId=0&shopGradeClassId=0&orderby="><i class="ico-gnb-menu3"></i>최신상품</a></li>
					<li><a href="/front/web/publish/mobile/product/productlist.htm?brandId=0&shopGradeClassId=0&orderby=SALES_QTY_DESC"><i class="ico-gnb-menu4"></i>인기상품</a></li>
					<li><a href="/front/web/publish/mobile/brand/brand.htm?brandId=11"><i class="ico-gnb-menu5"></i>할인상품</a></li>
					<li><a href="/front/web/publish/mobile/brand/brand.htm?brandId=12"><i class="ico-gnb-menu6"></i>이벤트상품</a></li>
				</ul>
				
				<h2 class="sub-title">상품 리뷰</h2>
				<ul class="sub-depth" style="margin-bottom: 10px;">
					<li style="width:100%;"><a href="/front/web/publish/mobile/product/reviewList.htm"><i class="ico-sub-menu1"></i>최신 상품 리뷰</a></li>
				</ul>
				
				<h2 class="sub-title">커뮤니티 & 고객센터</h2>
				<ul class="sub-depth">
					<li><a href="/front/web/publish/mobile/product/communityList.htm?displayId=1"><i class="ico-sub-menu1"></i>커뮤니티</a></li>
					<li><a href="/front/web/publish/mobile/mypage/mypage.htm"><i class="ico-sub-menu2"></i>나의페이지</a></li>
					<li class="line-none"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=4"><i class="ico-sub-menu3"></i>Q&A, FAQ</a></li>
					<li class="line-none"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=3"><i class="ico-sub-menu4"></i>정보공유</a></li>
<!-- 					<li class="line-none"><a href="#"><i class="ico-sub-menu5"></i>取货处指南</a></li> -->
<!-- 					<li class="line-none"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=7"><i class="ico-sub-menu6"></i>건의사항</a></li> -->
				</ul>
				
				<ul class="footer-menu">
					<li><a onclick="alert('준비중입니다.');"><i class="footer-menu1"></i>QQ咨询</a></li>
					<li><a href="/front/web/publish/mobile/product/communityList.htm?displayId=7"><i class="footer-menu2"></i>건의사항</a></li>
				</ul>
			</nav>
			<a href="#" class="btn-close"></a>
		</section>
		
		<!-- GNB Menu : E -->
		