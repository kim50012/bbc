<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> <!-- , target-densitydpi=medium-dpi" -->
<meta name="format-detection" content="telephone=no" />
<title>${detail.DESC_TITLE }</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">
</style> 
<script type="text/javascript">
var spec1="0";
var spec2="0";
var priceOptionId;//价格id
var priceUnitSales;//单价
var flag="";
//数量加减
function countChange(calc){
	var prdQty = parseInt($("#count").val());
	if(calc=='m'){
		if(prdQty>1){
			$("#count").val(parseInt(prdQty)-1);
		}
	}else{
		$("#count").val(parseInt(prdQty)+1);
	}
}
function goodsAttr(){
	flag="cart";
	$(".tipfloat").animate({height:"show"},400);
}

function buyItNow2(){
	flag="order";
	$(".tipfloat").animate({height:"show"},400);
}

function buyItNow(){
	flag="order";
	if(spec1=="0"||spec2=="0"){
		$(".tipfloat").animate({height:"show"},400);
	}else{
		location.href='/front/orderConfirm/orderConfirm.htm?priceOptionId='+priceOptionId+'&shopId='+${detail.SHOP_ID};//订单确认
	}
}
function priceDisplay(priceId,price){
	$("#span_price_flag").text("￥");
	$("#span_price").text(price);
	priceOptionId=priceId;
	priceUnitSales=price;
}

function addCart(addType){
	var params={
			shopId:'${detail.SHOP_ID}',
			goodsId:'${detail.GOODS_ID}',
			displayId:'${detail.DISPLAY_ID}',
			priceOptionId:priceOptionId,
			goodsQty:$("#count").val(),
			priceUnitSales:priceUnitSales
		};
		$.ajax({
			data: params,
			dataType: "json",
			type: "POST",
			url: "/front/detail/addCart.htm",
			success: function(data){ 
				if(data.OUT_ERR_MSG == "S") {
					if (addType == "order") {
						payment();
// 						location.href='/front/cart/cart.htm';
					}
					else {
						
						if(confirm("添加成功. \n是否立即去购物车结算?")) {
							location.href='/front/cart/cart.htm';
						}
						else {
							cancelOptionBox();
						}
						
					}
					//location.href='/front/cart/cart.htm';
				} else {
					alert("添加失败.");
					return false;
				}
			},
			error: function(a, msg, c){
				alert("error: " + msg);
			}
		});
}

function cancelOptionBox() {
	$(".tipfloat").animate({height:"hide"},1000,function(){
		$(".tipfloat").css("display","none");
	});
}

$(function(){
	if('${sessionScope.skinType}'=="1"){
		$("#img_location").attr("src","/front/skin/main/img/icon/location.png");
	}else if('${sessionScope.skinType}'=="2"){
		$("#img_location").attr("src","/front/skin/main/img/icon/location_blue.png");
	}else{
		$("#img_location").attr("src","/front/skin/main/img/icon/location.png");
	}
	
	$("#confirm").click(function(){
		$(".productAttribute ul li").each(function(index){
			 if($(this).hasClass("attrChoose")){
				 spec1="1";
			 }
	    }); 
		$(".productAttribute1 ul li").each(function(index){
			 if($(this).hasClass("attrChoose")){
				 spec2="1";
			 }
	    });  

		var productAttribute_YN = $("#hd_productAttribute_YN").val();
		var productAttribute1_YN = $("#hd_productAttribute1_YN").val();
		
		
		if((spec1=="0") && productAttribute_YN == "Y"){
			alert("请选择属性");
			return false;
		}else if((spec2=="0") && productAttribute1_YN == "Y"){
			alert("请选择第二个属性");
			return false;
		}else{
			addCart(flag);
		}
		
	});
    
	$("#cancel").click(function(){
		cancelOptionBox();
	});

	
	$(".productAttribute ul li").each(function(index){
        $(this).click(function(){
            $(".productAttribute ul li").removeClass("attrChoose");
            $(".productAttribute1 ul li").removeClass("attrChoose");
            $(this).addClass("attrChoose");
            for(var i=0;i<9;i++){
            	if(index==i){
            		$("#ul"+i).css("display","block");
            	}else{
            		$("#ul"+i).css("display","none");
            	}
            }
        });
    });     
	$(".productAttribute1 ul li").each(function(index){
        $(this).click(function(){
            $(".productAttribute1 ul li").removeClass("attrChoose");
            $(this).addClass("attrChoose");
        });
    });    
});
$(function(){
	var	oldUrl = location.href;
	var idx = oldUrl.indexOf("#pCont3");
	if(idx!=-1){
		$("#tttt").each(function(){ 
			$("#liimage").removeClass("on");
			$("#lireview").addClass("on");
			$("#pCont1").hide();
			$("#pCont3").show();
		});
	}
});

function fn_SnsSareLayerShow() {
	$('#container').addClass('on layerZindex');
	$('.snsShareLayerPopup').show();
}


function fn_SnsSareLayerHide() {
	$('#container').removeClass('on layerZindex');
	$('.snsShareLayerPopup').hide();
}


function payment() {
	$('#priceOptionId','#form1').val(priceOptionId);
	$('#goods_qty_num','#form1').val($("#count").val());
	$('#form1').submit();
}

</script>
</head>
<body>
	<!-- header -->
	<header class="headerDetail">
		<div class="searchPmd">
			<div class="logoShare" style="background:url('${sessionScope.sessionSkin.shopLogoImgUrl}') no-repeat; background-size: 100% 100%;"></div>
			<div class="title">${goodsDisplayInsert.descTitle }</div>
			<div class="btnShare" onclick="fn_SnsSareLayerShow();"></div>
		</div>
	</header>
	<!-- //header -->


	<form id="form1" action="/front/orderConfirm/orderConfirm.htm" method="post">
		<input type="hidden" id="priceOptionId" name="priceOptionId" />
		<input type="hidden" id="goods_qty_num" name="goods_qty_num" />
	</form> 


	<!-- container -->
	<div id="container">
		<section id="contents">
			<!-- ---------------------------------------------------------- -->
			<section class="detailTopSlide">
				<h2>Banner</h2>
				<div class="sliderList" data-slider="1">
					<ul>
						<c:if test="${goodsDisplayInsert.goodsDtlSlideImgUrl1 ne null}">
							<li><img src="${goodsDisplayInsert.goodsDtlSlideImgUrl1 }" alt="" /></li>
						</c:if>
						<c:if test="${goodsDisplayInsert.goodsDtlSlideImgUrl2 ne null}">
							<li><img src="${goodsDisplayInsert.goodsDtlSlideImgUrl2 }" alt="" /></li>
						</c:if>
						<c:if test="${goodsDisplayInsert.goodsDtlSlideImgUrl3 ne null}">
							<li><img src="${goodsDisplayInsert.goodsDtlSlideImgUrl3 }" alt="" /></li>
						</c:if>
						<c:if test="${goodsDisplayInsert.goodsDtlSlideImgUrl4 ne null}">
							<li><img src="${goodsDisplayInsert.goodsDtlSlideImgUrl4 }" alt="" /></li>
						</c:if>
						<c:if test="${goodsDisplayInsert.goodsDtlSlideImgUrl5 ne null}">
							<li><img src="${goodsDisplayInsert.goodsDtlSlideImgUrl5 }" alt="" /></li>
						</c:if>
					</ul>
				</div>
				<div class="sliderpage"></div>
			</section>
			<!-- ---------------------------------------------------------- -->
			<table style="width: 100%;">
				<tr>
					<td colspan="4" style="padding: 10px;">
						<span class="detail_headtitle"><pre class="detail-Desc">${goodsDisplayInsert.descDetail }</pre></span>
					</td>
				<tr>
					<td colspan="4" style="padding-top: 8px;padding-left: 8px;">
						<div class="detail_price_current">
							<span class="detail_price_float"></span>
							<span class="detail_price_int">￥${goodsDispalyPriceInsert.priceUnitSales }</span>
							<span class="detail_price_float"></span>
						</div>
						<div class="detail_price_original" style="padding-top: 3px;">
							<del class="detail_price_del">￥${goodsDispalyPriceInsert.priceOrg }</del>
						</div>
						
						<div class="detail_bought_count" style="padding-top: 3px;">
							<span class="detail_desc">${goodsDispalyPriceInsert.sumPayQty }人付款</span>
						</div>
						<div class="detail_favorite_count" style="padding-top: 3px;">
							<span class="detail_desc"">${goodsDispalyPriceInsert.sumFvortQty }人收藏</span>
						</div>
					</td>
				</tr>
				
			</table>
			
		    <div id="container">
		    
			    <section id="contents">
			    	
			    	<!-- 
			    		----------------------------------------------------------------
			    		-- 商品属性 (GOODS SPEC)
			    		---------------------------------------------------------------- 
			    	-->
			    	<div class="detailSubTitle">
			    		<span>商品属性 >></span>
			    	</div>
			    	<ul class="sSpecList">
							<li>
								<a href="#" class="sSpecListSpec">
									<span class="specNM">属性1</span>
									<span class="specVal">参数1</span>
								</a>
							</li>
							<li>
								<a href="#" class="sSpecListSpec">
									<span class="specNM">属性2</span>
									<span class="specVal">参数2</span>
								</a>
							</li>
							<li>
								<a href="#" class="sSpecListSpec">
									<span class="specNM">属性3</span>
									<span class="specVal">参数3</span>
								</a>
							</li>
							<li>
								<a href="#" class="sSpecListSpec">
									<span class="specNM">属性4</span>
									<span class="specVal">参数4</span>
								</a>
							</li>
							<li>
								<a href="#" class="sSpecListSpec">
									<span class="specNM">属性5</span>
									<span class="specVal">参数5</span>
								</a>
							</li>
					</ul>
					
					
<!-- 			    	<div class="detailSubTitle"> -->
<!-- 			    		<span>商品属性 >></span> -->
<!-- 			    	</div> -->
			    	<!-- 
			    		----------------------------------------------------------------
			    		-- 商品介绍(GOODS INTR)
			    		---------------------------------------------------------------- 
			    	-->
					<c:forEach var="list" items="${imageList }" varStatus="status">  
						<c:if test="${list.HEADER_FLG == 'Y' }">
							${list.HEADER_TAG}
						</c:if>
							${list.BODY_TAG }    
						<c:if test="${list.FOOTER_FLG=='Y'}">
							${list.FOOTER_TAG}
						</c:if>			
					</c:forEach>

				</section>
				
			</div>
			 
			<div id="pCont3" style="height:47px;"></div>
			<div class="sToggle mgt10"><!-- 2014-07-23 -->
				<h3 class="sToggleTit detailReviewTitle on"><a href="#">商品评价</a></h3>
				<div class="sToggleCont" style="display:block;">
					<div class="detailReviewList">
					
						<!-- star_rating -->
						<div class="reviewTopRating">
							<ul>
								<li class="lft">
									<div class="detailReviewStar">
										<p class="ReviewRating">
											<span class="hollow"><span class="solid" style="width:90%;"></span></span>
										</p>
									</div>
								</li>
								<li class="cnt">&nbsp;&nbsp;9 分</li>
								<li class="rgt">10 人参写评价</li>
							</ul>
						</div>
						
						
						<div style="width:100%; height: 30px; line-height: 30px; border-bottom: 1px solid #C8C8C8;">商品评价 ( 3  条 )</div>
						<!-- review -->
						<ul class="pRatingList">
							<li style="border-bottom: 1px solid #C8C8C8;">
								<span class="mail"></span>
								<div class="txt">
									<span>评价内容</span>
								</div>
								<span class="date">20**.01.01</span>
								<span class="shopping">
									<span class="rating star2">
										<span style="width:90%"></span>
									</span>
								</span>
							</li>
							<li style="border-bottom: 1px solid #C8C8C8;">
								<span class="mail"></span>
								<div class="txt">
									<span>评价内容</span>
								</div>
								<span class="date">20**.01.01</span>
								<span class="shopping">
									<span class="rating star2">
										<span style="width:90%"></span>
									</span>
								</span>
							</li>
							<li style="border-bottom: 1px solid #C8C8C8;">
								<span class="mail"></span>
								<div class="txt">
									<span>评价内容</span>
								</div>
								<span class="date">20**.01.01</span>
								<span class="shopping">
									<span class="rating star2">
										<span style="width:90%"></span>
									</span>
								</span>
							</li>
						</ul>
						<div style="border-top: 0px;background-color: #ffffff;margin-top: -20px;" align="center">
							<div style="height: 5px;"></div>
							<div id="kkpager"><span class="curr">1</span></div>
							<div style="height: 10px;"></div>
						</div>
						<!-- End -->
						
					</div>
				</div>
					
			</div>
				
			<br />
			
		</section>
	</div>
<!-- 	<div class="footer length2"> -->
<!-- 		<a class="btn1 footer_cart" onclick="goodsAttr()">加入购物车</a> -->
<!-- 		<a class="btn1 footer_bought" onclick="buyItNow2()">立即购买</a> -->
<!-- 	</div> -->
<!-- 	<div class="dim"></div> -->
<!-- 	<a href="#" class="bottom_totop">top</a> -->
<!-- 	<div class="loading"> -->
<!-- 		<div><div></div></div> -->
<!-- 	</div> -->

	<div class="tipfloat">
		<div class="productAttribute">
			<div class="inner">
				<h2>商品属性：</h2>
			</div>
		</div>
		<div class="productAttribute">
			<div class="inner">
				<h2>${specListParent[0].SPEC_NM }</h2>
				<input type="hidden" id="hd_productAttribute_YN" value="">
				<ul>
					<c:forEach  var="child1" items="${specListChild1 }" varStatus="status">
						<li>${child1.SPEC_VALUE_NM }</li>
						<script>$("#hd_productAttribute_YN").val("Y")</script>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="productAttribute1">
			<div class="inner1">
				<h2>${specListParent[1].SPEC_NM }</h2>
				<input type="hidden" id="hd_productAttribute1_YN" value="">
				<ul id="ul0" >
					<c:forEach  var="child2" items="${child2.list0 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM } </li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul1" style="display: none;">
					<c:forEach  var="child2" items="${child2.list1 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul2" style="display: none;">
					<c:forEach  var="child2" items="${child2.list2 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul3" style="display: none;">
					<c:forEach  var="child2" items="${child2.list3 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul4" style="display: none;">
					<c:forEach  var="child2" items="${child2.list4 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul5" style="display: none;">
					<c:forEach  var="child2" items="${child2.list5 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul6" style="display: none;">
					<c:forEach  var="child2" items="${child2.list6 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul7" style="display: none;">
					<c:forEach  var="child2" items="${child2.list7 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
				<ul id="ul8" style="display: none;">
					<c:forEach  var="child2" items="${child2.list8 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
						<script>$("#hd_productAttribute1_YN").val("Y")</script>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="productAttribute1">
			<div class="inner1">
				<h2 style="padding-bottom: 5px;">数量</h2>
				<img alt="" src="/front/skin/main/img/icon/left.png"  class="detail_good_count" onclick="countChange('m')">
				<input type="text"  id="count" style="width: 50px;text-align: center;border-color:#e5e5e5;" readonly="readonly" value="1"/>
				<img alt="" src="/front/skin/main/img/icon/right.png" class="detail_good_count"  onclick="countChange('p')">
				
				<span class="detail_price_float" id="span_price_flag" style="margin-left: 30px;"></span>
				<span class="detail_price_int" id="span_price"></span>
			</div>
		</div>
		<div class="button">
			<a class="btn1 footer_cart" id="cancel">取消</a>
			<a class="btn1 footer_bought" id="confirm">确认</a>
		</div>
	</div>



	<!-- mainLayerPop -->
	<div class="snsShareLayerPopup">
		<div class="inner">
			<div class="cont-Title">
				<span onclick="fn_SnsSareLayerHide();"><img src="/front/skin/pumeiduo/img/btn_close.png" /></span>
			</div>
			<div class="cont-Body">
				<ul class="shareList">
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn01.png" /></span><span class="shareTxt">发送给朋友</span></li>
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn02.png" /></span><span class="shareTxt">分享到朋友圈</span></li>
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn03.png" /></span><span class="shareTxt">收&nbsp;&nbsp;藏</span></li>
<!-- 					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn04.png" /></span><span class="shareTxt">邮&nbsp;&nbsp;件</span></li> -->
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn05.png" /></span><span class="shareTxt">分享到QQ</span></li>
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn06.png" /></span><span class="shareTxt">分享到QQ空间</span></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //mainLayerPop -->
	
	
</body>
</html>
