<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 



				<div class="result-grid-header">
	   				<div class="result-grid-tools">
	   				   <span class="result-grid-tool" onclick="exportExcel();">
	      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出到Excel"/>
	      		   		</span>
	   				</div>
	   			</div>
				
				<table class="result-grid-table">
					 <colgroup>
							<col width="120px"  />
							<col width="120px" />
							<col width="280px" />
							<col width="280px" />
							<col width="90px" />
					</colgroup>
					 <thead class="result-grid-thead">
					 	<tr>
					 		<th><ui:i18n key="粉丝"/></th>
					 		<th></th>
					 		<th><ui:i18n key="消息内容"/></th>
					 		<th><ui:i18n key="回复内容"/></th>
					 		<th><ui:i18n key="操作"/></th>
					 	</tr>
					 </thead>
					 <tbody  class="result-grid-tbody">
					 <c:forEach items="${list }" var="list" varStatus="status"> 
					 	<tr>
					 		<td class="pic" style="padding-right: 0;">
					 			<img alt="" src="${list.WX_IF_HEADIMGURL}" class="pic-small" onclick="openChatWindow('${list.CUST_SYS_ID}');">
					 		</td>
					 		<td style="text-align: left;padding-top: 15px;">
					 			<div class="custNickNm" title="${list.CUST_NICK_NM }" onclick="openChatWindow('${list.CUST_SYS_ID}');">${list.CUST_NICK_NM }</div>
					 			<div style="margin-top: 35px">${list.GRADE_NM }</div>
					 		</td>
					 		<td>
	           					<span style="color:gray">${list.CUST_RECEIVE_DT }</span></br>
	           					<c:choose>
	           						<c:when test="${list.CUST_MSG_TYPE == 'text'}">
	           							<div class="text1" title="${list.CUST_CONTENT }">${list.CUST_CONTENT }</div>
	           						</c:when>
	           						<c:when test="${list.CUST_MSG_TYPE == 'image'}">
	           							<c:choose>
	           								<c:when test="${empty list.FULL_URL}">
	           									<img alt="" src="${list.CUST_PIC_URL }" class="img-send" onclick="showImg('${list.CUST_PIC_URL }')">
	           								</c:when>
	           								<c:otherwise>
	           									<img alt="" src="${list.FULL_URL }" class="img-send" onclick="showImg('${list.FULL_URL }')">
	           								</c:otherwise>
	           							</c:choose> 
	           						</c:when>
	           						<c:otherwise>
	           							暂无回复
	           						</c:otherwise>
	           					</c:choose>
							</td>
					 		<td>
			 					<span style="color:gray;">${list.SHOP_RECEIVE_DT }</span></br>			           	
	           					<c:choose>
	           						<c:when test="${list.SHOP_MSG_TYPE == 'text'}">
	           							<div class="text2" title="${list.SHOP_CONTENT }">${list.SHOP_CONTENT }</div>
	           						</c:when>
	           						<c:when test="${list.SHOP_MSG_TYPE == 'image'}">
	           							<c:choose>
	           								<c:when test="${empty list.FULL_URL}">
	           									<img alt="" src="${list.SHOP_PIC_URL }" class="img-send" onclick="showImg('${list.SHOP_PIC_URL }')">
	           								</c:when>
	           								<c:otherwise>
	           									<img alt="" src="${list.FULL_URL }" class="img-send" onclick="showImg('${list.FULL_URL }')">
	           								</c:otherwise>
	           							</c:choose>
	           						</c:when>
	           						<c:otherwise>
	           							<div class="text2">暂无回复</div> 
	           						</c:otherwise>
	           					</c:choose>	
					 		</td>
					 		<td>
					 			<span class="gridbutton red" onclick="openChatWindow('${list.CUST_SYS_ID}')"><ui:i18n key="回复"/></span>
					 		</td>
					 	</tr>
					 </c:forEach>
					 </tbody>
				</table>
				
				<ui:paging page="${page }" />