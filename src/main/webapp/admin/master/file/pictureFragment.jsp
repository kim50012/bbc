<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
<div class="popup-content-warp">
	<div class="popup-content-item-warp">
		 <c:if test="${not empty page.data }">
		   <c:forEach items="${page.data }" var="item" varStatus="status">
				<div class="picture-item">
					<div class="js-picture-img picture-img-warp" 
						data-file-id="${item.FILE_ID }" data-file-nm="${item.FILE_NM }" data-file-url="${item.FULL_URL }" >
						<img class="picture-img" alt="${item.FILE_NM }" src="${item.FULL_URL }" title="${item.FILE_NM }" />
						<div class="selected_mask">
				            <div class="selected_mask_inner"></div>
				            <div class="selected_mask_icon"></div>
				        </div>
					</div>
					<div class="picture-name">
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