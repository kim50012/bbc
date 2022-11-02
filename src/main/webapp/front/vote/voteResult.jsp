<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${sessionScope.sessionSkin.shopName}</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">
	body{
		width:100%;
		text-align: center;
		background-color: #ffffff;
		font-family:microsoft yahei;
		line-height: 1.6;
	}
	.promotion-div {
	width: 92%;
	background-color: #ffffff;
	position: relative;
	text-align: center;
	display: inline-block;
	margin-top:5px;
}

.promotion-div .title-div-top {
	margin-top: 3px;
	text-align: left;
}

.promotion-div .title-div-top .title-p-vote {
	font-size: 22px;
	color: #313131;
	line-height:30px;
}

.promotion-div .title-div-top .date-p-vote {
	font-size: 16px;
	color: #696969;
	margin-top: 5px;
	margin-bottom: 10px;
}

.promotion-div .title-div-top .desc-p-vote {
	font-size: 16px;
	color: #313131;
	line-height: 20px;
}
	.question-div-list{width:100%;margin-top:10px;border:1px solid #eee;border-radius:4px;padding-top:15px;}
	.question-div-one{width:94%;display: inline-block;position: relative;margin-bottom:15px;text-align: left;}
	.question-div-one p{font-size:16px;margin-bottom:5px;}
	.question-div-one table{width:100%;position: relative;text-align: left;border-bottom:1px solid #eee;}
	.question-div-one table tr td{position: relative;line-height:20px;font-size:14px;padding-top:5px;padding-bottom:5px;}
	.question-div-one table tr td img{height:25px;margin-left:5px;display: inline-block;margin-top:2px;}
	.question-div-one table tr td .input-selected{width:14px;height:14px;position: relative;  left: 9px !important;}
	.question-div-one table tr td .line-bottom-div{height:5px;display: inline-block;width:70%;background-color: #f2f2f2;position: relative;margin-bottom:2px;border-radius:4px;}
	.question-div-one table tr td .line-top-div{height:5px;width:70%;position: absolute;left:0;top:0;background-color: #7ce0f0;border-radius:4px;}
	.question-div-one table tr td .msg-show-span{font-size:12px;margin-left:10px;color:#696969;}
	.bottom-p{font-size:16px;width:100%;text-align: center;color:#696969;margin-bottom:10px;}
	.bottom-div-msg{height:40px;width:100%;line-height: 40px;position: relative;border-bottom:1px solid #eee;color:#696969;margin-top:5px;}
	.bottom-div-msg a{float:right;margin-right:4%;margin-bottom:30px;}
</style>

<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 35,				//VOTE_RESULT
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || ''
});

$(function(){

	indexErr();
	
});
function indexErr() {
	<c:if test="${loginFlag eq 0 }">
		fn_followLayerShow();	
		return;
	</c:if>
}
</script>

</head>

<body>

	<div class="promotion-div">
		<div class="title-div-top">
			<p class="title-p-vote">${requestScope.reVoteHeader.VOTE_NM }</p>
			<p class="date-p-vote">${requestScope.reVoteHeader.VOTE_DT}</p>
			<p class="desc-p-vote">${requestScope.reVoteHeader.voteDesc}</p>
		</div>
		<div class="question-div-list" style="margin-bottom:40px;">
			<c:forEach items="${requestScope.reVoteQlist}" var="itemQ" varStatus="statusQ">
				<div class="question-div-one">
					<p>
						${statusQ.index+1}.<p style="margin-left:15px;margin-top:-30px;">${itemQ.QUEST_NM}</p>&nbsp;&nbsp;
						<c:choose>
							<c:when test="${itemQ.RADIO_ONLY eq 'Y'}">
								(单选)
							</c:when>
							<c:otherwise>
								(多选)
							</c:otherwise>
						</c:choose>
					</p>
					<table style="table-layout: fixed;word-break:break-all;word-wrap:break-word;" >
						<c:forEach items="${itemQ.subList}" var="itemO" varStatus="statusO">
						<tr><td style="padding-left:2%;width:97%;padding-top:12px;padding-bottom:12px;line-height:26px;">${itemO.OP_NM}
								<c:choose>
									<c:when test="${itemO.IMG_ID eq '00000'}">
										
									</c:when>
									<c:otherwise>
											<div style="width:40px;display:inline-block;height:14px;"></div>
											<img style="height:40px;position: absolute;margin-top:-5px;margin-left:-30px;" src="${itemO.IMG_URL}" />
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<c:forEach items="${list }" varStatus="status" var="list">
								<c:if test="${list.OP_ID==itemO.OP_ID and list.Q_ID==itemQ.QUEST_ID }">
									<td style="padding-left:2%;">
										<div class="line-bottom-div">
											<div class="line-top-div" style="width:${list.Q_SUM_P}%;"></div>
										</div>
										<span class="msg-show-span">${list.SELECTED_NUM }票</span>
										<span class="msg-show-span">${list.Q_SUM_P}%</span>
									</td>
								</c:if>
							</c:forEach>
						</tr>
						</c:forEach>
					</table>				
				</div>
			</c:forEach>
			<!-- <div class="question-div-one">
				<p>
					1.问题1（多选）
				</p>
				<table>
					<tr><td>选项一</td></tr>
					<tr>
						<td>
							<div class="line-bottom-div">
								<div class="line-top-div"></div>
							</div>
							<span class="msg-show-span">1票</span>
							<span class="msg-show-span">50%</span>
						</td>
					</tr>
					<tr><td>选项二</td></tr>
					<tr>
						<td>
							<div class="line-bottom-div">
								<div class="line-top-div" style="width:50%;"></div>
							</div>
							<span class="msg-show-span">1票</span>
							<span class="msg-show-span" >50%</span>
						</td>
					</tr>
					<tr><td>选项三</td></tr>
					<tr>
						<td>
							<div class="line-bottom-div">
								<div class="line-top-div" style="width:30%;"></div>
							</div>
							<span class="msg-show-span">1票</span>
							<span class="msg-show-span">30%</span>
						</td>
					</tr>
				</table>				
			</div> -->
			<p class="bottom-p">${requestScope.typeName }</p>
		</div>
		<!-- <div class="bottom-div-msg">
			<a>举报</a>
		</div> -->
	</div>
<!-- 	<a href="#" class="bottom_totop">top</a> -->
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
			    title: '${sessionScope.sessionSkin.shopName}', // 分享标题
			    link: '${shareInfo.link}', // 分享链接
			    imgUrl: '${appInfo.url}${sessionScope.sessionSkin.shopLogoImgUrl}', // 分享图标
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
			    desc: '快来投票吧~', // 分享描述
			    link: '${shareInfo.link}', // 分享链接
			    imgUrl: '${appInfo.url}${sessionScope.sessionSkin.shopLogoImgUrl}', // 分享图标
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