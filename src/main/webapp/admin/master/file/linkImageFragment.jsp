<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <div class="popup-content-warp">
	<div class="popup-content-item-warp">
		 <c:if test="${not empty page.data }">
		   <c:forEach items="${page.data }" var="item" varStatus="status">
				<div class="picture-item">
					<div class="js-picture-img picture-img-warp" 
							data-id="${item.DISPLAY_ID }" 
							data-page-id="${item.PAGE_ID }" 
							data-page-name="${item.PAGE_NM }" 
							data-link-url="${item.URL }" 
							data-img-file-id="${item.IMG_FILE_ID }" 
							data-img-file-url="${item.GOODS_LIST_IMG_URL}" 
						 >
						<img class="picture-img" alt="${item.PAGE_NM }" src="${item.GOODS_LIST_IMG_URL }" title="${item.PAGE_NM }" />
						<div class="selected_mask">
				            <div class="selected_mask_inner"></div>
				            <div class="selected_mask_icon"></div>
				        </div>
					</div>
					<div class="picture-name">
						${item.PAGE_NM }
					</div>
				</div>
			 </c:forEach>
		   </c:if>
	</div>
</div>	 
<div style="padding-left: 30px;"> 
	<ui:paging page="${page }" showSize="false" position="right" btn1text="确认" btn2text="取消" />
</div>
