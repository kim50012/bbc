<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	String strCurrentTime = String.valueOf(System.currentTimeMillis());
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi" />
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/common.css" />
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/skin.css?time=<%=strCurrentTime %>" />
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/skin${sessionScope.sessionSkin.skinTypeShop}.css?time=<%=strCurrentTime %>" />     
 
<style type="text/css">
	#foo {width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 999000; width: 100%; height: 100%;}
	#fo {position: fixed; top: 50%; left: 50%; z-index:999999; display: '';}
</style>

<script type="text/javascript" src="/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/front/js/headroom.js"></script>
<script type="text/javascript" src="/front/js/jQuery.headroom.js"></script>
<script type="text/javascript" src="/front/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="/front/js/jquery.touchSlider.js"></script>
<script type="text/javascript" src="/front/js/common.js"></script>
<script type="text/javascript" src="<c:url value="/front/js/underscore-min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/template.js" />"></script>
<script type="text/javascript" src="/front/js/page/kkpager.min.js"></script>
<script type="text/javascript" src="/front/js/raty/jquery.raty.js"></script>
<script type="text/javascript" src="/front/js/spin.min.js"></script>
<script type="text/javascript" src="/front/js/bottom-menu.js"></script>
<script type="text/javascript" src="/front/js/jquery.timer.js"></script>
<script type="text/javascript" src="/front/js/koreanair-Navigation.js"></script>
<script type="text/javascript" src="/front/js/jquery.bpopup.min.js"></script>
<script>

	if(!window.console){
		window.console = {
			dubug : function(){},
			log : function(){},
			info : function(){},
			warn : function(){},
			error : function(){}	  
		} 
	}
  
	var sPopts = {
		  lines: 10, // The number of lines to draw
		  length: 5, // The length of each line
		  width: 4, // The line thickness
		  radius: 10, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 30, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#000', // #rgb or #rrggbb or array of colors
		  speed: 1.0, // Rounds per second
		  trail: 80, // Afterglow percentage
		  shadow: true, // Whether to render a shadow
		  hwaccel: true, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  top: '50%', // Top position relative to parent
		  left: '50%' // Left position relative to parent
		};

</script>

	
	
<div id="foo">
	<div id="fo"></div>
</div>
<script>
	var target = document.getElementById('fo');
	spinner = new Spinner(sPopts).spin(target);

	window.onload = function(){
		$('#foo').fadeOut(200);
	}
	
	jQuery( document ).ready(function() {
		$('#foo').fadeOut(200);
	});
</script>

