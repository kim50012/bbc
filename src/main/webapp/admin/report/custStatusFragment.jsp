 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
			   			<div class="result-data-warp">
					      	<table class="result-grid-table" style="margin-bottom:30px;">
					      		<colgroup>
			       		 			<col width="25%" 	/>
			       		 			<col width="25%" 	/>
			       		 			<col width="25%" 	/>
			       		 			<col width="25%" 	/>
			       		 		</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th>
					           				<span><ui:i18n key="时间"/></span>					
					           			</th>
					           			<th>
					           				<span><ui:i18n key="新增粉丝"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="跑路粉丝"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="净增粉丝"/></span>
					           			</th>
					      		 	</tr>
					      		 </thead>
					      		 <tbody  class="result-grid-tbody">
					      		 	<c:forEach items="${list }" var="list" varStatus="status">
						           		<tr>
						           			<td>${list.FOLLOW_DT }</td>
						           			<td>${list.NEW_FANS }</td>
						           			<td>${list.OUT_FANS }</td>
						           			<td>${list.GROW_FANS }</td>
						           		</tr>
					           		</c:forEach>
					      		 </tbody>
				      		</table>
				      	</div>
			      	 <ui:paging page="${page }" />
			     