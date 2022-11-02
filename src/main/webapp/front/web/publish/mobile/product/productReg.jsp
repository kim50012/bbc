<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Online Shop" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>

	<div id="wrap">
		
		<!--  Container : S -->
		<section id="container">
			<div class="location">
				<a href="/front/web/publish/mobile/main/index.htm" class="arrow"><i>back page</i></a>
				<h2>상품 등록 페이지</h2>
			</div>
		    <div class="comment-box">
		    
				<div class="input">
					<select id="goodsId">
							<option value="">가맹점을 선택하세요.</option>
						<c:forEach var="goodList" items="${goodList}" varStatus="status">	
							<option value="${goodList.GOODS_ID }">${goodList.GOODS_NM }</option>
							<c:set var="gcId" value="${goodList.GC_ID_LV1 }" />
						</c:forEach>
					</select>
				</div>
				<input type="hidden" id="gcId" value="${gcId }" />
				<input type="hidden" id="strSpecId" />
				<input type="hidden" id="strSpecValueId" />
					
				<div class="input"><input type="text" id="reviewTitle" title="상품명" placeholder="상품명" /></div>
				
				<div class="input">
					<select id="sgcIdSplit1">
							<option value="">카테고리를 선택하세요.</option>
						<c:forEach var="goodClassLevel1" items="${goodClassLevel1}" varStatus="status">	
							<option value="${goodClassLevel1.SGC_ID }">${goodClassLevel1.SGC_NM }</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="input">
					<select id="sgcIdSplit2">
							<option value="">카테고리를 먼저 선택하세요.</option>
					</select>
				</div>
				
				<div class="input"><textarea id="strContent" title="상품설명" placeholder="상품설명"></textarea></div>
				
				<div class="input"><input type="tel" id="strPriceOrg" title="할인전가격" placeholder="할인전가격" /></div>
				<div class="input"><input type="tel" id="strPrice" title="판매가격" placeholder="판매가격" /></div>
				
				<div class="input"><input type="date" id="startDt" title="판매 시작일자" placeholder="판매 시작일자" value="${startDt }"/></div>
				<div class="input"><input type="date" id="endDt" title="판매 종료일자" placeholder="판매 종료일자" value="${endDt }"/></div>

				<div class="input">
					<select id="itemType">
							<option value="1">시스템 판매</option>
							<option value="2">다른 사이트 판매</option>
					</select>
				</div>
				<div class="input"><input type="text" id="itemUrl" title="상품구매 URL" placeholder="상품구매 URL" /></div>
				
				<p class="text" style="padding-bottom: 5px;padding-top: 3px;">
					<i class="ico-warning2"></i>사진등록
				</p>

				<style>
					.imgDiv{width: 100%;height:auto; min-height: 80px;background-color: #ffffff;position: relative;}
					.imgshow{width:65px;height:65px;border: 1px solid #d6d6d6;text-align: center;line-height:65px;float: left;margin-left: 10px;margin-bottom:3%; position: relative;}
					.imgshow span{font-size: 40px;color: #d6d6d6;display: inline-block;}
				</style>

				<div class="imgDiv js-img-warp">
					<div class="imgshow js-img-add" id="preview" onclick="chooseImage();">
						<div class="close" onclick="deleteImg(this);" style="display:none;">x</div>
						<span>+</span>
					</div>
					<div style="clear: both;"></div>
				</div>
								
				
				<p class="text">
					<i class="ico-warning2"></i>购买商品后在PC端填写Premium商品评价 <br />新世界将根据评价内容的质量赠予积分。
				</p>
				<div class="btn-group type2">
					<a href="#" class="btn-gray">
						<span onclick="window.href='/front/web/publish/mobile/main/index.htm'">취소</span>
					</a>
					<a href="#" class="btn-red">
						<span>등록</span> <!--  onclick="addProduct();" -->
					</a>
				</div>
			</div>
		</section>
		<!--  Container : E -->
		
	</div>
	
	<script>
		$('.volume .btn-minus').click(function(){
			var number = parseInt($('.volume input').val());
			if(number > 0){
				$('.volume input').val(number -1);
			}
			return false;
		});
		$('.volume .btn-plus').click(function(){
			var number = parseInt($('.volume input').val());
			$('.volume input').val(number +1);
			return false;
		});
		

		function deleteImg(id) {
			$('#preview'+id).remove();
		}		

		$('.btn-red').click(function(){
			try {
				var stockAreaId = 13779;
				var gcId = $("#gcId").val();
				var goodsId = $("#goodsId").val();
				var strPriceOrg = $("#strPriceOrg").val();
				var strPrice = $("#strPrice").val();
				var strStock = "9999";
				
				var sgcIdSplit = $('#sgcIdSplit1').val() + ',' + $('#sgcIdSplit2').val();
				var strSpecId = $("#strSpecId").val();
				var strSpecValueId = $("#strSpecValueId").val();
				
				
				var startDt = $("#startDt").val();
				var endDt = $("#endDt").val();
				
				var reviewTitle = $("#reviewTitle").val();
				var listClassName = $("#reviewTitle").val();
				
				var strContent = $("#strContent").val();

				var itemType = $("#itemType").val();
				var itemUrl = $("#itemUrl").val();

				var reviewImg1 = '';
				var reviewImg2 = '';
				var reviewImg3 = '';
				var reviewImg4 = '';
				var reviewImg5 = '';
				var reviewImgUrl1 = '';
				var reviewImgUrl2 = '';
				var reviewImgUrl3 = '';
				var reviewImgUrl4 = ''; 
				var reviewImgUrl5 = '';
				
				
				if (reviewTitle == "") {
					alert("제목을 입력하세요.");
					return;
				}

				if (listClassName == "") {
					alert("내용을 입력하세요.");
					return;
				}
							
				$('.js-img-show').each(function(idx){
					if(idx < 5){
						if (idx == 0) {
							reviewImg1 = $(this).data('file-id');
							reviewImgUrl1 = $(this).data('full-url');
						}
						if (idx == 1) {
							reviewImg2 = $(this).data('file-id');
							reviewImgUrl2 = $(this).data('full-url');
						}
						if (idx == 2) {
							reviewImg3 = $(this).data('file-id');
							reviewImgUrl3 = $(this).data('full-url');
						}
						if (idx == 3) {
							reviewImg4 = $(this).data('file-id');
							reviewImgUrl4 = $(this).data('full-url');
						}
						if (idx == 4) {
							reviewImg5 = $(this).data('file-id');
							reviewImgUrl5 = $(this).data('full-url');
						}
					}
				});			
				
				$.ajax({
			 			data:{
			 				stockAreaId : stockAreaId
			 				,gcId : gcId
			 				,goodsId : goodsId
			 				,strPriceOrg : strPriceOrg
			 				,strPrice : strPrice
			 				,strStock : strStock
			 				,sgcIdSplit : sgcIdSplit
			 				,strSpecId : strSpecId
			 				,strSpecValueId : strSpecValueId
			 				,startDt : startDt
			 				,endDt : endDt
			 				,reviewTitle : reviewTitle
			 				,listClassName : listClassName
			 				,strContent : strContent
			 	 			,reviewImg1 : reviewImg1
			 	 			,reviewImg2 : reviewImg2
			 	 			,reviewImg3 : reviewImg3
			 	 			,reviewImg4 : reviewImg4
			 	 			,reviewImg5 : reviewImg5
			 	 			,reviewImgUrl1 : reviewImgUrl1
			 	 			,reviewImgUrl2 : reviewImgUrl2
			 	 			,reviewImgUrl3 : reviewImgUrl3
			 	 			,reviewImgUrl4 : reviewImgUrl4
			 	 			,reviewImgUrl5 : reviewImgUrl5
			 	 			,itemType : itemType
			 	 			,itemUrl : itemUrl
			 	 		},
					type : "POST",
					cache : false,
					dataType: 'json',
					url : "/front/web/publish/mobile/product/productSave.htm",
					success : function(data) {
						alert("상품 등록이 되었습니다.");
						location.reload();
					},
					error : function(xhr, status, e) {
						alert("상품 등록시 오류가 발생하였습니다.");
					}
				});				
			}
			catch(err) {
			    alert(err.message);
				//console.log(err);
			}
		});

		//当商品分类第一个下拉框变化时
		$('#sgcIdSplit1').change(function(e){ 
			var val = $(this).val();
			var $combo = $('#sgcIdSplit2');
// 			$combo.select2('val','');
			 $combo.html('<option value="" >서브 카테고리를 선택하세요.</option>');//清空select内容
			if(val == ''){
				$combo.prop('disabled', true).trigger('change');
			}else{
				$combo.prop('disabled', false);
				$.ajax({
					url : '/front/web/publish/mobile/product/getGoods2edClassCombo.htm',
	       	 		data:{sgcId: val},
					success : function(res) {
						 var list = res.list;
						 if(!!list.length){
						 	 for(var i = 0 ; i < list.length ; i++){
						 	 	$combo.append('<option value="' + list[i].SGC_ID + '">' + list[i].SGC_NM + '</option>');
						 	 }
// 							$combo.select2('open'); 
						 }  
					},
					error : function(xhr, status, e) {
						alert("error: " + status);
					}
	 			});
			}
		});
		

		$('#sgcIdSplit2').change(function(e){ 
			var val = $(this).val();
			var specNm=$("#sgcIdSplit1").find("option:selected").text();
			var specValueNm=$("#sgcIdSplit2").find("option:selected").text();
			
			if (specValueNm == "서브 카테고리를 선택하세요." || specNm == "") {
				return;
			}

			var gg_gcId = $("#gcId").val();
			
			$.ajax({
				type : "POST",
				url : '/front/web/publish/mobile/product/addSpecLevelOne.htm',
		 		data:{
		 			gcId: gg_gcId
		 			,specNm : specNm
		 		},
				success : function(res) {
					
					if(res.success){
						$("#strSpecId").val(res.SPEC_ID);
						
						$.ajax({
							type : "POST",
							url : '/front/web/publish/mobile/product/addSpecLevelTwo.htm',
					 		data:{
					 			gcId: gg_gcId
					 			,specId : res.SPEC_ID
					 			,specValueNm : specValueNm
					 		},
							success : function(res2) {
								if(res2.success){
									$("#strSpecValueId").val(res2.SPEC_VALUE_ID);
								}else{
									alert(res2.errorMsg);
								}
							},
							error : function(xhr, status, e) {
								alert('error: ' + status);
							}
			 			});						
						
					}else{
						alert(res.errorMsg);
					}
				},
				error : function(xhr, status, e) {
					alert('error: ' + status);
				}
 			});

		});	
		
	</script>
	
	
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

/*************************************************/
/****************  图像接口  **********************/
/*************************************************/
// 图片接口
//拍照、本地选图
var images = {
  localId: [],
  serverId: []
};

//拍照或从手机相册中选图接口
function chooseImage(){
  	wx.chooseImage({
    	success: function (res) {
    		images.localId = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
    		//alert('已选择 ' + res.localIds.length + ' 张图片');
    		
    		if(res.localIds.length > 5){
    			alert('이미지는 최대 5개까지 업로드 가능합니다.');
    		}
    	}
    	,fail: function(res){
    	}
    	,complete: function(res){
    		uploadImage();
    	}
    	,cancel: function(res){
    	} 
	});
}

//上传接口
function uploadImage(){

	var i = 0, length = images.localId.length; 

	if (images.localId.length == 0) {
		return;
	}  
	
	images.serverId = [];
	  
	if(length > 5) {
	   	alert('이미지는 5개까지 업로드 가능합니다.');
	}
	function upload() {
		
		var imgId = images.localId.shift();
		
		if(!!imgId){
			wx.uploadImage({
	        	localId: imgId,
	        	success: function (res) {
	 		      	$.ajax({
	 		    		async: false,  
		        	 	data:{
		        	 		shopId: '${shopId }',
		        	 		mediaId: res.serverId,
		        	 		fileType: 1,   //1:图片  2：语音
		        	 		date : new Date()
		        	 	},
		 				type : "POST",
		 				url : "/wx/media/download.htm",
		 				timeout : 15000,
		 				success : function(res) {
		 					
	 					 	if(res.success){

	 							var fileId = res.data.fileId;
	 							var fullUrl = res.data.fullUrl;
	 					
		 						var imgItem = '<div class="imgshow js-img-show" id="preview' + fileId + '" data-file-id="' + fileId + '" data-full-url="' + fullUrl + '">' 
							 				+ '<div class="close" onclick="deleteImg(' + fileId + ');">x</div>'
							 				+ '<img class="upload-img" alt="" src="' + fullUrl + '"/>'
							 				+ '</div>';
		 						
		 						$('.js-img-add').before(imgItem);

					 		    $(".imgshow").each(function(){
					 		    	if($(this).find('img').length>0){
					 		    		$(this).find(".close").show();
					 		    		$(this).css("border","0");
					 		    	}
					 		    });					 	
		 					 	
		 					}//end if

	 					},
		 				error : function(xhr, status, e) {
		 					alert("error: " + status);
		 				}
	  				});
	          
	            	upload();
	            	
	        	},
		        fail: function (res) {
		        	alert(JSON.stringify(res));
		        }
	      	});
		}
    }
   
   	upload();
}

$(function(){ 
	  wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: '${signInfo.timestamp }', // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [//分享接口
		       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
		        		//界面操作
		        		,'closeWindow'				//关闭当前网页窗口接口
		        		,'chooseImage'				//拍照或从手机相册中选图接口
		        		,'uploadImage'				//上传图片接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
	  		wx.onMenuShareTimeline({
	  		    title: '상품등록 - 쇼핑몰 상품 등록 페이지 입니다.', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		    },
	  		    cancel: function () { 
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '상품등록', // 分享标题
	  		    desc: '쇼핑몰 상품 등록 페이지 입니다.', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		    },
	  		    cancel: function () { 
	  		    }
	  		});
	  		
		});
	  	
	  	
	  	wx.error(function(res){
	  	    
	  	});
	  
});
</script>	
	
</body>
</html>

