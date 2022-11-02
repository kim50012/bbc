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
.header-warp .header-left .tab-title{float:left;display:inline-block;padding-right:10px;padding-left:40px;height:38px;background:#090 url(/weixin/kf/images/icon-tools.png) no-repeat 10px center;color:#fff;font-weight:700;font-size:16px;line-height:38px;}
.header-warp .header-left .tab-title.icon-cust{background:#090 url(/weixin/kf/images/icon_person.png) no-repeat 10px center;}
.header-warp .header-left .tab-title.icon-prod{background:#090 url(/weixin/kf/images/iocn_shop.png) no-repeat 10px center;}
.header-warp .header-left .tab-title.icon-wechat{background:#090 url(/weixin/kf/images/iocn_chat.png) no-repeat 10px center;}
.header-warp .header-left .tab-title-right-bg{float:left;display:inline-block;width:10px;height:38px;background:url(/weixin/kf/images/bg-right.png) no-repeat;}
.header-warp .header-right{float:right;display:inline-block;margin-top:9px;margin-right:10px;cursor:pointer;}
.header-warp .header-right img{height:22px;}
.header-warp .header-right span {color:#009900;font-size:12px;}
		
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

li{list-style:none;}

.cust-info{margin:0 auto;padding-top:10px;padding-bottom:10px;width:380px;}
.cust-info ul li{position:relative;float:left;height:30px;color:#666;font-size:14px;line-height:30px;}
.cust-info ul li.w1{width:190px;}
.cust-info ul li.w2{width:380px;}
.cust-info ul li .font-red{color:#f21717;}

.prod-info{padding-top:10px;padding-bottom:10px;}
.prod-info ul li{position:relative;float:left;margin-left:8px;color:#666;font-size:14px;}
.pord-item-warp{width:128px;}
.pord-item-warp .prod-img{box-sizing:border-box;width:128px;height:113px;border:1px solid #e5e5e5;}
.pord-item-warp .prod-img img{width:100%;height:100%;}
.pord-item-warp .prod-nm{height:28px;color:#333;text-align:center;font-size:14px;line-height:28px;}
.pord-item-warp .prod-desc{overflow:hidden;height:32px;color:#7b7b7b;text-align:center;font-size:12px;line-height:16px;}
.pord-item-warp .prod-send{margin-top:10px;text-align:center;}
.pord-item-warp .prod-send span{display:inline-block;width:100px;height:25px;background-color:#090;color:#fff;line-height:25px;cursor:pointer;}

.memo-info{padding-top:10px;padding-bottom:10px;}
.memo-hist{margin-right:10px;margin-left:10px;min-height:150px;}
.memo-info ul li{position:relative;color:#666;font-size:14px}
.memo-info ul li+li{margin-top:10px}
.memo-item-warp .memo-title{color:#00f;font-size:12px;line-height:20px}
.memo-item-warp .memo-title .user-nm{margin-right:4px}
.memo-item-warp .memo-dtl{color:#7b7b7b;font-size:12px;line-height:16px}

.split{height:1px;box-shadow:0 -1px 1px #e5e5e5;}
.pagging-warp{margin-top:10px;text-align:center;}
.page-navi{display:inline-block;width:24px;height:24px;background-position:center center;background-repeat:no-repeat;cursor:pointer;}
.page-navi.navi-first{background-image:url(/weixin/kf/images/icon_first.png);}
.page-navi.navi-left{background-image:url(/weixin/kf/images/icon_left.png);}
.page-navi.navi-right{background-image:url(/weixin/kf/images/icon_right.png);}
.page-navi.navi-last{background-image:url(/weixin/kf/images/icon_last.png);}
.page-navi.navi-first:hover{background-image:url(/weixin/kf/images/icon_first_active.png);}
.page-navi.navi-left:hover{background-image:url(/weixin/kf/images/icon_left_active.png);}
.page-navi.navi-right:hover{background-image:url(/weixin/kf/images/icon_right_active.png);}
.page-navi.navi-last:hover{background-image:url(/weixin/kf/images/icon_last_active.png);}
.pagging-warp .page-no{display:inline-block;box-sizing:border-box;width:24px;height:24px;border:1px solid #e5e5e5;border-radius:2px;background-color:#f0f0f0;color:#666;font-weight:700;font-size:14px;line-height:24px;cursor:pointer;}
.pagging-warp .page-no.active,.pagging-warp .page-no:hover{border:1px solid #090;background-color:#fff;color:#090;}


		
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
	 $('.js-send').click(function(){
		 var _this = $(this);
		 
		 var title = _this.data('title');
		 var digest = _this.data('digest');
		 var cover = _this.data('cover');
		 var url = _this.data('url');
		 
		 console.log('title=' + title);
		 console.log('digest=' + digest);
		 console.log('cover=' + cover);
		 console.log('url=' + url);
		 
		 
		 
		 var msg ={
			 	msg :{
		           head: {
		        	   random: Math.ceil(Math.random() * 10000000) + ""
		           }
		           ,body:[{
			   			type : 7
						,content: [{
							title : title 
							,digest : digest
							,cover : cover
							,url : url
						}]
					}]
		        }
		 	};
		 	
		 if(!!window.external.PutMsg){
			 var smsg = JSON.stringify(msg);
			 //$('#log').html(typeof(smsg) + '<br>');
			//$('#log').html($('#log').html() + '1sg=>' + smsg + '<br>');
			 var strReturn = window.external.PutMsg(smsg);
			 //$('#log').html($('#log').html() + 'res=>' + strReturn +'<br>');
		 };
		 
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
			 		<div class="tab-title icon-cust">고객정보</div>
			 		<div class="tab-title-right-bg"></div>
			 	</div>
			 	<div class="header-right">
			 		<span>상세보기</span>
			 	</div>
			</div>
		</div>
	 
		<div style="background-color: #fff;">
			<div class="cust-info" style="">
			 <ul class="clearfix">
				<li class="w1">고객등급&nbsp;:&nbsp;<span class="js-cust-level font-red"></span></li>
				<li class="w1">누적 구매금액&nbsp;:&nbsp;<span  class="js-amount-total font-red"></span></li>
				<li class="w1">마일리지&nbsp;:&nbsp;<span class="js-mileage-total font-red"></span></li>
				<li class="w1">최근 구매일자&nbsp;:&nbsp;<span class="js-last-buy-time"></span></li>
				<li class="w2">관심제품&nbsp;:&nbsp;<span>전문의약품,건강기능식품</span></li>
			 </ul>
			</div>
		</div>
		
		<br>
		
		<div class="label-header">
			<div class="header-warp clearfix">
			 	<div class="header-left">
			 		<div class="tab-title icon-prod">고객관심제품정보</div>
			 		<div class="tab-title-right-bg"></div>
			 	</div>
			 	<div class="header-right">
			 		<span>다른 제품 보기</span>
			 	</div>
			</div>
		</div>
		
		<div style="background-color: #fff;">
			<div class="prod-info" style="">
				 <ul class="clearfix">
					<li>
						<div class="pord-item-warp" >
						 	<div  class="prod-img" >
						 		<img  alt="" src="/weixin/kf/images/img_products1.jpg">
						 	</div>
						 	<div class="prod-nm">정주용헤파빅 주</div>
						 	<div  class="prod-desc">간이식 환자의 B형간염재발의 예방제제</div>
						 	<div class="prod-send">
						 		<span class="js-send" 
						 			data-title="정주용헤파빅 주"
						 			data-digest="간이식 환자의 B형간염재발의 예방제제"
						 			data-cover="${basePath}weixin/kf/images/img_products1.jpg"
						 			data-url="${basePath}front/newsFeed/detail.htm?msgId=71&newsId=149&shopId=8"
						 			>Send</span>
						 	</div>
						</div>
					</li>
					<li>
						<div class="pord-item-warp" >
						 	<div  class="prod-img" >
						 		<img  alt="" src="/weixin/kf/images/img_products2.jpg">
						 	</div>
						 	<div class="prod-nm">근주용 헤파빅 주</div>
						 	<div  class="prod-desc">B형간염 예방</div>
						 	<div class="prod-send">
						 		<span class="js-send" 
						 			data-title="근주용 헤파빅 주"
						 			data-digest="B형간염 예방"
						 			data-cover="${basePath}weixin/kf/images/img_products2.jpg"
						 			data-url="${basePath}front/newsFeed/detail.htm?msgId=72&newsId=150&shopId=8"
						 			>Send</span>
						 	</div>
						</div>
					</li>
					<li>
						<div class="pord-item-warp" >
						 	<div  class="prod-img" >
						 		<img  alt="" src="/weixin/kf/images/img_products3.jpg">
						 	</div>
						 	<div class="prod-nm">헌터라제</div>
						 	<div  class="prod-desc">헌터증후군 치료제</div>
						 	<div class="prod-send">
						 		<span class="js-send" 
						 			data-title="헌터라제"
						 			data-digest="헌터증후군 치료제"
						 			data-cover="${basePath}weixin/kf/images/img_products3.jpg"
						 			data-url="${basePath}front/newsFeed/detail.htm?msgId=73&newsId=151&shopId=8"
						 			>Send</span>
						 	</div>
						</div>
					</li>
				 
				 </ul>
			</div>
		</div>
		
		<br>
		
		<div class="label-header">
			<div class="header-warp clearfix">
			 	<div class="header-left">
			 		<div class="tab-title icon-wechat">상담이력</div>
			 		<div class="tab-title-right-bg"></div>
			 	</div>
			 	<div class="header-right">
			 		<img alt="" src="/weixin/kf/images/add_title.png">
			 	</div>
			</div>
		</div>
		
		<div style="background-color: #fff;">
			<div class="memo-info">
				<div class="memo-hist">
					<ul class="clearfix">
						<li>
							<div class="memo-item-warp" >
							 	<div class="memo-title">
							 		<span class="user-nm">제품구매</span>
							 		 <span class="memo-dt">2015-09-15 11:51:00</span> 
							 	</div>	 
							 	<div class="memo-dtl">
							 		고객이 간이식 수술 후 전문 의약품 구매 문의하였습니다. <br> 
							 		혈액제제 관련 의약품을 문의 하여<br>
							 		"정주용헤파빅 주" 제품 가이드를 보내주고<br>
							 		효능/효과, 용법/용량을 소개 해주었습니다.<br>
							 		그리고 고객이 웨이신 상점을 통해 해당 의약품을 구매하였습니다.
							 	</div>	 
							</div>
						</li>
						<li>
							<div class="memo-item-warp" >
							 	<div class="memo-title">
							 		<span class="user-nm">일반상담</span>
							 		 <span class="memo-dt">2015-09-13 16:21:20</span> 
							 	</div>	 
							 	<div class="memo-dtl">
							 		제품 구매 후 사용 방법에 대한 문의를 하여<br>
							 		해당 제품의 주의사항 설명 후<br>
							 		사용 방법을 가이드 해주었습니다. 
							 	</div>	 
							</div>
						</li>
						<li>
							<div class="memo-item-warp" >
							 	<div class="memo-title">
							 		<span class="user-nm">제품구매</span>
							 		 <span class="memo-dt">2015-09-12 10:20:20</span> 
							 	</div>	 
							 	<div class="memo-dtl">
							 		고객이 간이식 수술 후 전문 의약품 구매 문의하였습니다. <br> 
							 		혈액제제 관련 의약품을 문의 하여<br>
							 		"정주용헤파빅 주" 제품 가이드를 보내주고<br>
							 		효능/효과, 용법/용량을 소개 해주었습니다.<br>
							 		그리고 고객이 웨이신 상점을 통해 해당 의약품을 구매하였습니다.
							 	</div>	 
							</div>
						</li>
						 
					 </ul>
				</div>
				
				<div class="split"></div>
				
				<div class="pagging-warp">
				
					<span class="page-navi navi-first">&nbsp;</span>
					<span class="page-navi navi-left">&nbsp;</span>
				
					<span class="page-no">1</span>
					<span class="page-no active">2</span>
					<span class="page-no">3</span>
					<span class="page-no">4</span>
					<span class="page-navi navi-right">&nbsp;</span>
					<span class="page-navi navi-last">&nbsp;</span>
				</div>
				
				<div id="log" style="display: none;"></div>
				
			</div>
		</div>
		
		
	</div>
	<!-- ▲ plugin-container  -->
	
	<script type="text/javascript">
	var ticket = getUrlParam('ticket');
	var workerAccouont = '';
	$.getScript('http://crm1.dkf.qq.com/php/index.php/thirdapp/appdemo/get_workeraccount_by_sessionkey?callback=wokeraccountCallback&ticket='+ticket);

	
	function wokeraccountCallback(data){
		workerAccouont = $xss(data.workeraccount,"html");
		logout('您现在登录的帐号是：' + workerAccouont );
	}

	function MCS_ClientNotify(EventData) {
		EventData = strToJson(EventData);
		switch(EventData['event']){
			case 'OnUserChange':{
				OnUserChange(EventData);
				break;
			}
			case 'OnMapMsgClick':{
				OnMapMsgClick(EventData);
				break;
			}
		}
	}

	function OnUserChange(data){
		var str = "切换到用户:" + data['userid'] + ", channeltype:" + data['channeltype'] ;
		logout(str);
		userInfoSetting(data['userid']);
		try{
			if(data.hasOwnProperty('visitorid')){
				
			}
			//logout('hasOwnProperty no problem');
		}catch(e){
			logout(e.message);
		}
	}
	
	function OnMapMsgClick (data) {
		var str = "latitude :" + data['latitude'] + ",longitude:" + data['longitude'] + ",location :" + data['location'] + ",scale :" + data['scale'];
		logout(str);
	}

	function strToJson(str){ 
		var json = (new Function("return " + str))(); 
		return json; 
	} 


	function getUrlParam(name){
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg);  //匹配目标参数
		if (r!=null) return unescape(r[2]); return null; //返回参数值
	}

	function $xss(str,type){
		//空过滤
		if(!str){
			return str===0 ? "0" : "";
		}
		
		switch(type){
			case "none": //过度方案
				return str+"";
			break;
			case "html": //过滤html字符串中的XSS
				return str.replace(/[&'"<>\/\\\-\x00-\x09\x0b-\x0c\x1f\x80-\xff]/g, function(r){
					return "&#" + r.charCodeAt(0) + ";"
				}).replace(/ /g, " ").replace(/\r\n/g, "<br />").replace(/\n/g,"<br />").replace(/\r/g,"<br />");
			break;
			case "htmlEp": //过滤DOM节点属性中的XSS
				return str.replace(/[&'"<>\/\\\-\x00-\x1f\x80-\xff]/g, function(r){
					return "&#" + r.charCodeAt(0) + ";"
				});
			break;
			case "url": //过滤url
				return escape(str).replace(/\+/g, "%2B");
			break;
			case "miniUrl":
				return str.replace(/%/g, "%25");
			break;
			case "script":
				return str.replace(/[\\"']/g, function(r){
					return "\\" + r;
				}).replace(/%/g, "\\x25").replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\x01/g, "\\x01");
			break;
			case "reg":
				return str.replace(/[\\\^\$\*\+\?\{\}\.\(\)\[\]]/g, function(a){
					return "\\" + a;
				});
			break;
			default:
				return escape(str).replace(/[&'"<>\/\\\-\x00-\x09\x0b-\x0c\x1f\x80-\xff]/g, function(r){
					return "&#" + r.charCodeAt(0) + ";"
				}).replace(/ /g, " ").replace(/\r\n/g, "<br />").replace(/\n/g,"<br />").replace(/\r/g,"<br />");
			break;
		}
	}
/////////////////////////

var custLevelArray = ['A','B','C'];
var lastBuyTimeArray = ['2015-08-11','2015-09-12','2015-08-21','2015-09-21','2015-09-18','2015-07-21','2015-03-21'];
function userInfoSetting(userid){
	
	var custLevel = '';
	var amount = '';
	var mileage = '';
	var lastdt = '';
	
	if(userid == 'o1yuEtw8Pa1BiDLhP3WfLZuaQyAI'){//金东一(김동일)
		custLevel = 'B';
		amount = '10000';
		mileage = '2000';
		lastdt = '2015-08-11';
	}else if(userid == 'o1yuEt60yzD1sTw1mL5wVu4ixBBs'){//朴兴奎 Hank Park
		custLevel = 'A';
		amount = '32000';
		mileage = '3000';
		lastdt = '2015-09-22';
	}else{
		custLevel = custLevelArray[Math.floor(Math.random() * custLevelArray.length)];
		amount = '1000';
		mileage = '200';
		lastdt = '2015-08-11';
	}
	
	$('.js-cust-level').text(custLevel);
	//$('.js-amount-total').text(Math.ceil(Math.random() * 20000) + ' RMB');
	//$('.js-mileage-total').text(Math.ceil(Math.random() * 3000));
	//$('.js-last-buy-time').text(lastBuyTimeArray[Math.floor(Math.random() * lastBuyTimeArray.length)]);
	$('.js-amount-total').text(amount  + ' RMB');
	$('.js-mileage-total').text(mileage);
	$('.js-last-buy-time').text(lastdt);
	
}

function logout(str){
	
	$('#log').html( str + '<br>' + $('#log').html());
	
}
</script>
	
</body>
</html>