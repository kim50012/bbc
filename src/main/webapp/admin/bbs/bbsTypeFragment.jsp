<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
	 		 	    <form action="">
 						<input type="hidden" id="cdId" value="${requestScope.list[0].CD_ID }">
	 		 	    </form>
				      		<div class="result-data-warp" style="">
						      	<table class="result-grid-table">
					      		 	<colgroup>
								      		<col width="30%"/>
					      		 			<col width="30%"/>
					      		 			<col width="40%"/>
							      		</colgroup>
						      		 <thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th>ID</th>
						      		 		<th>BBS<ui:i18n key="类型"/></th>
						      		 		<th><ui:i18n key="操作"/></th>
						      		 	</tr>
						      		 </thead>
						      	</table>
						      	<div class="grid-fixed">
							      	<table class="result-grid-table fixed">
							      		<colgroup>
								      		<col width="30%"/>
					      		 			<col width="30%"/>
					      		 			<col width="40%"/>
							      		</colgroup>
							      		<tbody  class="result-grid-tbody">
								      		<c:forEach items="${list }" var="list">
												<tr>
													<td> ${list.CD_ID}</td>
													<td>${list.CD_DESC}</td>
													<td>
														<span class="gridbutton red"><ui:i18n key="编辑" /></span>
														<c:if test="${list.IS_DELETE=='1'}">
															<span class="gridbutton green"  onclick="startOrstop('${list.CD_ID}','${list.IS_DELETE}');"><ui:i18n key="启用" /></span>
														</c:if>
														<c:if test="${list.IS_DELETE=='0'}">
															<span class="gridbutton red"  onclick="startOrstop('${list.CD_ID}','${list.IS_DELETE}');" ><ui:i18n key="停用" /></a>
														</c:if>	
													</td>
												</tr>
											</c:forEach>
							      		</tbody>
							      	</table>
							    </div>
<%-- 								<ui:paging page="${page }"   method="showMessPage"/> --%>
				      		</div>
