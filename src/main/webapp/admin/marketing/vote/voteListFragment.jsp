 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="55%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="投票名称"/></th>
			      		 		<th><ui:i18n key="投票人数"/></th>
			      		 		<th><ui:i18n key="状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${requestScope.reList}" var="items" varStatus="status">
								<tr>
									<td style="text-align: left;padding-left:30px;">${items.VOTE_NM}</td>
									<td>${items.VOTE_NUMBER}</td>
									<td>${items.VOTE_TYPE}</td>
									<td>
						           		<span class="gridbutton red"  onclick="javascript:popProblems('${items.VOTE_ID}');"><ui:i18n key="编辑"/></span>
										<span class="gridbutton red" onclick="voteDelete('${items.VOTE_ID}');"><ui:i18n key="删除"/></span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />