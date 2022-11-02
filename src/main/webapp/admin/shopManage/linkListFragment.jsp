 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 	<div class="result-data-warp">
		<table class="result-grid-table">
      	 	<thead class="result-grid-thead">
      		 	<tr>
      		 		<th style="width:25%;"><ui:i18n key="标题" /></th>
      		 		<th style="width:55%;"><ui:i18n key="链接" /></th>
      		 		<th style="width:20%;"><ui:i18n key="操作" /></th>
      		 	</tr>
      		 </thead>
      		 <tbody  class="result-grid-tbody" >
	      		<c:choose>
					<c:when test="${list!= null && fn:length(list) > 0}">
						<c:forEach items="${list}" var="item" varStatus="status">
							<tr>
								<td>${item.PAGE_NM}</td>
								<td>${item.URL}</td>
								<td>
									<span class="gridbutton red" onclick="bPoupDivDisplayConnect('connectPoupDiv${item.PAGE_ID}',1,'${item.URL }','${item.PAGE_ID}');"><ui:i18n key="链接"/></span>
									<span class="gridbutton red" onclick="bPoupDivDisplayConnect('connectPoupDiv${item.PAGE_ID}',2,'${item.URL }','${item.PAGE_ID}');"><ui:i18n key="完整链接"/></span>
									<div class="PoupDivConnect" id="connectPoupDiv${item.PAGE_ID }">
								        <div class="PoupDivBody">
								            <div class="dropDown1"></div>
								            <div class="dropDown2"></div>
								            <div class="dropDown3"></div>
								        </div>
								        <div class="ui-box">
								        		<input style="margin-left:20px;"  type="text" id="text${item.PAGE_ID }" readonly="readonly" value="${item.URL }"/>
								        		<div class="submitDiv submit copy"  id="textDiv${item.PAGE_ID }" onclick="copyUrl2(${item.PAGE_ID })">
								        			<span data-item="${item.PAGE_ID }" ><ui:i18n key="复制"/></span>
								        		</div>
										  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${item.PAGE_ID }');">
										  			<span><ui:i18n key="取消"/></span>
										  		</div>
										</div>
							    	</div>
				    	
								</td>
							</tr>
			        	</c:forEach>
			        	<tr style="border: 0;">
			        		<td colspan="3" style="height: 3px;border: 0;"></td>
			        	</tr>
			        </c:when>
		        </c:choose>
      		 </tbody>
     		</table>
		</div>
		<ui:paging page="${page }" />