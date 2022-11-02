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
<%@ include file="/front/main/messageTip.jsp"%>
<style type="text/css">
</style> 
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 3,				//SHOP_DETAIL
	 pageId : '' || '',
	 goodsId : '${detail.GOODS_ID}' || '',
	 displayId : '${detail.DISPLAY_ID}' || ''
});

var specCount = ${specCount}; 
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

/* function priceDisplay(priceId,price){
	$("#span_price_flag").text("￥");
	$("#span_price").text(price);
	priceOptionId=priceId;
	priceUnitSales=price;
} */

function addCart(addType){
	var params={
			shopId : '${detail.SHOP_ID}',
			goodsId : '${detail.GOODS_ID}',
			displayId : '${detail.DISPLAY_ID}',
			priceOptionId : priceOptionId,
			goodsQty : $("#count").val(),
			priceUnitSales : priceUnitSales
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
						confirmTip('添加成功. \n是否立即去购物车结算?');
						var times=0;
						$(".confirm-button").click(function(){
							times++;
							if(times==1){
								if(closePopup()){
									location.href='/front/cart/cart.htm';
								}else{
									cancelOptionBox();
								}
							}
						});
// 						if(confirm("添加成功. \n是否立即去购物车结算?")) {
// 							location.href='/front/cart/cart.htm';
// 						}
// 						else {
// 							cancelOptionBox();
// 						}
						
					}
					//location.href='/front/cart/cart.htm';
				} else {
					alertTip("添加失败.");
					return false;
				}
			},
			error: function(a, msg, c){
				alertTip("error: " + msg);
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
		
		if(specCount == 1){
			if($(".productAttribute.spec1 li.hover").size() == 0){
				alertTip("请选择属性");
				return false;
			}
			
		}else if(specCount == 2){
			if($(".productAttribute.spec1 li.hover").size() == 0){
				alertTip("请选择属性");
				return false;
			}
			if($(".productAttribute.spec2 li.hover").size() == 0){
				alertTip("请选择第二个属性");
				return false;
			}
			
		}
	 	 
		addCart(flag);
		
	});
    
	$("#cancel").click(function(){
		cancelOptionBox();
	});

	
	<c:if test="${specCount eq 1 }">
		$(".productAttribute.spec1 li").click(function(){
			var $this = $(this);
			var specValueId1 = $this.data('spec-value-id');
			$(this).addClass('hover').siblings().removeClass('hover');
			 
			$(".productAttribute.spec2 li").removeClass('hover').hide();
		 	$(".productAttribute.spec2 li").each(function(){ 
		 		if($(this).data('specValueIdParent') == specValueId1){
		 			$(this).show();
		 		}
		 	});
		 	
			var optionId = $this.data('priceOptionId');
			var unitSales = $this.data('priceUnitSales');
			 
			$("#span_price_flag").show();
	 		$("#span_price").text(unitSales);
			priceOptionId=optionId;
			priceUnitSales=unitSales;
		});
		
	</c:if>
	<c:if test="${specCount eq 2 }">
	$(".productAttribute.spec1 li").click(function(){
		var $this = $(this);
		var specValueId1 = $this.data('spec-value-id');
		$(this).addClass('hover').siblings().removeClass('hover');
		 
		$(".productAttribute.spec2 li").removeClass('hover').hide();
	 	$(".productAttribute.spec2 li").each(function(){ 
	 		if($(this).data('specValueIdParent') == specValueId1){
	 			$(this).show();
	 		}
	 	});
		 	
		$("#span_price_flag").hide();
		$("#span_price").text('');
		priceOptionId='';
		priceUnitSales='';	
		
		//$(".productAttribute.spec2 h2").show();
	});
	$(".productAttribute.spec2 li").click(function(){
		 var $this = $(this);
		 $(this).addClass('hover').siblings().removeClass('hover');
		 
		 var optionId = $this.data('priceOptionId');
		 var unitSales = $this.data('priceUnitSales');
		 
		$("#span_price_flag").show();
 		$("#span_price").text(unitSales);
		priceOptionId=optionId;
		priceUnitSales=unitSales;
		 
	});
	</c:if>

	  
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
$(function(){
	
	var totalPage = "${totalPage}";
	var totalRecords = "${totalNum}";
	var pageNo = "${pageNO}"; 
	if(!pageNo){
		pageNo = 1;
	}
	//生成分页
	//有些参数是可选的，比如lang，若不传有默认值
	kkpager.generPageHtml({
		//当前页码
		pno : pageNo,
		mode : 'click',
		//总页码
		total : totalPage,
		//总数据条数
		totalRecords : totalRecords,
		//链接前部
		hrefFormer : 'page',
		//链接尾部
		hrefLatter : '.action',
		click : function(n){
	        this.selectPage(n);
	        var params = "pageNO="+ n+"#pCont3";
			var	oldUrl = location.href;
			var idx = oldUrl.indexOf("?");
			var idx2 = oldUrl.indexOf("pageNO");
			
			if(idx==-1){
				location.href = oldUrl +"?"+ params; 
			}else{
				if(idx2==-1){
					location.href = oldUrl +"&"+ params; 
				}else{
					location.href = oldUrl.substring(0,idx2) + params; 
				}
			} 
	    },
		lang : { 
			prePageText : '< Prev',
			nextPageText : '> Next'
		} 
	});
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
			<div class="logoShare" style="background:url('${detail.SHOP_LOGO}') no-repeat; background-size: 100% 100%;"></div>
			<div class="title">${detail.DESC_TITLE }</div>
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
						<c:if test="${detail.GOODS_DTL_SLIDE_IMG1_URL ne null}">
							<li><img src="${detail.GOODS_DTL_SLIDE_IMG1_URL }" alt="" /></li>
						</c:if>
						<c:if test="${detail.GOODS_DTL_SLIDE_IMG2_URL ne null}">
							<li><img src="${detail.GOODS_DTL_SLIDE_IMG2_URL }" alt="" /></li>
						</c:if>
						<c:if test="${detail.GOODS_DTL_SLIDE_IMG3_URL ne null}">
							<li><img src="${detail.GOODS_DTL_SLIDE_IMG3_URL }" alt="" /></li>
						</c:if>
						<c:if test="${detail.GOODS_DTL_SLIDE_IMG4_URL ne null}">
							<li><img src="${detail.GOODS_DTL_SLIDE_IMG4_URL }" alt="" /></li>
						</c:if>
						<c:if test="${detail.GOODS_DTL_SLIDE_IMG5_URL ne null}">
							<li><img src="${detail.GOODS_DTL_SLIDE_IMG5_URL }" alt="" /></li>
						</c:if>
					</ul>
				</div>
				<div class="sliderpage"></div>
			</section>
			<!-- ---------------------------------------------------------- -->
			<table style="width: 100%;">
				<tr>
					<td colspan="4" style="padding: 10px;">
						<span class="detail_headtitle"><pre class="detail-Desc">${detail.DESC_DETAIL}</pre></span>
					</td>
				<tr>
					<td colspan="4" style="padding-top: 8px;padding-left: 8px;">
						<div class="detail_price_current">
							<span class="detail_price_float"></span>
							<span class="detail_price_int">￥${detail.PRICE_UNIT_SALES }</span>
							<span class="detail_price_float"></span>
						</div>
						<div class="detail_price_original" style="padding-top: 3px;">
							<del class="detail_price_del">￥${detail.PRICE_ORG }</del>
						</div>
						<div class="detail_bought_count" style="padding-top: 3px;">
							<span class="detail_desc">${detail.SUM_SALES_QTY }人付款</span>
						</div>
						<div class="detail_favorite_count" style="padding-top: 3px;">
							<span class="detail_desc"">${detail.SUM_FVORT_QTY }人收藏</span>
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
						<c:forEach var="list" items="${attributeList }" varStatus="status">
							<li>
								<a href="#" class="sSpecListSpec">
									<span class="specNM">${list.SPEC_NM }</span>
									<span class="specVal">${list.SPEC_VALUE_NM }</span>
								</a>
							</li>
						</c:forEach>
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
											<span class="hollow"><span class="solid" style="width:${detail.REVIEW_POINT_AVG }0%;"></span></span>
										</p>
									</div>
								</li>
								<li class="cnt">&nbsp;&nbsp;${detail.REVIEW_POINT_AVG }分</li>
								<li class="rgt">${detail.REVIEW_POINT_CNT }人参写评价</li>
							</ul>
						</div>
						
						
						<div style="width:100%; height: 30px; line-height: 30px; border-bottom: 1px solid #C8C8C8;">商品评价 ( ${detail.REVIEW_POINT_CNT } 条 )</div>
						<!-- review -->
						<ul class="pRatingList">
							<c:forEach var="reviewList" items="${reviewList }" varStatus="status">
								<li style="border-bottom: 1px solid #C8C8C8;">
									<span class="mail"></span>
									<div class="txt">
										<span>${reviewList.REVIEW_DESC }</span>
									</div>
									<span class="date">${reviewList.CREATED_DT }</span>
									<span class="shopping">
										<span class="rating star2">
											<c:choose>
												<c:when test="${reviewList.TOTAL_GPA==0 }">
													<span style="width:0%"></span>
												</c:when>
												<c:when test="${reviewList.TOTAL_GPA==1 }">
													<span style="width:20%"></span>
												</c:when>
												<c:when test="${reviewList.TOTAL_GPA==2 }">
													<span style="width:40%"></span>
												</c:when>
												<c:when test="${reviewList.TOTAL_GPA==3 }">
													<span style="width:60%"></span>
												</c:when>
												<c:when test="${reviewList.TOTAL_GPA==4 }">
													<span style="width:80%"></span>
												</c:when>
												<c:when test="${reviewList.TOTAL_GPA==5 }">
													<span style="width:100%"></span>
												</c:when>
											</c:choose>
										</span>
									</span>
								</li>
							</c:forEach>
						</ul>
						<div style="border-top: 0px;background-color: #ffffff;margin-top: -20px;" align="center">
							<div style="height: 5px;"></div>
							<div id="kkpager"></div>
							<div style="height: 10px;"></div>
						</div>
						<!-- End -->
						
					</div>
				</div>
					
			</div>
				
			<br />
			<br />
			<br />
			<br />
			<br />
							
					
		</section>
	</div>
	<div class="footer length2">
		<a class="btn1 footer_cart" onclick="goodsAttr()">加入购物车</a>
		<a class="btn1 footer_bought" onclick="buyItNow2()">立即购买</a>
<!-- 		<a href="#" class="btn1 footer_bought" onclick="buyItNow()">立即购买</a> -->
<!-- 		<a href="#" class="btn1 footer_bought" onclick="location.href='/front/main/list.htm'">返回</a> -->
<!-- 		<a href="#" class="btn1 footer_bought" onclick="history.back();">返回</a> -->
	</div>
	<div class="dim"></div>
	<a href="#" class="bottom_totop">top</a>
	<div class="loading">
		<div><div></div></div>
	</div>

	<div class="tipfloat">
		<div class="productAttribute">
			<div class="inner">
				<h2>商品属性：</h2>
			</div>
		</div>
		
			<c:if test="${specCount eq 1 }">
				<div class="productAttribute spec1">
					<div class="inner">
						<h2>${goodsSpec.specNm}</h2>
						<ul>
							<c:forEach var="item" items="${goodsSpec.specValues }" varStatus="status">
								<li data-spec-value-id="${item.specValueId }" 
								data-spec-value-id-parent="${item.specValueIdParent }"
								data-price-org="${item.priceOrg }"
								data-price-unit-sales="${item.priceUnitSales }"
								data-price-option-id="${item.priceOptionId }"
								data-stock-in="${item.stockIn }"
								data-stock-now="${item.stockNow }">${item.specValueNm }</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:if>
			<c:if test="${specCount eq 2 }">
			<div class="productAttribute spec1">
				<div class="inner">
					<h2>${goodsSpec.specNm}</h2>
					<ul>
						<c:forEach var="item" items="${goodsSpec.specValues }" varStatus="status">
							<li data-spec-value-id="${item.specValueId }">${item.specValueNm }</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="productAttribute spec2"  >
				<div class="inner" style="min-height:73px;">
					<h2>${goodsSpec2.specNm}</h2>
					<ul>
						<c:forEach var="item" items="${goodsSpec2.specValues }" varStatus="status">
							<li data-spec-value-id="${item.specValueId }" 
								data-spec-value-id-parent="${item.specValueIdParent }"
								data-price-org="${item.priceOrg }"
								data-price-unit-sales="${item.priceUnitSales }"
								data-price-option-id="${item.priceOptionId }"
								data-stock-in="${item.stockIn }"
								data-stock-now="${item.stockNow }"
								style=" display: none;">${item.specValueNm }</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			</c:if>
		<div class="productAttribute1">
			<div class="inner1">
				<h2 style="padding-bottom: 5px;">数量</h2>
				<img alt="" src="/front/skin/main/img/icon/left.png"  class="detail_good_count" onclick="countChange('m')">
				<input type="text"  id="count" style="width: 50px;text-align: center;border-color:#e5e5e5;" readonly="readonly" value="1"/>
				<img alt="" src="/front/skin/main/img/icon/right.png" class="detail_good_count"  onclick="countChange('p')">
				
				<span class="detail_price_float" id="span_price_flag" style="margin-left: 30px; display: none;">￥</span>
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
