<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>


				<div class="result-grid-header">
	   				<div class="result-grid-tools">
	   				   <span class="result-grid-tool" onclick="exportExcel();">
	      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出Excel"/>
	      		   		</span>
	   				</div>
	   			</div>
				
				<table class="result-grid-table">
					 <colgroup>
							<col width="120px" />
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
							<col width="190px" />
							<col width="100px" />
							<col width="200px" />
					</colgroup>
					 <thead class="result-grid-thead">
					 	<tr>
					 		<th><ui:i18n key="头像"/></th>
					 		<th><ui:i18n key="ID"/></th>
					 		<th><ui:i18n key="姓名"/></th>
					 		<th><ui:i18n key="年龄"/></th>
					 		<th><ui:i18n key="演讲题目"/></th>
					 		<th><ui:i18n key="咨询日期"/></th>
					 		<th><ui:i18n key="咨询内容"/></th>
					 	</tr>
					 </thead>
					 <tbody  class="result-grid-tbody">
					 <c:forEach items="${list }" var="list" varStatus="status"> 
					 	<tr>
					 		<td class="pic">
					 			<img alt="" src="${list.WX_IF_HEADIMGURL}" class="pic-small" onclick="openChatWindow('${list.CUST_SYS_ID}');">
					 		</td>
					 		<td>${list.CUST_NICK_NM}</td>
					 		<td>${list.ENTRY_NM}</td>
					 		<td>${list.AGE}</td>
					 		<td>${list.LECT_NM}</td>
					 		<td>${list.CREATE_DT}</td>
					 		<td class="text1" title="${list.REPLY_DESC}">${list.REPLY_DESC}</td>
					 	</tr>
					 </c:forEach>
					 </tbody>
				</table>
				
				<ui:paging page="${page }" />