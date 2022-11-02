<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${detail.GOODS_NM }</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ include file="/front/main/messageTip.jsp"%>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 3,				//SHOP_DETAIL
	 pageId : '' || '',
	 goodsId : '${detail.GOODS_ID}' || '',
	 displayId : '${detail.DISPLAY_ID}' || ''
});

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
						//location.href='/front/cart/cart.htm';
					}
					else {
						alertTip("添加成功.");	
						cancelOptionBox();
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
		if(spec1=="0"){
			alertTip("请选择属性1");
			return false;
		}else if(spec2=="0"){
			alertTip("请选择属性2");
			return false;
		}else{
			$(".tipfloat").animate({height:"hide"},1000,function(){
				$(".tipfloat").css("display","none");
			});
			
			addCart(flag);
			
// 			if(flag=="cart"){
// 				//加入购物车
// 				addCart();
// 			}else if(flag=="order"){
// 				//	location.href='/front/orderConfirm/orderConfirm.htm?priceOptionId='+priceOptionId+'&shopId='+${detail.SHOP_ID};//订单确认
// 				addCart();
// 			}


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

function payment() {
	$('#priceOptionId','#form1').val(priceOptionId);
	$('#goods_qty_num','#form1').val($("#count").val());
	$('#form1').submit();
}

</script>
</head>
<body>
	<!-- header -->
	<header>
		<!-- waremec -->
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
			<section class="detail">
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
					<td style="padding-left: 8px;">
						<span class="detail_headtitle">${detail.GOODS_NM }</span>
					</td>
					<td></td>
					<td rowspan="2">
						<div class="split_line"></div>
					</td>
					<td align="center" style="width: 50px">
						<c:if test="${detail.FAVORITES_GOODS_FLAG=='Y' }">
							<img id="gridimg${detail.GOODS_ID}" style="width: 24px;height: 20px;vertical-align: middle;" alt="" src="/front/skin/main/img/favorites_01.png"
								 onclick="favorites('${detail.FAVORITES_GOODS_FLAG}','${detail.SHOP_ID}','${detail.GOODS_ID}','${detail.DISPLAY_ID}','grid')">
						</c:if>
						<c:if test="${detail.FAVORITES_GOODS_FLAG=='N' }">
							<img id="gridimg${detail.GOODS_ID}" style="width: 24px;height: 20px;" alt="" src="/front/skin/main/img/favorites_02.png" 
								onclick="favorites('${detail.FAVORITES_GOODS_FLAG}','${detail.SHOP_ID}','${detail.GOODS_ID}','${detail.DISPLAY_ID}','grid')">
						</c:if>
<!-- 						<img style="width: 24px;height: 20px;" alt="" src="/front/skin/main/img/favorites_01.png"> -->
					</td>
				</tr>
				<tr>
					<td style="padding-left: 8px;">
						<span class="detail_subtitle">${detail.EVENT_DESC }</span>
					</td>
					<td></td>
					<td align="center">
						<c:if test="${detail.FAVORITES_GOODS_FLAG=='Y' }">
							<span id="gridspan${detail.GOODS_ID}" class="price_del">已收藏</span>
						</c:if>
						<c:if test="${detail.FAVORITES_GOODS_FLAG=='N' }">
							<span id="gridspan${detail.GOODS_ID}" class="price_del">未收藏</span>
						</c:if>
					</td>
				</tr>
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
				<tr>
					<td colspan="4" class="detail_express_td" >
						<div class="detail_express_price" style="float: left;width: 70%;">
							<span class="detail_subtitle">快递：配送至</span>
							<img id="img_location" alt="" src="/front/skin/main/img/icon/location.png" class="detail_location">
<!-- 							<input type="text"  id="address" class="detail_address"/> -->
							<c:choose>
								<c:when test="${detail.ADR_CITY_NM==null }">
									<span class="detail_subtitle">暂无地址</span>
								</c:when>
								<c:otherwise>
									<span class="detail_subtitle">${detail.ADR_CITY_NM }</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div style="float: left;" class="split_line_fatter">
						</div>
						<div class="detail_express_price" style="float: left;">
							<c:choose>
								<c:when test="${detail.TRANS_FEE==null }">
									<span class="detail_subtitle">暂无运费</span>
								</c:when>
								<c:otherwise>
									<span class="detail_subtitle">￥${detail.TRANS_FEE }</span>
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
			</table>
			
			<ul id="tttt" class="detail_tabSt1 tab">
				<li id="liimage" class="on"><a href="#pCont1">图文详情</a></li>
				<li><a href="#pCont2">商品属性</a></li>
				<li id="lireview"><a href="#pCont3">评价(<span>${totalRecords}</span>)</a></li>
			</ul>
			<div id="pCont1" class="tabSt1Cont">
			    <div id="container">
				    <section id="contents">
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
				<div style="height: 50px;"></div>
			</div>
			<div id="pCont2" class="tabSt1Cont">
				<div class="pDetailTxt mgt10" style="text-align: center;">
					<table style="width: 95%;text-align: left;">
						<c:forEach var="list" items="${attributeList }" varStatus="status">
							<tr>
								<td style="width: 40%;border:1px solid #C8C8C8;border-left: none;padding-left: 15px;height: 30px;font-size: 16px;">${list.SPEC_NM }</td>
								<td style="width: 60%;border:1px solid #C8C8C8;border-right: none;text-align: center;font-size: 16px;">${list.SPEC_VALUE_NM }${list.UNIT_TXT }</td>
<%-- 								<td style="width: 20%;">${list.UNIT_TXT }</td> --%>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div style="height: 70px;"></div>
			</div>
			<div id="pCont3" class="tabSt1Cont">
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
				<div style="border: 1px solid #e2e2e2; border-top: 0px;background-color: #ffffff;margin-top: -20px;" align="center">
					<div style="height: 5px;"></div>
					<div id="kkpager"></div>
					<div style="height: 10px;"></div>
				</div>
				<div style="height: 50px;"></div>
			</div>
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
<%-- 	<c:forEach var="parent" items="${specListParent }" varStatus="status">  --%>
<!-- 		<div class="productAttribute"> -->
<!-- 			<div class="inner"> -->
<%-- 				<h2>${parent.SPEC_NM }</h2> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
		<div class="productAttribute">
			<div class="inner">
				<h2>${specListParent[0].SPEC_NM }</h2>
				<ul>
<!-- 				 -->
					<c:forEach  var="child1" items="${specListChild1 }" varStatus="status">
						<li>${child1.SPEC_VALUE_NM }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="productAttribute1">
			<div class="inner1">
				<h2>${specListParent[1].SPEC_NM }</h2>
<%-- 				<c:forEach items="${child2}" var="child2"> --%>
<%-- 					${child2.key}-${child2.value}<br/> --%> 
<%-- 					<c:forEach  var="child1" items="${child2.value}" varStatus="status"> --%>
<%-- 						<li>${child1.SPCE_VALUE_NM }</li> --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:forEach> --%>
				<ul id="ul0" >
					<c:forEach  var="child2" items="${child2.list0 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM } </li>
					</c:forEach>
				</ul>
				<ul id="ul1" style="display: none;">
					<c:forEach  var="child2" items="${child2.list1 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
					</c:forEach>
				</ul>
				<ul id="ul2" style="display: none;">
					<c:forEach  var="child2" items="${child2.list2 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
					</c:forEach>
				</ul>
				<ul id="ul3" style="display: none;">
					<c:forEach  var="child2" items="${child2.list3 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
					</c:forEach>
				</ul>
				<ul id="ul4" style="display: none;">
					<c:forEach  var="child2" items="${child2.list4 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
					</c:forEach>
				</ul>
				<ul id="ul5" style="display: none;">
					<c:forEach  var="child2" items="${child2.list5 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
					</c:forEach>
				</ul>
				<ul id="ul6" style="display: none;">
					<c:forEach  var="child2" items="${child2.list6 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
					</c:forEach>
				</ul>
				<ul id="ul7" style="display: none;">
					<c:forEach  var="child2" items="${child2.list7 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
					</c:forEach>
				</ul>
				<ul id="ul8" style="display: none;">
					<c:forEach  var="child2" items="${child2.list8 }" varStatus="status">
						<li onclick="priceDisplay('${child2.PRICE_OPTION_ID }','${child2.PRICE_UNIT_SALES }')">${child2.SPCE_VALUE_NM }</li>
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
</body>
</html>
