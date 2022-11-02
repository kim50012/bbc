<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
      	<div class="result-grid pic">
	      		<div class="result-data-warp" style="">
			      	<table class="result-grid-table">
			      		 <colgroup>
				      		  <col width="10%"  />
		     		 			<col width="10%" />
		     		 			<col width="15%" />
							  <col width="10%"  />
		     		 			<col width="10%" />
		     		 			<col width="10%" />
								<col width="10%" />
		     		 			<col/>
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="消息ID"/></th>
			      		 		<th><ui:i18n key="类型"/></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="日期"/></th>
			      		 		<th><ui:i18n key="阅读量"/></th>
			      			<th><ui:i18n key="喜欢人数"/></th>
			      		 		<th><ui:i18n key="分享人数"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
		      		 	<c:forEach items="${page.data}" var="item" varStatus="status">
			      		 	<c:choose>
			    				<c:when test="${item.ITEM_CNT eq 1 }">
			           			<tr>
			           				<td >
			           					<div ></div>
			           					<span>${item.NEWS_ID }</span>
			           				</td>
			        				<td>
			           					<div ></div>
			           					<span>	
			           					<c:forEach items="${list }" var="list" varStatus="status">
											<c:if test="${list.CD_ID  eq item.NEWS_TYPE}">${list.CD_VAL}</c:if>
										</c:forEach>
			           					</span>
			           				</td>
			           				<td>
			           					<div ></div>
			           					<span>${item.MTITLE}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span><fmt:formatDate value="${item.CREATED_DT}" pattern="y-M-d"/></span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.READ_CNT}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span>${item.LIKE_CNT}</span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.SHARE_CNT}</span>
			           				</td>
			           				<td style="position: relative;">
			      		 				<span class="gridbutton red" onclick="deleteShopFile(${item.MSG_ID },${item.NEWS_ID });"><ui:i18n key="删除"/></span>
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
		           						
									</td>
			           			</tr>
		           				</c:when>
			    				<c:otherwise>
			    					<tr>
			           					<td >
			           					<div ></div>
			           					<span>${item.NEWS_ID }</span>
			           				</td>
			        				<td>
			           					<div ></div>
			           					<span>	
			           					<c:forEach items="${list }" var="list" varStatus="status">
											<c:if test="${list.CD_ID  eq item.NEWS_TYPE}">${list.CD_VAL}</c:if>
										</c:forEach>
			           					</span>
			           				</td>
			           				<td>
			           					<div ></div>
			           					<span>${item.MTITLE}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span><fmt:formatDate value="${item.CREATED_DT}" pattern="y-M-d"/></span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.READ_CNT}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span>${item.LIKE_CNT}</span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.SHARE_CNT}</span>
			           				</td>
			           				<td style="position: relative;">
			      		 				<span class="gridbutton red" onclick="deleteShopFile(${item.MSG_ID },${item.NEWS_ID });"><ui:i18n key="删除"/></span>
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
		           						
									</td>
			           			</tr>
			           		   <c:forEach items="${item.sublist}" var="subItem" varStatus="subStatus">
							        <c:if test="${item.NEWS_ID ne subItem.NEWS_ID}">
				    					<tr>
				           					<td >
				           					<div ></div>
				           					<span>${subItem.NEWS_ID }</span>
				           				</td>
				        				<td>
				           					<div ></div>
				           					<span>	
				           					<c:forEach items="${list }" var="list" varStatus="status">
												<c:if test="${list.CD_ID  eq subItem.NEWS_TYPE}">${list.CD_VAL}</c:if>
											</c:forEach>
				           					</span>
				           				</td>
				           				<td>
				           					<div ></div>
				           					<span>${subItem.MTITLE}</span>
				           				</td>
				           					<td>
				           					<div></div>
				           					<span><fmt:formatDate value="${subItem.CREATED_DT}" pattern="y-M-d"/></span>
				           				</td>
				           				<td>
				           					<div></div>
				           					<span>${subItem.READ_CNT}</span>
				           				</td>
				           					<td>
				           					<div></div>
				           					<span>${subItem.LIKE_CNT}</span>
				           				</td>
				           				<td>
				           					<div></div>
				           					<span>${subItem.SHARE_CNT}</span>
				           				</td>
				           				<td style="position: relative;">
				      		 				<span class="gridbutton red" onclick="deleteShopFile(${subItem.MSG_ID },${subItem.NEWS_ID });"><ui:i18n key="删除"/></span>
			           						<div class="PoupDivConnect" id="connectPoupDiv${subItem.FILE_ID }">
										        <div class="PoupDivBody">
										            <div class="dropDown1"></div>
										            <div class="dropDown2"></div>
										            <div class="dropDown3"></div>
										        </div>
										        <div class="ui-box">
										        		<input style="margin-left:25px;"  type="text" id="text${subItem.FILE_ID }" readonly="readonly" value="<%=basePath %>${fn:substring(subItem.FULL_URL, 1, fn:length(subItem.FULL_URL)) }"/>
										        		<div class="submitDiv submit copy"  id="textDiv${subItem.FILE_ID }" onclick="copyUrl2(${subItem.FILE_ID })" >
										        			<span data-item="${subItem.FILE_ID }" ><ui:i18n key="复制"/></span>
										        		</div>
												  		<%-- <input style="margin-left:30px;" type="text" readonly="readonly"  value="${item.FULL_URL }" id="fileUpdateUrl${item.FILE_ID }"/>
												  		<div class="submitDivsubmitcopy"  id="toClip${item.FILE_ID }" >
												  			<span data-item="${item.FILE_ID }">复制</span>
												  		</div> --%>
												  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${subItem.FILE_ID }');">
												  			<span><ui:i18n key="取消"/></span>
												  		</div>
												</div>
									    	</div> 
			           						
										</td>
				           			</tr>							        
									</c:if>
							     </c:forEach>
			    				</c:otherwise>
			    			</c:choose>	
		           			</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
			      <ui:paging page="${page }" /> 
		      </div>