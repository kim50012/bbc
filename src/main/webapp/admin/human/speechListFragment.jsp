<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>

<div class="result-data-warp">
	<table class="result-grid-table">
			<colgroup>
 			<col width="84px" />
 			<col width="20%" />
 			<col width="12%" />
 			<col width="25%" />
 			<col width="9%" />
 			<col width="8%" />
 			<col />
		</colgroup>
		<thead class="result-grid-thead">
			<tr>
				<th><ui:i18n key="演讲图片"/></th>
				<th><ui:i18n key="演讲题目"/></th>
				<th><ui:i18n key="演讲日期"/></th>
				<th><ui:i18n key="演讲介绍"/></th>
				<th><ui:i18n key="主讲人姓名"/></th>
				<th><ui:i18n key="状态"/></th>
				<th><ui:i18n key="操作"/></th>
			</tr>
		</thead>
		<tbody class="result-grid-tbody">
			<c:forEach items="${requestScope.list}" var="items" varStatus="status">
			<tr>
				<td class="pic">
					<img class="pic-small" alt="" src="${items.BANNER_URL}">
				</td>
				<td>${items.LECT_NM}</td>
				<td>${items.LECT_DT}</td>
				<td><div style="overflow-y: auto; height: 70px; text-align: left;">${items.LECT_DESC}</div></td>
				<td>${items.LECTURER_NM}</td>
				<td>${items.STATUS_NM}</td>
				<td>
					<c:choose>
						<c:when test="${items.STATUS eq 1}">
							<span class="gridbutton red" onclick="goPage('${items.LECT_ID}','N');"><ui:i18n key="编辑"/></span>
							<span class="gridbutton red" onclick="goodsDel('${items.LECT_ID}');"><ui:i18n key="删除"/></span>
							<span class="gridbutton red" onclick="goodsEnd('${items.LECT_ID}','E');"><ui:i18n key="结束"/></span>
						</c:when>
						<c:otherwise>
							<span class="gridbutton red" onclick="goPage('${items.LECT_ID}','E');"><ui:i18n key="编辑"/></span>
							<span class="gridbutton red2"><ui:i18n key="删除"/></span>
							<span class="gridbutton red2"><ui:i18n key="结束"/></span>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<ui:paging page="${page}" /> 