<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/admin/template/tagsInc.jsp" %> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" />  
<jsp:include page="/admin/js/goods/goods-editor-v2.jsp" />
<script type="text/javascript">

function showGoodsStockGrid(){
	
	var big1 = $('#goods-spec-big1').val();
	var big2 = $('#goods-spec-big2').val();
	var big1text = $('#goods-spec-big1').find('option:selected').text(); 
	var big2text = $('#goods-spec-big2').find('option:selected').text(); 
	var small1 = eval('[' + $('#goods-spec-small1').val()  + ']');
	var small2 = eval('[' + $('#goods-spec-small2').val()  + ']');
 
	var subitems1 = [];
	var subitems2 = [];
	for(var i = 0; i < small1.length; i++){
		if(!!small1[i]){
			var item = {};
			item.code = small1[i];
			item.value = $('#goods-spec-small1').find('option[value="' + small1[i] + '"]').text()
			
			subitems1.push(item);
		}
	}
	
	
	for(var i = 0; i < small2.length; i++){
		if(!!small2[i]){
			var item = {};
			item.code = small2[i];
			item.value = $('#goods-spec-small2').find('option[value="' + small2[i] + '"]').text()
			
			subitems2.push(item);
		}
	}
	 
	 
	var items = [];
	
	if(subitems1.length > 0){
		var item = {};
		item.code = big1;
		item.value = big1text;
		item.subitems = subitems1;
		items.push(item);
	}
	if(subitems2.length > 0){
		var item = {};
		item.code = big2;
		item.value = big2text;
		item.subitems = subitems2;
		items.push(item);
	}
	
	//console.log('=============');
	//console.log(items);
	//console.log('=============');
	
	if(items.length > 0){
		var data = {
			items:items	
		};
		
		 var tpl = _.template($('#tpi-grid-stock').html());

		$("#goods-stock-area").html(tpl(data));
		
	}
	
}

$(function(){
	
	search();
	
   $('.js-contents-step2').hide();
	
	$('#goods-class-level2').prop('disabled', true);
	$('#goods-stock-city').prop('disabled', true);
	
	$('#goods-spec-small1').val('').attr('disabled', true).trigger('chosen:updated.chosen'); 
	$('#goods-spec-small2').val('').attr('disabled', true).trigger('chosen:updated.chosen'); 
	
	$('#goods-spec-small1').change(showGoodsStockGrid);
	$('#goods-spec-small2').change(showGoodsStockGrid);
	
	$('#goodsClassAdd').click(function(){
		showIframeBpopupWindow({
			id : 'bpopupGoodsClass',
			title : '<ui:i18n key="??????????????????"/>', // ?????? option
			width : 540, 
			height : 332, 
			action : '/admin/goods/addShopGoodsClass.htm'
		});	
	});
	
	
	 
	//??????????????????????????????????????????
	$('#goods-stock-province').change(function(e){ 
		var val = $(this).val();
		var $combo = $('#goods-stock-city');
		$combo.select2('val','');
		 $combo.html('<option value="" ></option>');//??????select??????  
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
       	 		data:{province_id: val},
				url : '/admin/goods/display/getCityCombo.htm',
				success : function(res) {
					 var list = res.list;
					
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].AREAID + '">' + list[i].AREANAME + '</option>');
					 	 }
					 	 
						$combo.select2('open'); 
					 }else{
						 
					 } 
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
 			});
		}
		
	  });
	 
	 
	//??????????????????????????????????????????
	$('#goods-class-level1').change(function(e){ 
		var val = $(this).val();
		var $combo = $('#goods-class-level2');
		$combo.select2('val','');
		 $combo.html('<option value="" ></option>');//??????select??????
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
				url : '/admin/goods/display/getGoods2edClassCombo.htm',
       	 		data:{sgcId: val},
				success : function(res) {
					 var list = res.list;
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].SGC_ID + '">' + list[i].SGC_NM + '</option>');
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
	 
	
	//???????????????1-Big??????????????????
	$("#goods-spec-big1").on("change", function (e) { 
		if($(this).val() != ''){
			$.ajax({
				url : '/admin/goods/display/get2edLevelSpecCombo.htm',
				data:{
 	 				gc_id: gg_gcId,
 	 				spec_id:$(this).val()
 	 			},
				success : function(res) {
					 var list = res.list;
					 var $combo = $('#goods-spec-small1');
					 $combo.html('');
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].SPEC_VALUE_ID + '">' + list[i].SPEC_VALUE_NM + '</option>');
					 	 }
					 } 
					 
					 $combo.attr('disabled', false).trigger("chosen:updated.chosen");
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
			});
			  
			$('#addGoodsSpec12').show();
		}else{
			$('#addGoodsSpec12').hide();
			  
			$("#goods-spec-small1").val('').attr('disabled', true).trigger("chosen:updated.chosen"); 
   			showGoodsStockGrid();
		}
	});
	//???????????????2-Big??????????????????
	$("#goods-spec-big2").on("change", function (e) { 
		if($(this).val() != ''){
			$.ajax({
				url : '/admin/goods/display/get2edLevelSpecCombo.htm',
				data:{
 	 				gc_id: gg_gcId,
 	 				spec_id:$(this).val()
 	 			},
				success : function(res) {
					 var list = res.list;
					 var $combo = $('#goods-spec-small2');
					 $combo.html('');
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].SPEC_VALUE_ID + '">' + list[i].SPEC_VALUE_NM + '</option>');
					 	 }
					 } 
					 
					 $combo.attr('disabled', false).trigger("chosen:updated.chosen");
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
			});
			  
			$('#addGoodsSpec22').show();
		}else{
			$('#addGoodsSpec22').hide();
			  
			$("#goods-spec-small2").val('').attr('disabled', true).trigger("chosen:updated.chosen"); 
   			showGoodsStockGrid();
		}
	});
	  
	$('#reserveYes').on('ifChecked', function(event){
		$('.js-reserve-main-img-tip').show();
		$('.js-main-img-tip').hide();
		$('.js-reserve-date').show();
	 });
	
	$('#reserveNo').on('ifChecked', function(event){
		$('.js-reserve-main-img-tip').hide();
		$('.js-main-img-tip').show();
		$('.js-reserve-date').hide();
	 });	
	
	//???????????????-?????????Tab?????????????????????
	$('.js-to-step2').click(function(){
		var checkedCount = $('.js-goods-item:checked').size();
		/* $('.js-goods-item').each(function(){
		   if($(this).is(':checked')){
			   checkedCount++;
		   }
	 	});  */
	 	
	 	if(checkedCount == 0){
			 alert('<ui:i18n key="???????????????"/>.');
			 return false;
		}
	 	
	 	if(checkedCount > 1){
			 alert('<ui:i18n key="????????????????????????"/>.');
			 return false;
		}
	 	
	 	var goodsId = $('.js-goods-item:checked').data('goodsId');
	 	var gcId = $('.js-goods-item:checked').data('gcId');
	 	var gcNm = $('.js-goods-item:checked').data('gcNm');
		 
	 	gg_goodsId = goodsId;
	 	gg_gcId = gcId;
	 	
	 	//console.log(goodsId);
	 	//console.log(gcId);
	 	//console.log(gcNm);
	 	
	 	$('#step2_goods_category').text(gcNm);
		 
	 	$.ajax({
			url : '/admin/goods/display/get1stLevelSpecCombo.htm',
   	 		data:{gc_id: gcId},
			success : function(res) {
				 var list = res.list;
				 var $combo = $('#goods-spec-big1');
				 var $combo2 = $('#goods-spec-big2');
				
				 $combo.select2('val','').trigger('change');
				 $combo2.select2('val','').trigger('change');
				 
				 if(!!list.length){
				 	 for(var i = 0 ; i < list.length ; i++){
				 	 	$combo.append('<option value="' + list[i].SPEC_ID + '">' + list[i].SPEC_NM + '</option>');
				 	 	$combo2.append('<option value="' + list[i].SPEC_ID + '">' + list[i].SPEC_NM + '</option>');
				 	 }
				 } 
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});

 
		
	 	$('.js-status-bar').removeClass('goods-step-1').removeClass('goods-step-3').addClass('goods-step-2');
		$('.js-contents-step').hide();
		$('.js-contents-step2').show();
		$('body,html').animate({scrollTop:0},100); 
		
	});
	
	//???????????????-?????????Tab?????????????????????
	$('.js-to-step3').click(function(){
		
		
		//for test
	/* 	$('.js-status-bar').removeClass('goods-step-1').removeClass('goods-step-2').addClass('goods-step-3');
		$('.js-contents-step').hide();
		$('.js-contents-step3').show();
		$('body,html').animate({scrollTop:0},100); 
		return false; */
		//;
		
		// <//%--
		if($('#descTitle').val().trim() == ''){
		  	alert('<ui:i18n key="?????????????????????"/>!');
		  	return ;
	    };
		if($('#descDetail').val().trim() == ''){
		  	alert('<ui:i18n key="?????????????????????"/>!');
		  	return ;
	    };
		if($('#goods-class-level1').val()  == ''){
		  	alert('<ui:i18n key="?????????????????????"/>!');
		  	return ;
	    };
		if($('#goods-class-level2').val() == ''){
		  	alert('<ui:i18n key="?????????????????????"/>!');
		  	return ;
	    };
	   
	    if($('#goods-stock-area').html().trim().length == 0){
			alert('<ui:i18n key="??????????????????????????????"/>!');
			return;
		}
		
		var stockFlag = false;
		$('#goods-stock-area input').each(function(){
			var id = $(this).data('id');
			var name = $(this).data('name');
			if(name == '??????'){
				name = '<ui:i18n key="??????"/>';
			}else if(name == '??????'){
				name = '<ui:i18n key="??????"/>';
			}else if(name == '??????'){
				name = '<ui:i18n key="??????"/>';
			}
			var value = $(this).val();
			if(value ==''){
				alert(  name + '<ui:i18n key="??????????????????"/>!');
				$(this).focus();
				stockFlag = true;
				return false;
			}
			  if(isNaN(value)){
				alert( name + '<ui:i18n key="?????????????????????"/>!');
				$(this).val('').focus();
				stockFlag = true;
				return false;
			} 
			 
		});
		
		if(stockFlag){
			return ;
		}
	    
	    if($('#goods-stock-province').val()  == '' && $('#goods-stock-city').val()  == ''){
			  alert('<ui:i18n key="?????????????????????"/>!');
			 // $('#goods-stock-province').select2('open'); 
			  return ;
		 };
		 if($('#transSheetId').val() == ''){
	    		alert('<ui:i18n key="????????????????????????"/>!');
	    		return;
	    	}
		if($('#startDate').val() == ''){
		  alert('<ui:i18n key="???????????????????????????"/>!');
		 // $('#startDate').focus();
		  return ;
	    };
		
	    if($('#endDate').val() == ''){
			  alert('<ui:i18n key="???????????????????????????"/>!');
			 // $('#endDate').focus();
			  return ;
		    };
		    var date1=new Date($('#startDate').val());
			var date2=new Date($('#endDate').val());
			if(date1>date2){
				alert('<ui:i18n key="????????????????????????"/>!');
				return;
			} 
		    var reserve =  $("[name='reserve']:checked").val();
	    	if(reserve == 1){
	    		if($('#reserveEndDate').val() == ''){
	   			  alert('<ui:i18n key="???????????????????????????"/>!');
	   			 // $('#startDate').focus();
	   			  return ;
	   		    };
	    		if($('#reserveEndTime').val() == ''){
	   			  alert('<ui:i18n key="???????????????????????????"/>!');
	   			 // $('#startDate').focus();
	   			  return ;
	   		    };
		     
	    	} 
	    
		 if($('.js-mian-img-warp .form-pic').size() == 0){
			 alert('<ui:i18n key="????????????????????????"/>!');
			  return ;
		 }  
	   //--%>
		
	 	$('.js-status-bar').removeClass('goods-step-1').removeClass('goods-step-2').addClass('goods-step-3');
		$('.js-contents-step').hide();
		$('.js-contents-step3').show();
		$('body,html').animate({scrollTop:0},100); 
		
	});
	//???????????????-?????????Tab?????????????????????
	$('.js-preview-setp1').click(function(){
	 	$('.js-status-bar').removeClass('goods-step-2').removeClass('goods-step-3').addClass('goods-step-1');
		$('.js-contents-step').hide();
		$('.js-contents-step1').show();
		$('body,html').animate({scrollTop:0},100); 
		
	});
	
	//???????????????-?????????Tab?????????????????????
	$('.js-preview-setp2').click(function(){
	 	$('.js-status-bar').removeClass('goods-step-1').removeClass('goods-step-3').addClass('goods-step-2');
		$('.js-contents-step').hide();
		$('.js-contents-step2').show();
		$('body,html').animate({scrollTop:0},100); 
	});
	
	
	$('.js-main-img-add').click(function(){
		showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="????????????"/>', // ?????? option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/picture.htm?fileGroup=1&max=1' //?????? fileGroup ?????? 1?????????   2?????????    3???Blog
																		// max ???????????????????????? ??????  ???????????????????????????????????????
																		// conformMethod ??????????????????????????????????????????????????????????????? ???????????????choosePicture???
																		// clsoeMethod ??????????????????????????????????????????????????????????????? ???????????????closeWindow???
		});	
	});	
});

//????????????
function choosePicture(obj){
	 //console.log('-------parent');
	 obj = obj || [];
	 if(obj.length > 0){
		 var img  = obj[0];
	 	 //console.log(img);
	 	 
	 	var hh = (_.template($('#tpl_main_img').html())(img));
	 	
	 	 //console.log(hh);
	 	
	 	$('.js-mian-img-warp .form-pic').remove();
	 	$('.js-mian-img-warp').prepend(hh);
	 }
	 
	 closeWindow();
	}
//????????????	
function closeWindow(){
	 closeBpopupWindow('bpopupPicture');
}


function fnResetGoodsClass(data){
	var $combo = $('#goods-class-level1');
	  $combo.html('<option value="" ></option>');//??????select??????
	 $.ajax({
 		data:{goodsLevel1: data.shopGoodsOneId},
		url : '/admin/goods/getGoodsLevel1.htm',
		success : function(res) {
			 var list = res.list;
				
			 if(!!list.length){
			 	 for(var i = 0 ; i < list.length ; i++){
			 	 	$combo.append('<option value="' + list[i].SGC_ID + '">' + list[i].SGC_NM + '</option>');
			 	 }
			 	$combo.select2('val',res.currentValue).trigger("change");
			 } 
		},
		error : function(xhr, status, e) {
			alert("error: " + status);
		}
	});
	  
	 closeBpopupGoodsClass();
}

//????????????	
function closeBpopupGoodsClass(){
	 closeBpopupWindow('bpopupGoodsClass');
}
</script>

<script type="text/javascript">
$(function(){
	var goodsPopover = $('.js-add-tag').popover({
		placement : 'bottom', html : true,
		content : (_.template($('#tpl_popover_1').html())({
			inputClass:  'w27'  /* ???????????? */
			,placeholder:  '<ui:i18n key="?????????"/>'  /* ??????placeholder */
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

<script type="text/javascript">
$(function(){
	 $('#addGoodsSpec11, #addGoodsSpec21, #addGoodsSpec12, #addGoodsSpec22').popover({
			placement : 'bottom', html : true,
			content : (_.template($('#tpl_popover_1').html())({
				inputClass:  'w18'  /* ???????????? */
				,placeholder:  '<ui:i18n key="??????????????????"/>'  /* ??????placeholder */
			}))
		}).data('popover');
	
	var addGoodsSpec11Popover = $('#addGoodsSpec11').data('popover');
	var addGoodsSpec21Popover = $('#addGoodsSpec21').data('popover');
	var addGoodsSpec12Popover = $('#addGoodsSpec12').data('popover');
	var addGoodsSpec22Popover = $('#addGoodsSpec22').data('popover');
	
	 addGoodsSpec11Popover.tip().on('click', '.js-btn-confirm',fnAddGoodsSpec1);
	 addGoodsSpec21Popover.tip().on('click', '.js-btn-confirm',fnAddGoodsSpec1);
	 
	 
	 function fnAddGoodsSpec1(){
		 var val = $(this).closest('.popover-content-warp').find('.js-popover-input').val() || '';
		 console.log('value=' + val);
		 
		 if(val == ''){
			 alert('<ui:i18n key="??????????????????"/>');
			 return ;
		 }
		 
		 $.ajax({
			url : '/admin/goods/category/addSpecLevelOne.htm',
	 		data:{
	 			gcId: gg_gcId
	 			,specNm : val
	 		},
			success : function(res) {
				if(res.success){
					alert('<ui:i18n key="????????????"/>');
					$('#goods-spec-big1').append('<option value="' + res.SPEC_ID + '">' + res.SPEC_NM + '</option>');
					$('#goods-spec-big2').append('<option value="' + res.SPEC_ID + '">' + res.SPEC_NM + '</option>');
					
					 $('#addGoodsSpec21').popover('hide');
					 $('#addGoodsSpec22').popover('hide');
				}else{
					alert(res.errorMsg);
					$input.val('');
				}
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
	 }
	 
	 
	 addGoodsSpec12Popover.tip().on('click', '.js-btn-confirm', function(evt){
		 var specId = $('#goods-spec-big1').val();
		 if(specId == ''){
			 alert('<ui:i18n key="??????????????????????????????"/>');
			 $('#addGoodsSpec12').popover('hide');
			 return false;
		 }
		 
		 var specValueNm = $(this).closest('.popover-content-warp').find('.js-popover-input').val() || '';
		 console.log('specValueNm=' + specValueNm);
		 
		 if(specValueNm == ''){
			 alert('<ui:i18n key="??????????????????????????????"/>');
			 return false;
		 }
		 
		 $.ajax({
			url : '/admin/goods/category/addSpecLevelTwo.htm',
	 		data:{
	 			gcId: gg_gcId
	 			,specId : specId
	 			,specValueNm : specValueNm
	 		},
			success : function(res) {
				if(res.success){
					alert('<ui:i18n key="????????????"/>');
					$('#goods-spec-small1').append('<option value="' + res.SPEC_VALUE_ID + '">' + res.SPEC_VALUE_NM + '</option>');
					$('#goods-spec-small2').append('<option value="' + res.SPEC_VALUE_ID + '">' + res.SPEC_VALUE_NM + '</option>');
					var specSmall = $('#goods-spec-small1').val() || [];
					specSmall.push(res.SPEC_VALUE_ID);
					$('#goods-spec-small1').val(specSmall).trigger('chosen:updated.chosen'); 
					$('#goods-spec-small1').trigger('change'); 
				}else{
					alert(res.errorMsg);
				}
				
				$('#addGoodsSpec12').popover('hide');
			},
			error : function(xhr, status, e) {
				alert('error: ' + status);
			}
		});
	});
	 
	 
	 addGoodsSpec22Popover.tip().on('click', '.js-btn-confirm', function(evt){
		 var specId = $('#goods-spec-big2').val();
		 if(specId == ''){
			 alert('<ui:i18n key="??????????????????????????????"/>');
			 $('#addGoodsSpec22').popover('hide');
			 return false;
		 }
		 
		 var specValueNm = $(this).closest('.popover-content-warp').find('.js-popover-input').val() || '';
		 console.log('specValueNm=' + specValueNm);
		 
		 if(specValueNm == ''){
			 alert('<ui:i18n key="??????????????????????????????"/>');
			 return false;
		 }
		 
		 $.ajax({
			 url : '/admin/goods/category/addSpecLevelTwo.htm',
	 		data:{
	 			gcId: gg_gcId
	 			,specId : specId
	 			,specValueNm : specValueNm
	 		},
			success : function(res) {
				if(res.success){
					alert('<ui:i18n key="????????????"/>');
					$('#goods-spec-small1').append('<option value="' + res.SPEC_VALUE_ID + '">' + res.SPEC_VALUE_NM + '</option>');
					$('#goods-spec-small2').append('<option value="' + res.SPEC_VALUE_ID + '">' + res.SPEC_VALUE_NM + '</option>');
					var specSmall = $('#goods-spec-small2').val() || [];
					specSmall.push(res.SPEC_VALUE_ID);
					$('#goods-spec-small2').val(specSmall).trigger('chosen:updated.chosen'); 
					$('#goods-spec-small2').trigger('change'); 
				}else{
					alert(res.errorMsg);
				}
				
				$('#addGoodsSpec22').popover('hide');
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
	});
	 
	 addGoodsSpec11Popover.tip().on('click', '.js-btn-cancel', function(evt){
		 $('#addGoodsSpec11').popover('hide');
	 });
	addGoodsSpec21Popover.tip().on('click', '.js-btn-cancel', function(evt){
		 $('#addGoodsSpec21').popover('hide');
	 });
	addGoodsSpec12Popover.tip().on('click', '.js-btn-cancel', function(evt){
		 $('#addGoodsSpec12').popover('hide');
	 });
	addGoodsSpec22Popover.tip().on('click', '.js-btn-cancel', function(evt){
		 $('#addGoodsSpec22').popover('hide');
	 });
});
</script>

<script type="text/javascript">
function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var searchGoodsNm = $('#searchGoodsNm').val();
	var params = {
			goodsNm : searchGoodsNm
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/goods/display/displayListFragment.htm';
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		
		 $('.iccheckbox' , $this).iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	  });
		 
			$('.pic-small', $this).hover(function(){
		  		   var $this = $(this);	
		  		   var offset = $this.offset();
		  		   var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
		   		$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
		   		$('body').append($div);
		  		},function(){
		  			$('.js-show-big-pic').remove();
		  		});  
		
		 $this.hideLoading();
	 });
	 
}
</script>
 
 
 <script type="text/javascript">
 function delMainPic(obj){
   $(obj).closest('.form-pic').remove() ;
 }
 </script>
 
 
 <script type="text/javascript">
$(function(){
	$('.js-btn-upload').click(function(){
		console.log('js-btn-upload');
		var goodsListImg = '';
		 $('.js-mian-img-warp .form-pic').each(function(){
			 goodsListImg = $(this).data('fileId');
		 });
		 if(goodsListImg == ''){
			 alert('<ui:i18n key="????????????????????????"/>!');
	  	       return false;
		 }
		 
	 
		var item = $('#app-field-header').data('fieldItem') || [] ;
	 	if(item.length < 1){
	  		   alert('<ui:i18n key="????????????????????????"/>!');
	  		   return false;
	  	  }
	 	
	 	var pp ={};
		
    	pp.goodsId = gg_goodsId;
    	pp.gcId = gg_gcId;
    	pp.sgcIdSplit = $('#goods-class-level1').val() + ',' + $('#goods-class-level2').val();
    	pp.isUsed = $("[name='isUsed']:checked").val();
    	
    	var reserve =  $("[name='reserve']:checked").val();
    	pp.reserve = reserve;
    	if(reserve == 1){
	    	pp.reserveEndDate = $('#reserveEndDate').val();
	    	pp.reserveEndTime = $('#reserveEndTime').val();
    	}else{
    		pp.reserveEndDate = '';
	    	pp.reserveEndTime = '';
    	}
    	pp.stockAreaId = ($('#goods-stock-city').val() == '') ? $('#goods-stock-province').val() : $('#goods-stock-city').val() ;
    	pp.transSheetId = $('#transSheetId').val() ;
    	pp.voucherUse = $('#voucherUse').val() ;
    	pp.discountId = $('#discountId').val() ;
    	pp.startDt = $('#startDate').val();
    	pp.endDt = $('#endDate').val();
    	pp.startDesc = $('#displayMemo').val();
    	pp.eventDesc = $('#eventDesc').val();
    	pp.descTitle = $('#descTitle').val();
    	pp.descDetail = $('#descDetail').val();
    	pp.descDetail = $('#descDetail').val();
    	pp.goodsListImg = goodsListImg;
    	for(var i = 0 ; i  < item.length ; i++){
    		eval('('+ 'pp.goodsDtlSlideImg' + (i+ 1) + ' =  item[' +i + '].fileId )');
    	}
    	
    	var tagSplit = [];
		$('.js-tag-list .tag-item span').each(function(){	
			tagSplit.push($(this).text());			
		});
		pp.tagIdSplit = _.uniq(tagSplit).join(',');
		
		
		var  stocks = [];
		var stockObj = {};
		$('#goods-stock-area input').each(function(){
			var id = $(this).data('id');
			var type = $(this).data('type');
			var value = $(this).val();
			 
			if(type == "price"){
				stockObj = {};
				stockObj.id = id;
				stockObj.price = value;
			}else if(type == "unit"){
				stockObj.unit = value;
			}else if(type == "stock"){
				stockObj.stock = value;
				stocks.push(stockObj);
			}
		});
		
		pp.stocks = stocks;
		
		var params = [];
	    $('.js-fields-region .app-field').each(function(idx){
	    	var $item = $(this);
	    	var type =  $item.data('field-type');
	    	if(type == 'type-01'){
	    	   	params.push({
	    	   		type : type,							    			    	   		
	    			item : $item.data('fieldItem') || [] 
	    	   	});
	   		}else if(type == 'type-05'){ 
	    	   	params.push({
    			   type : type,							    			    	   		
    			   goodsGroup : $item.data('goodsGroup') || '',							    			    	   		
    			   goodsSize : $item.data('goodsSize') || '',							    			    	   		
    			   goodsNumberType :$item.data('goodsNumberType') || 0				    			    	   		
    	   		});
	   		}else if(type == 'type-12'){ 
	    	   	params.push({
	    	   		type : type,							    			    	   		
	    			item : $item.data('fieldItem') || [] 
	    	   	});
	    	}else if(type == 'type-13'){ 
	    	   	params.push({
	    			type : type,							    			    	   		
    			   	item : $item.data('fieldItem') || [] ,
    			   	leftWidth: $item.data('fieldLeftWidth') || 50, 
    			   	imgLeftName: $item.data('imgLeftName') || '', 
    			   	imgRightName: $item.data('imgRightName') || '' 
	    	   	});
	   		}else if(type == 'type-18'){ 
	    	   	params.push({
    			   type : type,							    			    	   		
    			   item : $item.data('fieldItem') || [] 
	    	   	});
	    	}else if(type == 'type-20'){ 
    	   		params.push({
    			   type : type,							    			    	   		
    			   linkNm : $item.data('linkNm') || '',							    			    	   		
    			   linkUrl : $item.data('linkUrl') || '',							    			    	   		
    			   linkType : $item.data('linkType') || 1						    			    	   		
    	   		});
	    	}else if(type == 'type-52'){ 
    	   		params.push({
    			   type : type,							    			    	   		
    			   goodsSize : $item.data('goodsSize')  || 1,							    			    	   		
    			   item : $item.data('fieldItem') || []
    	   		});
	    	  }else if(type == 'type-99'){ 
	    	  	params.push({
    			   type : type,							    			    	   		
    			   content : $item.find('.js-richtext').html() 							    			    	   		
    	   		});
	    	}
		});
		
	    pp.tpls = params;
    	//console.log('=pp==');
    	//console.log(pp);
       	
		for (var i=0; i<pp.tpls.length; i++) {
    	   
			var type = pp.tpls[i].type;
			
	    	if (type == 'type-99') { 
	    	   	if (pp.tpls[i].content == '') {
	    	   		alert('<ui:i18n key="????????????????????????"/>');
	    	   		return false;
	    	   	}
	    	}
       	}
    	
    	$('body').showLoading({'vPos':'200px'   });
    	
    	$.ajax({
			url : '/admin/goods/display/createDisplay.htm',
    	    data:{jsonStr: JSON.stringify(pp)},
			success : function(res) {
				$('body').hideLoading();
				if(res.success){
					alert('<ui:i18n key="??????????????????"/>');
					window.top.closeTab();
				}else{
					alert('<ui:i18n key="??????????????????"/>!\n' + res.err_msg);
				}
			},
			error : function(xhr, status, e) {
				$('body').hideLoading();
				alert("error: " + status);
			}
		});
		
	});		  
	$('.js-btn-preview').click(function(){
		console.log('js-btn-preview');
		var goodsListImg = '';
		 $('.js-mian-img-warp .form-pic').each(function(){
			 goodsListImg = $(this).data('fileId');
		 });
		 if(goodsListImg == ''){
			 alert('<ui:i18n key="????????????????????????"/>!');
	  	       return false;
		 }
		 
	 
		var item = $('#app-field-header').data('fieldItem') || [] ;
	 	if(item.length < 1){
	  		   alert('<ui:i18n key="????????????????????????"/>!');
	  		   return false;
	  	  }
	 	
	 	var pp ={};
		
   	pp.goodsId = gg_goodsId;
   	pp.gcId = gg_gcId;
   	pp.sgcIdSplit = $('#goods-class-level1').val() + ',' + $('#goods-class-level2').val();
   	pp.isUsed = $("[name='isUsed']:checked").val();
   	
   	var reserve =  $("[name='reserve']:checked").val();
   	pp.reserve = reserve;
   	if(reserve == 1){
	    	pp.reserveEndDate = $('#reserveEndDate').val();
	    	pp.reserveEndTime = $('#reserveEndTime').val();
   	}else{
   		pp.reserveEndDate = '';
	    	pp.reserveEndTime = '';
   	}
   	pp.stockAreaId = ($('#goods-stock-city').val() == '') ? $('#goods-stock-province').val() : $('#goods-stock-city').val() ;
   	pp.transSheetId = $('#transSheetId').val() ;
   	pp.voucherUse = $('#voucherUse').val() ;
   	pp.discountId = $('#discountId').val() ;
   	pp.startDt = $('#startDate').val();
   	pp.endDt = $('#endDate').val();
   	pp.startDesc = $('#displayMemo').val();
   	pp.eventDesc = $('#eventDesc').val();
   	pp.descTitle = $('#descTitle').val();
   	pp.descDetail = $('#descDetail').val();
   	pp.descDetail = $('#descDetail').val();
   	pp.goodsListImg = goodsListImg;
   	for(var i = 0 ; i  < item.length ; i++){
   		eval('('+ 'pp.goodsDtlSlideImg' + (i+ 1) + ' =  item[' +i + '].fileId )');
   		eval('('+ 'pp.goodsDtlSlideImgUrl' + (i+ 1) + ' =  item[' +i + '].fileUrl )');
   	}
   	
   	var tagSplit = [];
		$('.js-tag-list .tag-item span').each(function(){	
			tagSplit.push($(this).text());			
		});
		pp.tagIdSplit = _.uniq(tagSplit).join(',');
		
		
		var  stocks = [];
		var stockObj = {};
		$('#goods-stock-area input').each(function(){
			var id = $(this).data('id');
			var type = $(this).data('type');
			var value = $(this).val();
			 
			if(type == "price"){
				stockObj = {};
				stockObj.id = id;
				stockObj.price = value;
			}else if(type == "unit"){
				stockObj.unit = value;
			}else if(type == "stock"){
				stockObj.stock = value;
				stocks.push(stockObj);
			}
		});
		
		pp.stocks = stocks;
		
		var params = [];
	    $('.js-fields-region .app-field').each(function(idx){
	    	var $item = $(this);
	    	var type =  $item.data('field-type');
	    	if(type == 'type-01'){
	    	   	params.push({
	    	   		type : type,							    			    	   		
	    			item : $item.data('fieldItem') || [] 
	    	   	});
	   		}else if(type == 'type-05'){ 
	    	   	params.push({
   			   type : type,							    			    	   		
   			   goodsGroup : $item.data('goodsGroup') || '',							    			    	   		
   			   goodsSize : $item.data('goodsSize') || '',							    			    	   		
   			   goodsNumberType :$item.data('goodsNumberType') || 0				    			    	   		
   	   		});
	   		}else if(type == 'type-12'){ 
	    	   	params.push({
	    	   		type : type,							    			    	   		
	    			item : $item.data('fieldItem') || [] 
	    	   	});
	    	}else if(type == 'type-13'){ 
	    	   	params.push({
	    			type : type,							    			    	   		
   			   	item : $item.data('fieldItem') || [] ,
   			   	leftWidth: $item.data('fieldLeftWidth') || 50, 
   			   	imgLeftName: $item.data('imgLeftName') || '', 
   			   	imgRightName: $item.data('imgRightName') || '' 
	    	   	});
	   		}else if(type == 'type-18'){ 
	    	   	params.push({
   			   type : type,							    			    	   		
   			   item : $item.data('fieldItem') || [] 
	    	   	});
	    	}else if(type == 'type-20'){ 
   	   		params.push({
   			   type : type,							    			    	   		
   			   linkNm : $item.data('linkNm') || '',							    			    	   		
   			   linkUrl : $item.data('linkUrl') || '',							    			    	   		
   			   linkType : $item.data('linkType') || 1						    			    	   		
   	   		});
	    	}else if(type == 'type-52'){ 
   	   		params.push({
   			   type : type,							    			    	   		
   			   goodsSize : $item.data('goodsSize')  || 1,							    			    	   		
   			   item : $item.data('fieldItem') || []
   	   		});
	    	  }else if(type == 'type-99'){ 
	    	  	params.push({
   			   type : type,							    			    	   		
   			   content : $item.find('.js-richtext').html() 							    			    	   		
   	   		});
	    	}
		});
		
	    pp.tpls = params;
    	//console.log('=pp==');
    	//console.log(pp);
       	
		for (var i=0; i<pp.tpls.length; i++) {
    	   
			var type = pp.tpls[i].type;
			
	    	if (type == 'type-99') { 
	    	   	if (pp.tpls[i].content == '') {
	    	   		alert('<ui:i18n key="????????????????????????"/>');
	    	   		return false;
	    	   	}
	    	}
       	}
   	
	    window.open('', '_preview', 'width=320, height=568, menubar=no, status=no, toolbar=no');
		$('#jsonStr','#previewForm').val(JSON.stringify(pp));
		$('#previewForm').submit();
  
	});		  
});
</script>
</head>
<body>
	<!-- ??? container  --> 
	<div class="container">
		<form id="previewForm" method="post" target="_preview"  action="/admin/goods/display/displayPreview.htm">
      		<input type="hidden" id="jsonStr" name="jsonStr" value="" /> 
    	</form>
            	
	
		<div class="status-bar-warp">
			<table class="status-bar-title">
				<tr>
					<td><ui:i18n key="????????????"/></td>
					<td><ui:i18n key="??????????????????"/></td>
					<td><ui:i18n key="??????????????????"/></td>
				</tr>
			</table>
			<div class="status-bar goods-step-1 js-status-bar"></div>
		</div>
		
		
		<div style="background-color: #e3e3e3;width: 100%;height: 1px; margin: 30px 0;">
	  	</div>
		
	
		<div class="contents-step js-contents-step js-contents-step1 clearfix">
		
			<!-- ??? ??????????????????  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	    		 			<col width="100px" />
	    		 			<col />
	    		 		</colgroup>
	    		 		<tr>
	    		 			<td class="flabel last"><ui:i18n key="????????????"/>???</td>
	    		 			<td class="fcomp last"><input type="text" id="searchGoodsNm" class="w21"/></td>
	    		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<div class="butttn-area m1" >
	       		   <span class="button" onclick="search();">
	       		   	  <span class="button-icon search"></span>
	       		   	 <span class="button-name"><ui:i18n key="??????"/></span>
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ??? ??????????????????  -->
			<div class="result-grid pic" style="margin-top: 20px;">
			  	<div class="js-grid-content">
			  			
				</div>
			</div>
			  
			 <div style="text-align: center;">
			 	 <span class="button js-to-step2" style="padding-right: 6px;" onclick="">
       		   	  	<span class="button-icon arrow-right" style="float: right;"></span>
       		   	  	<span class="button-name" style="float: right;"><ui:i18n key="?????????"/></span> 
       		   	</span>
			 </div> 
		</div>
		
		<div class="contents-step js-contents-step js-contents-step2 clearfix">
		 	<div class="form-warp clearfix" >
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="??????????????????"/> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	 <span id="step2_goods_category"></span>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="descTitle" placeholder="<ui:i18n key="?????????????????????"/>(<ui:i18n key="??????????????????20?????????"/>)"   maxlength="20"  class="w30" />
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
				  		<textarea id="descDetail" cols="100"  class="w30" style="height: 60px; text-align: left;resize: none;" ></textarea>	 
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input class="icradio" type="radio" name="isUsed" id="isUsedYes" value="1" checked="checked" />&nbsp;&nbsp;<ui:i18n key="??????"/>
     		 			 &nbsp;&nbsp;&nbsp;
     		 			<input class="icradio" type="radio" name="isUsed" id="isUsedNo" value="2" />&nbsp;<ui:i18n key="??????"/>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="????????????"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	  <ul class="tag-list js-tag-list">
									<%--  <li> 
										 <span class="tag-item">${items}</span> 
										 <a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a> 
									 </li> 
									 <li class="tag-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li> 
								  --%>
								<li><img class="js-add-tag addicon-small" src="/admin/images/icon/icon-plus2.png"  ><ui:i18n key="???????????????"/>(<ui:i18n key="???????????????"/>) </li>
							 </ul>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="goods-class-level1" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw15"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.goodClassLevel1}" var="items" varStatus="status">
								<option value="${items.SGC_ID}">${items.SGC_NM}</option>
							</c:forEach>
			         	 </select>
			         	 <select id="goods-class-level2" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw15"   >
				            <option value=""></option> 
			         	 </select>
						 <img class="addicon" id="goodsClassAdd" style="" src="/admin/images/icon/icon-plus2.png" >
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
						 <ui:i18n key="????????????"/><a class="label-required"></a> :  	 
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label" style="width: 80px" >
	  			 		   <ui:i18n key="??????"/>1:
	  			 	 	</div>
	  			 	 	<select id="goods-spec-big1" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw36"   >
				            <option value=""></option>
			         	 </select>
						 <img class="addicon" id="addGoodsSpec11" style="" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="??????????????????????????????"/>"  />
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label"  style="width: 80px" >
	  			 	 	 </div>
	  			 	 	 <select id="goods-spec-small1" data-placeholder="<ui:i18n key="?????????"/>" class="chosen-select-deselect sw36" multiple   >
	  			 	 	 	<option value=""></option>
						 </select>
						 <img class="addicon" id="addGoodsSpec12" style="" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="??????????????????????????????"/>" />
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label"   style="width: 80px" >
	  			 		   <ui:i18n key="??????"/>2:
	  			 	 	</div>
	  			 	 	<select id="goods-spec-big2" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw36"   >
				            <option value=""></option>
			         	 </select>
						 <img class="addicon" id="addGoodsSpec21" style="" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="??????????????????????????????"/>"  />
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label"  style="width: 80px" >
	  			 	 	 </div>
	  			 	 	 <select id="goods-spec-small2" data-placeholder="<ui:i18n key="?????????"/>" class="chosen-select-deselect sw36" multiple   >
	  			 	 	 	<option value=""></option>
						 </select>
						 <img class="addicon" id="addGoodsSpec22" style="" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="??????????????????????????????"/>" />
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp" id="goods-stock-area" ></div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="goods-stock-province" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw15"   >
				             <option value=""></option>
				            <c:forEach items="${requestScope.provinceCombo}" var="items" varStatus="status">
								<option value="${items.AREAID}">${items.AREANAME}</option>
							</c:forEach>
			         	 </select>
			         	 <select id="goods-stock-city" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw15"   >
				            <option value=""></option> 
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="?????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="transSheetId" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw33"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.goodTransportCombo}" var="items" varStatus="status">
								<option value="${items.TRANS_SHEET_ID}">${items.TRANS_SHEET_NM}</option>
							</c:forEach>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="?????????????????????"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="voucherUse" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw33"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.voucherAbleCombo}" var="items" varStatus="status">
								<option value="${items.VOUCHER_ID}">${items.VOUCHER_NM}</option>
							</c:forEach>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="????????????"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="voucherUse" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw33"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.discountPolicyCombo}" var="items" varStatus="status">
								<option value="${items.VOUCHER_ID}">${items.VOUCHER_NM}</option>
							</c:forEach>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="startDate" readonly="readonly" class="w12 datepicker"  />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
	  			 	 	<input type="text" id="endDate" readonly="readonly" class="w12 datepicker"   />
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="??????????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input class="icradio" type="radio" name="reserve" id="reserveYes" value="1" />&nbsp;&nbsp;<ui:i18n key="???"/>
     		 			 &nbsp;&nbsp;&nbsp;
     		 			<input class="icradio" type="radio" name="reserve" id="reserveNo" value="0" checked="checked" />&nbsp;<ui:i18n key="???"/>
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp js-reserve-date" style="display: none;" >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="??????????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="reserveEndDate" class="w12 datepicker" readonly="readonly" />
						<select id="reserveEndTime" data-placeholder="<ui:i18n key="?????????"/>" class="select2 sw9"   >
				            <option value=""></option>
				            <option value="0">00:00</option>
				            <option value="1">01:00</option>
				            <option value="2">02:00</option>
				            <option value="3">03:00</option>
				            <option value="4">04:00</option>
				            <option value="5">05:00</option>
				            <option value="6">06:00</option>
				            <option value="7">07:00</option>
				            <option value="8">08:00</option>
				            <option value="9">09:00</option>
				            <option value="10">10:00</option>
				            <option value="11">11:00</option>
				            <option value="12">12:00</option>
				            <option value="13">13:00</option>
				            <option value="14">14:00</option>
				            <option value="15">15:00</option>
				            <option value="16">16:00</option>
				            <option value="17">17:00</option>
				            <option value="18">18:00</option>
				            <option value="19">19:00</option>
				            <option value="20">20:00</option>
				            <option value="21">21:00</option>
				            <option value="22">22:00</option>
				            <option value="23">23:00</option>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp"    style="display: none;">
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
				  		<textarea id="displayMemo" cols="100"  class="w30" style="height: 60px; text-align: left;resize: none;" ></textarea>	 
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp "    style="display: none;">
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="????????????"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  id="eventDesc" placeholder='<ui:i18n key="?????????????????????"/>...' class="w30"  />
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp "  >
	  			 	 <div class="form-label" style="position: absolute;" >
	  			 	 	<span><ui:i18n key="???????????????"/><a class="label-required"></a> :</span>
	  			 	 </div>
	  			 	 <div class="form-control" style="margin-left:110px;">
	  			 	 	<div class="js-mian-img-warp clearfix" >
	  			 	 		<%-- <div class="form-pic">
	  			 	 			<img alt="?????????DX340LC-9C" src="/uploads/16/2015/06/19/16_goods_2015_06_19_13_01_32_86988.jpg">
	  			 	 			<div class="pic-del-mask">
	  			 	 				<div class="pic-del" onclick="delMainPic(this);">1</div>
	  			 	 			</div>
							</div> --%>
		  			 	 	<div class="pic-add js-main-img-add">
								<span><ui:i18n key="????????????"/></span>
							</div>
							<div class="pic-tip js-main-img-tip">
								<ui:i18n key="??????????????????"/> ???(320px * 320px)
							</div>
							<div class="pic-tip js-reserve-main-img-tip" style="display: none;">
								<ui:i18n key="???????????????????????????????????????"/> ???(400px * 190px)
							</div>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
  			 </div>
		    
		    <div style="text-align: center;">
			 	   <span class="button js-preview-setp1" style="padding-left: 6px;"  onclick="" >
       		   	  	<span class="button-icon arrow-left" style="float: left;"></span>
       		   	  	<span class="button-name"  style="float: left;"> <ui:i18n key="?????????"/> </span> 
       		   	</span>  
			 	 <span class="button js-to-step3" style="padding-right: 6px;margin-left:20px;" onclick="">
       		   	  	<span class="button-icon arrow-right" style="float: right;"></span>
       		   	  	<span class="button-name" style="float: right;"><ui:i18n key="?????????"/></span> 
       		   	</span>
			 </div> 
			 
		</div>
		
		
		<div class="contents-step js-contents-step js-contents-step3 clearfix"  style="display: none;">
		 	<div id="app-region" class="app-region-container" >
				<div class="app-design clearfix">
					<div class="app-preview">
					 	<div class="app-header"></div>
			   			<div class="app-entry">
			   				<div class="app-config">
				        	 	<div id="app-field-header" class="app-field" style="cursor: default;" data-field-type="header">
					                <div class="js-top-slider-region top-slider-region">
					                    <h4>${label.Banner?????????}</h4>
					                    <p>${label.????????????} ,${label.????????????5?????????}</p>
					                </div>
					                <div class="sliderImg" style="display:none;">
										<ul></ul>
									</div>
			            		</div>
			   				</div>
			   				
			   				<div class="app-fields js-fields-region">
			        			<div class="app-fields ui-sortable">
			        			<!-- edding area -->
			        			<!-- edding area -->
			        			</div>
			        		</div>
			   				
			    		</div>
			    		<div class="app-contorls">
			    			<table style="width: 100%;">
			    				<tr>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-01"><ui:i18n key="????????????"/></span></td>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-05"><ui:i18n key="????????????"/></span></td>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-52"><ui:i18n key="??????"/></span></td>
			    				</tr>
			    				<tr>
			    					<td><span class="js-new-field" data-field-type="type-12">1<ui:i18n key="??????"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-13">2<ui:i18n key="??????"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-18">3<ui:i18n key="??????"/></span></td>
			    				</tr>
			    				<tr>
			    					<td><span class="js-new-field" data-field-type="type-20"><ui:i18n key="?????????"/></span></td>
			    					<td colspan="2"><span class="js-new-field" data-field-type="type-99"><ui:i18n key="?????????"/></span></td>
			    				</tr>
			    			</table>
			    		</div>
			    		<div class="app-footer"></div>
					</div>
				
					<div class="app-sidebar" style="margin-top: -1000px;">
						<div class="arrow"></div>
						<div class="app-sidebar-inner js-sidebar-region">
							<div>
								<form class="form-horizontal js-sidebar-editor" novalidate="">
								</form>
							</div>
						</div>
					</div>
				</div>
		 	</div>
		 
		 	<div style="text-align: center; margin-top: 30px;">
			 	<span class="button js-preview-setp2" style="padding-left: 6px;"  onclick="" >
       		   	  	<span class="button-icon arrow-left" style="float: left;"></span>
       		   	  	<span class="button-name"  style="float: left;"> <ui:i18n key="?????????"/> </span> 
       		   	</span> 
			 	<span class="button js-btn-upload" style="margin-left: 20px;">
       		   	  	<span class="button-name"  style="float: left;" > <ui:i18n key="??????"/> </span> 
       		   	</span> 
			 	<span class="button js-btn-preview"  style="margin-left: 20px;">
       		   	  	<span class="button-name"  style="float: left;"> <ui:i18n key="??????"/> </span> 
       		   	</span> 
			 </div> 
		</div>
	
	</div>
	<!-- ??? container  -->
	
<jsp:include page="/admin/template/customEditorTemplate-v2.jsp" />
</body>
</html>	