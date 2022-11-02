<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp">
	<table class="result-grid-table">
		<colgroup>
			<col width="120px"  />
			<col width="200px" />
			<col width="200px" />
			<col width="180px" />
			<col />
		</colgroup>
		 <thead class="result-grid-thead">
	 		<tr>
	 			<th><ui:i18n key="客服头像"/></th>
				<th><ui:i18n key="客服工号"/></th>
				<th><ui:i18n key="客服昵称"/></th>
				<th><ui:i18n key="客服账号"/></th>
				<th><ui:i18n key="操作"/></th>
			</tr>
		</thead>
		<tbody  class="result-grid-tbody">
			<c:forEach items="${page.data }" var="item" varStatus="status"> 
				<tr>
					<td class="pic" style="padding-right: 0;">
						<img alt="" src="${item.KF_HEADIMGURL}" class="pic-small" >
					</td>
	 				<td>${item.KF_ID }</td>
					<td>${item.KF_NICK }</td>
					<td>${item.KF_ACCOUNT }</td>
					<td>
						<span class="gridbutton red "  data-id="${item.SEQID }" onclick="modify(${item.SEQID });"><ui:i18n key="修改"/></span>
						<span class="gridbutton red "  data-id="${item.SEQID }" onclick="del(${item.SEQID });"><ui:i18n key="删除"/></span>
		 			</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<ui:paging page="${page }" />