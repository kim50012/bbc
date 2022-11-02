<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
  				<div class="result-data-warp">
  					<table class="result-grid-table">
		      		<colgroup>
	      		 			<col width="15%" />
	      		 			<col width="15%" />
	      		 			<col width="25%" />
	      		 			<col width="15%" />
	      		 			<col width="15%" />
	      		 			<col width="15%" />
	      		 	</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th><ui:i18n key="页面ID"/></th>
		      		 		<th><ui:i18n key="页面名称"/></th>
		      		 		<th><ui:i18n key="页面链接"/></th>
		      		 		<th><ui:i18n key="页面分类"/></th>
		      		 		<th><ui:i18n key="页面分类"/>2</th>
		      		 		<th><ui:i18n key="操作"/></th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody">
		      		 <c:forEach items="${list}" var="list">
		      		 	<tr>
		      		 		<td>${list.PAGE_TP }</td>
		      		 		<td><span class="limit-span" title="${list.PAGE_NM }">${list.PAGE_NM }</span></td>
		      		 		<td><span class="limit-span" title="${list.PAGE_URL }">${list.PAGE_URL }</span></td>
		      		 		<td><span class="limit-span" title="${list.PAGE_GROUP }">${list.PAGE_GROUP }</span></td>
		      		 		<td><span class="limit-span" title="${list.PAGE_GROUP2 }">${list.PAGE_GROUP2 }</span></td>
	      		 			<td>
		      		 			<span class="gridbutton red" onclick="showUpdatePoupe('${list.PAGE_TP}','${list.PAGE_NM }','${list.PAGE_URL }','${list.PAGE_GROUP }','${list.PAGE_GROUP2 }')"><ui:i18n key="编辑"/></span>
			      		 		<span class="gridbutton red" onclick="stop('${list.PAGE_TP}');"><ui:i18n key="删除"/></span>	
	      		 			</td>
      		 			</tr>
		      		 </c:forEach>
		      		 </tbody>
		      	</table>
  				</div>
	      	
	      	 	<ui:paging page="${page }" />
