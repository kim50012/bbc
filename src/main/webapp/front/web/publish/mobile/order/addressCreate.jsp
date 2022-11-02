<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>收货地址</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ include file="/front/main/messageTip.jsp"%>

<style type="text/css">
body{
	background-color: #fafafa;
}
</style>


</head>
<body >

<!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		<ul class="addressDetailArea">
				<li>
					<input type="text" id="RECEIPTOR_NM" value="" placeholder="이름" />
					<input type="hidden" id="priceOptionId" value="${requestScope.priceOptionId}"/>
					<input type="hidden" id="addressIdSelected" value="${ requestScope.addressIdSelected}"/>
					<input type="hidden" id="goods_qty_num" value="${requestScope.goods_qty_num}"/>
				</li>
				<li>
					<input id="ADR_MOBILE" type="text" value="" placeholder="휴대폰번호" />
				</li>
				<li>
					<!-- 选择省 -->
					<select class="selectAddress"  id="selectProvince" name="addressProvinceId" placeholder="省" >
						<option  value="">성</option>
						<c:forEach items="${adminMapList}" var="map" varStatus="status">
							<option value="${map.areaId }">${map.areaName}</option>
						</c:forEach>
					</select>	
				</li>
				<li>
					<!-- 选择市 -->
					<select class="selectAddress" id="selectCity" disabled="disabled" placeholder="市" name="addressAreaId">
						<option value="">시</option>
					</select>
				</li>
				<li>
					<!-- 选择区 -->
					<select id="selectArea" placeholder="区" disabled="disabled" name="addressDistrictId" class="selectAddress">
						<option value="">구역</option>
					</select>
				</li>
				<li>
					<input id="addressDetail" type="text" value="" placeholder="상세주소"  />
				</li>
			</ul>
			
			<div id="androidInput" style="position: relative;height: 0px; "></div>	
		</section>
	</div>	
	 
	<div class="footerFixed" style="background: #f4f4f4;">
		<div class="btnGroup agc" style="background: #f4f4f4;">
			<a class="btn theme2" style="background: #424242;" onclick="history.back();">취소</a> 
			<a class="btn theme1" style="background: #d41818;" onclick="saveAddress();">확인</a> 
		</div>
	</div>
	 
<script type="text/javascript">
//省市区的三级联动操作
$(function() {
 
	$("#selectProvince").change(function(e) {
		var val = $(this).val();
		var $combo = $('#selectCity');
		$combo.val('');
		$combo.html('<option value="" >시</option>'); //清空select内容  
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
var flag=true;
//保存新建的收货地址信息
function saveAddress() {
	//获取收货人姓名
	var receiptopName = $('#RECEIPTOR_NM').val();
	if (receiptopName == "") {
		alertTip("이름을 입력하세요.");
		return;
	}
	//获取收货人的手机号
	var adrMobile = $('#ADR_MOBILE').val();
	if (adrMobile == "") {
		alertTip("휴대폰번호를 입력하세요.");
		return;
	} else {
		if (!adrMobile.match(/^\d{11}$/)) {
			alertTip("휴대폰 번호 형식이 맞지 않습니다.");
			return;
		}
	}
	//获取联系人地址 省
	var addressProvinceId = $('#selectProvince').find('option:selected').val();
	var addressProvinceNm = $('#selectProvince').find('option:selected').text();
	if (addressProvinceId == "") {
		alertTip("성을 선택하세요.");
		return;
	}
	//获取联系人地址  市
	var addressCityId = $("#selectCity").find('option:selected').val();
	var addressCityNm = $("#selectCity").find('option:selected').text();
	if (addressCityId == "") {
		alertTip("도시를 선택하세요.");
		return;
	}
	//获取联系人地址  区
	var addressDistrictId = $("#selectArea").find('option:selected').val();
	var addressDistrictNm = $("#selectArea").find('option:selected').text();
	if (addressDistrictId == "") {
		alertTip("구역을 선택하세요.");
		return;
	}
	//获取联系人详细地址
	var addressDetail = $("#addressDetail").val();
	if (addressDetail == "") {
		alertTip("상세 주소를 입력하세요.");
		return;
	}
	//保存当前选中的送货地址ID
	var addressIdSelected = $('#addressIdSelected').val();
	//保存当前选中的商品价格Id
	var priceOptionId = $('#priceOptionId').val();
	var goods_qty_num = $('#goods_qty_num').val();
	if(!flag){
		return;
	}else{
		flag=false;
	}
	var param = {
		addressProvinceId: addressProvinceId,
		addressCityId: addressCityId,
		addressDistrictId: addressDistrictId,
		addressDetail: addressDetail,
		receiptopName: receiptopName,
		adrMobile: adrMobile
	};
	$.ajax({
		data: param,
		type: "POST",
		url: "/front/orderConfirm/saveAddress.htm",
		//调用OrderConfirm中的saveAddress方法，保存新创建的地址信息。
		success: function(data) {
			if (data.ret == "fail") {
				alertTip("创建失败");
			} else {
				alertTip("创建成功");
				//调用orderConfirm的goodsReceipt（）方法转到收货地址显示页面
				window.location.href = "/front/web/publish/mobile/order/goodsReceipt.htm?addressId=" + addressIdSelected + "&priceOptionId=" + priceOptionId + "&goods_qty_num=" + goods_qty_num;
			}
		},
		error: function(xhr, status, e) {
			alertTip("error: " + status);
		}
	});
}



</script>

<script type="text/javascript">
var browser={ 
	versions:function(){ 
	var u = navigator.userAgent, app = navigator.appVersion; 
	return { //移动终端浏览器版本信息 
	trident: u.indexOf('Trident') > -1, //IE内核 
	presto: u.indexOf('Presto') > -1, //opera内核 
	webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核 
	gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核 
	mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端 
	ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端 
	android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器 
	iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器 
	iPad: u.indexOf('iPad') > -1, //是否iPad 
	webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部 
	}; 
	}(), 
	language:(navigator.browserLanguage || navigator.language).toLowerCase() 
} 


var scrollTop = '';
$(function(){
	
	if(browser.versions.android){
		 $('#addressDetail').focus(function(){
			//$('.chatHistContent')[0].scrollTop = $('.chatHistContent')[0].scrollHeight;
			 var height = $(window).height(); 
			 var  offsetTop = $(this).offset().top;
			 scrollTop  = $(this)[0].scrollTop;
		  	$('#androidInput').height(400);
		   
		    $("html,body").animate({scrollTop: offsetTop - 150},100); 
		 }).blur(function(){
			  $('#androidInput').height(0);
			var height = $(window).height(); 
			var offsetTop = $(this).offset().top;
			 scrollTop  = $(this)[0].scrollTop;
			 var diff = height - offsetTop;
		   
			 $("html,body").animate({scrollTop: scrollTop || 0},100); 
		 });
		
	}
	
});
	
</script>	 
	 
</body>
</html>