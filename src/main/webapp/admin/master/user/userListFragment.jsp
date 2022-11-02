<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
			      	<table class="result-grid-table">
			      		 <colgroup>
				      		  <col width="12%"  />
				      		  <col width="10%"  />
				      		  <col width="7%"  />
				      		  <col width="10%"  />
				      		  <col width="10%"  />
				      		  <col width="10%"  />
		     		 			<col width="17%" />
		     		 			<col width="9%" />
		     		 			<col/>
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th colspan="2"><ui:i18n key="用户"/></th>
			      		 		<th><ui:i18n key="姓名"/></th>
			      		 		<th><ui:i18n key="微信账号"/></th>
			      		 		<th><ui:i18n key="系统账号"/></th>
			      		 		<th><ui:i18n key="手机号"/></th>
			      		 		<th><ui:i18n key="邮箱"/></th>
			      		 		<th><ui:i18n key="QQ"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${page.data}" var="item" varStatus="status">
			           			<tr>
			           				<td class="pic" style="text-align: left;">
										<img class="pic-small" src="${item.IMG_URL }" alt=""  style="margin-left:30px;margin-right:5px;"/>
			           				</td>
			           				<td style="text-align: left;"><span class="text-ellipsis">${item.USER_NICK_NM}</span></td>
			           				<td>
			           					<span  class="text-ellipsis" style="float:none;">${item.USER_REAL_NM }</span>
			           				</td>
			           				<td>
			           					<span>${item.WX_ID_U }</span>
			           				</td>
			           				<td class="span-msg-tbody"><span>${item.USER_ID }</span></td>
									<td class="span-msg-tbody"><span>${item.MOBILE_NO }</span></td>
									<td class="span-msg-tbody"><span class="text-ellipsis" style="float:none;">${item.EMAIL }</span></td>
									<td class="span-msg-tbody"><span>${item.QQ_ID }</span></td>
			           				<td>
			           					<span class="gridbutton red js-change-pass"  data-user-id="${item.USER_ID }"><ui:i18n key="修改密码"/></span>
										<span class="gridbutton red js-set-auth"  data-user-id="${item.USER_ID }"><ui:i18n key="设置权限"/></span>
										<c:if test="${item.ACTIVE_STS==0 }">
											<span class="gridbutton red js-user-authorize" data-user-id="${item.USER_ID }"><ui:i18n key="批准"/></span>
										</c:if>
										<c:if test="${item.ACTIVE_STS==1 }">
											<span class="gridbutton red js-user-lock" data-user-id="${item.USER_ID }"><ui:i18n key="停用"/></span>
										</c:if>
										<c:if test="${item.ACTIVE_STS==2 }">
											<span class="gridbutton green js-user-unlock"   data-user-id="${item.USER_ID }"><ui:i18n key="启用"/></span>
										</c:if>
									</td>
			           			</tr>
		           			</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
			      <ui:paging page="${page }" />