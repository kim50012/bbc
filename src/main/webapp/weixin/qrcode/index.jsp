<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  
  <title>微信分享链接生成页面</title>
  
  <script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  
 
    
  
  <style type="text/css">
  	* {
  		padding: 0; margin: 0;
  	}
	 
	.item { display:block;word-break: break-all; word-wrap: break-word; margin-bottom: 10px;background-color: #fff;padding: 10px; }
	
	
	#container{
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
		background-color: #fff;
		position: relative;
		padding-top: 10px;
	}
	
	table{border:0;margin:0;border-collapse:collapse;
	margin: 10px;
	}
	table td{padding:5;}
	
	.button{
		border: 1px solid green;
		background-color: #e3e3e3;
		padding:5px 20px;
		  border-radius: 8px;
		  display: inline-block;
		  cursor: pointer;
	}
	
	.button + .button{
		margin-left: 20px;
	}
  </style>
   <script type="text/javascript">
    
   $(function(){
	   $('#menuBtn').click(function(){
		   
		   var shopId = $('#shopId').val();
		   var type = $('input[name="qrcodeType"]:checked').val();
		 
		   if(shopId == ''){
			   alert('请选择Shop ID');
			   return false;
		   }
		   
	 // var url = 'http://www.hanzhimeng.com/wx/qrcode/create.htm?shopId=' + shopId + '&type=' + type;
		var url = '/wx/qrcode/create.htm?shopId=' + shopId + '&type=' + type;
		   
		   $('#ifr-result').attr('src',url);
		   
	   });
	   
   });
  </script>
  
 </head>
 <body style="background-color: #eee;min-width:1000px;">
  <div id="container" >
  	
  	 <h3 style="margin: 10px;">生成二维码</h3>
  	 
  	<table width="100%" >
	  <tr>
		<td width="10%">Shop ID: </td>
		<td width="23%">
		<select id="shopId" style="width: 90%; height:26px;"    >
            <option value=""></option>
            <c:forEach items="${requestScope.appInfoList}" var="item" varStatus="status">
				<option value="${item.shopId}" <c:if test="${shopId eq item.shopId }"> selected="selected" </c:if>>${item.shopId} - ${item.shopNm}</option>
			</c:forEach>
        </select>
		</td>
	 
		<td width="10%">二维码类型: </td>
		<td width="23%">
			<input type="radio" name="qrcodeType" value="1" checked="checked" />临时
			<input type="radio" name="qrcodeType" value="2" /> 永久
		</td>
		<td width="10%"></td>
		<td width="23%"></td>
	  </tr>
	  <tr>
		<td colspan="6" style="text-align: center;">
			<span class="button" id="menuBtn">生成</span>
			<!-- <span class="button" id="eventBtn">生成Event分享链接</span>
			<span class="button" id="letterBtn">生成分享链接(有Letter)</span>
			<span class="button" id="shareBtn">生成分享链接(无Letter)</span>
			<span class="button" id="adviceBtn">生成通知链接</span> -->
		</td>
	  </tr>
	  </table>
	  	 
  </div>
 
 <div style="margin: 10px auto; width: 95%;">
    <iframe id="ifr-result" src="" width="100%" height="500px" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes" style="background-color: #fff;min-height: 500px;"></iframe>
  	 
  </div> 
  

 </body> 
</html>