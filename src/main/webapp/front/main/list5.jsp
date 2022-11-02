<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> <!-- , target-densitydpi=medium-dpi" -->
<meta name="format-detection" content="telephone=no" />
<title>列表</title>
<%@ include file="/front/skin/common.jsp"%>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 2,				//SHOP_LIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

$(document).ready(function() {
	if('${way}'=="grid"){
		$("#icon_list").attr("src","/front/skin/main/img/icon/icon_grid_gray.png");
		$("#list").css("display","none");
		$("#grid").css("display","block");
	}else{
		$("#icon_list").attr("src","/front/skin/main/img/icon/icon_list_gray.png");
		$("#grid").css("display","none");
		$("#list").css("display","block");
	}
	if('${sessionScope.sessionSkin.skinTypeShop}'=="2"){
		if('${orderby}'=='SALES_QTY_DESC'){
			$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#989798");
			$("#ob_sales_qty").css("background","#376ABE");
	 	}else if('${orderby}'=='PRICE_DESC'){
	 		$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#376ABE");
			$("#ob_sales_qty").css("background","#989798");
			$("#price_sort").attr("src","/front/skin/main/img/icon/desc.png");
	 	}else if('${orderby}'=='PRICE_ASC'){
	 		$("#ob_default").css("background","#989798"); 
			$("#ob_price").css("background","#376ABE");
			$("#ob_sales_qty").css("background","#989798");
			$("#price_sort").attr("src","/front/skin/main/img/icon/asc.png");
	 	}else if('${orderby}'==''){
	 		$("#ob_default").css("background","#376ABE");
			$("#ob_price").css("background","#989798");
			$("#ob_sales_qty").css("background","#989798");
	 	}
	}else{
		if('${orderby}'=='SALES_QTY_DESC'){
			$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#989798");
			$("#ob_sales_qty").css("background","#B9003A");
	 	}else if('${orderby}'=='PRICE_DESC'){
	 		$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#B9003A");
			$("#ob_sales_qty").css("background","#989798");
			$("#price_sort").attr("src","/front/skin/main/img/icon/desc.png");
	 	}else if('${orderby}'=='PRICE_ASC'){
	 		$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#B9003A");
			$("#ob_sales_qty").css("background","#989798");
			$("#price_sort").attr("src","/front/skin/main/img/icon/asc.png");
	 	}else if('${orderby}'==''){
	 		$("#ob_default").css("background","#B9003A");
			$("#ob_price").css("background","#989798");
			$("#ob_sales_qty").css("background","#989798");
	 	}
	}
	
});
function doSearch(title,flag){
	var way="";
	var sort="";
	if($("#icon_list").attr("src")=="/front/skin/main/img/icon/icon_grid_gray.png"){
		way="grid";
	}else{
		way="list";
	}
	if('${sessionScope.SKIN_TYPE_SHOP_SESSION }'=="1"){
		if($("#ob_default").css("background")=="#B9003A"){
	 		sort=""	;
	 	}else if($("#ob_price").css("background")=="#B9003A"){
	 		if($("#price_sort").attr("src")=="/front/skin/main/img/icon/desc.png"){
				sort="PRICE_ASC";
			}else if($("#price_sort").attr("src")=="/front/skin/main/img/icon/asc.png"){
				sort="PRICE_DESC";
			}
	 	}else if($("#ob_price").css("background")=="#B9003A"){
	 		sort="SALES_QTY_DESC";
	 	}
	}else if('${sessionScope.SKIN_TYPE_SHOP_SESSION }'=="2"){
		if($("#ob_default").css("background")=="#376ABE"){
	 		sort=""	;
	 	}else if($("#ob_price").css("background")=="#376ABE"){
	 		if($("#price_sort").attr("src")=="/front/skin/main/img/icon/desc.png"){
				sort="PRICE_ASC";
			}else if($("#price_sort").attr("src")=="/front/skin/main/img/icon/asc.png"){
				sort="PRICE_DESC";
			}
	 	}else if($("#ob_price").css("background")=="#376ABE"){
	 		sort="SALES_QTY_DESC";
	 	}
	}else{
		if($("#ob_default").css("background")=="#B9003A"){
	 		sort=""	;
	 	}else if($("#ob_price").css("background")=="#B9003A"){
	 		if($("#price_sort").attr("src")=="/front/skin/main/img/icon/desc.png"){
				sort="PRICE_ASC";
			}else if($("#price_sort").attr("src")=="/front/skin/main/img/icon/asc.png"){
				sort="PRICE_DESC";
			}
	 	}else if($("#ob_price").css("background")=="#B9003A"){
	 		sort="SALES_QTY_DESC";
	 	}
	}
 	
	if(flag==''){
		location.href='/front/main/list.htm?orderby='+sort+'&way='+way+'&goodsName='+$.trim($("#title").val())+'&shopGradeClassId='+title+'&brandId='+title;
	}else if(flag=='class'){
		location.href='/front/main/list.htm?orderby='+sort+'&way='+way+'&goodsName='+$.trim($("#title").val())+'&shopGradeClassId='+title;
	}else if(flag=='brand'){
		location.href='/front/main/list.htm?orderby='+sort+'&way='+way+'&goodsName='+$.trim($("#title").val())+'&brandId='+title;
	}
}
function list(){
	if($("#icon_list").attr("src")=="/front/skin/main/img/icon/icon_list_gray.png"){
		$("#icon_list").attr("src","/front/skin/main/img/icon/icon_grid_gray.png");
		$("#list").css("display","none");
		$("#grid").css("display","block");
	}else if($("#icon_list").attr("src")=="/front/skin/main/img/icon/icon_grid_gray.png"){
		$("#icon_list").attr("src","/front/skin/main/img/icon/icon_list_gray.png");
		$("#grid").css("display","none");
		$("#list").css("display","block");
	}else{
		$("#icon_list").attr("src","/front/skin/main/img/icon/icon_grid_gray.png");
		$("#list").css("display","none");
		$("#grid").css("display","block");
	}
}

function orderby(flag){
	var way="";
	var sort="";
	if($("#icon_list").attr("src")=="/front/skin/main/img/icon/icon_list_gray.png"){
		way="list";
	}else{
		way="grid";
	}
 	
	if('${sessionScope.SKIN_TYPE_SHOP_SESSION }'=="1"){
		if(flag=='ob_default'){
			$("#"+flag).css("background","#B9003A");
			$("#ob_price").css("background","#989798");
			$("#ob_sales_qty").css("background","#989798");
		}else if(flag=='ob_price'){
			if($("#price_sort").attr("src")=="/front/skin/main/img/icon/desc.png"){
				sort="PRICE_ASC";
				$("#price_sort").attr("src","/front/skin/main/img/icon/asc.png");
			}else if($("#price_sort").attr("src")=="/front/skin/main/img/icon/asc.png"){
				sort="PRICE_DESC";
				$("#price_sort").attr("src","/front/skin/main/img/icon/desc.png");
			}
			$("#ob_default").css("background","#989798");	
			$("#"+flag).css("background","#B9003A");
			$("#ob_sales_qty").css("background","#989798");
		}else if(flag=='ob_sales_qty'){
			sort="SALES_QTY_DESC";
			$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#989798");
			$("#"+flag).css("background","#B9003A");
		}
	}else if('${sessionScope.SKIN_TYPE_SHOP_SESSION }'=="2"){
		if(flag=='ob_default'){
			$("#"+flag).css("background","#376ABE");
			$("#ob_price").css("background","#989798");
			$("#ob_sales_qty").css("background","#989798");
		}else if(flag=='ob_price'){
			if($("#price_sort").attr("src")=="/front/skin/main/img/icon/desc.png"){
				sort="PRICE_ASC";
				$("#price_sort").attr("src","/front/skin/main/img/icon/asc.png");
			}else if($("#price_sort").attr("src")=="/front/skin/main/img/icon/asc.png"){
				sort="PRICE_DESC";
				$("#price_sort").attr("src","/front/skin/main/img/icon/desc.png");
			}
			$("#ob_default").css("background","#989798");	
			$("#"+flag).css("background","#376ABE");
			$("#ob_sales_qty").css("background","#989798");
		}else if(flag=='ob_sales_qty'){
			sort="SALES_QTY_DESC";
			$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#989798");
			$("#"+flag).css("background","#376ABE");
		}
	}else{
		if(flag=='ob_default'){
			$("#"+flag).css("background","#B9003A");
			$("#ob_price").css("background","#989798");
			$("#ob_sales_qty").css("background","#989798");
		}else if(flag=='ob_price'){
			if($("#price_sort").attr("src")=="/front/skin/main/img/icon/desc.png"){
				sort="PRICE_ASC";
				$("#price_sort").attr("src","/front/skin/main/img/icon/asc.png");
			}else if($("#price_sort").attr("src")=="/front/skin/main/img/icon/asc.png"){
				sort="PRICE_DESC";
				$("#price_sort").attr("src","/front/skin/main/img/icon/desc.png");
			}
			$("#ob_default").css("background","#989798");	
			$("#"+flag).css("background","#B9003A");
			$("#ob_sales_qty").css("background","#989798");
		}else if(flag=='ob_sales_qty'){
			sort="SALES_QTY_DESC";
			$("#ob_default").css("background","#989798");
			$("#ob_price").css("background","#989798");
			$("#"+flag).css("background","#B9003A");
		}
	}
	
	location.href='/front/main/list.htm?orderby='+sort+'&way='+way+'&goodsName='+$.trim($("#title").val());
}

function fn_windowOpen(url) {
	window.open(url,"shop_detail","fullscreen=no"); 
}


</script>
</head>
<body>
<header>
	<div class="search">
		<div class="header" style="height: 5px;">
			<table>
				<tr style="background-COLOR: #F6F6F6;height: 20PX;">
					<td class="header_left">
						<div class="list">
							<span class="navBtn1"></span>
						</div>
					</td>
					<td class="header_center">
						<input id="title" type="text" style="width: 98%;" class="search_style" value="${goodsName }"/>
					</td>
					<td class="header_right" align="right">
	<!-- 					<img alt="" src="/front/skin/main/img/search.png" class="header_search" onclick="doSearch('','')" /> -->
						<a class="btnSearch">搜&nbsp;索</a> 
					</td>
				</tr>
			</table>
		</div>
	</div>
</header>
			
<!-- <div id="container" style="margin-top: 0px;"> -->
<!-- 			<table style="height: 70px;width: 100%;"> -->
<!-- 				<tr style="background-COLOR: #F6F6F6;height: 20px;"> -->
<!-- 					<td colspan="3" style="margin-top: 10PX;padding-top: 4PX;"> -->
<!-- 						<div class="orderby length2"> -->
<!-- 							<a class="button footer_bought" onclick="orderby('ob_default')" id="ob_default" >默认 -->
<!-- 							</a> -->
<!-- 							<a class="button footer_bought" onclick="orderby('ob_price')" id="ob_price">价格 -->
<!-- 								<img  id="price_sort" alt="" src="/front/skin/main/img/icon/desc.png" style="height: 12px;vertical-align: middle;"/> -->
<!-- 							</a> -->
<!-- 							<a class="button footer_bought" onclick="orderby('ob_sales_qty')" id="ob_sales_qty">销量 -->
<!-- 								<img alt="" src="/front/skin/main/img/icon/desc.png" style="height: 12px;vertical-align: middle;"/> -->
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 						<div  class="showway"> -->
<!-- 							<img alt="" src="/front/skin/main/img/icon/icon_list_gray.png" id="icon_list" onclick="list();" style="top:1px;"> -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- </div> -->
<div id="container" style="margin-top: 10px;">
		<table style="width: 100%;">
			<tr style="background-COLOR: #F6F6F6;height: 40px;">
				<td colspan="3" style="margin-top: 10PX;padding-top: 4PX;">
					<div class="orderby length2">
						<a class="button footer_bought" onclick="orderby('ob_default')" id="ob_default" >默认
						</a>
						<a class="button footer_bought" onclick="orderby('ob_price')" id="ob_price">价格
							<img  id="price_sort" alt="" src="/front/skin/main/img/icon/desc.png" style="height: 12px;vertical-align: middle;"/>
						</a>
						<a class="button footer_bought" onclick="orderby('ob_sales_qty')" id="ob_sales_qty">销量
							<img alt="" src="/front/skin/main/img/icon/desc.png" style="height: 12px;vertical-align: middle;"/>
						</a>
					</div>
					<div  class="showway">
						<img alt="" src="/front/skin/main/img/icon/icon_list_gray.png" id="icon_list" onclick="list();" style="top:1px;">
					</div>
				</td>
			</tr>
		</table>
	    <section id="contents">
		<ul class="recommend" id="list">
			 <c:forEach var="goodsList" items="${goodsList}" varStatus="status">  
			 	<li>
					<a>
						<span class="thumb">
							<c:if test="${goodsList.GOODS_LIST_IMG_URL==null}">
								<img src="/front/img_prd/demoComp/no_image.png" alt="" 
									onclick="fn_windowOpen('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')"/>
							</c:if>
							<c:if test="${goodsList.GOODS_LIST_IMG_URL !=null}">
								<img src="${goodsList.GOODS_LIST_IMG_URL }" alt="" 
									onclick="fn_windowOpen('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')"/>
							</c:if>
						</span>
						<span class="brand" onclick="fn_windowOpen('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')">
							${goodsList.GOODS_NM }  
						</span>
						<span class="name" onclick="fn_windowOpen('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')">
							${goodsList.START_DESC }
						</span> 
						<strong class="price">￥${goodsList.PRICE_ORG }</strong>
						<del class="price2">￥${goodsList.PRICE_UNIT_SALES }</del><br/>
						<span class="detail">${goodsList.SUM_SALES_QTY }人付款</span>
						<span class="detail" style="margin-left: 3px;">${goodsList.SUM_FVORT_QTY }人收藏</span>
						<span style="float: right;text-align: right;padding-right: 2px;">
							<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='Y' }">
								<img id="img${goodsList.GOODS_ID}" alt="" width="18px" height="15px" src="/front/skin/main/img/favorites_01.png" style="vertical-align: middle;"
									onclick="favorites('${goodsList.FAVORITES_GOODS_FLAG}','${goodsList.SHOP_ID}','${goodsList.GOODS_ID}','${goodsList.DISPLAY_ID}','list')"/>
								<span class="detail_right" id="span${goodsList.GOODS_ID}">已收藏</span>
							</c:if>
							<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='N' }">
								<img id="img${goodsList.GOODS_ID}" alt="" width="18px" height="15px" src="/front/skin/main/img/favorites_02.png" style="vertical-align: middle;"
									onclick="favorites('${goodsList.FAVORITES_GOODS_FLAG}','${goodsList.SHOP_ID}','${goodsList.GOODS_ID}','${goodsList.DISPLAY_ID}','list')"	>
								<span class="detail_right" id="span${goodsList.GOODS_ID}">未收藏</span>
							</c:if>
						</span>
					</a>
				</li> 
			 </c:forEach>
			</ul>	
			
		<div class="saleslist" style="display: none;" id="grid">
			<ul>
				<li>
					<table>
						 <c:forEach var="goodsList" items="${goodsList}" varStatus="status">
						 	<c:if test="${status.index % 2 == 0}">
						 	<tr>
						 		<td class="salesoff_td_padding"  style="width: 50%;">
						 			<a>
									<table>
										<tr>
											<td colspan="4">
												<c:if test="${goodsList.GOODS_LIST_IMG_URL==null}">
													<img src="/front/img_prd/demoComp/no_image.png" alt="" 
														onclick="fn_windowOpen('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')"/>
												</c:if>
												<c:if test="${goodsList.GOODS_LIST_IMG_URL !=null}">
													<img src="${goodsList.GOODS_LIST_IMG_URL }" alt="" 
														onclick="fn_windowOpen('/front/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')"/>
												</c:if>
<%-- 														<img alt="" src="${goodsList.GOODS_LIST_IMG_URL }" style="width: 90%;height: 100px;"> --%>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<span class="headtitle" onclick="fn_windowOpen('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')">
													${goodsList.GOODS_NM }
												</span>
												<span class="subtitle" onclick="fn_windowOpen('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}')">
													${goodsList.START_DESC }
												</span>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<span class="price_float">￥</span>
												<span class="price_int">${goodsList.PRICE_ORG }</span>
<!-- 														<span class="price_float">.00</span> -->
											</td>
											<td rowspan="2"><div class="red_split"></div></td>
											<td align="center">
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='Y' }">
													<img id="gridimg${goodsList.GOODS_ID}" style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_01.png"
														 onclick="favorites('${goodsList.FAVORITES_GOODS_FLAG}','${goodsList.SHOP_ID}','${goodsList.GOODS_ID}','${goodsList.DISPLAY_ID}','grid')">
												</c:if>
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='N' }">
													<img id="gridimg${goodsList.GOODS_ID}" style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_02.png" 
														onclick="favorites('${goodsList.FAVORITES_GOODS_FLAG}','${goodsList.SHOP_ID}','${goodsList.GOODS_ID}','${goodsList.DISPLAY_ID}','grid')">
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="salesoff_td_padding2">
												<del class="price_del">￥${goodsList.PRICE_UNIT_SALES }</del>
											</td>
											<td>
												<span class="price_del">${goodsList.SUM_SALES_QTY }人付款</span>
											</td>
											<td align="center">
												
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='Y' }">
													<span id="gridspan${goodsList.SHOP_ID}" class="price_del">已收藏</span>
												</c:if>
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='N' }">
													<span id="gridspan${goodsList.SHOP_ID}" class="price_del">未收藏</span>
												</c:if>
											</td>
										</tr>
									</table>
									</a>
								</td>
						 	</c:if>
							<c:if test="${status.index%2==1}">
								<td class="salesoff_td_padding" style="width: 50%;">
									<a>
									<table>
										<tr>
											<td colspan="4">
												<c:if test="${goodsList.GOODS_LIST_IMG_URL==null}">
													<img src="/front/img_prd/demoComp/no_image.png" alt="" />
												</c:if>
												<c:if test="${goodsList.GOODS_LIST_IMG_URL !=null}">
													<img src="${goodsList.GOODS_LIST_IMG_URL }" alt="" />
												</c:if>
<%-- 														<img alt="" src="${goodsList.GOODS_LIST_IMG_URL }" style="width: 90%;height: 100px;"> --%>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<span class="headtitle">${goodsList.GOODS_NM }</span>
												<span class="subtitle">${goodsList.START_DESC }</span>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<span class="price_float">￥</span>
												<span class="price_int">${goodsList.PRICE_ORG }</span>
<!-- 														<span class="price_float">.00</span> -->
											</td>
											<td rowspan="2"><div class="red_split"></div></td>
											<td align="center">
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='Y' }">
													<img id="gridimg${goodsList.GOODS_ID}" style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_01.png"
														 onclick="favorites('${goodsList.FAVORITES_GOODS_FLAG}','${goodsList.SHOP_ID}','${goodsList.GOODS_ID}','${goodsList.DISPLAY_ID}','grid')">
												</c:if>
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='N' }">
													<img id="gridimg${goodsList.GOODS_ID}" style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_02.png" 
														onclick="favorites('${goodsList.FAVORITES_GOODS_FLAG}','${goodsList.SHOP_ID}','${goodsList.GOODS_ID}','${goodsList.DISPLAY_ID}','grid')">
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="salesoff_td_padding2">
												<del class="price_del">￥${goodsList.PRICE_UNIT_SALES }</del>
											</td>
											<td>
												<span class="price_del">${goodsList.SUM_SALES_QTY }人付款</span>
											</td>
											<td align="center">
												
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='Y' }">
													<span id="gridspan${goodsList.SHOP_ID}" class="price_del">已收藏</span>
												</c:if>
												<c:if test="${goodsList.FAVORITES_GOODS_FLAG=='N' }">
													<span id="gridspan${goodsList.SHOP_ID}" class="price_del">未收藏</span>
												</c:if>
											</td>
										</tr>
									</table>
									</a>
								</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</li>
			</ul>
		</div>
	</section>
	</div>
	
	
	<!-- Quick link -->
	<nav class="headerQuickLink">
		<div class="shop_class">
			<div class="inner">
				<h2>商品分类</h2>
				<ul>
					<c:forEach  var="classList" items="${classList }" varStatus="status">
						<li onclick="doSearch('${classList.SGC_ID }','class')">${classList.SGC_NM }</li>
					</c:forEach>
				</ul>
				<h2>品牌</h2>
				<ul>
					<c:forEach  var="brandList" items="${brandList }" varStatus="status">
						<li onclick="doSearch('${brandList.BRAND_ID }','brand')">${brandList.BRAND_NM }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div style="height: 150px;"></div>
	</nav>
	<!-- //container -->
	<div class="bottom_fixed length2">
		<a href="/front/main/main2.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image">
		</a>
		<a href="/front/customer/myPage.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_personalcenter.png"  class="bottom_image">
		</a>
	</div>
	<a class="bottom_totop">top</a>
</body>
</html>
