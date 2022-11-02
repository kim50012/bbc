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
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/js/icheck/skins/square/firebrick14.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/common.css" />" />  
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/custom.css" />" />  
<link rel="stylesheet" type="text/css" href="<c:url value="/admin/css/v2_custom.css" />" />  
<%--------------------------------------------------------------------------------
                              Commons StyleSheet 
---------------------------------------------------------------------------------%>
 
<%--------------------------------------------------------------------------------
                              IMPORT / INCLUDE JAVASCRIPT  FILES
---------------------------------------------------------------------------------%>
<script type="text/javascript" src="<c:url value="/admin/js/jquery-1.11.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/showLoading/js/jquery.showLoading.min.js" />"></script>

<script type="text/javascript" src="<c:url value="/admin/js/CJL.0.1.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/ImagePreviewd.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/ajaxfileupload.js" />"></script>

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
<script type="text/javascript" src="<c:url value="/admin/js/icheck/icheck.min.js" />"></script>
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
	
	var _config = {
      	'.chosen-select'           : {},
      	'.chosen-select-deselect'  : {allow_single_deselect:true},
      	'.chosen-select-no-single' : {disable_search_threshold:10},
      	'.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      	'.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in _config) {
      $(selector).chosen(_config[selector]);
    }
	
	$(".datepicker").datepicker(); 
	
	//$('#createdDateFrom').attr("readonly","readonly");
	//$('#createdDateTo').attr("readonly","readonly");
	$('.calendar').attr("readonly","readonly");
	$('.calendar').css('background-color','#fff');
	 
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
	
	var follow = true;
	if(typeof obj.follow != 'undefined'){
		follow = obj.follow;
	 } 
	
	$this.bPopup({
	    modalClose: false,//弹出框深色区域，关闭的响应
	    modalColor: modalColor,
	    opacity: opacity,
	    follow : [follow,follow],
	    fadeSpeed: fadeSpeed, //弹出速度  string ('slow'/'fast') or int (1500)   
	   	position: [($(window).width() -$this.width()) / 2, ($(window).height() - $this.height()) / 2]
	 });
}

function closeBpopupWindow(popupId){
	//window.top.hideTopModal();
	$('#' + popupId).bPopup().close();
}



function showBpopup(obj){
	//window.top.showTopModal();
	
	var id = obj.id || '';
	if(id == ''){
		return false;
	}
	
	var width = obj.width || 600,
	height = obj.height || 300,
	fadeSpeed = obj.fadeSpeed || 'slow',
	opacity = obj.opacity || 0.5,
	modalColor = obj.modalColor || '#aeaeae',
	title = obj.title || '';
	
	
	var $this = $('#' + id);
	$this.width(width);
	
	if(title != ''){
		$this.find('.js-title').text(title);
	}
	
	var left = obj.left || ($(window).width() -$this.width()) / 2;
	var top = obj.top || ($(window).height() - $this.height()) / 2;
	
	var follow = true;
	if(typeof obj.follow != 'undefined'){
		follow = obj.follow;
	 } 
	
	$this.bPopup({
	    modalClose: false,//弹出框深色区域，关闭的响应
	    modalColor: modalColor,
	    opacity: opacity,
	    follow : [follow,follow],
	    fadeSpeed: fadeSpeed, //弹出速度  string ('slow'/'fast') or int (1500)   
	   //	position: [($(window).width() -$this.width()) / 2, ($(window).height() - $this.height()) / 2]
	   	position: [left, top]
	 });
}


function showIframeBpopupWindow(obj){
	//window.top.showTopModal();
	
	var id = obj.id || '';
	if(id == ''){
		return false;
	}
	
	var width = obj.width || 600,
	height = obj.height || 300,
	contentHeight = height - 40,
	fadeSpeed = obj.fadeSpeed || 'slow',
	opacity = obj.opacity || 0.5,
	modalColor = obj.modalColor || '#aeaeae',
	action = obj.action || '',
	title = obj.title || '';
	
	var $this = $('#' + id);
	$this.width(width).height(height);
	$this.find('.bpopupContentWarp').height(contentHeight);
	$this.find('.js-content').height(contentHeight);
	$this.find('.js-content-iframe').attr('src',action);
	console.log('height=' + height);
	console.log('contentHeight=' + contentHeight);
	
	if(title != ''){
		$this.find('.js-title').text(title);
	}
	
	var follow = true;
	if(typeof obj.follow != 'undefined'){
		follow = obj.follow;
	 } 
	
	$this.bPopup({
	    modalClose: false,//弹出框深色区域，关闭的响应
	    modalColor: modalColor,
	    opacity: opacity,
	    follow : [follow,follow],
	    fadeSpeed: fadeSpeed, //弹出速度  string ('slow'/'fast') or int (1500)   
	   //	position: [($(window).width() -$this.width()) / 2, ($(window).height() - $this.height()) / 2]
	   	position: [($(window).width() -$this.width()) / 2, 20]
	 });
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

<script type="text/javascript">
$(function(){
 	$('.icradio,.iccheckbox').iCheck({
 	    checkboxClass: 'icheckbox_square-firebrick',
 	    radioClass: 'iradio_square-firebrick',
 	    increaseArea: '0%' // optional
 	  });
})
function showPage(){};
</script>
<script type="text/javascript">
    //图片放大镜效果
    $(function(){
  		$('.pic-small').hover(function(){
  		   var $this = $(this);	
  		   var offset = $this.offset();
  		   var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
   		$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
   		$('body').append($div);
  		},function(){
  			$('.js-show-big-pic').remove();
  		});  
    });
</script>
<script type="text/javascript">
function clearNoNum(event,obj){ 
    //响应鼠标事件，允许左右方向键移动 
    event = window.event||event; 
    if(event.keyCode == 37 | event.keyCode == 39){ 
        return; 
    } 
    //先把非数字的都替换掉，除了数字和. 
    obj.value = obj.value.replace(/[^\d.]/g,""); 
    //必须保证第一个为数字而不是. 
    obj.value = obj.value.replace(/^\./g,""); 
    //保证只有出现一个.而没有多个. 
    obj.value = obj.value.replace(/\.{2,}/g,"."); 
    //保证.只出现一次，而不能出现两次以上 
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
} 

function checkNum(obj){ 
    //为了去除最后一个. 
    obj.value = obj.value.replace(/\.$/g,""); 
    //格式化2位小数
   obj.value = (obj.value != '') ? parseFloat(obj.value).toFixed(2) : ''; 
    
} 
</script>
<script type="text/javascript">
function ggFormSubmit(action, params){
	
	console.log('action=' + action);
	console.log('params=');
	console.log(params);
	
	// 创建Form  
    var form = $('<form></form>');  
 // 设置属性  
    form.attr('action', action);  
    form.attr('method', 'POST');  
    
    for(var key in params){
        form.append($('<input type="text" name="' + key + '" value="' + params[key] + '" />'));  
   	}
	console.log(form.html());
    form.appendTo(document.body).submit().remove();
	
}
</script>
<script type="text/javascript">
String.prototype.strlen = function() {    
    var len = 0;    
    for (var i=0; i<this.length; i++) {    
        if (this.charCodeAt(i)>127 || this.charCodeAt(i)==94) {    
             len += 2;    
         } else {    
             len ++;    
         }    
     }    
    return len;    
} 

</script>
<script type="text/javascript">
$.fn.extend({ 
	initForm : function(){
		$(':input[type="text"]',$(this)).val('');
		
	/* 	$(':input',$(this)).not(':button, :submit, :reset, :hidden')
		.val('')
		.removeAttr('checked')
		.removeAttr('selected'); */
		
		$(".select2",$(this)).select2('val',''); 
		
	}
}); 

</script>
