<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>투표목록</title>
<%@ include file="/front/skin/common.jsp"%>

<style type="text/css">

body {width:100%; text-align: center; background-color: #f0f0f0; font-family:microsoft yahei;}
.promotion-div { width:92%; border:1px solid #c5c5c5; display:inline-block; background-color: #ffffff; position: relative; text-align: center; margin-bottom:20px; border-radius:4px;}
.top-height-value { height:30px; background-color: #f0f0f0; }
.promotion-div .title-head{font-size:16px;display:inline-block;color:#2e3336;height:auto;width:94%;text-align: left;margin-top:10px;margin-bottom:5px;}
.promotion-div .title-head span:last-child{font-size:14px;display: inline-block;position: relative;white-space:nowrap;overflow: hidden; text-overflow:ellipsis; width:100%;color:#696969;margin-top:3px;}
.promotion-div .img-show-div{display: inline-block;width:94%;text-align: left;position: relative;}
.promotion-div .img-show-div img{width:100%;height:150px;margin-bottom:0px;}
.promotion-div .img-show-div p{color:#696969;font-family:microsoft yahei;padding-left:5px;padding-right:0px;font-size:12px;}
.promotion-div .img-show-div .show-p p{display: inline-block;width: auto;height:auto;margin-top:0;marign-bottom:0;}
.promotion-div .img-show-div .show-p{color:#696969;font-size:14px;width:100%;height:20px;overflow: hidden;margin-top:5px;border:0;display: inline-block;position: relative;white-space:nowrap; text-overflow:ellipsis; }
.promotion-div .img-show-div div{margin-top:5px;border-top:1px solid #eeeeee;}
.promotion-div .img-show-div div a{font-family:microsoft yahei;float:right;font-size:12px;margin-top:8px;color:#313131;}
.promotion-div .img-show-div div p{font-family:microsoft yahei;display: inline-block;margin-top:8px;margin-bottom:10px;}
.promotion-div .img-show-div div p span{font-family:microsoft yahei;color:#313131;}

/* START follow layer Popup page */
.followLayerPopupVote {display:none;z-index:999999; position:absolute; top:0; left:0; right:0; bottom:0; background:rgba(0, 0, 0, 0.8); min-height:568px;}
.followLayerPopupVote img {position:absolute; width:auto; height:20px;cursor:pointer;right:10px;top:10px;}
.followLayerPopupVote .title {position:absolute; top:10%; left:50%; margin:0 0 0 -140px; height:20px; width:280px; font-size: 14px;box-sizing:border-box;overflow:hidden;color: #ffffff; text-align: center;}
.followLayerPopupVote .inner {position:absolute; top:10%; left:50%; margin:20px 0 0 -140px; height:445px; width:280px; box-sizing:border-box; background:#434343;-webkit-border-radius: 20px;  -moz-border-radius: 20px;border-radius: 20px;overflow:hidden; text-align: center;}
.followLayerPopupVote .cont-Title {color: #ffffff;position:relative;width:100%;height:30px;text-align:center;font-size: 16px;padding:3px;top:5px;}
.followLayerPopupVote .cont-Title .serchMan {position:absolute; width:auto; height:25px;cursor:pointer;top:2px;right:20px;}
.followLayerPopupVote .cont-Title2 {color: #ffffff;position:relative;width:100%;height:30px;text-align:center;font-size: 12px;padding:3px;top:5px;}
.followLayerPopupVote .cont-Title2 .wechatId {font-size:16px; left-padding:15px; width:auto; color: #434343; background: url('/front/skin/main/img/icon/wechatidSearch.png') no-repeat 8px 2px #ffffff; background-size: 16px auto;}
.followLayerPopupVote .follow {color: #ffffff;position:relative;width:80%;left:10%;height:25px;line-height: 25px;background:#06be04;-webkit-border-radius: 5px;  -moz-border-radius: 5px;border-radius: 5px;text-align:center;font-size: 16px;padding:2px;}
.followLayerPopupVote .inner .cont-Body .shareList {text-align: center;}
.followLayerPopupVote .inner .cont-Body .shareList img {position:relative;top:50%; width:60%;height:auto;cursor:pointer; margin-left:10%;}
.followLayerPopupVote .close {position:absolute; bottom:0; right:0; height:30px; line-height:30px; padding:0 10px; color:#4a433b;}
/* END follow layer Popup page */

</style>

<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 34,				//VOTE_LIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

$(function(){

	//indexErr();
	
});
function indexErr() {
	<c:if test="${loginFlag eq 0 }">
		fn_followLayerVoteShow();	
		return;
	</c:if>
}

function fn_followLayerVoteShow() {
	var windowHeight = $(this).height();
	var scrollTop = $(this).scrollTop();
	window.scrollTo(0,document.body.scrollTop);
	$('.promotion-all').attr('style','height:' + (windowHeight-40) + 'px;overflow:hidden;');
	$('#container').addClass('on layerZindex');
	$('.followLayerPopupVote').show();
}

function fn_followLayerVoteHide() {
	$('.promotion-all').attr('style','');
	$('#container').removeClass('on layerZindex');
	$('.followLayerPopupVote').hide();
}

function goPage(pageId,voteId,typeName) {

	if('${loginFlag}'=='0'){
		
		fn_followLayerVoteShow();
		return;
		
	}else{
		
		if (typeName == '') {
			
			location.href = "/front/vote/"+pageId+".htm?voteId="+voteId;
		} else {
			
			location.href = "/front/vote/"+pageId+".htm?voteId="+voteId+"&typeName="+typeName;
		}
	}
}

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
    	
    	var param={pageCurr:pageCurr,proId:null,proType:'I',proWinType:null,searchTitle:null};
    	
    	$.ajax({
    		data : param,
    		dataType : "json",
    		type : "GET",
    		cache : false,
    		url : "/front/vote/getNextPromotion.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
    		success : function(data){
    			
    			if(data.list.length != 0) {
    				
    				for(var i=0;i<data.list.length;i++) {
    					
    					var detail = data.list[i];
    					var htm = '';
    					
    					if(detail.VOTE_TYPE == "Y") {
    						
    						if(detail.FLAG_SELECT > 0){
    							
    							htm+='<div class="promotion-div" onclick="goPage(\'voteResult\',\'' + detail.VOTE_ID + '\',\'' + 你已投票 + '\')">';
    						} else {
    							
    							if(detail.VOTE_PER=='all_peo') {
    								
    								htm+='<div class="promotion-div" onclick="goPage(\'vote\',\'' + detail.VOTE_ID + '\',\' \')">';
    							} else {
    								
    								if(detail.FLAG_FOCUS==1) {
    									
    									htm+='<div class="promotion-div" onclick="goPage(\'vote\',\'' + detail.VOTE_ID + '\',\' \')">';
    								} else {
    									
    									htm+='<div class="promotion-div" onclick="goPage(\'voteResult\',\'' + detail.VOTE_ID + '\',\'' + 未关注,不可投票 + '\')">';
    								}
    							}
    						}
    					} else {
    						
    						htm+='<div class="promotion-div" onclick="goPage(\'voteResult\',\'' + detail.VOTE_ID + '\',\'' + 活动已结束 + '\')">';
    					}
    					htm+='<div class="title-head" >'+
				    			'<span>'+detail.VOTE_NM +'</span><br>'+
				    			'<span>'+detail.CREATED_DT +'</span>'+
				    			'</div><div class="img-show-div" >'+
				    						'<img src="'+detail.IMGURL +'"/>'+
				    						'<div class="show-p">'+detail.VOTEDESC+'</div>'+
						    				'<div>'+
						    					'<p>查看全部</p>'+
						    					'<a>></a>'+
						    				'</div>'+	
				    				   '</div>'+
				    		 '</div>';
				    			
    					$(".promotion-all").append(htm);
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

function loadFunciton(){
	
	$(".show-p").each(function(){
		
		var pageCount=$("#pageCount").val();
		if(pageCount==0){
			alert("没有数据");
			return;
		} 
		var proDesc=$(this).html();
	});
}
</script>

</head>

<body>
	<div class='top-height-value'></div>
	<div class="promotion-all">
		<c:forEach items="${list }" var="list" varStatus="status"> 
			<c:choose>
				<c:when test="${list.VOTE_TYPE eq 'Y'}">
					<c:choose>
						<c:when test="${list.FLAG_SELECT > 0 }">
							<div class="promotion-div" onclick="goPage('voteResult','${list.VOTE_ID}','你已投票')">
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${list.VOTE_PER eq 'all_peo' }">
									<div class="promotion-div" onclick="goPage('vote','${list.VOTE_ID}','')">
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${list.FLAG_FOCUS==1}">
											<div class="promotion-div" onclick="goPage('vote','${list.VOTE_ID}','')">
										</c:when>
										<c:otherwise>
											<div class="promotion-div" onclick="goPage('vote','${list.VOTE_ID}','未关注，不可投票')">
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="promotion-div" onclick="goPage('voteResult','${list.VOTE_ID}','活动已结束')">
				</c:otherwise>
			</c:choose>
			<div class="title-head" >
				<span>${list.VOTE_NM }</span><br>
				<span>${list.CREATED_DT }</span>
			</div>
			<div class="img-show-div" >
				<img src="${list.IMGURL }"/>
				<div class="show-p">${list.VOTEDESC }</div>
				<div>
					<p>查看全部</p>
					<a>></a>
				</div>	
			</div>
		</div>
		</c:forEach> 
		<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>
	</div>

	<!-- mainLayerPop -->
	<div class="followLayerPopupVote" style="display:none;">
		<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="fn_followLayerVoteHide();"/>
		<div class="title">
			您需要加关注后才能投票~
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
	
	<!-- <a href="#" class="bottom_totop">top</a> -->
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
			    title: '북배회원투표', // 分享标题
			    link: 'http://bbc.manhuaking.cn/w/redirect_uri.htm?redirect_uri=https%3a%2f%2fopen.weixin.qq.com%2fconnect%2foauth2%2fauthorize%3fappid%3dwxa1bf729b5d982ae1%26redirect_uri%3dhttp%253A%252F%252Fbbc.manhuaking.cn%252Fw%252Ft.htm%253Fk%253DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%2526tu%253Dhttp%25253A%25252F%25252Fbbc.manhuaking.cn%25252Ffront%25252Fvote%25252FvoteList.htm%25253FshopId%25253D68%26response_type%3dcode%26scope%3dsnsapi_base%26state%3dn%23wechat_redirect', // 分享链接
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
			    title: '북경배드민턴클럽 회원투표', // 分享标题
			    desc: '투표 부탁드립니다~', // 分享描述
			    link: 'http://bbc.manhuaking.cn/w/redirect_uri.htm?redirect_uri=https%3a%2f%2fopen.weixin.qq.com%2fconnect%2foauth2%2fauthorize%3fappid%3dwxa1bf729b5d982ae1%26redirect_uri%3dhttp%253A%252F%252Fbbc.manhuaking.cn%252Fw%252Ft.htm%253Fk%253DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%2526tu%253Dhttp%25253A%25252F%25252Fbbc.manhuaking.cn%25252Ffront%25252Fvote%25252FvoteList.htm%25253FshopId%25253D68%26response_type%3dcode%26scope%3dsnsapi_base%26state%3dn%23wechat_redirect', // 分享链接
			    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.jpg', // 分享图标
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