<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 

					<div class="result-data-warp" style="">
			   					<table class="result-grid-table">
						      		<colgroup>
					      		 			<col width="100px" />
					      		 			<col  />
					      		 			<col width="120px" />
					      		 			<col width="120px" />
					      		 		</colgroup>
						      		 <thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th><ui:i18n key="点击量排名"/></th>
						      		 		<th><ui:i18n key="商品名"/></th>
						      		 		<th><ui:i18n key="点击量"/></th>
						      		 		<th><ui:i18n key="销售量"/></th>
						      		 	</tr>
						      		 </thead>
						      		 <tbody  class="result-grid-tbody">
						      		 <c:forEach items="${page.data}" var="item">
						      		 	<tr>
						      		 		<td>${item.ID }</td>
						      		 		<td>${item.GOODS_NM }</td>
						      		 		<td>${item.CLICKS }</td>
						      		 		<td>${item.GOODS_CNT }</td>
						      		 	</tr>
						      		 </c:forEach>
						      		 </tbody>
						      	</table>
			   				</div>
					      	<ui:paging page="${page }" method="showPageTwo"/>