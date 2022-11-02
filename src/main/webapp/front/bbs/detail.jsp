<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${detail.SHOP_NM}</title>
<%@ include file="/front/skin/common.jsp"%>
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/common.css" />
<link rel="stylesheet" type="text/css" href="/front/js/page/kkpager.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/skin.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/koreanair-css.css" />
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script>
<style type="text/css">
	#foo {width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 999000; width: 100%; height: 100%; display: none;}
	#fo {position: fixed; top: 50%; left: 50%; z-index:999999; display: '';}
	.detail-div-cont img {width: 100%;margin-bottom: 5px;}

</style>
<style type="text/css">
body{
	overflow-x:hidden;
}
.detail-div-cont * {
/*   max-width: 100%!important; */
/*   box-sizing: border-box!important; */
/*   -webkit-box-sizing: border-box!important; */
/*   word-wrap: break-word!important; */
  color: #666666;
}
.detail-div-title {
	margin-left: 0%;
	height: 85px;
	width: 100%;
}

.detail-div-title p{
	color: #333333;
	font-size: 22px;
	font-weight: normal;
}

.user_head{
	width: 40px;
	height: 40px;
}

.head{
	width: 15%;
	float: left;
}
.author{
	width:45%;
	padding-top: 0px;
 	float: left;
 	text-align: left;
}
.author span{
	color: #333333;
	font-size: 14px;
	padding-left: 5px;
}
.author p{
	font-weight: normal;
	font-size: 12px;
	color: #999999;
	padding-left: 5px;
 	margin-top: 0px; 
}
.shop_name{
	width:40%;
	float:left;
	padding-top: 15px;
	text-align: right;
}
.detail-div-title span:last-child {
	color: #90C320;
	font-size: 12px;
}

.review_list{
	border-bottom:1px solid #D6D4D5; 
	height: 35px;
	background: #FAFAFA;
	width: 100%;
	line-height: 35px;
	color: #000;
	font-size: 15px;
}
.green_block{
	background: #90C320;
	width: 6px;
	height: 35px;
	float: left;
	margin-right: 5px;
}

.review_detail{
	padding: 15px;
	min-height: 50px;
}
.review_head{
	width: 100%;
	float: left;
	padding-top: 10px;
}
.review_content{
	width: 100%;
	float: left;
	padding-bottom: 5px;
	padding-top: 5px;
	border-bottom: 1px solid #D6D4D5; 
	font-size: 12px;
	color: #666666;
}
.review_title{
	width: 85%;
	float: left;
}
.review_zan{
	width: 15%;
	text-align: right;
	height: 25px;
	line-height: 25px;
	float: left;
}
.detail_footer{
	height: 30px;
	line-height:30px;
	width: 80%;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
}

.message_total{
 	width: 33%; 
	float: left;
}
.share_total{
	width: 33%;
	float: left;
}
.review_list_all{
	height: auto;
	overflow: auto;
}
.shareto{
	text-align: center; 
	position:fixed; 
	top: 0px; 
	right:0px; 
	bottom:0px;
	filter: alpha(opacity=60); 
	background-color: #000;
   	z-index: 10; 
   	left: 0px; 
   	display:none;
    opacity:0.7;  
/*    	-moz-opacity:0.5; */
}
.message_content{
	height: 150px;
	background: white;
	opacity:1; 
	position: absolute;
	top: 0;
	left:0;
	right:0;
	z-index: 100;
	padding:0px 3px 0px 3px;
	display: none;
}
textarea {
	height:110px;
	border-top:none;
	border-left: none;
	border-right: none;
	border-bottom-color: #D6D4D5;
	font-size: 14px;
}
.publish{
/* 	height:28px; */
/* 	color: #fff; */
/* 	float: right; */
/* 	width: 50px; */
/* 	margin-right: 8px; */
/* 	text-align: center; */
/* 	line-height: 28px; */
/* 	border-radius: 5px; */
/* 	background: #2791DC; */
}
.shares{
	text-align: center; 
	position:fixed; 
	top: 0px; 
	right:0px; 
	bottom:0px;
	filter: alpha(opacity=60); 
	background-color: #000000;
   	z-index: 1002; 
   	left: 0px; 
   	display:none;
   	opacity:0.85; 
   	-moz-opacity:0.85;
}
.split{
	background: #EEEEEE;
	height: 15px;
	border: 1px solid #DBDBDB;
	margin: 0;
	padding: 0;
	overflow-x:hidden;
}
.div-like-content{
	margin-top: 0px; padding-top: 0px; overflow-x:hidden; padding:15px;text-align: center;
}
.div-like-content p{
	color: #333333;
	font-size: 13px;
}
.div-like-content div{
	padding-top: 5px;
	width: 100%;
	text-align: center;
}
.div-like-content #showPart img{
	width: 30px;
	height: 30px;
	margin-top: 3px;
	margin-right: 3px;
	float: left;
}
.div-like-content #showAll img{
	width: 30px;
	height: 30px;
	margin-top: 3px;
	margin-right: 3px;
	float: left;
}
.div-like-content #showPart .ellipsis{
	height: 30px;
	width: 30px;
	background-color: #90C320;
	text-align: center;
	padding-top: 0;
	margin-top: 3px;
	float: left;
	
}
.div-like-content #showAll .slideUp{
	height: 30px;
	width: 30px;
	background-color: #90C320;
	text-align: center;
	padding-top: 0;
	margin-top: 3px;
	float: left;
	color: #fff;
	line-height: 30px;
}
.split2{ 
 	background: #EEEEEE; 
 	height: 35px; 
 	line-height:35px; 
 	border: 1px solid #DBDBDB; 
 	margin: 0; 
 	padding: 0; 
 	padding-left: 15px;
 	padding-right: 15px;
 } 
 .text_show_all{
 	height: 45px;
 }
 .user_comment{
	position: fixed;
	left: 0;
	bottom: 45px;
	height: 45px;
	width: 100%;
	z-index: 1;
	text-align: center;
	white-space: nowrap;
	box-sizing: border-box;
	padding: 5px 10px 5px 10px;
	-webkit-box-shadow: #666 0px 0px 10px;
	-moz-box-shadow: #666 0px 0px 10px;
	box-shadow: #666 0px 0px 10px;
	border-top:1px solid #D6D4D5; 
	display: block;
 	background: #fff; 
	display: none;
}
input[type="text"] {
	float:left;
	width: 85%;
	height: 30px;
/* 	-webkit-border-radius: 8px; */
/* 	-moz-border-radius: 8px; */
/* 	border-radius: 8px; */
	border-top:none;
	border-left: none;
	border-right: none;
	border-bottom-color: #90C320;
}


#send{
	height:28px;
/* 	border:1px solid #D6D4D5;  */
	color: #000;
	float: left;
	width: 40px;
	margin-left: 5px;
	text-align: center;
	line-height: 28px;
	border-radius: 5px;
/* 	background: #D6D4D5; */
}
.zan_total{
	width: 33%;
	float: left;
	text-align: center;
}
.test_img{
	position: relative;
}
.test_tip{
	position: absolute;
	width: 35px;
	height: 20px;
	line-height: 20px;
	text-align: center;
	border-radius: 10px;
	background-color: #90C320;
	color: #fff;
	margin-left:45px;
	margin-top: -30px;
}
.message_img{
	position: relative;
}
.message_tip{
	position: absolute;
	width: 35px;
	height: 20px;
	line-height: 20px;
	text-align: center;
	border-radius: 5px;
	background-color: #90C320;
	color: #fff;
	margin-left:45px;
	margin-top: -40px;
}
.review_user{
	color: #333333;
	font-size: 16px;
	height: 15px;
	margin-top: 0px;
}
.review_date{
	color: #999999;
	padding-top: 3px;
	font-size: 12px;
	height: 15px;
	margin-top: 4px;
}
.review_body{
	font-family: Microsoft-yahei;
	float: left;
	padding-left: 45px;
	margin-top: -1px;
	font-size: 14px;
	padding-bottom: 5px;
/* 	padding-top: 3px; */
}
.user_head2{
	width: 35px;
	height: 35px;
}

/* START follow layer Popup page */
.followLayerPopupBbs {display:none;z-index:100000; position:absolute; top:0; left:0; right:0; bottom:0; background:rgba(0, 0, 0, 0.8); min-height:568px;}
.followLayerPopupBbs img {position:absolute; width:auto; height:20px;cursor:pointer;right:10px;top:10px;}
.followLayerPopupBbs .title {position:absolute; top:10%; left:50%; margin:0 0 0 -140px; height:50px; width:280px; font-size: 14px;box-sizing:border-box;overflow:hidden;color: #ffffff;}
.followLayerPopupBbs .inner {position:absolute; top:10%; left:50%; margin:50px 0 0 -140px; height:445px; width:280px; box-sizing:border-box; background:#434343;-webkit-border-radius: 20px;  -moz-border-radius: 20px;border-radius: 20px;overflow:hidden;}
.followLayerPopupBbs .cont-Title {color: #ffffff;position:relative;width:100%;height:30px;text-align:center;font-size: 16px;padding:3px;top:5px;}
.followLayerPopupBbs .cont-Title .serchMan {position:absolute; width:auto; height:25px;cursor:pointer;top:2px;right:20px;}
.followLayerPopupBbs .cont-Title2 {color: #ffffff;position:relative;width:100%;height:30px;text-align:center;font-size: 12px;padding:3px;top:5px;}
.followLayerPopupBbs .cont-Title2 .wechatId {font-size:16px; left-padding:15px; width:auto; color: #434343; background: url('/front/skin/main/img/icon/wechatidSearch.png') no-repeat 8px 2px #ffffff; background-size: 16px auto;}
.followLayerPopupBbs .follow {color: #ffffff;position:relative;width:80%;left:10%;height:25px;background:#06be04;-webkit-border-radius: 5px;  -moz-border-radius: 5px;border-radius: 5px;text-align:center;font-size: 16px;padding:2px;padding-top:5px;}
.followLayerPopupBbs .inner .cont-Body .shareList img {position:relative;top:50%; left:20%; width:60%;height:auto;cursor:pointer;}
.followLayerPopupBbs .close {position:absolute; bottom:0; right:0; height:30px; line-height:30px; padding:0 10px; color:#4a433b}
/* END follow layer Popup page */

</style>

<script type="text/javascript"> 

//-- Common Page usage Counting
counter({
	 pageTp : 31,				//NEWSFEED_ DETAIL
	 pageId : '${requestScope.map.NEWS_ID}' || '',
	 goodsId : '' || '',
	 displayId : '' || ''
});


$(function(){
// 	var heightAll=$(window).height();
// 	var containerHeight=$("#container").height();
// 	var footerHeight=$(".nongshimNavigation").height();
// 	var emptyHeight=heightAll-containerHeight-footerHeight;
// 	if(emptyHeight>45){
// 		$(".detail_footer").css("margin-top",emptyHeight-80 );
// 	}
// 	$("#message").click(function(){
// 		$("#message").css("display","none");
// 		$(".message_content").css("display","none");
// 		$("body").css("overflow-y","auto");
// 	});
	
	$(".publish").click(function(){
		if($.trim($("#comment").val())==''){
			return;
		}
		var bbsId='${detail.BBS_ID}';
		
 		var param={
			bbsParentId:'${detail.BBS_ID}'
			,bbsType:'${detail.BBS_TYPE}'
			,shopId:'${detail.SHOP_ID}'
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
//  	   				$("#comment").val('');
//  	   				$("#message").css("display","none");
//  	   				$(".message_content").css("display","none");
//  	   				$("body").css("overflow-y","auto");
//  	   				$("#detail_message"+bbsId).attr("src","/front/skin/nongshim/img/icon_mess1.png");
 	   				alert("评论成功");
 	   				window.location.href='/front/bbs/detail.htm?bbsId=${detail.BBS_ID}&shopId=${sessionScope.sessionSkin.shopId}'
 	   			}else{
	   				
 	   			}
 	   		}
 	   	});
	});
	//当前显示到第几页
	var pageCurr=1;
	$(window).scroll(function () {
	    var scrollTop = $(this).scrollTop();
	    var scrollHeight = $(document).height();
	    var windowHeight = $(this).height();
	    var pageCount=$("#pageCount").val();
	    if (scrollTop + windowHeight == scrollHeight) {
	    	pageCurr+=1;
	    	if(pageCurr>pageCount){
	    		return;
	    	}
	    	$('#foo').fadeIn(200);
	    	
	    	var param={pageCurr:pageCurr,pageUnit:10,bbsId:'${detail.BBS_ID}',shopId:'${detail.SHOP_ID}',bbsType:${detail.BBS_TYPE}};
	    	$.ajax({
	    		data : param,
	    		dataType : "json",
	    		type : "GET",
	    		cache : false,
	    		url : "/front/bbs/getNextReplyOfDeatil.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
	    		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	    		success : function(data){
	    			if(data.list.length!=0){
	    				for(var i=0;i<data.list.length;i++){
	    					var htm='';
	    					htm+='<div class="review_detail">'+
									'<div class="review_head">'+
										'<div class="review_title">'+
											'<div class="head" style="float: left;width: 45px;">'+
												'<img src="'+data.list[i].WX_IF_HEADIMGURL+'" class="user_head2"/>'+
											'</div>'+
											'<div  style="float: left;">'+
												'<p class="review_user">'+data.list[i].CREATE_USER+'</p>'+
												'<p class="review_date">'+data.list[i].CREATE_DT+'</p>'+
											'</div>'+
										'</div>'+
										'<div class="review_zan">';
											if(data.list[i].LIKE_NOT==0||data.list[i].LIKE_NOT==null){
												htm+='<img alt=""  id="zan'+data.list[i].BBS_ID +'" onclick="zan(\''+data.list[i].BBS_ID+'\',\''+data.list[i].BBS_TYPE+'\',\''+data.list[i].SHOP_ID+'\',\''+data.list[i].BBS_PARENT_ID+'\')" src="/front/skin/nongshim/img/btn_thumb.png" style="vertical-align: top;width: 20px;" />';
											}else{
												htm+='<img alt=""  id="zan'+data.list[i].BBS_ID +'" onclick="zan(\''+data.list[i].BBS_ID+'\',\''+data.list[i].BBS_TYPE+'\',\''+data.list[i].SHOP_ID+'\',\''+data.list[i].BBS_PARENT_ID+'\')" src="/front/bbs/images/btn_thumb_ckecked.png" style="vertical-align: top;width: 20px;" />';
											}
											htm+='&nbsp;<span style="color: #90C320" id="likeCount'+data.list[i].BBS_ID +'">';
											if(data.list[i].LIKE_TOTAL==0||data.list[i].LIKE_TOTAL==null){
												htm+='0';
											}else{
												htm+=''+data.list[i].LIKE_TOTAL+'';
											}
										htm+='</span>';	
									htm+='</div>'+
									'<div class="review_content">';
									htm+='<div class="review_body">';
										if(data.list[i].BODY.length>100){
											htm+=data.list[i].BODY.substr(0,96)+'...';
										}else{
											htm+=data.list[i].BODY;
										}
									htm+='	</div>';
									htm+='</div>'+
								'</div>';
	    				$(".text_show_all").before(htm);
	    				}
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
function zanDetail(bbsId,bbsType,shopId,bbsParentId){
	if('${loginFlag}'=='0'){
		fn_followLayerBbsShow();
		return;
	}else{
		var param={
				bbsId:bbsId
				,bbsType:bbsType
				,shopId:shopId
				,bbsParentId:bbsParentId
		};
	   	$.ajax({
	   		data : param,
	   		dataType : "json",
	   		type : "GET",
	   		cache : false,
	   		url : "/front/nongshim/newsfeed/bbsLikeShareInsert.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	   		success : function(data){
	//    			var likeCount=parseInt($("#detail_zan_count"+bbsId).html());
	//    			if($("#detail_zan"+bbsId).attr("src")=="/front/skin/nongshim/img/icon_zan2.png"){
	//    				$("#detail_zan"+bbsId).attr("src","/front/skin/nongshim/img/icon_zan1.png");
	//    				$("#detail_zan_count"+bbsId).html(likeCount+1);
	//    			}else{
	//    				$("#detail_zan"+bbsId).attr("src","/front/skin/nongshim/img/icon_zan2.png");
	//    				$("#detail_zan_count"+bbsId).html(likeCount-1);
	//    			}
	   			window.location.href='/front/bbs/detail.htm?bbsId=${detail.BBS_ID}&shopId=${sessionScope.sessionSkin.shopId}'
	   		}
	   	});
	}
}
function message(){
// 	if($(".review_list_all").height()>300){
// 		$(".review_list_all").css("height","285px");
// 		$(".review_list_all").css("overflow","hidden");
// 	}
	if('${loginFlag}'=='0'){
		fn_followLayerBbsShow();
		return;
	}else{
		if($(".user_comment").css("display")=="none"){
			$(".review_list_all").css("height","200px");
			$(".user_comment").css("bottom","45px");
			$(".user_comment").css("display","block");
			$(".comment_input").focus();
		}else{
			$(".review_list_all").css("height","auto");
			$(".user_comment").css("bottom","0");
			$(".user_comment").css("display","none");
		}
	}
}
function share(){
	bbsId='${detail.BBS_ID}';
	var param={
			bbsId:'${detail.BBS_ID}'
			,bbsType:'${detail.BBS_TYPE}'
			,shopId:'${detail.SHOP_ID}'
			,bbsParentId:'${detail.BBS_PARENT_ID}'
	};
   	$.ajax({
   		data : param,
   		dataType : "json",
   		type : "GET",
   		cache : false,
   		url : "/front/nongshim/newsfeed/bbsShareInsert.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
   		success : function(data){
//    			alert(bbsId);
//    			var shareCount=parseInt($("#detail_share_count"+bbsId).html());
//    			if($("#detail_share"+bbsId).attr("src")=="/front/skin/nongshim/img/icon_share2.png"){
//    				$("#detail_share"+bbsId).attr("src","/front/skin/nongshim/img/icon_share1.png");
//    			}
//    			$("#detail_share_count"+bbsId).html(shareCount+1);
   			window.location.href='/front/bbs/detail.htm?bbsId=${detail.BBS_ID}&shopId=${sessionScope.sessionSkin.shopId}'
   		}
   	});
// 	fn_SnsSareLayerShow();
}
function zan(bbsId,bbsType,shopId,bbsParentId){
	if('${loginFlag}'=='0'){
		fn_followLayerBbsShow();
		return;
	}else{
		var param={
				bbsId:bbsId
				,bbsType:bbsType
				,shopId:shopId
				,bbsParentId:bbsParentId
		};
	   	$.ajax({
	   		data : param,
	   		dataType : "json",
	   		type : "GET",
	   		cache : false,
	   		url : "/front/nongshim/newsfeed/bbsLikeShareInsert.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
	   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	   		success : function(data){
	   			var likeCount=parseInt($("#likeCount"+bbsId).html());
	   			if($("#zan"+bbsId).attr("src")=="/front/skin/nongshim/img/btn_thumb.png"){
	   				$("#zan"+bbsId).attr("src","/front/bbs/images/btn_thumb_ckecked.png");
	   				$("#likeCount"+bbsId).html(likeCount+1);
	   			}else{
	   				$("#zan"+bbsId).attr("src","/front/skin/nongshim/img/btn_thumb.png");
	   				$("#likeCount"+bbsId).html(likeCount-1);
	   			}
	   		}
	   	});
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

function showAll(){
	$("#showPart").css("display","none");
	$("#showAll").css("display","block");
// 	$("#showAll").slideDown();
}

function showPart(){
// 	$("#showAll").slideUp();
	$("#showPart").css("display","block");
	$("#showAll").css("display","none");
}

function fn_followLayerBbsShow() {
	
	$('#container').addClass('on layerZindex');
	$('.followLayerPopupBbs').show();
}

function fn_followLayerBbsHide() {
	$('#container').removeClass('on layerZindex');
	$('.followLayerPopupBbs').hide();
}
</script>

<body>
<input type="hidden" id="pageCount" value="${requestScope.pageCount }">
	<div id="container" style="margin-top: 0px; padding-top: 0px; overflow-x:hidden; padding:15px;">
	    <section id="contents">
			<div class="detail-div-title">
				<p>${detail.TITLE}</p>
				<div style="width: 100%;height: 40px;">
					<div class="head">
						<img src="${detail.WX_IF_HEADIMGURL}" class="user_head"/>
					</div>
					<div class="author">
						<span>
							<c:if test="${fn:length(detail.WX_IF_NICK_NMdetail.WX_IF_NICK_NMdetailWX_IF_NICK_NM)>=9 }">
								${fn:substring(detail.WX_IF_NICK_NM, 0, 6) }...
							</c:if>
							<c:if test="${fn:length(detail.WX_IF_NICK_NM)<9 }">
								${detail.WX_IF_NICK_NM}
							</c:if>
						</span>
						<p>${detail.CREATE_DT}</p>
					</div>
					<div class="shop_name"><span>${detail.SHOP_NM}</span></div>
				</div>
				<div style="height:10px; line-height:10px;border-bottom: 1px solid #ECECEC;"></div>
				<div class="detail-div-cont" style="padding-top: 10px;font-size: 16px;">${detail.BODY}</div>
				<div class="detail-div-cont" style="padding-top: 5px;">
					<c:if test="${detail.IMG1!=null}">
						<img alt="" src="${detail.IMG1}">
					</c:if>
					<c:if test="${detail.IMG2!=null}">
						<img alt="" src="${detail.IMG2}">
					</c:if>
					<c:if test="${detail.IMG3!=null}">
						<img alt="" src="${detail.IMG3}">
					</c:if>
					<c:if test="${detail.IMG4!=null}">
						<img alt="" src="${detail.IMG4}">
					</c:if>
					<c:if test="${detail.IMG5!=null}">
						<img alt="" src="${detail.IMG5}">
					</c:if>
				</div>
				<div class="detail_footer"> 
					
					<div class="message_total" onclick="message()">
						<div class="message_img">
							<img alt="" id="detail_message${detail.BBS_ID }" src="/front/skin/nongshim/img/btn_comment.png" style="padding-top: 12px;width: 40%;">
						</div>
						<div class="message_tip">
							<span style="color:#ffffff;">
								<c:if test="${detail.REPLY_COUNT==0||detail.REPLY_COUNT==null }">0</c:if>
								<c:if test="${detail.REPLY_COUNT!=0&&detail.REPLY_COUNT!=null  }">
									<c:if test="${detail.REPLY_COUNT>100 }">100+</c:if>
									<c:if test="${detail.REPLY_COUNT<=100}">${detail.REPLY_COUNT}</c:if>
								</c:if>
							</span>	
						</div>
					</div>
					<div class="zan_total">
						<div class="message_img">
							<img alt="" id="detail_zan${detail.BBS_ID }" onclick="zanDetail('${detail.BBS_ID }','${detail.BBS_TYPE }','${detail.SHOP_ID }','${detail.BBS_PARENT_ID }')" src="/front/skin/nongshim/img/btn_like.png" style="padding-top: 12px;width: 40%;">
						</div>
						<div class="message_tip">
							<span id="detail_zan_count${detail.BBS_ID }"  style="color:#ffffff;">
								<c:if test="${detail.LIKE_TOTAL==0||detail.LIKE_TOTAL==null }">0</c:if>
								<c:if test="${detail.LIKE_TOTAL!=0&&detail.LIKE_TOTAL!=null }">
									<c:if test="${detail.LIKE_TOTAL>100 }">100+</c:if>
									<c:if test="${detail.LIKE_TOTAL<=100}">${detail.LIKE_TOTAL}</c:if>
								</c:if>		
							</span>
						</div>
					</div>
					<div class="share_total">
						<div class="message_img">
							<c:if test="${detail.SHARE_NOT==0||detail.SHARE_NOT==null}">
								<img alt="" id="detail_share${detail.BBS_ID }" onclick="toshare('1')" src="/front/skin/nongshim/img/btn_share.png" style="padding-top: 12px;width: 40%;">
							</c:if>
							<c:if test="${detail.SHARE_NOT!=0&&detail.SHARE_NOT!=null }">
								<img alt="" id="detail_share${detail.BBS_ID}" onclick="toshare('1')" src="/front/skin/nongshim/img/btn_share.png" style="padding-top: 12px;width: 40%;">
							</c:if>
						</div>
						<div class="message_tip" style="display:none;">
							<span id="detail_share_count${detail.BBS_ID }"  style="color:#ffffff;">
								<c:if test="${detail.SHARE_TOTAL==0||detail.SHARE_TOTAL==null }">0</c:if>
								<c:if test="${detail.SHARE_TOTAL!=0&&detail.SHARE_TOTAL!=null }">
									<c:if test="${detail.SHARE_TOTAL>100 }">100+</c:if>
									<c:if test="${detail.SHARE_TOTAL<=100}">${detail.SHARE_TOTAL}</c:if>
								</c:if>	
							</span>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>			
	<div class="split" <c:if test="${(empty replyList and (detail.LIKE_TOTAL==0 or detail.LIKE_TOTAL==null)) or (!(empty replyList) and (detail.LIKE_TOTAL==0 or detail.LIKE_TOTAL==null))}">style="display:none;"</c:if>></div>
	<div class="div-like-content" <c:if test="${detail.LIKE_TOTAL==0||detail.LIKE_TOTAL==null }">style="display:none;"</c:if>>
		<p>喜欢  
			<c:if test="${detail.LIKE_TOTAL==0||detail.LIKE_TOTAL==null }">0</c:if>
			<c:if test="${detail.LIKE_TOTAL!=0&&detail.LIKE_TOTAL!=null }">${detail.LIKE_TOTAL}</c:if>
		</p>
		<div id="showPart" style="width: 280px;margin:0 auto;">
			<c:if test="${fn:length(likeList)<=8 }">
				<c:forEach items="${likeList }" var="list" varStatus="status" begin="0" end="7">
					<img src="${list.WX_IF_HEADIMGURL}" />
				</c:forEach>
			</c:if>
			<c:if test="${fn:length(likeList)>8 }">
				<c:forEach items="${likeList }" var="list" varStatus="status" begin="0" end="6">
					<img src="${list.WX_IF_HEADIMGURL}" />
				</c:forEach>
				<div class="ellipsis" onclick="showAll()">
					<img alt="" src="/front/skin/nongshim/img/icon_ellipsis.png" style="width: 19px;height: 4px;margin-top: 13px;margin-left: 5px;">
				</div>
			</c:if>
		</div>
		<div id="showAll" style="display: none;margin:0 auto;width: 280px;">
			
			<c:if test="${fn:length(likeList)<=23 }">
				<c:forEach items="${likeList }" var="list" varStatus="status" >
					<img src="${list.WX_IF_HEADIMGURL}" />
				</c:forEach>
				<div class="slideUp" onclick="showPart()">
					<img alt="" src="/front/skin/nongshim/img/icon_up.png" style="width: 12px;height: 12px;margin-top: 9px;margin-left: 9px;">
				</div>
			</c:if>
			<c:if test="${fn:length(likeList)>23 }">
				<c:forEach items="${likeList }" var="list" varStatus="status" begin="0" end="22">
					<img src="${list.WX_IF_HEADIMGURL}" />
				</c:forEach>
				<div class="slideUp" onclick="showPart()">
					${detail.LIKE_TOTAL-23}+
				</div>
			</c:if>
		</div>
	</div>	
	
	<div class="split2" <c:if test="${empty replyList}">style="display:none;"</c:if>>
		<div style="height: 1px;border-top: 1px solid #DBDBDB;margin-top: 17px;width: 35%;float: left;"></div>
		<div style="float: left;color: #666666;font-size: 12px;width: 30%;text-align: center;">上拉查看评论</div>
		<div style="height: 1px;border-top: 1px solid #DBDBDB;margin-top: 17px;width: 35%;float: left;"></div>
	</div>
	<c:if test="${empty replyList and (detail.LIKE_TOTAL==0 or detail.LIKE_TOTAL==null)}">
		<div class="split2" style="height:135px;">
			<div style="height: 1px;border-top: 1px solid #DBDBDB;margin-top: 17px;width: 31%;float: left;"></div>
			<div style="float: left;color: #666666;font-size: 12px;width: 38%;text-align: center;">目前还没有任何评论</div>
			<div style="height: 1px;border-top: 1px solid #DBDBDB;margin-top: 17px;width: 31%;float: left;"></div>
		</div>
	</c:if>
	<c:if test="${empty replyList and (detail.LIKE_TOTAL!=0 and detail.LIKE_TOTAL!=null)}">
		<div class="split2">
			<div style="height: 1px;border-top: 1px solid #DBDBDB;margin-top: 17px;width: 32%;float: left;"></div>
			<div style="float: left;color: #666666;font-size: 12px;width: 36%;text-align: center;">目前还没有任何评论</div>
			<div style="height: 1px;border-top: 1px solid #DBDBDB;margin-top: 17px;width: 32%;float: left;"></div>
		</div>
	</c:if>		
			
	<div class="review_list_all" <c:if test="${empty replyList}">style="display:none;"</c:if>>
		<c:forEach items="${replyList }" var="reply" varStatus="status">
			<div class="review_detail">
				<div class="review_head">
					<div class="review_title">
						<div class="head" style="float: left;width: 45px;">
							<img src="${reply.WX_IF_HEADIMGURL}" class="user_head2"/>
						</div>
						<div  style="float: left;">
							<p class="review_user">
								<c:if test="${fn:length(reply.CREATE_USER)>=13 }">
									${fn:substring(reply.CREATE_USER, 0, 10) }...
								</c:if>
								<c:if test="${fn:length(reply.CREATE_USER)<13 }">
									${reply.CREATE_USER}
								</c:if>
							</p>
							<p class="review_date">${reply.CREATE_DT}</p>
						</div>
					</div>
					<div class="review_zan">
						<c:if test="${reply.LIKE_NOT==0||reply.LIKE_NOT==null}">
							<img alt="" id="zan${reply.BBS_ID }" onclick="zan('${reply.BBS_ID }','${reply.BBS_TYPE }','${reply.SHOP_ID }','${reply.BBS_PARENT_ID }')" src="/front/skin/nongshim/img/btn_thumb.png" style="vertical-align: top;width: 20px;">
						</c:if>
						<c:if test="${reply.LIKE_NOT!=0&&reply.LIKE_NOT!=null }">
							<img alt="" id="zan${reply.BBS_ID }" onclick="zan('${reply.BBS_ID }','${reply.BBS_TYPE }','${reply.SHOP_ID }','${reply.BBS_PARENT_ID }')" src="/front/bbs/images/btn_thumb_ckecked.png" style="vertical-align: top;width: 20px;">
						</c:if>	
						<span style="color: #90C320" id="likeCount${reply.BBS_ID }">
							<c:if test="${reply.LIKE_TOTAL==0||reply.LIKE_TOTAL==null}">0</c:if>
							<c:if test="${reply.LIKE_TOTAL!=0&&reply.LIKE_TOTAL!=null}">${reply.LIKE_TOTAL}</c:if>							
						</span>
					</div>
				</div>
				<div class="review_content" >
					<div  class="review_body">
						<c:if test="${fn:length(reply.BODY)>=100 }">
							${fn:substring(reply.BODY, 0, 97) }...
						</c:if>
						<c:if test="${fn:length(reply.BODY)<100 }">
							${reply.BODY}
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class=text_show_all style="height: 45px">
		</div>
	</div>
	
	

	
	
	<div id="message"  class="shareto"><!--  class="shareto" -->
	</div>	
<!-- 	<div class="message_content"> -->
<!-- 		<textarea rows="" cols="" id="comment" placeholder=""></textarea> -->
<!-- 		<div class="publish">发表</div> -->
<!-- 	</div> -->
	
	 <!-- 评论 start -->
	 <div  class="user_comment" onclick="message()"> 
	 	<input type="text" id="comment" class="comment_input" oninput="changeButtonSpec(this.value);" placeholder="来说点什么吧~" />
	 	<div id="send"  class="publish">
	 		<img alt="" src="/front/skin/nongshim/img/btn_send.png">
	 	</div>
	 </div>
	
	 <!-- 评论  end -->
 
	<!-- container end-->

	
	<div id="share"  class="shares">
		<img alt="" src="/front/bbs/images/prompt.png" width="100%">
		
		<img alt="" src="/front/bbs/images/btn_iknow.png" width="50%" style="margin-top: 120px;" onclick="toshare('2');">
		
	</div>
	<!-- mainLayerPop -->
	<div class="followLayerPopupBbs" style="display:none;">
		<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="fn_followLayerBbsHide();"/>
		<div class="title">
			请先关注圃美多，才能帮好友助威赚美食，<br/>
			当然你也可以参与成为试吃员哦~
		</div>
		<div class="inner">
			<div class="cont-Title" style="height:10px;"></div>
			<div class="cont-Title">
				在微信“通讯录”点击 &nbsp;&nbsp;&nbsp;&nbsp;<img class="serchMan" src="/front/skin/main/img/icon/wechatidSearchMan.png" />
			</div>
			<div class="cont-Title2">
				搜索微信号 :  <span class="wechatId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.sessionSkin.shopWechatId}&nbsp;</span>
			</div>
			<div class="cont-Title">
				<div style="height:5px; width:100%;"></div>
				点击 详细资料 页面底部的
			</div>
			<div class="follow">
				关注
			</div>
			<div class="cont-Title">
				关注我们！
			</div>
			
			<div class="cont-Title">
				<div style="height:1px; background:#6d6d6d; width:80%; margin-left:10%;"></div>
			</div>
			
			<div class="cont-Body">
				<ul class="shareList">
					<img src="${sessionScope.sessionSkin.shopQRImgUrl}"/>
				</ul>
			</div>
			<div class="cont-Title">
				长按二维码可直接关注
			</div>
		</div>
	</div>
	<!-- //mainLayerPop -->
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
	  		    title: '我要免费吃【圃美多】韩餐，亲们快来帮我点赞助威~', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}/front/bbs/images/bbsType'+${requestScope.bbsType}+'.png', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '我要免费吃【圃美多】韩餐，亲们快来帮我点赞助威~', // 分享标题
	  		    desc: '我要成为【圃美多】试吃员，亲朋友快来帮我助威~', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}/front/bbs/images/bbsType'+${requestScope.bbsType}+'.png', // 分享图标
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
	<div style="height: 47px;"></div>

</body>
	<!-- brand-footer -->
	<%@ include file="/front/skin/common_navigation.jsp"%>	
	<!-- brand-footer -->
	
</html>