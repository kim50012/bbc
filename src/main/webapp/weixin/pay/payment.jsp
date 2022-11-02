<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>支付确认</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">
	   #alipayTip {
			position: absolute;
			left: 0;
			top: 0;
			z-index: 2;
			display: none;
			width: 100%;
			height: 100%;
			background-image: url('/weixin/pay/imgaes/alipay_tip_bg.png');
			background-size: 100% 100%;
			background-repeat: no-repeat;
		}
	   #alipayTip .tip-close{
			position: absolute;
			left: 10px;
			top: 10px;
			z-index: 3;  
			width: 30px;
			height: 30px;
			background-image: url('/weixin/pay/imgaes/btn_close.png');
			background-size: 100% 100%;
			background-repeat: no-repeat;
		}
	   #alipayTip .msg-tip{
			position: relative;
			margin-right:auto;
			margin-left:auto;
			margin-top : 35%; 
			text-align: center;
		}
		
		#alipayTip .msg-tip .ios-01{
			width: 90%; height:auto;
		}
		
		#alipayTip .msg-tip .ios-02{
			width: 90%; height:auto;margin-top: 10px;
		}
		
		#alipayTip .msg-tip .android-01{
			width: 90%; height:auto;
		}
		
		#alipayTip .msg-tip .android-02{
			width: 90%; height:auto;margin-top: 10px;
		}
		
		#alipayTip .msg-tip .tip-finish{
			width: 90%; height:auto;margin-top: 30px; display: none;
		}
	</style>


<c:if test="${isWeixinBrowser }">
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  <script type="text/javascript">
  //判断当前客户端版本是否支持指定JS接口
  function checkJsApi(){
		wx.checkJsApi({
		    jsApiList: [
		         //分享接口
				 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
				,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
				,'onMenuShareQQ'			//获取“分享到QQ”按钮点击状态及自定义分享内容接口
				,'onMenuShareWeibo'			//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
		  
				//微信支付
				,'chooseWXPay'				//发起一个微信支付请求
                ], // 需要检测的JS接口列表，所有JS接口列表见附录2,
		    success: function(res) {
		    }
		        // 以键值对的形式返回，可用的api值true，不可用为false
		        // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
	   });
	}
  
  function closeWindow(){
	  wx.closeWindow();
  }
  
  /*************************************************/
  /****************  图像接口  **********************/
  /*************************************************/
       
    function chooseWXPay(){
    	wx.chooseWXPay({
    	    timestamp: '${paySignInfo.timestamp}', // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
    	     nonceStr: '${paySignInfo.nonceStr}', // 支付签名随机串，不长于 32 位
    	    'package': '${paySignInfo.packageInfo}', // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
    	    signType: '${paySignInfo.signType}', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
    	    paySign: '${paySignInfo.paySign}', // 支付签名
    	    success: function (res) {
    	        // 接口调用成功时执行的回调函数。
    	        //alert('success');
    	        window.location.href = '/front/order/orderList.htm?orderIndex=3&shopId=' + ${shopId};
    	    },
    	    fail: function (res) {
    	        // 接口调用失败时执行的回调函数。
    	        //alert('fail');
    	    },
    	    complete: function (res) {
    	        // 接口调用完成时执行的回调函数，无论成功或失败都会执行。
    	        //alert('complete');
    	    },
    	    cancel: function (res) {
    	        // 用户点击取消时的回调函数，仅部分有用户取消操作的api才会用到。
    	       // alert('cancel');
    	    }
    	});
   }
  
  
  $(function(){
	  wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: '${signInfo.timestamp }', // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [//分享接口
		       		   'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
		        		//微信支付
		        		,'chooseWXPay'				//发起一个微信支付请求
		        		//微信小店
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
	  	});
	  
  })
  </script>
  <script type="text/javascript">
  function alipayPayment(){
	  $('#alipayTip').show();
	  setTimeout("showFinish()", 5000);
  }
  
  function showFinish(){
	  $('.tip-finish').show();
  }
  
  $(function(){
	 $('.js-tip-colse').click(function(){
		 $('.tip-finish').hide();
		 $('#alipayTip').hide();
	 }); 
	 
	 $('.js-finish').click(function(){
		  window.location.href = '/front/order/orderList.htm?orderIndex=3&shopId=' + ${shopId};
	 }); 
  });
  </script>
  
</c:if>

<c:if test="${not isWeixinBrowser }">
 <script type="text/javascript">
  function alipayPayment(){
	  window.location.href = '/alipay/payment.htm?orderId=' + ${orderId} +'&shopId=' + ${shopId};
  }
  </script>
</c:if>

 </head>
 <body style="background-color: #f5f5f5;">
 
 <input type="hidden"  id="shopId" value="${shopId }">
 <input type="hidden"  id="orderId" value="${orderId }">
 
 <!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		
		<div class="paymentArea">
			<h3>订单号:${orderInfo.custOrderId}</h3>
			<h2>￥${orderInfo.total_fee2}</h2>
		</div>
		<ul class="paymentInfo">
			<!-- <li>
				 收款信息
			</li> -->
			<li>
				 收款人:<span>${orderInfo.shopNm}</span>
			</li>
			 
			<li>
				 商品:<span>${orderInfo.body}</span>
			</li>
			<li>
				 支付申请号:<span>${orderInfo.out_trade_no}</span>
			</li>
		</ul>	
		
		<div>
			<c:if test="${isWeixinBrowser }">
			 	<div class="btnWarp">
					<a class="btn1 theme1" onclick="chooseWXPay();">立即支付</a> 
				</div>
			</c:if>
			
			<c:if test="${shopId eq 7 or shopId eq 8  or shopId eq 150}">
				<div class="btnWarp">
					<a class="btn1 btnalipay" onclick="alipayPayment();">支付宝支付</a> 
				</div>
			</c:if>
			
		</div>
		</section>
	</div>	
	
	<div id="alipayTip">
		<div class="tip-close js-tip-colse"></div>
		<div class="msg-tip">
			<c:choose>
				<c:when test="${isAndroid }">
					<img class="android-01" alt="" src="/weixin/pay/imgaes/android_01.png" style="" /> 
					<img class="android-02"  alt=""  src="/weixin/pay/imgaes/android_02.png"  style=""/>
				</c:when>
				<c:otherwise>
				 	<img class="ios-01" alt="" src="/weixin/pay/imgaes/ios_01.png" style="" /> 
			 		<img class="ios-02"  alt=""  src="/weixin/pay/imgaes/ios_02.png"  style=""/> 
				</c:otherwise>
			</c:choose>
			<img class="tip-finish js-finish"  alt="" src="/weixin/pay/imgaes/btn_finish.png"  style=""/>
			
		</div>
		  
	</div>
	
 
 </body> 
</html>