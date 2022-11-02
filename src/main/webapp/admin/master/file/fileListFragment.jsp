<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
			      	<table class="result-grid-table">
			      		 <colgroup>
				      		  <col width="20%"  />
		     		 			<col width="35%" />
		     		 			<col width="25%" />
		     		 			<col/>
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="预览"/></th>
			      		 		<th><ui:i18n key="文件名"/></th>
			      		 		<th><ui:i18n key="创建时间"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${page.data}" var="item" varStatus="status">
			           			<tr>
			           				<td class="pic">
		           						<c:if test="${item.FILE_TYPE==2}"> 
		           							<div class="musicImageDiv" onclick="musicDisplay(${item.FILE_ID});">
												<input type="hidden" value="${item.FULL_URL }"  id="muiscPlay${item.FILE_ID}" />
											</div>
										</c:if>
										<c:if test="${item.FILE_TYPE ==1}">
											<img class="pic-small" src="${item.FULL_URL }" alt="" />
										</c:if> 
										<c:if test="${ item.FILE_TYPE ==3}">
											<div class="videoShow">
												<img src="/admin/images/myFile/video_play.png" onclick="showVideo('${item.FULL_URL}');"/>
												<video id="videoShow${item.FILE_ID}" >
													<source src="${item.FULL_URL}" type="video/mp4">
													<source src="${item.FULL_URL}" type="video/ogg">
													<source src="${item.FULL_URL}" type="video/webm">
												</video>
											</div>
										</c:if>
			           				</td>
			           				<td>
			           					<div ></div>
			           					<span>${item.FILE_NM }</span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.CREATED_DT }</span>
			           				</td>
			           				<td style="position: relative;">
			           					<span class="gridbutton red"  onclick="bPoupDivDisplayConnect('connectPoupDiv${item.FILE_ID }');"><ui:i18n key="链接"/></span>
										<span class="gridbutton red" onclick="bPoupDivDisplay('updatePoupDiv${item.FILE_ID }');"><ui:i18n key="编辑"/></span>
			      		 				<span class="gridbutton red" onclick="deleteShopFile(${item.FILE_ID});"><ui:i18n key="删除"/></span>
		           						<div class="PoupDivConnect" id="connectPoupDiv${item.FILE_ID }">
									        <div class="PoupDivBody">
									            <div class="dropDown1"></div>
									            <div class="dropDown2"></div>
									            <div class="dropDown3"></div>
									        </div>
									        <div class="ui-box">
									        		<input style="margin-left:25px;"  type="text" id="text${item.FILE_ID }" readonly="readonly" value="<%=basePath %>${fn:substring(item.FULL_URL, 1, fn:length(item.FULL_URL)) }"/>
									        		<div class="submitDiv submit copy"  id="textDiv${item.FILE_ID }" onclick="copyUrl2(${item.FILE_ID })" >
									        			<span data-item="${item.FILE_ID }" ><ui:i18n key="复制"/></span>
									        		</div>
											  		<%-- <input style="margin-left:30px;" type="text" readonly="readonly"  value="${item.FULL_URL }" id="fileUpdateUrl${item.FILE_ID }"/>
											  		<div class="submitDivsubmitcopy"  id="toClip${item.FILE_ID }" >
											  			<span data-item="${item.FILE_ID }">复制</span>
											  		</div> --%>
											  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${item.FILE_ID }');">
											  			<span><ui:i18n key="取消"/></span>
											  		</div>
											</div>
								    	</div> 
		           						
										<div class="PoupDiv" id="updatePoupDiv${item.FILE_ID }">
									        <div class="PoupDivBody" style="left:590px;">
									            <div class="dropDown1"></div>
									            <div class="dropDown2"></div>
									            <div class="dropDown3"></div>
									        </div>
									        <div class="ui-box">
										  		<span style="margin-left:20px;"><ui:i18n key="文件名称"/>：</span>
										  		<input type="text" value="${item.FILE_NM }" id="fileUpdateName${item.FILE_ID }"/>
										  		<div class="submitDiv submit" onclick="updateShopFile(${item.FILE_ID})">
										  			<span><ui:i18n key="确定"/></span>
										  		</div>
										  		<div class="submitDiv revise" onclick="cancelAction('updatePoupDiv${item.FILE_ID }');">
										  			<span><ui:i18n key="取消"/></span>
										  		</div>
											</div>
								    	</div> 
									</td>
			           			</tr>
		           			</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
			      <ui:paging page="${page }" /> 