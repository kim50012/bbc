<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>大韩航空</title>
<%@ include file="/front/skin/common.jsp"%>
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/common.css" />
<link rel="stylesheet" type="text/css" href="/front/js/page/kkpager.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/skin.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/koreanair-css.css" />

<style type="text/css">
	#foo {width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 999000; width: 100%; height: 100%; display: none;}
	#fo {position: fixed; top: 50%; left: 50%; z-index:999999; display: '';}
</style>
<%-- 
<script type="text/javascript" src="/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/front/js/headroom.js"></script>
<script type="text/javascript" src="/front/js/jQuery.headroom.js"></script>
<script type="text/javascript" src="/front/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="/front/js/jquery.touchSlider.js"></script>
<script type="text/javascript" src="/front/js/common.js"></script>
<script type="text/javascript" src="/front/js/page/kkpager.min.js"></script>
<script type="text/javascript" src="/front/js/raty/jquery.raty.js"></script>
<script type="text/javascript" src="/front/js/spin.min.js"></script>
<script type="text/javascript" src="/front/js/bottom-menu.js"></script>
<script type="text/javascript" src="/front/js/jquery.timer.js"></script>
<script type="text/javascript" src="/front/js/koreanair-Navigation.js"></script> --%>

<script type="text/javascript"> 

//-- Common Page usage Counting
counter({
	 pageTp : 20,				//NEWSFEED_LIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '' 
});

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
	/* document.writeln("语言版本: "+browser.language); 
	document.writeln(" 是否为移动终端: "+browser.versions.mobile); 
	document.writeln(" ios终端: "+browser.versions.ios); 
	document.writeln(" android终端: "+browser.versions.android); 
	document.writeln(" 是否为iPhone: "+browser.versions.iPhone); 
	document.writeln(" 是否iPad: "+browser.versions.iPad); 
	document.writeln(navigator.userAgent);  */
</script>

<script type="text/javascript">
 var heightAll=$(window).height();
 var widthAll=$(window).width();
 var heightTop=widthAll/640*254+60+70;
 var divHeight=heightAll-heightTop;
 var heightTopImg=0.60*widthAll/387*254;
 var pageCurr=1;
 var pageCurr1=1;
 var pageCurr2=1;
 $(function(){
	 $(window).scroll(function () {
		 if($(".list-all-select").hasClass("selected")){
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
					   var param={pageCurr:pageCurr,pageUnit:10,shopId:'${requestScope.shopId}'};
					   $('#foo').fadeIn(200);
					   $.ajax({
						   data : param,
					   		dataType : "json",
					   		type : "GET",
					   		cache : false,
					   		url : "/front/newsFeed/getNextPage.htm", 
					   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
					   		success : function(data){
								$('#foo').fadeOut(200);
								if(data.list.length!=0){
									var html='';
						   			for(var i=0;i<data.list.length;i++){
						   				html+='<table onclick="location.href=\'/front/newsFeed/detail.htm?msgId='+data.list[i].MSG_ID+'&newsId='+data.list[i].NEWS_ID+'&shopId=${sessionScope.sessionSkin.shopId}\'">';
						   				html+='	<tr>';
						   				html+='		<td>';
						   				html+='			<img src="'+data.list[i].LIST_IMG_URL+'" data-news-id="'+data.list[i].NEWS_ID+'" />';	
						   				html+='		</td>';
						   				html+='		<td class="list-body-msg">';
						   				html+='			<p>';
						   				html+=				data.list[i].MTITLE;
						   				html+='			</p>';
						   				html+='			<img src="/front/skin/koreanair/img/list/ico_calendar.png" style="margin-right:3px;" alt=""/><span>'+data.list[i].NEWS_DATE+'</span><br/>';
						   				html+='			<img src="/front/skin/koreanair/img/list/icon_like.png" alt=""/>';
						   				html+='			<span>'+data.list[i].READ_CNT+'</span> ';
						   				if(data.list[i].CUST_LIKE_CNT == 0){
						   					html+='			<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate2.png" alt=""/>';
						   				}else{
						   					html+='			<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate.png" alt=""/>';
						   				}
						   				html+='			<span>'+data.list[i].LIKE_CNT+'</span> ';
						   				html+='			<div class="list-body-msg-div"> ';
						   				html+='				<img src="'+data.list[i].LIST_ICON_URL+'"/> ';
						   				html+='			</div> ';
						   				html+='		</td>';
						   				html+=' <tr>';
						   				html+='</table>';
						   			}
						   			$(".list_text_li1").append(html);
						   			var length=$(".list_text_li1").find("table").length;
						   			var obj=$(".list_text_li1").find("table").get(0);
						   			var objHeight=$(obj).css("height");
						   			var height=Number(objHeight.substring(0,objHeight.length-2))*length;
						   			$(".list_main_image").attr("style","height:"+height+"px");
						   			
								}
					   		},
					   		error : function(a, msg, c) {
								$('#foo').fadeOut(200);
					   			alert("error: " + msg);
					   		}
					   });
				}
		 }else{
			 if($(".list-skypass-select").hasClass("selected")){
					var scrollTop = $(this).scrollTop();
					var scrollHeight = $(document).height();
					var windowHeight = $(this).height();
					var pageCount=$("#pageCount1").val();
					
					if (scrollTop + windowHeight == scrollHeight) {
						   pageCurr1 = parseInt(pageCurr1) + 1;
						   if(pageCurr1 > pageCount){
						   		pageCurr1 = pageCount;
						   		return;
						   }
						   var param={pageCurr:pageCurr1,pageUnit:10,shopId:'${requestScope.shopId}',newsType:1};
						   $('#foo').fadeIn(200);
						   $.ajax({
							   data : param,
						   		dataType : "json",
						   		type : "GET",
						   		cache : false,
						   		url : "/front/newsFeed/getNextPage1.htm", 
						   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
						   		success : function(data){
									$('#foo').fadeOut(200);
									if(data.list.length!=0){
										var html='';
							   			for(var i=0;i<data.list.length;i++){
							   				html+='<table onclick="location.href=\'/front/newsFeed/detail.htm?msgId='+data.list[i].MSG_ID+'&newsId='+data.list[i].NEWS_ID+'&shopId=${sessionScope.sessionSkin.shopId}\'">';
							   				html+='	<tr>';
							   				html+='		<td>';
							   				html+='			<img src="'+data.list[i].LIST_IMG_URL+'" data-news-id="'+data.list[i].NEWS_ID+'" />';	
							   				html+='		</td>';
							   				html+='		<td class="list-body-msg">';
							   				html+='			<p>';
							   				html+=				data.list[i].MTITLE;
							   				html+='			</p>';
							   				html+='			<img src="/front/skin/koreanair/img/list/ico_calendar.png" style="margin-right:3px;" alt=""/><span>'+data.list[i].NEWS_DATE+'</span><br/>';
							   				html+='			<img src="/front/skin/koreanair/img/list/icon_like.png" alt=""/>';
							   				html+='			<span>'+data.list[i].READ_CNT+'</span> ';
							   				if(data.list[i].CUST_LIKE_CNT == 0){
							   					html+='			<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate2.png" alt=""/>';
							   				}else{
							   					html+='			<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate.png" alt=""/>';
							   				}
							   				html+='			<span>'+data.list[i].LIKE_CNT+'</span> ';
							   				html+='			<div class="list-body-msg-div"> ';
							   				html+='				<img src="'+data.list[i].LIST_ICON_URL+'"/> ';
							   				html+='			</div> ';
							   				html+='		</td>';
							   				html+=' <tr>';
							   				html+='</table>';
							   			}
							   			$(".list_text_li2").append(html);
							   			var length=$(".list_text_li2").find("table").length;
							   			var obj=$(".list_text_li2").find("table").get(0);
							   			var objHeight=$(obj).css("height");
							   			var height=Number(objHeight.substring(0,objHeight.length-2))*length;
							   			$(".list_main_image").attr("style","height:"+height+"px");
							   			
									}
						   		},
						   		error : function(a, msg, c) {
									$('#foo').fadeOut(200);
						   			alert("error: " + msg);
						   		}
						   });
					}
			 }else if($(".list-kenews-select").hasClass("selected")){
				 	var scrollTop = $(this).scrollTop();
					var scrollHeight = $(document).height();
					var windowHeight = $(this).height();
					var pageCount=$("#pageCount2").val();
					
					if (scrollTop + windowHeight == scrollHeight) {
						   pageCurr2 = parseInt(pageCurr2) + 1;
						   if(pageCurr2 > pageCount){
						   		pageCurr2 = pageCount;
						   		return;
						   }
						   var param={pageCurr:pageCurr2,pageUnit:10,shopId:'${requestScope.shopId}',newsType:2};
						   $('#foo').fadeIn(200);
						   $.ajax({
							   data : param,
						   		dataType : "json",
						   		type : "GET",
						   		cache : false,
						   		url : "/front/newsFeed/getNextPage1.htm", 
						   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
						   		success : function(data){
									$('#foo').fadeOut(200);
									if(data.list.length!=0){
										var html='';
							   			for(var i=0;i<data.list.length;i++){
							   				html+='<table onclick="location.href=\'/front/newsFeed/detail.htm?msgId='+data.list[i].MSG_ID+'&newsId='+data.list[i].NEWS_ID+'&shopId=${sessionScope.sessionSkin.shopId}\'">';
							   				html+='	<tr>';
							   				html+='		<td>';
							   				html+='			<img src="'+data.list[i].LIST_IMG_URL+'" data-news-id="'+data.list[i].NEWS_ID+'" />';	
							   				html+='		</td>';
							   				html+='		<td class="list-body-msg">';
							   				html+='			<p>';
							   				html+=				data.list[i].MTITLE;
							   				html+='			</p>';
							   				html+='			<img src="/front/skin/koreanair/img/list/ico_calendar.png" style="margin-right:3px;" alt=""/><span>'+data.list[i].NEWS_DATE+'</span><br/>';
							   				html+='			<img src="/front/skin/koreanair/img/list/icon_like.png" alt=""/>';
							   				html+='			<span>'+data.list[i].READ_CNT+'</span> ';
							   				if(data.list[i].CUST_LIKE_CNT == 0){
							   					html+='			<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate2.png" alt=""/>';
							   				}else{
							   					html+='			<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate.png" alt=""/>';
							   				}
							   				html+='			<span>'+data.list[i].LIKE_CNT+'</span> ';
							   				html+='			<div class="list-body-msg-div"> ';
							   				html+='				<img src="'+data.list[i].LIST_ICON_URL+'"/> ';
							   				html+='			</div> ';
							   				html+='		</td>';
							   				html+=' <tr>';
							   				html+='</table>';
							   			}
							   			$(".list_text_li3").append(html);
							   			var length=$(".list_text_li3").find("table").length;
							   			var obj=$(".list_text_li3").find("table").get(0);
							   			var objHeight=$(obj).css("height");
							   			var height=Number(objHeight.substring(0,objHeight.length-2))*length;
							   			$(".list_main_image").attr("style","height:"+height+"px");
							   			
									}
						   		},
						   		error : function(a, msg, c) {
									$('#foo').fadeOut(200);
						   			alert("error: " + msg);
						   		}
						   });
					}
			 }
		 }
	 });
 });
 $(document).ready(function(){
	 //indexErr();
	 $(".list-title-img1").attr("style","height:"+heightTopImg+"px;");
	 
	$(".foot-img.home-selected").removeClass("home-selected").addClass("home-selectedno");
	$(".foot-img.news-selectedno").removeClass("news-selectedno").addClass("news-selected");
	$(".foot-img.csr-selected").removeClass("csr-selected").addClass("csr-selectedno");
	
	var length=$(".list_text_li1").find("table").length;
	var obj=$(".list_text_li1").find("table").get(0);
	var objHeight=$(obj).css("height");
	var height=Number(objHeight.substring(0,objHeight.length-2))*length;
	$(".list_main_image").attr("style","height:"+height+"px");
	$(".list_main_image").touchSlider({
		flexible : true,
		speed : 400,
		btn_prev : $("#btn_prev"),    
	    btn_next : $("#btn_next"), 
	    counter : function (e) {
			if(e.current==1){
				length=$(".list_text_li1").find("table").length;
				if(length!=0){
					obj=$(".list_text_li1").find("table").get(0);
					objHeight=$(obj).css("height");
					height=Number(objHeight.substring(0,objHeight.length-2))*length;
					if(height<divHeight){
						height=divHeight;
					}
					$(".list_main_image").attr("style","height:"+height+"px");
				}else{
					$(".list_main_image").attr("style","height:"+divHeight+"px");
				}
				$(".selected").removeClass("selected");
				$(".list-all-select").addClass("selected");
			}else if(e.current==2){
				length=$(".list_text_li2").find("table").length;
				if(length!=0){
					obj=$(".list_text_li2").find("table").get(0);
					objHeight=$(obj).css("height");
					height=Number(objHeight.substring(0,objHeight.length-2))*length;
					if(height<divHeight){
						height=divHeight;
					}
					$(".list_main_image").attr("style","height:"+height+"px");
				}else{
					$(".list_main_image").attr("style","height:"+divHeight+"px");
				}
				$(".selected").removeClass("selected");
				$(".list-skypass-select").addClass("selected");
			}else if(e.current==3){
				length=$(".list_text_li3").find("table").length;
				if(length!=0){
					obj=$(".list_text_li3").find("table").get(0);
					objHeight=$(obj).css("height");
					height=Number(objHeight.substring(0,objHeight.length-2))*length;
					if(height<divHeight){
						height=divHeight;
					}
					$(".list_main_image").attr("style","height:"+height+"px");
				}else{
					$(".list_main_image").attr("style","height:"+divHeight+"px");
				}
				$(".selected").removeClass("selected");
				$(".list-kenews-select").addClass("selected");
			}
		}
		});	
});

 function indexErr() {
 	<c:if test="${loginFlag eq 0 }">
 		fn_followLayerShow();
 		return;
 	</c:if>
 }
$(function(){
	$(".list-all-select").click(function(){
		var item=$(".selected").attr("data-item");
		if(item=="2"){
			 $("#btn_prev").trigger("click");
		}else if(item=="3"){
			 $("#btn_next").trigger("click");
		}
		
		/* $(".selected").removeClass("selected");
		$(".list-all-select").addClass("selected");
		var length=$(".list_text_li1").find("table").length;
		var obj=$(".list_text_li1").find("table").get(0);
		var objHeight=$(obj).css("height");
		var height=Number(objHeight.substring(0,objHeight.length-2))*length;
		if(height<divHeight){
			height=divHeight;
		} 
		$(".list_main_image").attr("style","height:"+height+"px");
		$(".list_text_li1").attr("style","float: none; display: block; position: absolute; top: 0px; left: 0px; width: 100%;");
		$(".list_text_li2").attr("style","float: none; display: block; position: absolute; top: 0px; left: 100%; width: 100%;");
		$(".list_text_li3").attr("style","float: none; display: block; position: absolute; top: 0px; left: 200%; width: 100%;"); */
		
	});
	$(".list-skypass-select").click(function(){
		var item=$(".selected").attr("data-item");
		if(item=="3"){
			 $("#btn_prev").trigger("click");
		}else if(item=="1"){
			 $("#btn_next").trigger("click");
		}
		/* $(".selected").removeClass("selected");
		$(".list-skypass-select").addClass("selected");
		var length=$(".list_text_li2").find("table").length;
		var obj=$(".list_text_li2").find("table").get(0);
		var objHeight=$(obj).css("height");
		var height=Number(objHeight.substring(0,objHeight.length-2))*length;
		if(height<divHeight){
			height=divHeight;
		}
		$(".list_main_image").attr("style","height:"+height+"px");
		$(".list_text_li1").attr("style","float: none; display: block; position: absolute; top: 0px; left: -100%; width: 100%;");
		$(".list_text_li2").attr("style","float: none; display: block; position: absolute; top: 0px; left: 0px; width: 100%;");
		$(".list_text_li3").attr("style","float: none; display: block; position: absolute; top: 0px; left: 100%; width: 100%;"); */
		/* $("#btn_next").trigger("click"); */
	});
	$(".list-kenews-select").click(function(){
		var item=$(".selected").attr("data-item");
		if(item=="1"){
			 $("#btn_prev").trigger("click");
		}else if(item=="2"){
			 $("#btn_next").trigger("click");
		}
	/* 	$(".selected").removeClass("selected");
		$(".list-kenews-select").addClass("selected");
		var length=$(".list_text_li3").find("table").length;
		var obj=$(".list_text_li3").find("table").get(0);
		var objHeight=$(obj).css("height");
		var height=Number(objHeight.substring(0,objHeight.length-2))*length;
		if(height<divHeight){
			height=divHeight;
		}
		$(".list_main_image").attr("style","height:"+height+"px");
		$(".list_text_li1").attr("style","float: none; display: block; position: absolute; top: 0px; left: -200%; width: 100%;");
		$(".list_text_li2").attr("style","float: none; display: block; position: absolute; top: 0px; left: -100%; width: 100%;");
		$(".list_text_li3").attr("style","float: none; display: block; position: absolute; top: 0px; left: 0px; width: 100%;"); */
	});
	
});
 

</script>
<script type="text/javascript">
/* 

var btnCnt1 = 1;
var btnCnt2 = 1;
var btnCnt3 = 1;

function openMenu(mu){
	
	var windowWidth = $( window ).width();
	if(mu==1){
		var n = (windowWidth/8)*3-82;
		$(".fixedMenu1").css("left", n+"px");
		if(btnCnt1 == 1){
			$(".fixedMenu1").fadeIn();
			btnCnt1 = 0;
		}else{	
			$(".fixedMenu1").fadeOut();
			btnCnt1 = 1;
		}
		$(".fixedMenu2").fadeOut();btnCnt2 = 1;
		$(".fixedMenu3").fadeOut();btnCnt3 = 1;
	}else if(mu==2){
		var n = (windowWidth/8)*5-82;
		$(".fixedMenu"+mu).css("left", n+"px");
		if(btnCnt2 == 1){
			$(".fixedMenu2").fadeIn();
			btnCnt2 = 0;
		}else{	
			$(".fixedMenu2").fadeOut();
			btnCnt2 = 1;
		}
		$(".fixedMenu1").fadeOut();btnCnt1 = 1;
		$(".fixedMenu3").fadeOut();btnCnt3 = 1;
	}else{
		var n = (windowWidth/8)*7-135;
		$(".fixedMenu"+mu).css("left", n+"px");
		if(btnCnt3 == 1){
			$(".fixedMenu3").fadeIn();
			btnCnt3 = 0;
		}else{	
			$(".fixedMenu3").fadeOut();
			btnCnt3 = 1;
		}
		$(".fixedMenu1").fadeOut();btnCnt1 = 1;
		$(".fixedMenu2").fadeOut();btnCnt2 = 1;
	}
	
}

function goPage(page){
	
	$('[class^=fixedMenu] td').css("background-color", "");
	$(".fixedMenu"+page).css("background-color", "#33A2B3");
	if(page=="1_2"){
		$('.fixedMenu1').toggleClass('changed');
	}else if(page=="2_3"){
		$('.fixedMenu2').toggleClass('changed');
	}if(page=="3_3"){
		$('.fixedMenu3').toggleClass('changed');
	}

	// page link
	if(page=="1_1"){
		location.href = "/front/newsFeed/list.htm";
	}
	if(page=="1_2"){
		location.href = "/front/newsFeed/list.htm";
	}
	
	if(page=="2_1"){
		location.href = "/front/koreanair/transferInfo.html";
	}
	if(page=="2_2"){
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/schedule-flight-search.html#schedule-search";
	}
	if(page=="2_3"){
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/schedule-flight-search.html#flight-search";
	}

	if(page=="3_1"){
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/ibe/bookingGate.html?isDomestic=false";
	}
	if(page=="3_2"){
		location.href = "https://www.koreanair.com/mobile/global/ko.html";
// 		judgeApk();
	}
	if(page=="3_3"){
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/booking/check-in.html#search";
	}
	$(".fixedMenu1").fadeOut();btnCnt1 = 1;
	$(".fixedMenu2").fadeOut();btnCnt2 = 1;
	$(".fixedMenu3").fadeOut();btnCnt3 = 1;
	
}

function judgeApk() {
	
	if (browser.versions.android) {//安卓手机
		if (confirm("确认下载大韩航空APP?")){
			
		}
	} else if (browser.versions.ios) {//苹果手机
		$('#share').show();
	}
} */

</script>
<style>
	body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea,button,select{margin:0;padding:0; font-weight:normal;}
	body{/*-webkit-user-select:none;-webkit-touch-callout:none;-webkit-tap-highlight-color:rgba(0,0,0,0);*/ 
	font-size:12px; }
	/* 
	.koreanair-foot{border-top:1px solid #53ACCB;width:100%;height:55px;background-color:#9CD0DE; vertical-align: bottom;text-align: center;font-size:12px;}
	.koreanair-foot li{float:left;width:25%;height:37px;}
	.koreanair-foot li a{height:25px;display: inline-block;width:100%;vertical-align: bottom;padding-top:37px;position: relative;}
	.foot-img{background-position: center 8px;background-size:40px 31px;background-repeat: no-repeat;}
	.foot-img.home-selected{background-image: url("/front/skin/koreanair/img/common/nav_home_b.png");color:#0b4395;}
	.foot-img.home-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_home.png");color:#436e7a;}
	.foot-img.news-selected{background-image: url("/front/skin/koreanair/img/common/nav_news_b.png");color:#0b4395;}
	.foot-img.news-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_news.png");color:#436e7a;}
	.foot-img.route-selected{background-image: url("/front/skin/koreanair/img/common/nav_route_b.png");color:#0b4395;}
	.foot-img.route-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_route.png");color:#436e7a;}
	.foot-img.predetermine-selected{background-image: url("/front/skin/koreanair/img/common/nav_predetermine_b.png");color:#0b4395;}
	.foot-img.predetermine-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_predetermine.png");color:#436e7a;}
	
	.fixedMenu1 {position: fixed;bottom:75px;width: 165px;height: 80px;padding: 0px;background: #FFFFFF;-webkit-border-radius: 7px;-moz-border-radius: 7px;border-radius: 7px;border: #0B4395 solid 1px;font-size:1.2em;color:#686868;
	-webkit-box-shadow: 0 3px 2px -2px #686868;
	   -moz-box-shadow: 0 3px 2px -2px #686868;
	        box-shadow: 0 3px 2px -2px #686868;}
	.fixedMenu1:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #FFFFFF transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu1.changed:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #33A2B3 transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu1:before {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #0B4395 transparent;display: block;width: 0;z-index: 0;bottom: -13px;left: 74px;}
	
	.fixedMenu2 {position: fixed;bottom:75px; width: 165px;height: 120px;padding: 0px;background: #FFFFFF;-webkit-border-radius: 7px;-moz-border-radius: 7px;border-radius: 7px;border: #0B4395 solid 1px;font-size:1.2em;color:#686868;
	-webkit-box-shadow: 0 3px 2px -2px #686868;
	   -moz-box-shadow: 0 3px 2px -2px #686868;
	        box-shadow: 0 3px 2px -2px #686868;}
	.fixedMenu2:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #ffffff transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu2.changed:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #33A2B3 transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu2:before {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #0B4395 transparent;display: block;width: 0;z-index: 0;bottom: -13px;left: 74px;}
	
	.fixedMenu3 {position: fixed;bottom:75px;width: 165px;height: 120px;padding: 0px;background: #FFFFFF;-webkit-border-radius: 7px;-moz-border-radius: 7px;border-radius: 7px;border: #0B4395 solid 1px;font-size:1.2em;color:#686868;
	-webkit-box-shadow: 0 3px 2px -2px #686868;
	   -moz-box-shadow: 0 3px 2px -2px #686868;
	        box-shadow: 0 3px 2px -2px #686868;}
	.fixedMenu3:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #FFFFFF transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 120px;}
	.fixedMenu3.changed:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #33A2B3 transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 120px;}
	.fixedMenu3:before {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #0B4395 transparent;display: block;width: 0;z-index: 0;bottom: -13px;left: 120px;}

	html {-webkit-text-size-adjust: none;}
	body, html {height:100%;}
	body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea,button,select{margin:0;padding:0; font-weight:normal;}
	body{ 
	font-size:12px; 
    	background-size:100%;
    	height:100%;}

	button,
	input[type="button"],
	input[type="submit"],
	input[type="reset"]{-webkit-appearance:button;border-radius:50%}
	
	.imgTempOne{position: relative; text-align: center;}
	.backGrBuilding{position: absolute;top:75%;width:40%;left:30%;z-index:-1;opacity:0;}
	.backGrAirplane{position: absolute;top:55%;width:auto;left:100%;z-index:1; width:40%;display:none;}
	.logo{position: absolute;top:20px;left:15px;}
	
	.firstBox{text-align: center;margin: -5px auto; z-index:999;}
	.subImg1 {width: 60%; display: inline-block;float: left;margin: 5px 5px 5px 10px;border:1px solid #D6D6D6;background-color:white;padding:3px;}
	.subImg1_1{width: 100%; display: inline-block;float: left;position:relative; overflow:hidden;}
	.subImg1_1 .sliderList {position:relative; overflow:hidden;text-align: center;}
	.subImg1_1 .sliderList ul {position:relative; width:100% !important; background:#fff;}
	.subImg1_1 .sliderList img {width:100%;}
	.subImg1_1 .sliderList li {position:absolute;}
	.subImg1_1 .sliderList li:first-child {position:relative !important;}
	.subImg1_1 .sliderpage {position:absolute; bottom:5px; left:5px; right:0; text-align:left; line-height:0; font-size:0; }
	.subImg1_1 .sliderpage .btnPage {height:9px; width:9px; border:0; font-size:0; line-height:0; background:#ffffff;}
	.subImg1_1 .sliderpage .btnPage + .btnPage {margin-left:3px;}
	.subImg1_1 .sliderpage .btnPage.on {background-color:#FF9200;}
	.subImg1_2{width: 29%; display: inline-block;float: left;margin: 5px 5px 5px 5px;}
	
	.scndBox{text-align: center;margin: 0 auto; }
	.subImg2_1{width: 47%; display: inline-block;float: left;margin: 5px 5px 5px 10px;}
	.subImg2_2{width: 45%; display: inline-block;float: left;margin: 5px 5px 5px 5px;}
	.subImg2_3{width: 45%; display: inline-block;float: left;margin: 0px 5px 5px 5px;}
	
	.thBox{text-align: left;margin: 0 auto; display: inline-block;float: left; padding-left: 10px;}
	
	.share {position:absolute; top:0; left:0; width:100%;height:100%; background:url('/front/skin/koreanair/img/main/applink_guide_iPhone_n1.png') no-repeat; background-size:100% 100%; display:none; z-index: 999;}
	.share img {position:absolute; width: 30%; height: 10%; top: 50%; left: 35%;} */
</style>
</head>
<body>
	<input type="hidden" id="pageCount" value="${requestScope.pageCount }">
	<input type="hidden" id="pageCount1" value="${requestScope.pageCount1 }">
	<input type="hidden" id="pageCount2" value="${requestScope.pageCount2 }">
	<div id="container" style="margin-top: 0px; padding-top: 0px;">
	    <section id="contents">
	    <div class="list-top-title-img">
	    	<table onclick="location.href='/front/newsFeed/detail.htm?msgId=${requestScope.map.MSG_ID}&newsId=${requestScope.map.NEWS_ID }&shopId=${sessionScope.sessionSkin.shopId}'">
	    		<tr>
	    			<td>
	    				<img class="list-title-img1" src="${requestScope.map.LIST_IMG_URL }" alt=""/>
	    				 <!-- <img class="list-title-img1" src="/uploads/150/2015/04/07/150_material_2015_04_07_10_02_28_22164.jpg" alt=""/> -->
	    			</td>
	    			<td class="list-title-text-td">
	    				<img class="bg-left-div" src="/front/skin/koreanair/img/list/BG_left.png" alt=""/>
	    				<div>
	    					<ul>
	    						<li>
	    							<p class="list-big-title">
				    					<!-- 大韩航空A380，<br/>载着梦想起航 -->
				    					<c:if test="${fn:length(requestScope.map.MTITLE)>=17 }">
											${fn:substring(requestScope.map.MTITLE, 0, 15) }...
										</c:if>
										<c:if test="${fn:length(requestScope.map.MTITLE)<17 }">
											${requestScope.map.MTITLE}
										</c:if>
				    				</p>
	    						</li>
	    						<li>
	    							<img src="/front/skin/koreanair/img/list/ico_calendar.png" alt=""/>
	    							<span>${requestScope.map.NEWS_DATE }</span>
	    						</li>
	    						<li>
	    							<img src="/front/skin/koreanair/img/list/icon_like.png" alt=""/>
	    							<span>${requestScope.map.READ_CNT }</span> 
	    							<c:choose>
	    								<c:when test="${requestScope.map.CUST_LIKE_CNT == 0}">
	    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate2.png" alt=""/>
	    								</c:when>
	    								<c:otherwise>
	    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate.png" alt=""/>
	    								</c:otherwise>
	    							</c:choose>
	    							<span>${requestScope.map.LIKE_CNT }</span><br/>
	    						</li>
	    						<li>
	    							<p class="list-title-msg">
				    					<c:if test="${fn:length(requestScope.map.MDIGEST)>=28 }">
											${fn:substring(requestScope.map.MDIGEST, 0, 25) }...
										</c:if>
										<c:if test="${fn:length(requestScope.map.MDIGEST)<28 }">
											${requestScope.map.MDIGEST}
										</c:if>
				    				</p>
	    						</li>
	    					</ul>
	    				</div>
	    				<input type="hidden" id="btn_prev"/>
	    				<input type="hidden" id="btn_next"/>
	    			</td>
	    		</tr>
	    	</table>
	    </div>
	    <div class="list-body-title-select">
	    	<div class="list-all-select selected" data-item="1">全部</div>
	    	<div class="list-skypass-select"  data-item="2">
	    		<!-- <img src="/front/skin/koreanair/img/list/list_ico_skypass.png"/> -->最新资讯
	    	</div>
	    	<div class="list-kenews-select"  data-item="3">
	    		<!-- <img src="/front/skin/koreanair/img/list/list_ico_news.png"/> -->
	    		精彩促销
	    	</div>
	    	
	    	
			<c:set value="" var="shareTitle"></c:set>
			<c:set value="" var="shareImgUrl"></c:set>
			<c:set value="" var="shareDesc"></c:set>
					
	    	<div class="list_main_image" >
		    	<ul>
		    		<li class="list_text_li1">
						<c:forEach items="${list }" var="list" varStatus="status">
							<c:if test="${1==1}">
							
								<c:set value="${list.MTITLE}" var="shareTitle"></c:set>
								<c:set value="${list.LIST_IMG_URL}" var="shareImgUrl"></c:set>
								<c:set value="${list.MDIGEST}" var="shareDesc"></c:set>
							
								<table onclick="location.href='/front/newsFeed/detail.htm?msgId=${list.MSG_ID}&newsId=${list.NEWS_ID }&shopId=${sessionScope.sessionSkin.shopId}'">
									<tr>
										<td>
											<img src="${list.LIST_IMG_URL }" data-news-id="${list.NEWS_ID }" />
										</td>
										<td class="list-body-msg">
											<p>
												<!-- 选择大韩航空<br/> 
												邂逅精彩韩国 -->
												${list.MTITLE }
											</p>
											<img src="/front/skin/koreanair/img/list/ico_calendar.png" style="margin-right:3px;" alt=""/><span>${list.NEWS_DATE}</span><br/>
											<img src="/front/skin/koreanair/img/list/icon_like.png" alt=""/>
			    							<span>${list.READ_CNT }</span> 
			    							<c:choose>
			    								<c:when test="${list.CUST_LIKE_CNT == 0}">
			    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate2.png" alt=""/>
			    								</c:when>
			    								<c:otherwise>
			    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate.png" alt=""/>
			    								</c:otherwise>
			    							</c:choose>
			    							<span>${list.LIKE_CNT }</span>
			    							<div class="list-body-msg-div">
			    								<img src="${list.LIST_ICON_URL}"/>
			    							</div> 
										</td>
									</tr>
								</table>
							</c:if>
						</c:forEach>
		    		</li>
		    		<li  class="list_text_li2">
						<c:forEach items="${list1 }" var="list" varStatus="status">
							<table onclick="location.href='/front/newsFeed/detail.htm?msgId=${list.MSG_ID}&newsId=${list.NEWS_ID }&shopId=${sessionScope.sessionSkin.shopId}';">
								<tr>
									<td>
										<img src="${list.LIST_IMG_URL }" data-news-id="${list.NEWS_ID }" />
									</td>
									<td class="list-body-msg">
										<p>
											<!-- 选择大韩航空<br/> 
											邂逅精彩韩国 -->
											${list.MTITLE }
										</p>
										<img src="/front/skin/koreanair/img/list/ico_calendar.png" style="margin-right:3px;" alt=""/><span>${list.NEWS_DATE}</span><br/>
										<img src="/front/skin/koreanair/img/list/icon_like.png" alt=""/>
		    							<span>${list.READ_CNT }</span> 
		    							<c:choose>
		    								<c:when test="${list.CUST_LIKE_CNT == 0}">
		    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate2.png" alt=""/>
		    								</c:when>
		    								<c:otherwise>
		    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate.png" alt=""/>
		    								</c:otherwise>
		    							</c:choose>
		    							<span>${list.LIKE_CNT }</span>
		    							<div class="list-body-msg-div">
		    								<img src="${list.LIST_ICON_URL}"/>
		    							</div>
									</td>
								</tr>
							</table>
						</c:forEach>
		    		</li>
		    		<li  class="list_text_li3">
						<c:forEach items="${list2 }" var="list" varStatus="status">
							<table onclick="location.href='/front/newsFeed/detail.htm?msgId=${list.MSG_ID}&newsId=${list.NEWS_ID }&shopId=${sessionScope.sessionSkin.shopId}';">
								<tr>
									<td>
										<img src="${list.LIST_IMG_URL }" data-news-id="${list.NEWS_ID }" />
									</td>
									<td class="list-body-msg">
										<p>
											<!-- 选择大韩航空<br/> 
											邂逅精彩韩国 -->
											${list.MTITLE }
										</p>
										<img src="/front/skin/koreanair/img/list/ico_calendar.png" style="margin-right:3px;" alt=""/><span>${list.NEWS_DATE}</span><br/>
										<img src="/front/skin/koreanair/img/list/icon_like.png" alt=""/>
		    							<span>${list.READ_CNT }</span> 
		    							<c:choose>
		    								<c:when test="${list.CUST_LIKE_CNT == 0}">
		    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate2.png" alt=""/>
		    								</c:when>
		    								<c:otherwise>
		    									<img style="margin-left:14%;" src="/front/skin/koreanair/img/list/icon_like_rate.png" alt=""/>
		    								</c:otherwise>
		    							</c:choose>
		    							<span>${list.LIKE_CNT }</span>
		    							<div class="list-body-msg-div">
		    								<img src="${list.LIST_ICON_URL}"/>
		    							</div>
									</td>
								</tr>
							</table>
						</c:forEach>
		    		</li>
		    	</ul>
		    </div>
	    </div>
	    </section>
	</div>
	
	<!-- container end-->
	<br />
	<br />
	<br />
	<br />
	<!-- brand-footer -->
		<%@ include file="/front/newsFeed/footer.jsp"%>
	<!-- brand-footer -->
	
	
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

$(function(){ 
	  wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: ${signInfo.timestamp }, // 必填，生成签名的时间戳
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
	  		    /* title: '分享标题Test', // 分享标题
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标 */
	  		    title: '${shareTitle}', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}${shareImgUrl}', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '${shareTitle}', // 分享标题
	  		    desc: '${shareDesc}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}${shareImgUrl}', // 分享图标
	  		    /* title: '媒体发布会邀请函', // 分享标题
	  		    desc: '薄艺硬屏/薄艺（Art Slim）电视媒体发布会 2015.4.15 北京', // 分享描述
	  		    link: '${appInfo.url}/front/brand/lgdisplay150330/invitation.html', // 分享链接
	  		    imgUrl: '${appInfo.url}/front/brand/lgdisplay150330/pic300.jpg', // 分享图标 */
	  		    //type: 'music', // 分享类型,music、video或link，不填默认为link
	  		    //dataUrl: '${appInfo.url}/uploads/test/1342944231423576861128.mp3', // 如果type是music或video，则要提供数据链接，默认为空
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
