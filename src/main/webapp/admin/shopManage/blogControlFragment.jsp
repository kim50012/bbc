 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 


						<div class="result-grid-header">
				   				<div class="result-grid-tools">
				   				   <span class="result-grid-tool" onclick="window.location.href='/admin/blog/blogCreate.htm'">
				      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
				      		   		</span>
				      		   		<span class="result-grid-tool" onclick="openPoupMessage()" style="margin-left: 20px">
				      		   	 	 	<img alt="" src="/admin/images/cust/integral_01.png" /><ui:i18n key="Blog积分设定"/>
				      		   		</span>
				   				</div>
				   			</div>
				
							<table class="result-grid-table">
								 <colgroup>
										<col width="120px" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="20%" />
										<col width="20%" />
								</colgroup>
								 <thead class="result-grid-thead">
								 	<tr>
								 		<th><ui:i18n key="日志图片"/></th>
								 		<th><ui:i18n key="日志ID"/></th>
								 		<th><ui:i18n key="日志类型"/></th>
								 		<th><ui:i18n key="日志标题"/></th>
								 		<th><ui:i18n key="生成日期"/></th>
								 		<th><ui:i18n key="操作"/></th>
								 	</tr>
								 </thead>
								 <tbody  class="result-grid-tbody">
								 <c:forEach items="${list }" var="list" varStatus="status"> 
								 	<tr>
								 		<td class="pic">
								 			<img alt="" src="${list.BLOG_FILE_URL}" class="pic-small" onclick="openChatWindow('${list.CUST_SYS_ID}');">
								 		</td>
								 		<td>${list.BLOG_ID}</td>
								 		<td>${list.BLOG_GROUP_NM}</td>
								 		<td>${list.BLOG_TITLE}</td>
								 		<td>${list.CREATED_DT}</td>
								 		<td>
								 			<span class="gridbutton red" onclick="window.location.href='/admin/blog/blogModify.htm?blogId=${list.BLOG_ID }'"><ui:i18n key="编辑"/></span>
								 			<span class="gridbutton red" onclick="fn_MainPage_Delete(${list.BLOG_ID});" ><ui:i18n key="删除"/></span>
								 		</td>
								 	</tr>
								 </c:forEach>
								 </tbody>
							</table>
				
							<ui:paging page="${page }" />