<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="设置店铺皮肤"/></title>  
<style type="text/css">
 body{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
.ui-right-content{
	position: relative;  
	width:100%;
}
.ui-right-content .table-head{
	margin-top:17px;
	margin-bottom: 30px; 
	width:100%;
	position: relative;
}
.ui-right-content .table-head tr .goodsGroup{
	font-size:14px;
	position: relative;
	height:24px;
	line-height:24px;
} 
.ui-right-content .table-head tr .goodsGroup a{
	color:#000000;
	cursor: pointer;
}
.ui-right-content .table-head tr .goodsGroup a img{
	margin-right:10px;
	margin-bottom:2px;
}
.ui-right-content .table-head tr .table-head-text{
	font-size:16px;
	background-color: #ffffff;
	width:180px;
}
.ui-right-content .table-head tr .table-head-text span{
	position:absolute;
	margin-top:2px;
}
.ui-right-content .table-head tr .goodsGroup .top_line{
	margin-left:20px;
	margin-right:20px;
	margin-bottom:2px;
}
.ui-gridarea.clearfix{
	position:relative;
	padding-top:20px;
	z-index: 10;
	font-size:13px;
	width:100%;
	margin-top:10px;
}
.ui-right-content  tbody .checkName{
	text-align:left;
	position: relative;
}
.ui-right-content  tbody .checkName span{
	margin-left:7px;
	position: absolute;
	top:14px;
	font-size:12px;
}
.ui-right-content  tbody input{
	margin-left: -17px;
	width:13px;
	height:13px;
}
.ui-right-content  tbody .checkName .logoPicture{
	width:60px;
	height:60px;
	border:1px solid #c5c5c5;
	display: inline-block;
	margin-top:12px;
	margin-bottom: 8px;
	margin-left:-5px;
}
.ui-right-content  thead input{
	margin-left:12px;
	width:13.53px;
	height:13.53px;
	margin-top: -2px;
}
 .poupMessage .poupMessageTable {
	height:170px;
	width:300px;
	border-radius:5px;
	text-align: center;
	font-size:15px;
}
 .poupMessage .poupMessageTable .poupTableHead td{
	height:35px;
	width:300px;
	background-color: #d1102d;
	border-radius:5px 5px 0px 0px;
	font-size:14px;
	color: #ffffff;
	text-align:left;
}
 .poupMessage .poupMessageTable .poupTableHead td span{
 	margin-left:20px;
 }
 .poupMessage .poupMessageTable .tableSpanMessage td{
	font-size:14px;
	height:20px;
	padding-top:40px;
	padding-bottom:30px;
}
 .poupMessage .poupMessageTable .tableSpanMessage td input{
 	margin-top:20px;
 	font-size:14px;
 }
 .poupMessage .poupMessageTable .tableMessageImg img{
	cursor: pointer;
}
.poupMessage .poupMessageTable td img{
	cursor: pointer;
}
.poupMessage{
	position: absolute;
	background-color: #ffffff;
	top:-70px;
	left:-150px;
	border:1px solid #eeeeee; 
	border-radius:5px;
	width:300px;
	height:180px;
	z-index: 2000;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
}
 

.table-head-text img{
	padding-left:15px;
	margin-right:20px;
}
.bodyDiv{
	width:100%;
}
.bodyDiv .showPage{
	margin-top:20px;
	width:100%;
	height:370px;
	border-bottom:1px solid #eeeeee;
	text-align:center;
}
.bodyDiv .showPage .showLine{
	width:33.33%;
	border-right:1px solid #eeeeee;
}
 .bodyDiv .showPage .showImageDiv{
 	display:inline-block;
	margin-top:10px;
	width:180px;
	height:350px;
}
.bodyDiv .showPage .showImageDiv .imgDiv{
	width:100%;
	height:35px;
}
.bodyDiv table{
	width:100%;
	font-size:14px;
}
.bodyDiv .showPage table tr td .inputName{
	width:300px;
	height:30px;
	padding:0;
	border-radius:4px;
	margin-left:0px;
	margin-bottom:0;
	margin-top:0;
	border:0;
}
.codeDiv{
	width:95px;
	height:95px;
	margin-top:-100px;	
}
.imgList{
	width:100%;
	height:400px;
	margin-top:10px;
	margin-bottom: 10px;
}
.imgList tr td{
	width:25%;
	text-align:center;
}
.bodyDiv .imgList .showImageDiv{
	display:inline-block;
	margin-top:15px;
	width:180px;
	height:360px;
	margin-top:-10px;
}
.bodyDiv .imgList .showImageDiv .showImageTitile{
	font-size:14px;
	height:25px;
	border-radius:4px 4px 0 0;
	background-color: #c5c5c5;
	text-align:center;
	color:#ffffff;
	line-height: 25px;
}


.showImageBody{
	width:100%;
	height:285px;
}

.bodyDiv .imgList .showImageDiv .showImageFooter{
	height:50px;
	padding-top: 10px;
	position: relative;
}

.showImageFooter span{
  line-height: 36px;
  height: 36px;
  display: inline-block;
  box-sizing:border-box; 
  
}

.showImageFooter .themeTitle{
	width: 90px;
	top: -10px;
	position: relative;
}

.showImageFooter .themeItem{
 	display: inline-block;
  	box-sizing:border-box; 
	width: 35px;
	cursor: pointer;
	margin-left: 5px;
	padding: 1px;
	line-height: 36px;
  	height: 36px;
}

.showImageFooter .themeItem.selected{
  border: 1px solid #c5c5c5;
}

.showImageFooter  .themeItem .themeColor{
	display:inline-block;
	height: 100%;
	width: 100%;
}

.themeColor-1{
	background-color: #D1102D;
}

.themeColor-2{
	background-color: #376abe;
}

.themeColor-3{
	background-color: #98bd3c;
}

.themeColor-4{
	background-color: #00b050;
}

.themeColor-5{
	background-color: #fd402d;
}

.themeColor-6{
	background-color: #e6de0a;
}

.themeColor-7{
	background-color: #466a7a;
}

.themeColor-8{
	background-color: #358c46;
}
 .showMainUrl{
 	width:400px;
	display: inline-block;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
 }
 .code-image-show{
 	width:180px;
 	height:180px;
 	border:1px solid #e5e5e5;
 	position: relative;
 	text-align: center;
 	margin-top:20px;
 	background-color: #f7f7f7;
 }
 .code-image-show span{
 	display:inline-block;
 	padding-top:20px;
 }
 .or-code-image{
 	position: absolute;
 	top:20px;
 	left:17px;
 	width:180px;
 	height:180px;
 	cursor: pointer;
 	opacity:0;
 }
 .submit-div-cust-menu{
	width:98px;
	height:31px;
	border-radius:31px;
	line-height:31px;
	background-position: 10px 8px;
	background-repeat: no-repeat;
	color:#313131;
	cursor: pointer;
}
.submit-div-cust-menu.submit-cust-menu{
	background-image: url("/admin/images/transport/tick.png");
	border:2px solid #0e9615;
	margin-left:20px;
	display: inline-block;
}
.submit-div-cust-menu.exitPoup{
	background-image: url("/admin/images/transport/close.png");
	border:2px solid #d1102d;
	margin-left:20px;
	display: inline-block;
}
.submit-div-cust-menu span{
	margin-left:45px;
}
 .submit-div-bottom{
 	width:100%;
 	text-align: center;
 	margin-top:30px;
 }
 .bpopupContentWarp{text-align: center;}
</style> 
 
<script type="text/javascript">
var imgUrl=[
        	'/admin/images/shopMainPage/templet01_01.png'
        	,'/admin/images/shopMainPage/templet01_02.png'
        	,'/admin/images/shopMainPage/templet04_01.png'
        	,'/admin/images/shopMainPage/templet04_02.png'
        	,'/admin/images/shopMainPage/templet02_01.png'
        	,'/admin/images/shopMainPage/templet02_01.png'
        	,'/admin/images/shopMainPage/templet03_01.png'
        	,'/admin/images/shopMainPage/templet03_01.png'
        ];
//弹出下架一组商品时候的确认对话框
function bPoupDivDelete(){
	showIframeBpopupWindow({
		id : 'bpoupMessageCancel',
		width : 350,
		height : 175,
	});
}
//弹出保存确认对话框
function bPoupDivSave(){
	var imgLogoPicture =  document.getElementById('QrCodeImage').value;
	var QrCodeImageName = '';
	var item = $('#codeImageShow').find('img').attr('data-item');
	if(item != '1'){
		if(imgLogoPicture == ''){
	    	alert('<ui:i18n key="请上传店铺的二维码图片"/>');
	    	return;
	    }else{
	    	 var type = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('.') + 1, imgLogoPicture.length).toLowerCase();
	    	 if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
	             alert('<ui:i18n key="背景图片格式不正确"/>');
	             return;
	         }else{
	        	 QrCodeImageName=imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
	         } 
	    }
}
	showIframeBpopupWindow({
		id : 'bpoupMessage',
		width : 350,
		height : 175,
	});

}
//修改店铺主页
function updateShopPage(){
	var skinId = $('#skinId').val();
	var pageId = $('#pageId').val();
	var imgLogoPicture = document.getElementById('QrCodeImage').value;
	var QrCodeImageName = '';
	var item = $('#codeImageShow').find('img').attr('data-item');
	if(item != '1'){
		if(imgLogoPicture == ''){
	    	alert('<ui:i18n key="请上传店铺的二维码图片"/>');
	    	return;
	    }else{
	    	 var type = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('.') + 1, imgLogoPicture.length).toLowerCase();
	    	 if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
	             alert('<ui:i18n key="背景图片格式不正确"/>');
	             return;
	         }else{
	        	 QrCodeImageName=imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
	         } 
	    }
	}
	var param = {
					skinId : skinId
					,pageId : pageId
					,QrCodeImageName : QrCodeImageName
				};
	$.ajaxFileUpload ({
		data:param,
		url : '/admin/shop/updateShopPage.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		secureuri :false,
		fileElementId :'QrCodeImage',
		dataType : 'json',
		type:'post',
		success : function(data){
			if(data.result == 'success'){
				alert('<ui:i18n key="保存成功"/>');
				window.location.href='/admin/shop/shopMainPage.htm';
			}else if(data.result == 'fail'){
				alert('<ui:i18n key="保存失败"/>，<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	});
}
//选择主页
$(function(){
	showImage();
	$('.themeItem').click(function(){
		var $this = $(this);
		
		var item = Number($this.data('item'));
		$('#skinId').val(item);
		$('.themeItem').removeClass('selected');
		$this.addClass('selected');
			
		$('.showImageTitile img').hide();
		$('.showImageTitile span').show();
		
		$this.closest('.showImageDiv').find('.showImageTitile').find('img').show();
		$this.closest('.showImageDiv').find('.showImageTitile').find('span').hide();
		$this.closest('.showImageDiv').find('.showImageBody').find('img').attr('src',imgUrl[item-1]);
		$('.showImageMain').attr('src',imgUrl[item-1]);
	});
});
//一开始加载时候显示主页
function showImage(){
	var skinId = Number($('#skinId').val());
	$('.showImageMain').attr('src',imgUrl[skinId-1]);
	if(skinId == 1 || skinId == 2){
		$('#showImageBody1').attr('src',imgUrl[skinId-1]);
	}else if(skinId == 3 || skinId == 4){
		$('#showImageBody2').attr('src',imgUrl[skinId-1]);
	}else if(skinId == 5 || skinId == 6){
		$('#showImageBody3').attr('src',imgUrl[skinId-1]);
	}
}


function logoUpload(file){
	if(checkImage(file)){
		$('#codeImageShow').children().remove(); 
		 var prevDiv = document.getElementById('codeImageShow');
		 var htm = '';
		 if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt){
			 	prevDiv.innerHTML = '<img style="width:100%;height:100%;" id="imgInput" alt="logo" src="' + evt.target.result + '" />';
			}
		 reader.readAsDataURL(file.files[0]);
		}
		else{
			prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
		}
	}else{
		var prevDiv = document.getElementById('codeImageShow');
		prevDiv.innerHTML ='';
		$('#codeImageShow').children().remove();
		var htm='<img style="margin-top:50px;" src="/admin/images/shopMainPage/icon_img_36.png" alt="" id="imgUpload"/><br/><span><ui:i18n key="请上传二维码图片"/></span>';
		$('#codeImageShow').append(htm);
	}
}


//检查上传文件是否为图片
function checkImage(file){
	if(file.value == ''){
		return false;
	}
	var picPath = file.value;
	var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
	if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
	    alert('<ui:i18n key="请上传正确的图片格式"/>');
	    return false;
	}
	return true;
}
function cancel(){
	closeBpopupWindow('bpoupMessage');
}
function cancelSet(){
	closeBpopupWindow('bpoupMessageCancel');
}
</script>
 	
</head>
<body>
	<!-- ▼ container  --> 
	<div class='container'>
		<div class="bodyDiv" >
	  			<ul>
	  				<li class="showPage">
	  					<table>
	  						<tr>
	  							<td rowspan="3" class="showLine">
	  								<div class="showImageDiv">
	  									<div class="imgDiv">
	  										<img src="/admin/images/shopMainPage/title.png"/>
	  									</div>
	  									<div class="showImageBody">
	  										<img class="showImageMain" src="/admin/images/shopMainPage/templet01_01.png"/>
	  									</div>
	  								</div>
	  							</td>
	  							<td style="width:17%;height:30px;text-align: right;padding-top:30px;">
	  								<span style="margin-right:20px;"><ui:i18n key="店铺名称"/>：</span>
	  							</td>
	  							<td style="width:49.67%;padding-top:30px;text-align:left;">
	  								<%-- <input type="text" readonly="readonly" class="inputName" id="shopName" value="${requestScope.resultMap.PAGE_NM_SHOP_MAIN}" /> --%>
	  								<span>${requestScope.resultMap.PAGE_NM_SHOP_MAIN}</span>
	  							</td>
	  						</tr>
	  						<tr>
	  							<td style="height:30px;padding-top:10px;text-align:right;">
	  								<span style="margin-right:20px;"><ui:i18n key="店铺URL"/>：</span>
	  							</td>
	  							<td style="padding-top:10px;text-align:left;">
	  								<%-- <input type="text" class="inputName" id="shopName" value="${requestScope.resultMap.MAIN_URL}" readonly="readonly" /> --%>
	  								<span class="showMainUrl">${requestScope.resultMap.MAIN_URL}</span>
	  								<input type="hidden" id="skinId" value="${requestScope.resultMap.SKIN_TYPE }"/>
	  								<input type="hidden" id="pageId" value="${requestScope.resultMap.PAGE_ID_SHOP_MAIN  }"/>
	  							</td>
	  						</tr>
	  						<tr>
	  							<td style="padding-top:10px;text-align:right;vertical-align: top;">
	  								<span style="margin-right:20px;"><ui:i18n key="店铺二维码"/>：</span>
	  							</td>
	  							<td style="position: relative;text-align:left;vertical-align: top;">
	  								<c:if test="${requestScope.resultMap.FILE_URL=='' or requestScope.resultMap.FILE_URL==null}">
	  									<div class="code-image-show" id="codeImageShow"> <!-- class="codeDiv" -->
		  									<!-- <img src="http://www.hanzhimeng.com/uploads/7/2015/03/09/7_shop_2015_03_09_19_51_56_59044.jpg" > -->
		  									<img style="margin-top:50px;" src="/admin/images/shopMainPage/icon_img_36.png" alt="" id="imgUpload"/><br/>
		  									<span><ui:i18n key="请上传二维码图片"/></span>
		  								</div>
	  								</c:if>
	  								<c:if test="${requestScope.resultMap.FILE_URL!='' and requestScope.resultMap.FILE_URL!=null}">
	  									<div class="code-image-show" id="codeImageShow"> <!-- class="codeDiv" -->
		  									<!-- <img src="http://www.hanzhimeng.com/uploads/7/2015/03/09/7_shop_2015_03_09_19_51_56_59044.jpg" > -->
		  									<img   data-item="1" src="${requestScope.resultMap.FILE_URL}" style="width:100%;height:100%;"/>
		  								</div>
	  								</c:if>
	  								<input type="file" id="QrCodeImage" name="QrCodeImage" value="" class="or-code-image" style="width:180px;height:180px;" onchange="logoUpload(this);"/>
	  							</td>
	  						</tr>
	  					</table>
	  				</li>
	  				<li>
	  					<table  class="imgList">
	  						<tr>
	  							<td style="border-right:1px solid #eeeeee;">
	  								<div class="showImageDiv">
	  									<div class="showImageTitile">
	  										<c:if test="${requestScope.resultMap.SKIN_TYPE ==1 or requestScope.resultMap.SKIN_TYPE ==2}">
	  											<img style=" border: none;" src="/admin/images/shopMainPage/check.png"/>
	  											<span style="display:none;"><ui:i18n key="选择"/></span>
	  										</c:if>
	  										<c:if test="${requestScope.resultMap.SKIN_TYPE !=1 and requestScope.resultMap.SKIN_TYPE !=2}">
	  											<img style="display:none; border: none;" src="/admin/images/shopMainPage/check.png"/>
	  											<span><ui:i18n key="选择"/></span>
	  										</c:if>
	  									</div>
	  									<div class="showImageBody" >
	  										<img id="showImageBody1" src="/admin/images/shopMainPage/templet01_01.png"/>
	  									</div>
	  									
	  									<div  class="showImageFooter">
	  										<span class="themeTitle"><ui:i18n key="皮肤一"/>：</span>
	  										<div data-item="1" class="themeItem <c:if test="${requestScope.resultMap.SKIN_TYPE ==1}"> selected </c:if>">
												<a class="themeColor themeColor-1"></a>
											</div>
											<div  data-item="2" class="themeItem <c:if test="${requestScope.resultMap.SKIN_TYPE ==2}"> selected </c:if>">
												<a class="themeColor themeColor-2"></a>
											</div>
	  									</div>
	  								</div>
	  							</td>
	  							<td style="border-right:1px solid #eeeeee;">
	  								<div class="showImageDiv">
	  									<div class="showImageTitile">
	  										<c:if test="${requestScope.resultMap.SKIN_TYPE ==3 or requestScope.resultMap.SKIN_TYPE ==4}">
	  											<img src="/admin/images/shopMainPage/check.png"/>
	  											<span style="display:none;"><ui:i18n key="选择"/></span>
	  										</c:if>
	  										<c:if test="${requestScope.resultMap.SKIN_TYPE !=3 and requestScope.resultMap.SKIN_TYPE !=4}">
	  											<img style="display:none;" src="/admin/images/shopMainPage/check.png"/>
	  											<span><ui:i18n key="选择"/></span>
	  										</c:if>
	  									</div>
	  									<div class="showImageBody" >
	  										<img id="showImageBody2" src="/admin/images/shopMainPage/templet04_01.png"/>
	  									</div>
	  									 <div  class="showImageFooter">
	  										<span class="themeTitle"><ui:i18n key="皮肤二"/>：</span>
	  										<div data-item="3" class="themeItem <c:if test="${requestScope.resultMap.SKIN_TYPE ==3}"> selected </c:if>">
												<a class="themeColor themeColor-3"></a>
											</div>
											<div  data-item="4" class="themeItem <c:if test="${requestScope.resultMap.SKIN_TYPE ==4}"> selected </c:if>">
												<a class="themeColor themeColor-4"></a>
											</div>
	  									</div>
	  								</div>
	  							</td>
	  							<td>
	  								<div class="showImageDiv">
	  									<div class="showImageTitile">
	  										<c:if test="${requestScope.resultMap.SKIN_TYPE ==5 or requestScope.resultMap.SKIN_TYPE ==6}">
	  											<img src="/admin/images/shopMainPage/check.png"/>
	  											<span style="display:none;"><ui:i18n key="选择"/></span>
	  										</c:if>
	  										<c:if test="${requestScope.resultMap.SKIN_TYPE !=5 and requestScope.resultMap.SKIN_TYPE !=6}">
	  											<img style="display:none;" src="/admin/images/shopMainPage/check.png"/>
	  											<span><ui:i18n key="选择"/></span>
	  										</c:if>
	  									</div>
	  									<div class="showImageBody" >
	  										<img id="showImageBody2" src="/admin/images/shopMainPage/templet02_01.png"/>
	  									</div>
	  									 <div  class="showImageFooter">
	  										<span class="themeTitle"><ui:i18n key="皮肤三"/>：</span>
	  										<div data-item="5" class="themeItem <c:if test="${requestScope.resultMap.SKIN_TYPE ==5}"> selected </c:if>">
												<a class="themeColor themeColor-5"></a>
											</div>
											<div  data-item="6" class="themeItem <c:if test="${requestScope.resultMap.SKIN_TYPE ==6}"> selected </c:if>">
												<a class="themeColor themeColor-6"></a>
											</div>
	  									</div>
	  								</div>
	  							</td>
	  						</tr>
	  					</table>
	  				</li>
	  			</ul>
	  		</div>       	  		
		</div>
		<div class="submit-div-bottom">
			<span class="button bg-red js-trans-order-confirm" onclick="bPoupDivSave();">
				<span class="button-icon conform"></span>
					<ui:i18n key="保存"/>
			</span>
			<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="bPoupDivDelete();">
				<span class="button-icon cancel"></span>
					<ui:i18n key="取消"/>
			</span>
		</div>
		
		<!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpoupMessage" >
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="提示信息"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<input type="hidden" vlaue="" id="displayGoodsId"/>
		 		 	<div style="height:30px;"></div>
		 		 	<span style="font-size:14px;color:#333;"><ui:i18n key="您确定保存该主页吗"/>？</span>
				 	<div style="height:30px;"></div>
		 		 	<span class="button bg-red js-trans-order-confirm"  onclick="updateShopPage();">
						<span class="button-icon conform"></span>
						<ui:i18n key="保存"/>
					</span>
					<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancel();">
						<span class="button-icon cancel"></span>
						<ui:i18n key="取消"/>
					</span>
		 		 </div>
		 	</div>
		</div>
	<!-- ▲ bpopup area -->
	<!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpoupMessageCancel" >
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="提示信息"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<div style="height:30px;"></div>
		 		 	<span style="font-size:14px;color:#333;"><ui:i18n key="您确定取消刚才的设置吗"/>？</span>
				 	<div style="height:30px;"></div>
		 		 	<span class="button bg-red js-trans-order-confirm"  onclick="javascript:window.location.href='/admin/shop/shopMainPage.htm'">
						<span class="button-icon conform"></span>
						<ui:i18n key="确认"/>
					</span>
					<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancelSet();">
						<span class="button-icon cancel"></span>
							<ui:i18n key="取消"/>
					</span>
		 		 </div>
		 	</div>
		</div>
	<!-- ▲ bpopup area -->
	</div>
	<!-- ▲ container  -->
</body>
</html>