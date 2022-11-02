<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/admin/template/tagsInc.jsp" %> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" />  
<jsp:include page="/admin/js/goods/goods-editor-v2.jsp" />
<style type="text/css">

.status-bar-title td{width:50%;}
.status-bar {
  background-image: url(/admin/images/goods/display_step2.png);
}
  .app-design .app-preview .actions .action{
  	cursor: pointer;
  }
</style>
 

<script type="text/javascript">
gg_goodsId = ${displayMaster.GOODS_ID };
gg_gcId = ${displayMaster.GC_ID };

</script> 
<script type="text/javascript">
  /**
   * desc : 合并指定表格（表格id为table_id）指定列（列数为table_colnum）的相同文本的相邻单元格  
   * @table_id 表格id : 为需要进行合并单元格的表格的id。如在HTMl中指定表格 id="data" ，此参数应为 #data   
   * @table_colnum   : 为需要合并单元格的所在列.参考jQuery中nth-child的参数.若为数字，从最左边第一列为1开始算起;"even" 表示偶数列;"odd" 表示奇数列; "3n+1" 表示的列数为1、4、7、...... 
   * @table_minrow ? : 可选的,表示要合并列的行数最小的列,省略表示从第0行开始 (闭区间) 
   * @table_maxrow ? : 可选的,表示要合并列的行数最大的列,省略表示最大行列数为表格最后一行 (开区间) 
   */
   function table_rowspan(table_id,table_colnum)
   {
	    if(table_colnum=="even"){
	    table_colnum = "2n";
	    }
       else if(table_colnum=="odd"){
	    table_colnum = "2n+1";
	    }
       else{
	    table_colnum = ""+table_colnum;
	    }
	    var cols=[];
	    var all_row_num = $(table_id+" tbody tr td:nth-child(1)").length;
	    var all_col_num = $(table_id+" tbody tr:nth-child(1)").children().length;
	    if(table_colnum.indexOf("n")==-1){
	    cols[0] = table_colnum;
	    }
       else{
	    var n = 0;
	    var a = table_colnum.substring(0,table_colnum.indexOf("n") );
	    var b= table_colnum.substring(table_colnum.indexOf("n")+1);
	    //alert("a="+a+"b="+(b==true));
	    a = a?parseInt(a):1;
	    b = b?parseInt(b):0;
	    //alert(b);
	    while(a*n+b<=all_col_num){
	        cols[n] = a*n+b;
	        n++;
	    }
	    }
	    var table_minrow = arguments[2]?arguments[2]:0;
	    var table_maxrow = arguments[3]?arguments[3]:all_row_num+1;    
	    var table_firsttd = "";  
	    var table_currenttd = "";  
	    var table_SpanNum = 0;
	    for(var j=0;j<cols.length;j++){
	        $(table_id + "  tbody tr td:nth-child(" + cols[j] + ")").slice(table_minrow, table_maxrow).each(function (i) {
	            var table_col_obj = $(this);
	            if (table_col_obj.html() != "&nbsp;") {
	                if (i == 0) {
	                    table_firsttd = $(this);
	                    table_SpanNum = 1;
	                }
	                else {
	                    table_currenttd = $(this);
	                    if (table_firsttd.text() == table_currenttd.text()) {
	                        table_SpanNum++;
	                        table_currenttd.hide(); //remove();  
	                        table_firsttd.attr("rowSpan", table_SpanNum);
	                    } else {
	                        table_firsttd = $(this);
	                        table_SpanNum = 1;
	                    }
	                }
	            }
	        });
       }
   }

 </script>
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
</script> 
<script type="text/javascript">
$(function(){
	
	//$('#goods-class-level2').prop('disabled', true);
	//$('#goods-stock-city').prop('disabled', true);
	
	//$('#goods-spec-small1').val('').attr('disabled', true).trigger('chosen:updated.chosen'); 
	//$('#goods-spec-small2').val('').attr('disabled', true).trigger('chosen:updated.chosen'); 
 

	$('.sliderImg').each(function(){
		imgSlider($(this));
	});
	
	table_rowspan('#goods-stock',1);
	
	$('#goods-spec-small1').change(showGoodsStockGrid);
	$('#goods-spec-small2').change(showGoodsStockGrid);
	
	$('#goodsClassAdd').click(function(){
		showIframeBpopupWindow({
			id : 'bpopupGoodsClass',
			title : '<ui:i18n key="添加商品分类"/>', // 标题 option
			width : 540, 
			height : 332, 
			action : '/admin/goods/addShopGoodsClass.htm'
		});	
	});
	
	
	 
	//当库存位置第一个下拉框变化时
	$('#goods-stock-province').change(function(e){ 
		var val = $(this).val();
		var $combo = $('#goods-stock-city');
		$combo.select2('val','');
		 $combo.html('<option value="" ></option>');//清空select内容  
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
	 
	 
	//当商品分类第一个下拉框变化时
	$('#goods-class-level1').change(function(e){ 
		var val = $(this).val();
		var $combo = $('#goods-class-level2');
		$combo.select2('val','');
		 $combo.html('<option value="" ></option>');//清空select内容
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
	 
	
	//当商品规格1-Big下拉框变化时
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
	//当商品规格2-Big下拉框变化时
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
	
	//gg_goodsId = goodsId;
 	//gg_gcId = gcId;
 	//$('#step2_goods_category').text(gcNm);
	
	 	  
	//在上架修改页面-第1个Tab页面点击下一步
	$('.js-to-step2').click(function(){
		
		//for test
	/* 	$('.js-status-bar').removeClass('goods-step-1').removeClass('goods-step-2').addClass('goods-step-3');
		$('.js-contents-step').hide();
		$('.js-contents-step3').show();
		$('body,html').animate({scrollTop:0},100); 
		return false; */
		//;
		
		// <//%--
		if($('#descTitle').val().trim() == ''){
		  	alert('<ui:i18n key="请输入上架标题"/>!');
		  	return ;
	    };
		if($('#descDetail').val().trim() == ''){
		  	alert('<ui:i18n key="请输入上架内容"/>!');
		  	return ;
	    };
		if($('#goods-class-level1').val()  == ''){
		  	alert('<ui:i18n key="请选择商品分类"/>!');
		  	return ;
	    };
		if($('#goods-class-level2').val() == ''){
		  	alert('<ui:i18n key="请选择商品分类"/>!');
		  	return ;
	    };
	   
	    if($('#goods-stock-area').html().trim().length == 0){
			alert('<ui:i18n key="商品规格至少选择一个"/>!');
			return;
		}
		
		var stockFlag = false;
		$('#goods-stock-area input').each(function(){
			var id = $(this).data('id');
			var name = $(this).data('name');
			if(name == '原价'){
				name = '<ui:i18n key="原价"/>';
			}else if(name == '单价'){
				name = '<ui:i18n key="单价"/>';
			}else if(name == '库存'){
				name = '<ui:i18n key="库存"/>';
			}
			var value = $(this).val();
			if(value ==''){
				alert(  name + '<ui:i18n key="信息不能为空"/>!');
				$(this).focus();
				stockFlag = true;
				return false;
			}
			  if(isNaN(value)){
				alert( name + '<ui:i18n key="信息必须是数字"/>!');
				$(this).val('').focus();
				stockFlag = true;
				return false;
			} 
			 
		});
		
		if(stockFlag){
			return ;
		}
	    
	    if($('#goods-stock-province').val()  == '' && $('#goods-stock-city').val()  == ''){
			  alert('<ui:i18n key="请选择库存位置"/>!');
			 // $('#goods-stock-province').select2('open'); 
			  return ;
		 };
		 if($('#transSheetId').val() == ''){
	    		alert('<ui:i18n key="请选择物流费模板"/>!');
	    		return;
	    	}
		if($('#startDate').val() == ''){
		  alert('<ui:i18n key="请选择发布开始时间"/>!');
		 // $('#startDate').focus();
		  return ;
	    };
		
	    if($('#endDate').val() == ''){
			  alert('<ui:i18n key="请选择发布结束时间"/>!');
			 // $('#endDate').focus();
			  return ;
		    };
		    var date1=new Date($('#startDate').val());
			var date2=new Date($('#endDate').val());
			if(date1>date2){
				alert('<ui:i18n key="发布时间选择错误"/>!');
				return;
			} 
		    var reserve =  $("[name='reserve']:checked").val();
	    	if(reserve == 1){
	    		if($('#reserveEndDate').val() == ''){
	   			  alert('<ui:i18n key="请选择预售截止日期"/>!');
	   			 // $('#startDate').focus();
	   			  return ;
	   		    };
	    		if($('#reserveEndTime').val() == ''){
	   			  alert('<ui:i18n key="请选择预售截止时间"/>!');
	   			 // $('#startDate').focus();
	   			  return ;
	   		    };
		     
	    	} 
	    
		 if($('.js-mian-img-warp .form-pic').size() == 0){
			 alert('<ui:i18n key="请选择商品主图片"/>!');
			  return ;
		 }  
	   //--%>
		
	 	$('.js-status-bar').removeClass('goods-step-1').addClass('goods-step-2');
		$('.js-contents-step').hide();
		$('.js-contents-step2').show();
		$('body,html').animate({scrollTop:0},100); 
		
	});
	
	//在上架修改页面-第二个Tab页面点击上一步
	$('.js-preview-setp1').click(function(){
	 	$('.js-status-bar').removeClass('goods-step-2').addClass('goods-step-1');
		$('.js-contents-step').hide();
		$('.js-contents-step1').show();
		$('body,html').animate({scrollTop:0},100); 
	});
	
	
	$('.js-main-img-add').click(function(){
		showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="选择图片"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/picture.htm?fileGroup=1&max=1' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																		// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																		// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																		// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
		});	
	});	
});

//弹出窗口
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
//关闭窗口	
function closeWindow(){
	 closeBpopupWindow('bpopupPicture');
}


function fnResetGoodsClass(data){
	var $combo = $('#goods-class-level1');
	  $combo.html('<option value="" ></option>');//清空select内容
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

//关闭窗口	
function closeBpopupGoodsClass(){
	 closeBpopupWindow('bpopupGoodsClass');
}

</script>

<script type="text/javascript">
$(function(){
	var goodsPopover = $('.js-add-tag').popover({
		placement : 'bottom', html : true,
		content : (_.template($('#tpl_popover_1').html())({
			inputClass:  'w27'  /* 指定宽度 */
			,placeholder:  '<ui:i18n key="请输入"/>'  /* 指定placeholder */
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
				inputClass:  'w18'  /* 指定宽度 */
				,placeholder:  '<ui:i18n key="请输入规格名"/>'  /* 指定placeholder */
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
			 alert('<ui:i18n key="请输入规格名"/>');
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
					alert('<ui:i18n key="添加成功"/>');
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
			 alert('<ui:i18n key="请先选择规格一级分类"/>');
			 $('#addGoodsSpec12').popover('hide');
			 return false;
		 }
		 
		 var specValueNm = $(this).closest('.popover-content-warp').find('.js-popover-input').val() || '';
		 console.log('specValueNm=' + specValueNm);
		 
		 if(specValueNm == ''){
			 alert('<ui:i18n key="请输入规格二级分类名"/>');
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
					alert('<ui:i18n key="添加成功"/>');
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
			 alert('<ui:i18n key="请先选择规格一级分类"/>');
			 $('#addGoodsSpec22').popover('hide');
			 return false;
		 }
		 
		 var specValueNm = $(this).closest('.popover-content-warp').find('.js-popover-input').val() || '';
		 console.log('specValueNm=' + specValueNm);
		 
		 if(specValueNm == ''){
			 alert('<ui:i18n key="请输入规格二级分类名"/>');
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
					alert('<ui:i18n key="添加成功"/>');
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
			 alert('<ui:i18n key="请选择商品主图片"/>!');
	  	       return false;
		 }
		 
		 									 
		var item = $('#app-field-header').data('fieldItem') || [] ;
	 	if(item.length < 1){
	  		   alert('<ui:i18n key="请选择商品展示图"/>!');
	  		   return false;
	  	  }
	 	
	 	var pp ={};
		
    	pp.goodsId = gg_goodsId;
    	pp.gcId = gg_gcId;
    	pp.displayId = $('#displayId').val();
    	pp.pageId = $('#pageId').val();
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
			var optionId = $(this).data('priceOptionId');
			var value = $(this).val();
			 
			if(type == "price"){
				stockObj = {};
				stockObj.id = id;
				stockObj.optionId = optionId;
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
	    	   		alert('<ui:i18n key="请输入富文本内容"/>');
	    	   		return false;
	    	   	}
	    	}
       	}
    	
    	$('body').showLoading({'vPos':'200px'   });
    	
    	$.ajax({
			url : '/admin/goods/display/midifyDisplay.htm',
    	    data:{jsonStr: JSON.stringify(pp)},
			success : function(res) {
				$('body').hideLoading();
				if(res.success){
					alert('<ui:i18n key="商品上架成功"/>');
					window.top.closeTab();
				}else{
					alert('<ui:i18n key="商品上架失败"/>!\n' + res.err_msg);
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
			 alert('<ui:i18n key="请选择商品主图片"/>!');
	  	       return false;
		 }
		 
	 
		var item = $('#app-field-header').data('fieldItem') || [] ;
	 	if(item.length < 1){
	  		   alert('<ui:i18n key="请选择商品展示图"/>!');
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
   	pp.sumPayQty = $("#SUM_PAY_QTY").val();
	pp.sumFvortQty = $("#SUM_FVORT_QTY").val();
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
			var optionId = $(this).data('priceOptionId');
			 
			if(type == "price"){
				stockObj = {};
				stockObj.id = id;
				stockObj.optionId = optionId;
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
	    	   		alert('<ui:i18n key="请输入富文本内容"/>');
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
	<!-- ▼ container  --> 
	<div class="container">
	
		<input TYPE="hidden" id="SUM_PAY_QTY" value="${displayMaster.SUM_PAY_QTY }">
		<input TYPE="hidden" id="SUM_FVORT_QTY" value="${displayMaster.SUM_FVORT_QTY }">
	
		<form action="">
       		<input type="hidden" id="goodsId" value="${displayMaster.GOODS_ID }" /> 
       		<input type="hidden" id="displayId" value="${displayMaster.DISPLAY_ID }" /> 
       		<input type="hidden" id="gcId" value="${displayMaster.GC_ID }" /> 
       		<input type="hidden" id="pageId" value="${pageHeader.pageId }" /> 
		</form>
        	
  		<form id="previewForm" method="post" target="_preview"  action="/admin/goods/display/displayPreview.htm">
      		<input type="hidden" id="jsonStr" name="jsonStr" value="" /> 
     	</form>
	
	
		<div class="status-bar-warp">
			<table class="status-bar-title">
				<tr>
					<td><ui:i18n key="编辑基本信息"/></td>
					<td><ui:i18n key="编辑商品详情"/></td>
				</tr>
			</table>
			<div class="status-bar goods-step-1 js-status-bar"></div>
		</div>
		
		<div style="background-color: #e3e3e3;width: 100%;height: 1px; margin: 30px 0;">
	  	</div>
	
		<div class="contents-step js-contents-step js-contents-step1 clearfix">
		 	<div class="form-warp clearfix" >
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="标准商品分类"/> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	 <span id="step2_goods_category">${displayMaster.GC_NM }</span>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="上架标题"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="descTitle" placeholder="<ui:i18n key="请输入上架标题"/>(<ui:i18n key="最多可以输入20个字符"/>)"   maxlength="20"  class="w30" value="${displayMaster.DESC_TITLE }"/>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="上架内容"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
				  		<textarea id="descDetail" cols="100"  class="w30" style="height: 60px; text-align: left;resize: none;" >${displayMaster.DESC_DETAIL}</textarea>	 
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="新旧区分"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input class="icradio" type="radio" name="isUsed" id="isUsedYes" value="1" <c:if test="${displayMaster.IS_USED eq 1 }"> checked="checked" </c:if> />&nbsp;&nbsp;<ui:i18n key="全新"/>
     		 			 &nbsp;&nbsp;&nbsp;
     		 			<input class="icradio" type="radio" name="isUsed" id="isUsedNo" value="2" <c:if test="${displayMaster.IS_USED eq 2 }"> checked="checked" </c:if> />&nbsp;<ui:i18n key="二手"/>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="商品标签"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	  <ul class="tag-list js-tag-list">
	  			 	 	  	<c:forEach items="${requestScope.tagIdSplit}" var="item" varStatus="status">
	  			 	 	  	
	  			 	 	  		<li class="tag-item">
	  			 	 	  			<span>${item}</span>
	  			 	 	  			<a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a>
	  			 	 	  		</li>
	  			 	 	  		<li class="tag-split"><img alt="" src="/admin/images/icon/icon-sp.png"></li>
							</c:forEach>
								<li><img class="js-add-tag addicon-small" src="/admin/images/icon/icon-plus2.png"  ><ui:i18n key="查询新标签"/>(<ui:i18n key="查询关键词"/>) </li>
							 </ul>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="商品分类"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="goods-class-level1" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw15"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.goodClassLevel1}" var="items" varStatus="status">
								<option value="${items.SGC_ID}" <c:if test="${displayMaster.SGC_ID_LV1 eq items.SGC_ID }"> selected="selected" </c:if>>${items.SGC_NM}</option>
							</c:forEach>
			         	 </select>
			         	 <select id="goods-class-level2" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw15"   >
				            <option value=""></option> 
				            <c:forEach items="${requestScope.goodClassLevel2}" var="items" varStatus="status">
								<option value="${items.SGC_ID}" <c:if test="${displayMaster.SGC_ID_LV2 eq items.SGC_ID }"> selected="selected" </c:if>>${items.SGC_NM}</option>
							</c:forEach>
			         	 </select>
						 <img class="addicon" id="goodsClassAdd" style="" src="/admin/images/icon/icon-plus2.png"  >
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
						 <ui:i18n key="商品规格"/><a class="label-required"></a> :  	 
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label" style="width: 80px" >
	  			 		   <ui:i18n key="规格"/>1:
	  			 	 	</div>
	  			 	 	<select id="goods-spec-big1" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw36"    disabled="disabled"  >
				            <option value=""></option>
				            <c:forEach items="${requestScope.goodsSpecBigCombo}" var="items" varStatus="status">
								<option value="${items.SPEC_ID}" <c:if test="${bigSpecId1 eq items.SPEC_ID }"> selected="selected" </c:if>>${items.SPEC_NM}</option>
							</c:forEach>
			         	 </select>
						 <img class="addicon" id="addGoodsSpec11" style="display: none;" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="添加商品规格一级分类"/>"  />
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label"  style="width: 80px" >
	  			 	 	 </div>
	  			 	 	 <select id="goods-spec-small1" data-placeholder="<ui:i18n key="请选择"/>" class="chosen-select-deselect sw36" multiple     disabled="disabled" >
	  			 	 	 	<option value=""></option>
	  			 	 	 	 <c:forEach items="${requestScope.goodsSpecSmall1Combo}" var="items" varStatus="status">
		  			 	 		   <c:set  value="false" var="isSelected"></c:set>
		  			 	 			<c:forEach items="${requestScope.smallSpecIds1}" var="items2" varStatus="status2">
		  			 	 				<c:if test="${items2 eq items.SPEC_VALUE_ID}">
		  			 	 			 		<c:set  value="true" var="isSelected"></c:set>
		  			 	 				</c:if>
									</c:forEach>
									<option value="${items.SPEC_VALUE_ID}" <c:if test="${isSelected}"> selected="selected" </c:if>>${items.SPEC_VALUE_NM}</option>
								</c:forEach>
						 </select>
						 <img class="addicon" id="addGoodsSpec12" style="display: none;" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="添加商品规格二级分类"/>" />
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label"   style="width: 80px" >
	  			 		   <ui:i18n key="规格"/>2:
	  			 	 	</div>
	  			 	 	<select id="goods-spec-big2" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw36"    disabled="disabled"  >
				            <option value=""></option>
				             <c:forEach items="${requestScope.goodsSpecBigCombo}" var="items" varStatus="status">
								<option value="${items.SPEC_ID}" <c:if test="${bigSpecId2 eq items.SPEC_ID }"> selected="selected" </c:if>>${items.SPEC_NM}</option>
							</c:forEach>
			         	 </select>
						 <img class="addicon" id="addGoodsSpec21" style="display: none;" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="添加商品规格一级分类"/>"  />
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
					</div>
	  			 	 <div class="form-control">
	   					 <div class="form-label"  style="width: 80px" >
	  			 	 	 </div>
	  			 	 	 <select id="goods-spec-small2" data-placeholder="<ui:i18n key="请选择"/>" class="chosen-select-deselect sw36" multiple   disabled="disabled"   >
	  			 	 	 	<option value=""></option>
	  			 	 	 	<c:forEach items="${requestScope.goodsSpecSmall2Combo}" var="items" varStatus="status">
		  			 	 		   <c:set  value="false" var="isSelected"></c:set>
		  			 	 			<c:forEach items="${requestScope.smallSpecIds2}" var="items2" varStatus="status2">
		  			 	 				<c:if test="${items2 eq items.SPEC_VALUE_ID}">
		  			 	 			 		<c:set  value="true" var="isSelected"></c:set>
		  			 	 				</c:if>
									</c:forEach>
									<option value="${items.SPEC_VALUE_ID}" <c:if test="${isSelected}"> selected="selected" </c:if>>${items.SPEC_VALUE_NM}</option>
								</c:forEach>
						 </select>
						 <img class="addicon" id="addGoodsSpec22" style="display: none;" src="/admin/images/icon/icon-plus2.png" title="<ui:i18n key="添加商品规格二级分类"/>" />
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp" id="goods-stock-area" >
	  			  	<!-- ---------------------------------- -->
	  			  		<div class="form-label" style="vertical-align:top;" >
						 	<ui:i18n key="商品库存"/><a class="label-required"></a> : 
					 	</div>
					 	<div class="form-control">
						 	<table id="goods-stock" class="table goods-stock" style="width: 500px; ">
									<thead>
										<tr> 
										<c:choose>
											<c:when test="${not empty dispalyPriceList[0].SPEC_ID_2}">
												<td data-spec-id="${dispalyPriceList[0].SPEC_ID_1}" style="width: 20%;" >${dispalyPriceList[0].SPEC_NM_1}</td>  
												<td data-spec-id="${dispalyPriceList[0].SPEC_ID_2}" style="width: 20%;" >${dispalyPriceList[0].SPEC_NM_2}</td>  
											</c:when>
											<c:otherwise>
												<td data-spec-id="${dispalyPriceList[0].SPEC_ID_1}" style="width: 40%;" >${dispalyPriceList[0].SPEC_NM_1}</td>  
											</c:otherwise>
										</c:choose>
											<th style="width: 20%;"><ui:i18n key="原价"/></th>
											<th style="width: 20%;"><ui:i18n key="单价"/></th>
											<th style="width: 20%;"><ui:i18n key="库存"/></th>
										</tr>
									</thead>
									<tbody> 
										<c:forEach items="${requestScope.dispalyPriceList}" var="items" varStatus="status">
											 
										<tr>
											<c:choose>
											<c:when test="${not empty items.SPEC_ID_2}">
												<td data-spec-id="${items.SPEC_VALUE_ID_1}" >${items.SPEC_VALUE_NM_1}</td>  
											<td data-spec-id="${items.SPEC_VALUE_ID_2}" >${items.SPEC_VALUE_NM_2}</td>  
											</c:when>
											<c:otherwise>
												<td data-spec-id="${items.SPEC_VALUE_ID_1}" >${items.SPEC_VALUE_NM_1}</td>  
											</c:otherwise>
										</c:choose>
											<td class="text-center" ><input type="text" name="sku_price" class="js-price"	 data-id="${items.ROWID}" data-price-option-id="${items.PRICE_OPTION_ID }" data-type="price" data-name="原价" value="<ui:money  value="${items.PRICE_ORG }" />"  style="width: 50px;text-align:center;" ></td>
											<td class="text-center" ><input type="text" name="sku_price" class="js-unit"	 	 data-id="${items.ROWID}" data-price-option-id="${items.PRICE_OPTION_ID }" data-type="unit" data-name="单价" value="<ui:money  value="${items.PRICE_UNIT_SALES }" />"  style="width: 50px;text-align:center;" ></td>
											<td class="text-center" ><input type="text" name="stock_num" class="js-stock-num" data-id="${items.ROWID}" data-price-option-id="${items.PRICE_OPTION_ID }" data-type="stock" data-name="库存" value="${items.STOCK_NOW }"  style="width: 50px;text-align:center;" ></td>  
										</tr>
										</c:forEach>
								 
									</tbody>
								</table> 
				  			</div>  
	  			  	<!-- ---------------------------------- -->
	  			  </div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="库存位置"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="goods-stock-province" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw15"   >
				             <option value=""></option>
				          	<c:forEach items="${requestScope.provinceCombo}" var="items" varStatus="status">
								<option value="${items.AREAID}" <c:if test="${displayMaster.STOCK_AREA_ID_LV1 eq items.AREAID }"> selected="selected" </c:if>>${items.AREANAME}</option>
							</c:forEach>
			         	 </select>
			         	 <select id="goods-stock-city" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw15"   >
				            <option value=""></option> 
				            <c:forEach items="${requestScope.cityCombo}" var="items" varStatus="status">
								<option value="${items.AREAID}" <c:if test="${displayMaster.STOCK_AREA_ID_LV2 eq items.AREAID }"> selected="selected" </c:if>>${items.AREANAME}</option>
							</c:forEach>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="物流费"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="transSheetId" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw33"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.goodTransportCombo}" var="items" varStatus="status">
								<option value="${items.TRANS_SHEET_ID}" <c:if test="${displayMaster.TRANS_SHEET_ID eq items.TRANS_SHEET_ID }"> selected="selected" </c:if> >${items.TRANS_SHEET_NM}</option>
							</c:forEach>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			 
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="是否使用优惠券"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="voucherUse" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw33"   >
				            <option value=""></option>
				             <c:forEach items="${requestScope.voucherAbleCombo}" var="items" varStatus="status">
								<option value="${items.VOUCHER_ID}"  <c:if test="${displayMaster.COUPON_ID eq items.VOUCHER_ID }"> selected="selected" </c:if> >${items.VOUCHER_NM}</option>
							</c:forEach>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="折扣政策"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
						<select id="voucherUse" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw33"   >
				            <option value=""></option>
				             <c:forEach items="${requestScope.discountPolicyCombo}" var="items" varStatus="status">
								<option value="${items.VOUCHER_ID}"  <c:if test="${displayMaster.DISCOUNT_ID eq items.VOUCHER_ID }"> selected="selected" </c:if> >${items.VOUCHER_NM}</option>
							</c:forEach>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="发布时间"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="startDate" class="w12 datepicker" readonly="readonly" value="${displayMaster.START_DT }" />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
	  			 	 	<input type="text" id="endDate" class="w12 datepicker" readonly="readonly" value="${displayMaster.END_DT }"  />
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="预售商品与否"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input class="icradio" type="radio" name="reserve" id="reserveYes" value="1" <c:if test="${displayMaster.RESERVE eq 1 }"> checked="checked"  </c:if> />&nbsp;&nbsp;<ui:i18n key="是"/>
     		 			 &nbsp;&nbsp;&nbsp;
     		 			<input class="icradio" type="radio" name="reserve" id="reserveNo" value="0" <c:if test="${displayMaster.RESERVE eq 0 }"> checked="checked"  </c:if> />&nbsp;<ui:i18n key="否"/>
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp js-reserve-date"  style=" <c:if test="${displayMaster.RESERVE eq 0 }"> display: none; </c:if>" >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="预售截止时间"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="reserveEndDate" class="w12 datepicker" readonly="readonly" value="${reserveEndDate }"/>
						<select id="reserveEndTime" data-placeholder="<ui:i18n key="请选择"/>" class="select2 sw9"   >
				            <option value=""></option>
				            <option value="0" <c:if test="${reserveEndTime eq 0 }">  selected="selected"  </c:if> >00:00</option>
				            <option value="1" <c:if test="${reserveEndTime eq 1 }">  selected="selected"  </c:if> >01:00</option>
				            <option value="2" <c:if test="${reserveEndTime eq 2 }">  selected="selected"  </c:if> >02:00</option>
				            <option value="3" <c:if test="${reserveEndTime eq 3 }">  selected="selected"  </c:if> >03:00</option>
				            <option value="4" <c:if test="${reserveEndTime eq 4 }">  selected="selected"  </c:if> >04:00</option>
				            <option value="5" <c:if test="${reserveEndTime eq 5 }">  selected="selected"  </c:if> >05:00</option>
				            <option value="6" <c:if test="${reserveEndTime eq 6 }">  selected="selected"  </c:if> >06:00</option>
				            <option value="7" <c:if test="${reserveEndTime eq 7 }">  selected="selected"  </c:if> >07:00</option>
				            <option value="8" <c:if test="${reserveEndTime eq 8 }">  selected="selected"  </c:if> >08:00</option>
				            <option value="9" <c:if test="${reserveEndTime eq 9 }">  selected="selected"  </c:if> >09:00</option>
				            <option value="10" <c:if test="${reserveEndTime eq 10 }">  selected="selected"  </c:if> >10:00</option>
				            <option value="11" <c:if test="${reserveEndTime eq 11 }">  selected="selected"  </c:if> >11:00</option>
				            <option value="12" <c:if test="${reserveEndTime eq 12 }">  selected="selected"  </c:if> >12:00</option>
				            <option value="13" <c:if test="${reserveEndTime eq 13 }">  selected="selected"  </c:if> >13:00</option>
				            <option value="14" <c:if test="${reserveEndTime eq 14 }">  selected="selected"  </c:if> >14:00</option>
				            <option value="15" <c:if test="${reserveEndTime eq 15 }">  selected="selected"  </c:if> >15:00</option>
				            <option value="16" <c:if test="${reserveEndTime eq 16 }">  selected="selected"  </c:if> >16:00</option>
				            <option value="17" <c:if test="${reserveEndTime eq 17 }">  selected="selected"  </c:if> >17:00</option>
				            <option value="18" <c:if test="${reserveEndTime eq 18 }">  selected="selected"  </c:if> >18:00</option>
				            <option value="19" <c:if test="${reserveEndTime eq 19 }">  selected="selected"  </c:if> >19:00</option>
				            <option value="20" <c:if test="${reserveEndTime eq 20 }">  selected="selected"  </c:if> >20:00</option>
				            <option value="21" <c:if test="${reserveEndTime eq 21 }">  selected="selected"  </c:if> >21:00</option>
				            <option value="22" <c:if test="${reserveEndTime eq 22 }">  selected="selected"  </c:if> >22:00</option>
				            <option value="23" <c:if test="${reserveEndTime eq 23 }">  selected="selected"  </c:if> >23:00</option>
			         	 </select>
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp"  style="display: none;">
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="发布备注"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
				  		<textarea id="displayMemo" cols="100"  class="w30" style="height: 60px; text-align: left;resize: none;" ></textarea>	 
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp "  style="display: none;">
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="活动内容"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  id="eventDesc" placeholder='<ui:i18n key="请输入活动内容"/>...' class="w30"  />
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp "  >
	  			 	<div class="form-label" style="position: absolute;" >
	  			 	 	<span><ui:i18n key="商品主图片"/><a class="label-required"></a> :</span>
	  			 	 </div>
	  			 	 <div class="form-control" style="margin-left:110px;">
	  			 	 	<div class="js-mian-img-warp clearfix" >
	  			 	 		<div class="form-pic" data-file-id="${displayMaster.GOODS_LIST_IMG }" >
								<img alt="${displayMaster.GOODS_LIST_IMG_NM }" src="${displayMaster.GOODS_LIST_IMG_URL }">
								<div class="pic-del-mask">
									<div class="pic-del" onclick="delMainPic(this);"></div>
								</div>
							</div>
	  			 	 		<%-- <div class="form-pic">
	  			 	 			<img alt="挖掘机DX340LC-9C" src="/uploads/16/2015/06/19/16_goods_2015_06_19_13_01_32_86988.jpg">
	  			 	 			<div class="pic-del-mask">
	  			 	 				<div class="pic-del" onclick="delMainPic(this);">1</div>
	  			 	 			</div>
							</div> --%>
		  			 	 	<div class="pic-add js-main-img-add">
								<span><ui:i18n key="添加图片"/></span>
							</div>
							<div class="pic-tip js-main-img-tip" <c:if test="${displayMaster.RESERVE eq 1 }">style="display: none;" </c:if>>
								<ui:i18n key="图片推荐尺寸"/> ：(320px * 320px)
							</div>
							<div class="pic-tip js-reserve-main-img-tip" <c:if test="${displayMaster.RESERVE eq 0 }">style="display: none;" </c:if>>
								<ui:i18n key="预售商品应上传的图片尺寸为"/> ：(400px * 190px)
							</div>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
  			 </div>
		    
		    <div style="text-align: center;">
			 	 <span class="button js-to-step2" style="padding-right: 6px;" onclick="">
       		   	  	<span class="button-icon arrow-right" style="float: right;"></span>
       		   	  	<span class="button-name" style="float: right;"><ui:i18n key="下一步"/></span> 
       		   	</span>
			 </div> 
			 
		</div>
		
		
		<div class="contents-step js-contents-step js-contents-step2 clearfix"  style="display: none;">
		 	<div id="app-region" class="app-region-container" >
				<div class="app-design clearfix">
					<div class="app-preview">
					 	<div class="app-header"></div>
			   			<div class="app-entry">
			   				<div class="app-config">
				        	 	<div id="app-field-header" class="app-field" style="cursor: default;" data-field-type="header" data-field-item='${slideImgsJson }'>
									<c:choose>
			                			<c:when test="${empty slideImgs}">
			                				<div class="js-top-slider-region top-slider-region">
							                    <h4>${label.Banner展示区}</h4>
							                    <p>${label.固定样式} ,${label.最多可选5个图片}</p>
							                </div>
							                <div class="sliderImg" style="display:none;">
												<ul></ul>
											</div>
			                			</c:when>
			                			<c:otherwise>
			                				<div class="js-top-slider-region top-slider-region" style="display:none;">
							                    <h4>${label.Banner展示区}</h4>
							                    <p>${label.固定样式} ,${label.最多可选5个图片}</p>
							                </div>
							                <div class="sliderImg">
												<ul>
													<c:forEach items="${slideImgs}" var="item" varStatus="status">
													   <li><a href="javascript:void(0);"><img src="${item.fileUrl }"></a></li> 
													</c:forEach>
												</ul>
											</div>
			                			</c:otherwise>
			                		</c:choose>
			            		</div>
			   				</div>
			   				
			   				<div class="app-fields js-fields-region">
			        			<div class="app-fields ui-sortable">
			        			<!-- edding area -->
			        			<c:set var="pageItems" value="${pageHeader.items }"></c:set>
			        			 <c:forEach items="${pageHeader.items }" var="items" varStatus="status">
								 		<c:choose>
								 			<c:when test='${items.tmplNo eq "01"}'>
										 		<div class="app-field clearfix ui-sortable-handle" data-field-type="type-01" data-field-item='${items.showJson}'>
													<div class="control-group"> 
													
														<c:choose>
								                			<c:when test="${empty items.details}">
								                				 <div class="type01"> 
																	<ul>
																		<li class="left js-img-left">
																			<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image5.png"  /></span>
																		</li>
																	</ul>
																</div>  
															    	<div class="sliderImg" style="display:none;">
																		<ul>
																		</ul>
																	</div>
								                			</c:when>
								                			<c:otherwise>
								                				 <div class="type01" style="display:none;"> 
																	<ul>
																		<li class="left js-img-left">
																			<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image5.png"  /></span>
																		</li>
																	</ul>
																</div>  
															    	<div class="sliderImg" >
																		<ul>
																			<c:forEach items="${items.details }" var="details" >
																				<li><a href="javascript:void(0);"><img src="${details.val01 }" alt="${details.val02 }" /></a></li>
																			</c:forEach>
																		</ul>
																	</div>
								                			 
								                				
								                			</c:otherwise>
								                		</c:choose>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit" >${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "05"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-05"  
								 					data-id="${status.index }"
								 					data-goods-group="${items.details[0].val01}"
								 					data-goods-number-type="${items.details[0].val03}" 
								 					data-goods-size="${items.details[0].val02}" 
								 					>
													<div class="control-group">
														<ul class="sc-goods-list clearfix size-1 card pic">
															<!-- 小图  -->
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
														</ul>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span> 
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "12"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-12" data-field-item='${items.showJson}'>
													<div class="control-group">
														<div class="type12"> 
															<ul>
																<li>
																	<span class="good-img-block"><img class="dispaly-img" src="${items.details[0].val01}"></span>
																</li>
															</ul>
														</div>  
														<div class="component-border"></div>
													</div>
													<div class="actions" style="text-align:center;">
														  <div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div> 
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "13"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-13"  
								 						data-field-item='${items.showJson}' 
								 						data-left-width="${items.details[0].val04}"  
								 						data-img-left-name="${items.details[0].val05}"  
								 						data-img-right-name="${items.details[1].val05}">
													<div class="control-group">
														<div class="type13"> 
															<ul>
																<li class="left js-img-left" style="width: ${items.details[0].val04}%;">
																	<span class="good-img-block"><img class="dispaly-img" src="${items.details[0].val01}"></span>
																</li>
																<li class="right js-img-right" style="width: ${items.details[1].val04}%;">
																	<span class="good-img-block"><img class="dispaly-img" src="${items.details[1].val01}"></span>
																</li>
															</ul>
														</div>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "18"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-18" data-field-item='${items.showJson}' >
													<div class="control-group">
														<div class="type18"> 
															<ul>
																<li class="left">
																	<img class="dispaly-img" src="${items.details[0].val01}">
																</li>
																<li class="left">
																	<img class="dispaly-img" src="${items.details[1].val01}">
																</li>
																<li class="left">
																	<img class="dispaly-img" src="${items.details[2].val01}">
																</li>
															</ul>
														</div>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "20"}'>
								 				<div class="app-field clearfixui-sortable-handle" data-field-type="type-20"
								 					 data-field-id="1" 
													 data-link-nm="${items.details[0].val01}" 
													 data-ink-type="${items.details[0].val02}"
													 data-link-url="${items.details[0].val03}" 
								 				>
													<div class="control-group">
														<div class="type19"> 
															<div class="type19-title js-type19-title">${items.details[0].val01}</div>
															<div class="type19-disc">
																<h3 class="type19-icon type-icon-1">+</h3>
															</div>
														</div> 
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			
								 			 
								 			<c:when test='${items.tmplNo eq "52"}'>
								 			
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-52"  
								 					data-field-item='${items.showJson}'
								 					data-goods-size="${items.details[0].val01}" 
								 					>
													<div class="control-group">
								 					<c:set value="${items.details[0].val01}" var="size52"></c:set>
								 					
								 					<c:choose>
								 						<c:when test="${size52 eq 0 }">
								 						  <ul class="sc-goods-list clearfix size-${size52} card pic">
								 							<c:set value="${3 - fn:length(items.details)}" var="diff"></c:set>
								 							<c:forEach items="${items.details }" var="details" > 
																 <!-- 大图  -->
																<li class="goods-card big-pic card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="${details.val04}" style="width:100%; height:auto;">
																		</div>
																	</a>
																</li>
																
															</c:forEach>
															<c:if test="${diff gt 0}">
															<c:forEach begin="1" end="${diff }" var="item" > 
																  <!-- 大图  -->
																<li class="goods-card big-pic card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
																		</div>
																	</a>
																</li>
															</c:forEach>
															</c:if>
								 							</ul>
															<div class="component-border"></div>
								 						</c:when>
								 						<c:when test="${size52 eq 1 }">
								 							<ul class="sc-goods-list clearfix size-${size52} card pic">
								 							<c:set value="${4 - fn:length(items.details)}" var="diff"></c:set>
								 							<c:forEach items="${items.details }" var="details" > 
																 <!-- 小图  -->
																<li class="goods-card small-pic card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="${details.val04}" style="width:100%; height:auto;">
																		</div>
																	</a>
																</li>
																
															</c:forEach>
															<c:if test="${diff gt 0}">
															<c:forEach begin="1" end="${diff }" var="item" > 
																  <!-- 小图  -->
																	<li class="goods-card small-pic card ">
																		<a href="javascript: void(0);" class="link js-goods clearfix">
																			<div class="photo-block">
																				<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png" >${diff }
																			</div>
																			
																		</a>
																	</li>
															</c:forEach>
															</c:if>
								 							</ul>
															<div class="component-border"></div>
								 						</c:when>
								 						<c:otherwise>
								 							<ul class="sc-goods-list clearfix size-${size52} card list">
								 							<c:set value="${4 - fn:length(items.details)}" var="diff"></c:set>
								 							<c:forEach items="${items.details }" var="details" > 
																<!-- 详细列表 -->
															<li class="goods-card card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="${details.val04}">
																	</div>
																	
																</a>
															</li>
																
															</c:forEach>
															<c:if test="${diff gt 0}">
															<c:forEach begin="1" end="${diff }" var="item" > 
																  <!-- 详细列表 -->
																<li class="goods-card card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png"> 
																		</div>
																		
																	</a>
																</li>
															</c:forEach>
															</c:if>
								 							</ul>
															<div class="component-border"></div>
								 						</c:otherwise> 
								 					</c:choose>
								 						 
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span> 
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 	 
								 			
								 			
								 			<c:when test='${items.tmplNo == "99"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-99">
													<div class="control-group">
														<div class="type99"> 
															<div class="richtext js-richtext">
																${items.details[0].val01}
															</div>
														</div> 
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:otherwise>
								 				${items.tmplNo }<br>
								 			</c:otherwise>
								 		</c:choose>
									</c:forEach>
			        			 
			        			<!-- edding area -->
			        			</div>
			        		</div>
			   				
			    		</div>
			    		<div class="app-contorls">
			    			<table style="width: 100%;">
			    				<tr>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-01"><ui:i18n key="图片滚动"/></span></td>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-05"><ui:i18n key="商品列表"/></span></td>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-52"><ui:i18n key="商品"/></span></td>
			    				</tr>
			    				<tr>
			    					<td><span class="js-new-field" data-field-type="type-12">1<ui:i18n key="张图"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-13">2<ui:i18n key="张图"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-18">3<ui:i18n key="张图"/></span></td>
			    				</tr>
			    				<tr>
			    					<td><span class="js-new-field" data-field-type="type-20"><ui:i18n key="标题栏"/></span></td>
			    					<td colspan="2"><span class="js-new-field" data-field-type="type-99"><ui:i18n key="富文本"/></span></td>
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
			 	<span class="button js-preview-setp1" style="padding-left: 6px;"  onclick="" >
       		   	  	<span class="button-icon arrow-left" style="float: left;"></span>
       		   	  	<span class="button-name"  style="float: left;"> <ui:i18n key="上一步"/> </span> 
       		   	</span> 
			 	<span class="button js-btn-upload" style="margin-left: 20px;">
       		   	  	<span class="button-name"  style="float: left;" > <ui:i18n key="上架"/> </span> 
       		   	</span> 
			 	<span class="button js-btn-preview"  style="margin-left: 20px;">
       		   	  	<span class="button-name"  style="float: left;"> <ui:i18n key="预览"/> </span> 
       		   	</span> 
			 </div> 
		</div>
	
	</div>
	<!-- ▲ container  -->
	
<jsp:include page="/admin/template/customEditorTemplate-v2.jsp" />
</body>
</html>	