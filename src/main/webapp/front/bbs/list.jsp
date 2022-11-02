<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<% 
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0L);
	
	if(request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control","no-cache");
	
	String path = request.getContextPath();
	String basePath = "";
	if(request.getServerPort() == 80){
		
	 basePath = request.getScheme()+"://"+request.getServerName()+ "/";
	}else{
		
	 basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	}
	
	String strCurrentTime = String.valueOf(System.currentTimeMillis());
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>중국이야기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi" />
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/common.css" />
<link rel="stylesheet" type="text/css" href="/front/js/page/kkpager.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/skin.css?time=<%=strCurrentTime %>" />

<style type="text/css">
	#foo {width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 999000; width: 100%; height: 100%;}
	#fo {position: fixed; top: 50%; left: 50%; z-index:999999; display: '';}
</style>

<script type="text/javascript" src="/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/front/js/headroom.js"></script>
<script type="text/javascript" src="/front/js/jQuery.headroom.js"></script>
<script type="text/javascript" src="/front/js/jquery.touchSlider.js"></script>
<script type="text/javascript" src="/front/js/common.js"></script>
<script type="text/javascript" src="<c:url value="/admin/js/template.js" />"></script>
<script type="text/javascript" src="/front/js/page/kkpager.min.js"></script>
<script type="text/javascript" src="/front/js/raty/jquery.raty.js"></script>
<script type="text/javascript" src="/front/js/spin.min.js"></script>
<script type="text/javascript" src="/front/js/bottom-menu.js"></script>
<script type="text/javascript" src="/front/js/jquery.bpopup.min.js"></script>
<script>

	if(!window.console){
		window.console = {
			dubug : function(){},
			log : function(){},
			info : function(){},
			warn : function(){},
			error : function(){}	  
		} 
	}
  
	var sPopts = {
		  lines: 10, // The number of lines to draw
		  length: 5, // The length of each line
		  width: 4, // The line thickness
		  radius: 10, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 30, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#000', // #rgb or #rrggbb or array of colors
		  speed: 1.0, // Rounds per second
		  trail: 80, // Afterglow percentage
		  shadow: true, // Whether to render a shadow
		  hwaccel: true, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  top: '50%', // Top position relative to parent
		  left: '50%' // Left position relative to parent
		};

	// Common functions
	function pad(number, length) {
	    var str = '' + number;
	    while (str.length < length) {str = '0' + str;}
	    return str;
	}
	function formatTime(time, ftype) {
	    var day = parseInt(time / 8640000),
	    	hou = parseInt(time / 360000) - (day * 24),
	    	min = parseInt(time / 6000) - (hou * 60) - (day * 1440),
	        sec = parseInt(time / 100) - (min * 60) - (hou * 3600) - (day * 86400),
	        hundredths = pad(time - (sec * 100) - (min * 6000) - (hou * 360000), 2) - (day * 8640000);
	    	//alert(hou);
	    var str_return;
	    if (ftype == 2) {
	    	str_return = 
		   	     '还剩'+(day > 0 ? day+'天' : "")
		    		+(hou > 0 ? pad(hou, 2) : "00") 
		    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
		    		+ ":" + (sec > 0 ? pad(sec, 2) : "00");
	    }
	    else if (ftype == 3) {
	    	str_return = 
		   	     (hou > 0 ? pad(hou, 2) : "00") 
		    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
		    		+ ":" + (sec > 0 ? pad(sec, 2) : "00");
	    }
	    else if (ftype == 4) {
	    	var resTime = new Object();
	    	resTime.day = (day > 0 ? day : "00");
	    	resTime.hour = (hou > 0 ? pad(hou, 2) : "00");
	    	resTime.min = (min > 0 ? pad(min, 2) : "00");
	    	resTime.sec = (sec > 0 ? pad(sec, 2) : "00");
	    	resTime.hundr = (hundredths > 0 ? pad(hundredths, 2) : "00");
	    	str_return = resTime;
	    }
	    else {
	    	str_return = 
	    		'还剩'+(day > 0 ? day+'天' : "")
	    		+(hou > 0 ? pad(hou, 2) : "00") 
	    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
	    		+ ":" + (sec > 0 ? pad(sec, 2) : "00") 
	    		+ "." + (hundredths > 0 ? pad(hundredths, 2) : "00");
	    }
	    return str_return;
	}

	function strToJson(str) {
	  eval("var x = " + str + ";");
	  return JSON.parse(str);
	}
</script>
	
<div id="foo">
	<div id="fo"></div>
</div>
<script>
	var target = document.getElementById('fo');
	spinner = new Spinner(sPopts).spin(target);

	window.onload = function(){
		$('#foo').fadeOut(200);
	}
	
	jQuery( document ).ready(function() {
		$('#foo').fadeOut(200);
	});
</script>
<link rel="stylesheet" href="/front/nongshim/css/idangerous.swiper.css">
<link rel="stylesheet" type="text/css" href="/front/bbs/css/list.css" />
<script type="text/javascript" src="/front/nongshim/js/idangerous.swiper.min.js"></script>
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script>
<style>
.apply_exp{
	color : #9BC10D;
}
.swiper-pagination-switch {
	 display: inline-block;
	  width: 8px;
	  height: 8px;
	  border-radius: 8px;
	  background: #aaa;
	  margin-right: 8px;
	  cursor: pointer;
	  -webkit-transition: 300ms;
	  -moz-transition: 300ms;
	  -ms-transition: 300ms;
	  -o-transition: 300ms;
	  transition: 300ms;
	  opacity: 0;
	  position: relative;
	  top: -50px;
}
.device {
  width: 100%;
  position: relative;
  height: 100%;
  background: #000; 
  opacity: 0.9;
}
.swiper-container {
  width: 98%;
  height: 100%;
  color: #fff;
  background: #222;
  text-align: center;
}
.swiper-slide {
  height: 100%;
  opacity: 0.4;
  -webkit-transition: 300ms;
  -moz-transition: 300ms;
  -ms-transition: 300ms;
  -o-transition: 300ms;
  transition: 300ms;
  -webkit-transform: scale(0);
  -moz-transform: scale(0);
  -ms-transform: scale(0);
  -o-transform: scale(0);
  transform: scale(0);
  display: none;
}
.swiper-slide-visible {
  opacity: 0.5;
  -webkit-transform: scale(0.8);
  -moz-transform: scale(0.8);
  -ms-transform: scale(0.8);
  -o-transform: scale(0.8);
  transform: scale(0.8);
}
.swiper-slide-active {
  top: 0;
  opacity: 1;
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transform: scale(1);
}

.swiper-slide  img{
  width: 100%;
  height: 100%;
}

.pagination {
  position: absolute;
  z-index: 20;
  left: 0px;
  width: 100%;
  text-align: center;
  bottom: 5px;
}



.swiper-visible-switch {
  opacity: 1;
  top: 0;
  background: #aaa;
}

.swiper-active-switch {
  background: #fff;
}
</style>
<style type="text/css">
.taste{
	text-align: center; 
	position:fixed; 
	top: 0px; 
	right:0px; 
	bottom:0px;
	filter: alpha(opacity=60); 
	background-color: #000000;
   	z-index: 10000; 
   	left: 0px; 
   	display:none;
   	opacity:0.7; 
   	-moz-opacity:0.7;
}
.tasteflow{
	text-align: right; 
	position:fixed; 
	top: 12%; 
	bottom:0px;
	display: none;z-index:10000;
	background: url("/front/bbs/images/tasteflow-month8_1.png") no-repeat;
	background-size:100%;
	left:5%;
	width: 90%;
}
.coupon{
	text-align: center; 
	position:fixed; 
	top: 0px; 
	right:0px; 
	bottom:0px;
	filter: alpha(opacity=60); 
	background-color: #000000;
   	z-index: 10000; 
   	left: 0px; 
    display:none; 
   	opacity:0.7; 
   	-moz-opacity:0.7;
}
.message{
	position:fixed; 
	top: 200px; 
 	display: none;  
	z-index:100000;
	background: #fff;
	left:15%;
	width:70%;
	-moz-border-radius: 5px;      /* Gecko browsers */
    -webkit-border-radius: 5px;   /* Webkit browsers */
    border-radius:5px;            /* W3C syntax */
}
.tastebutton{
	position: absolute;
	top:47%;
	left: 44%;
  	filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity: 0; opacity: 0;   
}

</style>
<script type="text/javascript">
var scrollTop;
var pageCurr=1;
//-- Common Page usage Counting

function operation(obj,id,flg,bbsId,bbsType,shopId){
	
	var objDiv = $("#"+id+""); 
 	if($("#"+id+"").css("display")=="block"){
 		$("#"+id+"").css("display","none");
 	}else{
		$("#"+id+"").css("display","block");
		if($(obj).position().left<1000){
			$(objDiv).css("left", $(obj).offset().left-182); 
		}
		$(objDiv).css("top", $(obj).offset().top-11); 
 	}
	$("#bbsId").val(bbsId);
	$("#bbsType").val(bbsType);
	$("#shopId").val(shopId);
	$("#bbsParentId").val('0');
	var param={bbsId:bbsId,bbsType:bbsType,shopId:shopId};
   	$.ajax({
   		data : param,
   		dataType : "json",
   		type : "GET",
   		cache : false,
   		url : "/front/nongshim/newsfeed/getBbsLikeShareCount.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
   		success : function(data){
   			if(data.LIKE_CNT==null||data.LIKE_CNT==0){
   				$("#span_zan").html("좋아요");
   			}else{
   				if(data.LIKE_CNT==1){
   					$("#span_zan").html("취소");
   				}else{
   					$("#span_zan").html("좋아요");
   				}
   			}
   		},error:function(data){
   			//alert('error');
   		}
   	});
}

function closeOpera(){
	$("#operation").css("display","none");
}

function zan(){
	if('${loginFlag}'=='0'){
		fn_followLayerBbsShow();
		return;
	}else{
		var bbsId=$("#bbsId").val();
		var param={
				bbsId:$("#bbsId").val()
				,bbsType:$("#bbsType").val()
				,shopId:$("#shopId").val()
				,bbsParentId:$("#bbsParentId").val()
		};
	   	$.ajax({
	   		data : param,
	   		dataType : "json",
	   		type : "GET",
	   		cache : false,
	   		url : "/front/nongshim/newsfeed/bbsLikeShareInsert.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	   		success : function(data){
	   			//获取点赞数量和回复数量
	   			$.ajax({
				   		data : param,
				   		dataType : "json",
				   		type : "GET",
				   		cache : false,
				   		url : "/front/bbs/bbsDetail.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				   		success : function(data){
				   			
				   			if($("#span_zan").html()=="좋아요"){
				   				var html='';
				   				if(data.LIKE_TOTAL>1){
				   					$("#span"+bbsId).html(data.LIKE_TOTAL);
				   				}else if(data.LIKE_TOTAL==1){
				   					if(data.REPLY_COUNT==0){
				   						html+='<div class="arrow-up" id="arrow-up'+data.BBS_ID+'"></div>';
				   						$("#list"+bbsId).prepend(html) ;
				   					}
				   					$("#reply-item"+bbsId).remove();
				   					
				   					$("#zan_underline"+bbsId).remove();
				   						if($("#items"+bbsId).val()==undefined){
				   							html+='<ul id="items'+bbsId+'">';
				   						}
				   						
				   						html+='<li>';
				   						html+='	<div class="reply-item" id="reply-item'+data.BBS_ID+'"> ';
				   						html+='		<img src="/front/bbs/images/like.png" width="15px" style="padding-top: 6px;padding-left: 4px;"/>&nbsp;';
				   						html+='		<span id="span'+data.BBS_ID+'" style="color:#A3C43A;">'+data.LIKE_TOTAL+'</span>';
				   						html+='		<span style="color:#A3C43A;">人赞过  </span>';
				   						html+='	</div>';
				   						html+='</li>';
				   						if($("#items"+bbsId).val()==undefined){
				   							html+='</ul>';
				   						}
				   						if(data.REPLY_COUNT>0){
					   						html+='<div class="zan_underline" id="zan_underline'+bbsId+'"></div>';
					   					}
				   					$("#items"+bbsId).prepend(html) ;
				   					if($("#items"+bbsId).val()==undefined){
				   						$("#re-list"+bbsId).append(html) ;
				   					}
				   				}
				   				
				   				//取消发送优惠券
				   				return false;
					   			$.ajax({
				   			   		data : param,
				   			   		dataType : "json",
				   			   		type : "GET",
				   			   		cache : false,
				   			   		url : "/front/bbs/couponPublish.htm", //
				   			   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				   			   		success : function(data){
				   			   			
				   			   			if(data.result=='S'){
				   			   				$("#coupon").css("display","block");
				   			   				$(".message").css("display","block");
				   			   			}else{
				   			   			}
				   			   		},error : function(a, msg, c){
				   						
				   						alert("error: " + msg);
				   					}
				   			   	});
				   			}else{//取消
				   				if(data.LIKE_TOTAL==0){
				   					$("#reply-item"+bbsId).remove();
				   					$("#zan_underline"+bbsId).remove();
				   					if(data.REPLY_COUNT==0){
				   						$("#arrow-up"+bbsId).remove();
				   						$("#items"+bbsId).remove();
				   						$("#re-list"+bbsId).html('');
				   					}
				   				}else if(data.LIKE_TOTAL>0){
				   					$("#span"+bbsId).html(data.LIKE_TOTAL);
				   				}
				   			}
				   		}
				   	});
	   			
	   			
	   			
//	   			if($("#span_zan").html()=="取消"){
//	   				$("#span_zan").html("赞");
//	   			}else{
//	   				
//	   				$("#span_zan").html("取消");

//	   			}
	   			
	   			
	   			
	   		}
	   	});
	}
	
	
}

function changeButtonSpec(value){
	if(value.length>0){
		$("#send").css("background","#A3C43A");
		$("#send").css("color","#fff");
	}else{
		$("#send").css("background","#D6D4D5");
		$("#send").css("color","#000");
	}
}


function deleteReview(bbsId,shopId){
	if(window.confirm("确定删除么?")){
		var param={
				bbsId:bbsId
				,shopId:shopId
		};
	   	$.ajax({
	   		data : param,
	   		dataType : "json",
	   		type : "GET",
	   		cache : false,
	   		url : "/front/bbs/deleteReview.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	   		success : function(data){
	   			alert("删除成功!");
	   			window.location.reload();
	   		},error:function(e){
	   			alert(e.responseText);
	   		}
	   	});
	}else{
		return;
	}
	
}

function taste(flg){
	if(flg=='1'){
		$("#taste").css("display","block");
		$("#tasteflow").css("display","block");
	}else{
		$("#taste").css("display","none");
		$("#tasteflow").css("display","none");
	}
}

function toshare(flg){
	if('${loginFlag}'=='0'){
		fn_followLayerBbsShow();
		return;
	}else{
		if(flg=='1'){
			$("#share").css("display","block");
		}else{
			$("#share").css("display","none");
		}
	}
}

function closeTip(){
	$("#coupon").css("display","none");
	$(".message").css("display","none");
}

$(function(){
	pageCurr = '${pageCurr}';
	//indexErr();
	
	referrer();
	
	$("#send").click(function(){
		
		var reg=$("#send").css("color");
		if(reg=="rgb(255, 255, 255)"){
			var bbsId=$("#bbsId").val();
			
	 		var param={
	 				bbsParentId:$("#bbsId").val()
	 				,bbsType:$("#bbsType").val()
	 				,shopId:$("#shopId").val()
	 				,body:encodeURI($.trim($("#comment").val()))
	 		};
	 	   	$.ajax({
	 	   		data : param,
	 	   		dataType : "json",
	 	   		type : "GET",
	 	   		cache : false,
	 	   		url : "/front/nongshim/newsfeed/bbsContentInsert.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
	 	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	 	   		success : function(data){
	 	   			
	 	   			if(data.status=='S'){
	 	   				
	 	   			//获取点赞数量和回复数量
		 	   			var param={
								bbsId:$("#bbsId").val()
								,bbsType:$("#bbsType").val()
								,shopId:$("#shopId").val()
								,bbsParentId:$("#bbsParentId").val()
						};
	 	      			$.ajax({
	 	   			   		data : param,
	 	   			   		dataType : "json",
	 	   			   		type : "GET",
	 	   			   		cache : false,
	 	   			   		async:false,  
	 	   			   		url : "/front/bbs/bbsDetail.htm", 
	 	   			   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	 	   			   		success : function(data){
	 	   			   			var htmlTop='';
	 	   			   			if(data.LIKE_TOTAL==null&&data.REPLY_COUNT==1){
	 	   			   				htmlTop += '<div class="arrow-up"  id="arrow-up'+bbsId+'"></div>';
	 	   			   				$("#list"+bbsId).prepend(htmlTop) ;
	 	   			   			}
		 	   			   		if(data.LIKE_TOTAL>0&&data.REPLY_COUNT==1){
		 	   			   			htmlTop += '<div class="zan_underline" id="zan_underline'+bbsId+'"></div>';
		 	   			   			$('#review'+bbsId).before(htmlTop) ;
	 	   			   			}
	 	   			   		},error : function(a, msg, c) {
		 	   					alert('error: ' + a+msg+c);
		 	   				}
	 	      			});
	 	   				var html = '';
	 	   				html += '<div class="review">';
	 	   				html += '	<span style="color:#A3C43A;">&nbsp; ${nickName}: </span>';
	 	   				html += 	$("#comment").val();
	 	   				html += '</div>';
		 	   			$('#review'+bbsId).prepend(html);
	 	   				$("#comment").val('');
	 	   				window.scrollTo(0,scrollTop);
	 	   				closeReivew();
	 	   				alert('저장되었습니다.');
	 	   				
// 	 	   				alert("评论成功!");
// 		   				window.location.reload();
	 	   			   	
	 	   			}else{
		   				
	 	   			}
	 	   		}
	 	   	});
		}else{
		}
	});
});

function indexErr() {
	<c:if test="${loginFlag eq 0 }">
		fn_followLayerBbsShow();
		return;
	</c:if>
}

function referrer() {
	
	var oHash = location.hash.toLocaleLowerCase();
	if (oHash == "#rd") {
		location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf25575d804608717&redirect_uri=http%3A%2F%2Fwww.hanzhimeng.com%2Fw%2Ft.htm%3Fk%3DXKVYUYL8VLIUZU4E5UKTTBTHTHP8CNVC%26tu%3D%252Ffront%252Fbbs%252Flist.htm%253FshopId%253D12%2526bbsType%253D4&response_type=code&scope=snsapi_base&state=a#wechat_redirect";
	}
}

function fn_followLayerBbsShow() {
	
// 	$('#container').addClass('on layerZindex');
// 	$('.followLayerPopupBbs').show();
}

function fn_followLayerBbsHide() {
// 	$('#container').removeClass('on layerZindex');
// 	$('.followLayerPopupBbs').hide();
}

function userReview(){
	if('${loginFlag}'=='0'){
		fn_followLayerBbsShow();
		return;
	}else{
		scrollTop=document.body.scrollTop;
		window.scrollTo(0,$("#container").height()); 
		$(".bottom_to_top").css("bottom","90px");
		$(".comment").css("bottom","245px");
		$(".comment").css("display","block");
		$(".comment_input").focus();
	}
}

function closeReivew(){
	$(".bottom_to_top").css("bottom","50px");
	$(".comment").css("display","none");
	window.scrollTo(0,scrollTop);
// 	$(".comment_input").val('');
}

function toMyPage(){
	window.location.href='/front/customer/myPage.htm?shopId=${sessionScope.sessionSkin.shopId}';
}
function toPublishPage(){
	if('${loginFlag}'=='0'){
		fn_followLayerBbsShow();
		return;
	}else{
		window.location.href='/front/bbs/recruitOrder.htm?shopId=${sessionScope.sessionSkin.shopId}&bbsType=${requestScope.bbsType}';
	}
}

function toDetailPage(bbsId,shopId){
	var bbsType=$('#bbsType').val();
	history.replaceState({ pageCurr : pageCurr , bbsId : bbsId , shopId : shopId , bbsType : bbsType}, '','/front/bbs/list.htm?shopId='+shopId + '&bbsType=' + bbsType+ '&pageCurr=' + pageCurr);
	location.href='/front/bbs/detail.htm?bbsId='+bbsId+'&shopId='+shopId;
}

if (history.pushState) {
	var likeTotal = 0;
	var replyTotal = 0;
	var html='';
    window.addEventListener("popstate", function(event) {
       console.log('=====popstate====='); 
       var state = event.state;
       if(!!state){
//     	   alert('ajax从新获取状态=' + state.bbsId+"===shopId"+state.shopId);
    	   var bbsId = state.bbsId;
    	   var shopId = state.shopId;
    	   $('#list'+bbsId).html('');
    	   var params={
				bbsId : bbsId  
				,shopId : shopId
    	   }
    	   $.ajax({
    	   		data : params,
    	   		dataType : "json",
    	   		type : "GET",
    	   		cache : false,
    	   		async: false ,
    	   		url : "/front/nongshim/newsfeed/getAjaxLikeList.htm", 
    	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
    	   		success : function(data){
    	   			if(data!=null){
    	   				likeTotal = data.LIKE_TOTAL;
    	   				replyTotal = data.REPLY_COUNT;
    	   				if(data.LIKE_TOTAL>0||data.REPLY_COUNT>0){
    	   					html += '<div class="arrow-up"  id="arrow-up'+bbsId+'"></div>';
    	   					html += '<div class="reply-contentes-list" id="re-list'+bbsId+'">';
    	   					html += '	<ul id="items'+bbsId+'">';
    	   				}
    	   				if(data.LIKE_TOTAL>0){
	    	   				
	   						html += '<li>';
	   						html += '	<div class="replay-item" id="reply-item'+data.BBS_ID+'"> ';
	   						html += '		<img src="/front/bbs/images/like.png" width="15px" style="padding-top: 4px;padding-left: 4px;"/>&nbsp;';
	   						html += '		<span id="span'+data.BBS_ID+'" style="color:#A3C43A;">'+data.LIKE_TOTAL+'</span>';
	   						html += '		<span style="color:#A3C43A;">人赞过  </span>';
	   						html += '	</div>';
	   						html += '</li>';
							
    	   				}
    	   				
    	   				
    	   				if(data.LIKE_TOTAL>0&&data.REPLY_COUNT>0){
	   						html+='<div class="zan_underline" id="zan_underline'+bbsId+'"></div>';
	   					}
    	   				if(data.LIKE_TOTAL>0||data.REPLY_COUNT>0){
    	   					html += '	</ul>';
    	   					html += '</div>';
    	   				}
	   					$("#list"+bbsId).prepend(html) ;
    	   			}
    	   		},error:function(e){
    	   			alert('error');
    	   		}
    	   	});    
    	   if(replyTotal>0){
    		   $.ajax({
	   	   	   		data : params,
	   	   	   		dataType : "json",
	   	   	   		type : "GET",
	   	   	   		cache : false,
	   	   	   		async: false ,
	   	   	   		url : "/front/nongshim/newsfeed/getAjaxReplyList.htm", 
	   	   	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	   	   	   		success : function(data){
	   		   	   		if(data.list.length!=0){
	   		   	   			html ='';
	   		   	   			html += ' <div id="review'+bbsId+'"> ';
	   		   	   			html += ' 	<li>';
	   			   	   		for(var i=0;i<data.list.length;i++){
	   			   	   			html += '<div class="reply-item">'+
	   			   	   					'<span>'+data.list[i].CREATE_USER+': </span>';
								if(data.list[i].BODY.length>100){
									html += data.list[i].BODY.substr(0,96)+'...';
								}else{
									html += data.list[i].BODY;
								}
								html += '</div>';
	   			   	   		}
	   			   	  		html += ' 	</li>';
	   			   	 		html += ' </div> ';
	   		   	   		}
	   		   	  		$("#items"+bbsId).append(html) ;
	   	   	   		},error:function(data){
	   	   	   			alert('error');
	   	   	   		}
      	   	   });   
    	   }
       }
    });
}


$(function(){
	//当前显示到第几页
// 	var pageCurr=1;
	$(window).scroll(function () {
	   var scrollTop = $(this).scrollTop();
	   var scrollHeight = $(document).height();
	   var windowHeight = $(this).height();
	   var pageCount=$("#pageCount").val();
	   if (scrollTop + windowHeight == scrollHeight) {
	   pageCurr = parseInt(pageCurr) + 1;
	   if(pageCurr > pageCount){
	   		pageCurr = pageCount;
	   		return;
	   }
	   	
	   	$('#foo').fadeIn(200);
	   	var param={pageCurr:pageCurr,pageUnit:5,shopId:'${requestScope.shopId}',bbsType:'${requestScope.bbsType}'};
	   	$.ajax({
	   		data : param,
	   		dataType : "json",
	   		type : "GET",
	   		cache : false,
	   		url : "/front/bbs/getNextPage.htm", 
	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	   		success : function(data){
	   			if(data.list.length!=0){
	   				$.ajax({
				   		data : param,
				   		dataType : "json",
				   		type : "GET",
				   		cache : false,
				   		url : "/front/bbs/getNextPageReply.htm", //
				   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				   		success : function(reply){
				   			var html='';
				   			for(var i=0;i<data.list.length;i++){
				   				html+='<div class="main-item clearfix" style="">';
				   				html+='	<div class="headicon">';
				   				html+='		<img src="'+data.list[i].WX_IF_HEADIMGURL+'" width="100%" >';
				   				html+='	</div>';
				   				html+='	<div class="upload-content-warp">';
				   				html+='		<div class="upload-content">';
				   				
				   				html+='			<div class="upload-date" onclick="toDetailPage(\''+data.list[i].BBS_ID+'\',\''+data.list[i].SHOP_ID+'\')">';
				   				html+=				data.list[i].CREATE_USER;
				   				html+='			</div>';
				   				
				   				html+='			<div class="upload-title"  onclick="toDetailPage(\''+data.list[i].BBS_ID+'\',\''+data.list[i].SHOP_ID+'\')">';
				   				html+=				data.list[i].BODY;
				   				html+='			</div>';
				   				if(data.list[i].IMG_COUNT>0){
				   					html+='			<div class="upload-images clearfix" onclick="toDetailPage(\''+data.list[i].BBS_ID+'\',\''+data.list[i].SHOP_ID+'\')">';
				   				}
				   				
				   				if(data.list[i].IMG_COUNT==1){
				   					if(data.list[i].IMG1!=null){
				   						html+='<img src="'+data.list[i].IMG1+'" onclick="imageBlowUp(\''+data.list[i].IMG1+'\',\'\',\'\',\'\',\'\')" ';
				   						if(data.list[i].IMG1_WIDTH<data.list[i].IMG1_HEIGHT){
				   							html+='style="width:45%;max-height:260px;max-width:150px;" >';
				   						}else{
				   							html+='style="width:100%;max-height:260px;max-width:150px;" >';
				   						}
				   					}else if(data.list[i].IMG2!=null){
				   						html+='<img src="'+data.list[i].IMG2+'" onclick="imageBlowUp(\'\',\''+data.list[i].IMG2+'\',\'\',\'\',\'\')" ';
				   						if(data.list[i].IMG2_WIDTH<data.list[i].IMG2_HEIGHT){
				   							html+='style="width:45%;max-height:260px;max-width:150px;" >';
				   						}else{
				   							html+='style="width:100%;max-height:260px;max-width:150px;" >';
				   						}
				   					}else if(data.list[i].IMG3!=null){
				   						html+='<img src="'+data.list[i].IMG3+'" onclick="imageBlowUp(\'\',\'\',\''+data.list[i].IMG3+'\',\'\',\'\')" ';
				   						if(data.list[i].IMG3_WIDTH<data.list[i].IMG3_HEIGHT){
				   							html+='style="width:45%;max-height:260px;max-width:150px;" >';
				   						}else{
				   							html+='style="width:100%;max-height:260px;max-width:150px;" >';
				   						}
				   					}else if(data.list[i].IMG4!=null){
				   						html+='<img src="'+data.list[i].IMG4+'" onclick="imageBlowUp(\'\',\'\',\'\',\''+data.list[i].IMG4+'\',\'\')"  ';
				   						if(data.list[i].IMG4_WIDTH<data.list[i].IMG4_HEIGHT){
				   							html+='style="width:45%;max-height:260px;max-width:150px;" >';
				   						}else{
				   							html+='style="width:100%;max-height:260px;max-width:150px;" >';
				   						}
				   					}else if(data.list[i].IMG5!=null){
				   						html+='<img src="'+data.list[i].IMG5+'" onclick="imageBlowUp(\'\',\'\',\'\',\'\',\''+data.list[i].IMG5+'\')"  ';
				   						if(data.list[i].IMG5_WIDTH<data.list[i].IMG5_HEIGHT){
				   							html+='style="width:45%;max-height:260px;max-width:150px;" >';
				   						}else{
				   							html+='style="width:100%;max-height:260px;max-width:150px;" >';
				   						}
				   					}
				   				}else{
				   					if(data.list[i].IMG1!=null){
					   					html+='			<div class="upload-img-item">';
					   					html+='				<img class="upload-img" src="'+data.list[i].IMG1+'"  onclick="imageBlowUp(\''+data.list[i].IMG1+'\',\''+data.list[i].IMG2+'\',\''+data.list[i].IMG3+'\',\''+data.list[i].IMG4+'\',\''+data.list[i].IMG5+'\')" ';
					   					if(data.list[i].IMG1_WIDTH>data.list[i].IMG1_HEIGHT){
					   						html+=' style="height:100%;" >';
					   					}else if(data.list[i].IMG1_WIDTH<data.list[i].IMG1_HEIGHT){
					   						html+=' style="width:100%;" >';
					   					}else{
					   						html+=' style="width:100%;height:100%;" >';
					   					}
					   					html+='			</div>';
					   				}
					   				if(data.list[i].IMG2!=null){
					   					html+='			<div class="upload-img-item">';
						   				html+='				<img class="upload-img" src="'+data.list[i].IMG2+'"  onclick="imageBlowUp(\''+data.list[i].IMG1+'\',\''+data.list[i].IMG2+'\',\''+data.list[i].IMG3+'\',\''+data.list[i].IMG4+'\',\''+data.list[i].IMG5+'\')" ';
						   				if(data.list[i].IMG2_WIDTH>data.list[i].IMG2_HEIGHT){
					   						html+=' style="height:100%;" >';
					   					}else if(data.list[i].IMG2_WIDTH<data.list[i].IMG2_HEIGHT){
					   						html+=' style="width:100%;" >';
					   					}else{
					   						html+=' style="width:100%;height:100%;" >';
					   					}
						   				html+='			</div>';
					   				}
					   				if(data.list[i].IMG3!=null){
					   					html+='			<div class="upload-img-item">';
						   				html+='				<img class="upload-img" src="'+data.list[i].IMG3+'"  onclick="imageBlowUp(\''+data.list[i].IMG1+'\',\''+data.list[i].IMG2+'\',\''+data.list[i].IMG3+'\',\''+data.list[i].IMG4+'\',\''+data.list[i].IMG5+'\')" ';
						   				if(data.list[i].IMG3_WIDTH>data.list[i].IMG3_HEIGHT){
					   						html+=' style="height:100%;" >';
					   					}else if(data.list[i].IMG3_WIDTH<data.list[i].IMG3_HEIGHT){
					   						html+=' style="width:100%;" >';
					   					}else{
					   						html+=' style="width:100%;height:100%;" >';
					   					}
						   				html+='			</div>';
					   				}
					   				if(data.list[i].IMG4!=null){
					   					html+='			<div class="upload-img-item">';
						   				html+='				<img class="upload-img" src="'+data.list[i].IMG4+'"  onclick="imageBlowUp(\''+data.list[i].IMG1+'\',\''+data.list[i].IMG2+'\',\''+data.list[i].IMG3+'\',\''+data.list[i].IMG4+'\',\''+data.list[i].IMG5+'\')" ';
						   				if(data.list[i].IMG4_WIDTH>data.list[i].IMG4_HEIGHT){
					   						html+=' style="height:100%;" >';
					   					}else if(data.list[i].IMG4_WIDTH<data.list[i].IMG4_HEIGHT){
					   						html+=' style="width:100%;" >';
					   					}else{
					   						html+=' style="width:100%;height:100%;" >';
					   					}
						   				html+='			</div>';
					   				}
					   				if(data.list[i].IMG5!=null){
					   					html+='			<div class="upload-img-item">';
						   				html+='				<img class="upload-img" src="'+data.list[i].IMG5+'"  onclick="imageBlowUp(\''+data.list[i].IMG1+'\',\''+data.list[i].IMG2+'\',\''+data.list[i].IMG3+'\',\''+data.list[i].IMG4+'\',\''+data.list[i].IMG5+'\')" ';
						   				if(data.list[i].IMG5_WIDTH>data.list[i].IMG5_HEIGHT){
					   						html+=' style="height:100%;" >';
					   					}else if(data.list[i].IMG5_WIDTH<data.list[i].IMG5_HEIGHT){
					   						html+=' style="width:100%;" >';
					   					}else{
					   						html+=' style="width:100%;height:100%;" >';
					   					}
						   				html+='			</div>';
					   				}
				   				}
				   				if(data.list[i].IMG_COUNT>0){
				   					html+='			</div>';//end image
				   				}
				   				
				   				html+='			<div class="reply-top clearfix">';
				   				html+='				<div class="reply-date">';
				   				html+='					<span>'+data.list[i].PUB_HOURS+'</span>&nbsp;';
				   				if('${custSysId}'==data.list[i].CREATE_ID){
				   					html+='				<span class="apply_exp" onclick="deleteReview(\''+data.list[i].BBS_ID+'\',\''+data.list[i].SHOP_ID+'\')">删除</span>';	
				   				}
				   				html+='				</div>';
				   				html+='				<div class="reply-share">'; 
				   				html+='					<img src="/front/bbs/images/review.png" onclick="operation(this,\'operation\',\'1\',\''+data.list[i].BBS_ID+'\',\''+data.list[i].BBS_TYPE+'\',\''+data.list[i].SHOP_ID+'\');">';
				   				html+='				</div>';
				   				html+='			</div>';//end reply
				   				html+='			<div class="reply-contentes" id="list'+data.list[i].BBS_ID +'">';
				   				if(data.list[i].REPLY_COUNT!=0||data.list[i].LIKE_TOTAL!=0){
				   					html+='			<div class="arrow-up" id="arrow-up'+data.list[i].BBS_ID +'"></div>   ';
				   				}
				   				html+='				<div class="reply-contentes-list" id="re-list'+data.list[i].BBS_ID +'">';
				   				html+='					<ul id="items'+data.list[i].BBS_ID +'"><li></li>';
				   				if(data.list[i].LIKE_TOTAL>0){
				   					html+='	   				<li>';
				   					html+='						<div class="reply-item" id="reply-item'+data.list[i].BBS_ID +'">';
				   					html+='							<img src="/front/bbs/images/like.png" width="15px" style="padding-top: 6px;padding-left: 4px;"/>&nbsp;';
				   					html+='							<span id="span'+data.list[i].BBS_ID +'" style="color:#A3C43A;">'+data.list[i].LIKE_TOTAL+'</span>';
				   					html+='							<span style="color:#A3C43A;">人赞过</span>';		
				   					html+='						</div>';
				   					html+='					</li>';
				   				}
				   				if(data.list[i].REPLY_COUNT>0&&data.list[i].LIKE_TOTAL>0){
				   					html+='					<div class="zan_underline" id="zan_underline'+data.list[i].BBS_ID +'"></div>';
				   					
				   				}
				   				html+='					<div id="review'+data.list[i].BBS_ID +'">';
				   				for(var j=0;j<reply.list.length;j++){
				   					if(data.list[i].BBS_ID==reply.list[j].BBS_PARENT_ID){
				   						html+='					<li>';
				   						html+='						<div class="reply-item"><span>'+reply.list[j].CREATE_USER+':</span>';
				   						html+=							reply.list[j].BODY;
				   						html+='						</div>';
				   						html+='					</li>';
				   					}
				   				}
				   				html+='						</div>';
				   				html+='					</ul>';
				   				html+='				</div>';
				   				html+='			</div>';//end reply content
				   				html+='<div class="main-item-underline"></div>';
				   				html+='		</div>';
				   				html+='	</div>';
				   				
				   				html+='</div>';
				   			}
				   			$(".list_main_image").append(html);
				   		}
	   				});
	   			}
	   			
	   			
				$('#foo').fadeOut(200);
	   		},
	   		error : function(a, msg, c) {
				$('#foo').fadeOut(200);
	   			alert("error: " + msg);
	   		}
	   	});
	   }
	});
});

var mySwiper;

function imageBlowUp(img1,img2,img3,img4,img5){
// 	$("#sliderImage1").attr("src",img1);
// 	$("#sliderImage2").attr("src",img2);
// 	$("#sliderImage3").attr("src",img3);
// 	$("#sliderImage4").attr("src",img4);
// 	$("#sliderImage5").attr("src",img5);
// // 	var htm="";
// 	if(img1!=""&&img1!=null&&img1!='null'){
// 		$("#slider1").css("display","block");
// 	}
// 	if(img2!=""&&img2!=null&&img2!='null'){
// 		$("#slider2").css("display","block");
// 	}else{
// // 		$("#slider2").remove();
// 	}
// 	if(img3!=""&&img3!=null&&img3!='null'){
// 		$("#slider3").css("display","block");
// 	}else{
// // 		$("#slider3").remove();
// 	}
// 	if(img4!=""&&img4!=null&&img4!='null'){
// 		$("#slider4").css("display","block");
// 	}else{
// // 		$("#slider4").remove();
// 	}
// 	if(img5!=""&&img5!=null&&img5!='null'){
// 		$("#slider5").css("display","block");
// 	}else{
// // 		$("#slider5").remove();
// 	}
// 	$(".device").bPopup({
// 		modalColor : "#000",
// 		opacity : 0.85,
// 		height:100,
// 		modalClose : false, //弹出深色层，true:关闭的响应 false:无     	   
// 		speed : 650, //下降弹出样式
// 		onOpen:function(){
// 			 $(".device").css("display","block");
// 	 		 $("body").css("overflow","hidden");
// 			 mySwiper = new Swiper('.swiper-container',{
// 			    pagination: '.pagination',
// 			    onSlideChangeEnd: function(swiper){
// // 		        	startAni(swiper.activeIndex);
// 		       	}
// 			 });
// 		}
// 	});
	
}
function closeBlowUp(){
// 	$(".device").bPopup().close();
// 	mySwiper.swipeTo(0,1000,false);
// 	$("#slider1").css("display","none");
// 	$("#slider2").css("display","none");
// 	$("#slider3").css("display","none");
// 	$("#slider4").css("display","none");
// 	$("#slider5").css("display","none");
// // 	$("#slider1").remove();
// // 	$("#slider2").remove();
// // 	$("#slider3").remove();
// // 	$("#slider4").remove();
// // 	$("#slider5").remove();
// 	$("body").css("overflow-y","auto");
// // 	var html='';
// // 	html+='<div class="swiper-slide" id="slider1" onclick="closeBlowUp()" style="display: none;">';
// // 	html+='	<img alt="" src=""  id="sliderImage1" onclick="closeBlowUp()"/>';
// // 	html+='</div>';
// // 	html+='<div class="swiper-slide" id="slider2" onclick="closeBlowUp()" style="display: none;">';
// // 	html+='	<img alt="" src=""  id="sliderImage2" onclick="closeBlowUp()"/>';
// // 	html+='</div>';
// // 	html+='<div class="swiper-slide" id="slider3" onclick="closeBlowUp()" style="display: none;">';
// // 	html+='	<img alt="" src=""  id="sliderImage3" onclick="closeBlowUp()"/>';
// // 	html+='</div>';
// // 	html+='<div class="swiper-slide" id="slider4" onclick="closeBlowUp()" style="display: none;">';
// // 	html+='	<img alt="" src=""  id="sliderImage4" onclick="closeBlowUp()"/>';
// // 	html+='</div>';
// // 	html+='<div class="swiper-slide" id="slider5" onclick="closeBlowUp()" style="display: none;">';
// // 	html+='	<img alt="" src=""  id="sliderImage5" onclick="closeBlowUp()"/>';
// // 	html+='</div>';
// // 	$(".swiper-wrapper").append(html);
}

</script>
</head>
<body>
<input type="hidden" id="pageCount" value="${requestScope.pageCount }">
<!-- content start -->
	<div id="container">
	    <div class="list-top-title-img">
		    <table style="width: 100%;">
	    		<tr>
	    			<td colspan="2" class="split-line" width="100%">
	    				<img class="list-title-img1" src="/front/bbs/images/main.jpg" onclick="taste('1')" alt="" width="100%;" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td valign="top">
	    				<img alt="" src="/front/bbs/images/xuanyan.png" alt="" height="22px">
	    			</td>
	    			<td align="right" valign="bottom" onclick="toshare('1')">
<!-- 	    				<img alt="" src="/front/bbs/images/share.png" style="width: 15px;padding-top: 3px;"> -->
<!-- 	    				<span style="color: #ff4500;font-size: 14px;">分享给好友</span> -->
	    			</td>
	    		</tr>
	    	</table>
	    </div>
	    <div class="list_main_image" >
	    <!--  main-item start  -->
	    <c:forEach items="${publishList }" var="list" varStatus="status">
		 	<div class="main-item clearfix">
		 		<div class="headicon">
		 			 <img src="${list.WX_IF_HEADIMGURL }" width="100%" >
		 		</div>
		 		<div class="upload-content-warp">
			 		<div class="upload-content">
			 		    <div class="upload-date" onclick="toDetailPage('${list.BBS_ID}','${list.SHOP_ID }')">
			 		    	${list.CREATE_USER }
				 	    </div>
				 	    <div class="upload-title" onclick="toDetailPage('${list.BBS_ID}','${list.SHOP_ID }')">
			 		        ${list.BODY }
				 	    </div>
				 	    <c:if test="${list.IMG_COUNT>0 }">
				 		    <div class="upload-images clearfix"  onclick="toDetailPage('${list.BBS_ID}','${list.SHOP_ID }')">
				 		        <c:choose>
				 		    		<c:when test="${list.IMG_COUNT==1 }">
				 		    			<c:if test="${list.IMG1!=null }">
				 		    				<img src="${list.IMG1}" 
				 		    					 <c:if test="${list.IMG1_WIDTH<list.IMG1_HEIGHT}">style="width:45%;max-height:260px;max-width:150px;"</c:if><c:if test="${list.IMG1_WIDTH>=list.IMG1_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
				 		    					 onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" >
				 		    			</c:if>
				 		    			<c:if test="${list.IMG2!=null }">
				 		    				<img src="${list.IMG2}" 
				 		    					 <c:if test="${list.IMG2_WIDTH<list.IMG2_HEIGHT}">style="width:45%;max-height:260px;max-width:150px;"</c:if><c:if test="${list.IMG2_WIDTH>=list.IMG2_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
				 		    					 onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" >
				 		    			</c:if>
				 		    			<c:if test="${list.IMG3!=null }">
				 		    				<img src="${list.IMG3}" 
				 		    					 <c:if test="${list.IMG3_WIDTH<list.IMG3_HEIGHT}">style="width:45%;max-height:260px;max-width:150px;"</c:if><c:if test="${list.IMG3_WIDTH>=list.IMG3_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
				 		    					 onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" >
				 		    			</c:if>
				 		    			<c:if test="${list.IMG4!=null }">
				 		    				<img src="${list.IMG4}" 
				 		    					 <c:if test="${list.IMG4_WIDTH<list.IMG4_HEIGHT}">style="width:45%;max-height:260px;max-width:150px;"</c:if><c:if test="${list.IMG4_WIDTH>=list.IMG4_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
				 		    					 onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" >
				 		    			</c:if>
				 		    			<c:if test="${list.IMG5!=null }">
				 		    				<img src="${list.IMG5}" 
				 		    					 <c:if test="${list.IMG5_WIDTH<list.IMG5_HEIGHT}">style="width:45%;max-height:260px;max-width:150px;"</c:if><c:if test="${list.IMG5_WIDTH>=list.IMG5_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
				 		    					 onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" >
				 		    			</c:if>
				 		    		</c:when>
				 		    		<c:otherwise>
					 		    		<c:if test="${list.IMG1!=null }">
						 		    		<div  class="upload-img-item">
						 		         		<img class="upload-img" src="${list.IMG1}" 
						 		         			onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" 
						 		         			<c:if test="${list.IMG1_WIDTH>list.IMG1_HEIGHT}">style="height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG1_WIDTH<list.IMG1_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG1_WIDTH==list.IMG1_HEIGHT}">style="width:100%;height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         		>
						 		         	</div>
						 		    	</c:if>
						 		        <c:if test="${list.IMG2!=null }">
						 		    		<div  class="upload-img-item">
						 		         		<img class="upload-img" src="${list.IMG2 }" 
						 		         			onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" 
						 		         			<c:if test="${list.IMG2_WIDTH>list.IMG2_HEIGHT}">style="height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG2_WIDTH<list.IMG2_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG2_WIDTH==list.IMG2_HEIGHT}">style="width:100%;height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         		>
						 		         	</div>
						 		    	</c:if> 
						 		        <c:if test="${list.IMG3!=null }">
						 		    		<div  class="upload-img-item">
						 		         		<img class="upload-img" src="${list.IMG3 }" 
						 		         			onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" 
						 		         			<c:if test="${list.IMG3_WIDTH>list.IMG3_HEIGHT}">style="height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG3_WIDTH<list.IMG3_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG3_WIDTH==list.IMG3_HEIGHT}">style="width:100%;height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         		>
						 		         	</div>
						 		    	</c:if> 
						 		    	<c:if test="${list.IMG4!=null }">
						 		    		<div  class="upload-img-item">
						 		    			<img class="upload-img" src="${list.IMG4 }" 
						 		         			onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" 
						 		         			<c:if test="${list.IMG4_WIDTH>list.IMG4_HEIGHT}">style="height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG4_WIDTH<list.IMG4_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG4_WIDTH==list.IMG4_HEIGHT}">style="width:100%;height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         		>
						 		         	</div>
						 		    	</c:if> 
						 		    	<c:if test="${list.IMG5!=null }">
						 		    		<div  class="upload-img-item">
						 		    			<img class="upload-img" src="${list.IMG5 }" 
						 		         			onclick="imageBlowUp('${list.IMG1 }','${list.IMG2 }','${list.IMG3 }','${list.IMG4 }','${list.IMG5 }')" 
						 		         			<c:if test="${list.IMG5_WIDTH>list.IMG5_HEIGHT}">style="height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG5_WIDTH<list.IMG5_HEIGHT}">style="width:100%;max-height:260px;max-width:150px;"</c:if>
						 		         			<c:if test="${list.IMG5_WIDTH==list.IMG5_HEIGHT}">style="width:100%;height:100%;max-height:260px;max-width:150px;"</c:if>
						 		         		>
						 		         	</div>
						 		    	</c:if> 
				 		    		</c:otherwise>
				 		    	</c:choose>
					 	    </div>
					 	</c:if>
			 		    <div class="reply-top clearfix">
			 		        <div class="reply-date">
			 		         	<span>  ${list.PUB_HOURS }</span>&nbsp;
			 		         	<c:if test="${custSysId==list.CREATE_ID}">
   									<span class="apply_exp" onclick="deleteReview('${list.BBS_ID}','${list.SHOP_ID}')">删除</span>
   								</c:if>
			 		        </div>
			 		        <div class="reply-share">
			 		           	<img src="/front/bbs/images/review.png" onclick="operation(this,'operation','1','${list.BBS_ID}','${list.BBS_TYPE}','${list.SHOP_ID}');">
			 		        </div>
			 		     </div>
			 		    <!-- reply-contentes start -->  
					 	<div class="reply-contentes" id="list${list.BBS_ID }">
					 		<c:choose>
   								<c:when test="${list.REPLY_COUNT==0&&list.LIKE_TOTAL==0 }"></c:when>
   								<c:otherwise>
   									<div class="arrow-up" id="arrow-up${list.BBS_ID }"></div>   
   								</c:otherwise>
   							</c:choose>  
				 	 	 	<div class="reply-contentes-list" id="re-list${list.BBS_ID}">
						 	 	  	<ul id="items${list.BBS_ID }">
						 	 	  		<c:if test="${list.LIKE_TOTAL>0 }">
						 	 	  			<li>
				    							<div class="reply-item" id="reply-item${list.BBS_ID }"> 
				    								<img src="/front/bbs/images/like.png" width="15px" style="padding-top: 6px;padding-left: 4px;"/>&nbsp;
			    									<span id="span${list.BBS_ID }" style="color:#A3C43A;">${list.LIKE_TOTAL}</span>
			    									<span style="color:#A3C43A;">人赞过 </span>
			    								</div>
				    						</li>
			    						</c:if>
	    								<c:if test="${list.REPLY_COUNT>0&&list.LIKE_TOTAL>0}">
		    								<div class="zan_underline" id="zan_underline${list.BBS_ID }"></div>
		    							</c:if>
		    							<div id="review${list.BBS_ID }">
			    							<c:forEach items="${replyList }" var="reply" varStatus="status">
				    							<c:if test="${reply.BBS_PARENT_ID  eq list.BBS_ID}">
				    								<li>
								 	 	  				<div class="reply-item"><span>${reply.CREATE_USER }:</span>
					    									${reply.BODY }
					    								</div>
				    								</li>
			    								</c:if>
				    						</c:forEach>
			    						</div>
						 	 	  	</ul>
					 	 	 	</div>
				 		</div>
				 		<!-- reply-contentes end -->
		 		 	</div>
		 		 	<!-- upload-content end -->
		 		 	<div class="main-item-underline"></div>
	 			</div>
	 			<!-- upload-content-warp end -->
		 	</div>
	 	</c:forEach>
	 	 <!--  main-item end  -->
	 	 </div>
	</div>
	<a class="bottom_to_top" onclick="toPublishPage();">top</a>
<!-- content end  -->

<!-- review start -->
<div class="operation" onclick="closeOpera();" id="operation"> 
	<div>
		<div style="width: 89px;border-right: 1px solid #3C3D35;" class="child"  id="like">
			<img alt="" src="/front/skin/nongshim/img/icon_zan.png" height="15px;" style="padding-top: 6px;"  onclick="zan()" >
			<span style="color:#FFF;" id="span_zan"  onclick="zan()" >좋아요</span>
		</div>
		<div style="width: 90px;" class="child" id="message">
			<img alt="" src="/front/skin/nongshim/img/icon_review.png" height="15px;" style="padding-top: 6px;" onclick="userReview()">
			<span style="color:#FFF;" onclick="userReview()">댓글</span>
		</div>
	</div>
	<input type="hidden" id="bbsId"   value="" />
	<input type="hidden" id="bbsType" value="${bbsType }" />
	<input type="hidden" id="shopId"  value="" />
	<input type="hidden" id="bbsParentId"  value="" />
</div> 
<!-- review end -->

<!-- 评论 start -->
	<div  class="comment" style="bottom: 245px;left: 5%;width: 90%;height: 147px;border: 5px solid #D6D4D5;"> 
		<textarea id="comment" class="comment_input" oninput="changeButtonSpec(this.value);" ></textarea>
<!-- 		<input type="text" id="comment" class="comment_input" oninput="changeButtonSpec(this.value);"  /> -->
		<div id="send">등록</div>
		<div id="cancel" onclick="closeReivew()">취소</div>
	</div>
<!-- 评论  end -->

<!-- 试吃流程 start -->
<div id="taste"  class="taste" >
</div>
<div id="tasteflow" class="tasteflow" >
	<img alt="" src="/front/bbs/images/close.png"  onclick="taste('2')" width="25px" style="padding-top: 10px;margin-right: 5;filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity: 0; opacity: 0;">	
	<img alt="" src="/front/bbs/images/close.png" class="tastebutton" onclick="toPublishPage();">	
</div>
<!-- 试吃流程 end -->

<!-- 分享 start -->
<div id="share"  class="shares">
	<img alt="" src="/front/bbs/images/prompt.png" width="100%">
	<img alt="" src="/front/bbs/images/btn_iknow.png" width="50%" style="margin-top: 120px;" onclick="toshare('2');">
</div>	
<!-- 分享 end -->

<!-- 优惠券 start -->
<div id="coupon"  class="coupon">
</div>	
<div class="message">
	<div class="tip">感谢您参与【圃美多】试吃活动，您获得了圃美多商城为您准备的10元优惠券，请点开微信查看并购物吧~</div>
	<div class="button" style="border-right: 1px solid #D6D4D5;" onclick="toMyPage()">马上查看</div>
	<div class="button" onclick="closeTip()">稍后查看</div>
</div>
<!-- 优惠券 end -->

<!-- 弹出图片 start -->
<div class="device" style="display: none;">
    <div class="swiper-container">
      <div class="swiper-wrapper" onclick="closeBlowUp()">
	      <div class="swiper-slide" id="slider1" style="display: none;" onclick="closeBlowUp()">
	      		<img alt="" src=""  id="sliderImage1" onclick="closeBlowUp()"/>
	      </div>
	      <div class="swiper-slide" id="slider2" style="display: none;" onclick="closeBlowUp()">
	      		<img alt="" src=""  id="sliderImage2" onclick="closeBlowUp()"/>
	      </div>
	      <div class="swiper-slide" id="slider3" style="display: none;" onclick="closeBlowUp()">
	      		<img alt="" src=""  id="sliderImage3" onclick="closeBlowUp()"/>
	      </div>
	      <div class="swiper-slide" id="slider4" style="display: none;" onclick="closeBlowUp()">
	      		<img alt="" src=""  id="sliderImage4" onclick="closeBlowUp()"/>
	      </div>
	      <div class="swiper-slide" id="slider5" style="display: none;" onclick="closeBlowUp()">
	      		<img alt="" src=""  id="sliderImage5" onclick="closeBlowUp()"/>
	      </div>
      </div>
    </div>
    <div class="pagination"></div>
  </div>
<div style="text-align:center;clear:both;"></div>
<!-- 弹出图片  end -->
	
<br/>
<br/>
<br/>
<br/>
<br/>
<%@ include file="/front/skin/common_navigation.jsp"%>	
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

$(function(){ 
	  wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: '${signInfo.timestamp }', // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [//分享接口
		       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
		        		//界面操作
		        		,'closeWindow'				//关闭当前网页窗口接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
	  		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareTimeline({
	  		    title: '我要免费吃【圃美多】韩餐，亲们快来帮我点赞助威~', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}/front/bbs/images/bbsType${requestScope.bbsType}.png', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '圃美多', // 分享标题
	  		    desc: '我要免费吃【圃美多】韩餐，亲们快来帮我点赞助威~', // 分享描述 
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}/front/bbs/images/bbsType${requestScope.bbsType}.png', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		       // alert('success 11');
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	// alert('error 11');
	  		    }
	  		});
	  		
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

	  	});
	  
});
</script>

</body>
</html>