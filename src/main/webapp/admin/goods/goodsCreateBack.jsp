<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  

<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${label.商品登记}</title>
<link rel="stylesheet" type="text/css" href="/admin/css/chosen.css" />  
<link rel="stylesheet" type="text/css" href="/admin/css/select2.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/jquery-ui.min.css" />  
<link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/common.css" />  
<link rel="stylesheet" type="text/css" href="/admin/css/custom.css" /> 
  

<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/admin/js/CJL.0.1.js"></script>
<script type="text/javascript" src="/admin/js/ImagePreviewd.js"></script>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/admin/js/underscore-min.js"></script>
<script type="text/javascript" src="/admin/js/backbone-min.js"></script>
<script type="text/javascript" src="/admin/js/template.js"></script>
<script type="text/javascript" src="/admin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/admin/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/admin/js/select2.min.js"></script>
<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script>

<style type="text/css">

body{margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 14px;}


.ui-border {border: 1px solid #eeeeee; width: 100%; height: auto;}
.ui-box {
	width: 250px;
	height: 343px;
	float: left;
	margin-left: 20px;
}
.submit-div-transport{
		width:98px;
		height:31px;
		border-radius:31px;
		line-height:31px;
		background-position: 10px 8px;
		background-repeat: no-repeat;
		color:#313131;
		cursor: pointer;
		display: inline-block;
		text-align: center;
	}
	.submit-div-transport.submit-transport{
		background-image: url("/admin/images/transport/tick.png");
		border:2px solid #0e9615;
	}
	.submit-div-transport.revise-transport{
		background-image: url("/admin/images/transport/close.png");
		border:2px solid #d1102d;
	}
	.submit-div-transport span{
		margin-left:15px;
	}
.ui-box:first-of-type {
	margin-left: 0;
}

.ui-box-header {
	box-sizing: border-box;
	height: 33px;
	width: 100%;
	background-color: #d44f64;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	padding: 8px 15px;
	text-align: center;
}

.ui-box-header .title {
	font-size: 16px;
	line-height: 20px;
	color: #ffffff;
}

.ui-box-header h3 {
	margin: 0;
	line-height: 33px;
	font-weight: normal;
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}

.ui-box-body {
	box-sizing: border-box;
	height: 310px;
	border: 1px solid #d44f64;
	border-bottom-right-radius: 12px;
	border-bottom-left-radius: 12px;
	padding: 15px 15px 15px 0;
}

.ui-box-body .scroll {
	height: 277px;
	overflow-y: auto;
	cursor: pointer;
}

::-webkit-scrollbar {
	width: 8px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	-webkit-border-radius: 10px;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	-webkit-border-radius: 10px;
	border-radius: 10px;
	background: #a5a5a5;
	-webkit-box-shadow: inset 0 0 1px rgba(0, 0, 0, 0.5);
}

::-webkit-scrollbar-track-piece {
	background: url("/admin/images/scrollbar/scrollbar-thumb-vertical.png")
		left top repeat-y;
}

.ui-box-body li {
	line-height: 30px;
	/* font-size: 14px; */
	padding-left: 15px;
}

.ui-box-body li.active, .ui-box-body li:hover {
	background-color: #f2f2f2;
}

.ui-box-body li .ui-list-item-arrow {
	isplay: inline-block;
	float: right;
	margin-right: 15px;
}

.ui-box-body li.active .ui-list-item-arrow, .ui-box-body li:hover .ui-list-item-arrow
	{
	color: #d54658;
}

.ui-title {
	height: 30px;
	line-height: 30px;
}

.ui-title span {
	font-size: 16px;
	margin-left: 10px;
}

.div-babel {
	height: 56px;
	line-height: 56px;
	vertical-align: middle;
}

.control-group {
	height: 30px;
}

.control-group-img {
	height: 150px;
}

.label-prefix {
	background-image: url("/admin/images/icon/label-icon.png");
	background-position: center left;
	background-repeat: no-repeat;
	display: inline-block;
	width: 4px;
	height: 14px;
	margin-bottom: -2px;
	margin-right: 10px;
}

.control-group .form-label, .control-group .form-control {
	display: inline-block;
	/* font-size: 14px; */
}

.control-group-img .form-label, .control-group-img .form-control {
	display: inline-block;
	/* font-size: 14px; */
}

.control-group .form-label,.control-group-img .form-label {
	width: 130px;
	height: 30px;
	line-height: 30px;
	box-sizing: border-box;
	float: left;
	text-align: left;
}

.form-control .form-items {
	height: 30px;
	line-height: 30px;
	text-align: center;
	box-sizing: border-box;
	float: left;
}

.form-control .form-items.border {
	border: 1px solid #a6a6a6;
}

.form-control .ic-minus2 {
	margin-left: 10px;
	margin-top: 6px;
	cursor: pointer;
}

.form-control .goods-tag .del-tag {
	padding-left: 5px;
}

.form-control .ic-plus2 {
	margin-right: 10px;
	margin-top: -2px;
	cursor: pointer;
}

.form-control label {
	display: inline-block;
	height: 30px;
	line-height: 30px;
}

.tbodyIn .line {
	line-height: 30px;
}

.tbodyIn .inputAtt {
	width: 86%; 
	height: 30px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	padding-top: 0px;
	padding-right: 0px;
	padding-bottom: 0px;
	padding-left: 20px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 0px;
}

.tbodyIn .inputAtt2 {
	width: 96%; 
	height: 30px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	padding-top: 0px;
	padding-right: 0px;
	padding-bottom: 0px;
	padding-left: 20px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 0px;
}

.select2 {
	width: 220px;
	height: 30px;
	font-size: 12px;
}

.form-control .radio input[type="radio"], .form-control .checkbox input[type="checkbox"]
	{
	margin-top: 10px;
	margin-right: 5px;
}
 
.form-control .goods-tag li {
 	height: 30px; 
	line-height:30px; 
 	float:left;
 }
.form-control .goods-tag li.li-sp {
 	margin-left: 8px;
 	margin-right: 8px;
 }
 
 .form-control .goodsSpec {width: 140px; height: 30px; line-height: 30px; text-align: center; background-color: #fe6c00; color: #ffffff; border-radius: 18px; cursor: pointer;}

.w4 {
	width: 40px;
}

.w14 {
	width: 140px;
}

.w15 {
	width: 150px;
}

.w21 {
	width: 210px;
}

.w43 {
	width: 430px;
}

.w120 {
	width: 130px;
}

.h1p {
	height: 1px;
	background-color: #f0f0f0;
}

.h2 {
	height: 20px;
}

.h3 {
	height: 30px;
}

.h4 {
	height: 40px;
}

.h29 {
	height: 29px;
}

.lin3 {
	line-height: 30px;
}

.pointer {
	cursor: pointer;
}

.align-center {
	text-align: center;
}

.border-top {
	border-top: solid 1px #d6d6d6;
}

.border-right {
	border-right: solid 1px #f0f0f0;
}

.border-bottom {
	border-bottom: solid 1px #f0f0f0;
}

.goodsAdd {
	margin-bottom: 3px; 
	padding-left: 6px;
}

.btn-save {
	height: 51px; 
	line-height: 51px; 
	text-align: left; 
	padding-left: 40%; 
	background-color: #f2f2f2;
}

.btn-save img {
	cursor: pointer;
}

.gcArrow2,.gcArrow3 {
	color: red;
}

.grid thead span,.grid tfoot img {
	margin-left: 20px;
	padding: 0px;
}

.divPopup {width: 512px; height: 400px; margin: 0 auto; overflow: hidden; display: none;}
.divPopup .divPopup-header {width: 100%; height: 40px; background-color: #d1102d; border-radius: 10px 10px 0px 0px;}
.divPopup .divPopup-header .divPopup-header-text {width: 80%; height: 40px; line-height: 40px; float: left; font-size: 16px;}
.divPopup .divPopup-header .divPopup-header-text span {margin-left: 20px; color: #ffffff; font-size: 14px;}
.divPopup .divPopup-header .divPopup-header-close {width: 20%; height: 40px; line-height: 40px; text-align: right; float: left;}
.divPopup .divPopup-header .divPopup-header-close img {width: 14px; height: 14px; margin-right: 22px; cursor: pointer;}

.divPopup .divPopup-container {width: 100%; height: 360px; position: relative;}
.divPopup .divPopup-container .ifrPopup {width:100%; height: 100%; left: 0; top: 0; border-radius: 0px 0px 10px 10px;}

/* #preview {width: 120px; height: 120px;}
#preview img {width: 120px; height: 120px;}
 */
.uiReBg {position: absolute; width: auto; height: 24px; background-color: #ffffff; top: 16px; right: 120px; cursor: pointer;padding-right:20px;}
.uiReBg .uiReImg {float: left; width: 16px; height: 14px; background-image: url("/admin/images/icon/back.png"); background-repeat: no-repeat; margin-top: 5px; margin-right: 10px; margin-left: 20px;}
.uiReBg .uiReText {float: left; font-size: 14px; margin-top: 3px;}
.upload-goods-img-div{width:118px;height:118px;border:1px solid #eee;text-align: center;background-image: url("/admin/images/shopCreate/main_Upload.png");background-repeat: no-repeat;background-position: 40px 30px;}
.upload-goods-img-div span{margin-top:70px;display:inline-block;font-size:12px;color:#313131;}
</style>

<script type="text/javascript">

	$(function(){
		
		$('.ui-box-body li').click(function(){
			
			$(this).addClass('active').siblings().removeClass('active'); 
		});
		
		$('#goods-tag-add').popover({
			
			placement : 'bottom',
			html : true,
			content: '<div style=""><input type="text" id="goods-tag-input" placeholder="${label.请输入商品标签}..." style="margin-top:5px;" class="w21">'
					+'<span class="btn js-btn-confirm">${label.确定}</span>'
					+'<span class="btn js-btn-cancel">${label.取消}</span></div>'
		});
		
		var popoverObj = $('#goods-tag-add').data('popover');
		
		popoverObj.tip().on('click', '.js-btn-confirm', function(evt){
			
			var tag = $('#goods-tag-input').val();
			var item = '<li>'
		 		+ tag + '<input type="hidden" name="seoTag" value="'+tag+'" />'
		 		+ ' <a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a> '
		 		+ '</li>'
		 		+ '<li class="li-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li>';
		 		
		 		$('#goods-tag-add').parent().before(item);
		 		$('#goods-tag-add').popover('hide');
		 		
		 		$('.del-tag').unbind('click');
		 		$('.del-tag').click(function(){
		 	        $(this).parent().parent().next().remove(); 
		 	        $(this).parent().parent().remove();
		 		});
			
		})
		popoverObj.tip().on('click', '.js-btn-cancel', function(evt){
			$('#goods-tag-add').popover('hide');
		})
		 
		$(".select2").select2({
			//width:"element"
			//,minimumInputLength:2
			//,maximumInputLength:10
			minimumResultsForSearch:20
			//,separator:'^'
			,allowClear: true 
			//,closeOnSelect:true  //defalut:true
			//,openOnEnter:true 
		}); 
	});
	
	function selectChange(id,name,type){

		var params = {
				goodsClassId : id
			};

		switch (type){
		
			case "1":
				$('.goodsClass1').html(name);
				$('input[name="goodsClass1"]').val(id);
				$('.goodsClass2').html('');
				$('input[name="goodsClass2"]').val('');
				$('.gcArrow2').html('');
				$('.goodsClass3').html('');
				$('input[name="goodsClass3"]').val('');
				$('.gcArrow3').html('');
				$.ajax({
					data : params,
					dataType : "json",
					type : "POST",
					cache : false,
					url : "/admin/goods/ajaxSelectTwoClassList.htm",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						
						var items = data.selectList;
						var recount = items.length;
						var liList = "";

						if(recount > 0) {
							
							$(".liListTwo").empty();
							$(".liListThree").empty();
							$.each(items, function(i, n){
								liList = "<li onclick=\"javascript:selectChange('" + items[i].goodsClassId +"','" + items[i].goodsClassNm +"','2');\"><span>" + items[i].goodsClassNm +"</span><span class=\"ui-list-item-arrow\">></span></li>";
								$(".liListTwo").append(liList);
							});	
							
							$('.liListTwo li').click(function(){
								
								$(this).addClass('active').siblings().removeClass('active'); 
							});
							
						} else{
							
							//alert('没有查询数据');
							$(".liListTwo").empty();
							$(".liListThree").empty();
						}
						
					},
					error : function(a, msg, c){
						
						alert("error: " + msg);
					}
				});
				break;
			case "2":
				$('.goodsClass2').html(name);
				$('input[name="goodsClass2"]').val(id);
				$('.gcArrow2').html('&nbsp;>&nbsp;');
				$('.goodsClass3').html('');
				$('input[name="goodsClass3"]').val('');
				$('.gcArrow3').html('');
				$.ajax({
					data : params,
					dataType : "json",
					type : "POST",
					cache : false,
					url : "/admin/goods/ajaxSelectTwoClassList.htm",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						
						var items = data.selectList;
						var recount = items.length;
						var liList = "";

						if(recount > 0) {
							
							$(".liListThree").empty();
							$.each(items, function(i, n){
								liList = "<li onclick=\"javascript:selectChange('" + items[i].goodsClassId +"','" + items[i].goodsClassNm +"','3');\"><span>" + items[i].goodsClassNm +"</span><span class=\"ui-list-item-arrow\">></span></li>";
								$(".liListThree").append(liList);
							});
							
							$('.liListThree li').click(function(){
								
								$(this).addClass('active').siblings().removeClass('active'); 
							});
							
						} else{
							
							//alert('没有查询数据');
							$(".liListThree").empty();
						}
						
					},
					error : function(a, msg, c){
						
						alert("error: " + msg);
					}
				});
				break;
			case "3":
				$('.goodsClass3').html(name);
				$('input[name="goodsClass3"]').val(id);
				$('.gcArrow3').html('&nbsp;>&nbsp;');
				break;
		}
	}
	
	function trAdd(){
		
		var trList = "<tr class=\"border-top\">\r\n" +
					 "	<td class=\"border-right\">\r\n" +
					 "		<input type=\"text\" name=\"specNm\" class=\"inputAtt\" />\r\n" +
					 "	</td>\r\n" +
					 "	<td>\r\n" +
					 "		<input type=\"text\" name=\"unitTxt\" class=\"inputAtt2\" />\r\n" +
					 "	</td>\r\n" +
					 "	<td class=\"align-center\">\r\n" +
					 "		<img class=\"pointer\" onclick=\"javascript:trDelete(this);\" src=\"/admin/images/icon/icon-minus2.png\">\r\n" +
					 "	</td>\r\n" +
					 "</tr>";
		$('.tbodyIn').append(trList);
	}
	
	function trDelete(obj){

		$(obj).parent().parent().remove();
	}
	
	function save(){

		var goodsNm = $('input[name="goodsNm"]').val();
		var goodsWeight = $('input[name="goodsWeight"]').val();
		var goodsClass2 = $('input[name="goodsClass2"]').val();
		var goodsClass3 = $('input[name="goodsClass3"]').val();
		var isReal = $('input[name="isReal"]:checked').val();
		var imgLogoPicture = $('#logo_input').val();
		var seoTag = "";
		
	    $('input[name="seoTag"]').each(function(){
	    	seoTag += $(this).val() + ",";
	    });
	    var seoTags = seoTag.substring(0,seoTag.length-1);
	    var specNm = "";
	    $('input[name="specNm"]').each(function(){
	    	if($(this).val() == ""){
	    		return false;
	    	}
	    	specNm += $(this).val() + ",";
	    });
	    var specNms = specNm.substring(0,specNm.length-1);
	    var unitTxt = "";
	    $('input[name="unitTxt"]').each(function(){
	    	if($(this).val() == ""){
	    		return false;
	    	}
	    	unitTxt += $(this).val() + ",";
	    });
	    var unitTxts = unitTxt.substring(0,unitTxt.length-1);
	    
		if(goodsClass2 == ""){
			
			alert('${label.请选择第2级标准分类}'+'.');
			return;
		}
		if(goodsClass3 == ""){
			
			alert('${label.请选择第3级标准分类}'+'.');
			return;
		}
		if(goodsNm == ""){
			
			alert('${label.请输入商品名称}'+'.');
			return;
		}
		if(imgLogoPicture == ""){
			
			alert('${label.请上传商品照片}');
			return;
		}
		if(specNms == "" || unitTxts == "" || unitTxts.split(",").length != specNms.split(",").length){
			
			alert('${label.请正确填写属性名称及参数}');
			return;
		}
		if(goodsWeight == ""){
			
			alert('${label.请输入商品重量}'+'.');
			return;
		}
		
		//获取照片的文件名
        var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf("\\") + 1, imgLogoPicture.length);
		
		var params = {
				goodsNm : goodsNm,
				goodsClassTwoId : goodsClass2,
				goodsClassThreeId : goodsClass3,
				specNm : specNms,
				unitTxt : unitTxts,
				isReal : isReal,
				seoTag : seoTags,
				logoFileName : logoFileName,
				goodsWeight : goodsWeight
			};
		
		$.ajaxFileUpload({
			data : params,
			url : "/admin/goods/save.htm",
			secureuri : false,
			fileElementId :'logo_input',
			dataType : "json",
			type : "POST",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				
				if (data.result == 'SUCCESS'){
					
					alert("${label.添加成功}"+".");
					location.href="/admin/goods/list.htm";
				} else {
					
					alert("${label.请检查信息}"+","+"${label.重新点击添加}"+".");
				}
			},
			error : function(a, msg, c){
				
				alert("error: " + msg);
			}
		});
	}
	
	//商品照片上传预览
	function logoUpload(file){
		
		var prevDiv = document.getElementById('preview');
		 
		if(checkImage(file)){
			
			 if (file.files && file.files[0]){
				 
				var reader = new FileReader();
				
				reader.onload = function(evt){
			 		prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
				}; 
				$("#preview").attr("style","background-image:url('')");
				$("#preview").find("span").remove();
			 	reader.readAsDataURL(file.files[0]);
			} else {
				
				prevDiv.innerHTML = '<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
				$("#preview").attr("style","background-image:url('')");
				$("#preview").find("span").remove();
			}
		} else {			

	 		//prevDiv.innerHTML = '<img src="/admin/images/shopCreate/upload.png" />';
	 		prevDiv.innerHTML='';
	 		$("#preview").attr("style","background-image:url('/admin/images/shopCreate/main_Upload.png')");
			$("#preview").append("<span>${label.上传本地图片}</span>");
		}
		
	}

	//检查上传文件是否为图片
	function checkImage(file){
		
		var picPath = file.value;
		var type = picPath.substring(picPath.lastIndexOf(".") + 1, picPath.length).toLowerCase();
		
		if (picPath == "") {
			
		    return false;
		} else {
			
			if (type != "jpg" && type != "bmp" && type != "gif" && type != "png") {
				
			    alert("${label.请上传正确的图片格式}");
			    return false;
			} else {

				return true;
			}
		}
	}

	//弹出页面
	function popupPage() {

		$('#ifrPage').attr('src','/admin/goods/goodsSpec.htm');

		$('.divPopup').bPopup({
			
			modalColor : "#aeaeae",
			opacity : 0.3,
			//fadeSpeed: 650,				//弹出速度  string (slow/fast) or int (1500) 
			modalClose : false, //弹出深色层，true:关闭的响应 false:无     	   
			//closeClass: '.divPopupClose'	//指定关闭的class名称 ,就不需要指定关闭方法:bPopup().close()了 

			speed : 650, //下降弹出样式
			transition : 'slideIn', //下降弹出样式--slideIn:从左向右,slideDown：从上到下
			//modalColor: 'greenYellow'
		});
	}

	//弹出页面关闭事件
	function popupPageClose() {

		$(".divPopup").bPopup().close();
	}
	
	//商品属性绑定
	function goodsSpecBind(goodsClass2,goodsId){
		
		if (goodsClass2 == "") {
			
			alert('${label.请重新打开此页面}'+'.');
			return;
		}
		var params = {
				goodsClassTwoId : goodsClass2,
				goodsId : goodsId
			};
		$.ajax({
			data : params,
			dataType : "json",
			type : "POST",
			cache : false,
			url : "/admin/goods/goodsSpecSelect.htm",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				
				var items = data.selectList;
				var recount = items.length;
				var tbodyList = "";

				if(recount > 0) {
					
					$(".tbodyIn").empty();
					$.each(items, function(i, n){
						
						tbodyList = "<tr>\r\n" +
									 "	<td>\r\n" +
									 "		<input type=\"text\" name=\"specNm\" class=\"inputAtt\" value=\"" + items[i].specNm + "\" />\r\n" +
									 "	</td>\r\n" +
									 "	<td>\r\n" +
									 "		<input type=\"text\" name=\"unitTxt\" class=\"inputAtt2\" value=\"" + items[i].specValueNm + "\" />\r\n" +
									 "	</td>\r\n" +
									 "	<td class=\"align-center border-top\">\r\n" +
									 "		<img class=\"pointer\" onclick=\"javascript:trDelete(this);\" src=\"/admin/images/icon/icon-minus2.png\">\r\n" +
									 "	</td>\r\n" +
									 "</tr>";
						$(".tbodyIn").append(tbodyList);
					});
					$(".divPopup").bPopup().close();
				} else{
					
					alert('${label.没有查询数据}');
				}
				
			},
			error : function(a, msg, c){
				
				alert("error: " + msg);
			}
		});
		
	}
	
	function popReturn() {
		window.top.closeTab();
		//window.history.back();
		//window.opener.location.reload();
		//window.close();
	}
</script>
</head>
<body>
	<%-- <jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType" />
	</jsp:include> --%>
	<!-- ▼ Main container -->
	<div class="container">
		<!-- ▼ Left Menu  -->
		<%-- <jsp:include page="/admin/inc/menuleft.jsp">
			<jsp:param value="${topMenuType}" name="topMenuType" />
			<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1" />
			<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2" />
		</jsp:include> --%>
		<!-- ▲ Left Menu  -->


		<%--  --%>
		<!-- ▼ detali content  -->
		<div class="ui-right-content">
			<div class="ui-title clearfix">
				<img alt="" src="/admin/images/icon/icon-computer.png" style="margin-bottom: 3px;">
				<span style="">${label.登记商品基本信息}</span>
			</div>
			<div class="uiReBg" onclick="javascript:popReturn();">
				<div class="uiReImg"></div>
				<div class="uiReText">${label.返回}</div>
			</div>
			<div class="ui-border">
				<div style="width: 95%; height: auto; margin-top: 24px; margin-left: 36px;">
					<div class="ui-box-list clearfix">
						<div class="ui-box">
							<div class="ui-box-header">
								<h3 class="title">${label.标准分类}-${label.第1级}</h3>
							</div>
							<div class="ui-box-body">
								<div class="scroll">
									<ol>
										<c:forEach items="${requestScope.oneSelectList}" var="items" varStatus="status">
											<li onclick="javascript:selectChange('${items.goodsClassId}','${items.goodsClassNm}','1');">
												<span>${items.goodsClassNm}</span>
												<span class="ui-list-item-arrow">></span>
											</li>
										</c:forEach>
									</ol>
								</div>
							</div>
						</div>
		
						<div class="ui-box">
							<div class="ui-box-header">
								<h3 class="title">${label.标准分类}-${label.第2级}</h3>
							</div>
							<div class="ui-box-body">
								<div class="scroll">
									<ol class="liListTwo">
									</ol>
								</div>
							</div>
						</div>
		
						<div class="ui-box">
							<div class="ui-box-header">
								<h3 class="title">${label.标准分类}-${label.第3级}</h3>
							</div>
							<div class="ui-box-body">
								<div class="scroll">
									<ol class="liListThree">
									</ol>
								</div>
							</div>
						</div>
		
					</div>
		
					<div class="form-group clearfix">
					
						<div class="h2"></div>
						
						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.标准商品分类}<font style="color: red; margin-left: 5px;">*</font>：
							</div>
							<div class="form-control">
								<div class="form-items">
									<span class="goodsClass1"></span>
									<font class="gcArrow2"></font>
									<span class="goodsClass2"></span>
									<font class="gcArrow3"></font>
									<span class="goodsClass3"></span>
									<input type="hidden" name="goodsClass1" value="" />
									<input type="hidden" name="goodsClass2" value="" />
									<input type="hidden" name="goodsClass3" value="" />
								</div>
							</div>
						</div>
		
						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.商品名称}<font style="color: red; margin-left: 5px;">*</font>:
							</div>
							<div class="form-control">
								<input type="text" name="goodsNm" placeholder="${label.请输入商品名称}" value="" />
							</div>
						</div>
		
						<div class="control-group-img">
							<div class="form-label">
								<a class="label-prefix"></a>${label.商品照片}<font style="color: red; margin-left: 5px;">*</font>:
							</div>
							<div class="form-control">
								<input type="file" id="logo_input" name="logo_input" style="position: absolute; width: 120px; height: 120px; z-index: 12; filter: alpha(opacity:0); opacity: 0; cursor: pointer;" onchange="javascript:logoUpload(this);" />
								<div id="preview" class="upload-goods-img-div">
									<!-- <img src="/admin/images/shopCreate/upload120.png" /> -->
									<span>${label.上传本地图片}</span>
								</div>
								<span style="color:red;">${label.图片推荐尺寸}：120px * 120px</span>
							</div>
						</div>
						
						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.商品属性}<font style="color: red; margin-left: 5px;">*</font>：
							</div>
							<div class="form-control">
								<div class="goodsSpec" onclick="javascript:popupPage();">${label.使用已用商品属性}</div>
							</div>
						</div>
						
						<table>
							<tr>
								<td class="w120"></td>
								<td>
									<table class="grid">
										<thead>
											<tr class="border-top">
												<td class="w14 h3 border-right"><span>${label.属性名称}</span></td>
												<td class="w43 h3"><span>${label.参数}</span></td>
												<td class="w4 h3"></td>
											</tr>
										</thead>
										<tbody class="tbodyIn">
											<tr class="border-top">
												<td class="border-right">
													<input type="text" name="specNm" class="inputAtt" />
												</td>
												<td>
													<input type="text" name="unitTxt" class="inputAtt2" />
												</td>
												<td class="align-center">
													<img class="pointer" onclick="javascript:trDelete(this);" src="/admin/images/icon/icon-minus2.png">
												</td>
											</tr>
										</tbody>
										<tfoot>
											<tr class="border-top">
												<td colspan="3" class="h3 lin3">
													<img class="goodsAdd pointer" onclick="javascript:trAdd();" src="/admin/images/icon/icon-plus2.png">&nbsp;&nbsp;&nbsp;${label.添加商品属性}
												</td>
											</tr>
										</tfoot>
									</table>
								</td>
							</tr>
						</table>
						
						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.商品类型}<font style="color: red; margin-left: 5px;">*</font>:
							</div>
							<div class="form-control">
								<label class="radio">
									<input type="radio" value="1" name="isReal" checked="checked"> ${label.实物商品} ( ${label.物流发货} )
								</label>&nbsp;&nbsp; 
								<label class="radio">
									<input type="radio" value="2" name="isReal"> ${label.虚拟商品} ( ${label.无需物流} )
								</label>
							</div>
						</div>
		
						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.商品重量}<font style="color: red; margin-left: 5px;">*</font>:
							</div>
							<div class="form-control">
								<input type="text" name="goodsWeight" placeholder="${label.请输入商品重量}" value="" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								<span style="display: inline-block; margin-left: 10px; height: 30px; line-height: 30px; vertical-align: top;">${label.克}(g)</span>
							</div>
						</div>
		
						<div class="control-group" style="display: none;">
							<div class="form-label">
								<a class="label-prefix"></a>${label.商品标签}<font style="color: red; margin-left: 5px;">*</font>:
							</div>
							<div class="form-control">
								<ul class="goods-tag">
									<li><img id="goods-tag-add" class="ic-plus2" src="/admin/images/icon/icon-plus2.png">${label.查询新标签}(${label.查询关键词})</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="h2"></div>
			
				<div class="btn-save">
					<div class="submit-div-transport submit-transport" onclick="javascript:save();">
       					<span>${label.保存 }</span>
       				</div>
					<!-- <img onclick="javascript:save();" src="/admin/images/goodsClass/save.png" /> -->
				</div>
				
				<div class="h29"></div>
			</div>
		<!-- ▲ detali content -->
	</div>
			
	<!-- ▼ Popup -->
	<div class="divPopup">
		<div class="divPopup-header">
			<div class="divPopup-header-text">
				<span>${label.选择已有产品属性}</span>
			</div>
			<div class="divPopup-header-close" onclick="javascript:popupPageClose();">
				<img src="/admin/images/goodsClass/close.png">
			</div>
		</div>

		<div class="divPopup-container">
			<iframe id="ifrPage" class="ifrPopup" frameborder="0" allowTransparency="true" scrolling="no" vspace="0" hspace="0"></iframe>
		</div>
	</div>
	<!-- ▲ Popup -->

	<!-- ▲ Main container -->
	<!-- ▼ Main footer -->
       <jsp:include page="/admin/inc/footer.jsp"></jsp:include>
	<!-- ▲  Main footer -->

</body>
</html>