<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>收货地址</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ include file="/front/main/messageTip.jsp"%>

<style type="text/css"> 
body{background-color: #fafafa;}
</style>
<script type="text/javascript">
	 
	//判断标志，判断鼠标状态
	var isOut = true;
	
	//鼠标移出事件，当鼠标不在框内时候，将标志isOut改为true；
	function mouseOut(){
		isOut = true;
	}
	
	//鼠标移出事件，当鼠标在框内时候，将标志isOut改为false；
	function mouseIn(){
		isOut = false;
	}
	
	//选中当前地址，并返回到订单确认页面
	function backOrderConfirm(addressId){
		if(!isOut){
			return;	
		}
	    
	    $('#addressId','#form1').val(addressId);
		$('#form1').submit();
	}
	//修改默认的客户收货地址
	function fnSetDefaultAddress(newDefalutId){
		/* //获取默认地址的Id
		var defalutAddress = $('#defalutAddress').val();
		 
		//判断点击的是否已为默认地址，若为默认地址，返回不操作。不然继续操作。
		if(defalutAddress == newDefalutId){
			return;
		} */
	 
		$.ajax({
		 	data : {addressId : newDefalutId },
			type : "POST",
			url : "/front/orderConfirm/updateAddressDefault.htm",   //调用orderConfirm中的updateAdressDefault方法修改默认地址。
			success : function(data) {
				if(data.ret=="fail"){
					alertTip("修改默认地址失败");
				}else{
					//修改成功后，刷新当前页面，将默认地址，显示在最顶端。
					location.reload();
				}
			},
			error : function(xhr, status, e) {
				alertTip("error: " + status);
			}
		});
		//取消事物冒泡事件。
		event.cancelBubble=true;
	}
	//修改当前地址
	function updateCustAddress(addressId){
		//调用OrderConfirm中的updateAddress（）方法跳转到地址修改页面。
		window.location.href = "/front/orderConfirm/updateAddress.htm"
							 + "?addressId=" + addressId
							 + "&priceOptionId=" + $('#priceOptionId').val()
							 + "&addressIdSelected=" + $('#addressIdSelected').val()
							 + "&goods_qty_num=" + $('#goods_qty_num').val();
	}
	//删除当前地址
	function deleteAddress(id){
		
		//获取该地址是否为默认地址，默认地址不可被删除
		var defalutAddress = $('#defalutAddress').val();
		if(id == defalutAddress){
			alertTip("不能删除默认地址!");
			return false;
		}
		
		confirmTip('您确定申请退款?');
		var times=0;
		$(".confirm-button").click(function(){
			times++;
			if(times==1){
				if(closePopup()){
					var priceOptionId = $('#priceOptionId').val();
		 			var addressIdSelected = $('#addressIdSelected').val();
					
		 			if(id == addressIdSelected){
		 				addressIdSelected = defalutAddress;
		 			}
		 			var goods_qty_num = $('#goods_qty_num').val();
					
		 			$.ajax({
		 			 	data: { addressId : id },
		 				type : "POST",
		 				url : "/front/orderConfirm/deleteAddress.htm",  //调用OrderConfirm中的deleteAddress方法，删除当前地址。
		 				success : function(data) {
		 					if(data.ret == "fail"){
		 						alertTip("删除地址失败!");
		 					}else{
		 						alertTip("删除地址成功!");
		 						//调用OrderConfirm中的goodsReceipt方法，跳转到客户地址列表页面。
		 						window.location.href = "/front/orderConfirm/goodsReceipt.htm"
		 										     + "?addressId=" + addressIdSelected
		 										     + "&priceOptionId=" + priceOptionId
		 										     + "&goods_qty_num=" + goods_qty_num;
		 					}
		 				},
		 				error : function(xhr, status, e) {
		 					alertTip("error: " + status);
		 				}
		 			});
				}else{
					return false;
				}
			}
		});
				
// 		if(window.confirm("确定删除此地址吗?")){
			
// 			var priceOptionId = $('#priceOptionId').val();
// 			var addressIdSelected = $('#addressIdSelected').val();
			
// 			if(id == addressIdSelected){
// 				addressIdSelected = defalutAddress;
// 			}
// 			var goods_qty_num = $('#goods_qty_num').val();
			
// 			$.ajax({
// 			 	data: { addressId : id },
// 				type : "POST",
// 				url : "/front/orderConfirm/deleteAddress.htm",  //调用OrderConfirm中的deleteAddress方法，删除当前地址。
// 				success : function(data) {
// 					if(data.ret == "fail"){
// 						alertTip("删除地址失败!");
// 					}else{
// 						alertTip("删除地址成功!");
// 						//调用OrderConfirm中的goodsReceipt方法，跳转到客户地址列表页面。
// 						window.location.href = "/front/orderConfirm/goodsReceipt.htm"
// 										     + "?addressId=" + addressIdSelected
// 										     + "&priceOptionId=" + priceOptionId
// 										     + "&goods_qty_num=" + goods_qty_num;
// 					}
// 				},
// 				error : function(xhr, status, e) {
// 					alertTip("error: " + status);
// 				}
// 			});
// 		}
	}
</script>
</head>
<body >
	
	<form id="form1" action="/front/orderConfirm/orderConfirm.htm" method="post">
		<input type="hidden" id="addressId" name="addressId" value="" />
		<input type="hidden" id="priceOptionId" name="priceOptionId" value="${requestScope.priceOptionId}" />
		<input type="hidden" id="goods_qty_num" name="goods_qty_num" value="${requestScope.goods_qty_num}" />
	</form> 
	
	
	<input type="hidden" id="addressIdSelected" value="${requestScope.addressId}"/>

	<!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
			<ul class="addressList">
				<!--START 循环显示该用户的所有地址信息 -->
				<c:forEach items="${ addressMap}" var="list" varStatus="status">
				<li >
					<a>
						<c:choose>
							<c:when test="${list.IS_DEFAULT == 1 }">
								<input type="hidden" id="defalutAddress" value="${list.ADDRESS_ID}" />
							
								<div class="selectDiv" onmouseover="mouseIn();" onmouseout="mouseOut();">
									<img class="selectedImg" src="/front/skin/main/img/orderConfirm/A0-05b_08.png"/>
								</div>
								<span class="defaultAddress" >默认</span>
							</c:when>
							<c:otherwise>
								<div class="selectDiv" onclick="fnSetDefaultAddress(${list.ADDRESS_ID});"></div>
								<span class="defaultAddress"  onclick="fnSetDefaultAddress(${list.ADDRESS_ID});">设为默认</span>
							</c:otherwise>
						</c:choose>
						<br/>
						<span  onclick="backOrderConfirm(${list.ADDRESS_ID});" class="addressDetail">
							${list.ADR_PROVINCE_NM}${list.ADR_CITY_NM}${list.ADR_DISTRICT_NM }${list.ADR_DETAIL }
						</span>
						<span  onclick="backOrderConfirm(${list.ADDRESS_ID});" class="name" >
							${list.RECEIPTOR_NM} &nbsp;&nbsp;&nbsp; ${list.ADR_MOBILE }
						</span>
					</a>
					<div class="cartWrap" >
						<img class="del" onclick="deleteAddress(${list.ADDRESS_ID});"  src="/front/skin/main/img/orderConfirm/delete.png"/>&nbsp;&nbsp;
						<img onclick="updateCustAddress(${list.ADDRESS_ID});" src="/front/skin/main/img/orderConfirm/edit.png" /><br/>
						<c:if test="${list.ADDRESS_ID eq requestScope.addressId}">
							<img class="chk" src="/front/skin/main/img/orderConfirm/select.png"/>
						</c:if>
					</div>
				</li>
				</c:forEach>
			</ul>	
		</section>
	</div>	
	<!-- //container --> 
	 
	<!-- END -->
	<!-- Start 底部创建收货地址按钮 -->
	
	<div class="footerFixed">
		<div class="btnGroup agc">
			<a class="btn theme1" href="/front/orderConfirm/addressCreate.htm?priceOptionId=${requestScope.priceOptionId}&addressIdSelected=${requestScope.addressId}&goods_qty_num=${requestScope.goods_qty_num}&shopId=${sessionSkin.shopId}">
				<img class="btnIconPlus" src="/front/skin/main/img/orderConfirm/new.png">新建收货地址
			</a> 
		</div>
	</div>
	 
	<!-- End -->
	
</body>
</html>