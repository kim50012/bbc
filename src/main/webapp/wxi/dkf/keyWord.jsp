<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>  

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

/* body{
 font-family: "Microsoft Yahei", Arial, sans-serif;
} */
body{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
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
.label-header{padding-top:5px;background-color: #f7f7f7;}
.agent-item{border-bottom:1px solid #e5e5e5;}
.agent-title-bar{position:relative;padding-left:10px;height:30px;border-top:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;background-color:#eaeaea;color:#333;font-size:14px;line-height:30px;}
.agent-title-arrow{position:absolute;top:11px;right:10px;display:inline-block;width:16px;height:8px;cursor:pointer;}
.agent-title-arrow.arrow-up{background:url(/weixin/kf/images/icon_up.png) no-repeat;}
.agent-title-arrow.arrow-down{background:url(/weixin/kf/images/icon_down.png) no-repeat;}
.agent-content{padding-top:16px;background-color:#fff;}
.agent-content.auto{ padding-top:6px;}
.agent-content .agent-account{position:relative;margin:0 auto;padding-left:10px;width:330px;height:88px;border-radius:6px;}

.header-warp{position:relative;background-image: url(/wxi/image/zuoxi/bg_title.png)}
.header-warp .header-left{position:relative;float:left;display:inline-block;}
.header-warp .header-left .tab-title{float:left;display:inline-block;padding-right:10px;padding-left:30px;height:36px;color:#666666;font-weight:700;font-size:16px;line-height:36px;width: 100%;}
.header-warp .header-left .tab-title.icon-tools{background:url(/wxi/image/zuoxi/icon-tools.png) no-repeat 10px center;} 
/* .header-warp .header-left .tab-title-right-bg{float:left;display:inline-block;width:10px;height:38px;background:url(/weixin/kf/images/bg-right.png) no-repeat;} */
.header-warp .header-right{float:right;display:inline-block;margin-top:9px;margin-right:10px;cursor:pointer;}
/* .header-warp .header-right img{height:22px;} */
		
.agent-content .agent-account .agent-account-left{float:left;display:inline-block;width:100px;}
.agent-content .agent-account .agent-account-left img{height:88px;border-radius: 44px;}
.agent-content .agent-account .agent-account-right{float:left;display:inline-block;width:210px;height:88px;}
.agent-content .agent-account .agent-account-right .label1{margin-top:10px;color:#333;font-size:14px;}
.agent-content .agent-account .agent-account-right .label2{color:#0096ff;text-align:center;font-weight:700;font-size:24px;}
.agent-content .agent-account .agent-account-right .label3{margin-top:8px;color:#333;text-align:center;font-size:12px;}
		
.agent-keyword-title{position:relative;margin-top:9px;}
.agent-keyword-title img{height: 18px; position: absolute;top: 5px; left:14px;}
.agent-keyword-title span{display:inline-block;margin-top:5px;padding-left:40px;height:20px;color:#333;font-size:14px;list-height:20px;}
.keywork-warp ul{margin-top:5px;height:auto;}
.keywork-warp ul .text-keyword{float:left;list-style:none;}
/* .keywork-warp ul .text-keyword span{display:inline-block;box-sizing:border-box;margin-bottom:10px;margin-left:10px;width:125px;height:30px;border:1px solid #b8b8b8;border-radius:4px;color:#333;text-align:center;font-size:12px;line-height:30px;} */
.keyword-add{
    background: url(/wxi/image/zuoxi/plus.png) no-repeat center center;
    width: 125px;
    background-size: 16px 16px;
    display: inline-block;
    box-sizing: border-box;
    margin-bottom: 10px;
    margin-left: 10px;
    height: 30px;
    border: 1px solid #b8b8b8;
    border-radius: 4px;
    color: #333;
    text-align: center;
    font-size: 12px;
    line-height: 30px;
}

.bpopup2 .bpopupWarp .bpopupHeaderWarp {
    height: 40px;
    background-color: #f7f7f7;
    width: 100%;
    border-top-left-radius: 7px;
    border-top-right-radius: 7px;
    border-bottom:solid 2px red;
}
.bpopup2 .bpopupWarp .bpopupHeaderWarp .bpopupTitle {
    line-height: 40px;
    height: 40px;
    color: #343434;
    font-size: 14px;
    padding-left: 20px;
    display: inline-block;
}	
.keyword-input{
    /* -webkit-box-shadow: #666 0px 0px 10px;
    -moz-box-shadow: #666 0px 0px 10px;
    box-shadow: #666 0px 0px 10px; */
    width: 100%;
    height: 25px;
    padding-left:10px; 
}
.bpopup2 .bpopupInner1 {
    margin-top: 20px;
/*     margin-left: 30px; */
    float: left;
    width: 310px;
}
.add-button{
	margin-top: 20px;
	float: right;
	background-color: #A6A6A6;
	width: 90px;
	border-radius: 5px;
	height: 31px;
	line-height: 31px;
/* 	margin-right: 15px; */
	text-align: center;
	color:#fff;
	font-size: 14px;
	cursor: pointer;
}
.add-div{
 	border-bottom:dashed 1px #a1a1a1;
	height:70px;
}
.bpopup2 .bpopupWarp .bpopupContentWarp {
    min-height: 100px;
    width: 90%;
    height: 350px;
    position: relative;
    border-bottom-left-radius: 9px;
    border-bottom-right-radius: 9px;
    margin-left: 5%;
    margin-right: 5%;
}
.list-div{
	margin-top:15px;
	margin-left: 10px;
}
input[type="checkbox"] {
	background-color: #fff;
    margin-left: -15px;
    margin-bottom: 23px;
}
.keyword-span{
	display: inline-block;
    box-sizing: border-box;
    margin-bottom: 10px;
    margin-left: 10px;
    width: 125px;
    height: 30px;
    border: 1px solid #b8b8b8;
    border-radius: 4px;
    color: #333;
    text-align: center;
    font-size: 12px;
    line-height: 30px;
}
.delete-button-span{
	display: inline-block;
    box-sizing: border-box;
    margin-bottom: 10px;
    margin-left: 10px;
    width: 125px;
    height: 30px;
    border: 1px solid red;
    border-radius: 4px;
    color: #333;
    text-align: center;
    font-size: 12px;
    line-height: 30px;
    background-image: url(/wxi/image/zuoxi/close-gray.png);
    background-repeat: no-repeat;
    background-position: 10px center;
    cursor: pointer;
}
.save-button-span{
	display: inline-block;
    box-sizing: border-box;
    margin-bottom: 10px;
    margin-left: 10px;
    width: 125px;
    height: 30px;
    border: 1px solid red;
    border-radius: 4px;
    color: #333;
    text-align: center;
    font-size: 12px;
    line-height: 30px;
    background-image: url(/wxi/image/zuoxi/duihao.png);
    background-repeat: no-repeat;
    background-position: 10px center;
    cursor: pointer;
}
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
.checkboxFive {
	width: 20px;
	margin-left: 115px;
	position: relative;
}
.checkboxFive-disabled{
	width: 20px;
	margin-left: 115px;
	position: relative;
}

.checkboxFive-disabled label {
	position: absolute;
	width: 17px;
	height: 17px;
	top: 0;
  	left: 0;
	border:1px solid #ddd;
	border-radius: 5px;
	background-color: #ddd;
}

.checkboxFive label:after {
	opacity: 0;
	content: '';
	position: absolute;
	width: 9px;
	height: 5px;
	background: transparent;
	top: 2px;
    left: 3px;
    border: 2px solid red;
	border-top: none;
	border-right: none;
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	transform: rotate(-45deg);
}
.checkboxFive label:hover::after {
	opacity: 0.5;
}
 
.checkboxFive input[type=checkbox]:checked + label:after {
	opacity: 1;
}
input[type=checkbox] {
	visibility: hidden;
}

.checkboxFive label {
	cursor: pointer;
	position: absolute;
	width: 17px;
	height: 17px;
	top: 0;
  	left: 0;
	border:1px solid #ddd;
	border-radius: 5px;
}
	
</style>
<script type="text/javascript">
$(function(){
	
	$('.b-close').click(function(){		
		var popupId = $(this).data('id');
		$('#' + popupId).bPopup().close();
		location = "/wxi/dkf/keyWord.htm"
	})
	
	 
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
	
 	$('.delete-button-span').click(function(){
 		var keywordIndex = "";
 		$('input[name=keyword]:checked').each(function(){  
 			keywordIndex += this.value + '|'
 		});
 		if(keywordIndex != ""){
  			var conf = window.confirm('<ui:i18n key="确定要删除所选关键词吗"/>？');
 			if(conf == false) {
 		        return ;
 		    }else{
 		    	var params = {
 	 		 			keywordIndex : keywordIndex
 	 		 		}
 		 		$.ajax({
 					data : params,
 			 		url : '/wxi/dkf/deleteKeyword.htm',
 			 		success : function(data){
 			 			window.confirm('<ui:i18n key="删除成功"/>')
 		   	 			allKeyword();
	 		   	 		$('#keywordAdd').bPopup().close();
		 				location = '/wxi/dkf/keyWord.htm';
 		 	 		},
 			 		error : function(a, msg, c){
 			 			alert('error: ' + msg);
 			 		}
 				})
 		    }
 			
 		}else{
  			window.confirm('<ui:i18n key="没有选中任何关键词"/>')
 		}
 		
 	});
 	
	$('.keyword-add').click(function(){
 		var id = $(this).data('id');
		$("#kfaccount").val(id);
 		if(id=="global"){
 			showBpopup({
 	 			id : 'keywordAdd',
 	 			width :450,
 	 			top:20 
 	 		});
 			allKeyword(); 
 		}else{
 			showBpopup({
 	 			id : 'keywordSelect',
 	 			width :450,
 	 			top:20 
 	 		});
 			keywordByUser();
 		}
 		
	});
	
	$('.save-button-span').click(function(){
		
		var kfAcount = $("#kfaccount").val();
		var keywordIndex = "";
 		$('input[name=keyword]:checked').each(function(){  
 			keywordIndex += this.value + '|'
 		});
		 
		var params = {
				keyword : keywordIndex,
				status :"1",
				kfAcount : kfAcount
		}
		
		$.ajax({
			data : params,
	 		url : '/wxi/dkf/keywordSelect.htm',
	 		success : function(data){
	 			window.confirm('<ui:i18n key="保存成功"/>')
 	 			keywordByUser();
 	 			location = "/wxi/dkf/keyWord.htm"
 	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
		})
		
	});
	
	
	$('.add-button').click(function(){
		var keyword = $("#keyword").val();
		var params = {
				keyword : keyword,
				status :"-1",
				kfAcount : "global"
		}
		
		$.ajax({
			data : params,
	 		url : '/wxi/dkf/editPageKeywordAdd.htm',
	 		success : function(data){
  	 			if (data.result == 0){
  	 				window.confirm('<ui:i18n key="请不要重复保存关键词"/>');
	 			} else if(data.result == 1){
	 				window.confirm('<ui:i18n key="保存成功"/>');
	 				allKeyword();
	 				$('#keywordAdd').bPopup().close();
	 				location = '/wxi/dkf/keyWord.htm';
	 			}else{
	 				window.confirm('<ui:i18n key="保存失败"/>');
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
		})
	})
});
	
	function keywordByUser(){
		kfAcount = $("#kfaccount").val();
 		var params = {
				kfAcount : kfAcount
		}
		$.ajax({
			data : params,
 	 		url : '/wxi/dkf/keywordListByAccount.htm',
	 		success : function(data){
	 			var data = data.list;
 	 			if (data != null && data.length > 0){
 	 				var keywordHtml = "";
	 				for(var i=0;i<data.length;i++){
	 					if(data[i].status == 1){
	 						keywordHtml +='<li class="text-keyword"><span class="keyword-span" >'+data[i].keyword+'</span><span><div class="checkboxFive">';
	 						keywordHtml +='<input type="checkbox" checked="checked" value="'+data[i].keyword+'" id="'+ i +'" name="keyword" />';
	 						keywordHtml +='<label for="'+ i +'"></label>';
	 						keywordHtml +='</div></span></li>';
	 					}else if(data[i].status == 0){
	 	 					keywordHtml +='<li class="text-keyword"><span class="keyword-span">'+data[i].keyword+'</span><span><div class="checkboxFive">';
	 	 					keywordHtml +='<input type="checkbox" value="'+data[i].keyword+'" id="'+ i +'" name="keyword" />';
	 						keywordHtml +='<label for="'+ i +'"></label>';
	 						keywordHtml +='</div></span></li>';	
	 					}else{
	 						keywordHtml +='<li class="text-keyword"><span class="keyword-span">'+data[i].keyword+'</span><span><div class="checkboxFive-disabled">';
	 	 					keywordHtml +='<input type="checkbox" disabled="disabled" value="'+data[i].keyword+'" id="'+ i +'" name="keyword" />';
	 						keywordHtml +='<label for="'+ i +'"></label>';
	 						keywordHtml +='</div></span></li>';	
	 					}
	 				}
	 				$('#keywordSelect-li').html(keywordHtml);
	 			} else {
	 				window.confirm('<ui:i18n key="该用户没有关键词"/>');
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
		})
		
	}
	
	function allKeyword(){
		
		$.ajax({
 	 		url : '/wxi/dkf/editPageKeywordList.htm',
	 		success : function(data){
	 			var data = data.list;
 	 			if (data != null && data.length > 0){
 	 				var keywordHtml = "";
	 				for(var i=0;i<data.length;i++){
	 					 
	 	 					keywordHtml +='<li class="text-keyword"><span class="keyword-span">'+data[i].keyword+'</span><span></span><div class="checkboxFive">';
	 						keywordHtml +='<input type="checkbox" value="'+data[i].keyword+'" id="'+ i +'" name="keyword" />';
	 						keywordHtml +='<label for="'+ i +'"></label>';
	 						keywordHtml +='</div></span></li>';	
	 					 
	 				}
	 				$('#keyword-li').html(keywordHtml);
	 			} else {
	 				window.confirm('<ui:i18n key="没有对应的关键词"/>');
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
		})
		
	}
	
 
</script>
</head>
<body>
	<!-- ▼ plugin-container  --> 
	<div class="plugin-container">
		<div class="label-header">
			<div class="header-warp clearfix">
			 	<div class="header-left">
			 		<div class="tab-title icon-tools">상담원 분배설정</div>
			 		<div class="tab-title-right-bg"></div>
			 	</div>
			 	<div class="header-right">
			 		<img alt="" src="/wxi/image/zuoxi/plus.png">
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
						 	<c:forEach items="${allKeyword }" var="list" varStatus="status">
						 		<li class="text-keyword"><span class="keyword-span">${list.keyword }</span></li>
						 	</c:forEach>
						 	<li class="text-keyword"><span class="keyword-add" data-id="global"></span></li>
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
					   		<img alt="" src="/wxi/image/zuoxi/head_weip.png">
					   </div>
					   <div class="agent-account-right">
					    	<div class="label1">상담원</div>
					    	<div class="label2">彭伟</div>
					    	<div class="label3">(1001@Tianyuchuangshi_1)</div>
					   </div>
					</div>
					<div class="agent-keyword-title clearfix">
						<img alt="" src="/weixin/kf/images/icon_key.png">
						<span>키워드</span>
					</div>
					<div class="keywork-warp">
						 <ul class="clearfix">
						 	<c:forEach items="${chanpinzuoxi }" var="list" varStatus="status">
						 		<li class="text-keyword"><span class="keyword-span">${list.keyword }</span></li>
						 	</c:forEach>
 						 	<li class="text-keyword"><span class="keyword-add" data-id="1001@Tianyuchuangshi_1"></span></li>
						 </ul>
					</div>
				</div>
			</div>
			<div class="agent-item">
				<div class="agent-title-bar clearfix">
				 	<span class="agent-title">고객지원</span>
				 	<span class="js-show-hide agent-title-arrow arrow-up" data-id="3"></span>
				</div>
				<div class="js-agent-content agent-content" data-id="3">
					<div class="agent-account clearfix">
					   <div class="agent-account-left">
					   		<img alt="" src="/wxi/image/zuoxi/head_wljin.png">
					   </div>
					   <div class="agent-account-right">
					    	<div class="label1">상담원</div>
					    	<div class="label2">金维良</div>
					    	<div class="label3">(2001@Tianyuchuangshi_1)</div>
					   </div>
					</div>
					<div class="agent-keyword-title clearfix">
						<img alt="" src="/weixin/kf/images/icon_key.png">
						<span>키워드</span>
					</div>
					<div class="keywork-warp">
						 <ul class="clearfix">
						 	<c:forEach items="${kehuzhiyuan }" var="list" varStatus="status">
						 		<li class="text-keyword"><span class="keyword-span">${list.keyword }</span></li>
						 	</c:forEach>
						 	<li class="text-keyword"><span class="keyword-add" data-id="2001@Tianyuchuangshi_1"></span></li>
						 </ul>
					</div>
				</div>
			</div>
			<!-- ▲ agent-item  --> 
			
		</div>
		<div class="bpopup2" id="keywordAdd">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="키워드 관리"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/wxi/image/zuoxi/close_red.png" data-id="keywordAdd"/>
					</div>
				</div>
		 		<div class="bpopupContentWarp"> 
		 			<div class="add-div">
		 				<div class="bpopupInner1 js-bpopup-inner"> 
			 		 	   <input name="keyword" id="keyword" value="" class="keyword-input" autofocus="autofocus" placeholder="새로운 키워드를 입력해 주세요."/> 
	 		 		 	</div>
	 		 		 	<div class="add-button">
	 		 		 		추가 확인
	 		 		 	</div>
		 			</div>
		 			<div class="list-div">
		 				<img alt="" src="/wxi/image/zuoxi/key.png" style="vertical-align: bottom"> 키워드
		 			</div>
 		 		 	<div class="keywork-warp">
 		 		 		<ul id="keyword-li">
 		 		 			 
						</ul>
 		 		 	</div>
  		 		</div>
  		 		<div style="margin-left: 140px;margin-bottom: 15px">
	 		 		<ul>
	 		 			<li class="text-keyword"><span class="delete-button-span">삭&nbsp;&nbsp;제</span></li>
	 		 		</ul>
	 		 	</div>
		 	</div>
		</div>
		
		<div class="bpopup2" id="keywordSelect">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="키워드 매핑"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/wxi/image/zuoxi/close_red.png" data-id="keywordSelect"/>
					</div>
				</div>
		 		<div class="bpopupContentWarp"> 
		 			<input type="hidden" value="" id="kfaccount" name="kfaccount"/>
  		 		 	<div class="keywork-warp">
 		 		 		<ul id="keywordSelect-li">
 		 		 			 
						</ul>
 		 		 	</div>
  		 		</div>
  		 		<div style="margin-left: 140px;margin-bottom: 15px">
	 		 		<ul>
	 		 			<li class="text-keyword"><span class="save-button-span">완&nbsp;&nbsp;료</span></li>
	 		 		</ul>
	 		 	</div>
		 	</div>
		</div>
	</div>
	<!-- ▲ plugin-container  -->
</body>
</html>