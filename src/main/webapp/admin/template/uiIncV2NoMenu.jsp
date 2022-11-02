<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ include file="/admin/template/uiIncV2.jsp"%> 
 <script type="text/javascript">
 
$(function(){
	var docSize = documentSize();
	$('html,body').css({
		'width' : docSize.width + 'px',
		'min-width' : docSize.width + 'px' 
	});
});
 
</script>
<style type="text/css">
/************************ 内容区域样式  ************************/
.contents {
	margin-right: auto;
	margin-left: auto;
	width: 1200px;
 /*   border: 1px solid red;    */
 
 
}

.query-from .form-table {
  float: left;
  box-sizing: border-box;
  padding-right: 10px;
  width: 1016px;
}

</style>



<script type="text/javascript">
function ggAlert(type,msg){
	var _id =  'alert_' + _.random(1000000000, 9999999999);
	 $('.js-alert-warp').append((_.template($('#tpl_alert_' + type).html())({
		 	_id : _id
			,_msg:  msg
		})));
	 
	   setTimeout(function(){
		 $('#' + _id).slideUp(150,function(){
			 $(this).remove();
		 });
	 }, 1500);   
}
function ggAlertWarning(msg){
	ggAlert('warning', msg);
}

function ggAlertError(msg){
	ggAlert('error', msg);
}

function ggAlertSuccess(msg){
	ggAlert('success', msg);
	
}
function ggAlertDanger(msg){
	ggAlert('danger', msg);
}
function ggAlertInfo(msg){
	ggAlert('info', msg);
}
</script>
<div class="js-alert-warp alert-warp" style="position:fixed;  left: 400px; right: 400px; top: 0; z-index: 999999;">
</div>

<script id="tpl_alert_warning" type="text/template"> 
<div id="{{=_id}}" class="alert alert-warning">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong><ui:i18n key="警告"/>!</strong> {{=_msg }}
</div>
</script>
<script id="tpl_alert_error" type="text/template"> 
<div id="{{=_id}}" class="alert alert-error">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong><ui:i18n key="错误"/>!</strong> {{=_msg }}
</div>
</script>
<script id="tpl_alert_success" type="text/template"> 
<div id="{{=_id}}" class="alert alert-success">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong></strong> {{=_msg }}
</div>
</script>
<script id="tpl_alert_danger" type="text/template"> 
<div id="{{=_id}}" class="alert alert-danger">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong><ui:i18n key="危险"/>!</strong> {{=_msg }}
</div>
</script>
<script id="tpl_alert_info" type="text/template"> 
<div id="{{=_id}}" class="alert alert-info">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong></strong> {{=_msg }}
</div>
</script>