<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>

<div class="result-data-warp">
	<table class="result-grid-table">
		<colgroup>
			<col width="60px" />
 			<col width="80px" />
 			<col width="80px" />
 			<col width="80px" />
 			<col width="60px" />
 			<col width="40px" />
 			<col width="40px" />
 			<col width="40px" />
 			<col width="40px" />
 			<col width="100px" />
		</colgroup>
		<thead class="result-grid-thead">
			<tr>
   		 		<th><ui:i18n key="店铺ID"/></th>
   		 		<th><ui:i18n key="分析统计ID"/></th>
   		 		<th><ui:i18n key="生成日期"/></th>
   		 		<th><ui:i18n key="年月日"/></th>
   		 		<th><ui:i18n key="年月"/></th>
   		 		<th><ui:i18n key="年"/></th>
   		 		<th><ui:i18n key="月"/></th>
   		 		<th><ui:i18n key="天"/></th>
   		 		<th><ui:i18n key="小时"/></th>
   		 		<th><ui:i18n key="OPENID"/></th>
   		 	</tr>
		</thead>
		<tbody class="result-grid-tbody">
			<c:forEach items="${list}" var="list" varStatus="status">
				<tr>
					<td>
           				<span class="title" title="${list.SHOP_ID}">${list.SHOP_ID}</span>
      		 		</td>
           			<td>
           				<span class="title" title="${list.AM_ID}">${list.AM_ID}</span>					
           			</td>
           			<td>
           				<span><fmt:formatDate value="${list.AM_DT}" pattern="yyyy-MM-dd" /></span>
           			</td>
           			<td>
           				<span class="title" title="${list.AM_YMD}">${list.AM_YMD}</span>
           			</td>
           			<td>
           				<span class="title" title="${list.AM_YM}">${list.AM_YM}</span>
           			</td>
           			<td>
           				<span class="title" title="${list.AM_YY}">${list.AM_YY}</span>
           			</td>
           			<td>
           				<span class="title" title="${list.AM_MM}">${list.AM_MM}</span>	
           			</td>
           			<td>
           				<span class="title" title="${list.AM_DD}">${list.AM_DD}</span>
           			</td>
           			<td>
           				<span class="title" title="${list.AM_HOUR}">${list.AM_HOUR}</span>
           			</td>
           			<td>
           				<span class="title" title="${list.OPENID}">${list.OPENID}</span>
           			</td>
           		</tr>
           	</c:forEach>
		</tbody>
    </table>
</div>
<ui:paging page="${page}" />