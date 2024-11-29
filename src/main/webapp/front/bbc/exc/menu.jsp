<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<div class="footer" style="position: fixed;">
				<div class="footer-menu <c:if test="${menuTag == '1'}">active</c:if>" onclick="window.location='/front/bbc/exc/excDoList.htm';">
					<span class="participate" ></span>
					<p>${label.参加活动}</p>
				</div>
				<div class="footer-menu <c:if test="${menuTag == '2'}">active</c:if>" onclick="window.location='/front/bbc/clb/clb.htm';">
					<span class="club"></span>
					<p>${label.俱乐部}</p>
				</div>
<%-- 				<div class="footer-menu <c:if test="${menuTag == '3'}">active</c:if>" onclick="window.location='http://cafe.welevelup.cn';"> --%>
<%-- 				<div class="footer-menu <c:if test="${menuTag == '3'}">active</c:if>" onclick="window.location='/front/web/publish/mobile/product/communityList.htm?displayId=1';"> --%>
				<div class="footer-menu <c:if test="${menuTag == '3'}">active</c:if>" onclick="window.location='/front/bbc/badMatch/getPage.htm?pageName=home';">
<%-- 				<div class="footer-menu <c:if test="${menuTag == '3'}">active</c:if>" onclick="window.location='https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzU0MjU0NDgxMw==&scene=124#wechat_redirect';"> --%>
					<span class="participate"></span>
					<p>${label.羽毛球比赛}</p>
				</div>				
				<div class="footer-menu <c:if test="${menuTag == '4'}">active</c:if>" onclick="window.location='/front/bbc/itd/itd.htm?shopId=68&magazineGroupId=10030';">
					<span class="system"></span>
					<p>${label.系统介绍}</p>
				</div>
				<div class="footer-menu <c:if test="${menuTag == '5'}">active</c:if>" onclick="window.location='/front/bbc/mbr/myPage.htm';">
					<span class="mine"></span>
					<p>${label.我的}</p>
				</div>
<%-- 				<div class="footer-menu <c:if test="${menuTag == '6'}">active</c:if>" onclick="window.location='/front/bbc/clb/';"> --%>
<!-- 					<span class="mine"></span> -->
<!-- 					<p>TEST</p> -->
<!-- 				</div> -->
			</div>