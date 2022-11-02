<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="主页"/></title>  
 
</head>
<body>
	 <script type="text/javascript">
	 $(function(){
		 
		 var goodsPopover = $('.js-add-tag').popover({
				placement : 'bottom', html : true,
				content : (_.template($("#tpl_popover_1").html())({
					inputClass:  'w27' || 'w27'  /* 指定宽度 */
					,placeholder:  '请输入111111'  /* 指定placeholder */
				}))
			}).data('popover');
		
		 goodsPopover.tip().on('click', '.js-btn-confirm', function(evt){
			// console.log('-----------comforim------------');
			 var val = $(this).closest('.popover-content-warp').find('.js-popover-input').val() || '';
			 console.log('value=' + val);
			 if( val != ''){
				 var item = '<li class="tag-item"><span>' + val +'</span><a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a></li><li class="tag-split"><img alt="" src="/admin/images/icon/icon-sp.png"></li>';
				 $('.js-add-tag').parent().before(item);
				 		
		 		 $('.del-tag').unbind('click').click(function(){
		 	         $(this).closest('.tag-item').next().remove(); 
		 	         $(this).closest('.tag-item').remove();
		 		 });
				 
			 }
			 
			 $('.js-add-tag').popover('hide');
		 });
		 
		 goodsPopover.tip().on('click', '.js-btn-cancel',function(evt){
			// console.log('-----------hide------------');
			 $('.js-add-tag').popover('hide');
		 });
		 
	 });
	 </script>
	 
	 
<script id="tpl_popover_1" type="text/template"> 
<%--
{{
	inputClass  = inputClass|| 'w27';
	conformClass  = conformClass|| '';
	cancelClass  = cancelClass|| '';
}}
--%>
<div class="popover-content-warp" >
	<div class="popover-input">
		<input type="text" class="js-popover-input {{=inputClass}}"  placeholder="{{=placeholder}}">
	</div>
	<div class="popover-actions">
		<span class="button bg-orange js-btn-confirm">
			<span class="button-icon conform"></span>
			<span class="button-name"><ui:i18n key="保存"/></span>	
		</span>
		<span class="button bg-orange  js-btn-cancel">
			<span class="button-icon cancel"></span>
			<span class="button-name"><ui:i18n key="取消"/></span>	
		</span>
	</div>
</div>
</script>
		  	<!-- ▼ container  --> 
			
		<div class="container" style="width: 910px;">
		  	<!-- ▼ 查询表单区域  --> 
		   <div class="demotitle">查询表单区域</div>
	       
	  		<!-- ▲ 查询表单区域  -->
	      	<div class="form-warp clearfix" >
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<!-- <a class="label-prefix"></a> -->是否使用优惠券<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  placeholder="请输入上架标题" class="w30"  >
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  placeholder="请输入上架标题" class="w30"  >
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input class="icradio" type="radio" name="iCheck">&nbsp;&nbsp;Yes
     		 			 &nbsp;&nbsp;&nbsp;
     		 			 <input class="icradio" type="radio" name="iCheck" checked>&nbsp;No
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input class="iccheckbox" type="checkbox">&nbsp;蓝色
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="iccheckbox" type="checkbox" checked>&nbsp;紫色
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	  <ul class="tag-list js-tag-list">
									<%--  <li> 
										 <span class="tag-item">${items}</span> 
										 <a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a> 
									 </li> 
									 <li class="tag-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li> 
								  --%>
								<li><img class="js-add-tag addicon-small" src="/admin/images/icon/icon-plus2.png"  >${label.查询新标签}(${label.查询关键词}) </li>
							 </ul>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<textarea id="descDetail" cols="100"  class="w30" style="height: 60px; text-align: left;" ></textarea>
				  			 
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="from" class="w12 datepicker"  />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
	  			 	 	<input type="text" id="to" class="w12 datepicker"   />
						 
				  			 
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<select  data-placeholder="${label.请选择}" class="select2 sw30">
							<option value=""></option>
							 <option value="1">1</option>
							 <option value="2">2</option>
							 <option value="3">3</option>
							 <option value="4">4</option>
							 <option value="5">5</option>
							 <option value="6">6</option>
						</select>
						 <img class="addicon" id="" style="" src="/admin/images/icon/icon-plus2.png" >
				  			
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		${label.上架标题}<a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<select  data-placeholder="${label.请选择}" class="select2 sw15">
							<option value=""></option>
							 <option value="1">1</option>
							 <option value="2">2</option>
							 <option value="3">3</option>
							 <option value="4">4</option>
							 <option value="5">5</option>
							 <option value="6">6</option>
						</select>
	  			 	 	<select  data-placeholder="${label.请选择}" class="select2 sw15">
							<option value=""></option>
							 <option value="1">1</option>
							 <option value="2">2</option>
							 <option value="3">3</option>
							 <option value="4">4</option>
							 <option value="5">5</option>
							 <option value="6">6</option>
						</select>
						 <img class="addicon" id="" style="" src="/admin/images/icon/icon-plus2.png" >
				  			
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
						level1:	  			 	 
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label"  >
	  			 		  level2:
	  			 	 	</div>
	  			 	 	<select  data-placeholder="${label.请选择}" class="select2 sw15">
							<option value=""></option>
							 <option value="1">1</option>
							 <option value="2">2</option>
							 <option value="3">3</option>
							 <option value="4">4</option>
							 <option value="5">5</option>
							 <option value="6">6</option>
						</select>
	  			 	 	<select  data-placeholder="${label.请选择}" class="select2 sw15">
							<option value=""></option>
							 <option value="1">1</option>
							 <option value="2">2</option>
							 <option value="3">3</option>
							 <option value="4">4</option>
							 <option value="5">5</option>
							 <option value="6">6</option>
						</select>
						 <img class="addicon" id="" style="" src="/admin/images/icon/icon-plus2.png" >
				  			
	  			 	 </div>
	  			 </div>
  			 </div>
			  	
			   
			  			 
	     </div> 	
			 <!-- ▲ container  -->
</body>
</html>