<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<form action="">
	<div class="form-warp clearfix" >
		<div class="control-warp"  >
			<div class="form-label" style="width: 100px;">
				<ui:i18n key="菜单名"/><a class="label-required"></a> : 
			</div>
			<div class="form-control">
				<input type="text"  class="js-menu-name w30" placeholder="" value="${custMenu.MENU_NM }"  >
			</div>
		</div> 
		<div class="control-warp"  >
			<div class="form-label" style="width: 100px;">
				<ui:i18n key="菜单类型"/><a class="label-required"></a> : 
			</div>
			<div class="form-control">
				<input class="icradio js-send-msg" type="radio" name="iCheck" <c:if test="${custMenu.MENU_OP_TYPE eq 'click' }"> checked="checked" data-page-id="${custMenu.MENU_OP_ID }" </c:if>>&nbsp;&nbsp;<ui:i18n key="发送信息"/>
				 &nbsp;&nbsp;&nbsp;
				<input class="icradio js-url" type="radio" name="iCheck" <c:if test="${custMenu.MENU_OP_TYPE eq 'view' }"> checked="checked" </c:if>>&nbsp;<ui:i18n key="跳转到网页"/>
				 &nbsp;&nbsp;&nbsp;
				<%-- <input class="icradio js-scancode-push" type="radio" name="iCheck" <c:if test="${custMenu.MENU_OP_TYPE eq 'scancode_push' }">  checked="checked"  data-page-id="${custMenu.MENU_OP_ID }" </c:if>>&nbsp;<ui:i18n key="扫码"/>
				 &nbsp;&nbsp;&nbsp;
				<input class="icradio js-scancode-waitmsg" type="radio" name="iCheck" <c:if test="${custMenu.MENU_OP_TYPE eq 'scancode_waitmsg' }">  checked="checked"  data-page-id="${custMenu.MENU_OP_ID }" </c:if>>&nbsp;<ui:i18n key="扫码且提示"/>
				 --%>
			</div>
		</div> 
		<div class="control-warp"  >
			<div class="form-label" style="width: 100px; vertical-align: top;">
				<c:choose>
					<c:when test="${custMenu.MENU_OP_TYPE eq 'click' }">
						 <span class="js-send-type-label"><ui:i18n key="发送内容"/><a class="label-required"></a> :</span> 
					</c:when>
					<c:when test="${custMenu.MENU_OP_TYPE eq 'view' }">
						 <span class="js-send-type-label"><ui:i18n key="网页地址"/><a class="label-required"></a> :</span> 
					</c:when>
					<c:otherwise>
						 
					</c:otherwise>
				</c:choose>
			</div>
			<div class="form-control js-send-msg-warp" data-page-id="">
					<c:choose>
						<c:when test="${custMenu.MENU_OP_TYPE eq 'click' }">
							<input type="text" class="js-menu-contents w30" readonly="readonly" value="${custMenu.MENU_OP_TITLE }" />
							<textarea class="js-link-url w30" cols="100" style="height: 60px; resize: none; display: none;" readonly="readonly"  ></textarea>
							<span class="button bg-orange js-preview"  style="vertical-align: top; margin-left: 5px;">
								<span class="button-name"><ui:i18n key="预览"/></span>
							</span>
							<span class="button bg-orange js-input" style="vertical-align: top; margin-left: 5px; display: none;">
								<span class="button-name"><ui:i18n key="插入"/></span>
							</span>
						</c:when>
						<c:otherwise>
							<input type="text" class="js-menu-contents w30"  readonly="readonly"  style="display: none;" />
							<textarea class="js-link-url w30" cols="100" style="height: 60px; resize: none;"  readonly="readonly">${custMenu.MENU_OP_COM }</textarea>
							<span class="button bg-orange js-preview"  style="vertical-align: top; margin-left: 5px; display: none;">
								<span class="button-name"><ui:i18n key="预览"/></span>
							</span>
							<span class="button bg-orange js-input" style="vertical-align: top; margin-left: 5px;">
								<span class="button-name"><ui:i18n key="插入"/></span>
							</span>
						</c:otherwise>
					</c:choose>
					<span class="button bg-orange  js-choose" style="vertical-align: top; margin-left: 5px;" onclick="">
						<span class="button-name"><ui:i18n key="选择"/></span>
					</span>
			</div>
		</div> 
		<div class="control-warp text-center">
			<div class="popup-form-actions">
				<div class="buttons-action">
					<span class="button bg-red js-modiy-seconde-menu"  onclick="">
						<span class="button-icon conform"></span>
						<span class="button-name"><ui:i18n key="确认"/></span>
					</span>
					<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="">
						<span class="button-icon cancel"></span>
						<span class="button-name"><ui:i18n key="取消"/></span>
					</span>
				</div>
			</div>
		</div>
	</div>	 
</form>