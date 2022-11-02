<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<style>
input[type="text"]{
	width: 170px;
}
</style> 
<form action="">
	<div class="form-warp clearfix" >
		<div class="control-warp"  >
			<div class="form-label" style="width: 90px">
				<ui:i18n key="第一级分类"/>:
			</div>
			<div class="form-control">
				<select id="oneSelect" class="select2" data-placeholder="<ui:i18n key="新建分类"/>"  style="width: 180px;">
					<option value=""></option>
						<c:forEach items="${requestScope.oneSelectList}" var="items" varStatus="status">
							<option value="${items.shopGoodsOneId}">${items.shopGoodsOneNm}</option>
						</c:forEach>
				</select>
				<input type="text" id="oneText" name="oneText"  value="" placeholder="<ui:i18n key="手动输入一级分类"/>" />
			</div>
		</div> 
		<div class="control-warp"  >
			<div class="form-label" style="width: 90px">
				<ui:i18n key="第二级分类"/>:
			</div>
			<div class="form-control">
				<select id="twoSelect" class="select2" data-placeholder="<ui:i18n key="请选择或新建分类"/>"  style="width: 180px;" onchange="javascript:twoClass();">
					<option value=""></option>
				</select>
				<input type="text" id="twoText" name="twoText"  value="" placeholder="<ui:i18n key="手动输入二级分类"/>" />
			</div>
		</div> 
		<div class="control-warp"  >
			<div class="form-label" style="width: 90px">
				<ui:i18n key="区分"/>:
			</div>
			<div class="form-control">
				<select id="typeSelect" class="select2" data-placeholder="<ui:i18n key="请选择区分"/>"  style="width: 180px;">
					<option value="1"><ui:i18n key="普通商品"/></option>
				</select>
			</div>
		</div> 
		<div style="text-align: center;margin-top: 15px;">
			 <span class="button bg-red  js-save">
				<span class="button-icon conform"></span>
				<span class="button-name"><ui:i18n key="保存"/></span>
			 </span> 
			 <span class="button bg-red  js-cancel"  style="margin-left: 20px;">
				<span class="button-icon cancel"></span>
				<span class="button-name"><ui:i18n key="取消"/></span>
			 </span> 
		</div>
	</div>
</form>						