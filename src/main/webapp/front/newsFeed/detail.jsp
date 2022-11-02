<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${sessionScope.sessionSkin.shopName}</title>
<%@ include file="/front/skin/common.jsp"%>
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/common.css" />
<link rel="stylesheet" type="text/css" href="/front/js/page/kkpager.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/skin.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/koreanair/css/koreanair-css.css" />

<style type="text/css">
	#foo {width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 999000; width: 100%; height: 100%; display: none;}
	#fo {position: fixed; top: 50%; left: 50%; z-index:999999; display: '';}
	.detail-div-cont img {width: 100%;}

</style>

<style type="text/css">
.detail-div-cont * {
  max-width: 100%!important;
  box-sizing: border-box!important;
  -webkit-box-sizing: border-box!important;
  word-wrap: break-word!important;
}
.detail-div-title {margin-left: 0%;}
</style>

<script type="text/javascript"> 

//-- Common Page usage Counting
counter({
	 pageTp : 21,				//NEWSFEED_ DETAIL
	 pageId : '${requestScope.map.NEWS_ID}' || '',
	 goodsId : '' || '',
	 displayId : '' || ''
});

$(document).ready(function(){
	 //indexErr();
});
function indexErr() {
 	<c:if test="${loginFlag eq 0 }">
 		fn_followLayerShow();
 		return;
 	</c:if>
 }
$(function(){
	
	var custLinkCnt = "${requestScope.map.CUST_LIKE_CNT}";
	//alert(custLinkCnt);
	if(custLinkCnt == 0){
		$('.js-linked-count').removeClass('detail-praise-span').addClass('detail-praise-spanc');
	}else{
		$('.js-linked-count').removeClass('detail-praise-spanc').addClass('detail-praise-span');	
	}
	
	 $(".js-linked-count").click(function(){
		 var msgId=$("#msgId").val();
		 var shopId=$(this).attr("data-item");
		 var newsId=$("#newsId").val();
		 var param={msgId:msgId,shopId:shopId,newsId:newsId};
			$.ajax({
				data : param,
				dataType : "json",
				type : "GET",
				cache : false,
				url : "/front/newsFeed/savePraise.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				success : function(data){
					if(data.success){
						//alert(data.outLinkFlag);
						
						var linkedCount = parseInt($('.js-linked-count').text()) ;
						
						if( parseInt(data.outLinkFlag) == 1){
							$('.js-linked-count').removeClass('detail-praise-spanc').addClass('detail-praise-span');	
						}else{
							$('.js-linked-count').removeClass('detail-praise-span').addClass('detail-praise-spanc');
						}
						
						$('.js-linked-count').text(linkedCount +  parseInt(data.outLinkFlag));

					}else{
						alert("操作失败" + data.err_msg);
					}
				},
				error : function(a, msg, c) {
					alert("error: " + msg);
				}
			});
	 });
	 
	 
	 //$('fieldset.tn-Powered-by-XIUMI').css({'width':'100%'});
	 $('fieldset.tn-Powered-by-XIUMI img').css({'width':'100%'});
 
	 $('.detail-div-cont ul').css({'width':'100%'});
	 $('.video_iframe').css({'width':'100%'});
	 $('.video_iframe').attr('width','100%'); 
	 
/* 	 $('fieldset.tn-Powered-by-XIUMI > section').css({
		 'width':'95%',
		  'margin-right':'auto',
		  'margin-left':'auto',
		  'padding','none'
		 }); */
	 
});
</script>

<body>

	<div id="container" style="margin-top: 0px; padding-top: 0px; overflow-x:hidden; padding:15px;">
	    <section id="contents">
		<div class="detail-div-title">
			<p>
				${requestScope.map.MTITLE}
			</p>
			<span>${requestScope.map.NEWS_DATE}</span>&nbsp;
			<span onclick="indexErr()">${requestScope.map.MAUTHOR}</span>
		</div>
		<div class="detail-div-cont">${requestScope.map.MCONTENT}</div>
		<div class="detail-footer-div"
				<c:choose>
					<c:when test="${sessionSkin.shopId eq 16}"><%-- Test Account --%>
						style="display:block;"
					</c:when>
					<c:when test="${sessionSkin.shopId eq 13}">
						style="display:block;"
					</c:when>
					<c:when test="${sessionSkin.shopId eq 17}">
						style="display:block;"
					</c:when>
					<c:when test="${sessionSkin.shopId eq 18}">
						style="display:block;font-size: 18px;"
					</c:when>
					<c:when test="${sessionSkin.shopId eq 24}">
						style="display:block;"
					</c:when>
					<c:when test="${sessionSkin.shopId eq 25}">
						style="display:block;"
					</c:when>
					<c:when test="${sessionSkin.shopId eq 26}">
						style="display:block;"
					</c:when>
					<c:otherwise>
						style="display:none;"
					</c:otherwise>
				</c:choose>		
		>
			<a href="${requestScope.map.MSOURCE_URL }">
				<p>阅读原文</p>
			</a>
			<span class="detail-read-num-span">${requestScope.map.READ_CNT}</span>
			<input type="hidden" value="${requestScope.map.MSG_ID}" id="msgId"/>
			<input type="hidden" value="${requestScope.map.NEWS_ID}" id="newsId"/>
			<span class="js-linked-count" data-item="${sessionSkin.shopId}">${requestScope.map.LIKE_CNT}</span>
		</div>
			<c:if test="${sessionSkin.shopId ne 18 
						and sessionSkin.shopId ne 24 
						and sessionSkin.shopId ne 25 
						and sessionSkin.shopId ne 26}">
				<br/>
				<br/>
				<br/>
				<br/>
			</c:if>
		</section>
		<%@ include file="/front/newsFeed/footer.jsp"%>
	</div>
	
	
	
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
	  		    title: '${requestScope.map.MTITLE  }', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}${requestScope.map.LIST_IMG_URL  }', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    	counter({
	  		    		 pageTp : 22,				//NEWSFEED_DETAIL_SHARE_TIME_LINE
	  		    		 pageId : '${requestScope.map.NEWS_ID}' || '',
	  		    		 goodsId : '' || '',
	  		    		 displayId : '' || ''
	  		    	});
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '${requestScope.map.MTITLE  }', // 分享标题
	  		    desc: '${requestScope.map.MDIGEST  }', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}${requestScope.map.LIST_IMG_URL  }', // 分享图标
	  		    /* title: '媒体发布会邀请函', // 分享标题
	  		    desc: '薄艺硬屏/薄艺（Art Slim）电视媒体发布会 2015.4.15 北京', // 分享描述
	  		    link: '${appInfo.url}/front/brand/lgdisplay150330/invitation.html', // 分享链接
	  		    imgUrl: '${appInfo.url}/front/brand/lgdisplay150330/pic300.jpg', // 分享图标 */
	  		    //type: 'music', // 分享类型,music、video或link，不填默认为link
	  		    //dataUrl: '${appInfo.url}/uploads/test/1342944231423576861128.mp3', // 如果type是music或video，则要提供数据链接，默认为空
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		        // 用户确认分享后执行的回调函数
	  		    	counter({
	  		    		 pageTp : 23,				//NEWSFEED_DETAIL_SHARE_APPMESSAGE
	  		    		 pageId : '${requestScope.map.NEWS_ID}' || '',
	  		    		 goodsId : '' || '',
	  		    		 displayId : '' || ''
	  		    	});
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
