<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
					<table class="result-grid-table">
			      	 	<thead class="result-grid-thead">
			      		 	<tr>
				    		 	<th style="width: 150px"><ui:i18n key="表名" /></th>
				 		 		<th style="width: 140px"><ui:i18n key="字段名" /></th>
				 		 		<th style="width: 120px">CD_ID</th>
				 		 		<th style="width: 200px"><ui:i18n key="字段值" /></th>
				 		 		<th style="width: 170px"><ui:i18n key="字段描述" /></th>
				 		 		<th style="width: 120px"><ui:i18n key="状态" /></th>
				 		 		<th style="width: 100px"><ui:i18n key="操作" /></th>
				 		 	</tr>
				 		 	</thead>
				 		 	<tbody  class="result-grid-tbody" >
				  			 <c:choose>
								<c:when test="${requestScope.user.userAuth eq 'A' }">
									<c:forEach items="${list }" var="list">
							   		 	<tr>
							   		 		<td style="width: 150px"><span class="limit-span" title="${list.TB_NM }">${list.TB_NM }</span></td>
							   		 		<td style="width: 140px"><span class="limit-span" title="${list.FD_NM }">${list.FD_NM }</span></td>
							   		 		<td style="width: 120px">${list.CD_ID }</td>
							   		 		<td  style="width: 200px"><span class="limit-span" title="${list.CD_VAL }">${list.CD_VAL }</span></td>
							   		 		<td style="width: 170px">
							   		 			<span class="limit-span" title="${list.CD_DESC }">${list.CD_DESC }</span>
							   		 		</td>
							   		 		<td style="width: 120px">
							   		 			<c:if test="${list.IS_DELETE == 0 }"><ui:i18n key="启用" /></c:if>
							   		 			<c:if test="${list.IS_DELETE == 1 }"><ui:i18n key="禁用" /></c:if>
							   		 		</td>
							   		 		<td style="width: 100px">
							   		 			<span class="gridbutton red" onclick="javascript:showUpdatePoupe('${list.CD_ID}','${list.TB_NM}','${list.FD_NM }','${list.CD_VAL }','${list.CD_DESC }')"><ui:i18n key="编辑" /></span>
							   		 			<c:if test="${list.IS_DELETE == 0 }">
							   		 				<span class="gridbutton red" onclick="startOrstop('${list.CD_ID}','${list.IS_DELETE}','${list.TB_NM}','${list.FD_NM }');"><ui:i18n key="禁用" /></span>
							   		 			</c:if>
							   		 			<c:if test="${list.IS_DELETE == 1 }">
							   		 				<span class="gridbutton green" onclick="startOrstop('${list.CD_ID}','${list.IS_DELETE}','${list.TB_NM}','${list.FD_NM }');"><ui:i18n key="启用" /></span>
							   		 			</c:if>
							   		 		</td>
							   		 	</tr>
				   					 </c:forEach>
				   				</c:when>
					      	</c:choose>
			      		 </tbody>
		      		</table>
      			</div>
      			<ui:paging page="${page }" />