<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<base href="${basePath }">  
<meta http-equiv="Content-Type" 	content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="pragma" 			content="no-cache"> 
<meta http-equiv="Cache-Control" 	content="no-store, must-revalidate"> 
<meta http-equiv="expires"			content="Wed, 26 Feb 1997 08:21:57 GMT"> 
<meta http-equiv="expires" 			content="0"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<%--------------------------------------------------------------------------------
                              IMPORT / INCLUDE CSS FILES
---------------------------------------------------------------------------------%>

<link rel="stylesheet" type="text/css" href="<c:url value="/admin/js/showLoading/css/showLoading.css" />" />  
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/chosen.css" />" />  
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/select2.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/jquery-ui.min.css" />" />  
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/bootstrap.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/common.css" />" />  
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/custom.css" />" />  
	
<%--------------------------------------------------------------------------------
                              Commons StyleSheet 
---------------------------------------------------------------------------------%>
 
<%--------------------------------------------------------------------------------
                              IMPORT / INCLUDE JAVASCRIPT  FILES
---------------------------------------------------------------------------------%>
<script type="text/javascript" src="<c:url value="/admin/js/jquery-1.11.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/showLoading/js/jquery.showLoading.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/com.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/underscore-min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/backbone-min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/template.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/jquery-ui.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/jquery.ui.datepicker-zh-CN.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/chosen.jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/select2.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/select2_locale_zh-CN.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/fileupload/jquery.iframe-transport.js" />"></script>  
<script type="text/javascript" src="<c:url value="/admin/js/fileupload/jquery.fileupload.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/fileupload/jquery.fileupload-process.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/fileupload/jquery.fileupload-validate.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/jquery.bpopup.min.js" />"></script>

<%--------------------------------------------------------------------------------
                              Commons Scirpt fonctions
---------------------------------------------------------------------------------%>
<script type="text/javascript">
$(function() {
	
	 _.templateSettings = {         
		evaluate : /\{\{([\s\S]+?)\}\}/g,         
		interpolate : /\{\{=([\s\S]+?)\}\}/g,       
		escape : /\{\{-([\s\S]+?)\}\}/g
	}
	
	$(".select2").select2({
		 minimumResultsForSearch:5
		 ,allowClear: true 
	}); 
	
	var config = {
      	'.chosen-select'           : {},
      	'.chosen-select-deselect'  : {allow_single_deselect:true},
      	'.chosen-select-no-single' : {disable_search_threshold:10},
      	'.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      	'.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
	
	$(".datepicker").datepicker(); 
	 
}); 
</script>
<script type="text/javascript">
function showBpopupWindow(obj){
	var id = obj.id || '';
	if(id == ''){
		return false;
	}
	
	var width = obj.width || 1000,
	height = obj.height || 600,
	contentHeight = height - 40,
	fadeSpeed = obj.fadeSpeed || 'slow',
	opacity = obj.opacity || 0.3,
	modalColor = obj.modalColor || '#aeaeae',
	action = obj.action || '',
	title = obj.title || '';
	
	var $this = $('#' + id);
	$this.width(width).height(height);
	$this.find('.js-content').height(contentHeight);
	$this.find('.js-content-iframe').attr('src',action);
	
	if(title != ''){
		$this.find('.js-title').text(title);
	}
	
	$this.bPopup({
	    modalClose: false,//弹出框深色区域，关闭的响应
	    modalColor: modalColor,
	    opacity: opacity,
	    fadeSpeed: fadeSpeed, //弹出速度  string ('slow'/'fast') or int (1500)   
	   	position: [($(window).width() -$this.width()) / 2, ($(window).height() - $this.height()) / 2]
	 });
}

function closeBpopupWindow(popupId){
	$('#' + popupId).bPopup().close();
}

</script>
<script type="text/javascript">
function documentSize(){
	var doc = new Object();
	var body = (document.compatMode && document.compatMode.toLowerCase() == "css1compat") ? document.documentElement
			: document.body;
	if (isNaN($(window).innerHeight()) || isNaN($(window).innerWidth())){
		doc.height = body.clientHeight;
		doc.width = body.clientWidth;
		doc.mode = "document";
	} else {
		doc.height = $(window).innerHeight();
		doc.width = $(window).innerWidth();
		doc.mode = "window";
	}
	return doc;
}
</script> 