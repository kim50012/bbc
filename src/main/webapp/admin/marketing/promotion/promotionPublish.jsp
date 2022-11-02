<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="编辑活动嫌弃"/></title>  
<script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>

<style type="text/css">

body {margin: 0; padding: 0;font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;font-size: 12px;}

.topBorder {width: 100%; height: 25px; margin-top: 30px; border-top: 1px solid #eeeeee; position: relative;}
.ui-title {position: absolute; width: auto; height: 24px; top: -10px; left: 0px; z-index: 1; background-color: #ffffff;padding-right:20px;}
.ui-title img {margin: -4px 20px 0px 15px;}
.ui-title span {font-size: 16px;}

.uiEditBg {width: 100%; margin-top: 10px; position: relative;}
.uiEditBg .uiMobileBg {float: left; width: 335px; min-height: 650px; margin-left: 15px; border: 1px solid #ececec; border-radius: 47px 47px 47px 47px;}
.uiEditBg .uiMobileBg .uiMobileHeader {height: 70px; background-image: url("/admin/images/sendMsgAll/iphone_1.png"); background-repeat: no-repeat; background-position: center;}
.uiEditBg .uiMobileBg .uiMobileTexBg {width: 310px; margin: 0 auto; min-height: 200px; border: 1px solid #c5c5c5; background: #f9f9f9;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiTitle {width: 97%; border: 2px dashed #ff834d; margin: 0 auto; margin-top: 6px; line-height: 30px; min-height: 30px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiImgBg {width: 100%; height: 144px; line-height: 144px; margin-top: 5px; text-align: center;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiImgBg img {width: 100%; height: 100%;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActive {width: 96px; height: 26px; background-color: #9dc214; color: #ffffff; line-height: 26px; margin-top: 14px; margin-left: 10px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveAbs {width: 96px; height: 26px; line-height: 26px; margin-top: 24px; margin-left: 10px; padding-left: 7px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveAbsT {width: 97%; border: 2px dashed #ff834d; margin: 0 auto; margin-top: 6px; min-height: 26px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveCom {min-width: 96px;width:auto; height: 26px; line-height: 26px; margin-top: 24px; margin-left: 10px; padding-left: 7px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveComT {width: 97%; border: 2px dashed #ff834d; margin: 0 auto; margin-top: 6px; min-height: 26px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDate {width: 96px; height: 26px; line-height: 26px; margin-top: 28px; margin-left: 10px; padding-left: 7px; color: #ff7e38;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDB {width: 97%; height: 26px; border: 2px dashed #ff834d; margin: 0 auto;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDB .dateStart {float: left; width: 80px; height: 26px; line-height: 26px; margin-left: 10px; text-align: center;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDB .dateLine {float: left; width: 20px; height: 26px; line-height: 26px; text-align: center;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDB .dateEnd {float: left; width: 80px; height: 26px; line-height: 26px; text-align: center;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiLine {width: 97%; height: 1px; background-color: #ededed; margin: 0 auto; margin-top: 20px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDis {width: 96px; height: 26px; line-height: 26px; margin-top: 20px; margin-left: 10px; font-size: 12px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDisTB {width: 95%; height: 80px; margin-left: 10px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDisTB .uiActiveDisT {float: left; width: 75%; height: 80px; border: 1px solid #ededed; border-radius: 5px 5px 5px 5px; background-color: #ffffff;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiActiveDisTB .uiActiveDisB {float: left; width: 55px; height: 30px; border-radius: 10px 10px 10px 10px; background-color: #98bc3c; color: #ffffff; font-size: 8px; line-height: 30px; text-align: center; margin-left: 5px;}
.uiEditBg .uiMobileBg .uiMobileTexBg .uiEm {width: 100%; height: 80px;}
.uiEditBg .uiMobileBg .uiMobileFooter {height: 63px; background-image: url("/admin/images/sendMsgAll/iphone_home.png"); background-repeat: no-repeat; background-position: center;margin-top: 15px;}


.uiEditBg .arrow,.uiEditBg .arrow:after {float: left; width: 0px; height: 0px; border-style: solid; border-width: 8px 10px 8px 0; border-color: transparent #d1d1d1 transparent transparent; position: absolute; left: 347px; top: 100px;}
.uiEditBg .arrow:after {content: ""; border-right-color: #fff; left: 1px; top: -8px;}
.uiEditBg .uiMobileComBg {float: left; min-width: 550px; min-height: 850px; border: 1px solid #ececec; margin-left: 30px;}

.titlebg {width: 100%; height: 30px; line-height: 30px; margin-top: 30px; position: relative;}
.titlebg .titleText {float: left; margin-left: 48px;}
.titlebg .titleCom {float: left; display: inline-block;}
.titlebg .titleCom .titleInput {width: 300px; height: 26px; padding: 0; margin-bottom: 3px; margin-left: 10px;}

.timebg {width: 100%; height: 30px; position: relative; line-height: 30px; margin-top: 20px;}
.timebg .timeText {float: left; margin-left: 48px;}
.timebg .timeCom {float: left; display: inline-block;}
.timebg .timeCom input {width: 120px; height: 26px; padding: 0; margin-bottom: 3px; font-size: 14px; padding-left: 10px;}
.timebg .timeCom .date1 {margin-left: 10px;}
.timebg .timeCom .line {margin-right: 10px; margin-left: 10px; color: #ab011c;}
.calendar { background-image: url("/admin/images/orders/calendar.png"); background-repeat: no-repeat; background-position: 95% 6px;}

.imgbg {width: 100%; height: 80px; line-height: 80px; margin-top: 20px; position: relative;}
.imgbg .imgText {float: left; margin-left: 48px;}
.imgbg .imgCom {float: left; width: 100px; height: 100px; background-color: #fff; border: 1px solid #fff; text-align: center; margin-left: 10px; cursor: pointer;}
.imgbg .imgCom img {width: 100px; height: 100px;}

.abstractbg {width: 100%; height: 85px; margin-top: 20px; position: relative;}
.abstractbg .abstractText {float: left; margin-left: 48px;}
.abstractbg .abstractCom {float: left; display: inline-block;}
.abstractbg .abstractCom textarea {width: 400px; height: 85px; padding: 0; margin-bottom: 3px; font-size: 12px; margin-left: 10px;}

.combg {width: 100%; min-height: 500px; margin-top: 30px; position: relative;}
.combg .comText {float: left; margin-left: 20px; min-height: 500px;}
.combg .comCom {float: left; display: inline-block; min-height: 500px;}
.combg .comCom .js-editor {width: 400px; min-height: 435px; margin-left: 10px;}

.saveBg {width: 100%; height: 35px; margin-bottom: 20px;}
.saveBg .saveAuto {width: 224px; height: 35px; margin: 0 auto; position: relative;}
.saveBg .saveAuto .save {width: 98px; height: 31px; float: left; margin-left: 0;border-radius:31px;border:2px solid #0e9615; background-image: url("/admin/images/transport/tick.png"); background-repeat: no-repeat; cursor: pointer;color:#313131;background-position: 10px 8px;line-height:31px;}
.saveBg .saveAuto .cancel {width: 98px; height: 31px; float: right; margin-right: 0; border-radius:31px;border:2px solid #d1102d;background-image: url("/admin/images/transport/close.png"); background-repeat: no-repeat; cursor: pointer;color:#313131;background-position: 10px 8px;line-height:31px;}
.saveBg .saveAuto span{margin-left:45px;}
.ui-right-content {min-height: 1100px;}
</style>
<script type="text/javascript">

	var ProId = '';
	var editor = '';
	
	var PproTitle = '';
	var PproStartDt = '';
	var PproEndDt = '';
	var PproType = '';
	
	$(document).ready(function(){ 
		
		ProId = '${requestScope.proId}';
		PproTitle = '${requestScope.PproTitle}';
		PproStartDt = '${requestScope.PproStartDt}';
		PproEndDt = '${requestScope.PproEndDt}';
		PproType = '${requestScope.PproType}';

		$('.datepicker').datepicker();
		
		$('#txtProTitle').keyup(function(){
			
			var title = $(this).val();
	   		   
			$('.uiTitle').html(title);
		});
		
		$('#txtStartDt').change(function(){
			
			var sDate = $(this).val();
	   		   
			$('.dateStart').html(sDate);
		});
		
		$('#txtEndDt').change(function(){
			
			var eDate = $(this).val();
	   		   
			$('.dateEnd').html(eDate);
		});
		
		$('#txtProAbs').keyup(function(){
			
			var abs = $(this).val();
	   		   
			$('.uiActiveAbsT').html(abs);
		});
		
		if(!!editor){
			
			editor.destroy();
			
			$('#js-editor').remove();
			$('#containerWarp').html('');
		}
		editor = UE.getEditor('js-editor', {
			
					autoHeight: false
					, toolbars: [[
			 	                    'undo', 'redo', '|',
			 	                     'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
			 	                     'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
			 	                     'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
			 	                     'directionalityltr', 'directionalityrtl', 'indent', '|',
			 	                     'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
			 	                     'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
			 	                     'simpleupload', 'insertvideo',  'emotion', 'music', 'map',  'template', 'background', '|',
			 	                     'horizontal', 'date', 'time', 'spechars',  '|',
			 	                     'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
			 	                     'searchreplace', 'help' 
			 	                 ]]
					//, initialFrameWidth : 480
					, initialFrameHeight : 300
					, elementPathEnabled : false
		});
		editor.ready(function() {
			editor.setContent($('.uiActiveComT').html()); 
			editor.addListener('selectionchange',function(type,event){
				$('.uiActiveComT').html(editor.getContent());
			})
	        
		});
		 
		$('.js-img-Upload1').click(function(){
			 $('#files1').click();
		});
		$('#fileupload1').fileupload({
			url:'/admin/upload', //文件上传地址，当然也可以直接写在input的data-url属性内
	        formData:{imageType : 3}, //如果需要额外添加参数可以在这里添加
	        done:function(e,res){
			//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
			//注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
			//返回的数据在res.result中，假设我们服务器返回了一个json对象
				$.each(res.result, function (index, file) {
	        	   
					if (file.success) {
						//alert(file.imgUrl+'|||'+file.fileId);
						$('.js-img-Upload1').find('img').attr('src', file.fileUrl);
						$('.uiImgBg').find('img').attr('src', file.fileUrl);
						$('#hidImg1').val(file.fileId);
					} else {
						
						alert('error');
						$('.js-img-Upload1').find('img').attr('src', '/front/img_prd/demoComp/no_image1.png');
						$('.uiImgBg').find('img').attr('src', '/admin/images/icon2/imgSmBg.png');
						$('#hidImg1').val('');
					}
	            });
			}
		});
		 
		$('.js-img-Upload2').click(function(){
			 $('#files2').click();
		});
		$('#fileupload2').fileupload({
			url:'/admin/upload', //文件上传地址，当然也可以直接写在input的data-url属性内
	        formData:{imageType : 3}, //如果需要额外添加参数可以在这里添加
	        done:function(e,res){
			//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
			//注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
			//返回的数据在res.result中，假设我们服务器返回了一个json对象
				$.each(res.result, function (index, file) {
	        	   
					if (file.success) {
						//alert(file.imgUrl+'|||'+file.fileId);
						$('.js-img-Upload2').find('img').attr('src', file.fileUrl);
						$('#hidImg2').val(file.fileId);
					} else {
						
						alert('error');
						$('.js-img-Upload2').find('img').attr('src', '/front/img_prd/demoComp/no_image1.png');
						$('#hidImg2').val('');
					}
	            });
			}
		});
	});
	
	//保存
	function proSave(){

		var proTitle = $('#txtProTitle').val();
		var startDt = $('#txtStartDt').val();
		var endDt = $('#txtEndDt').val();
		var img1 = $('#hidImg1').val();
		var img2 = $('#hidImg2').val();
		var proAbs = $('#txtProAbs').val();
		var proDesc = $('.uiActiveComT').html();
		if(proTitle == ''){
			
			alert('<ui:i18n key="请输入活动标题"/>');
			return;
		}
		
		if(startDt == ''){
			
			alert('<ui:i18n key="请选择活动开始时间"/>');
			return;
		}
		
		if(endDt == ''){
			
			alert('<ui:i18n key="请选择活动结束时间"/>');
			return;
		}
		
		var date1 = new Date(startDt);
		var date2 = new Date(endDt);
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		
		if(ProId == '') {
			
			if(img1 == ''){
				
				alert('<ui:i18n key="请上传主页活动图片"/>');
				return;
			}
			if(img2 == ''){
				
				alert('<ui:i18n key="请上传子页活动图片"/>');
				return;
			}
		}
		
		if(proAbs == ''){
			
			alert('<ui:i18n key="请输入活动摘要"/>');
			return;
		}
		
		if(proDesc == ''){
			
			alert('<ui:i18n key="请输入活动详情描述"/>');
			return;
		}

		var params = {
				proId : ProId,
				proTitle : proTitle,
				proStartDt : startDt,
				proEndDt : endDt,
				proImgIdF : img1,
				proImgIdS : img2,
				proAbs : proAbs,
				proDesc : proDesc
			};
		$.ajax({
			data : params,
			url : '/admin/promotion/proSave.htm',
			success : function(data) {

				if (data.result == 'SUCCESS'){
					
					alert('<ui:i18n key="保存成功"/>.');
					location.href = '/admin/promotion/promotionList.htm?proTitle='+PproTitle+'&proStartDt='+PproStartDt+'&proEndDt='+PproEndDt+'&proType='+PproType;
				} else {
					
					alert('<ui:i18n key="请检查信息"/>'+','+'<ui:i18n key="重新点击保存"/>.');
				}
			},
			error : function(obj, e, msg) {
				
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
	
	//取消
	function proCancel() {
		
		location.href = '/admin/promotion/promotionList.htm?proTitle='+PproTitle+'&proStartDt='+PproStartDt+'&proEndDt='+PproEndDt+'&proType='+PproType;
	}
</script>
</head>
<body>
	<!-- ▼ Main container -->
	<div class="container">
		<div class="ui-right-content">
		<form id="fileupload1" method="POST" enctype="multipart/form-data" action="">
			<input id="files1" type="file" name="files[]" multiple style="display: none;" />  
		</form>
		<form id="fileupload2" method="POST" enctype="multipart/form-data" action="">
			<input id="files2" type="file" name="files[]" multiple style="display: none;" />  
		</form>



			
			<div class="uiEditBg">
				<div class="uiMobileBg" style="width:320px;margin-left:5px;">
					<div class="uiMobileHeader"></div>
					<div class="uiMobileTexBg" style="width:300px;">
						<c:choose>
							<c:when test="${requestScope.proTitle eq ''}">
								<div class="uiTitle"><ui:i18n key="活动标题"/></div>
							</c:when>
							<c:otherwise>
								<div class="uiTitle">${requestScope.proTitle}</div>
							</c:otherwise>
						</c:choose>
						<div class="uiImgBg">
							<c:choose>
								<c:when test="${requestScope.proPicUrl eq ''}">
									<img src="/admin/images/icon2/imgSmBg.png" />
								</c:when>
								<c:otherwise>
									<img src="${requestScope.proPicUrl}" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="uiActive">&nbsp;&nbsp;<ui:i18n key="活动详情"/>  >></div>
						<div class="uiActiveAbs"><ui:i18n key="摘要"/></div>
						<div class="uiActiveAbsT">
							<c:choose>
								<c:when test="${requestScope.proAbs eq ''}">
									<ui:i18n key="摘要"/>
								</c:when>
								<c:otherwise>
									<c:out value="${requestScope.proAbs}"></c:out>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="uiActiveCom"><ui:i18n key="活动详情描述"/></div>
						<div class="uiActiveComT">
							<c:choose>
								<c:when test="${requestScope.proDesc eq ''}">
									<ui:i18n key="活动详情描述"/>
								</c:when>
								<c:otherwise>
									${requestScope.proDesc}
								</c:otherwise>
							</c:choose>
						</div>
						<div class="uiActiveDate"><ui:i18n key="活动日期"/>：</div>
						<div class="uiActiveDB">
							<div class="dateStart">${requestScope.proStartDt}</div>
							<div class="dateLine">~</div>
							<div class="dateEnd">${requestScope.proEndDt}</div>
						</div>
						<div class="uiLine"></div>
						<div class="uiActiveDis"><ui:i18n key="活动评论"/></div>
						<div class="uiActiveDisTB">
							<div class="uiActiveDisT"></div>
							<div class="uiActiveDisB"><ui:i18n key="发表评论"/></div>
						</div>
						<div class="uiEm"></div>
					</div>
					<div class="uiMobileFooter"></div>
				</div>
				<div class="arrow"></div>
				<div class="uiMobileComBg">
					<div class="titlebg">
						<div class="titleText"><ui:i18n key="活动标题"/><span style="color:#d1102d;">*</span>：</div>
						<div class="titleCom">
							<input type="text" id="txtProTitle" class="titleInput" value="${requestScope.proTitle}" />
						</div>
					</div>
					<div class="timebg">
						<div class="timeText"><ui:i18n key="活动时间"/><span style="color:#d1102d;">*</span>：</div>
						<div class="timeCom">
							<input type="text" id="txtStartDt" class="datepicker calendar date1" value="${requestScope.proStartDt}" />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
							<input type="text" id="txtEndDt" class="datepicker calendar date2" value="${requestScope.proEndDt}" />
						</div>
					</div>
					<div class="imgbg">
						<div class="imgText"><ui:i18n key="主页图片"/><span style="color:#d1102d;">*</span>：</div>
						<div class="imgCom js-img-Upload1">
							<input type="hidden" id="hidImg1" value="" />
							<c:choose>
								<c:when test="${requestScope.proPicUrl eq ''}">
									<c:if test="${label.主页图片!='主页图片' }"><img src="/admin/images/shopCreate/no_image_ko.png"/></c:if>
									<c:if test="${label.主页图片=='主页图片' }"><img src="/front/img_prd/demoComp/no_image1.png"/></c:if>
									<!-- <img src="/front/img_prd/demoComp/no_image1.png" /> -->
								</c:when>
								<c:otherwise>
									<img src="${requestScope.proPicUrl}" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div style="color: #d1102d; font-size: 12px; margin-left: 240px;"><ui:i18n key="图片推荐尺寸"/>：<ui:i18n key="宽度"/>640px</div>
					<div class="imgbg">
						<div class="imgText" <c:if test="${label.主页图片!='主页图片' }">style=""</c:if> ><ui:i18n key="子页图片"/><span style="color:#d1102d;">*</span>：</div>
						<div class="imgCom js-img-Upload2">
							<input type="hidden" id="hidImg2" value="" />
							<c:choose>
								<c:when test="${requestScope.proPicDltUrl eq ''}">
									<c:if test="${label.主页图片!='主页图片' }"><img src="/admin/images/shopCreate/no_image_ko1.png"/></c:if>
									<c:if test="${label.主页图片=='主页图片' }"><img src="/front/img_prd/demoComp/no_image1.png"/></c:if>
									<!-- <img src="/front/img_prd/demoComp/no_image1.png" /> -->
								</c:when>
								<c:otherwise>
									<img src="${requestScope.proPicDltUrl}" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div style="color: #d1102d; font-size: 12px; margin-left: 240px;"><ui:i18n key="图片推荐尺寸"/>：<ui:i18n key="宽度"/>640px</div>
					<div class="abstractbg">
						<div class="abstractText"><ui:i18n key="活动摘要"/><span style="color:#d1102d;">*</span>：</div>
						<div class="abstractCom">
							<textarea id="txtProAbs" rows="4" cols="50" maxlength="300" placeholder="<ui:i18n key="最多输入300个字"/>"><c:out value="${requestScope.proAbs}"></c:out></textarea>
						</div>
					</div>
					
					<div class="combg">
						<div class="comText"><ui:i18n key="活动详情描述"/><span style="color:#d1102d;">*</span>：</div>
						<div class="comCom">
							<div id="containerWarp">
								<div id="js-editor" class="js-editor"></div>
							</div>
						</div>
					</div>
					<div class="saveBg" style="text-align: center;">
			  			<span class="button bg-red" onclick="javascript:proSave();">
							<span class="button-icon conform"></span>
							<span class="button-name"><ui:i18n key="保存"/></span>
						 </span> 
						 <span class="button bg-red"  style="margin-left: 100px;" onclick="javascript:proCancel();">
							<span class="button-icon cancel"></span>
							<span class="button-name"><ui:i18n key="取消"/></span>
						 </span> 
					</div>
				</div>
			</div>


		</div>
	</div>
	<!-- ▲ Main container -->

	<!-- ▼ Main footer -->
	<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
	<!-- ▲  Main footer -->
</body>
</html>