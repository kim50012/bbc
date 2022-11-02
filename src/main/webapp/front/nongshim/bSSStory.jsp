<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
	
	long now = System.currentTimeMillis();
	String strCurrentTime = String.valueOf(now);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>白山水故事</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <!-- Link Swiper's CSS -->
    <!-- Demo styles -->
    <style>
    html, body {
        position: relative;
        height: 100%;
        width:100%;
    }
    body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#000;
        margin: 0;
        padding: 0;
    }
    
    .swiper-container {
    	height:100%;
    	width:100%;
		margin: 0 auto;
		position: relative;
		overflow: hidden;
		z-index: 1
	}
	
	
	.swiper-wrapper {
		position: relative;
		width: 100%;
		height: 100%;
		z-index: 1;
		display: -webkit-box;
		display: -moz-box;
		display: -ms-flexbox;
		display: -webkit-flex;
		display: flex;
		-webkit-transform-style: preserve-3d;
		-moz-transform-style: preserve-3d;
		-ms-transform-style: preserve-3d;
		transform-style: preserve-3d;
		-webkit-transition-property: -webkit-transform;
		-moz-transition-property: -moz-transform;
		-o-transition-property: -o-transform;
		-ms-transition-property: -ms-transform;
		transition-property: transform;
		-webkit-box-sizing: content-box;
		-moz-box-sizing: content-box;
		box-sizing: content-box
	}
	
	
	.swiper-slide {
		height:100%;
    	width:100%;
        text-align: center;
        font-size: 18px;
        background: #fff;
		-webkit-transform-style: preserve-3d;
		-moz-transform-style: preserve-3d;
		-ms-transform-style: preserve-3d;
		transform-style: preserve-3d;
		-webkit-flex-shrink: 0;
		-ms-flex: 0 0 auto;
		flex-shrink: 0;
		width: 100%;
		height: 100%;
		position: relative
	}
	.top-title-first{position: absolute;left:8%;top:4%;opacity:0;}
	.top-title-first2{position: absolute;left:8%;top:12.4%;opacity:0;}
	.top-title-two{position: absolute;top:4%;left:8%; z-index:9;}
	.circle01{position: absolute;top:37%;left:-53.3%;z-index:20;opacity:0;}
	.circle02{position: absolute;top:45%;left:-53.3%;z-index:20;opacity:0;}
	.circle03{position: absolute;top:24%;left:-53.3%;z-index:20;opacity:0;}
	.circle04{position: absolute;top:40%;left:-53.3%;z-index:20;opacity:0;}
	.circle05{position: absolute;top:27%;left:-53.3%;z-index:20;opacity:0;}
	/* 	.circle01{position: absolute;top:38.5%;left:4.6%;z-index:20;opacity:0;}
	.circle02{position: absolute;top:45%;left:24%;z-index:20;opacity:0;}
	.circle03{position: absolute;top:25%;left:28.7%;z-index:20;opacity:0;}
	.circle04{position: absolute;top:45%;left:28.4%;z-index:20;opacity:0;}
	.circle05{position: absolute;top:27%;left:33.6%;z-index:20;opacity:0;}*/
	.line01-out{/* width:45.33%; */width:0%;overflow: hidden;top:22.6%;position: absolute;left:0;}
	.line02-out{/* width:45.33%; */width:0%;overflow: hidden;top:22.6%;position: absolute;left:0;}
	.line03-out{/* width:45.33%; */width:0%;overflow: hidden;top:22.6%;position: absolute;left:0;}
	.line04-out{/* width:45.33%; */width:0%;overflow: hidden;top:22.6%;position: absolute;left:0;}
	.line05-out,.line06-out{/* width:45.33%; */width:0%;overflow: hidden;top:22.6%;position: absolute;left:0;text-align: left;}
	.line01{z-index:10;}
	.line02{z-index:10;}
	.line03{z-index:10;}
	.line04{z-index:10;}
	.line05,.line06{z-index:10;}
    </style>
    <style type="text/css">
		#foo {width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 999000; width: 100%; height: 100%;}
		#fo {position: fixed; top: 50%; left: 50%; z-index:999999; display: '';}
	</style>
	
	<script type="text/javascript" src="/front/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/front/js/headroom.js"></script>
	<script type="text/javascript" src="/front/js/jQuery.headroom.js"></script>
	<script type="text/javascript" src="/front/js/jquery.event.drag-1.5.min.js"></script>
	<script type="text/javascript" src="/front/js/jquery.touchSlider.js"></script>
	<script type="text/javascript" src="/front/js/common.js"></script>
	<script type="text/javascript" src="/front/js/page/kkpager.min.js"></script>
	<script type="text/javascript" src="/front/js/raty/jquery.raty.js"></script>
	<!-- <script type="text/javascript" src="/front/js/spin.js"></script> -->
	<script type="text/javascript" src="/front/js/spin.min.js"></script>
	<script type="text/javascript" src="/front/js/bottom-menu.js"></script>
	<script type="text/javascript" src="/front/js/jquery.timer.js"></script>
	<script type="text/javascript" src="/front/js/koreanair-Navigation.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
    $(function(){
		var heightAll=$(window).height();
	    var widthAll=$(window).width();
	    $(".line01").attr("style","width:"+widthAll+"px;");
	    $(".line02").attr("style","width:"+widthAll+"px;");
	    $(".line03").attr("style","width:"+widthAll+"px;");
	    $(".line04").attr("style","width:"+widthAll+"px;");
	    $(".line05").attr("style","width:"+widthAll+"px;");
		$(".line06").attr("style","width:"+widthAll+"px;");
	}) ;   
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
    </script>
</head>
<body>
    <!-- Swiper -->
    <div class="swiper-container">
    	<img class="top-title-two" id="pageOneTitle1" src="/front/skin/nongshim/bSSStory/font.png" width="50.4%;"/>
        <div class="swiper-wrapper">
            <div class="swiper-slide" style="background-image: url('/front/skin/nongshim/bSSStory/bg01.jpg');background-size:100% 100%; ">
				
				<img class="top-title-first" id="pageOneTitle" src="/front/skin/nongshim/bSSStory/welcome.png" width="69.5%;" style="display:none; visibility:hidden;"/>
				<img class="top-title-first2" id="pageOneTitle2" src="/front/skin/nongshim/bSSStory/story.png" width="33%;" style="display:none; visibility:hidden;"/><!---->
				<!-- <img class="circle01"  src="/front/skin/nongshim/bSSStory/circle01.png" width="53.3%;"/> -->
				<div class="line01-out">
					<img class="line01"  src="/front/skin/nongshim/bSSStory/main_01.png" />
					<!-- <img class="line01"  src="/front/skin/nongshim/bSSStory/line01.png" /> -->
				</div>
				
			</div>
            <div class="swiper-slide" style="background-image: url('/front/skin/nongshim/bSSStory/bg02.jpg');background-size:100% 100%; ">
				<!-- <img class="circle02"  src="/front/skin/nongshim/bSSStory/circle02.png" width="53.3%;" /> -->
				<div class="line02-out">
					<img class="line02"  src="/front/skin/nongshim/bSSStory/main_02.png" />
					<!-- <img class="line02"  src="/front/skin/nongshim/bSSStory/line02.png" /> -->
				</div>
			</div>
            <div class="swiper-slide" style="background-image: url('/front/skin/nongshim/bSSStory/bg03.jpg');background-size:100% 100%; ">
            	<!--<img class="top-title-two" id="pageThreeTitle" src="/front/skin/nongshim/bSSStory/logo.png" width="20.4%;"/>
				 <img class="circle03"  src="/front/skin/nongshim/bSSStory/circle03.png" width="53.3%;"/> -->
				<div class="line03-out">
					<img class="line03"  src="/front/skin/nongshim/bSSStory/main_03.png" />
					<!-- <img class="line03"  src="/front/skin/nongshim/bSSStory/line03.png" /> -->
				</div>
            </div>
            <div class="swiper-slide" style="background-image: url('/front/skin/nongshim/bSSStory/bg04.jpg');background-size:100% 100%; ">
				<!-- <img class="top-title-two" id="pageFourTitle" src="/front/skin/nongshim/bSSStory/logo.png" width="20.4%;"/>
				<img class="circle04"  src="/front/skin/nongshim/bSSStory/circle04.png" width="53.3%;" /> -->
				<div class="line04-out">
					<img class="line04"  src="/front/skin/nongshim/bSSStory/main_04.png" />
					<!-- <img class="line04"  src="/front/skin/nongshim/bSSStory/line04.png" /> -->
				</div>
			</div>
            <div class="swiper-slide" style="background-image: url('/front/skin/nongshim/bSSStory/bg05.jpg');background-size:100% 100%; ">
				<!-- <img class="top-title-two" id="pageFiveTitle" src="/front/skin/nongshim/bSSStory/logo.png" width="20.4%;"/>
				<img class="circle05"  src="/front/skin/nongshim/bSSStory/circle05.png" width="53.3%;"/> -->
				<div class="line05-out">
					<img class="line05"  src="/front/skin/nongshim/bSSStory/main_05.png" />
					<!-- <img class="line05"  src="/front/skin/nongshim/bSSStory/line05.png" /> -->
				</div>
			</div>
            <div class="swiper-slide" style="background-image: url('/front/skin/nongshim/bSSStory/bg06.jpg');background-size:100% 100%; ">
				<!-- <img class="top-title-two" id="pageSixTitle" src="/front/skin/nongshim/bSSStory/font.png" width="50.4%;"/>
				<img class="circle05"  src="/front/skin/nongshim/bSSStory/circle05.png" width="53.3%;"/> -->
				<div class="line06-out">
					<img class="line06"  src="/front/skin/nongshim/bSSStory/main_06.png" />
					<!-- <img class="line05"  src="/front/skin/nongshim/bSSStory/line05.png" /> -->
				</div>
			</div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="/front/brand/lgdisplay150330/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    	var swiper = new Swiper('.swiper-container', {
    		onSlideChangeStart:function(swiper){
    			var index=swiper.activeIndex;
  		      if(index==0){
  		    	  	//$("#pageTwoTitle").stop();
 		      			$(".line02-out").stop();
 		      			//$(".circle02").stop();
 		      			//$("#pageTwoTitle").attr("style","opacity:0");
 	   		      		$(".line02-out").attr("style","width:0%");
 	   		      		//$(".circle02").attr("style","opacity:0;left:-53.3%");
 		      		 	
  		    	 
  		      }else if(index==1){
  		    	  	//$(".top-title-first").stop();
	    		      	//$(".top-title-first2").stop();
	    		      	//$(".circle01").stop();
	    		      	$(".line01-out").stop();
	    		      	//$("#pageThreeTitle").stop();
		      			$(".line03-out").stop();
		      			//$(".circle03").stop();
		      			//$(".top-title-two").attr("style","opacity:0");
  		    	 	//$(".top-title-first").attr("style","opacity:0");
	    		      	//$(".top-title-first2").attr("style","opacity:0");
	    		      	//$(".circle01").attr("style","opacity:0;left:-53.3%");
	    		      	$(".line01-out").attr("style","width:0%");
  		    	 	//$("#pageThreeTitle").attr("style","opacity:0");
   		      		$(".line03-out").attr("style","width:0%");
   		      		//$(".circle03").attr("style","opacity:0;left:-53.3%");
  		    
  		    	  
  		      }else if(index==2){
  		    	  //$("#pageTwoTitle").stop();
		      			$(".line02-out").stop();
		      			//$(".circle02").stop();
		      			//$("#pageFourTitle").stop();
		      			$(".line04-out").stop();
		      			//$(".circle04").stop();
		      			//$("#pageTwoTitle").attr("style","opacity:0");
   		      		$(".line02-out").attr("style","width:0%");
   		      		//$(".circle02").attr("style","opacity:0;left:-53.3%");
   		      		//$("#pageFourTitle").attr("style","opacity:0");
   		      		$(".line04-out").attr("style","width:0%");
   		      		//$(".circle04").attr("style","opacity:0;left:-53.3%");
		      	
  		      }else if(index==3){
  		    	  //$("#pageThreeTitle").stop();
		      			$(".line03-out").stop();
		      			//$(".circle03").stop();
		      			//$("#pageFiveTitle").stop();
		      			$(".line05-out").stop();
		      			//$(".circle05").stop();
		      			//$("#pageThreeTitle").attr("style","opacity:0");
   		      		$(".line03-out").attr("style","width:0%");
   		      		//$(".circle03").attr("style","opacity:0;left:-53.3%");
   		      		//$("#pageFiveTitle").attr("style","opacity:0");
   		      		$(".line05-out").attr("style","width:0%");
   		      		//$(".circle05").attr("style","opacity:0;left:-53.3%");
			      
  		      }else if(index==4){
  		    	  //$("#pageFourTitle").stop();
		      			$(".line04-out").stop();
						$(".line06-out").stop();
		      			//$(".circle04").stop()
		      			//$("#pageFourTitle").attr("style","opacity:0");
   		      		$(".line04-out").attr("style","width:0%");
					$(".line06-out").attr("style","width:0%");
   		      		//$(".circle04").attr("style","opacity:0;left:-53.3%");
  		    	
  		      }else if(index==5){
  		    	  //$("#pageFourTitle").stop();
		      			$(".line05-out").stop();
						//$(".line06-out").stop();
		      			//$(".circle04").stop()
		      			//$("#pageFourTitle").attr("style","opacity:0");
   		      		$(".line05-out").attr("style","width:0%");
					//$(".line06-out").attr("style","width:0%");
   		      		//$(".circle04").attr("style","opacity:0;left:-53.3%");
  		    	
  		      }
    		},
    		onSlideChangeEnd: function(swiper){
    		      var index=swiper.activeIndex;
    		      if(index==0){
   		      		 	
	    		    	//$(".top-title-first").animate({opacity:1},250,function(){
	    		      		//$(".top-title-first2").animate({opacity:1},250,function(){
	    		      			/* $(".circle01").animate({opacity:1,"left":"3.7%"},800,function(){
	    		      			$(".line01-out").animate({"width":"100%"},1000);
	    		      			 }); */
	    		      			$(".line01-out").animate({"width":"100%"},1400);
	    		    	    //});
	    		      	//});
    		    	 
    		      }else if(index==1){
    		    	  //$("#pageTwoTitle").animate({opacity:1},5,function(){
    		    			/* $(".line02-out").animate({"width":"32%"},1000,function(){
    		    				$(".circle02").animate({opacity:1,"left":"26%"},700,function(){
   	   		      					$(".line02-out").animate({"width":"71%"},1,function(){
   										$(".line02-out").animate({"width":"100%"},700);
   	   		      					});
   	   		      			  });
    		    		  }); */
    		    	 // });
    		    	  $(".line02-out").animate({"width":"100%"},1400);
    		    	  
    		      }else if(index==2){
    		    	  //$("#pageThreeTitle").animate({opacity:1},5,function(){
    		    		/*   $(".line03-out").animate({"width":"42%"},1000,function(){
    		    		  	$(".circle03").animate({opacity:1,"left":"27%"},700,function(){
    	   		      				$(".line03-out").animate({"width":"71%"},1,function(){
    									$(".line03-out").animate({"width":"100%"},700);
    	   		      				});
    	   		      			  });
    		    		  }); */
    		    	 // });
    		    	  $(".line03-out").animate({"width":"100%"},1400);
    		      }else if(index==3){
			      			
    		    	  //$("#pageFourTitle").animate({opacity:1},5,function(){
    		    		 /*  $(".line04-out").animate({"width":"45%"},1000,function(){
    		    		  	 	$(".circle04").animate({opacity:1,"left":"28.4%"},700,function(){
    	   		      				$(".line04-out").animate({"width":"71%"},1,function(){
    									$(".line04-out").animate({"width":"100%"},700);
    	   		      				});
    	   		      			  });
    		    		  }); */
   		      			 
    		    	 // });
    		    	  $(".line04-out").animate({"width":"100%"},1400);
    		      }else if(index==4){
    		    	  //$("#pageFiveTitle").animate({opacity:1},5);
    		    		  /* $(".line05-out").animate({"width":"60%"},1500,function(){
    		    			  $(".circle05").animate({opacity:1,"left":"33.6%"},800); */
   		      			  
    		    		  $(".line05-out").animate({"width":"100%"},1400);
    		      }
				  else if(index==5){
    		    	  //$("#pageFiveTitle").animate({opacity:1},5);
    		    		  /* $(".line05-out").animate({"width":"60%"},1500,function(){
    		    			  $(".circle05").animate({opacity:1,"left":"33.6%"},800); */
   		      			  
    		    		  $(".line06-out").animate({"width":"100%"},1400);
    		      }
    		    }
        });
    
    </script>
    <div id="foo">
		<div id="fo"></div>
	</div>
	<script>
		var target = document.getElementById('fo');
		spinner = new Spinner(sPopts).spin(target);
	
		/* window.onload = function(){
			$('#foo').fadeOut(200);
		} */
		
		$(window).load(function() {
			$('#foo').fadeOut(200);
			 //$(".top-title-first").animate({opacity:1},250,function(){
		  		//  $(".top-title-first2").animate({opacity:1},250,function(){
		  			$(".line01-out").animate({"width":"100%"},1400);
		  			 /*  $(".circle01").animate({opacity:1,"left":"3.7%"},1000,function(){
		  				$(".line01-out").animate({"width":"100%"},500);
		  			  }); */
			    	//});
		  	  	//});
		});
	</script> 
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
	  		    imgUrl: '${basePath}/front/nongshim/images/participate/baishanshui_logo.jpg', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '${sessionScope.sessionSkin.shopName}', // 分享标题
	  		    desc: '欢迎关注农心白山水', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}/front/nongshim/images/participate/baishanshui_logo.jpg', // 分享图标
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