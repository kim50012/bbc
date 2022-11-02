<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="费用修改"/></title>
<style type="text/css">
 
</style>

<script type="text/javascript">
	 
	function calculate(){
		var  goodsTotal = $('.js-goods-total').val() || 0;  
		var  transTotal = $('.js-trans-total').val() || 0;  
		var  pointTotal = $('.js-point-total').val() || 0;  
		var  orderTotal = 0;  
		
		goodsTotal = parseFloat(goodsTotal);
		transTotal = parseFloat(transTotal);
		pointTotal = parseFloat(pointTotal);
		
		orderTotal = goodsTotal + transTotal + pointTotal;
		
		$('.js-goods-total').val(goodsTotal.toFixed(2));
		$('.js-trans-total').val(transTotal.toFixed(2));
		$('.js-point-total').val(pointTotal.toFixed(2));
		
		$('.js-price-dist').text(orderTotal.toFixed(2));
		
		/* console.log('goodsTotal=' + goodsTotal);
		console.log('transTotal=' + transTotal);
		console.log('pointTotal=' + pointTotal);
		console.log('orderTotal=' + orderTotal); */
		
	}
	
	
	function cancel() {
		
		parent.closePriceModifyWindow();
	}		
	function modifyPrice(orderId) {
		//parent.closePriceModifyWindow();
		
		
		var goodsTotal = $('.js-goods-total').val();
		var transTotal= $('.js-trans-total').val();
		var pointTotal = $('.js-point-total').val();
		var orderTotal = $('.js-price-dist').text();
		if (orderId == "") {
			alert('${label.请重新加载页面}'+'.');
			return;
		}
		
		if (goodsTotal == "" || transTotal == "" || pointTotal == "" || orderTotal == "") {
			alert('<ui:i18n key="请正确输入金额"/>'+'.');
			return;
		}
		if(confirm('<ui:i18n key="您确定要修改价格吗"/>'+'？')) {

			$.ajax({
				url : "/admin/orders/priceModify.htm",
				type : "POST",
				data : {
					orderId : orderId
					, goodsTotal : goodsTotal
					, transTotal : transTotal
					, pointTotal : 0//pointTotal
					, orderTotal : orderTotal
				},
				success : function(res) {
					if (res.success) {
						alert('<ui:i18n key="修改成功"/>'+'.');
						parent.orderQuery();
						parent.closePriceModifyWindow();
					} else {
						alert('<ui:i18n key="请检查信息"/>'+','+res.err_msg+'.');
					}
				},
				error : function(obj, e, msg) {
					alert('<ui:i18n key="网络出现故障"/>'+'.');
				}
			});
		}
		
	}		
	
</script>
</head>
<body>
<style>
 .popup-container{
 	position:relative;
 	/* background-color: green; */
 	padding: 20px;
 }
 
  
 
        
input, button, select, textarea {
	  font-size: 12px;
	  font-weight: normal;
	  line-height: 26px;
  }
        
 input[disabled], select[disabled], textarea[disabled], input[readonly], select[readonly], textarea[readonly]{
	  cursor: not-allowed;
	  background-color: #f7f7f7;
	  border: 1px solid #e5e5e5;
}
 
</style>

	<div class="popup-container" style="">
	 	<table style="width: 100%;">
	 		<tr class="h40">
	 			<th style="width: 19%;"></th>
	 			<th style="width: 27%;"><ui:i18n key="原价"/></th>
	 			<th style="width: 27%;"><ui:i18n key="当前支付"/></th>
	 			<th style="width: 27%;"><ui:i18n key="修改价格"/></th>
	 		</tr>
	 		<tr class="h40" style="height: 40px;">
	 			<th class=""><ui:i18n key="商品总价"/>：</th>
	 			<td class="text-center">
	 				<input class="text-center w9" readonly="readonly" value="<ui:money value="${orederPreice.PRICE_TT_BEFORE_NEGO}"/>" />
	 			</td>
	 			<td class="text-center">
	 				<input class="text-center w9" readonly="readonly" value="<ui:money value="${orederPreice.PRICE_TT_AFTER_NEGO}"/>"  />
	 			</td>
	 			<td class="text-center">
	 				<input class="text-center w9 js-goods-total" value="<ui:money value="${orederPreice.PRICE_TT_AFTER_NEGO}"/>" onKeyUp="clearNoNum(event,this)"   onBlur="checkNum(this);calculate();"/>
	 			</td>
	 		</tr>
	 		<tr class="h40" style="display: none;">
	 			<th><ui:i18n key="积分抵现"/>：</th>
	 			<td class="text-center">
	 				<input class="text-center w9" readonly="readonly" value="<ui:money value="${orederPreice.PAY_MILEAGE_POINT}"/>" />
	 			</td>
	 			<td class="text-center">
	 				<input class="text-center w9" readonly="readonly" value="<ui:money value="${orederPreice.PAY_MILEAGE_POINT}"/>" />
	 			</td>
	 			<td class="text-center">
	 				<input class="text-center w9 js-point-total" value="<ui:money value="${orederPreice.PAY_MILEAGE_POINT}"/>"  onKeyUp="clearNoNum(event,this)"   onBlur="checkNum(this);calculate();" />
	 			</td>
	 		</tr>
	 		<tr class="h40">
	 			<th><ui:i18n key="运费金额"/>：</th>
	 			<td class="text-center">
	 				<input class="text-center w9" readonly="readonly" value="<ui:money value="${orederPreice.TRANS_FEE_ORG}"/>" />
	 			</td>
	 			<td class="text-center">
	 				<input class="text-center w9" readonly="readonly" value="<ui:money value="${orederPreice.TRANS_FEE}"/>" />
	 			</td>
	 			<td class="text-center">
	 				<input class="text-center w9 js-trans-total" value="<ui:money value="${orederPreice.TRANS_FEE}"/>"   onKeyUp="clearNoNum(event,this)"   onBlur="checkNum(this);calculate();"  />
	 			</td>
	 		</tr>
	 		<tr class="h40" >
	 			<th><ui:i18n key="订单合计"/>：</th>
	 			<td class="text-center"><span class="js-price-org" style="color: #498adc;"><ui:money value="${orederPreice.PRICE_SUM_ORG}"/></span></td>
	 			<td class="text-center"><span class="js-price-current" style="color: #8bc151;"><ui:money value="${orederPreice.PRICE_SUM}"/></span> </td>
	 			<td class="text-center"><span class="js-price-dist" style="color:#498adc;"><ui:money value="${orederPreice.PRICE_SUM}"/></span> </td>
	 		</tr>
	 		<tr class="h40" >
	 			<td colspan="4" style="color: #a3a3a3; padding-left: 10px;">
	 				<ui:i18n key="收货地址"/>：${orederPreice.CUST_ADDRESS}
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="text-center" colspan="4" style="padding-top:20px;">
	 		 		<div class="buttons-action">
			  				<span class="button bg-red js-trans-order-confirm"  onclick="modifyPrice('${orederPreice.ORDER_ID}')">
								<span class="button-icon conform"></span>
								<ui:i18n key="确认"/>
							</span>
							<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancel();">
								<span class="button-icon cancel"></span>
								<ui:i18n key="取消"/>
							</span>
		  				</div>
	 			
	 			</td>
	 		</tr>
	 		
	 	</table>
	</div>
 
</body>
</html>