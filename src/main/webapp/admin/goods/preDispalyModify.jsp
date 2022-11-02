<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
  <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title>${label.商品登记}::${label.编辑商品详情}</title>  
 <link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor.css" />  
<!--   <script type="text/javascript" src="/admin/js/goods/goods-editor.js"></script> -->
  <jsp:include page="/admin/js/goods/goods-editor.jsp" />
 <style type="text/css">
	 body{
		font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	}
 	.ui-nav-tab>li {
		width: 50%;
	}
	 .goods-step {
		background-image: url("/admin/images/goods/goods-step2.png");
	}
	
	.goods-step-2 {
		background-position: 0px 0px;
	}
	
	.goods-step-3 {
		background-position: 0px -20px;
	}
 	.ui-datepicker-title select{height:30px;width:50%;}
 	.ui-datepicker .ui-datepicker-title{  margin: 0 2em;}
 </style>
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

var gcId = '${displayMaster.GC_ID }';
var goodsId = '${displayMaster.GOODS_ID }';

function fnResetGoodsClass(data){
	var $combo = $('#goods-class-level1');
	  $combo.html('<option value="" ></option>');//清空select内容
	 $.ajax({
	 		data:{goodsLevel1: data.shopGoodsOneId},
			type : "POST",
			url : "/admin/goods/getGoodsLevel1.htm",
			success : function(data) {
				 var list = data.list;
					
				 if(!!list.length){
				 	 for(var i = 0 ; i < list.length ; i++){
				 	 	$combo.append('<option value="' + list[i].SGC_ID + '">' + list[i].SGC_NM + '</option>');
				 	 }
				 	$combo.select2('val',data.currentValue).trigger("change");
				 } 
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
}

$(function() {
	
	
	//$('#goods-class-level2').prop("disabled", true);
	//$('#goods-stock-city').prop("disabled", true);
	//$('#goods-spec-big1').prop("disabled", true);
	//$('#goods-spec-big2').prop("disabled", true);
	
	//$("#goods-spec-small1").val('').attr('disabled', true).trigger("chosen:updated.chosen"); 
	//$("#goods-spec-small2").val('').attr('disabled', true).trigger("chosen:updated.chosen"); 
	
	<c:if test="${not empty slideImgs}">
	  $(".sliderImg",  '#app-field-header' ).each(function(){
	  		imgSlider($(this));
		});
</c:if>

$(".sliderImg",  '.app-fields .control-group' ).each(function(){
		imgSlider($(this));
});

	
	$("#goods-spec-small1").change(showGoodsStockGrid);
	$("#goods-spec-small2").change(showGoodsStockGrid);
	
	table_rowspan('#goods-stock',1);
	
	function showGoodsStockGrid(){
		 
		var big1 = $("#goods-spec-big1").val();
		var big2 = $("#goods-spec-big2").val();
		var big1text = $("#goods-spec-big1").find("option:selected").text(); 
		var big2text = $("#goods-spec-big2").find("option:selected").text(); 
		var small1 = eval('[' + $("#goods-spec-small1").val()  + ']');
		var small2 = eval('[' + $("#goods-spec-small2").val()  + ']');
	 
		var subitems1 = [];
		var subitems2 = [];
		for(var i = 0; i < small1.length; i++){
			if(!!small1[i]){
				var item = {};
				item.code = small1[i];
				item.value = $("#goods-spec-small1").find('option[value="' + small1[i] + '"]').text()
				
				subitems1.push(item);
			}
		}
		
		
		for(var i = 0; i < small2.length; i++){
			if(!!small2[i]){
				var item = {};
				item.code = small2[i];
				item.value = $("#goods-spec-small2").find('option[value="' + small2[i] + '"]').text()
				
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
		$("#goods-stock-area").html('');
		if(items.length > 0){
			var data = {
				items:items	
			};
			
			 var tpl = _.template($("#tpi-grid-stock").html());
 
			$("#goods-stock-area").html(tpl(data));
			
		}
 
	}
	////////////
	
	
	$("#goods-stock-province").change(function(e){ 
		
		var val = $(this).val();
		var $combo = $('#goods-stock-city');
		$combo.select2('val','');
		 $combo.html('<option value="" ></option>');//清空select内容  
		if(val == ''){
			$combo.prop("disabled", true).trigger("change");
		}else{
			$combo.prop("disabled", false);
			$.ajax({
       	 		data:{province_id: val},
				type : "POST",
				url : "/admin/goods/getCityCombo.htm",
				success : function(data) {
					 var list = data.list;
					
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
	$("#goods-class-level1").change(function(e){ 
		
		var goodsLevel1 = $(this).val();
		var $combo = $('#goods-class-level2');
		$combo.select2('val','');
		 $combo.html('<option value="" ></option>');//清空select内容
		if(goodsLevel1 == ''){
			$combo.prop("disabled", true).trigger("change");
		}else{
			$combo.prop("disabled", false);
			$.ajax({
       	 		data:{goodsLevel1: goodsLevel1},
				type : "POST",
				url : "/admin/goods/getGoodsLevel2.htm",
				success : function(data) {
					 var list = data.list;
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].SGC_ID + '">' + list[i].SGC_NM + '</option>');
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
	
	
	$("#goods-class-level2").change(function(e){ 
		
	  });
	
 
	 $("#goods-spec-big1").on("change", function (e) { 
		  if($(this).val() != ''){
			  $.ajax({
		   	 		data:{
		   	 			gc_id: gcId,
		   	 			spec_id:$(this).val()
		   	 		},
					type : "POST",
					url : "/admin/goods/getShopSpecLevel2.htm",
					success : function(data) {
					 
						 var list = data.list;
						 var $combo = $('#goods-spec-small1');
						 $combo.html('');
						 if(!!list.length){
						 	 for(var i = 0 ; i < list.length ; i++){
						 	 	$combo.append('<option value="' + list[i].SPEC_VALUE_ID + '">' + list[i].SPEC_VALUE_NM + '</option>');
						 	 }
						 }else{
						 } 
						 $combo.attr('disabled', false).trigger("chosen:updated.chosen");
					},
					error : function(xhr, status, e) {
						alert("error: " + status);
					}
				});
			  
		  }else{
			  $("#goods-spec-small1").val('').attr('disabled', true).trigger("chosen:updated.chosen"); 
			  showGoodsStockGrid();
		  }
	  });
	 $("#goods-spec-big2").on("change", function (e) { 
		 if($(this).val() != ''){
			  $.ajax({
		   	 		data:{
		   	 			gc_id: gcId,
		   	 			spec_id:$(this).val()
		   	 		},
					type : "POST",
					url : "/admin/goods/getShopSpecLevel2.htm",
					success : function(data) {
						 var list = data.list;
						 var $combo = $('#goods-spec-small2');
						 $combo.html('');
						 if(!!list.length){
						 	 for(var i = 0 ; i < list.length ; i++){
						 	 	$combo.append('<option value="' + list[i].SPEC_VALUE_ID + '">' + list[i].SPEC_VALUE_NM + '</option>');
						 	 }
						 }else{
						 } 
						 $combo.attr('disabled', false).trigger("chosen:updated.chosen");
					},
					error : function(xhr, status, e) {
						alert("error: " + status);
					}
				});
			  $("#goods-spec-small2").attr('disabled', false).trigger("chosen:updated.chosen");
		  }else{
			  $("#goods-spec-small2").val('').attr('disabled', true).trigger("chosen:updated.chosen"); 
			  showGoodsStockGrid();
		  }
	  });
	
	
	
	///////////
	
 
	$('.js-to-step3').click(function(){
	 
		if($('#descTitle').val().trim() == ''){
		  alert('${label.请输入上架标题}');
		  return ;
	    };
		if($('#descDetail').val().trim() == ''){
		  alert('${label.请输入上架内容}');
		  return ;
	    };
		if($('#goods-class-level1').val()  == ''){
		  alert('${label.请选择商品分类}');
		  return ;
	    };
		if($('#goods-class-level2').val() == ''){
		  alert('${label.请选择商品分类}');
		  return ;
	    };
	    
	    if($('#goods-stock-area').html().length == 0){
			alert('${label.商品规格至少选择一个}'+'!');
			return;
		}
		
		var stockFlag = false;
		$('#goods-stock-area input').each(function(){
			var id = $(this).data('id');
			var name = $(this).data('name');
			if(name == '原价'){
				name = '${label.原价}';
			}else if(name == '单价'){
				name = '${label.单价}';
			}else if(name == '库存'){
				name = '${label.库存}';
			}
			var value = $(this).val();
			if(value ==''){
				alert(  name + '${label.信息不能为空}'+'!');
				$(this).focus();
				stockFlag = true;
				return false;
			}
			  if(isNaN(value)){
				alert( name + '${label.信息必须是数字}'+'!');
				$(this).val('').focus();
				stockFlag = true;
				return false;
			} 
			 
		});
		
		if(stockFlag){
			return ;
		}
		
	    
	    
	    if($('#goods-stock-province').val()  == '' && $('#goods-stock-city').val()  == ''){
			  alert('${label.请选择库存位置}');
			 // $('#goods-stock-province').select2('open'); 
			  return ;
		 };
    	if($('#transSheetId').val() == ''){
    		alert('${label.请选择物流费模板}'+'.');
    		return;
    	}
		if($('#startDate').val() == ''){
		  alert('${label.请选择发布开始时间}');
		 // $('#startDate').focus();
		  return ;
	    };
		
	    if($('#endDate').val() == ''){
			  alert('${label.请选择发布结束时间}');
			 // $('#endDate').focus();
			  return ;
		    };
		    
		    var date1=new Date($('#startDate').val());
			var date2=new Date($('#endDate').val());
			if(date1>date2){
				alert('${label.发布时间选择错误}'+'!');
				return;
			}   
		  
	    var reserve =  $("[name='reserve']:checked").val();
    	if(reserve == 1){
    		if($('#reserveEndDate').val() == ''){
   			  alert('${label.请选择预售截止日期}');
   			 // $('#startDate').focus();
   			  return ;
   		    };
    		if($('#reserveEndTime').val() == ''){
   			  alert('${label.请选择预售截止时间}');
   			 // $('#startDate').focus();
   			  return ;
   		    };
	   		/* var date3=new Date($('#reserveEndDate').val());
			var date4=new Date($('#reserveEndTime').val());
			if(date3>date4){
				alert('${label.预售时间选择错误}'+'!');
				return;
			}    */
		  
	     
    	}  
		  
		 var item =  $('#goods-main-img-add').data('field-item') || [];
		 if(item.length == 0){
			 alert('${label.请选择商品主图片}');
			  return ;
		 }  
		    
		    
		    
		$('.js-goods-step-img').removeClass('goods-step-1').removeClass('goods-step-2').addClass('goods-step-3');
		$('.goods-content-step').hide();
		$('.js-goods-content-step-3').show();
		$('body,html').animate({scrollTop:0},100); 
		
		//http://blog.csdn.net/xiebaochun/article/details/38676457
		
	});
	
 
	
	$('.js-preview-setp2').click(function(){
		$('.js-goods-step-img').removeClass('goods-step-1').removeClass('goods-step-3').addClass('goods-step-2');
		$('.goods-content-step').hide();
		$('.js-goods-content-step-2').show();
		$('body,html').animate({scrollTop:0},100);  
		
	});
	
	
	$(window).scroll(function () {
		if( ! $('.js-goods-content-step-3').is(':hidden')){
		  $('.js-field-area').animate({top: _.max([$('#step-content-region').offset().top -$(document).scrollTop(),60])  },100); 
		}
	});
	
	
	$('.del-tag').click(function(){
        $(this).parent().parent().next().remove(); 
        $(this).parent().parent().remove();
		
	});
	
	 $('#goods-tag-add').popover({
		placement : 'bottom',
		html : true,
		content: ' <div style=""><input type="text" id="goods-tag-input" placeholder="${label.请输入商品名称}..." style="margin-top:5px;" class="w21">'
				+ '<span class="btn js-btn-confirm">${label.确定}</span>'
				+ '<span class="btn js-btn-cancel">${label.取消}</span></div> '
		
	});
	
	var popoverObj = $('#goods-tag-add').data('popover');
	popoverObj.tip().on('click', '.js-btn-confirm', function(evt){
		var tag = $('#goods-tag-input').val() || '';
		var item = '<li>'
	 		+ '<span class="tag-split">'
	 		+ tag
	 		+'</span>'
	 		+ '<a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a> '
	 		+ '</li>'
	 		+ '<li class="li-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li>';
	 		
	 		$('#goods-tag-add').parent().before(item);
	 		$('#goods-tag-add').popover('hide');
	 		
	 		$('.del-tag').unbind('click');
	 		$('.del-tag').click(function(){
	 	        $(this).parent().parent().next().remove(); 
	 	        $(this).parent().parent().remove();
	 		});
		
	 })
	popoverObj.tip().on('click', '.js-btn-cancel', function(evt){
		 $('#goods-tag-add').popover('hide');
	 })
	 
}); 

</script>
<script type="text/javascript">
$(function(){
	 $('#goods-main-img-add').click(function(){
		 showBpopupWindow({
				id:'bpopup',
				action: '/admin/weixin/material/showImageWindow.htm?fileGroup=1&type=1'
			});	  	 
	 });
})

</script>

<link rel="stylesheet" type="text/css" href="/admin/css/test.css" /> 
</head>
<body>
	<%-- <jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType"/> 
	</jsp:include> --%>
	<!-- ▼ Main container --> 
        <div class="container">
        	<!-- ▼ Left Menu  --> 
        <%-- 	<jsp:include page="/admin/inc/menuleft.jsp">
				<jsp:param value="${topMenuType}" name="topMenuType"/> 
				<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1"/> 
				<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2"/> 
			</jsp:include> --%>
		    <!-- ▲ Left Menu  -->
		    
		    
            <%--  --%>
            <!-- ▼ detali content  --> 
            <div class="ui-right-content">
            	<form action="">
            		<input type="hidden" id="goodsId" value="${displayMaster.GOODS_ID }" /> 
            		<input type="hidden" id="displayId" value="${displayMaster.DISPLAY_ID }" /> 
            		<input type="hidden" id="gcId" value="${displayMaster.GC_ID }" /> 
            		<input type="hidden" id="pageId" value="${pageHeader.pageId }" /> 
            	</form>
            	
            	<form id="previewForm" method="post" target="_preview"  action="/admin/goods/displayPreview.htm">
            		<input type="hidden" id="jsonStr" name="jsonStr" value="" /> 
            	</form>
            
				<div class="goods-step-area" >
			  		 <div class="text-top clearfix">
			  		 	<div>
			  				<ul class="ui-nav-tab">
				  				<li>${label.编辑基本信息}  </li>
				  				<li>${label.编辑商品详情} </li>
			  				</ul>
			  			</div>
			  		</div>
			  		
			  		
			  		<div class="goods-step goods-step-2 js-goods-step-img clearfix"></div>
			   
			  		
			  		<div class="goods-content-step js-goods-content-step-2" style=" ">
			  			<div class="title-area"  >
			  				<div class="title-desc">
			  					<a class="icons-pen" href="javascript:void(0);"></a>
			  					<span>${label.编辑基本信息}</span>
			  				</div>
			  				
			  			</div>
			  		
			  			<div class="form-group clearfix" >
				  			<div class="control-group">
				  			 	 <div class="form-label">
				  			 		<a class="label-prefix"></a>${label.标准商品分类} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<span class="form-span" id="step2_goods_category">${displayMaster.GC_NM }</span>
				  			 	 </div>
				  			 </div>
			  			 
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.上架标题}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="descTitle" placeholder="${label.请输入上架标题}(${label.最多可以输入20个字符})" class="w42" maxlength="20" value="${displayMaster.DESC_TITLE }">
				  			 	 	<input TYPE="hidden" id="SUM_PAY_QTY" value="${displayMaster.SUM_PAY_QTY }">
				  			 	 	<input TYPE="hidden" id="SUM_FVORT_QTY" value="${displayMaster.SUM_FVORT_QTY }">
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.上架内容}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<textarea id="descDetail" cols="100"  class="w42" style="height: 60px; text-align: left;" >${displayMaster.DESC_DETAIL}</textarea>
				  			 	 </div>
				  			 </div>
				  			 
				  			  
				  			 
				  			 
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.新旧区分} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" name="isUsed" id="isUsedYes" value="1" <c:if test="${displayMaster.IS_USED eq 1 }"> checked="checked"  </c:if> /> ${label.全新} 
				  			 	 	&nbsp; &nbsp; &nbsp; &nbsp;
				  			 	 	<input type="radio" name="isUsed" id="isUsedNo" value="2"  <c:if test="${displayMaster.IS_USED eq 2 }"> checked="checked"  </c:if> /> ${label.二手}
				  			 	 </div>
				  			 </div>
			  			 
				  			 <div class="control-group">
				  			 	 <div class="form-label">
				  			 		<a class="label-prefix"></a>${label.商品标签} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	 <ul class="goods-tag">
				  			 	 	   <c:forEach items="${requestScope.tagIdSplit}" var="items" varStatus="status">
											 <li> 
										 		 <span class="tag-split">${items}</span> 
										 		 <a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a> 
									 		 </li> 
									 		 <li class="li-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li> 
										</c:forEach>
				  			 	 	 	<li><img id="goods-tag-add" class="ic-plus2" src="/admin/images/icon/icon-plus2.png"  >${label.查询新标签}(${label.查询关键词}) </li>
				  			 	 	 </ul>
				  			 	 </div>
				  			 </div>
			  		
				  			<div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.商品分类}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="goods-class-level1" data-placeholder="${label.请选择}" class="select2 sw21"   >
							            <option value=""></option>
							            <c:forEach items="${requestScope.goodClassLevel1}" var="items" varStatus="status">
											<option value="${items.SGC_ID}" <c:if test="${displayMaster.SGC_ID_LV1 eq items.SGC_ID }"> selected="selected" </c:if>>${items.SGC_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 	<select id="goods-class-level2" data-placeholder="${label.请选择}" class="select2 sw21"   >
							            <option value=""></option> 
							            <c:forEach items="${requestScope.goodClassLevel2}" var="items" varStatus="status">
											<option value="${items.SGC_ID}" <c:if test="${displayMaster.SGC_ID_LV2 eq items.SGC_ID }"> selected="selected" </c:if>>${items.SGC_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 	<img   id="goodsClassAdd" src="/admin/images/icon/icon-plus2.png" title="${label.添加商品分类}"    style="cursor: pointer; margin-left: 10px;"   >
				  			 	 </div>
				  			 </div>
			  			 
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.商品规格}<a class="label-required"></a>: 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<span style="display:inline-block;width:75px;">${label.规格}1：</span>
				  			 	 	<select id="goods-spec-big1" data-placeholder="${label.请选择}" class="select2 sw36"  disabled="disabled"   >
							            <option value=""></option>
							            <c:forEach items="${requestScope.goodsSpecBigCombo}" var="items" varStatus="status">
											<option value="${items.SPEC_ID}" <c:if test="${bigSpecId1 eq items.SPEC_ID }"> selected="selected" </c:if>>${items.SPEC_NM}</option>
										</c:forEach>
						         	 </select>
						         	 
						         	 <img id="addGoodsSpec" src="/admin/images/icon/icon-plus2.png"  title="${label.添加商品规格}"   style="cursor: pointer; margin-left: 10px; display: none;"  >
				  			 	 </div>
				  			 </div>
				  			  <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	  <span style="display:inline-block;width:75px;">&nbsp;</span>
				  			 	 	<select id="goods-spec-small1" data-placeholder="${label.请选择}" class="chosen-select-deselect sw36" multiple    disabled="disabled"    >
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
				  			 	 </div>
				  			 </div>
				  			  <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 	 </div>
				  			 	 <div class="form-control">
						         	 <span style="display:inline-block;width:75px;">${label.规格}2：</span>
				  			 	 	<select id="goods-spec-big2" data-placeholder="${label.请选择}" class="select2 sw36"    disabled="disabled"    >
							            <option value=""></option>
							             <c:forEach items="${requestScope.goodsSpecBigCombo}" var="items" varStatus="status">
											<option value="${items.SPEC_ID}" <c:if test="${bigSpecId2 eq items.SPEC_ID }"> selected="selected" </c:if>>${items.SPEC_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			  <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<span style="display:inline-block;width:75px;">&nbsp; </span>
				  			 	 	<select id="goods-spec-small2" data-placeholder="${label.请选择}" class="chosen-select-deselect sw36" multiple    disabled="disabled"   >
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
				  			 	 </div>
				  			 </div>
			  			 
				  			  <div class="control-group" id="goods-stock-area" >
				  			  
				  			  
				  			  <!-- ---------------------------------- -->


							<div class="form-label" style="float: left;width:150px;"  >
								<a class="label-prefix"></a>${label.商品库存}<a class="label-required"></a> : 
							 </div>
							
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
										<th style="width: 20%;">${label.原价}</th>
										<th style="width: 20%;">${label.单价}</th>
										<th style="width: 20%;">${label.库存}</th>
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
										<td><input type="text" name="sku_price" class="js-price"	 data-id="${items.ROWID}" data-price-option-id="${items.PRICE_OPTION_ID }" data-type="price" data-name="原价" value="<ui:money  value="${items.PRICE_ORG }" />"  style="width: 50px;text-align:center;" ></td>
										<td><input type="text" name="sku_price" class="js-unit"	 	 data-id="${items.ROWID}" data-price-option-id="${items.PRICE_OPTION_ID }" data-type="unit" data-name="单价" value="<ui:money  value="${items.PRICE_UNIT_SALES }" />"  style="width: 50px;text-align:center;" ></td>
										<td><input type="text" name="stock_num" class="js-stock-num" data-id="${items.ROWID}" data-price-option-id="${items.PRICE_OPTION_ID }" data-type="stock" data-name="库存" value="${items.STOCK_NOW }"  style="width: 50px;text-align:center;" ></td>  
									</tr>
									</c:forEach>
							 
								</tbody>
							</table> 
				  			  
				  			  <!-- ---------------------------------- -->
				  			  
				  			  
				  			 	</div>
			  			 	<div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.库存位置}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="goods-stock-province" data-placeholder="${label.请选择}" class="select2 sw21"   >
							            <option value=""></option>
							            <c:forEach items="${requestScope.provinceCombo}" var="items" varStatus="status">
											<option value="${items.AREAID}" <c:if test="${displayMaster.STOCK_AREA_ID_LV1 eq items.AREAID }"> selected="selected" </c:if>>${items.AREANAME}</option>
										</c:forEach>
						         	 </select>
				  			 	 	<select id="goods-stock-city" data-placeholder="${label.请选择}" class="select2 sw21"   >
							            <option value=""></option> 
							             <c:forEach items="${requestScope.cityCombo}" var="items" varStatus="status">
											<option value="${items.AREAID}" <c:if test="${displayMaster.STOCK_AREA_ID_LV2 eq items.AREAID }"> selected="selected" </c:if>>${items.AREANAME}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.物流费}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="transSheetId" data-placeholder="${label.请选择}" class="select2 sw33"   >
				  			 	 		 <option value=""></option>
							            <c:forEach items="${requestScope.goodTransportCombo}" var="items" varStatus="status">
											<option value="${items.TRANS_SHEET_ID}" <c:if test="${displayMaster.TRANS_SHEET_ID eq items.TRANS_SHEET_ID }"> selected="selected" </c:if> >${items.TRANS_SHEET_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.是否使用优惠券} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="voucherUse" data-placeholder="${label.请选择}" class="select2 sw33"   >
				  			 	 		<option value=""></option>
							            <c:forEach items="${requestScope.voucherAbleCombo}" var="items" varStatus="status">
											<option value="${items.VOUCHER_ID}"  <c:if test="${displayMaster.COUPON_ID eq items.VOUCHER_ID }"> selected="selected" </c:if> >${items.VOUCHER_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.折扣政策} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="discountId" data-placeholder="${label.请选择}" class="select2 sw33"   >
				  			 	 		<option value=""></option>
							           <c:forEach items="${requestScope.discountPolicyCombo}" var="items" varStatus="status">
											<option value="${items.VOUCHER_ID}"  <c:if test="${displayMaster.DISCOUNT_ID eq items.VOUCHER_ID }"> selected="selected" </c:if> >${items.VOUCHER_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.发布时间}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	 <input type="text" id="startDate" class="w15 datepicker" readonly="readonly"  value="${displayMaster.START_DT }"> 
				  			 	 	 ~ <input type="text" id="endDate" class="w15 datepicker"  readonly="readonly" value="${displayMaster.END_DT }">
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  style="display: none;">
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.发布备注} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<textarea id="displayMemo" cols="100"  class="w30" style="height: 60px; text-align: left;" ></textarea>
				  			 	 </div>
				  			 </div>
				  			 
				  			  <div class="control-group"  style="display: none;">
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.活动内容} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="eventDesc" placeholder="${label.请输入活动内容}..." class="w30">
				  			 	 </div>
				  			 </div>
				  			 
				  			 <div class="control-group"   >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.预售商品与否} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" name="reserve" id="reserveYes" value="1" <c:if test="${displayMaster.RESERVE eq 1 }"> checked="checked"  </c:if> /> ${label.是}
				  			 	 	&nbsp; &nbsp; &nbsp; &nbsp;
				  			 	 	<input type="radio" name="reserve" id="reserveNo" value="0" <c:if test="${displayMaster.RESERVE eq 0 }"> checked="checked"  </c:if> /> ${label.否}
				  			 	 </div>
				  			 </div>
				  			 
				  			 <div class="control-group js-reserve-date" style=" <c:if test="${displayMaster.RESERVE eq 0 }"> display: none; </c:if>" >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.预售截止时间} : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="reserveEndDate" class="w15 datepicker" value="${reserveEndDate }" style="
    margin-bottom: 0px;
" readonly="readonly" >
										<select id="reserveEndTime" data-placeholder="${label.请选择}" class="select2 sw9"   >
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
				  			 
				  			 
				  			 <div class="control-group">
								<div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.商品主图片}<a class="label-required"></a> : 
				  			 	 </div>
								<div class="controls">
									<ul class="module-goods-list clearfix js-main-img " > 
										<li class="sort" data-goods-id="1"> 
											<a href="javascript:void(0);" target="_blank">
											<img src="${displayMaster.GOODS_LIST_IMG_URL }" alt="${label.商品图}" width="50" height="50"></a>
											<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
										</li>
										<li id="goods-main-img-add" data-field-item='[${goodsListImg}]'>
											<a href="javascript:void(0);" class="add-goods"><i class="icon-plus3"></i></a>
										</li>
									</ul>
								</div>
							</div>
				  			 
				  			 <div class="control-group">
								<div class="form-label"  >
				  			 		&nbsp; 
				  			 	 </div>
								<div class="controls">
									
									<span style="color:red;<c:if test="${displayMaster.RESERVE eq 1 }"> display: none; </c:if>" class="main-img-tip js-main-img-tip">${label.图片推荐尺寸}：(320px * 320px)</span>
									<span style="color:red; <c:if test="${displayMaster.RESERVE eq 0 }"> display: none; </c:if>" class="main-img-tip js-reserve-main-img-tip">${label.预售商品应上传的图片尺寸为}：400px * 190px</span>
								
									
								</div>
							</div>
							
				  		</div>
				  		
				  		<div class="navi-button-area">
				  			<!-- <span class="btn-step js-preview-setp1" ><span>上一步</span></span> -->
				  			<span class="btn-step js-to-step3" ><span>${label.下一步}</span></span>
				  		</div>
			  		</div><!-- end js-goods-content-step-2 -->
			  		 
			  		 <div class="goods-content-step js-goods-content-step-3" style="display: none; position: relative;">
			  		 	<div class="step-sp clearfix"></div>
			  		 		<div class="js-field-area" >
								<div class="field-area-header" style="">
									${label.添加内容}
								</div>
								<ul>
							        <li><a class="js-new-field" data-field-type="type-01">${label.图片滚动}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-05">${label.商品列表}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-52">${label.商品}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-12">1${label.张图}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-13">2${label.张图}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-18">3${label.张图}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-20">${label.标题栏}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-99">${label.富文本}</a></li> 
								</ul>
							</div>
			  		 	
			  		 		<!-- - -->
			  		 		<div class="app-init-container">
			               		<div id="app-region" class="app__content" >
			                       	<div class="goods-edit-area">
										<!-- --- -->
										<div id="step-content-region">
											<div class="app-design clearfix">
												<div class="app-preview">
										    		<div class="app-header"></div>
										   			 <div class="app-entry">
										        		<div class="app-config">
										            		<div id="app-field-header" class="app-field" data-id="1000000" style="cursor: default;" data-field-type="header" data-field-item2='${slideImgsJson }' >
										                		<h1><span></span></h1>
										                		
										                		<c:choose>
										                			<c:when test="${empty slideImgs}">
										                				<div class="goods-details-block">
														                    <h4>${label.Banner展示区}</h4>
														                    <p>${label.固定样式},${label.最多可选5个图片}</p>
														                </div>
														                <div class="sliderImg" style="display:none;">
																			<ul></ul>
																		</div>
										                			</c:when>
										                			<c:otherwise>
										                				<div class="goods-details-block"  style="display:none;">
														                    <h4>${label.Banner展示区}</h4>
														                    <p>${label.固定样式},${label.最多可选5个图片}</p>
														                </div>
														                <div class="sliderImg">
																			<ul>
																				<c:forEach items="${slideImgs}" var="items" varStatus="status">
																				   <li><a href="javascript:void(0);"><img src="${items.attachment_url }"></a></li> 
																				</c:forEach>
																			</ul>
																		</div>
										                				
										                			</c:otherwise>
										                		</c:choose>
										                		
												                
										            		</div>
										            		<%-- <div class="js-config-region">
										            			<div class="app-field clearfix"  data-field-type="detail" >
										            				<div class="control-group">
																        <div class="goods-details-block" style="background: #fff;">
																            <h4>商品详情区</h4>
																            <p>点击进行编辑</p>
																        </div>
																	</div>
																	<div class="actions">
																	    <div class="actions-wrap">
																	        <span class="action edit">编辑</span>
																	    </div>
																	</div>
																</div>
															</div> --%>
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
															 					data-field-size="${items.details[0].val02}" 
															 					data-field-goods_number_type="${items.details[0].val03}" 
															 					data-field-goods_group="${items.details[0].val01}"
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
															 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-13"  data-field-item='${items.showJson}' data-field-left-width="${items.details[0].val04}"  data-img-left-name="${items.details[0].val05}"  data-img-right-name="${items.details[1].val05}">
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
																				 data-field-link="${items.details[0].val03}" 
																				 data-field-name="${items.details[0].val01}" 
																				 data-field-link-type="${items.details[0].val02}"
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
															 					data-field-size="${items.details[0].val01}" 
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
										    		<div class="app-footer"></div>
										    	 
												</div>
												<div class="app-sidebar" style="margin-top: -1000px;">
												</div>
											</div>
										</div>
										<!-- --- -->
										
									</div>
			             		</div>
			                </div>    
			  		 		<!-- - -->
			  		 		<div class="navi-button-area">
					  			<span class="btn-step js-preview-setp2" ><span>${label.上一步}</span></span>
					  			<span class="btn-step js-btn-load" ><span>${label.上架}</span></span>
					  			<span class="btn-step js-btn-unload" style="display:none;"><span>${label.下架}</span></span>
					  			<span class="btn-step js-btn-preview" ><span>${label.预览}</span></span>
					  		</div>  
			  		</div><!--js-goods-content-step-3 -->
			  		 
			  	</div>	
				<!-- end22 -->
			
			</div> 
            <!-- ▲ detali content -->
        </div>

		<!-- ▲ Main container -->
		  <!-- ▼ Main footer -->
       <jsp:include page="/admin/inc/footer.jsp"></jsp:include>
		<!-- ▲  Main footer -->


<script type="text/javascript">
$(function(){
	   $('.ui-sortable').sortable({ axis: "y"});  
		  $( ".ui-sortable" ).disableSelection(); 
		  $('.app-field:first').trigger("click");
	    $('.app-field').click(bindShowSidebar);
	    
	    //上架
	    $('.js-btn-load').click(function(){
	     
	    	var item =  $('#goods-main-img-add').data('field-item') || [];
	       //var item =  $('#app-field-header').data('field-item') || [];
	   	   var item2 = $('#app-field-header').data('field-item2') || [];
	  	    if(item.length < 1){
	  	       alert('${label.请选择商品主图片}');
	  	       return false;
	  	    }
	  	   if(item2.length < 1){
	  		   alert('${label.请选择商品展示图}');
	  		   return false;
	  	   }
	    	
	    	var pp ={};
	    	pp.goodsId = goodsId;
	    	pp.displayId = $('#displayId').val();
	    	pp.gcId = gcId;
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
	    	pp.goodsListImg = item[0].id;
	    	for(var i = 0 ; i  < item2.length ; i++){
	    		eval('('+ 'pp.goodsDtlSlideImg' + (i+ 1) + ' =  item2[' +i + '].id )');
	    	}
	    	
	    	var tagSplit = [];
			$('.tag-split').each(function(){
				tagSplit.push($(this).text());			
			});
			pp.tagIdSplit = _.uniq(tagSplit).join(',');
			
			
			var  stocks = [];
			var stockObj = {};
			$('#goods-stock-area input').each(function(){
				var id = $(this).data('id');
				var type = $(this).data('type');
				var optionId = $(this).data('price-option-id');
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
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item 					    			    	   		
		    	   		}
		    	   		params.push(obj);
	    		  
		    	  }else if(type == 'type-05'){ 
		    		  var goods_group = $item.data('field-goods_group') || '';
			    	  var size = $item.data('field-size');
			    	  var goods_number_type = $item.data('field-goods_number_type');
		    	   		var obj ={
		    			   goods_group : goods_group,							    			    	   		
		    			   type : type,							    			    	   		
		    			   size : size,							    			    	   		
		    			   goods_number_type :goods_number_type				    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-12'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item 					    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-13'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var leftWidht = $item.data('field-left-width') || 50;
		    		  var imgLeftName = $item.data('imgLeftName') || '';
			    	   	var imgRightName = $item.data('imgRightName') || '';
			    		var obj ={
			    			type : type,							    			    	   		
		    			   	item : item,
		    			   	leftWidht: leftWidht,
		    			   	imgLeftName: imgLeftName,
		    			   	imgRightName: imgRightName
			    	   	}
		    	   		params.push(obj);
		    	  }else if(type == 'type-18'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-20'){ 
			    	  var name = $item.data('field-name') || '';
		    		  var link = $item.data('field-link') || '';
		    		  var linkType = $item.data('field-link-type') || '1';
		    	   		var obj ={
		    			   type : type,							    			    	   		
		    			   name : name,							    			    	   		
		    			   link : link,							    			    	   		
		    			   linkType : linkType						    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-52'){ 
		    		  
		    		  var size = $item.data('field-size');
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   size : size,							    			    	   		
		    			   item : item
		    	   		}
		    	   		params.push(obj);
			    	 
		    	  }else if(type == 'type-99'){ 
			    	  var name = $item.attr('data-field-name') || '';
		    	   		var obj ={
		    			   type : type,							    			    	   		
		    			   content : $item.find('.js-richtext').html() 							    			    	   		
		    			    					    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }
		    	  
	      });
	      
		      
		      pp.tpls = params;
		      $('body').showLoading({'vPos':'200px'   });
	      $.ajax({
				url : "/admin/goods/displayModify.htm",
				type : "POST",
	    	    data:{jsonStr: JSON.stringify(pp)},
				success : function(data) {
					$('body').hideLoading();
					if(data.success){
						alert('${label.上架成功}');
						window.top.closeTab();
						//location.href="/admin/goods/list.htm";
					}else{
						alert(data.msg);
					}
				},
				error : function(xhr, status, e) {
					$('body').hideLoading();
					alert("error: " + status);
				}
			});
	    });
	    
	    //预览
	    $('.js-btn-preview').click(function(){
	    	var item =  $('#goods-main-img-add').data('field-item') || [];
	       //var item =  $('#app-field-header').data('field-item') || [];
	   	   var item2 = $('#app-field-header').data('field-item2') || [];
	  	    if(item.length < 1){
	  	       alert('${label.请选择商品主图片}');
	  	       return false;
	  	    }
	  	   if(item2.length < 1){
	  		   alert('${label.请选择商品展示图}');
	  		   return false;
	  	   }
	    	
	    	var pp ={};
	    	pp.goodsId = goodsId;
	    	pp.displayId = $('#displayId').val();
	    	pp.gcId = gcId;
	    	pp.pageId = $('#pageId').val();
	    	pp.sgcIdSplit = $('#goods-class-level1').val() + ',' + $('#goods-class-level2').val();
	    	pp.isUsed = $("[name='isUsed']:checked").val();
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
	    	pp.sumPayQty = $("#SUM_PAY_QTY").val();
	    	pp.sumFvortQty = $("#SUM_FVORT_QTY").val();
	    	pp.goodsListImg = item[0].id;
	    	for(var i = 0 ; i  < item2.length ; i++){
	    		eval('('+ 'pp.goodsDtlSlideImg' + (i+ 1) + ' =  item2[' +i + '].id )');
	    		eval('('+ 'pp.goodsDtlSlideImgUrl' + (i+ 1) + ' =  item2[' +i + '].attachment_url )');
	    	}
	    	
	    	var tagSplit = [];
			$('.tag-split').each(function(){
				tagSplit.push($(this).text());			
			});
			pp.tagIdSplit = _.uniq(tagSplit).join(',');
			
			
			var  stocks = [];
			var stockObj = {};
			$('#goods-stock-area input').each(function(){
				var id = $(this).data('id');
				var type = $(this).data('type');
				var optionId = $(this).data('price-option-id');
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
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item 					    			    	   		
		    	   		}
		    	   		params.push(obj);
	    		  
		    	  }else if(type == 'type-05'){ 
		    		  var goods_group = $item.data('field-goods_group') || '';
			    	  var size = $item.data('field-size');
			    	  var goods_number_type = $item.data('field-goods_number_type');
		    	   		var obj ={
		    			   goods_group : goods_group,							    			    	   		
		    			   type : type,							    			    	   		
		    			   size : size,							    			    	   		
		    			   goods_number_type :goods_number_type				    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-12'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item 					    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-13'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var leftWidht = $item.data('field-left-width') || 50;
		    		  var imgLeftName = $item.data('imgLeftName') || '';
			    	   	var imgRightName = $item.data('imgRightName') || '';
			    		var obj ={
			    			type : type,							    			    	   		
		    			   	item : item,
		    			   	leftWidht: leftWidht,
		    			   	imgLeftName: imgLeftName,
		    			   	imgRightName: imgRightName
			    	   	}
		    	   		params.push(obj);
		    	  }else if(type == 'type-18'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-20'){ 
			    	  var name = $item.data('field-name') || '';
		    		  var link = $item.data('field-link') || '';
		    		  var linkType = $item.data('field-link-type') || '1';
		    	   		var obj ={
		    			   type : type,							    			    	   		
		    			   name : name,							    			    	   		
		    			   link : link,							    			    	   		
		    			   linkType : linkType						    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-52'){ 
		    		  
		    		  var size = $item.data('field-size');
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   size : size,							    			    	   		
		    			   item : item
		    	   		}
		    	   		params.push(obj);
			    	 
		    	  }else if(type == 'type-99'){ 
			    	  var name = $item.attr('data-field-name') || '';
		    	   		var obj ={
		    			   type : type,							    			    	   		
		    			   content : $item.find('.js-richtext').html() 							    			    	   		
		    			    					    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }
		    	  
	      });
	      
		      
		  	pp.tpls = params;
		    
		    window.open('', '_preview', 'width=320, height=568, menubar=no, status=no, toolbar=no');
			$('#jsonStr','#previewForm').val(JSON.stringify(pp));
			$('#previewForm').submit();
			 
	    });//预览 END
	    
	    $('input[name="reserve"]').click(function(){
			$('.main-img-tip').hide();
			if($(this).val() == 1){
	    		$('.js-reserve-main-img-tip').show();
	    		$('.js-reserve-date').show();
	    	}else{
				$('.js-main-img-tip').show();
				('.js-reserve-date').hide();
	    	}
	    	
	    });
	});
	 
</script>
		
<script type="text/javascript">
//获取商品组的下拉框
var shopGoodsClassLevelOneCombo = [];
$.ajax({
	type : "GET",
	url : "/admin/combo/list.htm?t=101",
	success : function(data) {
		shopGoodsClassLevelOneCombo = data ||[];
	},
	error : function(xhr, status, e) {
		alert("error: " + status);
	}
});
</script>
<script type="text/javascript">
$(function(){
	
	$('#goodsClassAdd').click(function(){
		$('#modal_test').find('.modal-title').text('${label.添加商品分类}');
		$('#ifr_001').attr("src",'/admin/goods/addShopGoodsClass.htm');        
		
		$('#modal_test').on('show', function () {
			//$('#ifr_001').attr("src",'/admin/goods/addShopGoodsClass.htm');        
		});     
 
		$('#modal_test').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		}).css({
	 		'position':'absolute',
	  		'top':'100px',
	  		width: '500px',  
		 	'margin-left': function () {  
		    	return -($(this).width() / 2);  
		   	}  
		}); 
	});
	
	$('#addGoodsSpec').click(function(){     
		$('#modal_test').find('.modal-title').text('${label.添加商品规格}');
		$('#ifr_001').attr("src",'/admin/goods/addShopGoodsSpec.htm?gc_id=' + gcId);        
		$('#modal_test').on('show', function () {
			//$('#ifr_001').attr("src",'/admin/goods/addShopGoodsSpec.htm?gc_id=' + gcId);        
		});     
 
		$('#modal_test').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		}).css({
	 		//'position':'absolute',
	  		'top':'100px',
	  		width: '500px',  
		 	'margin-left': function () {  
		    	return -($(this).width() / 2);  
		   	}  
		}); 
	});
	
	
	$('#modal_test').on('hidden.bs.modal', function (event) {
		$('#modal_test').find('.modal-title').text('');
		$('#ifr_001').attr("src",'');        
	});

})
</script>
	  <jsp:include page="/admin/template/customEditorTemplate.jsp" />
</body>
</html>