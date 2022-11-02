<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp">
	<table class="result-grid-table">
	<colgroup>
		<col width="14%" />
		<col width="8%" />
		<col width="18%" />
		<col width="7%" />
		<col width="10%" />
		<col width="7%" />
		<col width="9%" />
		<col width="16%" />
	</colgroup>
	<thead class="result-grid-thead">
		<tr>
			<th><ui:i18n key="时间"/></th>
			<th><ui:i18n key="类型"/></th>
			<th><ui:i18n key="收入流水号"/></th>
			<th><ui:i18n key="收入"/>(<ui:i18n key="元"/>)</th>
			<th><ui:i18n key="退款金额"/>(<ui:i18n key="元"/>)</th>
			<th><ui:i18n key="余额"/>(<ui:i18n key="元"/>)</th>
			<th><ui:i18n key="支付渠道"/></th>
			<th><ui:i18n key="单号"/></th>
		</tr>
	</thead>
	<tbody  class="result-grid-tbody">
	 <c:forEach items="${list}" var="list" varStatus="status">
	   		<tr>
	   			<td >
	   				<span>${list.CREATED_DT }</span>					
	   			</td>
	   			<td>
	   				<span>${list.ORDER_AMT_NM }</span>
	   			</td>
	   			<td >
	   				<span>${list.PAY_PG_KEY }</span>
	   			</td>
	   			<td >
	   				<span>￥<fmt:formatNumber type="number" value="${list.PAY_AMT }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
	   			</td>
	   			<td >
	   				<span>￥<fmt:formatNumber type="number" value="${list.RE_PAY_AMT }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
	   			</td>
	   			<td >
	   				<span>￥<fmt:formatNumber type="number" value="${list.PRICE_TT_AFTER_NEGO }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>	
	   			</td>
	   			<td>
	   				<span class="pay-name-span" title="${list.PAY_NAME }">${list.PAY_NAME } </span>
	   			</td>
	   			<td>
	   				<span>${list.ORDER_OUT_ID }</span>
	   			</td>
	   		</tr>
	   	</c:forEach>
		 </tbody>
	</table>
	<ui:paging page="${page }" />
</div>