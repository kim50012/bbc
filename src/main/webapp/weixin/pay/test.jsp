<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<base href="${basePath }">  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微信支付接口调试</title>

<script type="text/javascript" src="<c:url value="/admin/js/jquery-1.11.1.min.js" />"></script>
</head>
<body>
<center>


 	<h3>微信支付接口调试</h3>

	<table style="width: 700px;border: 1px solid gray; margin-top: 20px; ">
  <tr>
	<td width="200px" height="30px;" style="text-align: right; padding-right: 20px;">订单号:</td>
	<td><input type="text" id="orderId" name="orderId"  style="text-align: left;width: 400px;" /></td>
  </tr>
  <tr>
	<td colspan="2" height="30px;" style="text-align: center;"><button id="orderquery">订单查询</button></td>
  </tr>
 
  </table>
  <div id="result" style="width: 700px;border: 1px solid gray; min-height: 300px; text-align: left; margin-top: 10px;">
  
  	
  </div>
  
   <img alt="" src="/weixin/pay/qrcode_for_gh_c2bb99ea6fa5_258.jpg"  style="width: 100%;height: auto;">
  
</center>
	<script type="text/javascript">
	
	$(function(){
		
		$('#orderquery').click(function(){
			
			 $('#result').html('');
			if($('#orderId').val() == ''){
				alert('orderId为空!');
				return false;
			}
			
			
			$.ajax({
		 		data:{orderId: $('#orderId').val()},
				type : "POST",
				url : "/wx/pay/orderquery.htm",
				success : function(res) {
					
					 var str = '';
					 if(res.success){
						 var str = 'success=' + res.success + '<br>'
						  		+ 'data=' + res.data ;
					 }else{
						 var str ='success=' + res.success + '<br>'
					  		+ 'err_msg=' + res.err_msg ;
						 
					 }
					 
					 $('#result').html(str);
					  
					 
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
			});
			
		});	
	});
	
	</script>
</body>
</html>