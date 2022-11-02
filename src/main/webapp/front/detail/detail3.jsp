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
	<c:if test="${loginFlag eq 0 }">
		fn_followLayerShow();
		return;
	</c:if>
	flag="cart";
	$(".tipfloat").animate({height:"show"},400);
}

function buyItNow2(){
	<c:if test="${loginFlag eq 0 }">
		fn_followLayerShow();
		return;
	</c:if>
	flag="order";
	$(".tipfloat").animate({height:"show"},400);
}

function buyItNow(){
	flag="order";
	if(spec1=="0"||spec2=="0"){
		$(".tipfloat").animate({height:"show"},400);
	}else{
		
		if($('#hiddenPriceOptionId').val() == ''){
			alertTip('请选择商品属性!');
			return false;
		}
		
		location.href='/front/orderConfirm/orderConfirm.htm?priceOptionId=' + $('#hiddenPriceOptionId').val() + '&shopId='+${detail.SHOP_ID};//订单确认
	}
}

/* function priceDisplay(priceId,price){
	$("#span_price_flag").text("￥");
	$("#span_price").text(price);
	priceOptionId=priceId;
	priceUnitSales=price;
} */

function addCart(addType){
	
	if($('#hiddenPriceOptionId').val() == ''){
		alertTip('请选择商品属性!');
		return false;
	}
	if($('#hiddenPriceUnitSales').val() == ''){
		alertTip('请选择商品属性!');
		return false;
	}
	
	var params={
			shopId : '${detail.SHOP_ID}',
			goodsId : '${detail.GOODS_ID}',
			displayId : '${detail.DISPLAY_ID}',
			priceOptionId : $('#hiddenPriceOptionId').val(),
			goodsQty : $("#count").val(),
			priceUnitSales : $('#hiddenPriceUnitSales').val()
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
	 		
	 		$('#hiddenPriceOptionId').val(optionId);
	 		$('#hiddenPriceUnitSales').val(unitSales);
			///priceOptionId=optionId;
			//priceUnitSales=unitSales;
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
		//priceOptionId='';
		//priceUnitSales='';	
		$('#hiddenPriceOptionId').val('');
 		$('#hiddenPriceUnitSales').val('');
		
		//$(".productAttribute.spec2 h2").show();
	});
	$(".productAttribute.spec2 li").click(function(){
		 var $this = $(this);
		 $(this).addClass('hover').siblings().removeClass('hover');
		 
		 var optionId = $this.data('priceOptionId');
		 var unitSales = $this.data('priceUnitSales');
		 
		$("#span_price_flag").show();
 		$("#span_price").text(unitSales);
		//priceOptionId=optionId;
		//priceUnitSales=unitSales;
		$('#hiddenPriceOptionId').val(optionId);
 		$('#hiddenPriceUnitSales').val(unitSales);
		 
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
	
	if($('#hiddenPriceOptionId').val() == ''){
		alertTip('请选择商品属性!');
		return false;
	}
	if($('#hiddenPriceUnitSales').val() == ''){
		alertTip('请选择商品属性!');
		return false;
	}
	
	$('#priceOptionId','#form1').val($('#hiddenPriceOptionId').val());
	$('#goods_qty_num','#form1').val($("#count").val());
	$('#form1').submit();
}

</script>
<style>
.btn1.footer_bought {background: #c40101;}
</style>
</head>
<body class="bodyColorSkin5">
	<!-- header -->
	<header class="headerDetail">
		<div class="searchPmd">
			<div class="logoShare" style="background:url('${detail.SHOP_LOGO}') no-repeat; background-size: 100% 100%;"></div>
			<div class="title">${detail.DESC_TITLE }</div>
<!-- 			<div class="btnShare" onclick="fn_SnsSareLayerShow();"></div> -->
			<div class="btnCart" onclick="window.location.href='/front/cart/cart.htm?shopId=${sessionScope.sessionSkin.shopId}';"></div>
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
			<table class="goodsDetailDescTable">
				<tr>
					<td colspan="4" style="padding: 10px;">
						<span class="detail_headtitle"><pre class="detail-Desc">${detail.DESC_DETAIL}</pre></span>
					</td>
				<tr>
					<td colspan="4" style="padding:8px; border-top: 1px solid #f0f0f0;">
						<div class="detail_price_current">
							<span class="detail_price_float"></span>
							<span class="detail_price_int">￥${detail.PRICE_UNIT_SALES }</span>
							<span class="detail_price_float"></span>
						</div>
						<div class="detail_price_original" style="padding-top: 3px;">
							<del class="detail_price_del">￥${detail.PRICE_ORG }</del>
						</div>
<!-- 						<div class="detail_bought_count" style="padding-top: 3px;"> -->
<%-- 							<span class="detail_desc">${detail.SUM_SALES_QTY }人付款</span> --%>
<!-- 						</div> -->
						<div class="detail_favorite_count" style="text-align:right; padding-top: 3px; width: 50%;">
							<span class="detail_desc"">${detail.SUM_PAY_QTY }人已购买</span>
						</div>
					</td>
				</tr>
				
			</table>
			
		    <div id="containerPdtop10" class="containerPdtop10">
		    	<div class="divBlank10"></div>
			    <section id="contents">
			    	<!-- 
			    		----------------------------------------------------------------
			    		-- 商品属性 (GOODS SPEC)
			    		---------------------------------------------------------------- 
			    	-->
			    	
			    	<div class="detailSubTitle2">
			    		<div class="divBlank10"></div>
			    		<span>商品属性 >></span>
			    	</div>
			    	
		    		<div class="divBlank10 ffffff"></div>
			    	
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
			    	<div class="divBlank10"></div>
			    	<div class="divBlank10"></div>
			    		
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
		    	
		    	<div class="divBlank10"></div>
		    	
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
						<div style="border-top: 0px;margin-top: -20px;" align="center">
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
	</div>
	<div class="dim"></div>
	<a href="#" class="bottom_totop" style="display:none;">top</a>
	<script>
        $(function () {
            $(window).scroll(function(){
                if ($(window).scrollTop()>70){
                    $(".bottom_totop").fadeIn(300);
                }
                else
                {
                    $(".bottom_totop").fadeOut(300);
                }
            });
        });
	</script>
	<div class="loading">
		<div><div></div></div>
	</div>

	<div class="tipfloat">
		<div class="productAttribute">
			<div class="searchPmd">
				<div class="logoShare" style="background:url('${detail.GOODS_LIST_IMG_URL}') no-repeat; background-size: 100% 100%;"></div>
				<div class="title">&nbsp;&nbsp;${detail.DESC_TITLE }</div>
			</div>			
		</div>
		
			<c:if test="${specCount eq 1 }">
				<div class="productAttribute spec1">
					<div class="inner">
						<h2>${goodsSpec.specNm}</h2>
						<ul>
							<c:forEach var="item" items="${goodsSpec.specValues }" varStatus="status">
								<c:choose>
									<c:when test="${status.index  eq 0}">
										<c:set value="${item.priceOptionId }" var="priceOptionId" ></c:set>
										<c:set value="${item.priceUnitSales }" var="priceUnitSales" ></c:set>
										<li data-spec-value-id="${item.specValueId }" 
											data-spec-value-id-parent="${item.specValueIdParent }"
											data-price-org="${item.priceOrg }"
											data-price-unit-sales="${item.priceUnitSales }"
											data-price-option-id="${item.priceOptionId }"
											data-stock-in="${item.stockIn }"
											data-stock-now="${item.stockNow }" class="hover">${item.specValueNm }</li>
									</c:when>
									<c:otherwise>
										<li data-spec-value-id="${item.specValueId }" 
											data-spec-value-id-parent="${item.specValueIdParent }"
											data-price-org="${item.priceOrg }"
											data-price-unit-sales="${item.priceUnitSales }"
											data-price-option-id="${item.priceOptionId }"
											data-stock-in="${item.stockIn }"
											data-stock-now="${item.stockNow }">${item.specValueNm }</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:if>
			<c:if test="${specCount eq 2 }">
				<c:set value="" var="specValueId" ></c:set>
				<c:set value="" var="priceOptionId" ></c:set>
				<c:set value="" var="priceUnitSales" ></c:set>
				<c:set value="true" var="isNotFirst" ></c:set>
			
			<div class="productAttribute spec1">
				<div class="inner">
					<h2>${goodsSpec.specNm}</h2>
					<ul>
						<c:forEach var="item" items="${goodsSpec.specValues }" varStatus="status">
							<c:choose>
								<c:when test="${status.index  eq 0}">
									<c:set value="${item.specValueId }" var="specValueId" ></c:set>
									<li data-spec-value-id="${item.specValueId }" class="hover">${item.specValueNm }</li>
								</c:when>
								<c:otherwise>
									<li data-spec-value-id="${item.specValueId }">${item.specValueNm }</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="productAttribute spec2"  >
				<div class="inner" style="min-height:73px;">
					<h2>${goodsSpec2.specNm}</h2>
					<ul>
						<c:forEach var="item" items="${goodsSpec2.specValues }" varStatus="status">
							<!--  -->
							<c:choose>
								<c:when test="${item.specValueIdParent eq specValueId}">
								
									<c:choose>
										<c:when test="${isNotFirst}">
											<c:set value="false" var="isNotFirst" ></c:set>
											<c:set value="${item.priceOptionId }" var="priceOptionId" ></c:set>
											<c:set value="${item.priceUnitSales }" var="priceUnitSales" ></c:set>
											<li data-spec-value-id="${item.specValueId }" 
												data-spec-value-id-parent="${item.specValueIdParent }"
												data-price-org="${item.priceOrg }"
												data-price-unit-sales="${item.priceUnitSales }"
												data-price-option-id="${item.priceOptionId }"
												data-stock-in="${item.stockIn }"
												data-stock-now="${item.stockNow }"
												 class="hover">${item.specValueNm }</li>
											
										</c:when>
										<c:otherwise>
											<li data-spec-value-id="${item.specValueId }" 
												data-spec-value-id-parent="${item.specValueIdParent }"
												data-price-org="${item.priceOrg }"
												data-price-unit-sales="${item.priceUnitSales }"
												data-price-option-id="${item.priceOptionId }"
												data-stock-in="${item.stockIn }"
												data-stock-now="${item.stockNow }"
												 >${item.specValueNm }</li>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<li data-spec-value-id="${item.specValueId }" 
										data-spec-value-id-parent="${item.specValueIdParent }"
										data-price-org="${item.priceOrg }"
										data-price-unit-sales="${item.priceUnitSales }"
										data-price-option-id="${item.priceOptionId }"
										data-stock-in="${item.stockIn }"
										data-stock-now="${item.stockNow }"
										style=" display: none;">${item.specValueNm }</li>
								</c:otherwise>
							</c:choose>
							<!--  -->
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
				
				<span class="detail_price_float" id="span_price_flag" style="margin-left: 30px;">￥</span>
				<span class="detail_price_int" id="span_price">${priceUnitSales }</span>
				
				<input type="hidden" id="hiddenPriceOptionId" value="${priceOptionId }" />
				<input type="hidden" id="hiddenPriceUnitSales" value="${priceUnitSales }" />
				
			</div>
		</div>
		<div class="button">
			<a class="btn1 footer_cart" id="cancel">取消</a>
			<a class="btn1 footer_bought" id="confirm">确认</a>
		</div>
	</div>
	
	
</body>
</html>
