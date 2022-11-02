<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>评价</title>
<%@ include file="/front/main/messageTip.jsp"%>
<style type="text/css">
.body{
	background: #FAFAFA;
}
.comprehensive{
 	width: 100%; 
 	font-size:16px;  
	color: #000; 
/*  	height: 130px;  */
}
.comp_raty_title{
	margin-left: 10px;
}
.demo{
	width:100%;
	float:left;
	font-size:16px;  
	color: #000; 
}
.desc{
margin-top: -17%
}
</style>
<script type="text/javascript">

$(function() {
	$('.function-demo1').raty({
		number: 5,//多少个星星设置
		score: 0,//初始值是设置
		targetType: 'number',//类型选择，number是数字值，hint，是设置的数组值
		path      : '/front/skin/raty',
		size      : 24,
		starOff   : 'star-off-big.png',
		starOn    : 'star-on-big.png',
		click: function(score, evt) {
			var id=$(this).attr('id');
			$("#value"+id).val(score);
		}
	});  
	$("#confirm").click(function(){
		if($("#valueserviceStar").val() == '' &&$("#valuelogisticStar").val() == ''  &&$("#valuedescStar").val() == ''){
			alertTip("请至少评一个分");
		}else{
			var data;
			$("input[name=star]").each(function(index){
				var params = {
					orderId:$("input[name=orderId]")[index].value,
					goodsId:$("input[name=goodsId]")[index].value,
					displayId:$("input[name=displayId]")[index].value,
					priceOptionId:$("input[name=priceOptionId]")[index].value,
					totalGpa:$("input[name=star]")[index].value,
					goodsGpa:$("#valuedescStar").val(),
					logisticGpa:$("#valuelogisticStar").val(),
					serviceGpa:$("#valueserviceStar").val(),
					reviewDesc:$("[name=reviewContent]")[index].value
					
				}; 
				$.ajax({
					data: params,
					dataType: "json",
					type: "POST",
					url: "/front/order/reviewInsert.htm",
					success: function(data){ 
						if(index == 0){//评价成功之后反复弹出多次成功提醒，需要改为只提醒一次。
							if(data.OUT_ERR_MSG=='S'){
								alertTip("评价成功");
								location.href='/front/order/orderList.htm';
							 }else{
								alertTip("评价失败");
							} 
						}
						
					},
					error: function(a, msg, c){
						alertTip("error: " + msg);
					}
				});
				
			});
			
		}
	});
});

</script>
</head>
<body>
	<div class="myorder">
		<div id="pCont1" class="tabSt1Cont">
			<c:forEach var="list" items="${myOrderList }" varStatus="status">
				<c:if test="${list.FLAG == 'Y' }">
					<div class="sale_price">
						<img alt="" src="/front/skin/main/img/triangle.png" class="triangle">
						<span class="title_style">${list.SHOP_NM }</span>   
				 	 	<div class="more" onclick="">
				 	 		<div class=""></div> 
				 	 		<div class="desc">${list.STATUS_NM }</div> 
				 	 	</div>    	
					</div>
				</c:if>
				<ul class="order">
					<li>
						<a href="#">
							<span class="thumb">
								<c:if test="${list.GOODS_LIST_IMG_URL==NULL }">
									<img src="/front/img_prd/demoComp/no_image.png" alt="" />
								</c:if>
								<c:if test="${list.GOODS_LIST_IMG_URL!=NULL }">
									<img src="${list.GOODS_LIST_IMG_URL }" alt="" />
								</c:if>
							</span>
							<span class="title">
								${list.GOODS_NM }
							</span>
							<span class="spec">
								${list.SPEC_NM_1 }:${list.SPEC_VALUE_NM_1 }
								&nbsp;
								${list.SPEC_NM_2 }:${list.SPEC_VALUE_NM_2 }
							</span> 
							<span class="spec">
								X${list.GOODS_QTY }
							</span>
							<span class="price">
								￥${list.PRICE_UNIT_SUM }
							</span>
						</a>
					</li> 
				</ul>
				<a href="#" class="splitline_gray"></a>
				<div  class="comprehensive">
			 		<div class="demo" >
			 			<div style="float: left;margin-top: 2px;margin-bottom: 2px;">
			 				<span class="comp_raty_title">宝贝综合评价：</span>
			 			</div>
					    <div  id="star${list.PRICE_OPTION_ID }" class="function-demo1" style="float: left;margin-left: 5px;margin-top: 2px;margin-bottom: 2px;">
					    </div>
					    <input type="hidden" id="valuestar${list.PRICE_OPTION_ID }" name="star" value=""/>
					 </div>
					 <div style="width: 100%;height: 100px;text-align: center;">
					 	<textarea rows="" cols="" style="width: 92%;height: 60px;" name="reviewContent" id="reviewContent"></textarea>
					 </div>
				</div>
				<a href="#" class="splitline_gray"></a>
				<input type="hidden" name="orderId"   	  value="${list.ORDER_ID }"/>
				<input type="hidden" name="displayId" 	  value="${list.DISPLAY_ID }"/>
				<input type="hidden" name="priceOptionId" value="${list.PRICE_OPTION_ID }"/>
				<input type="hidden" name="goodsId" 	  value="${list.GOODS_ID }"/>
			</c:forEach>
		</div>
		<div style="width: 100%;float: left;height: 10px;background: #fafafa;"></div>
		<div style="width: 100%;float: left;">
			<div class="demo" >
				<div style="float: left;margin-top: 2px;margin-bottom: 2px;">
	 				<span class="comp_raty_title">描述：</span>
	 			</div>
			    <div id="descStar" class="function-demo1" style="float: left;margin-left: 5px;margin-top: 2px;margin-bottom: 2px;">
			    </div>
			    <input type="hidden" id="valuedescStar"  value=""/>
			</div>
			<div class="demo" >
	 			<div style="float: left;margin-top: 2px;margin-bottom: 2px;">
	 				<span class="comp_raty_title">物流：</span>
	 			</div>
			    <div id="logisticStar" class="function-demo1" style="float: left;margin-left: 5px;margin-top: 2px;margin-bottom: 2px;">
			    </div>
			     <input type="hidden" id="valuelogisticStar"  value=""/>
			</div>
			<div class="demo" >
	 			<div style="float: left;margin-top: 2px;margin-bottom: 2px;">
	 				<span class="comp_raty_title">服务：</span>
	 			</div>
			    <div id="serviceStar" class="function-demo1" style="float: left;margin-left: 5px;margin-top: 2px;margin-bottom: 2px;">
			    </div>
			     <input type="hidden" id="valueserviceStar" value=""/>
			</div>
		</div>
		
	</div>
	<div style="height:100px;float: left;width: 100%;background: #fafafa;">
	</div>
	<div class="bottom_fixed length2" style="box-shadow:-1px -1px 1px #D0D0D0;background: #fafafa;">
		<div class="button">
			<a class="btn1 footer_cart" id="cancel" style="margin-top: 5px;margin-bottom: 5px;">取消</a>
			<a class="btn1 footer_bought" id="confirm" style="margin-top: 5px;margin-bottom: 5px;">确认</a>
		</div>
	</div>
<!-- 	<div style="width: 100%;height: 10px;float: left;"></div> -->
</body>
</html>