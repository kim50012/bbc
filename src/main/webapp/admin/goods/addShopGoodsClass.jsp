<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<style type="text/css">
  
 /****for test ****/
  .popup-container{
 	position:relative;
 }
 .form-warp .control-warp .form-label {
    display: inline-block;
    width: 102px;
    padding-left: 10px;
    /* background-color: green; */
}
</style> 
 
 
<script type="text/javascript">
$(function(){
	
	$('#goods-class-level1').change(function(e){ 
		if($(this).val() == ''){
			$('#goods-class-level1-text').attr('disabled', false);
		}else{
		    $('#goods-class-level1-text').attr('disabled', true).val('');
		}
	});
	 
	 $('.js-add').click(function(){
		 var goodslevel1 = $('#goods-class-level1').val();	
		 var goodslevel1text = $('#goods-class-level1-text').val();	
		 var goodslevel2text = $('#goods-class-level2-text').val();	
		 var goodsClassType = $('#goods-class-type').val();	
		 
		 if(goodslevel1 == '' && goodslevel1text==''){
			 alert('<ui:i18n key="一级分类不能为空"/>');
			 return false;
			 
		 }
		 if(goodslevel2text==''){
			 alert('<ui:i18n key="二级分类不能为空"/>');
			 return false;
		 }
		 if(goodsClassType==''){
			 alert('<ui:i18n key="请选择区分"/>');
			 return false;
		 }
		 
		 $.ajax({
   	 		data:{
   	 			goodslevel1: goodslevel1,
   	 			goodslevel1text : goodslevel1text,
   	 			goodslevel2text : goodslevel2text,
   	 			goodsClassType : goodsClassType
   	 		},
			url : '/admin/goods/saveShopGoodsClass.htm',
			success : function(res) {
				if(res.success){
					 alert('<ui:i18n key="添加成功"/>');
					var data = res.data; 
					if(window.parent.fnResetGoodsClass){
						window.parent.fnResetGoodsClass(data);
					}
				}else{
					alert(res.errorMsg);
				}
				
			},
			error : function(xhr, status, e) {
				alert('error: ' + status);
			}
		});
		 
	 });
	 $('.js-cancel').click(function(){
		 window.parent.closeBpopupGoodsClass();
		 
	 });
});
</script>

 
</head>
 
	<!-- ▼ Main container --> 
   <div class="popup-container"> 
   
	   	<div style="padding: 20px;">
	   		<div class="form-warp clearfix" >
	 			 <div class="control-warp"  >
	 			 	 <div class="form-label"  >
	 			 		 <ui:i18n key="一级分类"/><a class="label-required"></a> : 
	 			 	 </div>
	 			 	 <div class="form-control">
	 			 	 	<select id="goods-class-level1" data-placeholder="${label.请选择}" class="select2 sw33"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.goodClassLevel1}" var="items" varStatus="status">
								<option value="${items.SGC_ID}">${items.SGC_NM}</option>
							</c:forEach>
			         	 </select>
	 			 	 </div>
	 			 </div>
	 			 <div class="control-warp"  >
	 			 	 <div class="form-label"  >
	 			 	 </div>
	 			 	 <div class="form-control">
	 			 	 	 <input type="text" id="goods-class-level1-text" placeholder="${label.请输入一级分类}..." class="w33">
	 			 	 </div>
	 			 </div>
	 			 <div class="control-warp"  >
	 			 	 <div class="form-label"  >
	 			 		 <ui:i18n key="二级分类"/><a class="label-required"></a> : 
	 			 	 </div>
	 			 	 <div class="form-control">
	 			 	 	 <input type="text" id="goods-class-level2-text" placeholder="${label.请输入二级分类}..." class="w33">
	 			 	 </div>
	 			 </div>
	 			 <div class="control-warp"  >
	 			 	 <div class="form-label"  >
	 			 		 <ui:i18n key="区分"/><a class="label-required"></a> : 
	 			 	 </div>
	 			 	 <div class="form-control">
	 			 	 	 <select id="goods-class-type" data-placeholder="${label.请选择}"  class="select2 sw33"  >
								<option value=""></option>
								<option value="1">${label.普通商品}</option>
								<option value="2">${label.营销活动}</option>
								<option value="3">${label.积分兑换商品}</option>
							</select>
	 			 	 </div>
	 			 </div>
	 			 <div class="control-warp"  >
	 			 	<div class="buttons-action text-center" style="margin-top: 40px;" >
		  				<span class="button bg-red js-add">
							<span class="button-icon conform"></span>
							<ui:i18n key="确认"/>
						</span>
						<span class="button bg-red  js-cancel" style="margin-left:30px;" >
							<span class="button-icon cancel"></span>
							<ui:i18n key="取消"/>
						</span>
	  				</div>
	 			</div>
	    			 
	        </div>
	   	</div>
	 </div>
 
</body>
</html>