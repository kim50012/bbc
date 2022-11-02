<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
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
%>
<c:set var="basePath" value="<%=basePath %>" />


<!doctype html>
<html>
<head>
<style type="text/css">
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video
	{
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	font-size: 100%;
	vertical-align: baseline;
}

body{
 font-family: "Microsoft Yahei", Arial, sans-serif;
}

.clearfix {
  *zoom: 1;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
  line-height: 0;
}
.clearfix:after {
  clear: both;
}
 

.plugin-container{margin:0 auto;width:420px;background-color:#f2f2f2;}
.label-header{padding-top:5px;}
.agent-item{padding-top:8px;border-bottom:1px solid #e5e5e5;}
.agent-title-bar{position:relative;padding-left:10px;height:30px;border-top:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;background-color:#eaeaea;color:#333;font-weight:700;font-size:14px;line-height:30px;}
.agent-title-arrow{position:absolute;top:11px;right:10px;display:inline-block;width:16px;height:8px;cursor:pointer;}
.agent-title-arrow.arrow-up{background:url(/weixin/kf/images/icon_up.png) no-repeat;}
.agent-title-arrow.arrow-down{background:url(/weixin/kf/images/icon_down.png) no-repeat;}
.agent-content{padding-top:16px;background-color:#fff;}
.agent-content.auto{ padding-top:6px;}
.agent-content .agent-account{position:relative;margin:0 auto;padding-left:10px;width:330px;height:88px;border-radius:6px;background-color:#f2f2f2;}

.header-warp{position:relative;border-bottom:2px solid #090;}
.header-warp .header-left{position:relative;float:left;display:inline-block;}
.header-warp .header-left .tab-title{float:left;display:inline-block;padding-right:10px;padding-left:40px;height:38px;color:#fff;font-weight:700;font-size:16px;line-height:38px;}
.header-warp .header-left .tab-title.icon-tools{background:#090 url(/weixin/kf/images/icon-tools.png) no-repeat 10px center;}
.header-warp .header-left .tab-title-right-bg{float:left;display:inline-block;width:10px;height:38px;background:url(/weixin/kf/images/bg-right.png) no-repeat;}
.header-warp .header-right{float:right;display:inline-block;margin-top:9px;margin-right:10px;cursor:pointer;}
.header-warp .header-right img{height:22px;}
		
.agent-content .agent-account .agent-account-left{float:left;display:inline-block;width:120px;}
.agent-content .agent-account .agent-account-left img{height:88px;}
.agent-content .agent-account .agent-account-right{float:left;display:inline-block;width:210px;height:88px;}
.agent-content .agent-account .agent-account-right .label1{margin-top:10px;color:#333;font-weight:700;font-size:14px;}
.agent-content .agent-account .agent-account-right .label2{color:#090;text-align:center;font-weight:700;font-size:24px;}
.agent-content .agent-account .agent-account-right .label3{margin-top:8px;color:#333;text-align:center;font-weight:700;font-size:12px;}
		
.agent-keyword-title{position:relative;margin-top:9px;}
.agent-keyword-title img{height: 18px; position: absolute;top: 5px; left:14px;}
.agent-keyword-title span{display:inline-block;margin-top:5px;padding-left:40px;height:20px;color:#333;font-weight:700;font-size:14px;list-height:20px;}
.keywork-warp ul{margin-top:5px;}
.keywork-warp ul .text-keyword{float:left;list-style:none;}
.keywork-warp ul .text-keyword span{display:inline-block;box-sizing:border-box;margin-bottom:10px;margin-left:10px;width:125px;height:30px;border:1px solid #b8b8b8;border-radius:4px;color:#333;text-align:center;font-size:12px;line-height:30px;}
.keywork-warp ul .text-keyword span.keyword-add{border:1px solid #090;background:url(/weixin/kf/images/icon_add.png) no-repeat center center;}
		
::-webkit-scrollbar {
	width: 8px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0);
	-webkit-border-radius: 10px;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background: rgba(242, 242, 242, 1);
	-webkit-box-shadow: inset 0 0 1px rgba(0, 0, 0, 0);
}


::-webkit-scrollbar-thumb:hover {
	background:  rgba(162, 162, 162, 1);
	cursor: pointer;
}

::-webkit-scrollbar-track-piece {
	background: url("/admin/images/scrollbar/scrollbar-thumb-vertical.png")
		left top repeat-y;
}
	
</style>
 <script type="text/javascript" src="/weixin/kf/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.js-show-hide').click(function(){
		
		var id = $(this).data('id');
		var isShow = $(this).hasClass('arrow-up');
		if(isShow){
			$(this).removeClass('arrow-up').addClass('arrow-down');
		}else{
			$(this).removeClass('arrow-down').addClass('arrow-up');
		}
		
		$('.js-agent-content').each(function(){
			var _id =  $(this).data('id');
			if(_id == id){
				if(isShow){
					$(this).hide();
				}else{
					$(this).show();
				}
				return true;
			}
		});
	});
});
</script>
</head>
<body>
	<!-- ▼ plugin-container  --> 
	<div class="plugin-container">
		<div class="label-header">
			<div class="header-warp clearfix">
			 	<div class="header-left">
			 		<div class="tab-title icon-tools">상담원 분배 설정</div>
			 		<div class="tab-title-right-bg"></div>
			 	</div>
			 	<div class="header-right">
			 		<img alt="" src="/weixin/kf/images/add_title.png">
			 	</div>
			 	
			</div>
		</div>
		
		<div class="plugin-contents">
			<!-- ▼ agent-item  --> 
			<div class="agent-item">
				<div class="agent-title-bar clearfix">
				 	<span class="agent-title">자동분배</span>
				 	<span class="js-show-hide agent-title-arrow arrow-up" data-id="1"></span>
				</div>
				
				<div class="js-agent-content agent-content auto" data-id="1">
					<div class="agent-keyword-title clearfix">
						<img alt="" src="/weixin/kf/images/icon_key.png">
						<span>키워드</span>
					</div>
					<div class="keywork-warp">
						 <ul class="clearfix">
						 	<li class="text-keyword"><span>안녕하세요</span></li>
						 	<li class="text-keyword"><span>상담원연결</span></li>
						 	<li class="text-keyword"><span>기타문의</span></li>
						 	<li class="text-keyword"><span class="keyword-add"></span></li>
						 </ul>
					</div>
				</div>
			</div>
			<div class="agent-item">
				<div class="agent-title-bar clearfix">
				 	<span class="agent-title">제품문의</span>
				 	<span class="js-show-hide agent-title-arrow arrow-up" data-id="2"></span>
				</div>
				<div class="js-agent-content agent-content"  data-id="2">
					<div class="agent-account clearfix">
					   <div class="agent-account-left">
					   		<img alt="" src="/weixin/kf/images/header.png">
					   </div>
					   <div class="agent-account-right">
					    	<div class="label1">담당 상담원</div>
					    	<div class="label2">product</div>
					    	<div class="label3">(product@greencross)</div>
					   </div>
					</div>
					<div class="agent-keyword-title clearfix">
						<img alt="" src="/weixin/kf/images/icon_key.png">
						<span>키워드</span>
					</div>
					<div class="keywork-warp">
						 <ul class="clearfix">
						 	<li class="text-keyword"><span>전문의약품</span></li>
						 	<li class="text-keyword"><span>일반의약품</span></li>
						 	<li class="text-keyword"><span>건강기능식품</span></li>
						 	<li class="text-keyword"><span>영유아제품</span></li>
						 	<li class="text-keyword"><span>화장품</span></li>
						 	<li class="text-keyword"><span>의약외품</span></li>
						 	<li class="text-keyword"><span>의료기기</span></li>
						 	<li class="text-keyword"><span class="keyword-add"></span></li>
						 </ul>
					</div>
				</div>
			</div>
			<div class="agent-item">
				<div class="agent-title-bar clearfix">
				 	<span class="agent-title">고객문의</span>
				 	<span class="js-show-hide agent-title-arrow arrow-up" data-id="3"></span>
				</div>
				<div class="js-agent-content agent-content" data-id="3">
					<div class="agent-account clearfix">
					   <div class="agent-account-left">
					   		<img alt="" src="/weixin/kf/images/header.png">
					   </div>
					   <div class="agent-account-right">
					    	<div class="label1">담당 상담원</div>
					    	<div class="label2">callcenter</div>
					    	<div class="label3">(callcenter@greencross)</div>
					   </div>
					</div>
					<div class="agent-keyword-title clearfix">
						<img alt="" src="/weixin/kf/images/icon_key.png">
						<span>키워드</span>
					</div>
					<div class="keywork-warp">
						 <ul class="clearfix">
						 	<li class="text-keyword"><span>고객문의</span></li>
						 	<li class="text-keyword"><span>고객지원</span></li>
						 	<li class="text-keyword"><span>일반상담</span></li>
						 	<li class="text-keyword"><span class="keyword-add"></span></li>
						 </ul>
					</div>
				</div>
			</div>
			<div class="agent-item">
				<div class="agent-title-bar clearfix">
				 	<span class="agent-title">투자문의</span>
				 	<span class="js-show-hide agent-title-arrow arrow-up" data-id="4"></span>
				</div>
				<div class="js-agent-content agent-content" data-id="4">
					<div class="agent-account clearfix">
					   <div class="agent-account-left">
					   		<img alt="" src="/weixin/kf/images/header.png">
					   </div>
					   <div class="agent-account-right">
					    	<div class="label1">담당 상담원</div>
					    	<div class="label2">invest</div>
					    	<div class="label3">(invest@greencross)</div>
					   </div>
					</div>
					<div class="agent-keyword-title clearfix">
						<img alt="" src="/weixin/kf/images/icon_key.png">
						<span>키워드</span>
					</div>
					<div class="keywork-warp">
						 <ul class="clearfix">
						 	<li class="text-keyword"><span>투자문의</span></li>
						 	<li class="text-keyword"><span class="keyword-add"></span></li>
						 </ul>
					</div>
				</div>
			</div>
			<!-- ▲ agent-item  --> 
			
		</div>
		
	</div>
	<!-- ▲ plugin-container  -->
</body>
</html>