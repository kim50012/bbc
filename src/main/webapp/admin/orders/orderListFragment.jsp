<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
	<div class="order-header-row clearfix">
		<div class="order-header-cell" style="padding-left: 20px; width: 110px;">
			<input class="iccheckbox js-check-all" type="checkbox" name="checkall" >&nbsp;&nbsp;<ui:i18n key="全选"/>					 
		</div>
		<div class="order-header-cell" style="width: 190px;">
			<ui:i18n key="商品"/>					 
		</div>
		<div class="order-header-cell text-center" style="width: 70px;">
			<ui:i18n key="商品"/><ui:i18n key="单价"/>(<ui:i18n key="元"/>)			 
		</div>
		<div class="order-header-cell text-center" style="width: 60px;">
			<ui:i18n key="数量"/>(<ui:i18n key="件"/>)			 
		</div>
		<div class="order-header-cell text-center" style="width: 100px;">
			<ui:i18n key="买家"/>				 
		</div>
		<div class="order-header-cell text-center" style="width: 80px;">
			<ui:i18n key="付款时间"/>			 
		</div>
		<div class="order-header-cell text-center" style="width: 130px;">
			<ui:i18n key="订单总价"/>(<ui:i18n key="元"/>)				 
		</div>
		<div class="order-header-cell text-center" style="width: 80px;">
			<ui:i18n key="订单状态"/>			 
		</div>
		<div class="order-header-cell text-center" style="width: 80px;">
			<ui:i18n key="操作"/>				 
		</div>
	</div>
	<div class="ddd" >
		<!-- ▼ 订单列表item --> 
		<c:forEach items="${requestScope.orderList}" var="order" varStatus="status">
	  		<div class="order-list-item" data-order-id="${order.ORDER_ID}">
	  			<div class="order-list-item-header">
	  				<span class="order-list-item-header-checkbox">
	  					<input class="iccheckbox js-check-item" type="checkbox" name="check" data-order-id="${order.ORDER_ID}">
	  				</span>
	  				<span class="order-list-item-header-order">
	  					<ui:i18n key="订单号"/>：${order.ORDER_OUT_ID}/${order.PAY_TYPE_NM}
	  				</span>
	  				<span class="order-list-item-header-orderdate">
	  					<ui:i18n key="下单时间"/>：${order.ordersDtlList[0].STS_ORDER_DT}
	  				</span>
	  			</div>
	  			<div class="order-list-item-contents">
	  				<!-- ▼ 订单中商品信息 --> 
	  				<c:forEach items="${order.ordersDtlList}" var="orderDetail" varStatus="detailStatus">
	  				<div class="div-row clearfix">
	  					<div class="div-cell" style="width: 120px;padding-left: 20px; ">
					  		<img class="img90" alt="" src="${orderDetail.GOODS_LIST_IMG_URL}">
						</div>
						<div class="div-cell" style="width: 180px;">
							<div class="goods-title">${orderDetail.GOODS_NM}</div>
							<div class="goods-desc" style="margin-top: 10px;">${orderDetail.DESC_TITLE}</div>
						</div>
						<div class="div-cell text-center" style="width: 70px; ">
							<div class="">
								<span>
									<fmt:formatNumber type="number" value="${orderDetail.PRICE_UNIT_SALE}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
								</span>
							</div>
						</div>
						<div class="div-cell text-center" style="width: 60px; ">
							<div class="" style="">${orderDetail.GOODS_QTY}</div>
						</div>
						
						
						<c:if test="${detailStatus.first}">
							<div class="div-cell text-center" style="width: 100px; ">
								<div class="">${orderDetail.ADR_RECEIPTOR_NM}</div>
								<div class="" style="">${orderDetail.ADR_MOBILE}</div>
							</div>
							<div class="div-cell text-center" style="width: 80px; ">
								 <div class="">${orderDetail.STS_PAYMENT_DT}</div>
							</div>
							<div class="div-cell text-center" style="width: 130px; ">
								<div class="" style="">
									<span>
										<fmt:formatNumber type="number" value="${orderDetail.PRICE_SUM}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
									</span>
								</div>
								<div class="" style="">(含运费:<span><fmt:formatNumber type="number" value="${orderDetail.TRANS_FEE}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>)</div>
							</div>
							<div class="div-cell text-center" style="width: 80px; ">
								 <div class="">${orderDetail.STATUS_NM}</div>
							</div>
							<div class="div-cell text-center" style="width: 80px; ">
								<div class="porel">
									<span class="order-action red js-order-show-detail" onclick="showDetail(${order.ORDER_ID});"  data-order-id="${order.ORDER_ID}">
										<ui:i18n key="查询详情"/>
									</span>
								</div>
								<c:if test="${orderDetail.STATUS_ID eq 10}">
									<div class="porel">
										<span class="order-action red js-order-modify-price" onclick="orderPriceModify(${order.ORDER_ID});" data-order-id="${order.ORDER_ID}">
											<ui:i18n key="修改价格"/>
										</span>
									</div>
									<div class="porel">
										<span class="order-action red js-order-payment-exception" onclick="orderPaymentException(${order.ORDER_ID});" data-order-id="${order.ORDER_ID}">
											<ui:i18n key="支付异常"/>
										</span>
										<div class="order-popover tipright js-order-payment-exception-popover" data-order-id="${order.ORDER_ID}">
								 			 <div class="text-left" style="margin-left:10px;width:200px;">
								 			 	<div>
								 			 		<ui:i18n key="客户已完成付款"/>
								 			 	</div>
								 			 	<div>
								 			 		<ui:i18n key="但系统状态未正常更新时"/>
								 			 	</div>
								 			 	<div>
								 			 		<ui:i18n key="点击此按钮手动确认并更新订单状态"/>
								 			 	</div>
								 			 </div>
										</div>
									</div>
								</c:if>
								<c:if test="${orderDetail.STATUS_ID eq 20 and orderDetail.IS_REFUND_REQ eq 1}">
									<div class="porel">
										<span class="order-action red js-order-refund" onclick="orderRefund(${order.ORDER_ID},'${itemsOrdersDtl.CUST_SYS_ID}');"  data-order-id="${order.ORDER_ID}">
											<ui:i18n key="退款"/>
										</span>
									</div>
								</c:if>
								<c:if test="${orderDetail.STATUS_ID eq '20' and orderDetail.IS_REFUND_REQ ne '1' and empty orderDetail.REQUEST_DLV_DT}">
								 	<div class="porel">
								 		<span class="order-action red js-order-deliver"  data-order-id="${order.ORDER_ID}">
								 			<ui:i18n key="发货"/>
								 		</span>
								 		<div class="order-popover tipright js-order-popover" data-order-id="${order.ORDER_ID}">
								 			<div class="form-warp clearfix text-left" style="width: 330px;">
									  			 <div class="control-warp"  >
									  			 	 <div class="form-label" style="width: 100px;">
									  			 		${label.物流公司} : 
									  			 	 </div>
									  			 	 <div class="form-control">
									  			 	 	<select class="select2 sw18 js-trans-comp" data-placeholder="${label.物流公司}">
															<option value=""></option>										
															<c:forEach items="${transCompList}" var="trans" varStatus="status">
																<option value="${trans.TRANS_COMP_ID}">${trans.TRANS_COMP_NM}</option>
															</c:forEach>
														</select>
									  			 	 </div>
									  			 </div>
									  			 <div class="control-warp"  >
									  			 	 <div class="form-label" style="width: 100px;">
									  			 		${label.运单号} : 
									  			 	 </div>
									  			 	 <div class="form-control">
									  			 	 	<input type="text" class="w18 js-trans-order-no" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									  			 	 </div>
									  			 </div>
									  			<div class="control-warp text-center">
									  				<div class="buttons-action">
										  				<span class="button bg-orange js-trans-order-confirm">
															<span class="button-icon conform"></span>
															${label.确认}
														</span>
														<span class="button bg-orange  js-trans-order-cancel">
															<span class="button-icon cancel"></span>
															${label.取消}
														</span>
									  				</div>
									  			</div>
								  			</div>
										</div>
								 	</div>
								</c:if>
								<c:if test="${orderDetail.DEL_YN eq 'Y'}">
									<div class="porel">
										<span class="order-action red js-order-delete" onclick="orderDelete(${order.ORDER_ID});" data-order-id="${order.ORDER_ID}">
											<ui:i18n key="删除"/>
										</span>
									</div>
								</c:if>
								<c:if test="${orderDetail.STATUS_ID eq 30}">
									<div class="porel">
										<span class="order-action red js-order-sign" onclick="orderSign(${order.ORDER_ID});"  data-order-id="${order.ORDER_ID}">
											<ui:i18n key="标记签收"/>
										</span>
									</div>
								</c:if>
								<c:if test="${orderDetail.STATUS_ID eq 40}">
									<div class="porel">
										<span class="order-action red js-order-complete" onclick="orderComplete(${order.ORDER_ID});"  data-order-id="${order.ORDER_ID}">
											<ui:i18n key="交易成功"/>
										</span>
									</div>
								</c:if>
							</div>
						</c:if>
						
					</div>
					</c:forEach>
					<!-- ▲ 订单中商品信息  -->
				</div>
			
			<div class="order-remark-split"></div>
			
			<div class="remark-warp clearfix">
				<div class="remark-action js-edit-remark" data-order-id="${order.ORDER_ID}">
					<span style="font-weight: bold;">+</span>&nbsp;<ui:i18n key="备注"/>
				</div>
			     <div class="remark-contents">
			     <c:choose>
			     	<c:when test="${empty order.INVOICE_DESC}">
				     	<span class="remark-tip js-edit-remark js-remark-tip" data-order-id="${order.ORDER_ID}"><ui:i18n key="这是添加的一段备注"/></span>
			     	</c:when>
			     	<c:otherwise>
				     	<span class="remark-tip js-edit-remark js-remark-tip" data-order-id="${order.ORDER_ID}">${order.INVOICE_DESC}</span>
			     	</c:otherwise>
			     </c:choose>
					 	<input type="text" class="js-remark-content remark-content" value="${order.INVOICE_DESC}"  data-order-id="${order.ORDER_ID}" placeholder="<ui:i18n key="这是添加的一段备注"/>"  style="display: none;">
				</div>  
			     <%-- <div class="remark-eidt js-edit-remark" data-order-id="${order.ORDER_ID}">
				 	<ui:i18n key="修改备注"/>
				</div>   --%>
			</div>
		</div>
	</c:forEach>
	<!-- ▲ 订单列表item  -->
	
</div>
 
 <ui:paging page="${page }" />
  
  
  <!-- ▼ 订单列表item --> 
  		<%-- <div class="order-list-item">
  			<div class="order-list-item-header">
  				<span class="order-list-item-header-checkbox">
  					<input class="iccheckbox" type="checkbox" name="check">
  				</span>
  				<span class="order-list-item-header-order">
  					<ui:i18n key="订单号"/>：7-201501011000232/支付宝
  				</span>
  				<span class="order-list-item-header-orderdate">
  					<ui:i18n key="下单时间"/>：2015-01-01 13:32:32
  				</span>
  			</div>
  			<div class="order-list-item-contents">
  				<div class="div-row clearfix">
  					<div class="div-cell" style="width: 120px;padding-left: 20px; ">
				  <img class="img90" alt="" src="/uploads/150/2015/03/03/150_shop_2015_03_03_16_32_05_63956.jpg">
				</div>
				<div class="div-cell" style="width: 190px;">
					<div class="goods-title">圃美多花蟹方便面</div>
					<div class="goods-desc" style="margin-top: 10px;">花蟹方便面 4连包/1000g</div>
				</div>
				<div class="div-cell text-center" style="width: 60px; ">
					<div class=""><span>1000.00</span></div>
				</div>
				<div class="div-cell text-center" style="width: 60px; ">
					<div class="" style="">1</div>
				</div>
				<div class="div-cell text-center" style="width: 100px; ">
				<div class="">郑太范</div>
					<div class="" style="">13811814780</div>
				</div>
				<div class="div-cell text-center" style="width: 80px; ">
					 <div class="">2015-01-02 11:12:12</div>
				</div>
				<div class="div-cell text-center" style="width: 130px; ">
					 <div class=""><span>1000</span></div>
					<div class="" style="">(含运费:<span>1000.00</span>)</div>
				</div>
				<div class="div-cell text-center" style="width: 80px; ">
					 <div class="">待付款</div>
				</div>
				<div class="div-cell text-center" style="width: 80px; ">
					<div class=""><span class="order-action red"><ui:i18n key="查询详情"/></span></div>
					<div class="order-action red" style=""><ui:i18n key="修改价格"/></div>
					<div class="order-action red" style=""><ui:i18n key="支付异常"/></div>
					<div class="order-action red" style=""><ui:i18n key="退款"/></div>
				</div>
			</div>
			 
		</div>
		
		<div class="order-remark-split"></div>
		
		<div class="remark-warp clearfix">
			<div class="remark-action" >
				<span style="font-weight: bold;">+</span>&nbsp;<ui:i18n key="备注"/>
			</div>
		     <div class="remark-contents">
		     	<span class="remark-tip js-remark-tip" style="">这是添加的一段备注嘻嘻</span>
			 	<input type="text" class="js-remark-content remark-content" style="display: none;">
			</div>  
		     <div class="remark-eidt">
			 	<ui:i18n key="修改备注"/>
			</div>  
		</div>
	</div> --%>
	<!-- ▲ 订单列表item  -->