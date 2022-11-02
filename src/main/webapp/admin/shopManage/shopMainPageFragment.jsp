<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
				
				<div class="result-data-warp" style="">
	   					<table class="result-grid-table">
				      		<colgroup>
			      		 			<col width="20%" />
			      		 			<col width="20%" />
			      		 			<col width="23%" />
			      		 			<col width="37%" />
			      		 		</colgroup>
				      		 <thead class="result-grid-thead">
				      		 	<tr>
				      		 		<th><ui:i18n key="页面ID"/></th>
				      		 		<th><ui:i18n key="页面名称"/></th>
				      		 		<th><ui:i18n key="创建日期"/></th>
				      		 		<th><ui:i18n key="操作"/></th>
				      		 	</tr>
				      		 </thead>
				      		 <tbody  class="result-grid-tbody">
				      		 	<c:forEach items="${list }" var="list" varStatus="status">
				      		 	<tr>	
									<td>${list.PAGE_ID}</td>
									<td class="js-grid-gc-nm">${list.PAGE_NM}</td>
									<td class="js-grid-gexing-nm">${list.CREATED_DT} </td>
									<td class="js-grid-gexing-nm">
										<table style="width: 92%;margin-left: 4%;padding: 0;">
											<tr style="border: 0">
												<td style="width: 15%;padding: 0">
													<span class="gridbutton red"  onclick="review('${list.URL_PC}');"><ui:i18n key="预览"/></span>
												</td>
												<td style="width: 11%;padding: 0">
													<span class="gridbutton red"  onclick="window.location='/admin/shopManage/modifyCustomPageEditor.htm?pageId=${list.PAGE_ID}';"><ui:i18n key="编辑"/></span>
												</td>
												<td style="width: 26.5%;padding: 0">
													<c:choose>
														<c:when test="${list.MAIN_FLAG == '1' }">
															<span class="gridbutton red" ><ui:i18n key="使用中"/></span>
														</c:when>
														<c:otherwise>
															<span class="gridbutton" style="color: #d7d7d7;"  onclick="fn_Shop_Used(${list.HOME_FLAG}, '${list.PAGE_ID}');"><ui:i18n key="使用该首页"/></span>
														</c:otherwise>
													</c:choose>
												</td>
												<td style="width: 26.5%;padding: 0">
													<c:choose>
														<c:when test="${list.HOME_FLAG == '1' }">
															<span class="gridbutton red" ><ui:i18n key="使用中"/></span>
														</c:when>
														<c:otherwise>
															<span class="gridbutton" style="color: #d7d7d7;" onclick="fn_Main_Used(${list.MAIN_FLAG}, '${list.PAGE_ID}');"><ui:i18n key="使用该店铺"/></span>
														</c:otherwise>
													</c:choose>
												</td>
												<td style="width: 11%;padding: 0">
													<span class="gridbutton red"  onclick="fn_MainPage_Delete(0, '${list.PAGE_ID}','${list.SHOP_BUTTON}','${list.MAIN_BUTTON}');"><ui:i18n key="删除"/></span>
												</td>											
											</tr>
										</table>
									</td>
								</tr>
				      		 	</c:forEach>
				      		 </tbody>
				      	</table>
	   				</div>
			      	
			      	<ui:paging page="${page }" />
		      	
		      	