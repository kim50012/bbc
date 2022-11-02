<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="费用修改"/></title>
<style type="text/css">
 
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
<style>
 .popup-container{
 	position:relative;
 	/* background-color: green; */
 	padding: 20px;
 }
 
  
 
</style>

	<div class="popup-container" style="">
	 	 <div class="form-warp clearfix" >
	 	 	<div class="control-warp"  >
  			 	 <div class="form-label"  >
  			 		 <ui:i18n key="头像"/> : 
  			 	 </div>
  			 	 <div class="form-control">
  			 	 	（jpg格式，建议大小640*640）
  			 	 </div>
  			 </div>
	 	 	<div class="control-warp"  >
  			 	 <div class="form-label"  >
  			 		 <ui:i18n key="登陆账号"/><a class="label-required"></a> : 
  			 	 </div>
  			 	 <div class="form-control">
  			 	 	<input type="text"  placeholder="请输入登陆账号,最多10个字符，必须是英文或者数字字符" class="w33"  > @${wechatNo }<br>
  			 	 </div>
  			 </div>
	 	 	<div class="control-warp"  >
  			 	 <div class="form-label"  >
  			 		 <ui:i18n key="昵称"/><a class="label-required"></a> : 
  			 	 </div>
  			 	 <div class="form-control">
  			 	 	<input type="text"  placeholder="请输入昵称,最长6个汉字或12个英文字符" class="w33"  >
  			 	 </div>
  			 </div>
	 	 	<div class="control-warp"  >
  			 	 <div class="form-label"  >
  			 		 <ui:i18n key="密码"/><a class="label-required"></a> : 
  			 	 </div>
  			 	 <div class="form-control">
  			 	 	<input type="text"  placeholder="请输入6-16位的密码" class="w33"  > 
  			 	 </div>
  			 </div>
	 	 </div>
	 	 
	</div>
 
</body>
</html>