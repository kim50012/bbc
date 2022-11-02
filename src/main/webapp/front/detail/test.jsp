<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>list </title>
<script type="text/javascript">
$(document).ready(function() {
	var t4 = new PopupLayer({trigger:"#category",popupBlk:"#categorylist",closeBtn:"#categorylist",useFx:true});
	t4.doEffects = function(way){
	     way == "open"?this.popupLayer.slideDown("slow"):this.popupLayer.slideUp("slow");
	};
	if('${way}'=="list"){
		list();
	}else{
		grid();
	}
	if('${orderby}'=='SALES_QTY_DESC'){
//  		$("#span_sales_asc").removeClass("header_content_span");
 		$("#span_sales_asc").addClass("font_color");
 	}else if('${orderby}'=='PRICE_DESC'){
//  		$("#span_price_desc").removeClass("header_content_span");
 		$("#span_price_desc").addClass("font_color");
 	}else if('${orderby}'=='PRICE_ASC'){
//  		$("#span_price_asc").removeClass("header_content_span");
 		$("#span_price_asc").addClass("font_color");
 	}
});
function list(){
	$("#grid").css("display","none");
	$("#list").css("display","block");
	$("#icon_list").attr("src","/front/skin/main/img/icon/icon_list.png");
	$("#icon_grid").attr("src","/front/skin/main/img/icon/icon_grid_gray.png");
	$("#span_list_view").addClass("font_color");
	$("#span_grid_view").removeClass("font_color");
}
function grid(){
	$("#list").css("display","none");
	$("#grid").css("display","block");
	$("#icon_list").attr("src","/front/skin/main/img/icon/icon_list_gray.png");
	$("#icon_grid").attr("src","/front/skin/main/img/icon/icon_grid.png");
	$("#span_grid_view").addClass("font_color");
	$("#span_list_view").removeClass("font_color");
}
function favorites(flag,shopId,goodsId,displayId,way){
	
	if(way=="list"){
		if($("#img"+goodsId).attr("src")=="/front/skin/main/img/favorites_01.png"){
			$("#img"+goodsId).attr("src","/front/skin/main/img/favorites_02.png");
			$("#span"+goodsId).html("未收藏");
		}else{
			$("#img"+goodsId).attr("src","/front/skin/main/img/favorites_01.png");
			$("#span"+goodsId).html("已收藏");
		}
	}else{
		if($("#gridimg"+goodsId).attr("src")=="/front/skin/main/img/favorites_01.png"){
			$("#gridimg"+goodsId).attr("src","/front/skin/main/img/favorites_02.png");
			$("#gridspan"+goodsId).html("未收藏");
		}else{
			$("#gridimg"+goodsId).attr("src","/front/skin/main/img/favorites_01.png");
			$("#gridspan"+goodsId).html("已收藏");
		}
	}
	var params = {
			shopId: shopId,
			goodsId:goodsId,
			displayId:displayId
		}; 
	if(flag=="N"){
		$.ajax({
			data: params,
			dataType: "json",
			type: "POST",
			url: "/front/main/addFavorite.htm",
			success: function(data){ 
				if(data.status == "S") {
					alert("收藏成功");
				} else {
					alert("收藏失败");
					return false;
				}
			},
			error: function(a, msg, c){
				alert("error: " + msg);
			}
		});
	}else{
		$.ajax({
			data: params,
			dataType: "json",
			type: "POST",
			url: "/front/main/removeFavorite.htm",
			success: function(data){ 
				if(data.status == "S") {
					alert("收藏成功");
				} else {
					alert("收藏失败");
					return false;
				}
			},
			error: function(a, msg, c){
				alert("error: " + msg);
			}
		});
	}
}

function orderby(flag){
	var way="";
	if($("#icon_list").attr("src")=="/front/skin/main/img/icon/icon_list.png"){
		way="list";
	}else{
		way="grid";
	}
 	location.href='/front/main/list.htm?orderby='+flag+'&way='+way;
 	//header_content_span
 	if(flag=='SALES_QTY_DESC'){
 		$("#span_sales_asc").removeClass("header_content_span");
 		$("#span_sales_asc").addClass("font_color");
 	}else if(flag=='PRICE_DESC'){
//  		$("#span_price_desc").removeClass("header_content_span");
 		$("#span_price_desc").addClass("font_color");
 	}else if(flag=='PRICE_ASC'){
//  		$("#span_price_asc").removeClass("header_content_span");
 		$("#span_price_asc").addClass("font_color");
 	}
}
</script>
</head>
<body>

	<div class="header" style="height: 5px;">
		<table>
			<tr>
				<td class="header_center">
					<div class="list">
						<span  class="navBtn1"></span>
<!-- 						<a href="#" class="navBtn1">Nav</a> -->
					</div>
					
				</td>
				<td class="header_right" align="right">
					<img alt="" src="/front/skin/main/img/main_search.png" class="img_size">
					<img alt="" src="/front/skin/main/img/main_cart.png" class="img_size">
				</td>
			</tr>
		</table>
		<table style="width: 100%;height: 2px;">
			<tr>
				<td></td>
			</tr>
		</table>
		
	</div>
	
	<nav class="headerQuickLink">
		<div class="inner">
			<table style="width: 90%;margin: auto;">
				<tr>
					<td class="header_layout">
						<div class="skin_block"></div>
						<span class="header_title_span">布局方式 :</span>
					</td>
					<td class="header_layout" onclick="list();">
						<img alt="" src="/front/skin/main/img/icon/icon_list.png" id="icon_list" onclick="list();">
						<span class="header_content_span" id="span_list_view">列表视图</span>
					</td>
					<td class="header_layout" onclick="grid();">
						<img alt="" src="/front/skin/main/img/icon/icon_grid_gray.png" id="icon_grid" onclick="grid()">
						<span class="header_content_span" id="span_grid_view">图片视图</span>
					</td>
				</tr>
				<tr>
					<td class="header_title_span" style="height: 30px;">
						<div class="skin_block"></div>
						<span class="header_title_span">排序方式 :</span>
					</td>
					<td class="header_layout" colspan="2" onclick="orderby('SALES_QTY_DESC')">
						<span class="header_content_span"  id="span_sales_asc">销量从高到低</span>
					</td>
				</tr>
				<tr>
					<td style="height: 30px;"></td>
					<td colspan="2"  onclick="orderby('PRICE_DESC')">
						<span class="header_content_span"  id="span_price_desc">价格从高到低</span>
					</td>
				</tr>
				<tr>
					<td style="height: 30px;"></td>
					<td colspan="2" onclick="orderby('PRICE_ASC')">
						<span class="header_content_span" id="span_price_asc">价格由低到高</span>
					</td>
				</tr>
			</table>
		</div>
	</nav>
</body>
</html>
