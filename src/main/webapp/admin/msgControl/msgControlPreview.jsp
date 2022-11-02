<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0L);

	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="basePath" value="<%=basePath%>" />

<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>图文消息</title>
 <link rel="stylesheet" type="text/css" href="/admin/css/chosen.css" />  
 <link rel="stylesheet" type="text/css" href="/admin/css/select2.css" />
  <link rel="stylesheet" type="text/css" href="/admin/css/jquery-ui.min.css" />  
 <link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="/admin/css/common.css" />  
  <link rel="stylesheet" type="text/css" href="/admin/css/custom.css" />  
  
  <script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/admin/js/CJL.0.1.js"></script>
<script type="text/javascript" src="/admin/js/ImagePreviewd.js"></script>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/admin/js/underscore-min.js"></script>
<script type="text/javascript" src="/admin/js/backbone-min.js"></script>
<script type="text/javascript" src="/admin/js/template.js"></script>
<script type="text/javascript" src="/admin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/admin/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/admin/js/select2.min.js"></script>
<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
<style type="text/css">
	
	.shop-name{
		width:95px;
		vertical-align: top;
		padding-top:18px;
		text-align: right;
	}
	.shop-name span{
		width:80px;
		display:inline-block;  
		white-space:nowrap; 
		text-overflow:ellipsis; 
		overflow:hidden;
	}
	table td pre{
		width:225px;
		whitewhite-space: pre-wrap;  
		whitewhite-space: -moz-pre-wrap; 
		whitewhite-space: -pre-wrap; 
		whitewhite-space: -o-pre-wrap;  
		word-wrap: break-word; 
		whitewhite-space : normal ;
	}
	 .PoupDiv{
	 	width:240px;
	 	min-height:70px;
	 	border:1px solid #c5c5c5;
	 	position:absolute;
	 	background-color: #fff;
	 	z-index:30;
		filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
		-moz-box-shadow: 2px 2px 10px #e0e0e0;
		-webkit-box-shadow: 2px 2px 10px #e0e0e0;
		box-shadow: 0px 0px 10px #e0e0e0;
		left:60px;
		top:25px;
	}
	.dropDown1,.dropDown3,.dropDown2
	 {
	 	width:0;
	 	height:0; 
	 	overflow:hidden;
	 	border-width:10px; 
	 	border-style:dotted dotted solid;  
	 	position:absolute
	 }
	 .PoupDivBody{
	 	position: absolute; 
	 	width:8px; 
	 	height:8px; 
	 	left:-20px; 
	 	top:15px
	 }
	 .dropDown1{
	 	border-color: transparent #c5c5c5 transparent   transparent  ;
	 	top:-0.6px;
	 	z-index:0;
	 }
	 .dropDown3{
	 	border-color: transparent #c5c5c5 transparent  transparent  ;
	 	top:0.5px;
	 	z-index:0;
	 }
	 .dropDown2{
	 	border-color: transparent #ffffff transparent  transparent  ; 
	 	top:0;
	 	z-index:1;
	 }
	 .shop-img img{
	 	width:50px;
	 	height:50px;
	 	border:1px solid #eeeeee;
	 	margin-top:20px;
	 }
	 .preview-div{
	 	width:320px;
	 }
	 .ui-box p{
	 	line-height: 20px;
	 	padding-left:5px;
	 	margin-top:5px;
	 }
	 .ui-box {
	 	position: relative;
	 }
	 .ui-box video{
	 	width:230px;
	 	height:150px;
	 	margin-left:5px;
	 	margin-top:15px;
	 	margin-bottom:10px;
	 	cursor: pointer;
	 }
	 .video-preview{
	 	cursor: pointer;
	 	position: absolute;
	 	top:80px;
	 	left:100px;
	 }
	 .materal-div-out{
	 	width:92%;
	 	margin-left:4%;
	 	border:1px solid #e5e5e5;
	 	margin-top:5px;
	 	margin-bottom:5px;
	 	position: relative;
	 	background-color: #ffffff;
	 }
	 .materal-div-in{
	 	width:92%;
	 	margin-left:4%;
	 	position: relative;
	 }
	 .materal-div-in img{
	 	width:100%;
	 	height:150px;
	 }
	 .materal-div-in span{
	 	width:300px;
	 	white-space:nowrap; 
		text-overflow:ellipsis; 
		overflow:hidden;
	 }
	 .materal-div-in span:first-child{
	 	width:300px;
	 	margin-top:10px;
	 	margin-bottom:0px;
	 	display: inline-block;
	 	font-size:16px;
	 }
</style>
<script type="text/javascript">
	var flag_music=true;
	var audio =document.createElement("audio");
	//音乐播放
	$(function(){
		$("#musicFullUrl").click(function(){
			if(flag_music){	
				audio.src=$("#musicFullUrl").attr("data-musicUrl");
				audio.play();
				flag_music=false;
			}else{
				audio.pause();
				flag_music=true;
			}
		});
	});
	//视频的暂停，播放
	function showVideo(){
		var video = document.getElementById("videoShowNow");
		if(video.paused){
			video.play();
			$("#video_show_img").attr("style","visibility: hidden;");
		}else{
			video.pause();
			$("#video_show_img").attr("style","visibility: visible;");
		}
	}
</script>
</head>
<body style="width:320px;min-width:320px;background-color: #efefef;font-family:microsoft yahei;">
	<c:if test="${requestScope.list[0].SEND_FILE_TYPE != '图文' }">
		<div class="preview-div">
			<div class='shop-img'><img src='${requestScope.list[0].IMG_URL }'/></div>
			<div class="PoupDiv" id="updatePoupDiv}">
		        <div class="PoupDivBody">
		            <div class="dropDown1"></div>
		            <div class="dropDown2"></div>
		            <div class="dropDown3"></div>
		        </div>
		        <div class="ui-box">
				  	 <c:if test="${requestScope.list[0].SEND_FILE_TYPE eq '文本' }">
				  	 	<p>${requestScope.list[0].SEND_MSG_BODY }</p>
				  	 </c:if>
				  	 <c:if test="${requestScope.list[0].SEND_FILE_TYPE eq '图片' }">
				  	 	<img src="${requestScope.list[0].FILE_URL }" style="width:230px;height:150px;margin-left:5px;margin-top:5px;margin-bottom:5px;" />
				  	 </c:if>
				  	 <c:if test="${requestScope.list[0].SEND_FILE_TYPE eq '音频' }">
				  	 	<img src="/admin/images/sendMsgAll/music_play.png" id='musicFullUrl' style="cursor:pointer; border:1px solid #e5e5e5;margin-left:10px;margin-top:5px;" data-musicUrl="${requestScope.list[0].FILE_URL }"/>
				  	 </c:if>
				  	 <c:if test="${requestScope.list[0].SEND_FILE_TYPE eq '视频' }">
				  	 	<video id="videoShowNow" src="${requestScope.list[0].FILE_URL}"  onclick="showVideo();"></video>
				  	 	<img src="/admin/images/myFile/video_play.png" id="video_show_img" class="video-preview" onclick="showVideo();"/>
				  	 </c:if>
				</div>
	    	</div> 
		</div>
	</c:if>
	<c:if test="${requestScope.list[0].SEND_FILE_TYPE eq '图文' }">
  	 	<div class="materal-div-out">
  	 		<div class="materal-div-in">
	  	 		<span>${requestScope.list[0].MSG_TITLE }</span>
  	 			<img src="${requestScope.list[0].COVER_PAGE_URL}" />
  	 			<span style="margin-bottom:5px;display:inline-block;margin-top:5px;">${requestScope.list[0].SEND_MSG_BODY }</span>
  	 		</div>
  	 	</div>
  	 </c:if>
</body>
</html>