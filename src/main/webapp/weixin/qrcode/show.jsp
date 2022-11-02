<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>展示二维码</title>

 <style type="text/css">
 .qritem {
    padding: 10px;
    margin: 10px;
  }
   .qritem img{ 
  vertical-align: middle;
  width: 200px;
  height: auto;
  cursor: pointer;
  }
  
  .qritem .qrdesc{
    display: inline-block;
  }
  
  *{
  	padding: 0;
  	margin: 0;
  }
  
  h2,img,.qrdesc{
   margin-bottom: 10px;
  }
  li{list-style-type:none;
  padding: 5px 0; }
 </style>

</head>
<body>
<div style="width: 80%; margin: 0 auto; background-color: #e3e3e3;">

	<div class="qritem">
		<h2>二维码</h2>
		
		<img alt=""  src="${qrCodeMaster.FULL_URL }" title="${qrCodeMaster.FULL_URL }">  
		<%-- <img alt="" src="/wx/qrcode/showImg.htm?id=${qrCodeMaster.QRCODE_ID }&type=qrcode" title="/wx/qrcode/showImg.htm?id=${qrCodeMaster.QRCODE_ID }&type=qrcode"> 
	   --%>
	    <div class="qrdesc" style="margin-left: 0px; background-color: #fff; padding: 10px; ">
			<ul >
				<li>店铺ID : ${qrCodeMaster.SHOP_ID }</li>
				<li>二维码ID : ${qrCodeMaster.QRCODE_ID }</li>
				<li>场景值ID : ${qrCodeMaster.SCENE_ID }</li>
				<li>二维码类型 : ${qrCodeMaster.QRCODE_TYPE }</li>
				<li>有效时间 : <ui:date value="${qrCodeMaster.EXPIRE_DATE }"/></li>
				<li>ticket : ${qrCodeMaster.TICKET }</li>
				<li>二维码图片解析后的地址 : ${qrCodeMaster.WX_URL }</li>
				  <li>图片网页全路径 : ${qrCodeMaster.FULL_URL }</li>  
				<li>图片网页全路径 : /wx/qrcode/showImg.htm?id=${qrCodeMaster.QRCODE_ID }&type=qrcode</li>
				<li>尺寸 : ${qrCodeMaster.WIDTH } * ${qrCodeMaster.HEIGHT }</li>
			</ul>
		</div>
	
	
	<%-- <div class="qritem">
		<h2>根据ticket换取二维码</h2>
		<img alt="" src="${wxUrl }" title="${wxUrl }"> 
	</div> --%>
	<%-- <hr />
	<div class="qritem">
		<h2>/wx/qrcode/showImg.htm?id=${qrCodeMaster.QRCODE_ID }&type=qrcode</h2>
		<img alt="" src="/wx/qrcode/showImg.htm?id=${qrCodeMaster.QRCODE_ID }&type=qrcode" title="/wx/qrcode/showImg.htm?id=${qrCodeMaster.QRCODE_ID }&type=qrcode"> 
	</div> --%>
</div>
 

</body>
</html>