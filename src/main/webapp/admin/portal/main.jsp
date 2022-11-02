<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><ui:i18n key="韩之盟后台管理"/></title>  
<%@ include file="/admin/template/uiInc.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/js/easyui/themes/default/linkbutton.css" /> 
<link rel="stylesheet" type="text/css" href="/admin/js/easyui/themes/default/panel.css" /> 
<link rel="stylesheet" type="text/css" href="/admin/js/easyui/themes/default/tabs.css" /> 
<link rel="stylesheet" type="text/css" href="/admin/js/easyui/themes/icon.css" />
<script type="text/javascript" src="/admin/js/easyui/jquery.parser.js"></script> 
<script type="text/javascript" src="/admin/js/easyui/jquery.linkbutton.js"></script> 
<script type="text/javascript" src="/admin/js/easyui/jquery.panel.js"></script> 
<script type="text/javascript" src="/admin/js/easyui/jquery.tabs.js"></script> 
  
 <style type="text/css">
 /*  div{
    box-sizing: border-box ;  content-box border-box padding-box  
  } */
   body {
    font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
*{
    font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
body {
	min-width: 1200px;
}

div {
	position: relative;
}

/************************ 内容区域样式  ************************/

.contents {
	margin-right: auto;
	margin-left: auto;
 	width: 1200px;
 	width: 1210px;
/* 	width: 1290px; */
	/* border: 1px solid red; */
}
/*左侧区域样式*/
.left-contents {
	float: left;
	box-sizing: border-box;
	width: 260px;
		 /* border: 1px solid green; */
}
/*右侧区域样式*/
.right-contents {
	float: left;
	box-sizing: border-box;
 	/* width: 940px;  */
 	width: 950px; 
/*	width: 1030px;*/
		 /* border: 1px solid blue; */
}

/************************ 左侧区域样式  ************************/
.left-contents .banner-warp {
	margin-bottom: 9px;
	height: 70px;
	border: 1px solid #e6e6e6;
	background-color: #fcfcfc;
}

.banner-warp .shop-banner {
	margin-top: 10px;
	margin-left: 15px;
	height: 50px;
}

.banner-warp .shop-banner .shop-logo {
	display: inline-block;
}

.banner-warp .shop-banner .shop-logo .img-logo {
	width: 50px;
	height: 50px;
	border-radius: 50px;
}

.banner-warp .shop-banner .shop-name {
	margin-left: 15px;
	height: 50px;
	color: #5f5f5f;
	font-weight: bold;
	font-size: 14px;
	line-height: 50px;
}

.banner-warp .shop-change {
	position: absolute;
	right: 5px;
	bottom: 0;
	color: #4880dd;
	cursor: pointer;
}

.left-contents .left-menu-warp {
	min-height: 370px;
  		/* border: 1px solid #e6e6e6; */
}


.divframe {
	z-index: 3;
}

.menu-top-level {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 2;
	box-sizing: border-box;
	width: 106px;
   	/* border-width: 0 0 0 1px; */
	cursor: pointer;
}

.menu-top-level .top-menu {
	height: 80px;
}

.menu-top-level .leftnav-cust {
	background: url('/admin/images/portal/leftnav_cust.png') no-repeat;
}

.menu-top-level .on.leftnav-cust,.menu-top-level .leftnav-cust:hover {
	background: url('/admin/images/portal/leftnav_cust_checked.png') no-repeat;
}

.menu-top-level .leftnav2-cust {
	background: url('/admin/images/portal/leftnav_cust2.png') no-repeat;
}

.menu-top-level .on.leftnav2-cust,.menu-top-level .leftnav2-cust:hover {
	background: url('/admin/images/portal/leftnav_cust2_checked.png') no-repeat;
} 

.menu-top-level .leftnav-shopmanage {
	background: url('/admin/images/portal/leftnav_shopmanage.png') no-repeat;
}

.menu-top-level .on.leftnav-shopmanage,.menu-top-level .leftnav-shopmanage:hover {
	background: url('/admin/images/portal/leftnav_shopmanage_checked.png') no-repeat;
}

.menu-top-level .leftnav2-shopmanage {
	background: url('/admin/images/portal/leftnav_shopmanage2.png') no-repeat;
}

.menu-top-level .on.leftnav2-shopmanage,.menu-top-level .leftnav2-shopmanage:hover {
	background: url('/admin/images/portal/leftnav_shopmanage2_checked.png') no-repeat;
}

.menu-top-level .leftnav-shopoperation {
	background: url('/admin/images/portal/leftnav_shopoperation.png') no-repeat;
}

.menu-top-level .on.leftnav-shopoperation,.menu-top-level .leftnav-shopoperation:hover {
	background: url('/admin/images/portal/leftnav_shopoperation_checked.png') no-repeat;
}

.menu-top-level .leftnav2-shopoperation {
	background: url('/admin/images/portal/leftnav_shopoperation2.png') no-repeat;
}

.menu-top-level .on.leftnav2-shopoperation,.menu-top-level .leftnav2-shopoperation:hover {
	background: url('/admin/images/portal/leftnav_shopoperation2_checked.png') no-repeat;
}

.menu-top-level .leftnav-data {
	background: url('/admin/images/portal/leftnav_data.png') no-repeat;
}

.menu-top-level .on.leftnav-data,.menu-top-level .leftnav-data:hover {
	background: url('/admin/images/portal/leftnav_data_checked.png') no-repeat;
}

.menu-top-level .leftnav2-data {
	background: url('/admin/images/portal/leftnav_data2.png') no-repeat;
}

.menu-top-level .on.leftnav2-data,.menu-top-level .leftnav2-data:hover {
	background: url('/admin/images/portal/leftnav_data2_checked.png') no-repeat;
}

.menu-top-level .leftnav-wechat {
	background: url('/admin/images/portal/leftnav_wechat.png') no-repeat;
}

.menu-top-level .on.leftnav-wechat,.menu-top-level .leftnav-wechat:hover {
	background: url('/admin/images/portal/leftnav_wechat_checked.png') no-repeat;
}

.menu-top-level .leftnav2-wechat {
	background: url('/admin/images/portal/leftnav_wechat2.png') no-repeat;
}

.menu-top-level .on.leftnav2-wechat,.menu-top-level .leftnav2-wechat:hover {
	background: url('/admin/images/portal/leftnav_wechat2_checked.png') no-repeat;
}

.menu-top-level .leftnav-ka {
	background: url('/admin/images/portal/leftnav_ka.png') no-repeat;
}

.menu-top-level .on.leftnav-ka,.menu-top-level .leftnav-ka:hover {
	background: url('/admin/images/portal/leftnav_ka_checked.png') no-repeat;
}

.menu-top-level .leftnav2-ka {
	background: url('/admin/images/portal/leftnav_ka2.png') no-repeat;
}

.menu-top-level .on.leftnav2-ka,.menu-top-level .leftnav2-ka:hover {
	background: url('/admin/images/portal/leftnav_ka2_checked.png') no-repeat;
}

.menu-top-level .leftnav-hzm {
	background: url('/admin/images/portal/leftnav_hzm.png') no-repeat;
}

.menu-top-level .on.leftnav-hzm,.menu-top-level .leftnav-hzm:hover {
	background: url('/admin/images/portal/leftnav_hzm_checked.png') no-repeat;
}

.menu-top-level .leftnav2-hzm {
	background: url('/admin/images/portal/leftnav_hzm2.png') no-repeat;
}

.menu-top-level .on.leftnav2-hzm,.menu-top-level .leftnav2-hzm:hover {
	background: url('/admin/images/portal/leftnav_hzm2_checked.png') no-repeat;
}

.menu-top-level .leftnav-lack {
	background: url('/admin/images/portal/leftnav_lack.png') no-repeat;
}

.menu-top-level .on.leftnav-lack,.menu-top-level .leftnav-lack:hover {
	background: url('/admin/images/portal/leftnav_lack_checked.png') no-repeat;
}

.menu-top-level .leftnav2-lack {
	background: url('/admin/images/portal/leftnav_lack2.png') no-repeat;
}

.menu-top-level .on.leftnav2-lack,.menu-top-level .leftnav2-lack:hover {
	background: url('/admin/images/portal/leftnav_lack2_checked.png') no-repeat;
}

.menu-top-level li + li {
	margin-top: 4px;
}

.menu-detail {
	float: right;
	box-sizing: border-box;
	width: 170px;
	min-height: 525px;
	border: 1px solid #e6e6e6;
	background-color: #fcfcfc;
}

.level-2-laef .div-level-2 {
	padding-left: 30px;
	height: 50px;
	border-bottom: 1px solid #e6e6e6;
	background-color: #fcfcfc;
	color: #a2a2a2;
	font-size: 14px;
	line-height: 50px;
	cursor: pointer;
}

.level-2-laef .div-level-2 span {
	float: right;
	display: inline-block;
	display: none;
	padding-right: 10px;
}

.level-2-laef .div-level-2.on,.level-2-laef .div-level-2:hover {
	background-color: #f7f7f7;
	color: #343434;
	font-weight: bold;
}

.level-2-laef .div-level-2.on span,.level-2-laef .div-level-2:hover span {
	display: block;
}

.level-2 .div-level-2 {
	padding-left: 30px;
	height: 50px;
	border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
	background-color: #fcfcfc;
	color: #a2a2a2;
	font-size: 14px;
	line-height: 50px;
	cursor: pointer;
}

.level-2:first-of-type .div-level-2 {
	border-top: 0px;
}

.level-2 .div-level-2 span {
	float: right;
	display: inline-block;
	margin-top: 20px;
	margin-right: 10px;
	width: 7px;
	height: 6px;
	background: url(/admin/images/portal/menu-arrow.png) no-repeat;
	vertical-align: middle;
}

.level-2 .div-level-2.on,.level-2 .div-level-2:hover {
	background-color: #f7f7f7;
	color: #343434;
	font-weight: bold;
}

.level-2 .div-level-2:hover span {
	background-position: -8px 0;
}

.level-2 .div-level-2.on span {
	background-position: -24px 0;
}

.level-2 .div-level-2.on:hover span {
	background-position: -16px 0;
}

.level-3-laef .div-level-3 {
	padding-left: 50px;
	height: 30px;
	background-color: #f7f7f7;
	color: #a2a2a2;
	font-size: 12px;
	line-height: 30px;
	cursor: pointer;
}

.level-3-laef .div-level-3.on, .level-3-laef .div-level-3:hover {
	color: #323232;
}

.div-level-3 span {
	float: right;
	display: inline-block;
	display: none;
	padding-right: 10px;
}

.div-level-3.on span,  .div-level-3:hover span {
	display: block;
}
   

/************************ tab控件样式  ************************/
.right-contents .menu-tabs {
	height: 50px;
	border-right: 1px solid #e6e6e6;
	border-bottom: 2px solid #e6e6e6;
	background-color: #fcfcfc;
}
 .tabs-header {
	border: 0;
}

.tabs-header, .tabs-tool, .tabs-scroller-left, .tabs-scroller-right, .tabs-tool {
	background-color: #fcfcfc;
}

.tabs-header, .tabs-scroller-left, .tabs-scroller-right {
	border-color: #fcfcfc;
}

.tabs-scroller-left {
	margin-bottom: 3px;
	background: url('/admin/images/portal/btn_left.png') no-repeat center 25px;
	box-shadow: 1px 1px 1px #d2d2d2;
}

.tabs-scroller-right {
	margin-bottom: 3px;
	background: url('/admin/images/portal/btn_right.png') no-repeat center 25px;
	box-shadow: 1px 1px 1px #d2d2d2;
}

.tabs-scroller-left:hover {
	background: url('/admin/images/portal/btn_left_over.png') no-repeat center 25px;
}

.tabs-scroller-right:hover {
	background: url('/admin/images/portal/btn_right_over.png') no-repeat center 25px;
}

.tabs {
	margin: 0px;
	margin-bottom: 3px;
	padding: 0px;
	padding-left: 4px;
	width: 50000px;
	height: 50px;
	border: 0;
	box-shadow: 1px 1px 1px #d2d2d2;
	list-style-type: none;
}

.tabs li {
	margin-top: 10px;
	margin-right: 0px;
}

.tabs li.tabs-selected a.tabs-inner {
	background: -webkit-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: -moz-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: -o-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: linear-gradient(to bottom,#fcfcfc 0,#fcfcfc 100%);
	background-color: #fcfcfc;
	background-repeat: repeat-x;
	color: #333333;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#fcfcfc,endColorstr=#fcfcfc,GradientType=0);
}

.tabs-header-bottom .tabs li.tabs-selected a.tabs-inner {
	background: -webkit-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: -moz-linear-gradient(top,#fcfcfc 0,#EFF5FF 100%);
	background: -o-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: linear-gradient(to bottom,#fcfcfc 0,#fcfcfc 100%);
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#fcfcfc,endColorstr=#fcfcfc,GradientType=0);
}

.tabs-header-left .tabs li.tabs-selected a.tabs-inner {
	background: -webkit-linear-gradient(left,#fcfcfc 0,#fcfcfc 100%);
	background: -moz-linear-gradient(left,#fcfcfc 0,#fcfcfc 100%);
	background: -o-linear-gradient(left,#fcfcfc 0,#fcfcfc 100%);
	background: linear-gradient(to right,#fcfcfc 0,#fcfcfc 100%);
	background-repeat: repeat-y;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#fcfcfc,endColorstr=#fcfcfc,GradientType=1);
}

.tabs-header-right .tabs li.tabs-selected a.tabs-inner {
	background: -webkit-linear-gradient(left,#fcfcfc 0,#fcfcfc 100%);
	background: -moz-linear-gradient(left,#fcfcfc 0,#fcfcfc 100%);
	background: -o-linear-gradient(left,#fcfcfc 0,#fcfcfc 100%);
	background: linear-gradient(to right,#fcfcfc 0,#fcfcfc 100%);
	background-repeat: repeat-y;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#fcfcfc,endColorstr=#fcfcfc,GradientType=1);
}

.tabs li a.tabs-inner {
	background: -webkit-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: -moz-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: -o-linear-gradient(top,#fcfcfc 0,#fcfcfc 100%);
	background: linear-gradient(to bottom,#fcfcfc 0,#fcfcfc 100%);
	background-color: #fcfcfc;
	background-repeat: repeat-x;
	color: #a2a2a2;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#fcfcfc,endColorstr=#fcfcfc,GradientType=0);
}

.tabs li a.tabs-inner {
	display: inline-block;
	margin: 0;
	padding: 0 15px 0 20px;
	height: 25px;
	border-style: solid;
	border-width: 0px 2px 0 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
	line-height: 25px;
}

.tabs li a.tabs-inner:hover {
	background: #fcfcfc;
	color: #000000;
	filter: none;
}

.tabs li a.tabs-inner {
	display: inline-block;
	margin: 0;
	padding: 0 25px 0 20px;
	height: 25px;
	border-style: solid;
	border-width: 0px 2px 0 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
	line-height: 25px;
}

.tabs li a.tabs-inner {
	border-image: url(/admin/images/portal/bg-tabs-border.png) 0 2 0 0 stretch;
}

.tabs li.tabs-first a.tabs-inner {
	margin-left: 20px;
	border-width: 0px 2px 0 2px;
	border-image: url(/admin/images/portal/bg-tabs-border.png) 0 2 0 2 stretch;
	 padding-right: 15px;
}

.tabs li a.tabs-close {
	position: absolute;
	top: 50%;
	display: block;
	overflow: hidden;
	margin-top: -6px;
	padding: 0;
	height: 12px;
	font-size: 1px;
}

.tabs li a.tabs-close {
	right: 15px;
	width: 12px;
	opacity: 1;
	filter: none;
}

.tabs li a:hover.tabs-close {
	opacity: 1;
	cursor: hand;
	cursor: pointer;
	filter: alpha(opacity=100);
}

.tabs li a.tabs-close {
	background: url('/admin/images/portal/btn_close.png') no-repeat center;
}

.tabs li a:hover.tabs-close,
	.tabs-scroller-over {
	background: url('/admin/images/portal/btn_close_over.png') no-repeat center;
}

.ico_home {
	background: url('/admin/images/portal/ico_home.png') no-repeat center;
}

.tabs li a:hover .ico_home {
	background: url('/admin/images/portal/ico_home_checked.png') no-repeat center;
}

.tabs-title {
	display: inline-block;
	font-size: 12px;
	line-height: 40px;
}

.tabs li.tabs-selected {
	border-bottom: 1px solid #d0112d;
}

.tabs-panels {
	overflow: hidden;
	margin: 18px 0 0 0;
	padding: 0 0 0 20px;
	border-color: #e5e5e5;
	border-style: solid;
	border-width: 0;
	border-top-width: 0;
}

.tabs-icon {
	position: absolute;
	top: 50%;
	left: 10px;
	margin-top: -8px;
	width: 16px;
	height: 16px;
}

.tabs-icon-cust {
	background: url('/admin/images/portal/ico_cust.png') no-repeat center;
}

.tabs-icon-data {
	background: url('/admin/images/portal/ico_data.png') no-repeat center;
}

.tabs-icon-home {
	padding-left: 45px;
	background: url('/admin/images/portal/ico_home.png') no-repeat center;
}

.tabs-icon-hzm {
	background: url('/admin/images/portal/ico_hzm.png') no-repeat center;
}

.tabs-icon-shopmanage {
	background: url('/admin/images/portal/ico_shopmanage.png') no-repeat center;
}

.tabs-icon-shopoperation {
	background: url('/admin/images/portal/ico_shopoperation.png') no-repeat center;
}

.tabs-icon-wechat {
	background: url('/admin/images/portal/ico_wechat.png') no-repeat center;
}

.tabs li.tabs-selected a.tabs-inner .tabs-icon-cust {
	background: url('/admin/images/portal/ico_cust_checked.png') no-repeat center;
}

.tabs li.tabs-selected a.tabs-inner .tabs-icon-data {
	background: url('/admin/images/portal/ico_data_checked.png') no-repeat center;
}

.tabs li.tabs-selected a.tabs-inner .tabs-icon-home {
	background: url('/admin/images/portal/ico_home_checked.png') no-repeat center;
}

.tabs li.tabs-selected a.tabs-inner .tabs-icon-hzm {
	background: url('/admin/images/portal/ico_hzm_checked.png') no-repeat center;
}

.tabs li.tabs-selected a.tabs-inner .tabs-icon-shopmanage {
	background: url('/admin/images/portal/ico_shopmanage_checked.png') no-repeat center;
}

.tabs li.tabs-selected a.tabs-inner .tabs-icon-shopoperation {
	background: url('/admin/images/portal/ico_shopoperation_checked.png') no-repeat center;
}

.tabs li.tabs-selected a.tabs-inner .tabs-icon-wechat {
	background: url('/admin/images/portal/ico_wechat_checked.png') no-repeat center;
}

.tabs-with-icon {
	padding-left: 14px;
}   
    	    
</style>
 
 <script type="text/javascript">
 var ifarmeHeight;
 $(function(){
  
	  
  ifarmeHeight = documentSize().height - 150;
  
  $('#menu-tabs').tabs({
	  width:'100%'
	  ,height:'auto'  
	  ,tabHeight :  50
  	  ,onAdd : function(title){
		  if(title != '<ui:i18n key="首页"/>'){
			  $('.tabs-panels').showLoading(); 
		  }
	  }
	});
  
     var menuId = 'home';
	 var menuIcon = 'home';
	 var url = '/admin/portal/demo.htm';
	 var content ='<div class="divframe" style="height:'+ifarmeHeight+ 'px;">'
				+ '		<iframe class="divframe" id="iframe-' + menuId + '" width="100%" height="' + (ifarmeHeight - 3) + 'px" style="border:0px;" src="' + url + '"></iframe>'
				+ '</div>';
	$('#menu-tabs').tabs('add', {
		title : '<ui:i18n key="首页"/>',
		content : content,
		closable : false,
		iconCls :  'tabs-icon-home'
	});
  
  $('.js-top-menu').click(function(){
	  var $this = $(this);
	  	var menuId = $this.data('menuId');
	  	var leaf = $this.data('leaf');
	   
	  	if(leaf){
	  		alert('<ui:i18n key="没有子菜单"/>');
	  		return false;
	  	}
	  	
	  	$('.js-top-menu').removeClass('on');
	  	$this.addClass('on');
			
	  	$('.js-seconde-level').hide();
	  	$('.js-menupid-' +  menuId).show();
	  	
	  	
	  	
  });
  $('.js-div-level-2').click(function(){
	  var $this = $(this);
	  if($this.hasClass('on')){
		  $this.removeClass('on');
		  $this.siblings('ul').hide();
	  }else{
		  $this.addClass('on');
		  $this.siblings('ul').show();
	  }	
  });
 });

function showMenu(thi){
	 var $this = $(thi);
	 
	 var menuId = $this.data('menuId');
	 var menuNm = $this.data('menuNm');
	 var menuIcon = $this.data('menuIcon');
	 var url = $this.data('url');
	 
	 var content ='<div class="divframe" style="height:'+ifarmeHeight+ 'px;">'
				+ '		<iframe class="divframe" id="iframe-' + menuId + '" width="100%" height="' + (ifarmeHeight - 3) + 'px" style="border:0px;" src="' + url + '"></iframe>'
				+ '</div>';
				
	if ($('#menu-tabs').tabs('exists',menuNm)){
		$('#menu-tabs').tabs('select', menuNm);
	} else {
		$('#menu-tabs').tabs('add', {
			title : menuNm,
			content : content,
			closable : true,
			iconCls :  'tabs-icon-' + menuIcon || ''/* ,
			onLoad : function(panel){  
		        console.log('>>>>>>>>>>>>>>>');  
		        console.log(panel);  
		        console.log('>>>>>>>>>>>>>>>');  
		        $('#iframe-' + menuId ).hideLoading(); 
		    }   */
		});
		
		//$('#iframe-' + menuId ).showLoading(); 
		
		  $('#iframe-' + menuId ).on("load",function(){
		   	//加载完成，需要执行的代码
			  $('.tabs-panels').hideLoading(); 
		  });
	}			
}
 </script>
 
<script type="text/javascript">
 
function ggShowTab(obj){
	 var menuId = _.random(100000000,999999999);
	 var menuNm = obj.name || '';
	 var menuIcon = obj.icon || '';
	 var url = obj.url || '';
	 
	 var content ='<div class="divframe" style="height:'+ifarmeHeight+ 'px;">'
				+ '		<iframe class="divframe" id="iframe-' + menuId + '" width="100%" height="' + (ifarmeHeight - 3) + 'px" style="border:0px;" src="' + url + '"></iframe>'
				+ '</div>';
	 $('#menu-tabs').tabs('add', {
			title : menuNm,
			content : content,
			closable : true,
			iconCls :  'tabs-icon-' + menuIcon || ''
		});	
	 
	 $('#iframe-' + menuId ).on("load",function(){
		   	//加载完成，需要执行的代码
			  $('.tabs-panels').hideLoading(); 
		  });
}

/**
 * 关闭选中的tabs panel 
 */
function closeTab(){
	$('#menu-tabs').tabs('close',$('.tabs-selected .tabs-inner .tabs-title').text() ) ;
}

function showTopModal(){
	console.log('=========================ddddaaaaaaaaaaaaaaaaaaa');
	$('.js-top-bg-modal').show();
}
function hideTopModal(){
	console.log('=========================ddddddddd');
	$('.js-top-bg-modal').hide();
}

</script>
</head>
<body>
<!-- ▼    --> 
<!-- ▲    -->

	<!-- ▼ header  --> 
   	<%@ include file="/admin/inc/banner_top.jsp"%> 
	<!-- ▲ header  -->
       
    <!-- ▼ contents  --> 
    <div class="contents clearfix">
           
		<!-- ▼ 左侧区域  --> 
		<div class="left-contents">
			<div class="banner-warp"> 
				<div class="shop-banner">
					<div class="shop-logo">
					 	<img class="img-logo" alt="" src="${shopInfo.file_url }"> 
					</div>
					<span class="shop-name js-shop-name">${shopInfo.shopName }<!-- 店铺 --></span>
				</div>
				<span class="shop-change" onclick="ggChangeShop();"><ui:i18n key="切换"/></span>
			</div>
			
			<!-- ▼ menu  --> 
			<div class="left-menu-warp clearfix">
				<div class="menu-top-level">
					<ul>
					  <c:forEach items="${menulist}" var="item" varStatus="idx">
	           				<li>
		           				<c:choose>
			           				<c:when test="${currLanguage eq 'ko-KR'}" >
			           					<c:choose>
			           						<c:when test="${idx.first }">
				           						<div class="js-top-menu top-menu on leftnav2-${item.menuIcon }" data-menu-id="${item.menuId }" data-leaf="${item.leaf }"></div>
			           						</c:when>
			           						<c:otherwise>
				           						<div class="js-top-menu top-menu leftnav2-${item.menuIcon }" data-menu-id="${item.menuId }" data-leaf="${item.leaf }"></div>
			           						</c:otherwise>
			           					</c:choose>
			           				</c:when>
			           				<c:otherwise>
			           					<c:choose>
			           						<c:when test="${idx.first }">
				           						<div class="js-top-menu top-menu on leftnav-${item.menuIcon }" data-menu-id="${item.menuId }" data-leaf="${item.leaf }"></div>
			           						</c:when>
			           						<c:otherwise>
				           						<div class="js-top-menu top-menu leftnav-${item.menuIcon }" data-menu-id="${item.menuId }" data-leaf="${item.leaf }"></div>
			           						</c:otherwise>
			           					</c:choose>
			           				</c:otherwise>
		           				</c:choose>
	           					
	           				</li> 
	           		 </c:forEach>  
					</ul>
				</div>
				<div class="menu-detail">
					  <c:forEach items="${menulist}" var="item" varStatus="idx">
           				 <div class="js-seconde-level menupid js-menupid-${item.menuId }" <c:if test="${not idx.first }"> style="display: none;" </c:if>>
						  	 <ul>
							     <c:forEach items="${item.submenus}" var="item2">
						  	 	  <c:set value="${item2.leaf }" var="leaf"></c:set>
							     	<c:choose>
							     		<c:when test="${leaf eq 0 }">
							     			<li class="level-2">
									     		 <div class="js-div-level-2 div-level-2">
							     					<ui:i18n key="${item2.menuNm }"/>
							     					<span class="arrow"></span>
							     				</div>
									     		<c:if test="${item2.leaf eq 0}">
									     			 <ul style="display: none;">
									     				<c:forEach items="${item2.submenus}" var="item3">
									     			 		<li class="level-3-laef">
											     			 	<div class="div-level-3" onclick="showMenu(this);"  data-menu-id="${item3.menuId }" data-menu-nm="<ui:i18n key="${item3.menuNm }"/>"  data-menu-icon="${item3.menuIcon }" data-url="${item3.menuUrl }">
											     					<ui:i18n key="${item3.menuNm }"/>
											     					<span class="">&rsaquo;&rsaquo;</span>
											     				</div>
							     							</li>
									     				</c:forEach>
									     			</ul>
									     		</c:if>
									     	</li>
							     		</c:when>
							     		<c:otherwise>
							     			<li class="level-2-laef">
							     				<div class="div-level-2" onclick="showMenu(this);"  data-menu-id="${item2.menuId }" data-menu-nm="<ui:i18n key="${item2.menuNm }"/>"  data-menu-icon="${item2.menuIcon }" data-url="${item2.menuUrl }">
							     					<ui:i18n key="${item2.menuNm }"/>
							     					<span class="">&rsaquo;&rsaquo;</span>
							     				</div>
									     	</li>
							     		</c:otherwise>
							     	</c:choose>
							     	  
				           		 </c:forEach>  
			           		 </ul>
						  </div>
	           		 </c:forEach>  
				</div>
			</div>
			<!-- ▲ menu  -->
		</div>
		<!-- ▲ 左侧区域  --> 
		
		<!-- ▼ 右侧区域  --> 
		<div class="right-contents">
			<div id="menu-tabs" class="easyui-tabs" style="min-height: 300px;"></div>
		</div>
		<!-- ▲ 右侧区域  -->
	</div>
	<!-- ▲ contents  -->   
	<!-- <div class="js-modal-bg modal-backdrop"></div> -->
     <div class="js-modal-bg"></div> 
     
     <style>
     	.top-bg-modal{
     	position: fixed;
		  top: 0px;
		  right: 0px;
		  bottom: 0px;
		  left: 0px;
		  opacity: 0.5;
		  z-index: 2;
		  background-color: rgb(174, 174, 174);
		  display: none;
     	}
     </style>
     
     <div class="js-top-bg-modal top-bg-modal">
     
     </div>
     
 
     
     
</body>
</html>