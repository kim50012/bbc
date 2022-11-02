<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>${label.系统介绍}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
				<style type="text/css">
				.cell-1{
					width:0.9rem;
					text-align:left;
					max-width:100px;
				}
				.cell-2{
					width:5rem; 
					text-align:center;
					
				}
				.cell-3{
					width:1rem;
					text-align:right; 
				}
				
		</style>
	</head>
	<body>
		<div class="">
			<div class="module">
				<div class="list68">
					<p class="title-icon">${label.系统介绍视频}</p>
				</div>
			</div>
			<div class="" style="width:100%;height:3.6rem;" id="divVideo">
				<iframe id="ifrVideo" frameborder="0" width="100%" height="100%" 
				  src="" 
				  allowfullscreen> 
				</iframe>
				<!--
				<video width=100%; style="width:100%;height:3.4rem;"  controls=controls;>
					<source src="../img/pic.ogg" type="video/ogg">
					<source src="../img/pic.mp4" type="video/mp4">
				</video>
				-->
			</div>
			<div class="" style="background:#fff;padding-bottom:0.2rem;">
				<div class="buttons" style="background:#fff;text-align:left;margin-left:0.2rem;">
					<button class="btn-big btn-text btn-h70" style="text-align:left;" onclick="fn_Video(1);">${label.加入方法介绍}</button>
					<button class="btn-big btn-text btn-h70" onclick="fn_Video(2);">${label.俱乐部入驻介绍}</button>
					<button class="btn-big btn-text btn-h70" onclick="fn_Video(3);">${label.参加活动}${label.方法}</button>
					<button class="btn-big btn-text btn-h70" onclick="fn_Video(4);">${label.排名系统介绍}</button>
					<button class="btn-big btn-text btn-h70" onclick="fn_Video(5);">${label.Best伙伴介绍}</button>
				</div>
			</div>
			<div class="modules">
				<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
					<div class="flex">
							<p class="flex1 title-icon">${label.系统升级明细}</p>
					</div>
				</div>
				<div class="switcharea-apply">
					<div class="module" style="border-top:none;background:#fff;font-size:0.2rem;color:#888;">

						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;">0</li>
							<li class="flex1 cell-2 cell" style="width: 100%;" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483718&idx=1&sn=1bfda996b149a01852a66655261cdfb2&chksm=fb184784cc6fce92f81aa2b6a24ead1dfe1fd0b05d497cbb228365697b676b03de7971fc3104&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">초기 시스템 적용 매뉴얼 및 사전 지식</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;">1</li>
							<li class="flex1 cell-2 cell" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483701&idx=1&sn=0e561811b34bfd11a4f69a2c7ae1f205&chksm=fb1847f7cc6fcee17802e1d8926fced0a9b3f2a52e0cbbd51bbb7a89f3d7a018cab17ba540c5&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">공식계정 팔로우</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;">2</li>
							<li class="flex1 cell-2 cell" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483701&idx=2&sn=81dcde7191f1aeffa6bcdf055fe8a55e&chksm=fb1847f7cc6fcee1831046159ea888ae35bcd3b2d32376ed95630d063fec3cc2d981bae30dde&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">클럽 생성</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;" style="max-width: 30px;">3</li>
							<li class="flex1 cell-2 cell" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483701&idx=3&sn=779ff0c5191537ce4f1bf6e53f51a9ca&chksm=fb1847f7cc6fcee12643de1b4e894c00941872314a036d720e69945bf83739d93e678a92e001&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">클럽 가입</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;">4</li>
							<li class="flex1 cell-2 cell" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483701&idx=4&sn=1e858bf61eedb38dedc72070e0649709&chksm=fb1847f7cc6fcee166d2f6da3da7189eaa861448f024bfd73824f679e6cc7627cf13f126cbae&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">회원 가입 승인</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;">5</li>
							<li class="flex1 cell-2 cell" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483701&idx=5&sn=a8437304122a2072570886af822ca05e&chksm=fb1847f7cc6fcee1a1e704560eb16ebfe26414894b5c22dd638dc102d899ba27a7555d3fe770&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">정규운동 / 번개운동 공지</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;">6</li>
							<li class="flex1 cell-2 cell" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483701&idx=6&sn=b11c1f85a0531c25d3f495227a138e2d&chksm=fb1847f7cc6fcee191198a86376e56c13a4c8b28be8eab4c35e0864ff053d6b7914fbd5203f5&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">복식/단식 경기 관리</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
						<ul class="flex list68 ul-list word">
							<li class="flex1 cell-1 cell" style="max-width: 30px;">7</li>
							<li class="flex1 cell-2 cell" onclick="window.location.href='https://mp.weixin.qq.com/s?__biz=MzU0MjU0NDgxMw==&mid=2247483701&idx=7&sn=8e2ee704706bde6ca676cada9dff612a&chksm=fb1847f7cc6fcee1f15be5def091c08a5ef9135b4dfbb659511c8bec1498ec337edfb76d490e&token=1621826961&lang=zh_CN#rd';"><div class="newtext float" style="width:100%">마이 페이지</div></li>
							<li class="flex1 cell-3 cell" style="max-width: 90px;">2018-12-27</li>
						</ul>
<%-- 						<c:forEach items="${list }" var="list" varStatus="status"> --%>
<!-- 							<ul class="flex list68 ul-list word"> -->
<%-- 								<li class="flex1 cell-1 cell">${list.CREATED_DT }</li> --%>
<%-- 								<li class="flex1 cell-2 cell" onclick="window.location.href='/front/magazine/magazineDetail.htm?shopId=${list.SHOP_ID}&magazineId=${list.BLOG_ID}';"><div class="newtext float">${list.BLOG_TITLE }</div></li> --%>
<!-- 							</ul> -->
<%-- 						</c:forEach>	 --%>
						<br><br><br><br>
				</div>
			</div>		


			<!-- START bottom menu -->
			<c:set var="menuTag" value="4" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->

		</div>
		<script type="text/javascript">
			function fn_Video(videoType) {

				var videoUrl = "";
				
				//alert("준비중입니다.");
				//return;

				if (videoType == 1) {
					videoUrl = "https://v.qq.com/iframe/player.html?vid=t0544s371lp&tiny=0&auto=0";
				}
				else if (videoType == 2) {
					videoUrl = "https://v.qq.com/iframe/player.html?vid=h0544vgczvt&tiny=0&auto=0";
				}
				else if (videoType == 3) {
					videoUrl = "https://v.qq.com/iframe/player.html?vid=a0544mw180j&tiny=0&auto=0";
				}
				else if (videoType == 4) {
					videoUrl = "https://v.qq.com/iframe/player.html?vid=i0544f0ww7c&tiny=0&auto=0";
				}
				else if (videoType == 5) {
					videoUrl = "https://v.qq.com/iframe/player.html?vid=a0544wi7a2q&tiny=0&auto=0";
				}
				$("#ifrVideo").attr("src", videoUrl);
			}

		</script>
		
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">

		$(document).ready(function(){
			fn_Video(1);
 		});
	
		$(function(){ 
			
			  wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
				    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
				    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
				    signature: "${signInfo.signature }",// 必填，签名，见附录1
				    jsApiList: [//分享接口
				       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
				        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
				                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});  
			  
			  	wx.ready(function(){
			  		
			  		wx.onMenuShareTimeline({
			  		    title: '${shareInfo.title} ${label.加入}', // 分享标题
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${shareInfo.title}', // 分享标题
			  		    desc: '${label.加入}', // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		       // alert('success 11');
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    	// alert('error 11');
			  		    }
			  		});
				});
			  	
			  	
			  	wx.error(function(res){
			  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		
			  	});
			  
		});
	</script>
	</body>
</html>
