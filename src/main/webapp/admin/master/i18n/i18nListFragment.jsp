<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
					<table class="result-grid-table">
			    	 	<thead class="result-grid-thead">
			    		 	<tr>
				 		 		<th style="width: 300px">ID</th>
				 		 		<th style="width: 300px"><ui:i18n key="中文" /></th>
				 		 		<th style="width: 300px"><ui:i18n key="韩文" /></th>
				 		 		<th style="width: 300px"><ui:i18n key="操作" /></th>
				 		 	</tr>
			 		 	</thead>
			 		 	<tbody  class="result-grid-tbody" >
				  			<c:choose>
								<c:when test="${requestScope.user.userAuth eq 'A' }">
									<c:forEach items="${page.data }" var="list">
										<tr>
											<td>${list.LABEL_ID }</td>
											<td>${list.LABEL_NM_CN }</td>
											<td>${list.LABEL_NM_KO }</td>
											<td>
						           				<span class="gridbutton red" onclick="showUpdatePoupe('${list.LABEL_ID}','${list.LABEL_NM_CN }','${list.LABEL_NM_KO }')"><ui:i18n key="编辑"/></span>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">${label.您没有操作权限}</td>
									</tr>
								</c:otherwise>
							</c:choose>
			 			</tbody>
					</table>
      			</div>
      			<ui:paging page="${page }" />