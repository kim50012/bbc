<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp">
   					<table class="result-grid-table">
			      	 	<thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th style="width:10%;"><ui:i18n key="支付类型" />Logo</th>
			      		 		<th style="width:35%;"><ui:i18n key="内容" /></th>
			      		 		<th style="width:15%;"><ui:i18n key="使用时间" /></th>
			      		 		<th style="width:25%;"><ui:i18n key="手续费说明" /></th>
			      		 		<th style="width:15%;"><ui:i18n key="操作" /></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody" >
				      		<c:forEach items="${page.data}" var="items" varStatus="status">
							<tr>
								<td style="width:10%;">
									<img src="${items.LOGO_URL}" width="80px" height="80px" style="padding: 5px;" />
								</td>
								<td style="width:35%;text-align: center;">
									${items.PAY_PRE_DESC}
								</td>
								<td style="width:15%;">
									${items.PAY_PRE_DT}
								</td>
								<td style="width:25%;">
<%-- 									${items.PAY_PRE_INFO} --%>
									${fn:replace(items.PAY_PRE_INFO, '###', '<br/>')}
								</td>
								<td style="width:15%;">
									<div class="qyong">
										<span class="gridbutton red" onclick="javascript:paymentDetail('${items.SHOP_ID}','${items.PAY_TYPE_ID}','${items.IS_USE}');"><ui:i18n key="编辑" /></span>
										<span class="gridbutton red" onclick="javascript:doDelete('${items.SHOP_ID}','${items.PAY_TYPE_ID}');"><ui:i18n key="删除" /></span>
										<c:if test="${items.IS_USE eq 'Y'}">
											<span style="width: 40px;" class="gridbutton red btn-icon" onclick="javascript:option('Y','${items.SHOP_ID}','${items.PAY_TYPE_ID}');"><ui:i18n key="启用中" /><span class="btn-tip">${label.停用}</span></span>
										</c:if>
										<c:if test="${items.IS_USE eq 'N'}">
											<span style="width: 40px;" class="gridbutton green btn-icon" onclick="javascript:option('N','${items.SHOP_ID}','${items.PAY_TYPE_ID}');"><ui:i18n key="未启用" /><span class="btn-tip">${label.启用}</span></span>
										</c:if>
					        		</div>
								</td>
							</tr>
			        	</c:forEach>
			      		 </tbody>
		      		</table>
   				</div>
   				<ui:paging page="${page }" />