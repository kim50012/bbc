<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
   				<div class="result-data-warp">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="20%" />
		      		 			<col width="10%" />
		      		 			<col width="35%" />
		      		 			<col width="15%" />
		      		 			<col width="20%" />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="运费模板"/></th>
			      		 		<th><ui:i18n key="指定区域"/></th>
			      		 		<th><ui:i18n key="配送区域"/></th>
			      		 		<th><ui:i18n key="创建日期"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 <c:forEach items="${sheetList}" var="item">
			      		 	<tr>
			      		 		<td>${item.TRANS_SHEET_NM }</td>
			      		 		<td>
									<c:if test="${item.AREA eq 0}">
			           					<ui:i18n key="省"/>
			           				</c:if>
			           				<c:if test="${item.AREA eq 1}">
			           					<ui:i18n key="市"/> 
			           				</c:if>
								</td>
			      		 		<td> 
			      		 			<c:choose>
			      		 				<c:when test="${item.TO_AREA_CNT eq 31}">
			      		 					<ui:i18n key="全部省份"/>
			      		 				</c:when>
			      		 				<c:otherwise>
			      		 					<ui:ellipsis length="30" value="${item.TO_AREA_NM}" /> 
			      		 				</c:otherwise>
			      		 			</c:choose>	
			      		 		</td>
			      		 		<td> <ui:date value="${item.CREATED_DT}" pattern="date" /> </td>
			      		 		<td>
			      		 			<span class="gridbutton red"  onclick="modifySheet(${item.TRANS_SHEET_ID });"><ui:i18n key="编辑"/></span>
			      		 			<span class="gridbutton red" onclick="deleteSheet(${item.TRANS_SHEET_ID });"><ui:i18n key="删除"/></span>
			      		 		</td>
			      		 	</tr>
			      		 </c:forEach>
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" /> 
		      	 <!-- =============================== -->