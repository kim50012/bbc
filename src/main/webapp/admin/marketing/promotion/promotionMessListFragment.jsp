<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				      		<div class="result-data-warp" style="">
						      	
						      	<table class="result-grid-table">
					      		 	<colgroup>
								      		<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="36%"/>
							      		</colgroup>
						      		 <thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th><ui:i18n key="客户"/>ID</th>
						      		 		<th><ui:i18n key="客户名称"/></th>
						      		 		<th><ui:i18n key="是否中奖"/></th>
						      		 		<th><ui:i18n key="留言时间"/></th>
						      		 		<th><ui:i18n key="留言内容"/></th>
						      		 	</tr>
						      		 </thead>
						      	</table>
						      	<div class="grid-fixed">
							      	<table class="result-grid-table fixed">
							      		<colgroup>
								      		<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="36%"/>
							      		</colgroup>
							      		<tbody  class="result-grid-tbody">
							      			<c:forEach items="${requestScope.reProMessList}" var="item" varStatus="status">
								      		 	<tr>
								      		 		<td>${item.MES_ID }</td>
								      		 		<td>${item.MES_NM }</td>
								      		 		<td>${item.WIN_TYPE_NM }</td>
								      		 		<td>${item.MES_DT_PC }</td>
								      		 		<td style="text-align: left;padding-left:10px; ">${item.MES_CONTENT }</td>
								      		 	</tr>
							      		 	</c:forEach>
							      		</tbody>
							      	</table>
							    </div>
								<ui:paging page="${page }" />
				      		</div>
