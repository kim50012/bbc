<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
  				<div class="popup-content-warp">
			<div class="popup-content-item-warp">
				 <c:if test="${not empty page.data }">
				   <c:forEach items="${page.data }" var="item" varStatus="status">
						<div class="video-item-warp">
							<div class="js-video-item video-item" 
								data-file-id="${item.FILE_ID }" data-file-nm="${item.FILE_NM }" data-file-url="${item.FULL_URL }" >
								 <video id="video" width="245" height="145" controls autobuffer style="margin-top: 0;">
									 <source src="${item.FULL_URL }" type="video/mp4"></source>
									 <!-- <source src="/uploads/demo.mp4" type="video/mp4"></source> -->
								</video>
								<div class="selected_mask">
						            <div class="selected_mask_inner"></div>
						            <div class="selected_mask_icon"></div>
						        </div>
							</div>
							<div class="video-name" title="${item.FILE_NM }">
								${item.FILE_NM }
							</div>
						</div>
					 </c:forEach>
				   </c:if>
			</div>
		</div>	 
		<div style="padding-left: 30px;"> 
			<ui:paging page="${page }" showSize="false" position="right" btn1text="确认" btn2text="取消" />
		</div>