<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="8%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="12%" />
		      		 			<col width="30%" />
		      		 			<col width="10%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="店铺ID"/></th>
			      		 		<th><ui:i18n key="图文消息ID"/></th>
			      		 		<th><ui:i18n key="Message ID"/></th>
			      		 		<th><ui:i18n key="HZM MsgId"/></th>
			      		 		<th><ui:i18n key="HZM NewsId"/></th>
			      		 		<th><ui:i18n key="图文消息标题"/></th>
			      		 		<th><ui:i18n key="时间"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.SHOP_ID }</td>
									<td>${list.MSGID}</td>
									<td>${list.WX_MSGID}</td>
									<td>
										<c:choose>
		           							<c:when test="${list.MSG_ID eq 0}">
		           							</c:when>
		           							<c:otherwise>
		           								${list.MSG_ID }
		           							</c:otherwise>
		           						</c:choose>
		           					</td>
									<td >
										<c:choose>
			           						<c:when test="${list.NEWS_ID  eq 0}">
			           						</c:when>
			           						<c:otherwise>
			           							${list.NEWS_ID }
			           						</c:otherwise>
			           					</c:choose>
									</td>
									<td style="text-align: left;"><span title="${list.TITLE }" class="title-limite">${list.TITLE }</span></td>
									<td ><span>${list.REF_DATE}</span></td>
									<td>
										<span class="gridbutton red"  onclick="modifyInterface(${list.WX_MSGID });"><ui:i18n key="编辑"/></span>
										<span class="gridbutton red" data-msgd0="${list.TITLE }" data-msgd1="${list.SHOP_ID }"  data-msgd2="${list.MSGID }" data-msgd3="${list.WX_MSGID}" data-msgd4="${list.MSG_ID }" data-msgd5="${list.NEWS_ID }" data-msgd6="${list.USER_SOURCE }" data-msgd7="${list.INT_PAGE_READ_USER }" data-msgd8="${list.INT_PAGE_READ_COUNT }" data-msgd9="${list.ORI_PAGE_READ_USER }" data-msgd10="${list.ORI_PAGE_READ_COUNT }" data-msgd11="${list.SHARE_USER }" data-msgd12="${list.SHARE_COUNT }" data-msgd13="${list.ADD_TO_FAV_USER }" data-msgd14="${list.ADD_TO_FAV_COUNT }"  onclick="showMsgDetail(${status.index});" id="detailMsg${status.index}">
											<ui:i18n key="详情"/>
										</span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />