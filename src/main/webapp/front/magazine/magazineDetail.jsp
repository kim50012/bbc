<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> <!-- , target-densitydpi=medium-dpi" -->
<meta name="format-detection" content="telephone=no" />
<title>${sessionScope.sessionSkin.shopName}</title>
<%@ include file="/front/skin/common.jsp"%>


<style type="text/css">
.magazine-detail-content img {width: 100%;}
.magazine-detail-content * {
  max-width: 100%!important;
  box-sizing: border-box!important;
  -webkit-box-sizing: border-box!important;
  word-wrap: break-word!important;
}
.detail_footer{
 	position: fixed; 
 	left: 0; 
 	bottom: 0; 
	height: 40px;
	line-height:40px;
	width: 100%;
 	z-index: 1; 
	text-align: center;
	white-space: nowrap;
	box-sizing: border-box;
/* 	padding: 5px 10px 5px 10px; */
	border-top:1px solid #D6D4D5; 
	display: block;
 	background: #ECECEC; 
}
.message_total{
 	width: 25%; 
	float: left;
	border-right:1px solid #D6D4D5; 
}
.share_total{
	width: 24%;
	float: left;
}
.shareto{
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
img{
	padding: 0;
	border: 0;
}
</style>
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
		        		,'onMenuShareQQ'			//获取“分享到QQ”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareWeibo'			//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
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
	  		    title: '${shareInfo.title}', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    	share();
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		/* wx.onMenuShareAppMessage({
	  		    title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标
	  		    type: 'link', // 分享类型,music、video或link，不填默认为link
	  		    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		        alert('success');
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	 alert('error');
	  		    }
	  		}); */
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '${shareInfo.title}', // 分享标题
	  		    desc: '${shareInfo.desc}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    /* title: '媒体发布会邀请函', // 分享标题
	  		    desc: '薄艺硬屏/薄艺（Art Slim）电视媒体发布会 2015.4.15 北京', // 分享描述
	  		    link: '${appInfo.url}/front/brand/lgdisplay150330/invitation.html', // 分享链接
	  		    imgUrl: '${appInfo.url}/front/brand/lgdisplay150330/pic300.jpg', // 分享图标 */
	  		    //type: 'music', // 分享类型,music、video或link，不填默认为link
	  		    //dataUrl: '${appInfo.url}/uploads/test/1342944231423576861128.mp3', // 如果type是music或video，则要提供数据链接，默认为空
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    	share();
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	// alert('error 11');
	  		    }
	  		});
	  		
	  		//获取“分享到QQ”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareQQ({
	  			/* title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标 */
	  		    title: '${shareInfo.title}', // 分享标题
	  		    desc: '${shareInfo.desc}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		       // 用户确认分享后执行的回调函数
	  		    	share();
	  		    },
	  		    cancel: function () { 
	  		       // 用户取消分享后执行的回调函数
	  		    	//alert('error 2');
	  		    }
	  		});
	  		
	  		//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareWeibo({
	  			/* title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标 */
	  		   title: '${shareInfo.title}', // 分享标题
	  		    desc: '${shareInfo.desc}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		       // 用户确认分享后执行的回调函数
	  		    	share();
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	//alert('error 4');
	  		    }
	  		});
	  		
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

	  	});
	  
});
function share(){
	var param={
			blogId:'${magazineList.BLOG_ID}'
			,flag:'SHARE'
			,shopId:'${magazineList.SHOP_ID}'
	};
   	$.ajax({
   		data : param,
   		dataType : "json",
   		type : "GET",
   		cache : false,
   		url : "/front/magazine/blogLikeShareInsert.htm", 
   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
   		success : function(data){
   			var shareCount=parseInt($("#detail_share_count").html());
   			$("#detail_share_count").html(shareCount+1);
   		}
   	});
}
</script>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 9,				//BLOG_DETAIL
	 pageId : '${magazineList.BLOG_ID}' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

$(function(){
	
	//magazineRandomAjaxList();
	
	$("#submit-comment").click(function(){
		
		var reviewPoint = 0;
		var mesContent=$("#mesContent").val();
		var magazineId=$("#magazineId").val();
		var shopId=$("#shopId").val();
		/* var reviewCnt=Number(${requestScope.reviewCnt});
		if(reviewPoint=='0' && reviewCnt==0){
			alert("请填写评分");
			return;
		} */
		var param={reviewPoint:reviewPoint
				,mesContent:mesContent
				,magazineId:magazineId};
		$.ajax({
			data:param,
			dataType:"json",
			type:"GET",
			cache:false,
			url:"/front/magazine/saveMagazineReview.htm",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				if(data.ret=="success"){
					alert("评论成功");
					window.location.href="/front/magazine/magazineDetail.htm?shopId="+shopId+"&magazineId="+magazineId;
					//reviewAjaxList();
				}else{
					alert("评论失败，请重新操作");
				}
			},
			error:function(a, msg, c) {
				//alert("error: " + msg);
			}
		}); 
	});
	
	/* $(window).resize(function(){
		resizeImg();
	});
	resizeImg(); */
});

function magazineRandomAjaxList(){

	$.ajax({
		//data : param,
		dataType : "json",
		type : "GET",
		cache : false,
		url : "/front/magazine/magazineRandomAjaxList.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			
			if(data.list.length!=0){
				
				var j=0;
				for(var i=0;i<data.list.length;i++){
					if(data.list[i].BLOG_ID != "${magazineList.BLOG_ID }"){
						j++;
						if(j==5) return;
						$("#randImg"+(j)).attr("src", data.list[i].BLOG_FILE_URL);
						$("#randTit"+(j)).html(data.list[i].BLOG_TITLE);
						$(".randclick"+(j)).attr("onclick","doLoadDtlPage('"+data.list[i].SHOP_ID+"','"+ data.list[i].BLOG_ID+"')");
					}
				}
			}
		},
		error : function(a, msg, c) {
			//alert("error: " + msg);
		}
	});
}

function reviewAjaxList(){
	
	$('#foo').fadeIn(200);
	var magazineId = $('#magazineId').val();

	var param={
			magazineId : magazineId
			   };
	$.ajax({
		data : param,
		dataType : "json",
		type : "GET",
		cache : false,
		url : "/front/magazine/magazineReviewAjaxList.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			
			if(data.list.length!=0){
				$('#reviewListDiv1').html("");
				
				
				for(var i=0;i<data.list.length;i++){
					var htm='<div class="magazine-container2 magazine-review"  >'+
		    				'	<div class="magazine-review-row">'+
		    				'		<div  class="magazine-review-imgbox">'+
		    				'			<div class="magazine-review-img" style="background-image: url('+
		    							data.list[i].HEADIMGURL+
		    				'			) ;background-size:40px 40px;border:solid 1px #bababa;">'+
							'			</div>'+
							'		</div>'+
							'		<div class="magazine-right" >'+
							'			<div class="mgz-font1 txt">'+
											data.list[i].CUST_NICK_NM+
							'			</div>'+
							'			<div class="mgz-font2 txt">'+
											data.list[i].CREATED_DT+
							'			</div>'+
							'			<div class="mgz-font3 txt">'+
											data.list[i].REVIEW_DESC+
							'			</div>'+
							'		</div>'+
							'	</div>'+
							'</div>'+
							'<div style="border-bottom: 1px solid #C8C8C8;line-height: 1px;"></div>';
		    		
					$("#reviewListDiv1").append(htm);
				}
			}
			$('#foo').fadeOut(200);
		},
		error : function(a, msg, c) {
			$('#foo').fadeOut(200);
			//alert("error: " + msg);
		}
	});
}

function resizeImg() {
	
	$('.row').each(function(i){ 
		var divWidth =  $(this).width();
		var imgWidth =  $(this).find(".magazine-left").width();
      	var wd = Math.round(divWidth/100*44)-5;
      	if(wd!=imgWidth){
    		$(this).find(".magazine-left").find("img").width(wd);
      	}
	});
}

function doLoadDtlPage(shopId, magazineId){
	window.location.href="/front/magazine/magazineDetail.htm?shopId="+shopId+"&magazineId="+magazineId;
}

function zan(flg){
	var param={
			blogId:'${magazineList.BLOG_ID}'
			,flag:'LIKE'
			,shopId:'${magazineList.SHOP_ID}'
	};
   	$.ajax({
   		data : param,
   		dataType : "json",
   		type : "GET",
   		cache : false,
   		url : "/front/magazine/blogLikeShareInsert.htm", 
   		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
   		success : function(data){
   			var likeCount=parseInt($("#detail_zan_count").html());
   			if($("#img_like").attr("src")=="/front/skin/nongshim/img/icon_zan1.png"){
   				$("#img_like").attr("src","/front/skin/nongshim/img/icon_zan2.png");
				$("#detail_zan_count").html(likeCount-1);
   			}else{
   				$("#img_like").attr("src","/front/skin/nongshim/img/icon_zan1.png");
   				$("#detail_zan_count").html(likeCount+1);
   			}
//    			if(flg=='zan'){
//    				$("#img_like").attr("src","/front/skin/nongshim/img/icon_zan1.png");
//    				$("#detail_zan_count").html(likeCount+1);
//    			}else{
//    				$("#img_like").attr("src","/front/skin/nongshim/img/icon_zan2.png");
//    				$("#detail_zan_count").html(likeCount-1);
//    			}
   				
   		}
   	});
}

function toshare(flg){
// 		share();
	if(flg=='1'){
		$("#share").css("display","block");
	}else{
		$("#share").css("display","none");
	}
}

</script>

</head>
<body >

	<!-- container -->
	<div class="magazine-body">
		<section id="contents">
		
			<!-- detail contents -->
			<div class="magazine-detail-content">
				<div class="magazine-detail-title">
					${magazineList.BLOG_TITLE }
				</div>
				<div class="magazine-detail-desc1">
					发布日期 : ${magazineList.CREATED_DT}
				</div>
				<div class="magazine-detail-desc2">
					作者 : ${magazineList.CREATED_ID}
				</div>
			   
				<div class="magazine-detail-content">
				<c:forEach var="list" items="${magazineDetailList }" varStatus="status"> 
					<c:if test="${list.HEADER_FLG == 'Y' }">
						${list.HEADER_TAG}
					</c:if>
						
						<c:if test="${list.TMPL_NO eq '99' }">
						${list.TXT01 }
						</c:if>
						<c:if test="${list.TMPL_NO ne '99' }">
						${list.BODY_TAG }
						</c:if>
						
					<c:if test="${list.FOOTER_FLG=='Y'}">
						${list.FOOTER_TAG}
					</c:if>	
				</c:forEach>
				</div>
			</div>
			
		</section>
		
		<div style="height:40px;">
			<br>
			<ul>
				<li onclick="window.location.href='/front/magazine/magazineList.htm?shopId=${magazineList.SHOP_ID }';" style="float:left; width:50%; padding-left:3px; box-sizing:border-box; text-align:left; color: #6280a7">阅读原文</li>
				<li style="float:left; width:50%; padding-right:3px; box-sizing:border-box; text-align:right;">读取 &nbsp; ${magazineList.READ_CNT}</li>
			</ul>
			<br>
		</div>	
		
		<section>
			
				
			<!-- sub title2 -->	
			<div class="magazine-title2">
				<img alt="" src="/front/skin/demo/img/magazine/sub_title_magazine_reply.png">
					<div style="height:10px;"> </div>
			</div>
				
			<!-- review list-->
			<div id="reviewListDiv1" >
				<c:forEach var="reviewList" items="${reviewList }" varStatus="status">
					<div class="magazine-container2 magazine-review" >
						<div class="magazine-review-row">
							<div  class="magazine-review-imgbox">
								<div class="magazine-review-img" style="background-image: url(${reviewList.HEADIMGURL}) ;background-size:40px 40px;border:solid 1px #bababa;">
								</div>
							</div>
							<div class="magazine-right" >
								<div class="mgz-font1 magazine-txt">${reviewList.CUST_NICK_NM }</div>
								<div class="mgz-font2 magazine-txt">${reviewList.CREATED_DT }</div>
								<div class="mgz-font3 magazine-txt">${reviewList.REVIEW_DESC }</div>
							</div>
						</div>
					</div>
					<div style="border-bottom: 1px solid #C8C8C8;line-height: 1px;"></div>
				</c:forEach>
			</div>
			
			<!-- review add click-->		
			<c:choose>
				<c:when test="${magazineList.REVIEW_CNT<= 3}">
					<div class="magazine-review-add">
						<img alt="" src="/front/skin/demo/img/magazine/ico_comment.png" style="width: 22px;vertical-align: middle;">&nbsp;&nbsp;
						<span>全部 ${magazineList.REVIEW_CNT } 条评论</span>	
					</div>
				</c:when>
				<c:otherwise>
					<div class="magazine-review-add" onclick="javascript:reviewAjaxList();">
						<img alt="" src="/front/skin/demo/img/magazine/ico_comment.png" style="width: 22px;vertical-align: middle;">&nbsp;&nbsp;
						<span>全部 ${magazineList.REVIEW_CNT } 条评论，点击查看更多</span>	
					</div>
				</c:otherwise>
			</c:choose>
			
			<c:if test="${loginFlag eq 1 }">
				<div class="magazine-container2 magazine-review-message">
					<div style="clear: both;">
						<div  style="width: 60px;display:inline-block;float: left">
						<div style="width: 40px;height: 40px;border-radius:50%;background-image: url(${custImgUrl}) ;background-size:40px 40px;border:solid 1px #bababa;">
						</div>
					</div>
					<div class="magazine-right" style="width: 500px;line-height: 42px;" >
						<!-- <textarea rows="1" cols="50" placeholder="" id="mesContent"></textarea> -->
						<input type="text" id="mesContent" name="mesContent" style="width:80%;"/>&nbsp;&nbsp;
						<img alt="" src="/front/skin/demo/img/magazine/ico_comment.png" style="width: 22px;vertical-align: middle;" id="submit-comment">
					</div>
					</div>
				</div>
				<div style="border-bottom: 1px solid #C8C8C8;line-height: 1px;"></div>
			</c:if>
				
			<br />
			<br />
			<br />
	
		</section>
	</div>
	<div  class="detail_footer"> 
		<div class="message_total">
			<c:if test="${magazineStatis.LIKE_FLAG == 0}">
				<img alt="" id="img_like" onclick="zan('zan');"  src="/front/skin/nongshim/img/icon_zan2.png" style="padding-top: 10px;">
			</c:if>
			<c:if test="${magazineStatis.LIKE_FLAG != 0}">
				<img alt="" id="img_like" onclick="zan('cancel');" src="/front/skin/nongshim/img/icon_zan1.png" style="padding-top: 10px;">
			</c:if>
			<span id="detail_zan_count">
				${magazineStatis.LIKE_CNT}	
			</span>
		</div>
		<div class="message_total" >
			<img alt=""  src="/front/skin/nongshim/img/icon_mess1.png" style="padding-top: 10px;">
			${magazineStatis.REVIEW_CNT }	
		</div>
		<div class="message_total" onclick="toshare('1')">
			<img alt=""  src="/front/skin/nongshim/img/icon_share2.png" style="padding-top: 10px;">
			<span id="detail_share_count">
				${magazineStatis.SHARE_CNT }
			</span>	
		</div>
		<div class="share_total" >
			<span style="color: #186686;">阅读</span>
			${magazineStatis.READ_CNT }	
		</div>
	</div>
<%-- <%@ include file="/front/skin/common_navigation.jsp"%> --%>

<input type="hidden" id="magazineId" name="magazineId" value="${magazineList.BLOG_ID }"/>
<input type="hidden" id="shopId" name="shopId" value="${magazineList.SHOP_ID }"/>
	
<div id="share"  class="shareto">
	<img alt="" src="/front/skin/koreanair/img/newroutes/share_text.png" width="100%">
	
	<img alt="" src="/front/skin/koreanair/img/newroutes/btn_confirm.png" width="50%" style="margin-top: 120px;" onclick="toshare('2');">
	
</div>
</body>
</html>
