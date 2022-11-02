<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 

 
<div style=" border-top: 1px solid #eee; border-bottom: 1px solid #eee;">
	<div class="popup-content-warp" style="border-top: 0; border-bottom: 0;">
		<div class="popup-content-item-warp" style="margin-left: 10px; margin-right: 20px;">
 
			<!--  ==== -->
			<%-- 第1列 --%>
			 	<div style="width: 300px; float: left; margin-top: 20px;">
					<c:forEach items="${page.data}" var="item" varStatus="status">
						<c:if test="${status.index  % 2 eq 0}">
			    			<c:choose>
			    				<c:when test="${item.ITEM_CNT eq 1 }">
				    				<div class="appmsg" data-id="${item.MSG_ID }" data-newid="${item.NEWS_ID }" data-fileid="${item.MSG_ID }">
									    <div class="appmsg_content">
									    	<h4 class="appmsg_title">
									    		<a href="javascript:void(0);" target="_blank">
									    			${item.MTITLE }
									    		</a>
								    		</h4>
								            <div class="appmsg_info">
								                <em class="appmsg_date"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="M月d日"/></em>
								            </div>
								            <div class="appmsg_thumb_wrp">
								            	<img src="${item.FILE_URL }" alt="" class="appmsg_thumb">
								            </div>
							            	<p class="appmsg_desc">${item.MDIGEST }</p>
								    	</div>
								    	<div class="appmsg_mask"></div>
								    	<i class="icon_card_selected">${label.已选择}</i>
								    	<div class="appmsg_edit"  data-id="${item.MSG_ID }" onclick="newsfeedModify(${item.MSG_ID });" ><span><ui:i18n key="编辑"/></span></div>
								    	<div class="appmsg_del"  data-id="${item.MSG_ID }"  onclick="newsfeedDel(${item.MSG_ID });" ><span><ui:i18n key="删除"/></span></div>
									</div>
			    				</c:when>
			    				<c:otherwise>
				    				<div class="appmsg multi" data-id="${item.MSG_ID }" data-newid="${item.NEWS_ID}" data-fileid="${item.MSG_ID }">
						    			<div class="appmsg_content">
								         	<%--    
								         	<div class="appmsg_info">
								                <em class="appmsg_date"> <fmt:formatDate value="<%=new java.util.Date() %>" pattern="M月d日"/></em>
								            </div>
								          	--%>
								            <div class="cover_appmsg_item">
								                <h4 class="appmsg_title"><a href="javascript:void(0);" target="_blank">${item.MTITLE }</a></h4>
								                <div class="appmsg_thumb_wrp">
								                	<img src="${item.FILE_URL }" alt="" class="appmsg_thumb">
								                </div>
								            </div>
								             <c:forEach items="${item.sublist}" var="subItem" varStatus="subStatus">
								             	<c:if test="${item.NEWS_ID ne subItem.NEWS_ID}">
										            <div class="appmsg_item">
										                <img src="${subItem.FILE_URL }" alt="" class="appmsg_thumb">
										                <h4 class="appmsg_title">
										                	<a href="javascript:void(0);" target="_blank">
										                		${subItem.MTITLE } 
										                	</a>
										                </h4>
										            </div>
								             	</c:if>
								             </c:forEach>
						    			</div>
						    			<div class="appmsg_mask"></div>
						    			<i class="icon_card_selected">${label.已选择}</i>
						    			<div class="appmsg_edit"  data-id="${item.MSG_ID }" onclick="newsfeedModify(${item.MSG_ID });" ><span><ui:i18n key="编辑"/></span></div>
								    	<div class="appmsg_del"  data-id="${item.MSG_ID }"  onclick="newsfeedDel(${item.MSG_ID });" ><span><ui:i18n key="删除"/></span></div>
									</div>
			    				</c:otherwise>
			    			</c:choose>	
						</c:if>
					</c:forEach>
			 	</div>  
			 	<%-- 第2列 --%>
			 	<div style="width: 300px; float: left; margin-top: 20px;">
					<c:forEach items="${page.data}" var="item" varStatus="status">
						<c:if test="${status.index  % 2 eq 1}">
			    			<c:choose>
			    				<c:when test="${item.ITEM_CNT eq 1 }">
				    				<div class="appmsg" data-id="${item.MSG_ID }" data-newid="${item.NEWS_ID }" data-fileid="${item.MSG_ID }">
									    <div class="appmsg_content">
									    	<h4 class="appmsg_title">
									    		<a href="javascript:void(0);" target="_blank">
									    			${item.MTITLE }
									    		</a>
								    		</h4>
								            <div class="appmsg_info">
								                <em class="appmsg_date"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="M月d日"/></em>
								            </div>
								            <div class="appmsg_thumb_wrp">
								            	<img src="${item.FILE_URL }" alt="" class="appmsg_thumb">
								            </div>
							            	<p class="appmsg_desc">${item.MDIGEST }</p>
								    	</div>
								    	<div class="appmsg_mask"></div>
								    	<i class="icon_card_selected">${label.已选择}</i>
								    	<div class="appmsg_edit"  data-id="${item.MSG_ID }" onclick="newsfeedModify(${item.MSG_ID });" ><span><ui:i18n key="编辑"/></span></div>
								    	<div class="appmsg_del"  data-id="${item.MSG_ID }"  onclick="newsfeedDel(${item.MSG_ID });" ><span><ui:i18n key="删除"/></span></div>
									
									</div>
			    				</c:when>
			    				<c:otherwise>
				    				<div class="appmsg multi" data-id="${item.MSG_ID }"  data-newid="${item.NEWS_ID }"  data-fileid="${item.MSG_ID }">
						    			<div class="appmsg_content">
								         	<%--    
								         	<div class="appmsg_info">
								                <em class="appmsg_date"> <fmt:formatDate value="<%=new java.util.Date() %>" pattern="M月d日"/></em>
								            </div>
								          	--%>
								            <div class="cover_appmsg_item">
								                <h4 class="appmsg_title"><a href="javascript:void(0);" target="_blank">${item.MTITLE }</a></h4>
								                <div class="appmsg_thumb_wrp">
								                	<img src="${item.FILE_URL }" alt="" class="appmsg_thumb">
								                </div>
								            </div>
								             <c:forEach items="${item.sublist}" var="subItem" varStatus="subStatus">
								             	<c:if test="${item.NEWS_ID ne subItem.NEWS_ID}">
										            <div class="appmsg_item">
										                <img src="${subItem.FILE_URL }" alt="" class="appmsg_thumb">
										                <h4 class="appmsg_title">
										                	<a href="javascript:void(0);" target="_blank">
										                		${subItem.MTITLE } 
										                	</a>
										                </h4>
										            </div>
								             	</c:if>
								             </c:forEach>
						    			</div>
						    			<div class="appmsg_mask"></div>
						    			<i class="icon_card_selected">${label.已选择}</i>
								    	<div class="appmsg_edit"  data-id="${item.MSG_ID }" onclick="newsfeedModify(${item.MSG_ID });" ><span><ui:i18n key="编辑"/></span></div>
								    	<div class="appmsg_del"  data-id="${item.MSG_ID }"  onclick="newsfeedDel(${item.MSG_ID });" ><span><ui:i18n key="删除"/></span></div>
									
									</div>
			    				</c:otherwise>
			    			</c:choose>	
						</c:if>
					</c:forEach>
			 	</div>  
			<!--  ==== -->
				 
			  
		</div>
			
	</div>
</div>
			<div style="padding-left: 30px;"> 
				<ui:paging page="${page }" showSize="false" position="right" btn1text="确认" btn2text="取消" />
			</div>
	 