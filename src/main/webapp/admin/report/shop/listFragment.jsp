 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
			   			<div class="result-data-warp">
					      	<table class="result-grid-table" style="margin-bottom:30px;">
					      		<table class="result-grid-table" style="margin-bottom:30px;">
					      	<colgroup>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 		</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th>
					           				<span><ui:i18n key="日期"/></span>					
					           			</th>
					           			<th>
					           				<span><ui:i18n key="下单数"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="付款数"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="发货数"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="付款金额"/></span>
					           			</th>
					      		 	</tr>
					      		 </thead>
					      		 <tbody  class="result-grid-tbody">
    		 			           	<c:forEach items="${page.data }" var="item" varStatus="status">
						           		<tr >
						           			<td>
						           				<span>${item.STS_ORDER_DT }</span>
						           				<input name="payNoneNum" type="hidden" value="${item.PAY_NEXT_NUM}"/>
						           				<input name="goodsQty" type="hidden" value="${item.GOODS_QTY}"/>
						           				<input id="allSendNo${status.index}" type="hidden" value="${item.ALL_SEND_NO}"/>
						           				<input id="allPayNo${status.index}" type="hidden" value="${item.ALL_PAY_NO}"/>
						           				<input id="allPayOrder${status.index}" type="hidden" value="${item.ALL_PAY_ORDER}"/>
						           			</td>
						           			<td><span name="dayOrderSum">${item.DAY_ORDER_SUM }</span></td>
						           			<td><span name="orderPaySum">${item.ORDER_PAY_SUM }</span></td>
						           			<td><span name="goodsSendSum">${item.GOODS_SEND_SUM }</span></td>
						           			<td><span name="orderPriceSum"><fmt:formatNumber type="number" value="${item.ORDER_PRICE_SUM }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span></td>
						           		</tr>
					           		</c:forEach>
					      		 </tbody>
				      		</table>
			      		</div>
			      		<ui:paging page="${page }" />
			     