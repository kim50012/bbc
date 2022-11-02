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
<title>吃货厨艺秀</title>
<%@ include file="/front/skin/common.jsp"%>
<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script>
<link rel="stylesheet" type="text/css" href="/front/bbs/css/list.css" />
<style type="text/css">
body{background-color: #f0eff5;font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
.contant{width: 100%;height: 100%;}
.text-title{width: 100%;height: 43px;line-height: 43px;}
.text-title textarea{width: 100%;height: 100%;border:0;vertical-align: middle;font-size: 14px;padding: 8px;padding-right: 10px}
.text-body{width: 100%;height: 125px;}
.text-body textarea{width: 100%;height: 100%;border:0;vertical-align: middle;font-size: 14px;}
.imgDiv{width: 100%;height:auto; min-height: 90px;background-color: #ffffff;position: relative;}
.imgshow{width:78px;height:78px;border: 1px solid #d6d6d6;text-align: center;line-height:78px;float: left;margin-left: 10px;margin-bottom:10px; position: relative;}
.imgshow span{font-size: 40px;color: #d6d6d6;display: inline-block;}
.empty{width: 100%;height: 18px;border-top: 1px solid #a7aaa3;}
.gongyue-title{width: 100%;height: 43px;background-color: #eef4e8;border-top: 2px solid #9dc115;line-height: 43px;}
.gongyue-title span{margin-left: 10px}
.gongyue-title img{width: 18px;height: 10px;position: absolute;right:10px;margin-top: 16px }
.gongyue-text{width: 100%;min-height: 190px;background-color: #ffffff;font-size: 12px;display: none;margin-top: -10px;}
.titleOne{width: 100%;min-height: 67px;}
.titleOne table td{height: 18px;line-height: 18px}
.titleTwo{width: 100%;min-height: 85px;}
.titleTwo table td{height: 18px;line-height: 18px}
.foot-text{width: 100%;height: 86px;background-color: #ffffff;border-top: 1px solid #d6d6d6}
.foot-text table td{height: 43px}
.foot-text table td input{width: 100%;border: none;font-size: 14px;padding: 0}
.qianzi{width: 100%;height: 43px;background-color: #ffffff;line-height: 43px;border-top: 1px solid #e5e5e5; }
.qianzi span{margin-left: 10px;width:100% }
.btn{width: 100%; height: 43px;}
.btn-icon{
	display:inline-block; 
	width: 100%;
	height: 43px;
	position: relative; 
	cursor: pointer;
	background-repeat: no-repeat;
	background-position: center;
	text-align:center;
	background-color:#9dc213;
	line-height:43px;
	font-size: 16px;
	margin-top: 0;
	border-radius:0
}

#imgInput{width: 100%;height: 100%}
.close{
	position: absolute;
	top:-10px;
	right: -9px;
	color: #ffffff;
	background-color:#d6d6d6; 
	width: 16px;
    height: 16px;
    -moz-border-radius: 8px;
    -webkit-border-radius: 8px;
    border-radius: 8px;
    text-align: center;
   	line-height: 16px;
   	font-size: 16px;
   	display: none;
	}
.tishi{
width:38%;
text-align: center;
position: absolute;
top:212px;
margin-left: 30%;
display: none;
}
.tishi img{width: 100%}
.wiat{
width:100%;
height:100%;
position: absolute;
display: none;
text-align: center;
}
.wiat img{
height: 30px;
width: 30px;
margin-top: 70%
}

.upload-img{
	width: 100%;
	height: 100%;
}
.coupon{
	text-align: center; 
	position:fixed; 
	display:none;
	top: 0px; 
	right:0px; 
	bottom:0px;
	filter: alpha(opacity=60); 
	background-color: #000000;
   	z-index: 10000; 
   	left: 0px; 
   	opacity:0.7; 
   	-moz-opacity:0.7;
}
.message{
	position:fixed; 
	top: 200px; 
 	display:none;
	z-index:100000;
	background: #fff;
	left:15%;
	width:70%;
	-moz-border-radius: 5px;      /* Gecko browsers */
    -webkit-border-radius: 5px;   /* Webkit browsers */
    border-radius:5px;            /* W3C syntax */
}
.warn{
	height: 43px;
	line-height:43px;
	color: red;
	padding-left: 10px;
	font-size: 12px;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6
}
.btn-icon-poupe{
	display:inline-block; 
	width: 100%;
	height: 30px;
	position: relative; 
	cursor: pointer;
	background-repeat: no-repeat;
	background-position: center;
	text-align:center;
	background-color:#ffffff;
	line-height:30px;
	font-size: 16px;
	margin-top: 6px;
	border-radius:0;
	border: 1px solid #d6d6d6;
	color: black;
}
.poupe{
	width: 60%;	
	position: absolute;
	top: 150px;
	margin-left:20%;
	background-color: #ffffff;
	display: none;
	z-index: 100000;
}
.poupe .text{
	padding:15px;
	text-align: center;
	line-height: 1.5
}
.poupe .bottom{
	border-top: 1px solid #d6d6d6;
	width: 100%;
	height: 40px;
	text-align: right;
	line-height: 40px
}
.poupe .bottom a{
	width: 100%;
	height: 100%;
	border: 0
}

.wiat-poupe{
	width:100%;
	height:100%;
	position: absolute;
	display: none;
	text-align: center;
}
</style>

<script type="text/javascript">
//-- Common Page usage Counting
counter({
	 pageTp : 32,				//NEWSFEED_ DETAIL
	 pageId : '${requestScope.map.NEWS_ID}' || '',
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
function toMyPage(){
	window.location.href='/front/customer/myPage.htm?shopId=${sessionScope.sessionSkin.shopId}';
}
function closeTip(){
	var bbsType='${requestScope.bbsType}';
	$("#coupon").css("display","none");
	$(".message").css("display","none");
	$(".tishi").show();
	window.location.href='/front/bbs/list.htm?shopId='+${sessionScope.sessionSkin.shopId}+"&bbsType="+bbsType;
}
 
var num=0;
 
function deleteImg(num){
	$("#preview"+num).remove();
	$("#url"+num).remove();
}

function closePouoe(){
	$(".wiat-poupe").bPopup().close();
	$(".poupe").hide();
}
function save(){
	var title=$(".text-title textarea").val();
	var body=$(".text-body textarea").val();
	
	//var qianMing=$("#qianMing").val();
	//var phone=$("#phone").val();
	if(title==""){
		alert("标题不能为空.");
		return;
	}
	if(body==""){
		alert("美食见解不能为空.");
		return;
	}
	if(body.length<100){
		alert("美食见解字数不满100字或照片不足5张，请确认后上传，谢谢~");
		 return;
	}
	
	var imgId1 = imgId2 = imgId3 = imgId4 = imgId5 = imgId6 = imgId7 = imgId8 = imgId9 = imgId10 = 
		imgId11 = imgId12 = imgId13 = imgId14 = imgId15 = imgId16 = imgId17 = imgId18 = imgId19 = imgId20  = '';
	
	var count=0;
	$('.js-img-show').each(function(idx){	
		if(idx < 20){
			eval('('+ 'imgId' + (idx+ 1) + ' = ' + $(this).data('fileId') + ' )');
		}
		count++;
	});
	if(count < 5){
		alert("美食见解字数不满100字或照片不足5张，请确认后上传，谢谢~");
		 return;
	}
	
	var bbsType='${requestScope.bbsType}';
	
	$(".wiat").bPopup({
	   	modalClose: false,//弹出框深色区域，关闭的响应
  　		modalColor: "#aeaeae",
        opacity: 0.3,
        fadeSpeed: 'slow', //弹出速度  string ('slow'/'fast') or int (1500)   
	   	closeClass:'exitPoup'
	});
	var param={
			title:title,
			bbsType:bbsType,
			body:body,
			//qianMing:qianMing,
			//phone:phone,
			imgId1: imgId1,
			imgId2: imgId2,
			imgId3: imgId3,
			imgId4: imgId4,
			imgId5: imgId5,
			imgId6: imgId6,
			imgId7: imgId7,
			imgId8: imgId8,
			imgId9: imgId9,
			imgId10: imgId10,
			imgId11: imgId11,
			imgId12: imgId12,
			imgId13: imgId13,
			imgId14: imgId14,
			imgId15: imgId15,
			imgId16: imgId16,
			imgId17: imgId17,
			imgId18: imgId18,
			imgId19: imgId19,
			imgId20: imgId20
	};
	$.ajax({
		data:param,
		dataType : "json",
		type : "post",
		cache : false,
		url : "/front/bbs/save.htm", 
		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			if (data.result == 'success'){				
				if('${loginFlag}'=='0'){
					fn_followLayerBbsShow();
					return;
				}else{	
					$(".wiat").bPopup().close();
					//$(".btn").hide();
					$(".tishi").show();
					window.location.href='/front/bbs/list2.htm?shopId='+${sessionScope.sessionSkin.shopId}+"&bbsType="+bbsType;
				}
			} else if (data.result == 'file'){
				alert("上传失败");
			}
		},
		error : function(a, msg, c){
			alert("error: " + msg);
		}
	});
}
 
</script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

/*************************************************/
/****************  图像接口  **********************/
/*************************************************/
// 图片接口
//拍照、本地选图
var images = {
  localId: [],
  serverId: []
};

//拍照或从手机相册中选图接口
function chooseImage(){
  	wx.chooseImage({
    	success: function (res) {
    		images.localId = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
    		//alert('已选择 ' + res.localIds.length + ' 张图片');
    		
    		/* if(res.localIds.length > 5){
    			alert('您选择了多张图片，将只上传前5张图片!');
    		} */
    	}
    	,fail: function(res){
    	}
    	,complete: function(res){
    		uploadImage();
    	}
    	,cancel: function(res){
    	} 
	});
}

//上传接口
function uploadImage(){
   if (images.localId.length == 0) {
      //alert('请先选择图片');
      return;
    }  
	
   var i = 0, length = images.localId.length; 
   images.serverId = [];
   var count=0;
   $('.js-img-show').each(function(){
	   count++;
	});
   var imgCount = parseInt(count) + parseInt(length);
   if(parseInt(imgCount) > 20){
	    alert("最多上传20张图片");
		var num = 20-parseInt(count);
		images.localId = _.first(images.localId,num);
	}else{
		images.localId = _.first(images.localId,length);
	}
			
   
	function upload() {
		
		var imgId = images.localId.shift();
		if(!!imgId){
			wx.uploadImage({
	        	localId: imgId,
	        	success: function (res) {
	 		      	$.ajax({
	 		    		async: false,  
		        	 	data:{
		        	 		shopId: '${appInfo.shopId }',
		        	 		mediaId: res.serverId,
		        	 		fileType: 1,   //1:图片  2：语音
		        	 		date : new Date()
		        	 	},
		 				type : "POST",
		 				url : "/wx/media/download.htm",
		 				success : function(res) {
	 					 	if(res.success){
	 							/***************************************************/
	 						 	/********上传之后会返回fileId 后续操作继续***********/
	 						 	/***************************************************/
	 						 	// alert('图片上传成功');
	 							var fileId = res.data.fileId;
	 							var fullUrl = res.data.fullUrl;
	 							//$("#imgId").val(res.data.fileId);
	 							//$("#js-show-uploaded-img").attr('src',res.data.fullUrl);
	 					
		 						var imgItem = '<div class="imgshow js-img-show" id="preview' + fileId + '" data-file-id="' + fileId + '">' 
							 				+ '<div class="close" onclick="deleteImg(' + fileId + ');">x</div>'
							 				+ '<img class="upload-img" alt="" src="' + fullUrl + '"/>'
							 				+ '</div>';
		 						
		 						$('.js-img-add').before(imgItem);
		 					 
					 		    $(".imgshow").each(function(){
					 		    	if($(this).find('img').length>0){
					 		    		$(this).find(".close").show();
					 		    		$(this).css("border","0");
					 		    	}
					 		    });
		 					}//end if
	 					},
		 				error : function(xhr, status, e) {
		 					alert("error: " + status);
		 				}
	  				});
	          
	 		  		//i++;
		          
	          		//if (i < length) {
	            		upload();
	          		//}
	        	},
		        fail: function (res) {
		          alert(JSON.stringify(res));
		        }
	      	});
		}
    }
   
   	upload();
}
 
 

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
		        		,'chooseImage'				//拍照或从手机相册中选图接口
		        		,'uploadImage'				//上传图片接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
	  		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareTimeline({
	  		    title: '分享味蕾的快乐，为我点赞，一起品美食~', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}/front/bbs/images/bbsType${requestScope.bbsType}.png', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '圃美多', // 分享标题
	  		    desc: '分享味蕾的快乐，为我点赞，一起品美食~', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${basePath}/front/bbs/images/bbsType${requestScope.bbsType}.png', // 分享图标
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
</head>
<body>
	<div class="contant">
 
		<div class="text-title">
			<textarea rows="1" cols="10" maxlength="30" placeholder="标题…"></textarea>
		</div>
		<div class="text-body">
			<textarea rows="5" cols="10" placeholder="美食见解……(不少于100字)"></textarea>
		</div>
		<div style="width: 100%;height: 10px;background-color: #ffffff"></div>
		<div class="imgDiv js-img-warp">
			<div class="imgshow js-img-add" id="preview" onclick="chooseImage();">
				<div class="close" onclick="deleteImg(this);">x</div>
				<span>+</span>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="warn">
			请确认图片大于5张，字数大于100字之后上传！
		</div>
		<div class="btn">
			<a href="javascript:save();" class="btn-icon" >马上上传</a>
		</div>
	</div>
	<div class="wiat"><img alt="" src="/front/skin/nongshim/img/wiat.gif"></div>
	<div class="tishi"><img alt="" src="/front/bbs/images/success.png"></div>
	
</body>
</html>