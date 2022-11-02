<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
		   			<div class="result-data-warp">
			   			<table class="result-grid-table">
			      		 	<colgroup>
		      		 			<col width="10%" />
		       		 			<col width="24%" />
		       		 			<col width="8%" />
		       		 			<col width="15%" />
		       		 			<col width="15%" />
		       		 			<col width="10%" />
		       		 			<col width="8%" />
				      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="手机号码"/></th>
			      		 		<th><ui:i18n key="发送内容"/></th>
			      		 		<th><ui:i18n key="发送状态"/></th>
			      		 		<th><ui:i18n key="发送编号"/></th>
			      		 		<th><ui:i18n key="异常信息"/></th>
			      		 		<th><ui:i18n key="发送时间"/></th>
			      		 		<th><ui:i18n key="发送ID"/></th>
			      		 		<th><ui:i18n key="创建时间"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			 <c:forEach items="${list}" var="list" varStatus="status">
				           		<tr>
				           			<td >
				           				<span>${list.MOBILE }</span>					
				           			</td>
				           			<td>
				           				<span class="title" title="${list.CONTENT }">${list.CONTENT }</span>
				           			</td>
				           			<td >
				           				<span >${list.SEND_STATUS }</span>
				           			</td>
				           			<td >
				           				<%-- <span class="title" >${list.MSG_ID}${list.MSG_ID}</span> --%>
				           				<span  style="width:140px;" title="${list.MSG_ID}">${list.MSG_ID}</span>
				           			</td>
				           			<td >
				           				<span  class="title" title="${list.ERR_MSG }">${list.ERR_MSG}</span>
				           			</td>
				           			<td >
				           				${list.SEND_DT}	
				           			</td>
				           			<td>
				           				${list.SEND_ID}
				           			</td>
				           			<td>
				           				<span>${list.CREATE_DT }</span>
				           			</td>
				           		</tr>
				           	</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
	   			  <ui:paging page="${page }" />