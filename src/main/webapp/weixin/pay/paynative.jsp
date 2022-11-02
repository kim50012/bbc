<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>支付确认</title>
<%@ include file="/front/skin/common.jsp"%>
 
  
 
 <script type="text/javascript">
 
  </script>
 

 </head>
 <body style="background-color: #f5f5f5;">
 
  
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		<div style="text-align:center; margin: 100px ;">
		  code_url = ${code_url }
		  <br>
		  <img alt="" style="width: 200px;" src="/wx/qrimg?code_url=${code_url }">
		
		</div>
		</section>
	</div>	
	
 
	
 
 </body> 
</html>