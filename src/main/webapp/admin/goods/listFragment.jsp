<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>

<div class="result-data-warp">
	<table class="result-grid-table">
			<colgroup>
 			<col width="84px" />
 			<col width="20%" />
 			<col width="18%" />
 			<col width="18%" />
 			<col width="18%" />
 			<col />
		</colgroup>
		<thead class="result-grid-thead">
			<tr>
				<th colspan="2"><ui:i18n key="商品名称"/></th>
				<th><ui:i18n key="标准分类"/>-<ui:i18n key="第1级"/></th>
				<th><ui:i18n key="标准分类"/>-<ui:i18n key="第2级"/></th>
				<th><ui:i18n key="标准分类"/>-<ui:i18n key="第3级"/></th>
				<th><ui:i18n key="操作"/></th>
			</tr>
		</thead>
		<tbody class="result-grid-tbody">
			<c:forEach items="${requestScope.reList}" var="items" varStatus="status">
			<tr>
				<td class="pic">
					<img class="pic-small" alt="" src="${items.goodsImg}">
				</td>
				<td class="text-left">${items.goodsNm}</td>
				<td>${items.goodsClassOneNm}</td>
				<td>${items.goodsClassTwoNm}</td>
				<td>${items.goodsClassThreeNm}</td>
				<td>
					<span class="gridbutton red" onclick="goPage('${items.goodsId}');"><ui:i18n key="编辑"/></span>
					<span class="gridbutton red" onclick="goodsDel('${items.goodsId}');"><ui:i18n key="删除"/></span>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<ui:paging page="${page}" /> 