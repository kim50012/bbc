
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
<!-- ▼ Main header -->
        <header class="ui-header">
			<div class="ui-header-inner clearfix">
                <div class="ui-header-logo"> 
                	<%
						String logoUrl = "/admin/images/logo/header-logo.png";
						if(request.getServerName().equals("wechat.waremec.com")){
							logoUrl = "/admin/images/logo/header-logo2.png";
						} 
						 %> 
						 <img alt="" src="<%=logoUrl%>">
				</div>
				<nav class="ui-header-nav">
					<ul class="clearfix">
						<%-- <li class="<c:if test="${topMenuType == 1}">active</c:if>">
							<a href="/admin/portal/main.htm">主页</a>
						</li> --%> 
						<li class="<c:if test="${topMenuType == 3}">active</c:if>">
							<a href="/admin/goodsCurrent/list.htm">${label.店铺管理}</a>
						</li>
						<li class="<c:if test="${topMenuType == 4}">active</c:if>">
							<a href="/admin/orderBaseCount/orderBaseCount.htm">${label.店铺运营}</a>
						</li>
						<li class="<c:if test="${topMenuType == 2}">active</c:if>">
							<a href="/admin/custCurrent/list.htm">${label.客户管理}</a>
						</li> 
						<li class="<c:if test="${topMenuType == 6}">active</c:if>">
							<a href="/admin/imgTextSituation/imgTextSituation.htm">${label.微信管理}</a>
						</li>
						<li class="<c:if test="${topMenuType == 5}">active</c:if>">
							<!-- <a href="/admin/datasCurrent/list.htm">数据统计</a> -->
							<a href="/admin/datasCurrent/list.htm">${label.数据统计}</a>
						</li>
						<li class="<c:if test="${topMenuType == 7}">active</c:if>">
							<!-- <a href="/admin/hzmMarke/list.htm">韩之盟营销网</a> -->
							<a href="/portal/index.htm" target="_back">${label.韩之盟营销网}</a>
						</li>
					</ul>
				</nav>
		 
				<div class="ui-header-user">
					 <ul class=" ">
						<li class="first-menu">
							<img class="js-modifyImg" style="width: 41px; height: 41px;" src="/admin/images/icon/icon-user.png">
							<div  class="submenu">
						   		<a class="second-menu" href="/admin/setUp/setUp.htm" target="_self">${label.个人账号设置}</a>
						   		<a class="second-menu" href="/admin/login/logout.htm" target="_self">${label.退出}</a>
						   </div>
						</li> 
						<li class="first-menu">
							<img alt="" src="/admin/images/icon/icon-tools.png">
							<div  class="submenu">
						   		<a class="second-menu" href="/admin/portal/home.htm" target="_self">${label.店铺切换}</a>
						   		<a class="second-menu" href="javascript:alert('${label.开发中}...');void(0);" target="_self">${label.公司详细信息}</a>
						   		<a class="second-menu" href="javascript:alert('${label.开发中}...');void(0);" target="_self">${label.店铺详细信息}</a>
						   		<a class="second-menu" href="/admin/userManage/userManage.htm" target="_self">${label.用户管理}</a>
						   		<a class="second-menu" href="/admin/master/i18n/i18nList.htm" target="_self">${label.国际化管理}</a>
						   		<a class="second-menu" href="/admin/master/code/codeList.htm" target="_self">${label.系统代码管理}</a>
						   		<a class="second-menu" href="/wx/share/index.htm" target="blank">Share</a>
						   		<a class="second-menu" href="/wx/qrcode/index.htm" target="blank">QR Code</a>
						   		<a class="second-menu" href="/label/reloadLabel.htm" target="blank">Label</a>
						   </div>
						</li> 
						<li class="first-menu">
						  <img alt="" src="/admin/images/icon/icon-new-msg.png">
						   <div class="submenu" >
						   		<a class="second-menu" href="/admin/msgManage/msgManage.htm" target="_self">${label.消息}</a>
						   </div>
						</li>
					</ul>
				</div> 
			</div>
		</header>
	<!-- ▲ Main header -->
	
	<script>
		$(function(){
			
			userImgModify();
			
			$('.first-menu').hover(function(){
				 $(this).find('div').show();
				 $(this).attr('background-color', '#990017');
			} ,function(){
			 	$(this).find('div').hide();
			}); 
			
		});
		
		function userImgModify() {

			$.ajax({
				data : {},
				type : "POST",
				url : "/admin/orders/userImgModify.htm",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {
					$('.js-modifyImg').attr('src', res.SHOP_LOGO_PIC);
				},
				error : function(obj, e, msg) {
					$('.js-modifyImg').attr('src', res.SHOP_LOGO_PIC);
					//alert("${label.网络出现故障}"+".");
				}
			});
		}
	</script>

