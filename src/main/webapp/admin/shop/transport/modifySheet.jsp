<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="编辑运费模板"/></title>  
 <c:set var="transportItem" value="${requestScope.transportList[0] }"></c:set>
<script type="text/javascript">
$(function(){
	
	//出发地点：选择省时
	$('#fromProvince').change(function(e){ 
		var val = $(this).val();
		 
		var $combo = $('#fromCity');
		$combo.select2('val','');
		$combo.html('<option value="" ></option>');//清空select内容  
		 
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
				url : '/admin/shop/getMapTwoList.htm',
       	 		data:{
       	 			areaParentId  : val 
       	 			, areaLevel : 2
       	 		},
				success : function(res) {
					 var list = res.list;
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].areaId + '">' + list[i].areaName + '</option>');
					 	 }
					 	 
						$combo.select2('open'); 
					 } 
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
 			});
		}
	});
	
	//点击省或者市
	$('.iCheck-helper').each(function(){
		$(this).click(function(){
			if($(this).prev().val() == 0){
				$('#toProvince').select2('val','').prop('disabled', true);			
				$('.js-area-item.second').hide();
				
				//得到现有的省份
				var toAreaId = '';
				$('.js-area-item.first input[type=checkbox][name=check]').each(function(){
					toAreaId = toAreaId + ',' + $(this).attr('data-area-id');
				});
				toAreaId = toAreaId.substr(1,toAreaId.length);
				
				loadGridData(0, toAreaId,'${transportItem.TRANS_SHEET_ID}','');
			}else{
				$('#toProvince').prop('disabled', false);
			} 
		}); 
	});
	
	/* $('.js-to-province').on('ifChecked', function(event){
		 $('#toProvince').select2('val','').prop("disabled", true);		
		// loadGridData(0, '');
	 });
	
	 $('.js-to-city').on('ifChecked', function(event){
		 $('#toProvince').prop("disabled", false);
	 }); */
	
	//配送区域 ：选择市时，选择省份查询出对应的市
		/* $("#toProvince").change(function(){
			loadGridData(1, $(this).val());  
		});
	
	if(${transportItem.AREA eq 0}){
		loadGridData(0, '');
	}else{
		loadGridData(1, $("#toProvince").val());  
	} */
	
	//配送区域 ：选择市时，选择省份查询出对应的市
	$('#toProvince').change(function(){
		
		$('.toProvinceDiv').text('');
		$('.js-area-item.second').hide();
		
		//得到现有的市
		var toAreaId = '';
		$('.js-area-item.first input[type=checkbox][name=check]').each(function(){
			toAreaId = toAreaId + ',' + $(this).attr('data-area-id');
		});
		toAreaId = toAreaId.substr(1,toAreaId.length);
		
		//得到现有的市对应的省
		var areaParentId = $('#toProvince').val();
		
		loadGridData(1, areaParentId,'${transportItem.TRANS_SHEET_ID}',toAreaId);
	});
	
	//得到现有的市
	var toAreaId = '';
	$('.js-area-item.first input[type=checkbox][name=check]').each(function(){
		toAreaId = toAreaId + ',' + $(this).attr('data-area-id');
	});
	toAreaId = toAreaId.substr(1,toAreaId.length);
	loadGridDataFirst('${transportItem.AREA}','${transportItem.TO_AREA_P_ID}','${transportItem.TRANS_SHEET_ID}',toAreaId);
	
});

function loadGridDataFirst(type,areaParentId,transSheetId,areaId){
	var params = {
			type : type
			,areaId : areaId
			,areaParentId : areaParentId
			,transSheetId : transSheetId
	}
	var url = '/admin/shop/transport/areaModifyList.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params , function(){ 
		 $this.find('.iccheckbox').iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	  });
		 
		 $('input[type=checkbox][name=check]').each(function(){
			 $(this).on('ifUnchecked', function(event){
				 $(this).parents(".chk").nextAll().find(".js-trans-fee").val('');
				 $(this).parents(".chk").nextAll().find(".js-trans-add-fee").val('');
			 });
	 	 });
		 
		 $this.find('.js-check-all').on('ifChecked', function(event){
			 $this.find('.js-check-item').iCheck('check');
		 });
		 
		 $this.find('.js-check-all').on('ifUnchecked', function(event){
			 $this.find('.js-check-item').iCheck('uncheck');
		 });
		 
		 $this.hideLoading();
	 });
}

function loadGridData(type, areaParentId,transSheetId,areaId){
	var params = {
			type : type
			,areaId : areaId
			,areaParentId : areaParentId
			,transSheetId : transSheetId
	}
	var url = '/admin/shop/transport/areaModifyList.htm';
	 
	var $this = $('.js-grid-content');	
	$this.showLoading();
	$this.load(url , params ,  function(){ 
		
	 	 $(".js-area-item.second").show();
	 	 
	 	 $this.find('.iccheckbox').iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	  });
	 	 
	 	$('input[type=checkbox][name=check]').each(function(){
			 $(this).on('ifUnchecked', function(event){
				 $(this).parents(".chk").nextAll().find(".js-trans-fee").val('');
				 $(this).parents(".chk").nextAll().find(".js-trans-add-fee").val('');
			 });
	 	 });
		 	
		 $this.find('.js-check-all').on('ifChecked', function(event){
			 $this.find('.js-check-item').iCheck('check');
		 });
		 $this.find('.js-check-all').on('ifUnchecked', function(event){
			 $this.find('.js-check-item').iCheck('uncheck');
		 });
		 
		 $this.hideLoading();
	 });
}

//创建新运费模板
function save(){ 
	//运费模板名称
	var transSheetName = $('#transSheetName').val();
	if(transSheetName == ''){
		alert('<ui:i18n key="请输入运费模板名称"/>.');
		return;
	}
	
	//出发地点(省)
	var fromProvince = $('#fromProvince').val();
	//出发地点(市)
	var fromCity = $('#fromCity').val();
	
	if(fromCity == '' || fromProvince == ''){
		alert('<ui:i18n key="请选择出发地点"/>.');
		return;
	}
	
	//配货方式
	var transTypeId = $('#transTypeId').val();
	if(transTypeId == ''){
		alert('<ui:i18n key="请选择配货方式"/>.');
		return;
	}
	
	//得到单选框的值
	var areaValue = $('input[type=radio][name=areaValue]:checked').val();
	//配送区域
	var toProvince = $('#toProvince').val();
	if($('input[name=areaValue][value=1]').is(':checked')){
		if(toProvince == ''){
			alert('<ui:i18n key="请选择配送区域"/>.');
			return;
		}
	}
	
	//判断是否有选中项
	var subcheck = '';  
	$('input[name=check]:checked').each(function(){  
		subcheck = subcheck + ',' + $(this).attr('data-area-id');//向数组中添加元素  
	});
	if(subcheck == ''){
		alert('<ui:i18n key="请在列表处选择配送区域"/>.');
		return;
	}
	
	//得到区域id
	var toAreaId = '';
	$('input[name=check]:checked').each(function(){
		toAreaId = toAreaId + ',' + $(this).attr('data-area-id');
	});
	toAreaId =toAreaId.substr(1,toAreaId.length);
	
	//得到上一级的id
	var toAreaParentId = '';
	$('input[name=check]:checked').each(function(){
		toAreaParentId = toAreaParentId + ',' + $(this).parents('.chk').find('#toAreaParentId').val();
	});
	toAreaParentId = toAreaParentId.substr(1,toAreaParentId.length);
	
	
	//得到运费
	var transFee = '';
	var count = '';
	var flag = true;
	var flag_two = true;
	$('input[name=check]:checked').each(function(){
		transFee = transFee + ',' + parseFloat($(this).parents('.js-area-item').find('#transFee').val()).toFixed(0);
		if($(this).parents('.js-area-item').find('#transFee').val() == ''){
			flag = false;
		}
		if(isNaN($(this).parents('.js-area-item').find('#transFee').val())){
			flag_two = false;
		}
	});
	if(!flag){
		alert('<ui:i18n key="运费不能为空"/>.');
		return;
	}
	if(!flag_two){
		alert('<ui:i18n key="输入的不是数字"/>.');
		return;
	}	
	var length = $('input[type=checkbox][name=check]:checked').length;
	$('.js-trans-fee').each(function(){
		if($(this).val() != ''){
			count++;
		}
	}); 
	if(length != count){
		alert('<ui:i18n key="选择的地区数量与运费数量不一致"/>.');
		return;
	}  
	transFee = transFee.substr(1,transFee.length);
	
	//得到续费
	var transAddFee = '';
	var count_add = '';
	var flag_add = true;
	var flag_add_two = true;
	$('input[name=check]:checked').each(function(){
		transAddFee = transAddFee + ',' + parseFloat($(this).parents('.js-area-item').find('#transAddFee').val()).toFixed(0);
		if($(this).parents('.js-area-item').find('#transAddFee').val() == ''){
			flag_add = false;
		}
		if(isNaN($(this).parents('.js-area-item').find('#transAddFee').val())){
			flag_add_two = false;
		}
	});
	if(!flag_add){
		alert('<ui:i18n key="续费不能为空"/>.');
		return;
	}
	if(!flag_add_two){
		alert('<ui:i18n key="输入的不是数字"/>.');
		return;
	}
	var length = $('input[type=checkbox][name=check]:checked').length;
	$('.js-trans-add-fee').each(function(){
		if($(this).val() != ''){
			count_add++;
		}
	}); 
	if(length != count_add){
		alert('<ui:i18n key="选择的地区数量与续费数量不一致"/>.');
		return;
	}  
	transAddFee = transAddFee.substr(1,transAddFee.length);
	
	var params = {
			jobType : 'U',
			transSheetId : ${requestScope.transSheetId},
			transSheetName : transSheetName,
			area : areaValue,
			toAreaParentId : toAreaParentId,
			toAreaId : toAreaId,
			transFee : transFee,
			transFeeAdd : transAddFee,
			transTypeId : transTypeId,
			fromAreaId : fromCity
			};
	$.ajax({
	 		data : params,
	 		url : '/admin/shop/transport/save.htm',
	 		success : function(data){
	 			if (data.transSheetName != ''){
	 				alert('<ui:i18n key="保存成功"/>.');
	 				window.location.href='/admin/shop/transport/sheetList.htm';
	 			} else{
	 				alert('<ui:i18n key="保存失败"/>，<ui:i18n key="请重新操作"/>.');
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
	 	});
}


</script>
 <style>
		 .ui-popover{
		 	position: absolute;
			top: -20px;
			right: 80px;
		 	display: none;  
			padding: 20px 20px 20px 10px;
			border: 1px solid #b0b0b0;
			border-radius: 5px;
			background: #fff;
			box-shadow: -2px 2px 2px rgba(0, 0, 0, 0.2);
		 }
		</style>
		
		<script type="text/javascript">
		function showPopover(){
			$('.j-batch-import').show();
		}
		function hidePopover(){
			$('.j-batch-import').hide();
		}
		
		function transFeeImport(){
			var transFee = $('.js-batch-trans-fee').val();
			var transAddFee = $('.js-batch-trans-add-fee').val();
			if(transFee == ''){
				alert('<ui:i18n key="请输入全部物流费"/>.');
				return;
			}

			if(transAddFee == ''){
				alert('<ui:i18n key="请输入全部续费"/>.');
				return;
			}
			$('.js-area-item').each(function(){
				var $this = $(this);
				if($('.js-check-item',$this).is(':checked')){
					 $('.js-trans-fee', $this).val(transFee);
					 $('.js-trans-add-fee', $this).val(transAddFee);
				}
			});
			
			 $('.js-batch-trans-fee').val('');
			 $('.js-batch-trans-add-fee').val('');
			
			hidePopover();
			
		}
		</script>
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container" >
	
		<input type="hidden" id="transSheetId"  value="${transSheetId }"/>
	
		<div style="border: 1px solid #e5e5e5; padding: 15px 20px;">
			
			
			<div class="form-warp clearfix">
		  			 <div class="control-warp"  >
		  			 	 <div class="form-label"  >
		  			 		<ui:i18n key="运费模板"/><a class="label-required"></a>： 
		  			 	 </div>
		  			 	 <div class="form-control">
		  			 	 	<input type="text" id="transSheetName"  placeholder="<ui:i18n key="请输入运费模板名称"/>" class="w36"  value="${transportItem.TRANS_SHEET_NM }">
		  			 	 </div>
		  			 </div>
		  			 <div class="control-warp"  >
		  			 	 <div class="form-label"  >
		  			 		<ui:i18n key="出发地点"/><a class="label-required"></a>：
		  			 	 </div>
		  			 	 <div class="form-control">
		  			 	 	<select id="fromProvince" data-placeholder="<ui:i18n key="请选择省份"/>" class="select2 sw15">
								<option value=""></option>
								 <c:forEach items="${provinceList}" var="item">
									<option value="${item.AREAID}" <c:if test="${transportItem.PROVINCE_ID eq item.AREAID }"> selected="selected" </c:if>>${item.AREANAME}</option>
								</c:forEach>
							</select>
		  			 	 	<select id="fromCity" data-placeholder="<ui:i18n key="请选择城市"/>" class="select2 sw15" style="margin-left: 10px;">
								<option value=""></option>
								<c:forEach items="${cityList}" var="item">
									<option value="${item.areaId}"  <c:if test="${transportItem.CITY_ID eq item.areaId }"> selected="selected" </c:if>>${item.areaName}</option>
								</c:forEach>
							</select>
					  			
		  			 	 </div>
		  			 </div>
		  			 <div class="control-warp"  >
		  			 	 <div class="form-label"  >
		  			 		<ui:i18n key="配货方式"/><a class="label-required"></a>： 
		  			 	 </div>
		  			 	 <div class="form-control">
		  			 	 	<select id="transTypeId" data-placeholder="<ui:i18n key="请选择配货方式"/>" class="select2 sw15">
								<option value=""></option>
								<option value="1" <c:if test="${transportItem.TRANS_TYPE_ID eq 1 }"> selected="selected" </c:if>><ui:i18n key="快递"/></option>
								<option value="2" <c:if test="${transportItem.TRANS_TYPE_ID eq 2 }"> selected="selected" </c:if>>EMS</option>
								<option value="3" <c:if test="${transportItem.TRANS_TYPE_ID eq 3 }"> selected="selected" </c:if>><ui:i18n key="平邮"/></option>
								<option value="4" <c:if test="${transportItem.TRANS_TYPE_ID eq 4 }"> selected="selected" </c:if>><ui:i18n key="自提"/></option>
							</select>
					  			
		  			 	 </div>
		  			 </div>
		  			 <div class="control-warp"  >
		  			 	 <div class="form-label"  >
		  			 		<ui:i18n key="配送区域"/><a class="label-required"></a>： 
		  			 	 </div>
		  			 	 <div class="form-control">
		  			 	 	<input class="icradio js-to-province" type="radio" name="areaValue" value="0" <c:if test="${transportItem.AREA eq 0}" >checked</c:if>/>&nbsp;&nbsp;<ui:i18n key="省"/>
	     		 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     		 			 <input class="icradio js-to-city" type="radio" name="areaValue" value="1" <c:if test="${transportItem.AREA eq 1}" >checked</c:if>/>&nbsp;<ui:i18n key="市"/>
	     		 			 <select id="toProvince" class="select2 sw15" style="margin-left: 30px;" <c:if test="${transportItem.AREA eq 0}" >disabled</c:if>>
								<option value=""></option>
								 <c:forEach items="${provinceList}" var="item">
									<option value="${item.AREAID}"  <c:if test="${transportItem.TO_AREA_P_ID eq item.AREAID }"> selected="selected" </c:if>>${item.AREANAME}</option>
								</c:forEach>
							</select>
		  			 	 </div>
		  			 </div>
	  			 </div>
		</div>
		
		
		<!-- =========== -->
		<div class="result-grid" style="margin-top: 50px;">
			<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-edit-blue.png" onclick="showPopover();" />
					  	<span  onclick="showPopover();"><ui:i18n key="批量输入"/></span>
						<div class="ui-popover tipright j-batch-import" style="right: 90px; top:-20px;">
				 			<div class="form-warp clearfix text-left" style="width: 260px;">
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 100px;">
					  			 	 	<ui:i18n key="全部物流费"/><a class="label-required"></a>：
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	 <input type="text" class="w9 js-batch-trans-fee text-center"   onKeyUp="clearNoNum(event,this)"   onBlur="checkNum(this);" />&nbsp;&nbsp;<ui:i18n key="元"/>
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 100px;">
					  			 		<ui:i18n key="全部续费"/><a class="label-required"></a>：
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	 <input type="text" class="w9 js-batch-trans-add-fee text-center"   onKeyUp="clearNoNum(event,this)"   onBlur="checkNum(this);" />&nbsp;&nbsp;<ui:i18n key="元"/>
					  			 	 </div>
					  			 </div>
					  			<div class="text-center" style="margin-top: 10px">
									<div class="buttons-action">
						  				<span class="button bg-red " onclick="transFeeImport();">
											<span class="button-icon conform"></span>
											<ui:i18n key="确认"/>
										</span>
										<span class="button bg-red " onclick="hidePopover();" style="margin-left: 20px;">
											<span class="button-icon cancel"></span>
											<ui:i18n key="取消"/>
										</span>
						 			</div>
								</div>
				  			</div>
						</div>				  	
      		   		</span>
   				</div>
   			</div>
	      	<div class="js-grid-content">
	      	</div>
	       
	      </div>
		<!-- =========== -->
	
		
		<div class="text-center" style="margin-top: 30px">
			<div class="buttons-action">
  				<span class="button bg-red " onclick="save();">
					<span class="button-icon conform"></span>
					<ui:i18n key="保存"/>
				</span>
				<span class="button bg-red  " onclick="window.location.href='/admin/shop/transport/sheetList.htm'" style="margin-left: 20px">
					<span class="button-icon cancel"></span>
					<ui:i18n key="取消"/>
				</span>
 			</div>
		</div>
			  	
	</div>
	<!-- ▲ container  -->
</body>
</html>