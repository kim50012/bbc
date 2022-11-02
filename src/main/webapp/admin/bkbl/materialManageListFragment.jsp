<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
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
			      		 	<c:forEach items="${list}" var="list" varStatus="status">
			           			<tr>
			           				<td class="pic">
		           						<c:if test="${list.FILE_TYPE==2}"> 
		           							<div class="musicImageDiv" onclick="musicDisplay(${list.FILE_ID});">
												<input type="hidden" value="${list.FULL_URL }"  id="muiscPlay${list.FILE_ID}" />
											</div>
										</c:if>
										<c:if test="${list.FILE_TYPE ==1}">
											<img class="pic-small" src="${list.FULL_URL }" alt="" />
										</c:if> 
										<c:if test="${ list.FILE_TYPE ==3}">
											<div class="videoShow">
												<img src="/admin/images/myFile/video_play.png" onclick="showVideo('${list.FULL_URL}');"/>
												<video id="videoShow${list.FILE_ID}" >
													<source src="${list.FULL_URL}" type="video/mp4">
													<source src="${list.FULL_URL}" type="video/ogg">
													<source src="${list.FULL_URL}" type="video/webm">
												</video>
											</div>
										</c:if>
			           				</td>
			           				<td>
			           					<div ></div>
			           					<span>${list.FILE_NM }</span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${list.CREATED_DT }</span>
			           				</td>
			           				<td style="position: relative;">
			           					<span class="gridbutton red"  onclick="bPoupDivDisplayConnect('connectPoupDiv${list.FILE_ID }');"><ui:i18n key="链接"/></span>
										<span class="gridbutton red" onclick="bPoupDivDisplay('updatePoupDiv${list.FILE_ID }');"><ui:i18n key="编辑"/></span>
			      		 				<span class="gridbutton red" onclick="deleteShopFile(${list.FILE_ID});"><ui:i18n key="删除"/></span>
		           						<div class="PoupDivConnect" id="connectPoupDiv${list.FILE_ID }">
									        <div class="PoupDivBody">
									            <div class="dropDown1"></div>
									            <div class="dropDown2"></div>
									            <div class="dropDown3"></div>
									        </div>
									        <div class="ui-box">
									        		<input style="margin-left:25px;"  type="text" id="text${list.FILE_ID }" readonly="readonly" value="<%=basePath %>${fn:substring(list.FULL_URL, 1, fn:length(list.FULL_URL)) }"/>
									        		<div class="submitDiv submit copy" onclick="copyUrl2(${list.FILE_ID })" id="textDiv${list.FILE_ID }" >
									        			<span data-item="${list.FILE_ID }" ><ui:i18n key="复制"/></span>
									        		</div>
											  		<%-- <input style="margin-left:30px;" type="text" readonly="readonly"  value="${list.FULL_URL }" id="fileUpdateUrl${list.FILE_ID }"/>
											  		<div class="submitDivsubmitcopy"  id="toClip${list.FILE_ID }" >
											  			<span data-item="${list.FILE_ID }">复制</span>
											  		</div> --%>
											  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${list.FILE_ID }');">
											  			<span><ui:i18n key="取消"/></span>
											  		</div>
											</div>
								    	</div> 
		           						
										<div class="PoupDiv" id="updatePoupDiv${list.FILE_ID }">
									        <div class="PoupDivBody" style="left:590px;">
									            <div class="dropDown1"></div>
									            <div class="dropDown2"></div>
									            <div class="dropDown3"></div>
									        </div>
									        <div class="ui-box">
										  		<span style="margin-left:20px;"><ui:i18n key="文件名称"/>：</span>
										  		<input type="text" value="${list.FILE_NM }" id="fileUpdateName${list.FILE_ID }"/>
										  		<div class="submitDiv submit" onclick="updateShopFile(${list.FILE_ID})">
										  			<span><ui:i18n key="确定"/></span>
										  		</div>
										  		<div class="submitDiv revise" onclick="cancelAction('updatePoupDiv${list.FILE_ID }');">
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
		      	 <!-- =============================== -->