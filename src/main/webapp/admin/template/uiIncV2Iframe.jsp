<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
  <%@ include file="/admin/template/uiIncV2.jsp"%>
 <style>
<!--
.container {
  box-sizing: border-box;
   width: 910px;  
   margin-left: 0;
   margin-right: auto;
  }
-->
</style> 
 <script type="text/javascript">
 
$(function(){
	var docSize = documentSize();
	console.log('iframe width==' + docSize.width);
	$('html,body').css({
		'width' : docSize.width + 'px',
		'min-width' : docSize.width + 'px' 
	});
	
	console.log(window.innerWidth);
	//console.log($(window).innerWidth());
	
	/* var window_width =  $(window).width();
	var window_innerWidth =  $(window).innerWidth();
	var window_outerWidth =  $(window).outerWidth();
	
	var document_width =  $(document).width();
	var document_innerWidth =  $(document).innerWidth();
	var document_outerWidth =  $(document).outerWidth();
	
	var body_width =  $(document.body).width();
	var body_innerWidth =  $(document.body).innerWidth();
	var body_outerWidth =  $(document.body).outerWidth();
	
	var window_height =  $(window).height();
	var window_innerHeight =  $(window).innerHeight();
	var window_outerHeight =  $(window).outerHeight();
	
	var document_height =  $(document).height();
	var document_innerHeight =  $(document).innerHeight();
	var document_outerHeight =  $(document).outerHeight();
	
	var body_height =  $(document.body).height();
	var body_innerHeight =  $(document.body).innerHeight();
	var body_outerHeight =  $(document.body).outerHeight();
	
	console.log('window_width=' + window_width);
	console.log('window_innerWidth=' + window_innerWidth);
	console.log('window_outerWidth=' + window_outerWidth);
	console.log('document_width=' + document_width);
	console.log('document_innerWidth=' + document_innerWidth);
	console.log('document_outerWidth=' + document_outerWidth);
	console.log('body_width=' + body_width);
	console.log('body_innerWidth=' + body_innerWidth);
	console.log('body_outerWidth=' + body_outerWidth);
	
	console.log('window_height=' + window_height);
	console.log('window_innerHeight=' + window_innerHeight);
	console.log('window_outerHeight=' + window_outerHeight);
	console.log('document_height=' + document_height);
	console.log('document_innerHeight=' + document_innerHeight);
	console.log('document_outerHeight=' + document_outerHeight);
	console.log('body_height=' + body_height);
	console.log('body_innerHeight=' + body_innerHeight);
	console.log('body_outerHeight=' + body_outerHeight);   */
	
});
 
</script>
