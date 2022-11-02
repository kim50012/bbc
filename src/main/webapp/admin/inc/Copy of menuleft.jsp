<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
<!-- ▼ Left Menu -->

<script type="text/javascript">

function ShowMenu(obj,n){
	 var Nav = obj.parentNode;  
	 var BName = Nav.getElementsByTagName("ol");  
	 for(var i=0; i<BName.length; i++){
		 if(i!=n){
			 //BName[i].className = "no";
		 }
	 }
	 if($(BName[n]).hasClass('no')){
		$(BName[n]).removeClass('no');
	 }else{
		$(BName[n]).addClass('no');
	 }

	 if($(obj).hasClass('selected')){
		$(obj).removeClass('selected');
		$(obj).find('.menu-icon').removeClass('icon-minus').addClass('icon-plus');
	 }else{
	    $(obj).addClass('selected')
		$(obj).find('.menu-icon').removeClass('icon-plus').addClass('icon-minus');
	 }
}
</script>

<div class="ui-left-menu">
	<ul class="ui-menu" style="display: block;">
		<c:if test="${topMenuType == 1}">
			<%-- <li <c:if test="${leftMenuLelel1 == 1}"> class="selected" </c:if>>
				<a href="javascript:void(0)">
					<span class="menu-icon">> </span><span class="ui-menu-level1"> 主页</span>
				</a>
			</li> --%>
			<ol class="">
				<a href="/admin/portal/home.htm" title="${label.店铺目录}" <c:if test="${leftMenuLelel2 == 1}"> class="active" </c:if>>${label.店铺目录}</a>
				<a href="/admin/group/groupCreate.htm" title="${label.创建新公司}" <c:if test="${leftMenuLelel2 == 2}"> class="active" </c:if>>${label.创建新公司}</a>
				<a href="/admin/shop/shopCreate.htm" title="${label.创建新店铺}" <c:if test="${leftMenuLelel2 == 3}"> class="active" </c:if>>${label.创建新店铺}</a>
			</ol>
		</c:if>
		<c:if test="${topMenuType == 2}">
			<%-- <li  <c:if test="${leftMenuLelel1 == 1}"> class="selected" </c:if>><a href="javascript:void(0)"><span class="menu-icon">> </span><span  class="ui-menu-level1">微信管理</span></a></li>
						 --%>
			<ol class="">
				<a href="/admin/custCurrent/list.htm" title="${label.客户现况}" <c:if test="${leftMenuLelel2 == 1}"> class="active" </c:if>>${label.客户现况}</a>
				<a href="/admin/cust/cust.htm" title="${label.客户筛选}" <c:if test="${leftMenuLelel2 == 2}"> class="active" </c:if>>${label.客户筛选}</a>
				<a href="/admin/grade/list.htm" title="${label.等级管理}" <c:if test="${leftMenuLelel2 == 3}"> class="active" </c:if>>${label.等级管理}</a>
				<a href="/admin/pointMst/pointMst.htm" title="${label.积分管理}" <c:if test="${leftMenuLelel2 == 4}"> class="active" </c:if>>${label.积分管理}</a>
				<a href="/admin/msgManage/msgManage.htm" title="${label.消息管理}" <c:if test="${leftMenuLelel2 == 5}"> class="active" </c:if>>${label.消息管理}</a>
				<a href="/admin/custRatio/custRatio.htm" title="${label.客户占比分析}" <c:if test="${leftMenuLelel2 == 6}"> class="active" </c:if>>${label.客户占比分析}</a> 
			</ol>
		</c:if>


		<c:if test="${topMenuType == 3}">
			<%-- <li <c:if test="${leftMenuLelel1 == 1}"> class="selected" </c:if>><a href="javascript:void(0)"><span class="menu-icon">> </span><span  class="ui-menu-level1">店铺编辑</span></a></li>
						 --%>
			<ol class="">
				<a href="/admin/goodsCurrent/list.htm" title="${label.微店铺概况}" <c:if test="${leftMenuLelel2 == 1}"> class="active" </c:if>>${label.微店铺概况}</a> 
				<a href="/admin/wxCustMenu/wxCustMenu.htm" title="${label.微信自定义菜单}" <c:if test="${leftMenuLelel2 == 2}"> class="active" </c:if>>${label.微信自定义菜单}</a>
<%-- 			<a href="javascript:void(0)" title="网站导航" <c:if test="${leftMenuLelel2 == 3}"> class="active" </c:if>>网站导航</a> --%>
				<a href="/admin/shop/shopMainPage.htm" title="${label.设定店铺皮肤}" <c:if test="${leftMenuLelel2 == 4}"> class="active" </c:if>>${label.设定店铺皮肤}</a>
				<a href="/admin/shopManage/shopMainPageList.htm" title="${label.店铺主页}" <c:if test="${leftMenuLelel2 == 5}"> class="active" </c:if>>${label.店铺主页}</a>
				<a href="/admin/shopManage/shopNavigation.htm" title="${label.店铺导航}" <c:if test="${leftMenuLelel2 == 11}"> class="active" </c:if>>${label.店铺导航}</a>
				<a href="/admin/shopManage/blogControl.htm" title="${label.日志管理}" <c:if test="${leftMenuLelel2 == 10}"> class="active" </c:if>>${label.日志管理}</a>
				<a href="/admin/shopManage/webzineList.htm" title="${label.微杂志页面}" <c:if test="${leftMenuLelel2 == 6}"> class="active" </c:if>>${label.微杂志页面}</a>
				<a href="/admin/shopManage/publicControlSet.htm" title="${label.公告管理设置}" <c:if test="${leftMenuLelel2 == 7}"> class="active" </c:if>>${label.公告管理设置}</a>
				<a href="/admin/shopManage/userDefinePageList.htm" title="${label.自定义页面模块}" <c:if test="${leftMenuLelel2 == 8}"> class="active" </c:if>>${label.自定义页面模块}</a>
				<a href="/admin/master/file/fileList.htm" title="${label.我的文件}" <c:if test="${leftMenuLelel2 == 9}"> class="active" </c:if>>${label.我的文件}</a>
				<a href="/admin/shopManage/linkList.htm" title="${label.链接清单}" <c:if test="${leftMenuLelel2 == 15}"> class="active" </c:if>>${label.链接清单}</a>
			</ol>
		</c:if>

		<c:if test="${topMenuType == 4}">

			<li onClick="javascript:ShowMenu(this,0)"
				<c:if test="${leftMenuLelel1 == 3}"> class="selected" </c:if>>
				<c:choose>
					<c:when test="${leftMenuLelel1 == 3}">
						<span class="menu-icon icon-minus"></span>
					</c:when>
					<c:otherwise>
						<span class="menu-icon icon-plus"></span>
					</c:otherwise>
				</c:choose> <span class="ui-menu-level1">${label.订单管理}</span>

			</li>
			<ol <c:if test="${leftMenuLelel1 != 3}"> class="no" </c:if>>
				<a href="/admin/orderBaseCount/orderBaseCount.htm" title="${label.订单概况统计}" <c:if test="${leftMenuLelel1 == 3 and leftMenuLelel2 == 1}"> class="active" </c:if>>${label.订单概况统计}</a>
				<a href="/admin/orders/ordersAll.htm" title="${label.所有订单}" <c:if test="${leftMenuLelel1 == 3 and leftMenuLelel2 == 2}"> class="active" </c:if>>${label.所有订单}</a> 
<%-- 			<a href="javascript:void(0)" title="维权订单" <c:if test="${leftMenuLelel1 == 3 and leftMenuLelel2 == 3}"> class="active" </c:if>>维权订单</a> --%>
			</ol>
			
			<li onClick="javascript:ShowMenu(this,1)"
				<c:if test="${leftMenuLelel1 == 1}"> class="selected" </c:if>>
				<c:choose>
					<c:when test="${leftMenuLelel1 == 1}">
						<span class="menu-icon icon-minus"></span>
					</c:when>
					<c:otherwise>
						<span class="menu-icon icon-plus"></span>
					</c:otherwise>
				</c:choose> <span class="ui-menu-level1" title="${label.商品发布}">${label.商品发布}</span>
			</li>
			<ol <c:if test="${leftMenuLelel1 != 1}"> class="no" </c:if>>
				<a href="/admin/goods/category/list.htm" title="${label.商品分类}" <c:if test="${leftMenuLelel1 == 1 and leftMenuLelel2 == 1}"> class="active" </c:if>>${label.商品分类}</a>
				<a href="/admin/goods/list.htm" title="${label.商品登记}" <c:if test="${leftMenuLelel1 == 1 and leftMenuLelel2 == 2}"> class="active" </c:if>>${label.商品登记}</a>
				<a href="/admin/goodsDisplay/goodsDisplay.htm" title="${label.商品发布}" <c:if test="${leftMenuLelel1 == 1 and leftMenuLelel2 == 3}"> class="active" </c:if>>${label.普通商品发布}</a>
				<a href="/admin/beforeDisplay/beforeDisplay.htm" title="${label.商品发布}" <c:if test="${leftMenuLelel1 == 1 and leftMenuLelel2 == 4}"> class="active" </c:if>>${label.预售商品发布}</a>
			</ol>

			<li onClick="javascript:ShowMenu(this,2)"
				<c:if test="${leftMenuLelel1 == 2}"> class="selected" </c:if>>
				<c:choose>
					<c:when test="${leftMenuLelel1 == 2}">
						<span class="menu-icon icon-minus"></span>
					</c:when>
					<c:otherwise>
						<span class="menu-icon icon-plus"></span>
					</c:otherwise>
				</c:choose> <span class="ui-menu-level1">${label.商品管理}</span>
			</li>
			<ol <c:if test="${leftMenuLelel1 != 2}"> class="no" </c:if>>
				<a href="/admin/goodsSell/goodsSell.htm" title="${label.出售中商品}" <c:if test="${leftMenuLelel1 == 2 and leftMenuLelel2 == 1}"> class="active" </c:if>>${label.出售中商品}</a>
				<a href="/admin/sellOutGoods/sellOutGoods.htm" title="${label.已售罄商品}" <c:if test="${leftMenuLelel1 == 2 and leftMenuLelel2 == 2}"> class="active" </c:if>>${label.已售罄商品}</a>
				<a href="/admin/depotGoods/depotGoods.htm" title="${label.仓库中商品}" <c:if test="${leftMenuLelel1 == 2 and leftMenuLelel2 == 3}"> class="active" </c:if>>${label.仓库中商品}</a>
			</ol>

			<li onClick="javascript:ShowMenu(this,3)"
				<c:if test="${leftMenuLelel1 == 4}"> class="selected" </c:if>>
				<c:choose>
					<c:when test="${leftMenuLelel1 == 4}">
						<span class="menu-icon icon-minus"></span>
					</c:when>
					<c:otherwise>
						<span class="menu-icon icon-plus"></span>
					</c:otherwise>
				</c:choose> <span class="ui-menu-level1">${label.物流管理}</span>
			</li>
			<ol <c:if test="${leftMenuLelel1 != 4}"> class="no" </c:if>>
				<a href="/admin/shop/transport/transportSheet.htm" title="${label.运费标准管理}" <c:if test="${leftMenuLelel1 == 4 and leftMenuLelel2 == 1}"> class="active" </c:if>>${label.运费标准管理}</a>
<%-- 				<a href="/admin/transNotice/transNotice.htm" title="${label.交易物流通知}" <c:if test="${leftMenuLelel1 == 4 and leftMenuLelel2 == 2}"> class="active" </c:if>>交易物流通知</a> --%>
			</ol>
			<li onClick="javascript:ShowMenu(this,4)"
				<c:if test="${leftMenuLelel1 == 5}"> class="selected" </c:if>>
				<c:choose>
					<c:when test="${leftMenuLelel1 == 5}">
						<span class="menu-icon icon-minus"></span>
					</c:when>
					<c:otherwise>
						<span class="menu-icon icon-plus"></span>
					</c:otherwise>
				</c:choose> <span class="ui-menu-level1">${label.收入提现}</span>
			</li>
			<ol <c:if test="${leftMenuLelel1 != 5}"> class="no" </c:if>>
				<a href="/admin/myIncome/myIncome.htm" title="${label.我的收入}" <c:if test="${leftMenuLelel1 == 5 and leftMenuLelel2 == 1}"> class="active" </c:if>>${label.我的收入}</a>
				<a href="/admin/incomeDetail/incomeDetail.htm" title="${label.收支明细}" <c:if test="${leftMenuLelel1 == 5 and leftMenuLelel2 == 2}"> class="active" </c:if>>${label.收支明细}</a>
			</ol>

			<li onClick="javascript:ShowMenu(this,5)"
				<c:if test="${leftMenuLelel1 == 6}"> class="selected" </c:if>>
				<c:choose>
					<c:when test="${leftMenuLelel1 == 6}">
						<span class="menu-icon icon-minus"></span>
					</c:when>
					<c:otherwise>
						<span class="menu-icon icon-plus"></span>
					</c:otherwise>
				</c:choose> <span class="ui-menu-level1">${label.应用营销}</span>
			</li>
			<ol <c:if test="${leftMenuLelel1 != 6}"> class="no" </c:if>>
<%-- 				<a href="javascript:void(0)" title="优惠奖品管理" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 1}"> class="active" </c:if>>优惠奖品管理</a> --%>
				<a href="/admin/promotion/promotionList.htm" title="${label.促销管理}" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 2}"> class="active" </c:if>>${label.促销管理}</a>
<%-- 				<a href="/admin/checkIn/checkIn.htm" title="签到管理" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 3}"> class="active" </c:if>>签到管理</a> --%>
				<a href="/admin/vote/voteList.htm" title="${label.投票调查}" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 4}"> class="active" </c:if>>${label.投票调查}</a>
				<a href="/admin/rouletteActivity/rouletteActivity.htm" title="${label.摇奖活动}" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 5}"> class="active" </c:if>>${label.摇奖活动}</a>
				<a href="/admin/voucher/voucher.htm" title="${label.优惠券管理}" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 6}"> class="active" </c:if>>${label.优惠券管理}</a>
				<a href="/admin/bbsManage/bbsManage.htm" title="${label.BBS内容审批}" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 7}"> class="active" </c:if>>${label.BBS内容审批}</a>
				<a href="/admin/shimEventManage/list.htm" title="${label.活动管理}" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 8}"> class="active" </c:if>>${label.活动管理}</a>
				<%-- <a href="/admin/buyApplyManage/buyApplyManage.htm" title="购买申请管理" <c:if test="${leftMenuLelel1 == 6 and leftMenuLelel2 == 9}"> class="active" </c:if>>购买申请管理</a> --%>
				
			</ol>
		</c:if>


		<c:if test="${topMenuType == 5}">
			<%-- <li  <c:if test="${leftMenuLelel1 == 1}"> class="selected" </c:if>><a href="javascript:void(0)"><span class="menu-icon">> </span><span  class="ui-menu-level1">数据统计</span></a></li>
						 --%>
			<ol class="">
				<a href="/admin/datasCurrent/list.htm" title="${label.数据概况}" <c:if test="${leftMenuLelel2 == 1}"> class="active" </c:if>>${label.数据概况}</a>
				<a href="/admin/clientStatus/clientStatus.htm" title="${label.微店铺概况}" <c:if test="${leftMenuLelel2 == 4}"> class="active" </c:if>>${label.微店铺概况}</a>
				<a href="/admin/CopycustCurrent/list.htm" title="${label.客户现况}" <c:if test="${leftMenuLelel2 == 2}"> class="active" </c:if>>${label.客户现况}</a>
				<a href="/admin/CopycustRatio/custRatio.htm" title="${label.客户占比分析}" <c:if test="${leftMenuLelel2 == 3}"> class="active" </c:if>>${label.客户占比分析}</a>
				<%-- <a href="/admin/clientStatus/clientStatus.htm" title="微店铺概况" <c:if test="${leftMenuLelel2 == 4}"> class="active" </c:if>>微店铺概况</a> --%>
				<%-- <a href="javascript:void(0)" title="粉丝增减趋势" <c:if test="${leftMenuLelel2 == 2}"> class="active" </c:if>>粉丝增减趋势</a> --%>
				<%-- <a href="javascript:void(0)" title="粉丝层次统计" <c:if test="${leftMenuLelel2 == 3}"> class="active" </c:if>>粉丝层次统计</a>
				<a href="javascript:void(0)" title="粉丝基本信息" <c:if test="${leftMenuLelel2 == 4}"> class="active" </c:if>>粉丝基本信息</a> --%>
				<%-- <a href="javascript:void(0)" title="页面流量统计" <c:if test="${leftMenuLelel2 == 5}"> class="active" </c:if>>页面流量统计</a> --%>
				<a href="/admin/GoodsStatistics/GoodsStatistics.htm" title="${label.商品统计}" <c:if test="${leftMenuLelel2 == 5}"> class="active" </c:if>>${label.商品统计}</a>
				<a href="/admin/CopyorderBaseCount/orderBaseCount.htm" title="${label.订单概况统计}" <c:if test="${leftMenuLelel2 == 6}"> class="active" </c:if>>${label.订单概况统计}</a>
				<a href="/admin/Copyorders/ordersAll.htm" title="${label.所有订单}" <c:if test="${leftMenuLelel2 == 7}"> class="active" </c:if>>${label.所有订单}</a>
				<a href="/admin/imgTextSituationCopy/imgTextSituation.htm" title="${label.图文群发现况}" <c:if test="${leftMenuLelel2 == 10}"> class="active" </c:if>>${label.图文群发现况}</a>
			</ol>
		</c:if>
		<c:if test="${topMenuType == 6}">
			<%-- <li  <c:if test="${leftMenuLelel1 == 1}"> class="selected" </c:if>><a href="javascript:void(0)"><span class="menu-icon">> </span><span  class="ui-menu-level1">微信管理</span></a></li>
						 --%>
			<ol class="">
				<a href="/admin/imgTextSituation/imgTextSituation.htm" title="${label.图文群发现况}" <c:if test="${leftMenuLelel2 == 8}"> class="active" </c:if>>${label.图文群发现况}</a>
				<%-- <a href="/admin/custRatio/custRatio.htm" title="${label.客户占比分析}" <c:if test="${leftMenuLelel2 == 1}"> class="active" </c:if>>${label.客户占比分析}</a> --%>
				<a href="/admin/weixin/mass/massMain.htm" title="${label.群发功能}" <c:if test="${leftMenuLelel2 == 2}"> class="active" </c:if>>${label.群发功能}</a>
				<a href="/admin/autoReply/autoReply.htm" title="${label.自动回复}" <c:if test="${leftMenuLelel2 == 3}"> class="active" </c:if>>${label.自动回复}</a>
				<a href="/admin/focusReply/focusReply.htm" title="${label.关注回复}" <c:if test="${leftMenuLelel2 == 7}"> class="active" </c:if>>${label.关注回复}</a>
<%-- 				<a href="/admin/weixin/timer/timeToSend.htm" title="定时发送任务" <c:if test="${leftMenuLelel2 == 4}"> class="active" </c:if>>${label.定时发送任务</a> --%>
				<a href="/admin/weixin/material/materialManage.htm" title="${label.素材管理}" <c:if test="${leftMenuLelel2 == 5}"> class="active" </c:if>>${label.图片库}</a>
				<a href="/admin/msgControl/msgControl.htm" title="${label.消息管理}" <c:if test="${leftMenuLelel2 == 6}"> class="active" </c:if>>${label.图文消息}</a>
				<a href="/admin/report/weixin/newsInterfaceList.htm" title="${label.图文信息接口列表}" <c:if test="${leftMenuLelel2 == 10}"> class="active" </c:if>>${label.图文消息接口列表}</a>
				<a href="/admin/weixin/material/newMaterialManage.htm" title="${label.素材管理}" <c:if test="${leftMenuLelel2 == 9}"> class="active" </c:if>>${label.素材管理}</a>
			</ol>
		</c:if>
		<c:if test="${topMenuType == 7}">
			<li <c:if test="${leftMenuLelel1 == 1}"> class="selected" </c:if>><a href="javascript:void(0)"><span class="menu-icon">> </span><span  class="ui-menu-level1">${label.韩之盟营销网}</span></a></li>
						
			<ol class="">
				<a href="/admin/hzmMarke/list.htm" title="${label.主页}" <c:if test="${leftMenuLelel2 == 1}"> class="active" </c:if>>${label.主页}</a>
				<a href="javascript:void(0)" title="${label.案例}" <c:if test="${leftMenuLelel2 == 2}"> class="active" </c:if>>${label.案例}</a>
				<a href="javascript:void(0)" title="${label.服务}" <c:if test="${leftMenuLelel2 == 3}"> class="active" </c:if>>${label.服务}</a>
				<a href="javascript:void(0)" title="${label.入驻}" <c:if test="${leftMenuLelel2 == 4}"> class="active" </c:if>>${label.入驻}</a>
				<a href="javascript:void(0)" title="${label.关于我们}" <c:if test="${leftMenuLelel2 == 5}"> class="active" </c:if>>${label.关于我们}</a>
				<a href="javascript:void(0)" title="${label.新手必读}" <c:if test="${leftMenuLelel2 == 6}"> class="active" </c:if>>${label.新手必读}</a>
				<a href="javascript:void(0)" title="${label.最新活动}" <c:if test="${leftMenuLelel2 == 7}"> class="active" </c:if>>${label.最新活动}</a>
				<a href="javascript:void(0)" title="${label.微信支付教程}" <c:if test="${leftMenuLelel2 == 8}"> class="active" </c:if>>${label.微信支付教程}</a>
			</ol>
		</c:if>
	</ul>
</div>
<!-- ▲ Left Menu -->