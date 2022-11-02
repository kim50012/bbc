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
$(function() {
	$("#selectProvince").change(function(e) {
		var val = $(this).val();
		var $combo = $('#selectCity');
		$combo.val('');
		$combo.html('<option value="" >市</option>'); //清空select内容  
		if (val == '') {
			$combo.attr("disabled", true).trigger("change");
		} else {
			$combo.attr("disabled", false);
			$.ajax({
				data: {
					areaParentId: val,
					areaLevel: '2'
				},
				type: "POST",
				url: "/front/orderConfirm/getMapTwoList.htm",
				//调用OrderConfirm中的getMapTwoList方法，获取市地址信息。
				success: function(data) {
					var list = data.list;
					if ( !! list.length) {
						for (var i = 0; i < list.length; i++) {
							$combo.append('<option value="' + list[i].areaId + '">' + list[i].areaName + '</option>');
						}
					}
				},
				error: function(xhr, status, e) {
					alertTip("error: " + status);
				}
			});
		}
	});

	$("#selectCity").change(function(e) {
		var val = $(this).val();
		var $combo = $('#selectArea');
		$combo.val('');
		$combo.html('<option value="" >区</option>'); //清空select内容  
		if (val == '') {
			$combo.attr("disabled", true).trigger("change");
		} else {
			$combo.attr("disabled", false);
			$.ajax({
				data: {
					areaParentId: val,
					areaLevel: '3'
				},
				type: "POST",
				url: "/front/orderConfirm/getMapTwoList.htm",
				//调用OrderConfirm中的getMapTwoList方法，获取区地址信息。
				success: function(data) {
					var list = data.list;
					if ( !! list.length) {
						for (var i = 0; i < list.length; i++) {
							$combo.append('<option value="' + list[i].areaId + '">' + list[i].areaName + '</option>');
						}
					}
				},
				error: function(xhr, status, e) {
					alertTip("error: " + status);
				}
			});
		}
	});
});
//修改默认地址
function modifyAddress() {
	//获取收货人姓名
	var receiptopName = $('#RECEIPTOR_NM').val();
	if (receiptopName == "") {
		alertTip("请输入收货人姓名");
		return;
	}
	//获取收货人的手机号
	var adrMobile = $('#ADR_MOBILE').val();
	if (adrMobile == "") {
		alertTip("请输入收货人手机号");
		return;
	} else {
		if (!adrMobile.match(/^\d{11}$/)) {
			alertTip("手机号格式不正确");
			return;
		}
	}
	//获取联系人地址 省
	var addressProvinceId = $('#selectProvince').find('option:selected').val();
	var addressProvinceNm = $('#selectProvince').find('option:selected').text();
	if (addressProvinceId == "") {
		alertTip("请选择省");
		return;
	}
	//获取联系人地址  市
	var addressCityId = $("#selectCity").find('option:selected').val();
	var addressCityNm = $("#selectCity").find('option:selected').text();
	if (addressCityId == "") {
		alertTip("请选择市");
		return;
	}
	//获取联系人地址  区
	var addressDistrictId = $("#selectArea").find('option:selected').val();
	var addressDistrictNm = $("#selectArea").find('option:selected').text();
	if (addressDistrictId == "") {
		alertTip("请选择区");
		return;
	}
	//获取联系人详细地址
	var addressDetail = $("#addressDetail").val();
	if (addressDetail == "") {
		alertTip("请输入联系人详细地址");
		return;
	}
	//存储购买用户的ID
	var priceOptionId = $('#priceOptionId').val();
	//存储地址ID
	var addressId = $('#addressId').val();
	//存储当前被选中的收货地址
	var addressIdSelected = $('#addressIdSelected').val();
	var goods_qty_num = $('#goods_qty_num').val();
	var param = {
		addressProvinceId: addressProvinceId,
		addressCityId: addressCityId,
		addressDistrictId: addressDistrictId,
		addressDetail: addressDetail,
		receiptopName: receiptopName,
		adrMobile: adrMobile,
		addressId: addressId,
		goods_qty_num: goods_qty_num
	};
	$.ajax({
		data: param,
		type: "POST",
		url: "/front/orderConfirm/modifyAddress.htm",
		//调用OrderConfirm中的modifyAddress方法，修改此地址信息。
		success: function(data) {
			if (data.ret == "fail") {
				alertTip("修改失败");
			} else {
				alertTip("修改成功");
				//调用OrderConfirm中的goodsReceipt方法，跳转到goodsReceipt页面。
				window.location.href = "/front/orderConfirm/goodsReceipt.htm?&priceOptionId=" + priceOptionId + "&addressId=" + addressIdSelected + "&goods_qty_num=" + goods_qty_num;
			}
		},
		error: function(xhr, status, e) {
			alertTip("error: " + status);
		}
	});
}
</script>
</head>
<body >
	<!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		<ul class="addressDetailArea">
				<li >
					<input type="text" id="RECEIPTOR_NM" value="${requestScope.addressMap.RECEIPTOR_NM}" placeholder="收货人姓名" />
					<input type="hidden" id="addressId" value="${requestScope.addressMap.ADDRESS_ID}"/>
					<input type="hidden" id="priceOptionId" value="${requestScope.priceOptionId}"/>
					<input type="hidden" id="addressIdSelected" value="${ requestScope.addressIdSelected}"/>
					<input type="hidden" id="goods_qty_num" value="${requestScope.goods_qty_num}"/>
				</li>
				<li>
					<input id="ADR_MOBILE" type="text" value="${requestScope.addressMap.ADR_MOBILE}" placeholder="手机号" />
				</li>
				<li>
					<!-- 选择省 -->
					<select class="selectAddress"  id="selectProvince" name="addressProvinceId" placeholder="省" >
						<option  value="">省</option>
						<c:forEach items="${adminMapList}" var="item" varStatus="status">
							<option value="${item.areaId }" <c:if test="${item.areaId eq addressMap.ADR_PROVINCE_ID}"> selected="selected"</c:if>>${item.areaName}</option>
						</c:forEach>
					</select>	
				</li>
				<li>
					<!-- 选择市 -->
					<select class="selectAddress" id="selectCity" placeholder="市" name="addressAreaId">
						<option value="">市</option>
						<c:forEach items="${requestScope.adminMapListCity}" var="item" varStatus="status">
							<option value="${item.areaId }" <c:if test="${item.areaId eq addressMap.ADR_CITY_ID }"> selected="selected" </c:if>>${item.areaName}</option>
						</c:forEach>
					</select>
				</li>
				<li>
					<!-- 选择区 -->
					<select id="selectArea" placeholder="区"  name="addressDistrictId" class="selectAddress">
						<option value="">区</option>
						<c:forEach items="${requestScope.adminMapListArea}" var="item" varStatus="status">
							<option value="${item.areaId }" <c:if test="${item.areaId eq addressMap.ADR_DISTRICT_ID }"> selected="selected" </c:if>>${item.areaName}</option>
						</c:forEach>
					</select>
				</li>
				<li>
					<input  id="addressDetail" type="text" value="${requestScope.addressMap.ADR_DETAIL }" placeholder="详细地址" />
				</li>
			</ul>	
		</section>
	</div>
	<div class="footerFixed">
		<div class="btnGroup agc">
			<a class="btn theme2" onclick="history.back();">取     消</a> 
			<a class="btn theme1" onclick="modifyAddress();">确     定</a> 
		</div>
	</div>
	
</body>
</html>