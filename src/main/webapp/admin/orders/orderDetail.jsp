<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <link rel="stylesheet" type="text/css" href="/admin/css/orders/order.css" />  
<style>
.order-status-bar-warp {
	margin-bottom: 20px;
}

.order-status-bar {
	margin: 0 auto;
	width: 710px;
	height: 20px;
	background-image: url('/admin/images/orders/step_order_details.png');
	background-repeat: no-repeat;
}

.order-title-label {
	height: 50px;
	color: #d0112d;
	font-size: 14px;
	line-height: 50px;
}

.order-option-key {
	float: left;
	width: 100px;
	line-height: 26px;
}

.order-option-value {
	float: left;
	line-height: 26px;
}

.order-status-bar-title{
	width: 100%; text-align: center; font-size: 14px; color: #ff7e00;
}
.order-status-bar-title td{
	width: 25%;
	height: 30px;
}

.order-status-bar-footer{
	width: 100%; text-align: center; font-size: 10px;
}

.order-status-bar-footer td{
	width: 25%;
	height: 40px;
}


</style>
</head>

<body>
	 <!-- ▼ container --> 
	<div class="container">
		<div class="order-status-bar-warp">
			<table class="order-status-bar-title">
				<tr>
					<td><ui:i18n key="买家待付款"/></td>
					<td><ui:i18n key="买家已付款"/></td>
					<td><ui:i18n key="卖家已发货"/></td>
					<td><ui:i18n key="物流标记签收"/></td>
				</tr>
			</table>
			<div class="order-status-bar"></div>
			<table  class="order-status-bar-footer">
				<tr>
					<td>${order.STS_ORDER_DT}</td>
					<td>${order.STS_PAYMENT_DT}</td>
					<td>${order.STS_DELIVERY_DT}</td>
					<td>${order.STS_ARRIVAL_DT}</td>
				</tr>
			</table>
		</div>
		
		<div style="font-size: 14px;padding-left: 20px; ">
			<span><ui:i18n key="订单号"/>：${order.ORDER_OUT_ID}</span>
		</div>

		<div class="order-header-row clearfix" style="border-top: 1px solid #d1102d; margin-top: 10px;">
			<div class="order-header-cell" style="padding-left: 20px;width: 270px;">
				<ui:i18n key="商品名称"/>					 
			</div>
			<div class="order-header-cell text-center" style="width: 100px; ">
				<ui:i18n key="商品规格"/>
			</div>
			<div class="order-header-cell text-center" style="width: 80px;">
				<ui:i18n key="订单状态"/>			 
			</div>
			<div class="order-header-cell text-center" style="width: 90px;">
				<ui:i18n key="销售价"/>(<ui:i18n key="元"/>)						 
			</div>
			<div class="order-header-cell text-center" style="width: 70px;">
				<ui:i18n key="数量"/>(<ui:i18n key="件"/>)					 
			</div>
			<div class="order-header-cell text-center" style="width: 90px;">
				<ui:i18n key="商品优惠"/>(<ui:i18n key="元"/>)				 
			</div>
			<div class="order-header-cell text-center" style="width: 80px;">
				<ui:i18n key="交易价"/>(<ui:i18n key="元"/>)				 
			</div>
			<div class="order-header-cell text-center" style="width: 120px;">
				<ui:i18n key="客户评分"/>				 
			</div>
		</div>
		<div> 
	  		<div class="order-list-item">
	  			<div class="order-list-item-contents">
	  				<!-- ▼ 订单中商品信息 --> 
	  				<c:forEach items="${requestScope.orderList}" var="orderDetail" varStatus="status">
		  				<div>
		  					<div class="div-row clearfix">
		  					<div class="div-cell" style="width: 120px;padding-left: 20px; ">
						  		<img class="img90" alt="" src="${orderDetail.GOODS_LIST_IMG_URL}">
							</div>
							<div class="div-cell" style="width: 150px;">
								<div class="goods-title">${orderDetail.GOODS_NM}</div>
								<div class="goods-desc" style="margin-top: 10px;">${orderDetail.DESC_TITLE}</div>
							</div>
							<div class="div-cell text-center" style="width: 100px; ">
								<div>
									 <div>
									 	<c:if test="${not empty orderDetail.SPEC_NM1}">
									 		${orderDetail.SPEC_NM1}&nbsp;:&nbsp;${orderDetail.SPEC_VALUE1}
									 	</c:if>
									 </div>
									<div>
										<c:if test="${not empty orderDetail.SPEC_NM2}">
											${orderDetail.SPEC_NM2}&nbsp;:&nbsp;${orderDetail.SPEC_VALUE2}
										</c:if>
									</div>
								</div>
							</div>
					 
							<div class="div-cell text-center" style="width: 80px;">
								<div>${orderDetail.STATUS_NM}</div>
							</div>
							<div class="div-cell text-center" style="width: 90px; ">
								<div><ui:money value="${orderDetail.PRICE_UNIT_SALE}"/></div>
							</div>
							<div class="div-cell text-center" style="width: 70px;">
								 <div>${orderDetail.GOODS_QTY}</div>
							</div>
							<div class="div-cell text-center" style="width: 90px; ">
								<div>
									<ui:money value="${orderDetail.PRICE_SALE}"/>
								</div>
							</div>
							<div class="div-cell text-center" style="width: 80px;">
								 <div>
								  	<ui:money value="${orderDetail.PRICE_UNIT_SUM}"/>
								</div>
							</div>
							<div class="div-cell text-center" style="width: 120px; ">
								<div class="porel">
									 <c:forEach var="x" begin="1" end="5">
										<c:choose>
											<c:when test=" ${x le orderDetail.TOTAL_GPA}">
												<img alt="" src="/admin/images/raty/star_solid.png" />
											</c:when>
											<c:otherwise>
												<img alt="" src="/admin/images/raty/star_hollow.png" />
											</c:otherwise>
										</c:choose>
									</c:forEach> 
								</div>
							</div>
						</div>
	  				</div>
	  				<div style="margin-left: 20px;margin-bottom: 20px;">
	  					<span style="color : #d0112d; "><ui:i18n key="评价内容"/></span>:&nbsp;&nbsp;
	  					<c:choose>
	  						<c:when test="${empty orderDetail.REVIEW_DESC}"><ui:i18n key="无"/></c:when>
	  						<c:otherwise>${orderDetail.REVIEW_DESC}</c:otherwise>
	  					</c:choose>
	  				</div>
	  				<c:if test="${not status.last }">
		  				<div class="order-remark-split"></div>
	  				</c:if>
					</c:forEach>
					<!-- ▲ 订单中商品信息  -->
				</div>
			</div>
		</div>

		<div class="clearfix" style="margin-top: 20px;">
			<div style="float:left;  width: 49.5%; box-sizing: border-box ;border-right: 1px solid #e5e5e5;padding-right:20px; ">
			     <div class="order-title-label"><ui:i18n key="购买详情"/></div>  
			     
			     <div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="订单状态"/>：</div>
						<div class="order-option-value">${order.STATUS_NM}</div>
					</div>	
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="订单总计"/>：</div>
						<div class="order-option-value">
							<span>￥<ui:money value="${order.PRICE_SUM}"/></span>&nbsp;
							<span>(<ui:i18n key="包含运费"/>)</span>&nbsp;&nbsp;
							<span><ui:i18n key="运费"/>：</span>&nbsp;&nbsp;
							<span>￥<ui:money value="${order.TRANS_FEE}"/></span>
						</div>
					</div>	
					<%-- <div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="下单用户"/>：</div>
						<div class="order-option-value">${order.CUST_REAL_NM}</div>
					</div> --%>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="支付方式"/>：</div>
						<div class="order-option-value">${order.PAY_TYPE_NM}</div>
					</div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="收货地址"/>：</div>
						<div class="order-option-value">${order.CUST_ADDRESS}</div>
					</div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="姓名"/>：</div>
						<div class="order-option-value">${order.ADR_RECEIPTOR_NM}</div>
					</div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="电话"/>：</div>
						<div class="order-option-value">${order.ADR_MOBILE}</div>
					</div>
				</div>
			</div> 
			<div style="padding-left:20px; float:left;  width: 50%;  box-sizing: border-box ;">
			  <div class="order-title-label"><ui:i18n key="备注"/></div> 
			  <div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="买家备注"/>：</div>
						<div class="order-option-value">${order.CUST_MSG}</div>
					</div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="卖家备注"/>：</div>
						<div class="order-option-value">${order.INVOICE_DESC}</div>
					</div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="描述"/>：</div>
						<div class="order-option-value">
							<c:forEach var="x" begin="1" end="5">
								<c:choose>
									<c:when test=" ${x le order.GOODS_GPA}">
										<img alt="" src="/admin/images/raty/star_solid.png" />
									</c:when>
									<c:otherwise>
										<img alt="" src="/admin/images/raty/star_hollow.png" />
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="物流"/>：</div>
						<div class="order-option-value">
							<c:forEach var="x" begin="1" end="5">
								<c:choose>
									<c:when test=" ${x le order.GOODS_LOGISTIC_GPA}">
										<img alt="" src="/admin/images/raty/star_solid.png" />
									</c:when>
									<c:otherwise>
										<img alt="" src="/admin/images/raty/star_hollow.png" />
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<div class="order-option-row clearfix">
						<div class="order-option-key"><ui:i18n key="服务"/>：</div>
						<div class="order-option-value">
							<c:forEach var="x" begin="1" end="5">
								<c:choose>
									<c:when test=" ${x le order.GOODS_SERVICE_GPA}">
										<img alt="" src="/admin/images/raty/star_solid.png" />
									</c:when>
									<c:otherwise>
										<img alt="" src="/admin/images/raty/star_hollow.png" />
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					
				</div> 
				
			</div>
		</div>
	</div>
	<!-- ▲ Main container -->



	<!-- ▼ Main footer -->
 
	<!-- ▲ Main footer -->
</body>
</html>