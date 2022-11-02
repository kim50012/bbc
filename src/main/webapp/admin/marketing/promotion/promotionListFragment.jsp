<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 


			<div class="result-data-warp">
				<table class="result-grid-table">
					<colgroup>
						<col width="32%"  />
    		 			<col width="10%" />
    		 			<col width="10%" />
    		 			<col width="10%" />
    		 			<col width="10%" />
    		 			<col width="28%" />
    		 			<col/>
					</colgroup>
		      	 	<thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th><ui:i18n key="活动名称" /></th>
		      		 		<th><ui:i18n key="开始日期" /></th>
		      		 		<th><ui:i18n key="结束日期" /></th>
		      		 		<th><ui:i18n key="状态" /></th>
		      		 		<th><ui:i18n key="中奖信息" /></th>
		      		 		<th><ui:i18n key="操作" /></th>
		      		 	</tr>
					</thead>
					<tbody class="result-grid-tbody" >
						<c:forEach items="${requestScope.reProList}" var="items" varStatus="status">
							<tr>
								<td class="pic">
									<div class="proTitleImg">
										<img class="pic-small" src="${items.PRO_PIC_URL}">
									</div>
									<div class="proTitleText">
										<span title="${items.PRO_TITLE}" class="limit-title">${items.PRO_TITLE}</span>
									</div>
								</td>
								<td>
									${items.PRO_START_DT_PC}
								</td>
								<td>
									${items.PRO_END_DT_PC}
								</td>
								<td>
									${items.PRO_TYPE_NM}
								</td>
								<td>
									${items.PRO_WIN_TYPE_NM}
								</td>
								<td>
									<span class="gridbutton red" onclick="javascript:popPublish('${items.PRO_ID}');"><ui:i18n key="编辑" /></span>
									<c:choose>
										<c:when test="${items.PRO_TYPE eq 'E'}" >
											<span class="gridbutton green" onclick="javascript:runOpton('${items.PRO_ID}','I');"><ui:i18n key="启用" /></span>
										</c:when>
										<c:otherwise>
											<span class="gridbutton red" onclick="javascript:runOpton('${items.PRO_ID}','E');"><ui:i18n key="停用" /></span>
										</c:otherwise>
									</c:choose>
									<span class="gridbutton red" onclick="javascript:popMessShow('${items.PRO_ID}');"><ui:i18n key="留言" /></span>
									<c:choose>
										<c:when test="${items.PRO_WIN_TYPE eq 'Y'}">
											<span class="gridbutton gray"><ui:i18n key="中奖" />1</span>
										</c:when>
										<c:otherwise>
											<span class="gridbutton red" onclick="javascript:popWinShow('${items.PRO_ID}');"><ui:i18n key="中奖" />1</span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<ui:paging page="${page }" />
	   				