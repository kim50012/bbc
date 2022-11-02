<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" >
		 			<table class="result-grid-table">
			      		<colgroup>
				      		<col width="13%"  />
				      		<col width="15%"  />
		   		 			<col width="13%" />
		   		 			<col width="25%" />
		   		 			<col width="25%" />
		   		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="申请日期"/></th>
			      		 		<th><ui:i18n key="头像"/></th>
			      		 		<th >ID</th>
			      		 		<th><ui:i18n key="演讲标题"/></th>
			      		 		<th><ui:i18n key="评论内容"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${replylist}" var="list"  varStatus="status"> 
				      		 	<tr>
				      		 		<td  class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			<fmt:formatDate value="${list.CREATE_DT}" pattern="yyyy-MM-dd" />
				      		 		</td>
				      		 		<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.LECT_REPLY_HEAD }">
				      		 		</td>
				      		 		<td class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			${list.LECT_REPLY_NM }
				      		 		</td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.LECT_NM }">${list.LECT_NM }</span></td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.REPLY_DESC }">${list.REPLY_DESC }</span></td>
				      		 		<td  class="td-css"><div style="height:7px;"></div>
			      		 					<span class="gridbutton red"  onclick="deleteReplyMsg('${list.LECT_REPLY_ID}','${list.LECT_ID}')"><ui:i18n key="删除"/></span>
				      		 		</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
			      	</table>
		 		</div>
	 			<ui:paging page="${page }" />