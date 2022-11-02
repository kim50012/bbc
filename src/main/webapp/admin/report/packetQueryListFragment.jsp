<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
<div class="result-data-warp">
			   			<table class="result-grid-table">
			      		 	<colgroup>
		      		 			<col width="100px" />
		       		 			<col width="110px" />
		       		 			<col width="180px" />
		       		 			<col width="110px" />
		       		 			<col width="60px" />
		       		 			<col width="60px" />
		       		 			<!-- <col width="90px" />
		       		 			<col width="90px" /> -->
		       		 			<col width="90px" />
		       		 			<col width="90px" />
		       		 			<col/>
				      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="客户头像"/></th>
			      		 		<th><ui:i18n key="客户昵称"/></th>
			      		 		<th><ui:i18n key="商户订单号"/></th>
			      		 		<th><ui:i18n key="商户名称"/></th>
			      		 		<th><ui:i18n key="付款金额"/></th>
			      		 		<th><ui:i18n key="发送状态"/></th>
			      		 		<th><ui:i18n key="错误信息"/></th>
			      		 		<th><ui:i18n key="IP地址"/></th>
			      		 		<%-- <th><ui:i18n key="活动名称"/></th>
			      		 		<th><ui:i18n key="备注"/></th> --%>
			      		 		<th><ui:i18n key="创建时间"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			 <c:forEach items="${list}" var="list" varStatus="status">
				           		<tr>
				           			<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.CUST_IMG_URL }">
				      		 		</td>
				           			<td >
				           				<span class="title" title="${list.CUST_NICK }">${list.CUST_NICK }</span>					
				           			</td>
				           			<td>
				           				<span class="title" title="${list.MCH_BILLNO }" style="width:141px;">${list.MCH_BILLNO }</span>
				           			</td>
				           			<td >
				           				<span class="title" title="${list.SEND_NAME }" >${list.SEND_NAME }</span>
				           			</td>
				           			<td >
				           				<%-- <span class="title" >${list.MSG_ID}${list.MSG_ID}</span> --%>
				           				<span class="title" style="width:70px;" title="${list.TOTAL_AMOUNT }">${list.TOTAL_AMOUNT}</span>
				           			</td>
				           			<td >
				           				<span class="title" title="${list.RED_PARK_STATUS_NM }">${list.RED_PARK_STATUS_NM}</span>
				           			</td>
				           			<td >
				           				<span class="title" title="${list.ERR_CODE }">${list.ERR_CODE}</span>	
				           			</td>
				           			<td>
				           				<span class="title" title="${list.CLIENT_IP }">${list.CLIENT_IP}</span>
				           			</td>
				           			<%-- <td>
				           				<span class="title" title="${list.ACT_NAME }">${list.ACT_NAME }</span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.REMARK }">${list.REMARK }</span>
				           			</td> --%>
				           			<td>
				           				<span><fmt:formatDate value="${list.CREATE_DT }" pattern="yyyy-MM-dd" /></span>
				           			</td>
				           		</tr>
				           	</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
	   			  <ui:paging page="${page }" />