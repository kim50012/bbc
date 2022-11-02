<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
 
<style type="text/css">


.ui-box {float: left; width: 250px; height: 345px; margin-left: 50px;}
.ui-box:first-of-type {margin-left: 0px;}
.ui-box-header {box-sizing: border-box; height: 35px; line-height: 35px; text-align: center; background-color: #d44f64; border-radius: 12px 12px 0 0;}
.ui-box-header .title {font-size: 16px; color: #fff;}
.ui-box-body {box-sizing: border-box; height: 310px; border: 1px solid #d44f64; border-radius: 0 0 12px 12px; padding: 15px 15px 15px 0;}
.ui-box-body .scroll {height: 280px; overflow-y: auto; cursor: pointer;}
.ui-box-body li {height: 30px; line-height: 30px; padding-left: 15px;}
.ui-box-body li.active, .ui-box-body li:hover {background-color: #f2f2f2;}
.ui-box-body li .ui-list-item-arrow {display: inline-block; float: right; margin-right: 15px;}
.ui-box-body li.active .ui-list-item-arrow, .ui-box-body li:hover .ui-list-item-arrow {color: #d54658;}
::-webkit-scrollbar {width: 8px;}
::-webkit-scrollbar-track {-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3); -webkit-border-radius: 10px; border-radius: 10px;}
::-webkit-scrollbar-thumb {-webkit-box-shadow: inset 0 0 1px rgba(0, 0, 0, 0.5); -webkit-border-radius: 10px; border-radius: 10px; background: #a5a5a5;}
::-webkit-scrollbar-track-piece {background: url("/admin/images/scrollbar/scrollbar-thumb-vertical.png") left top repeat-y;}


.form-warp {margin-top: 10px;}
/* #logo_input {position: absolute; width: 100px; height: 100px; z-index: 12; filter: alpha(opacity:0); opacity: 0; cursor: pointer;} */
.goods-img {display: none; width: 100px; height: 100px; border: 1px solid #e5e5e5; text-align: center; background-color: #f7f7f7; background-image: url("/admin/images/goods/imgUp.png"); background-repeat: no-repeat; background-position: 40px 30px; cursor: pointer;}
.goods-img span{display: inline-block; font-size: 12px; color: #313131; margin-top: 60px;}
.goods-img-show {width: 100px; height: 100px; border: 1px solid #e5e5e5; text-align: center; background-repeat: no-repeat; background-position: 0px 0px; cursor: pointer; background-size: contain;}
.picSize {display: inline-block; color: #d44f64; vertical-align: bottom; margin-left: 10px; margin-bottom: 10px; font-weight: 600;}
.goodsSpec {width: 90px; height: 30px; line-height: 30px; text-align: center; background-color: #d1102d; color: #fff; cursor: pointer;}
.pop-attrDiv {width: 510px; height: 400px; margin: 0 auto; overflow: hidden; display: none;}
.pop-attrDiv .pop-header {width: 100%; height: 40px; background-color: #636363; border-radius: 10px 10px 0px 0px;}
.pop-attrDiv .pop-header .pop-header-title {width: 80%; height: 40px; line-height: 40px; float: left; font-size: 16px;}
.pop-attrDiv .pop-header .pop-header-title span {margin-left: 20px; color: #ffffff; font-size: 14px;}
.pop-attrDiv .pop-header .pop-header-close {width: 20%; height: 40px; line-height: 40px; text-align: right; float: left;}
.pop-attrDiv .pop-header .pop-header-close img {width: 14px; height: 14px; margin-right: 22px; cursor: pointer;}
.pop-attrDiv .pop-container {width: 100%; height: 250px; position: relative;}
.pop-attrDiv .pop-container .ifrPopup {width:100%; height: 100%; left: 0; top: 0; border-radius: 0px 0px 10px 10px;}

.grid {margin-left: 145px; margin-top: 5px;}
.grid thead span, .grid tfoot img {margin-left: 20px; margin-bottom: 3px;}
.grid .border-top {border-top: solid 1px #e5e5e5;}
.grid .border-right {border-right: solid 1px #e5e5e5;}
.grid .tbodyIn .inputAtt {width: 79%; padding-left: 20px; border: 0;}
.grid .tbodyIn .inputAtt2 {width: 90%; padding-left: 20px; border: 0;}
.grid .align-center {text-align: center;}
.grid .pointer {cursor: pointer;}

.goods-tag .del-tag {padding-left: 5px;}
.goods-tag li {height: 30px; line-height:30px; float:left;}
.goods-tag li.li-sp {margin-left: 8px; margin-right: 8px;}
.ic-plus2 {margin-right: 10px; margin-top: -2px; cursor: pointer;}


.btn-save {width: 90px; height: 30px; line-height: 30px; text-align: center; background-color: #d1102d; color: #fff; cursor: pointer; margin: 50px auto;}
.btn-save .button-icon.conform {margin-bottom: -2px;}
</style>

<script type="text/javascript">
	
	$(function(){

		$('input[name="goodsClass1"]').val("${requestScope.oneSelectId}");
		$('.goodsClass1').html("${requestScope.oneSelectNm}");
		$('.gcArrow2').html('&nbsp;>&nbsp;');
		$('input[name="goodsClass2"]').val("${requestScope.twoSelectId}");
		$('.goodsClass2').html("${requestScope.twoSelectNm}");
		$('.gcArrow3').html('&nbsp;>&nbsp;');
		$('input[name="goodsClass3"]').val("${requestScope.threeSelectId}");
		$('.goodsClass3').html("${requestScope.threeSelectNm}");
		$('input[name="goodsId"]').val("${requestScope.goodsId}");
		$('input[name="goodsNm"]').val("${requestScope.goodsNm}");

		$('input[name="goodsImgId"]').val("${requestScope.goodsImg}");
		$('.goods-img-show').css("background-image","url(\"${requestScope.goodsImgUrl}\")");
		
		$('input[name="goodsWeight"]').val("${requestScope.goodsWeight}");
		var isReal = "${requestScope.isReal}";
		$("input[name='isReal'][value="+isReal+"]").attr("checked",true); 
		var seoTag = "${requestScope.seoTag}".split(",");
		var liList = "";
		
		for(var i = 0; i < seoTag.length; i++){
			liList = '<li>'
			 	   + seoTag[i] + '<input type="hidden" name="seoTag" value="'+seoTag[i]+'" />'
			 	   + '<a href="javascript:void(0);"><img class="del-tag" src="/admin/images/icon/icon-close.png"></a>'
			 	   + '</li>'
			 	   + '<li class="li-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li>';
		 		
	 		$('#goods-tag-add').parent().before(liList);
	 		
	 		$('.del-tag').unbind('click');
	 		$('.del-tag').click(function(){
	 	        $(this).parent().parent().next().remove(); 
	 	        $(this).parent().parent().remove();
	 		});
		}
				
		var params = {
				goodsId : "${requestScope.goodsId}"
			};
		$.ajax({
			data : params,
			dataType : "json",
			type : "POST",
			cache : false,
			url : "/admin/goods/goodsModifyOnload.htm",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				
				var items = data.goodsList;
				var recount = items.length;
				var tbodyList = "";

				if (recount > 0) {
					
					$(".tbodyIn").empty();
					$.each(items, function(i, n){
						
						tbodyList = "<tr class=\"border-top\">\r\n" +
									"	<td class=\"border-right\">\r\n" +
									"		<input type=\"text\" name=\"specNm\" class=\"inputAtt\" value=\"" + items[i].specNm + "\" />\r\n" +
									"	</td>\r\n" +
									"	<td>\r\n" +
									"		<input type=\"text\" name=\"unitTxt\" class=\"inputAtt2\" value=\"" + items[i].specValueNm + "\" />\r\n" +
									"	</td>\r\n" +
									"	<td class=\"align-center\">\r\n" +
									"		<img class=\"pointer\" onclick=\"trDelete(this)\" src=\"/admin/images/icon/icon-minus2.png\">\r\n" +
									"	</td>\r\n" +
									"</tr>";
						$(".tbodyIn").append(tbodyList);
					});
				}
			},
			error : function(a, msg, c){
				
				alert("error: " + msg);
			}
		});

		$('.ui-box-body li').click(function(){
			
			$(this).addClass('active').siblings().removeClass('active');
		});
		
		$('#goods-tag-add').popover({
			placement : 'bottom',
			html : true,
			content: '<div style=""><input type="text" id="goods-tag-input" placeholder="<ui:i18n key="请输入商品标签"/>..." style="margin-top:5px; width: 210px;">'
				   + '<span class="btn js-btn-confirm"><ui:i18n key="确定"/></span>'
				   + '<span class="btn js-btn-cancel"><ui:i18n key="取消"/></span></div>'
		});
		
		var popoverObj = $('#goods-tag-add').data('popover');
		
		popoverObj.tip().on('click', '.js-btn-confirm', function(evt){
			
			var tag = $('#goods-tag-input').val();
			var item = '<li>'
		 			 + tag + '<input type="hidden" name="seoTag" value="'+tag+'" />'
		 			 + '<a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a>'
		 			 + '</li>'
		 			 + '<li class="li-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li>';
		 		
			$('#goods-tag-add').parent().before(item);
	 		$('#goods-tag-add').popover('hide');
	 		
	 		$('.del-tag').unbind('click');
	 		$('.del-tag').click(function(){
	 	        $(this).parent().parent().next().remove(); 
	 	        $(this).parent().parent().remove();
	 		});
			
		});
		
		popoverObj.tip().on('click', '.js-btn-cancel', function(evt){
			 $('#goods-tag-add').popover('hide');
		 });
	});
	
	function selectChange(id,name,type) {

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

						if (recount > 0) {
							
							$(".liListTwo").empty();
							$(".liListThree").empty();
							$.each(items, function(i, n){
								liList = "<li onclick=\"selectChange('" + items[i].goodsClassId +"','" + items[i].goodsClassNm +"','2')\"><span>" + items[i].goodsClassNm +"<span><span class=\"ui-list-item-arrow\">></span></li>";
								$(".liListTwo").append(liList);
							});

							$('.ui-box-body li').click(function(){
								
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
								liList = "<li onclick=\"selectChange('" + items[i].goodsClassId +"','" + items[i].goodsClassNm +"','3')\"><span>" + items[i].goodsClassNm +"<span><span class=\"ui-list-item-arrow\">></span></li>";
								$(".liListThree").append(liList);
							});

							$('.ui-box-body li').click(function(){
								
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

	//使用已有属性-show
	function attributeShow() {

		$('#ifrPage').attr('src','/admin/goods/goodsSpec.htm');
		$('.pop-attrDiv').bPopup({
			
			modalColor : "#999999",			//弹出背景色
			opacity : 0.8,					//弹出背景色透明度
			fadeSpeed: 1500,				//弹出速度  string (slow/fast) or int (1500) 
			modalClose : false,				//弹出深色层，true:有响应 false:关闭的响应
			//closeClass: '.divPopupClose'	//指定关闭的class名称 ,就不需要指定关闭方法:bPopup().close()了 
			//speed : 650,					//下降弹出样式
			//transition : 'slideDown',		//下降弹出样式--slideIn:从左向右,slideDown：从上到下
		});
	}

	//使用已有属性-close
	function attributeClose() {

		$(".pop-attrDiv").bPopup().close();
	}
	
	//使用已有属性-dataBind
	function goodsSpecBind(goodsClass2,goodsId){
		
		if (goodsClass2 == "") {
			
			alert('<ui:i18n key="请重新打开此页面"/>.');
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
						
						tbodyList = "<tr class=\"border-top\">\r\n" +
									 "	<td class=\"border-right\">\r\n" +
									 "		<input type=\"text\" name=\"specNm\" class=\"inputAtt\" value=\"" + items[i].specNm + "\" />\r\n" +
									 "	</td>\r\n" +
									 "	<td>\r\n" +
									 "		<input type=\"text\" name=\"unitTxt\" class=\"inputAtt2\" value=\"" + items[i].specValueNm + "\" />\r\n" +
									 "	</td>\r\n" +
									 "	<td class=\"align-center\">\r\n" +
									 "		<img class=\"pointer\" onclick=\"trDelete(this)\" src=\"/admin/images/icon/icon-minus2.png\">\r\n" +
									 "	</td>\r\n" +
									 "</tr>";
						$(".tbodyIn").append(tbodyList);
					});
					$(".pop-attrDiv").bPopup().close();
				} else {
					
					alert('<ui:i18n key="没有查询数据"/>.');
				}
			},
			error : function(a, msg, c){
				
				alert("error: " + msg);
			}
		});
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
					 "		<img class=\"pointer\" onclick=\"trDelete(this)\" src=\"/admin/images/icon/icon-minus2.png\">\r\n" +
					 "	</td>\r\n" +
					 "</tr>";
		$('.tbodyIn').append(trList);
	}
	
	function trDelete(obj){

		$(obj).parent().parent().remove();
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
				
			 	reader.readAsDataURL(file.files[0]);
			} else {
				
				prevDiv.innerHTML = '<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
			}
		} else {			

	 		prevDiv.innerHTML = '<img id="logoUploadImg" src="'+ goodsImg +'" />';
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
	
	function save(){

		var goodsNm = $('input[name="goodsNm"]').val();
		var goodsId = $('input[name="goodsId"]').val();
		var goodsClass2 = $('input[name="goodsClass2"]').val();
		var goodsClass3 = $('input[name="goodsClass3"]').val();
		var isReal = $('input[name="isReal"]:checked').val();
		var goodsWeight = $('input[name="goodsWeight"]').val();
		//var imgLogoPicture = $('#logo_input').val();
		var goodsImgId = $('input[name="goodsImgId"]').val();
		
		var seoTag = "";
	    $('input[name="seoTag"]').each(function(){
	    	if($(this).val() != ""){
		    	seoTag += $(this).val() + ",";
	    	}
	    });
	    var seoTags = seoTag.substring(0,seoTag.length-1);
	    
	    var specNm = "";
	    $('input[name="specNm"]').each(function(){
	    	if($(this).val() != ""){
		    	specNm += $(this).val() + ",";
	    	}
	    });
	    var specNms = specNm.substring(0,specNm.length-1);
	    
	    var unitTxt = "";
	    $('input[name="unitTxt"]').each(function(){
	    	if($(this).val() != ""){
		    	unitTxt += $(this).val() + ",";
	    	}
	    });
	    var unitTxts = unitTxt.substring(0,unitTxt.length-1);
	    
		if (goodsClass2 == "") {
			
			alert('<ui:i18n key="请选择第2级标准分类"/>.');
			return;
		}
		if (goodsClass3 == "") {
			
			alert('<ui:i18n key="请选择第3级标准分类"/>.');
			return;
		}
		if (goodsNm == "") {
			
			alert('<ui:i18n key="请输入商品名称"/>.');
			return;
		}
		if (goodsId == "") {
			
			alert('<ui:i18n key="请重新打开此页面"/>.');
			return;
		}
		if (goodsImgId == "") {
			
			alert('<ui:i18n key="请上传商品照片"/>.');
			return;
		}
		if (specNms == "" || unitTxts == "" || unitTxts.split(",").length != specNms.split(",").length) {
			
			alert('<ui:i18n key="请正确填写属性名称及参数"/>.');
			return;
		}
		if (goodsWeight == "") {
			
			alert('<ui:i18n key="请输入商品重量"/>.');
			return;
		}

		//获取照片的文件名
		//var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf("\\") + 1, imgLogoPicture.length);
		//alert(logoFileName);
		//return;
		var params = {
				goodsId : goodsId,
				goodsNm : goodsNm,
				goodsClassTwoId : goodsClass2,
				goodsClassThreeId : goodsClass3,
				specNm : specNms,
				unitTxt : unitTxts,
				isReal : isReal,
				seoTag : seoTags,
				goodsWeight : goodsWeight,
				goodsImgId : goodsImgId
			};

		$.ajax({
			data : params,
			dataType : "json",
			type : "POST",
			cache : false,
			url : "/admin/goods/modify.htm",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(res) {

				if (res.success) {

					alert('<ui:i18n key="修改成功"/>.');
					window.top.closeTab();
					//location.href="/admin/goods/list.htm";
				} else {

					alert('<ui:i18n key="修改异常"/>\n' + res.err_msg + '.');
				}
			},
			error : function(a, msg, c) {
				
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
</script>

<script type="text/javascript">

	function showPopup() {
		
		showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="选择图片"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/picture.htm?fileGroup=1&max=1'
		});	 		
	}

	function choosePicture(obj) {
		
		//console.log('-------parent');
		obj = obj || [];
		if(obj.length > 0){
			//obj为返回的数组 格式 
			/*  
			[{
				  "fileId" : ...
				  ,"fileNm" : ...
				  ,"fileUrl" : ...
			  },
			  {
				  "fileId" : ...
				  ,"fileNm" : ...
				  ,"fileUrl" : ...
			  }]
			*/
			
			//这里写自己的逻辑
			/* console.log(obj[obj.length-1].fileId);
			console.log(obj[obj.length-1].fileNm);
			console.log(obj[obj.length-1].fileUrl); */
			$('.goods-img').hide();
			$('.goods-img-show').show();
			$('.goods-img-show').css("background-image","url("+obj[obj.length-1].fileUrl+")");
			$('input[name="goodsImgId"]').val(obj[obj.length-1].fileId);
		} else {

 			$('.goods-img').show();
			$('.goods-img-show').hide();
			$('input[name="goodsImgId"]').val('');
		}
		closeWindow();
	}

	function closeWindow() {
		 
		closeBpopupWindow('bpopupPicture');
	}
</script>
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<!-- ======================container start=========================== -->
		<div class="ui-box-list clearfix">
			<div class="ui-box">
				<div class="ui-box-header">
					<h3 class="title"><ui:i18n key="标准分类"/>-<ui:i18n key="第1级"/></h3>
				</div>
				<div class="ui-box-body">
					<div class="scroll">
						<ol>
							<c:forEach items="${requestScope.oneSelectList}" var="items" varStatus="status">
							<li onclick="selectChange('${items.goodsClassId}','${items.goodsClassNm}','1')" class="<c:if test="${requestScope.oneSelectNm eq items.goodsClassNm}">active</c:if>">
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
					<h3 class="title"><ui:i18n key="标准分类"/>-<ui:i18n key="第2级"/></h3>
				</div>
				<div class="ui-box-body">
					<div class="scroll">
						<ol class="liListTwo">
							<c:forEach items="${requestScope.twoSelectList}" var="items" varStatus="status">
							<li class="<c:if test="${requestScope.twoSelectNm eq items.goodsClassNm}">active</c:if>">
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
					<h3 class="title"><ui:i18n key="标准分类"/>-<ui:i18n key="第3级"/></h3>
				</div>
				<div class="ui-box-body">
					<div class="scroll">
						<ol class="liListThree">
							<c:forEach items="${requestScope.threeSelectList}" var="items" varStatus="status">
							<li class="<c:if test="${requestScope.threeSelectNm eq items.goodsClassNm}">active</c:if>">
								<span>${items.goodsClassNm}</span>
								<span class="ui-list-item-arrow">></span>
							</li>
							</c:forEach>
						</ol>
					</div>
				</div>
			</div>
		</div>
		<div class="form-warp clearfix">			
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="标准商品分类"/><a class="label-required"></a> :
				</div>
				<div class="form-control">
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
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="商品名称"/><a class="label-required"></a> :
				</div>
				<div class="form-control">
					<input type="text" name="goodsNm" placeholder="<ui:i18n key="请输入商品名称"/>" />
					<input type="hidden" name="goodsId" value="" />
				</div>
			</div>
			<div class="control-warp" style="height: 100px;">
				<div class="form-label" style="vertical-align: top;">
					<ui:i18n key="商品照片"/><a class="label-required"></a> :
				</div>
				<div class="form-control">
					<!-- <input type="file" id="logo_input" name="logo_input" onchange="logoUpload(this)" /> -->
					<div id="preview" class="goods-img" onclick="showPopup()">
						<span><ui:i18n key="添加图片"/></span>
					</div>
					<div class="goods-img-show" onclick="showPopup()">
						<input type="hidden" name="goodsImgId" value="" />
					</div>
				</div>
				<span class="picSize"><ui:i18n key="图片推荐尺寸"/> ：120px * 120px</span>
			</div>
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="商品属性"/><a class="label-required"></a> :
				</div>
				<div class="form-control">
					<div class="goodsSpec" onclick="attributeShow()"><ui:i18n key="使用已有属性"/></div>
				</div>
			</div>
			<table class="grid">
				<thead>
					<tr class="border-top">
						<td class="border-right" style="width: 140px; height: 30px;"><span><ui:i18n key="属性名称"/></span></td>
						<td style="width: 430px;"><span><ui:i18n key="参数"/></span></td>
						<td style="width: 40px;"></td>
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
							<!-- <img class="pointer" onclick="trDelete(this)" src="/admin/images/icon/icon-minus2.png"> -->
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr class="border-top">
						<td colspan="3" style="height: 30px; line-height: 30px;">
							<img class="pointer" onclick="trAdd()" src="/admin/images/icon/icon-plus2.png">&nbsp;&nbsp;&nbsp;<ui:i18n key="添加商品属性"/>
						</td>
					</tr>
				</tfoot>
			</table>
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="商品类型"/><a class="label-required"></a> : 
				</div>
				<div class="form-control">
					<input class="icradio" type="radio" name="isReal" value="1" checked="checked">&nbsp;&nbsp;<ui:i18n key="实物商品"/> ( <ui:i18n key="物流发货"/> )
					&nbsp;&nbsp;&nbsp;
					<input class="icradio" type="radio" name="isReal" value="2">&nbsp;<ui:i18n key="虚拟商品"/> ( <ui:i18n key="无需物流"/> )
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="商品重量"/><a class="label-required"></a> :
				</div>
				<div class="form-control">
					<input type="text" name="goodsWeight" placeholder="<ui:i18n key="请输入商品重量"/>" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" />
				</div>
				<div style="display: inline-block; margin-left: 10px;">(g)</div>
			</div>
<%--
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="商品标签"/><a class="label-required"></a> :
				</div>
				<div class="form-control">
					<ul class="goods-tag">
						<li><img id="goods-tag-add" class="ic-plus2" src="/admin/images/icon/icon-plus2.png">&nbsp;<ui:i18n key="查询新标签"/>(<ui:i18n key="查询关键词"/>)</li>
					</ul>
				</div>
			</div>
--%>
		</div>
		<div class="btn-save" onclick="save()">
			<span class="button-icon conform"></span>
			<span><ui:i18n key="保存"/></span>
		</div>
			
		<!-- ▼ Popup -->
		<div class="pop-attrDiv">
			<div class="pop-header">
				<div class="pop-header-title">
					<span><ui:i18n key="选择商品分类"/></span>
				</div>
				<div class="pop-header-close" onclick="attributeClose()">
					<img src="/admin/images/goodsClass/close.png">
				</div>
			</div>
	
			<div class="pop-container">
				<iframe id="ifrPage" class="ifrPopup" frameborder="0" allowTransparency="true" scrolling="no" vspace="0" hspace="0"></iframe>
			</div>
		</div>
		<!-- ▲ Popup -->
		<!-- ======================container end=========================== -->
	</div>
	<!-- ▲ container  -->
	
	<!-- ▼ Main footer -->
       <%-- <jsp:include page="/admin/inc/footer.jsp"></jsp:include> --%>
	<!-- ▲  Main footer -->
	
	<!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpopupPicture">
			<div class="bpopupWarp">
				<div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
				<div class="bpopupContentWarp"> 
					<iframe class="js-content-iframe" width="100%" height="100%" frameBorder=0 scrolling=yes src=""></iframe>
				</div>
			</div>
		</div>
	<!-- ▲ bpopup area -->
</body>
</html>