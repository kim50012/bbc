<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
	<div class="result-data-warp" >
		 			<table class="result-grid-table">
			      		<colgroup>
				      		<col width="90px"  />
				      		<col width="90px"  />
		   		 			<col width="60px" />
		   		 			<col width="90px" />
		   		 			<col width="50px" />
		   		 			<col width="70px" />
		   		 			<col width="120px" />
		   		 			<col width="140px" />
		   		 			<col width="65px" />
		   		 			<col width="65px" />
		   		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="申请日期"/></th>
			      		 		<th><ui:i18n key="头像"/></th>
			      		 		<th >ID</th>
			      		 		<th><ui:i18n key="姓名"/></th>
			      		 		<th><ui:i18n key="年龄"/></th>
			      		 		<th><ui:i18n key="职业"/></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="原因"/></th>
			      		 		<th><ui:i18n key="申请人数"/></th>
			      		 		<th><ui:i18n key="申请状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${list}" var="list"  varStatus="status"> 
				      		 	<tr>
				      		 		<td  class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			<fmt:formatDate value="${list.CREATED_DT}" pattern="yyyy-MM-dd" />
				      		 		</td>
				      		 		<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.HEAD_IMG_URL }">
				      		 		</td>
				      		 		<td class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			${list.ENTRY_ID }
				      		 		</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.ENTRY_NM }</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.AGE }</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.JOB_NM }</td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.LECT_NM }">${list.LECT_NM }</span></td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.APPLY_REASON }">${list.APPLY_REASON }</span></td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.SEAT_NUM }</td>
				      		 		<td  class="td-css"><div style="height:7px;"></div>
			      		 				<c:if test="${list.STATUS_FLAG == 'I'}">
			      		 					<ui:i18n key="等待中"/>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'F'}">
			      		 					<ui:i18n key="已拒绝"/>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'S'}">
			      		 					<ui:i18n key="已批准"/>
			      		 				</c:if>
				      		 		</td>
				      		 		<td  class="td-css"><div style="height:7px;"></div>
				      		 			<c:if test="${list.STATUS_FLAG == 'I'}">
			      		 					<span class="gridbutton red"  onclick="modifyApplyMsg('${list.ENTRY_ID}','S','${list.LECT_ID}','${list.OPEN_ID	 }','${list.SEAT_NUM}');"><ui:i18n key="批准"/></span>
				      		 				<span class="gridbutton red"  onclick="modifyApplyMsg('${list.ENTRY_ID}','F','${list.LECT_ID}','${list.OPEN_ID	 }','${list.SEAT_NUM}');"><ui:i18n key="拒绝"/></span>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'F'}">
			      		 					<span class="gridbutton gray"  ><ui:i18n key="批准"/></span>
				      		 				<span class="gridbutton gray"  ><ui:i18n key="拒绝"/></span>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'S'}">
			      		 					<span class="gridbutton gray" ><ui:i18n key="批准"/></span>
				      		 				<span class="gridbutton gray" ><ui:i18n key="拒绝"/></span>
			      		 				</c:if>
				      		 		</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
			      	</table>
		 		</div>
	 			<ui:paging page="${page }" />