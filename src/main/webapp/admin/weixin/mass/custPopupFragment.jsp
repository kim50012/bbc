<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
 <style>
.cust-item-warp{float:left;margin-top:15px;margin-left:20px;width:80px;height:100px;}
.cust-item-warp .cust-item{position:relative;width:80px;height:80px;border:1px solid #eee;cursor:pointer;}
.cust-item-warp .cust-item .cust-head-img{width:100%;height:100%;}
.cust-name{display:-webkit-box;overflow:hidden;margin-top:3px;color:#a2a2a2;vertical-align:bottom;text-align:center;text-overflow:-o-ellipsis-lastline;text-overflow:ellipsis;font-size:12px;-webkit-box-orient:vertical;word-break:break-word;-webkit-line-clamp:1;}
.cust-item.selected .selected_mask{position:absolute;top:0;left:0;width:100%;height:100%;}
.cust-item.selected .selected_mask_inner{width:100%;height:100%;background-color:#000;opacity:.4;-moz-opacity:.4;-khtml-opacity:.4;filter:alpha(opacity=40);}
.cust-item.selected .selected_mask_icon{position:absolute;top:0;left:0;display:inline-block;width:100%;height:100%;background:transparent url(/admin/images/sendMsgAll/icon_choice.png) no-repeat 0 0;background-position:50% 50%;vertical-align:middle;}
 
 
 </style>
 
<div class="popup-content-warp">
	<div class="popup-content-item-warp">
		 <c:if test="${not empty page.data }">
		   <c:forEach items="${page.data }" var="item" varStatus="status">
				<div class="cust-item-warp">
					<div class="js-cust-item cust-item" 
						data-cust-sys-id="${item.CUST_SYS_ID }"  data-cust-nick-nm="${item.WX_IF_NICK_NM }" data-openid="${item.WX_IF_OPENID_P }">
						<img class="cust-head-img" alt="${item.WX_IF_NICK_NM }" src="${item.WX_IF_HEADIMGURL }" title="${item.WX_IF_NICK_NM }" />
						<div class="selected_mask">
				            <div class="selected_mask_inner"></div>
				            <div class="selected_mask_icon"></div>
				        </div>
					</div>
					<div class="cust-name">
						${item.WX_IF_NICK_NM }
					</div>
				</div>
			 </c:forEach>
		   </c:if>
	</div>
</div>	 
<div style="padding-left: 30px;"> 
	<ui:paging page="${page }" showSize="false" position="right" btn1text="确认" btn2text="取消" />
</div>