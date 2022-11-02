<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 


					<div class="result-data-warp" style="">
		   					<table class="result-grid-table">
					      		<colgroup>
				      		 			<col width="20%" />
				      		 			<col width="25%" />
				      		 			<col width="25%" />
				      		 			<col width="30%" />
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
											<span class="gridbutton red"  onclick="review('${list.URL_PC}');"><ui:i18n key="预览"/></span>												
											<span class="gridbutton red"  onclick="window.location='/admin/shopManage/modifyUserDefinePageEditor.htm?pageId=${list.PAGE_ID}';"><ui:i18n key="编辑"/></span>
											<span class="gridbutton red"  onclick="deleteUserDefinePage(${list.PAGE_ID});"><ui:i18n key="删除"/></span>	
										</td>
									</tr>
					      		 	</c:forEach>
					      		 </tbody>
					      	</table>
		   				</div>
				      	
				      	<ui:paging page="${page }" />
			      	
			      	
			      	