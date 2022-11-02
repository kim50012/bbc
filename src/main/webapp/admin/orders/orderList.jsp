<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/orders/order.css" />  

<script type="text/javascript">
$(function(){
 	$('.js-tabs .tabpanel-header-item').click(function(){
 		 $(this).addClass('on').siblings().removeClass('on');
  		var index = $(this).data('index');
  		var target =  '.' + $(this).data('target');
  		var statusId = $(this).data('orderStatus');
  		
  		$(target).each(function(idx){
  			if($(this).data('index') == index){
  				$(this).show();
  			}else{
  				$(this).hide();
  			}
  		});
  		
  		if(statusId == 20){
  			$('.js-batch-deliver').show();
  			$('.js-batch-sign').hide();
  			
  		}else if(statusId == 30){
  			$('.js-batch-deliver').hide();
  			$('.js-batch-sign').show();
  			
  		}else{
  			$('.js-batch-deliver').hide();
  			$('.js-batch-sign').hide();
  		}
  		
  		console.log('===========' + statusId + '===============');
  		
  		
  	});
})
</script>
<script type="text/javascript">
$(function(){
	 
	$('.tabpanel-header-item').each(function(){
		var idx = $(this).data('index');
		var statusId = $(this).data('orderStatus');
		query(idx, statusId, 1, 10);  
	});
	
	
	$('.js-batch-trans-order-confirm').click(function(){
		var $p = $(this).closest('.js-order-batch-popover');
		
		alert($('.js-trans-order-no',$p).size());
		alert($p.find('.js-trans-order-no').size());
		var transComp = $('.js-trans-comp',$p).select2('val') || '';
		var transOrderNo = $('.js-trans-order-no',$p).val() || '';
		
		console.log(transComp);
		console.log(transOrderNo);
		
		var orderIds = [];
		
		$('.js-check-item',$('.tabpanel-content:not(:hidden)')).each(function(){
		   if($(this).is(':checked')){
			   orderIds.push($(this).data('orderId'));
		   }
	 	}); 
	 	
	 	if(orderIds.length == 0){
			 alert('<ui:i18n key="请先选择要批量操作的订单号"/>.');
			 return false;
		}
	 	
	 	if(transComp == ''){
			 alert('<ui:i18n key="请选择物流公司"/>.');
			 return false;
		}
	 	if(transOrderNo == ''){
			 alert('<ui:i18n key="请输入订单号"/>.');
			 return false;
		}
		
	 	if(confirm('<ui:i18n key="确认要批量发货吗"/>?')){
			$.ajax({
				url: '/admin/orders/orderBatchDeliver.htm',
				type: 'POST',
				data: {
					orderIds : orderIds.join(',')
					,transComp : transComp
					,transOrderNo : transOrderNo
				},
				success: function(res){ 
					if(res.success) {
						alert('<ui:i18n key="批量发货成功"/>.');
						orderQuery();
						reloadOrderStatic();
					} else {
						alert(res.err_msg);
					}
				},
				error: function(a, msg, c){
					alert('<ui:i18n key="网络出现故障"/>.');
				}
			});
		}
		
	});
     
	$('.js-batch-trans-order-cancel').click(function(){
		$('.js-order-batch-popover').hide();
	});
     
});


function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	var idx = $('.tabpanel-header-item.on').data('index');
	var statusId = $('.tabpanel-header-item.on').data('orderStatus');
	
	query(idx, statusId, pageNo, pageSize);
}

function orderQuery(){
	var idx = $('.tabpanel-header-item.on').data('index');
	var statusId = $('.tabpanel-header-item.on').data('orderStatus');
	query(idx, statusId, 1, 10); 
}


function query(idx, statusId, pageNo, pageSize){
	
	console.log('idx=' + idx + ',statusId=' + statusId + ',pageNo=' + pageNo + ',pageSize=' + pageSize);
	
	var orderOutNo = $('#orderOutNo').val().trim();
	var dateType = $('#dateType').val().trim();
	var startDate = $('#startDate').val().trim();
	var endDate = $('#endDate').val().trim();
	var payTypeId = $('#payTypeId').val().trim();
	var adrMobile = $('#adrMobile').val().trim();
	var adrReceiptorNm = $('#adrReceiptorNm').val().trim();
	var custNickNm = $('#custNickNm').val().trim();
	
	var params = {
			statusId : statusId
			,orderOutNo : orderOutNo
			,dateType : dateType
			,startDate : startDate
			,endDate : endDate
			,payTypeId : payTypeId
			,adrMobile : adrMobile
			,adrReceiptorNm : adrReceiptorNm
			,custNickNm : custNickNm
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	
	var url = '/admin/orders/orderListFragment.htm';
	
	 $('.js-tabs-contents').showLoading();
	 
	 $(".tabpanel-content").each(function(){
		 var $this = $(this);	
		 if($this.data('index') == idx){
			 $this.load(url , params ,  function(){
				 $this.find('.select2').select2({
					 minimumResultsForSearch:5
					 ,allowClear: true 
				}); 
				 $('.js-tabs-contents').hideLoading(); 
				 
				 $this.find('.js-order-payment-exception').hover(function(){
					 $(this).siblings('.js-order-payment-exception-popover').show();
				 },function(){
					 $(this).siblings('.js-order-payment-exception-popover').hide();
				 });
				 
				 $this.find('.js-order-deliver').click(function(){
					 $(this).siblings('.js-order-popover').show();
				 });
				 
				 $this.find('.js-order-deliver').click(function(){
					 $(this).siblings('.js-order-popover').show();
				 });
				 $this.find('.js-trans-order-confirm').click(function(){
					 var $pop = $(this).closest('.js-order-popover');
					var orderId =  $pop.data('orderId');
					var transComp = $pop.find('.js-trans-comp').select2('val') || '';
					var transOrderNo = $pop.find('.js-trans-order-no').val() || '';
					orderDeliver(orderId,transComp, transOrderNo);
				 });
				 
				 $this.find('.js-trans-order-cancel').click(function(){
					 $(this).closest('.js-order-popover').hide();
				 });
				 
				 $this.find('.js-edit-remark').click(function(){
					  var orderId = $(this).data('orderId');	
					  var placeholder = '<ui:i18n key="这是添加的一段备注"/>';
					  
					  $(this).closest('.remark-warp').find('.js-remark-tip').hide(); 
					  $(this).closest('.remark-warp').find('.js-remark-content').show().trigger('focus'); 
					  
				 });
				 
				 $this.find('.js-remark-content').blur(function(){
					 var orderId = $(this).data('orderId');	
					 var val = $(this).val();
					 $(this).hide();  
					 var placeholder = val || '<ui:i18n key="这是添加的一段备注"/>';
					 $(this).closest('.remark-warp').find('.js-remark-tip').text(placeholder).show(); 
					 
					 console.log('================='+orderId+'==========================' + val);
					 
					 $.ajax({
							url : "/admin/orders/saveRemark.htm",
							type : "POST",
							data : {
								orderId : orderId
								,remark : remark
							},
							success : function(res) {
							},
							error : function(obj, e, msg) {
								alert('<ui:i18n key="网络出现故障"/>.');
							}
						});
					 
					 
					 
					 
				 });
				 
				 
				 
				 $this.find('.js-check-all').iCheck({
			 	    checkboxClass: 'icheckbox_square-firebrick',
			 	    radioClass: 'iradio_square-firebrick',
			 	    increaseArea: '0%' // optional
			 	  });
				 
				 $this.find('.js-check-all').on('ifChecked', function(event){
					 $this.find('.js-check-item').iCheck('check');
				 });
				 $this.find('.js-check-all').on('ifUnchecked', function(event){
					 $this.find('.js-check-item').iCheck('uncheck');
				 });
				 
				 
				 /* $this.find('.js-check-all').on('ifClicked', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifChanged', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifChecked', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifUnchecked', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifToggled', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifDisabled', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifEnabled', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifIndeterminate', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifDeterminate', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifCreated', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 });
				 $this.find('.js-check-all').on('ifDestroyed', function(event){
				 	console.log(event.type + ' callback');
				 	console.log(event);
				 	console.log(event.type + ' callback end');
				 }); */
				 
				 $this.find('.js-check-item').iCheck({
			 	    checkboxClass: 'icheckbox_square-firebrick',
			 	    radioClass: 'iradio_square-firebrick',
			 	    increaseArea: '0%' // optional
			 	  });
				 
			 });
		 }
	 });
	
}

function showDetail(orderId){
	parent.ggShowTab({
		'url' : '/admin/orders/orderDetail.htm?orderId=' + orderId,
		'name' : '<ui:i18n key="所有订单"/>-<ui:i18n key="订单详情"/>',
		'icon' : 'shopoperation' 
	});  
}


function batchDeliver(){
	var orderIds = [];
	
	$('.js-check-item',$('.tabpanel-content:not(:hidden)')).each(function(){
	   if($(this).is(':checked')){
		   orderIds.push($(this).data('orderId'));
	   }
 	}); 
 	
 	if(orderIds.length == 0){
		 alert('<ui:i18n key="请先选择要批量操作的订单号"/>.');
		 return false;
	}
 	$('.js-order-batch-popover').show();
	 
 }
  function batchSign(){
	  var orderIds = [];
		
	$('.js-check-item',$('.tabpanel-content:not(:hidden)')).each(function(){
	   if($(this).is(':checked')){
		   orderIds.push($(this).data('orderId'));
	   }
 	}); 
 	
 	if(orderIds.length == 0){
		 alert('<ui:i18n key="请先选择要批量操作的订单号"/>.');
		 return false;
	}
 	
 	if(confirm('<ui:i18n key="确认要批量签收吗"/>?')){
		$.ajax({
			url: '/admin/orders/orderBatchSign.htm',
			data: {
				orderIds : orderIds.join(',')
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="批量签收成功"/>.');
					orderQuery();
					reloadOrderStatic();
				} else {
					alert(res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
 }

function exportExcel(_this){
	var statusId = $('.tabpanel-header-item.on').data('orderStatus');
	var orderOutNo = $('#orderOutNo').val().trim();
	var dateType = $('#dateType').val().trim();
	var startDate = $('#startDate').val().trim();
	var endDate = $('#endDate').val().trim();
	var payTypeId = $('#payTypeId').val().trim();
	var adrMobile = $('#adrMobile').val().trim();
	var adrReceiptorNm = $('#adrReceiptorNm').val().trim();
	var custNickNm = $('#custNickNm').val().trim();
	
	var params = {
			statusId : statusId
			,orderOutNo : orderOutNo
			,dateType : dateType
			,startDate : startDate
			,endDate : endDate
			,payTypeId : payTypeId
			,adrMobile : adrMobile
			,adrReceiptorNm : adrReceiptorNm
			,custNickNm : custNickNm
	}
	
	var url = '/admin/orders/doExcel.htm';
	
	ggFormSubmit(url,params);
	
	
	return false;
	 
	
 // $('.js-check-item',$('.tabpanel-content:not(:hidden)')).each(function(){
//	  console.log($(this).is(':checked'));
 // }) 
	 
	/* 
	 $('.js-check-all').on('ifClicked', function(event){
		 	console.log(event.type + ' callback');
		 	console.log(event.type + ' callback end');
		 }); */
	 
	// change input's state to 'checked'
	
	//alert($('.js-check-all',$('.tabpanel-content:not(:hidden)')).size());
	
	
	/* $('.js-check-all',$('.tabpanel-content:not(:hidden)')).iCheck('check'); */
	// $('.js-check-all').iCheck('check');

	 // remove 'checked' state
	// $('input').iCheck('uncheck');

	 // toggle 'checked' state
	 //$('input').iCheck('toggle');

	 // change input's state to 'disabled'
	// $('input').iCheck('disable');

	 // remove 'disabled' state
	// $('input').iCheck('enable');

	 // change input's state to 'indeterminate'
	// $('input').iCheck('indeterminate');

	 // remove 'indeterminate' state
	// $('input').iCheck('determinate');

	 // apply input changes, which were done outside the plugin
	// $('input').iCheck('update');

	 // remove all traces of iCheck
	// $('input').iCheck('destroy');
	 
	 
	 
}
function checkAll(_this){
	console.log('checkAll');
	
}



//订单操作-修改价格
function orderPriceModify(orderId){
	 
	 console.log('===========orderPriceModify=============');
	 console.log('orderId=' +　orderId);
	 
	 showIframeBpopupWindow({
			id : 'bpoupPrice',
			width : 500,
			height : 330,
			action : '/admin/orders/orderPriceModify.htm?orderId=' + orderId
		});	  	 
	 
}
function closePriceModifyWindow(){
	closeBpopupWindow('bpoupPrice');
}



//订单操作-发货
function orderDeliver(orderId,transComp, transOrderNo){
	if(transComp == ''){
		alert('<ui:i18n key="请选择物流公司"/>.');
		return;
	}
	if(transOrderNo == ''){
		alert('<ui:i18n key="请输入运单号"/>.');
		return;
	}
	
	if(confirm('<ui:i18n key="确认要发货吗"/>?')){
		$.ajax({
			url: '/admin/orders/orderDeliver.htm',
			data: {
				orderId : orderId
				,transComp : transComp
				,transOrderNo : transOrderNo
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="操作成功"/>.');
					orderQuery();
					reloadOrderStatic();
				} else {
					alert(res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
}

//订单操作-签收
function orderPaymentException(orderId){
	if(confirm('<ui:i18n key="确认要做异常支付操作吗"/>?')){
		$.ajax({
			url: '/admin/orders/orderPaymentException.htm',
			data: {
				orderId : orderId
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="异常支付操作成功"/>.');
					orderQuery();
					reloadOrderStatic();
				} else {
					alert(res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
}
//订单操作-签收
function orderSign(orderId){
	if(confirm('<ui:i18n key="确认要签收吗"/>'+'?')){
		$.ajax({
			url: '/admin/orders/orderSign.htm',
			data: {
				orderId : orderId
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="签收成功"/>.');
					orderQuery();
					reloadOrderStatic();
				} else {
					alert(res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
}

//订单操作-交易成功
function orderComplete(orderId){
	if(confirm('<ui:i18n key="确认要交易成功吗"/>?')){
		$.ajax({
			url: '/admin/orders/orderComplete.htm',
			data: {
				orderId : orderId
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="交易成功"/>.');
					orderQuery();
					reloadOrderStatic();
				} else {
					alert(res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
}

//订单操作-退款
function orderRefund(orderId, custSysId){
	
	if (orderId == '' || custSysId == '') {
		alert('<ui:i18n key="请重新加载页面"/>.');
		return;
	}
	
	if(confirm('<ui:i18n key="确认要退款吗"/>?')){
		$.ajax({
			url: '/wx/pay/payrefund.htm',
			data: {
				orderId : orderId
				,custSysId : custSysId
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="退款成功"/>.');
					orderQuery();
					reloadOrderStatic();
				} else {
					alert(res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
}
 

//订单操作-退款
function orderDelete(orderId){
 
	
	if(confirm('<ui:i18n key="您确定要删除吗"/>?')){
		$.ajax({
			url: '/admin/orders/orderDelete.htm',
			data: {
				orderId : orderId
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="删除成功"/>.');
					orderQuery();
					reloadOrderStatic();
				} else {
					alert(res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
}

//更新订单各状态的总数
function reloadOrderStatic(){
	$.ajax({
		url: '/admin/orders/reloadOrderStatic.htm',
		data: { },
		success: function(res){ 
			if(!!res.data){
				$('.tabpanel-header-item').each(function(){
					var statusId = $(this).data('orderStatus');
					
					if(statusId == ''){
						//$(this).find('span.num').text('(' + res.data.TOTAL + ')');
					}else if(statusId == 10){
						//$(this).find('span.num').text('(' + res.data.STATUS10 + ')');
					}else if(statusId == 20){
						$(this).find('span.num').text('(' + res.data.STATUS20 + ')');
					}else if(statusId == 30){
						//$(this).find('span.num').text('(' + res.data.STATUS30 + ')');
					}else if(statusId == 40){
						//$(this).find('span.num').text('(' + res.data.STATUS40 + ')');
					}else if(statusId == 50){
						//$(this).find('span.num').text('(' + res.data.STATUS50 + ')');
					}else if(statusId == 21){
						$(this).find('span.num').text('(' + res.data.STATUS21 + ')');
					}else if(statusId == 60){
						//$(this).find('span.num').text('(' + res.data.STATUS60 + ')');
					}
				});
			}
		},
		error: function(a, msg, c){
		}
	});
}


</script>
</head>

<body>
	<!-- ▼ Main container -->
	<div class="container">
		 
		 <!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="15%" />
	       		 			<col width="35%" />
	       		 			<col width="15%" />
	       		 			<col width="35%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel"><ui:i18n key="订单号"/>：</td>
	       		 			<td class="fcomp">
	       		 				<input type="text" id="orderOutNo" class="w18" value="" />
								<input type="hidden" id="hidStatusCd" value="" />
							</td>
	       		 			<td class="flabel" style="padding-left: 0px;">
	       		 				<select id="dateType" class="select2 w9" style="" data-placeholder="" >
									<option value="1"><ui:i18n key="下单时间"/></option>
									<option value="2"><ui:i18n key="付款时间"/></option>
									<option value="3"><ui:i18n key="发货时间"/></option>
									<option value="4"><ui:i18n key="到货时间"/></option>
									<option value="5"><ui:i18n key="收款时间"/></option>
								</select>
	       		 			</td>
	       		 			<td class="fcomp">
	       		 				<input type="text" id="startDate" class="w9 datepicker calendar" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
	  			 	 			<input type="text" id="endDate" class="w9 datepicker calendar" />
	       		 			</td>
	       		 		</tr>
	       		 		<tr>
	       		 			<td class="flabel" ><ui:i18n key="付款方式"/>：</td>
	       		 			<td class="fcomp">
	       		 				<select id="payTypeId" class="select2 sw18" data-placeholder="">
									<option value=""></option>
									<c:forEach items="${requestScope.payCodeList}" var="items" varStatus="status">
										<option value="${items.PAY_TYPE_ID}">${items.PAY_NAME}</option>
									</c:forEach>
								</select>
	       		 			</td>
	       		 			<td class="flabel" <c:if test="${currLanguage eq 'ko-KR'}" >style="padding-left:0;"</c:if>><ui:i18n key="收货人手机"/>：</td>
	       		 			<td class="fcomp">
								<input type="text" id="adrMobile" class="w18" value="" />
							</td>
	       		 		</tr>
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="收货人姓名"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<input type="text" id="adrReceiptorNm" class="w18" value="" />
	       		 			</td>
	       		 			<td class="flabel last"  <c:if test="${currLanguage eq 'ko-KR'}" >style="padding-left:0;"</c:if>><ui:i18n key="微信昵称"/>：</td>
	       		 			<td class="fcomp last">
								<input type="text" id="custNickNm" class="w18" value="" />
							</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<!-- -->
	       		<div class="butttn-area m3" >
	       		   <span class="button" onclick="orderQuery();">
	       		   	  <span class="button-icon search"></span>
	       		   	 <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	  		
	  		<!-- ▼ Tab  --> 
	      	<div class="tabpanel mgt20">
	      			<div class="tabpanel-header">
	      				<div class="js-tabs tabpanel-header-items clearfix">
	      					<div class="tabpanel-header-item" data-order-status="" data-index="1" data-target="tabpanel-content"><ui:i18n key="所有订单"/> <span class="num"><%-- (${orderStatic.TOTAL }) --%></span></div>
	      					<div class="tabpanel-header-item on"  data-order-status="10" data-index="2" data-target="tabpanel-content"><ui:i18n key="待付款"/><span class="num"><%-- (${orderStatic.STATUS10 }) --%></span></div>
	      					<div class="tabpanel-header-item"  data-order-status="20" data-index="3" data-target="tabpanel-content"><ui:i18n key="待发货"/><span class="num">(${orderStatic.STATUS20 })</span></div>
	      					<div class="tabpanel-header-item"  data-order-status="30" data-index="4" data-target="tabpanel-content"><ui:i18n key="已发货"/><span class="num"><%-- (${orderStatic.STATUS30 }) --%></span></div>
	      					<div class="tabpanel-header-item"  data-order-status="40" data-index="5" data-target="tabpanel-content"><ui:i18n key="已签收"/><span class="num"><%-- (${orderStatic.STATUS40 }) --%></span></div>
	      					<div class="tabpanel-header-item"  data-order-status="50" data-index="6" data-target="tabpanel-content"><ui:i18n key="交易成功"/><span class="num"><%-- (${orderStatic.STATUS50 }) --%></span></div>
	      					<div class="tabpanel-header-item"  data-order-status="21" data-index="7" data-target="tabpanel-content"><ui:i18n key="退款订单"/><span class="num">(${orderStatic.STATUS21 })</span></div>
	      					<div class="tabpanel-header-item"  data-order-status="60" data-index="8" data-target="tabpanel-content"><ui:i18n key="退款成功"/><span class="num"><%-- (${orderStatic.STATUS60 }) --%></span></div>
	      				</div>
	      				
	      				<div class="tabpanel-tools" style="right: 5px;">
	      				   <span class="tabpanel-tool js-batch-deliver" style="display: none; margin-right: 10px;">
	      				  	 <c:if test="${currLanguage eq 'zh-CN'}">
			       		   	  <img style="margin-right: 5px;" alt="" src="/admin/images/v2-icons/ico_export.png" onclick="batchDeliver()"  />  
			       		   	  </c:if>
							 <span onclick="batchDeliver()"><ui:i18n key="批量发货"/> </span>  
							   <div class="order-popover tipright js-order-batch-popover"  	style="right: 90px; top:-20px;  z-index: 30; ">
								 			<div class="form-warp clearfix text-left" style="width: 330px;">
									  			 <div class="control-warp"  >
									  			 	 <div class="form-label" style="width: 100px;">
									  			 		${label.物流公司} : 
									  			 	 </div>
									  			 	 <div class="form-control">
									  			 	 	<select class="select2 sw18 js-trans-comp" data-placeholder="${label.物流公司}">
															<option value=""></option>										
															<c:forEach items="${transCompList}" var="trans" varStatus="status">
																<option value="${trans.TRANS_COMP_ID}">${trans.TRANS_COMP_NM}</option>
															</c:forEach>
														</select>
									  			 	 </div>
									  			 </div>
									  			 <div class="control-warp"  >
									  			 	 <div class="form-label" style="width: 100px;">
									  			 		${label.运单号} : 
									  			 	 </div>
									  			 	 <div class="form-control">
									  			 	 	<input type="text" class="w18 js-trans-order-no" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									  			 	 </div>
									  			 </div>
									  			<div class="control-warp text-center">
									  				<div class="buttons-action">
										  				<span class="button bg-orange js-batch-trans-order-confirm">
															<span class="button-icon conform"></span>
															${label.确认}
														</span>
														<span class="button bg-orange  js-batch-trans-order-cancel">
															<span class="button-icon cancel"></span>
															${label.取消}
														</span>
									  				</div>
									  			</div>
								  			</div>
										</div>
			       		   </span>
	      				   <span class="tabpanel-tool js-batch-sign" onclick="batchSign();" style="display: none;margin-right: 10px;">
	      				  	 <c:if test="${currLanguage eq 'zh-CN'}">
			       		   	  <img style="margin-right: 5px;" alt="" src="/admin/images/v2-icons/ico_export.png" />  
			       		   	  </c:if>
							   <ui:i18n key="批量签收"/> 
			       		   </span>
	      				   <span class="tabpanel-tool js-export-excel" onclick="exportExcel();">
	      				     <c:if test="${currLanguage eq 'zh-CN'}">
			       		   	  <img style="margin-right: 5px;" alt="" src="/admin/images/v2-icons/ico_export.png" /> 
			       		   	  </c:if>
							   <ui:i18n key="批量导出"/> 
			       		   </span>
	      				</div>
	      			</div>
	      			<div class="js-tabs-contents tabpanel-contents">
	 					<div class="tabpanel-content" data-index="1" style="display: none;"> 
						     <!-- ============ -->	  
	 						 
	 						 <!-- ============ -->
	 					</div>
	 					<div class="tabpanel-content" data-index="2"></div>
	 					<div class="tabpanel-content" data-index="3" style="display: none;"></div>
	 					<div class="tabpanel-content" data-index="4" style="display: none;"></div>
	 					<div class="tabpanel-content" data-index="5" style="display: none;"></div>
	 					<div class="tabpanel-content" data-index="6" style="display: none;"></div>
	 					<div class="tabpanel-content" data-index="7" style="display: none;"></div>
	 					<div class="tabpanel-content" data-index="8" style="display: none;"></div>
	      			</div>
	      	</div>
	      	<!-- ▲ Tab  -->	
           
			 
		<!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpoupPrice">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="修改订单价格"/>(<ui:i18n key="单位"/>:<ui:i18n key="元"/>)</h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
		 		 </div>
		 	</div>
		</div>
		<!-- ▲ bpopup area -->
         
	</div>
	<!-- ▲ Main container -->



	<!-- ▼ Main footer -->
	<!-- ▲ Main footer -->
</body>
</html>