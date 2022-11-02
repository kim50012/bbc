<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<!-- Header : S -->
		<header id="header">
			<div class="top" style="height: 10px;">
			</div>
			<div class="gnb-box">
				<a href="#" class="btn-gnb"><i class="ico-menu"></i>메뉴</a>
				<div class="search-box">
					<input id="searchTitle" type="text" title="" placeholder="" value="${goodsName }"/>
					<button onclick="searchProd();">
						button-search
					</button>
				</div>
				<!-- 아래 소식과 함께 수량 변경해야 함 -->
				<a href="#" class="btn-new" style="color: #ffffff;"><span style="color: #666666;">1</span><i class="ico-new"></i>소식</a>
			</div>
		</header>
		<!-- Header : E -->
		
		
		<!-- NEW Menu : S -->
		<section id="new-menu">
			<nav>
				<h1>消息</h1>
				
				<div class="aside-box">
					<h2>온라인 쇼핑몰 오픈을 하였습니다. 오픈 이벤트로 전품목 할인 중이오니 많은 참여 부탁드립니다.</h2>
					<p class="date">2019.05.01</p>
					<i class="ico-notice"></i>
					<!-- 
					<i class="ico-cycle-new"></i>
					<i class="ico-notice"></i>
					<i class="ico-event"></i>
					<i class="ico-brand"></i>
					 -->
				</div>
				
			</nav>
			<a href="#" class="btn-close"></a>
		</section>
		
		<!-- NEW Menu : E -->