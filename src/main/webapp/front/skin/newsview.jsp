<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	String strCurrentTime = String.valueOf(System.currentTimeMillis());
	
%>
<!DOCTYPE html>
<html>
<c:set var="item" value="${list[0]}" />
<head>
	<%@ include file="/front/skin/common_news.jsp"%> 
	<script type="text/javascript">
		var msgId=${item.MSG_ID}||'';
		var newId=${item.NEWS_ID}||'';
		ajaxUpdateCnt(msgId,newId,1);
	$(document).ready(function(){
		$('.more').click(function(){
			event.preventDefault();
			$('.more').hide();
			$('.loading').show();
		});
	});
	function explikeshare(p){
		if(p=='l')p=2;if(p=='s')p=3;
		if(msgId==''||newId=='')return;
		ajaxUpdateCnt(msgId,newId,p);
	}
	function ajaxUpdateCnt(m,n,p){
		var param ={msgId:m,newsId:n,newsClass:p};
	  	$.ajax({
  		    type: "POST",
  		    url: "/front/skin/updateNewsCnt.htm",
  		    data: param,
  		    dataType: "json",
  		    async:"false",
  		    success: function(res){
		  		  if(res.success){
		  			  if(res.ca==2){
		  				  alert('like+1');
		  			  }else if(res.ca==3){
		  				alert('share+1。');
		  			  }
		  		  }else{
		  			  alert(' 超时了...');
		  		  }
  		    },
  			error : function(a, msg, c) {
  				alert('error: ' + msg);
  			}
  		})
	}
</script>
</head>

<body>
<div id="wrap">
	<!-- s:BackButton -->
	<a href="javascript:history.go(-1)" class="btn-back"><img src="/front/skin/images/page/icon_arrow.png" alt="back" width="45" height="45"/></a>
	<!-- //e:BackButton -->
	<!-- s:ViewImage -->
	<div class="view-img">
		<img src="/front/skin/images/page/img_view.jpg" alt="view image" class="max"/>
	</div>
	<!-- //e:ViewImage -->
	<!-- s:contentWrap -->
	<div id="contentWrap">
		<div class="view-wrap mb20">
			<div class="view-cont01 ta-c">
				<h2><c:if test="${fn:length(item.MTITLE)>7 }">${ fn:substring( item.MTITLE ,0,6)} <br/>${ fn:substring( item.MTITLE ,6,15)}</c:if>
						<c:if test="${fn:length(item.MTITLE)<=7 }">${item.MTITLE} </c:if></h2>
				<p class="mt12"><fmt:formatDate value="${item.CREATED_DT}" pattern="y-M-d"/></p>
				<div class="btn mt18">
					<a href="javascript:;" onclick="explikeshare('l')"><img src="/front/skin/images/page/icon_like.jpg" alt="LIKE" width="15" height="13"/>LIKE</a><a href="javascript:;" onclick="explikeshare('s')"><img src="/front/skin/images/page/icon_share.jpg" alt="SHARE" width="15" height="19"/>SHARE</a>
				</div>
			</div>
			<div class="view-cont02">
				<h3><c:if test="${fn:length(item.MTITLE)>12 }">${ fn:substring( item.MTITLE ,0,11)} <br/>${ fn:substring( item.MTITLE ,11,35)}</c:if>
						<c:if test="${fn:length(item.MTITLE)<=12 }">${item.MTITLE} </c:if></h3>
				<div class="mt15">${item.MCONTENT}</div>
			</div>
		</div>
		<!-- s:MoreButton -->
		<a href="#" class="btn-gray more">MORE<img src="/front/skin/images/page/icon_more2.jpg" alt="MORE" width="13" height="13"/></a>
		<a href="#" class="btn-gray loading" style="display:none;"><img src="/front/skin/images/page/more_loading.gif" alt="MORE" width="50" height="5"/></a>
		<!-- //e:MoreButton -->
	</div>
	<!-- //e:contentWrap -->
	<!-- s:footer -->
	<div id="footer">
		<ul>
			<li>电话预订 <span>40065-88888</span></li>
			<li>营业时间 <span>07:00 ~ 21:00</span></li>
		</ul>
		<p class="mt10">Copyright 2016 &copy; KOREAN AIR . All right Reserved.</p>
	</div>
	<!-- //e:footer -->
</div>
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
	  		    title: '${sessoinMember.nickname }期待你的参与。', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${appInfo.url}/front/event/00021/images/zhuanpan1.png', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '${sessoinMember.nickname }留言', // 分享标题
	  		    desc: '期待你的参与。', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${appInfo.url}/front/event/00021/images/zhuanpan1.png', // 分享图标
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

