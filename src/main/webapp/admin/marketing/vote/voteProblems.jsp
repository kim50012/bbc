<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="投票调查"/></title>  
<script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>

<style type="text/css">

body {margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 12px;color:#5f5f5f;}

.topBorder {width: 100%; height: 25px; margin-top: 30px; border-top: 1px solid #eeeeee; position: relative;}
.ui-title {position: absolute; width: auto; height: 24px; top: -10px; left: 0px; z-index: 1; background-color: #ffffff;padding-right:20px;}
.ui-title img {margin: -4px 20px 0px 15px;}
.ui-title span {font-size: 12px;color:#5f5f5f;}

.uiReBg {position: absolute; width: auto; height: 24px; background-color: #ffffff; top: 16px; right: 120px; cursor: pointer;}
.uiReBg .uiReImg {float: left; width: 16px; height: 14px; background-image: url("/admin/images/icon/back.png"); background-repeat: no-repeat; margin-top: 5px; margin-right: 10px; margin-left: 20px;}
.uiReBg .uiReText {float: left; font-size: 12px;color:#5f5f5f; margin-top: 3px;margin-right:20px;}

.ui-voteBg {width: 100%; height: 220px; border: 1px solid #eeeeee;}
.ui-voteBg .ui-vote {width: 100%; height: 30px; margin-top: 20px;}
.ui-voteBg .ui-vote .uiNametext {float: left; margin-left: 30px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote .uiNameCom {float: left; margin-left: 10px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote .uiNameCom input {width: 266px;}
.ui-voteBg .ui-vote .uiTimetext {float: left; margin-left: 55px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote .uiTimeCom {float: left; margin-left: 10px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote .uiTimeCom input {width: 106px;}
.selectCss {width: 80px; margin-bottom: 3px; margin-left: 5px; height: 28px;}
.calendar { background-image: url("/admin/images/orders/calendar.png"); background-repeat: no-repeat; background-position: 95% 6px;}

.ui-voteBg .ui-vote2 {width: 100%; height: 30px; margin-top: 10px;}
.ui-voteBg .ui-vote2 .uiNametext {float: left; margin-left: 30px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote2 .uiNameCom {float: left; margin-left: 10px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote2 .uiNameCom input {width: 266px;}
.ui-voteBg .ui-vote2 .uiPowertext {float: left; margin-left: 55px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote2 .uiPowerCom {float: left; margin-left: 10px; height: 30px; line-height: 30px; display: inline-block;}
.ui-voteBg .ui-vote2 .uiPowerCom label {display: inline-block; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote2 .uiPowerCom .radio input[type="radio"] {margin-top: 10px; margin-right: 5px;}

.ui-voteBg .ui-vote3 {width: 100%; height: 30px; margin-top: 10px;}
.ui-voteBg .ui-vote3 .uiNametext {float: left; margin-left: 30px; height: 30px; line-height: 30px;}
.ui-voteBg .ui-vote3 .uiImg {float: left; height:60px;width:60px;border:1px solid #ddd; text-align: center;line-height:60px;background-color: #fff;margin-left:10px;cursor: pointer;}
.ui-voteBg .ui-vote3 .uiImg img{width:60px;height:60px;}
.ui-voteBg .ui-vote3 .uiImg .icon-plus3 {display: inline-block; width: 18px;  height: 18px;background-image: url("/admin/images/icon/icon-plus2.png");background-repeat: no-repeat;background-position: 0;}

.ui-qBg .ui-qBBg {width: 100%; margin-top: 20px;}
.ui-qBg .ui-qBBg .ui-qTBg {width: 100%; height: 25px; font-size: 14px;color:#5f5f5f; line-height: 25px;}
.ui-qBg .ui-qBBg .ui-qTBg .ui-qText {float: left; width: 6%;}
.ui-qBg .ui-qBBg .ui-qTBg .ui-qLine0 {float: left; width: 94%; height: 0px;  margin-top: 12px;}
.ui-qBg .ui-qBBg .ui-qTBg .ui-qLine {float: left; width: 84%; height: 0px; margin-top: 12px;}
.ui-qBg .ui-qBBg .ui-qTBg .ui-qDelete {float: left; width: 10%; display: inline-block; text-align: center; font-size: 12px;color:#5f5f5f; height: 25px; line-height: 25px; cursor: pointer;}
.ui-qBg .ui-qBBg .ui-qTBg .ui-qDelete img {width: 18px; height: 18px; margin-top: -4px;}

.ui-qBg .ui-qBBg .ui-questBg {width: 100%; min-height: 50px; border-bottom: 1px solid #eeeeee;border-top: 1px solid #d2112b;border-right: 1px solid #eeeeee;border-left: 1px solid #eeeeee;}
.ui-qBg .ui-qBBg .ui-questBg .ui-questTiBg {width: 100%; height: 30px; margin-top: 10px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-questTiBg .ui-qTitle {float: left; margin-left: 30px; width: 60px; height: 30px; line-height: 30px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-questTiBg .ui-qNm {float: left; margin-left: 10px; height: 30px; line-height: 30px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-questTiBg .ui-qNm input {width: 266px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-questTiBg .ui-qOnlyBg {float: left; margin-left: 10px; height: 30px; line-height: 30px; display: inline-block;}
.ui-qBg .ui-qBBg .ui-questBg .ui-questTiBg .ui-qOnlyBg label {display: inline-block; height: 30px; line-height: 30px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-questTiBg .ui-qOnlyBg input[type="radio"] {margin-top: 10px; margin-right: 5px;}

.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-option {width: 100%; height: 30px; margin-top: 10px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-option .ui-oTitle {float: left; margin-left: 30px; width: 60px; height: 30px; line-height: 30px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-option .ui-oNm {float: left; margin-left: 10px; height: 30px; line-height: 30px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-option .ui-oNm input {width: 266px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-option .ui-oImgBg {float: left; height: 30px; line-height: 30px; margin-left: 25px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-option .ui-oImgBg .imgAdd {width: 22px; height: 20px; cursor: pointer;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-option .ui-oImgBg .imgDel {width: 18px; height: 18px; cursor: pointer;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-upLoad {width: 110px; height: 75px; text-align: left; vertical-align: bottom; display: inline-block; margin-top: 5px; margin-left: 100px; display: none;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-upLoad img {width: 75px; height: 75px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionList .ui-optionBg .ui-upLoad span {font-size: 12px; color: blue; cursor: pointer; margin-top: 30px; vertical-align: bottom;}

.ui-qBg .ui-qBBg .ui-questBg .ui-optionAddBg {width: 100%; height: 30px; margin-top: 10px; margin-bottom: 10px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionAddBg .ui-optionAdd {margin-left: 30px; height: 30px; line-height: 30px; display: inline-block; cursor: pointer;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionAddBg .ui-optionAdd img {width: 18px; height: 18px; margin-bottom: 3px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-optionAddBg .ui-optionAdd span {margin-left: 5px;}

.ui-qBg .ui-qBBg .ui-questBg .ui-Show {display: inline-block; height: 20px; background-color: #fff; text-align: center; line-height: 20px; cursor: pointer; float: right; right: 130px; position: relative; top: -10px;padding-left:20px;padding-right:20px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-Show img {width: 12px; height: 7px;}

.ui-qBg .ui-qBBg .ui-questBg .ui-Hide {display: inline-block; height: 20px; background-color: #fff; text-align: center; line-height: 20px; cursor: pointer; float: right; right: 130px; position: relative; top: 0px; display: none;}
.ui-qBg .ui-qBBg .ui-questBg .ui-Hide img {width: 12px; height: 7px;}
.ui-qBg .ui-qBBg .ui-questBg .ui-Hide span{margin-right: 20px}


.ui-questAddBg {width: 100%; height: 46px; line-height: 46px; border: 1px solid #eeeeee; text-align: center; margin-top: 20px;}
.ui-questAddBg .ui-questAdd {display: inline-block; cursor: pointer;}
.ui-questAddBg .ui-questAdd img {width: 18px; height: 18px; margin-bottom: 3px;}
.ui-questAddBg .ui-questAdd span {margin-left: 5px;}

.ui-Save {width: 100%; height: 50px; line-height: 50px; display: inline-block; text-align: center; margin-top: 50px; }
.ui-Save img {width: 102px; height: 35px; cursor: pointer;}
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
	margin-left:10px;
}
.img-publish-div{
	width:98px;
	height:98px;
	border:1px solid #d2d2d2;
	background: url("/admin/images/rouletteActivity/icon_img.png");
	background-position: 38px 33px;
	background-repeat:no-repeat;
	background-color:#f7f7f7;
	cursor: pointer;
	margin-top:0px;
	float: left;
	margin-left:10px;
	
}
.img-publish-div span{
	width:100%;
	text-align: center;
	display: inline-block;
	margin-top:60px;
	color:#5f5f5f;
	font-size:12px;
}
.img-publish-div img{
	width:98px;
	height:98px;
}
.iradio_square-firebrick{margin-right:10px;margin-left:0px;}
</style>
<script type="text/javascript">

	var IDX = "0_0";
	var VOTE_ID = '';
	var VOTE_NM = '';
	var VOTE_TYPE = '';
	
	$(document).ready(function() {
		if('<ui:i18n key="投票调查"/>' != '投票调查'){
			$('.cssadd1').attr('style','margin-left:67px;');
			$('.cssadd2').attr('style','margin-left:54px;');
			$('.cssadd3').attr('style','margin-left:55px;');
		}
		VOTE_ID = '${requestScope.voteId}';
		VOTE_NM = '${requestScope.voteNm}';
		VOTE_TYPE = '${requestScope.voteType}';
		
		if (VOTE_ID != '') {
			
			$('#txtVoteNm').val('${requestScope.reVoteHeader.VOTE_NM}');
			$('#txtVoteDt').val('${requestScope.reVoteHeader.VOTE_DT}');
			$('#selectVoteHour').select2('val', '${requestScope.reVoteHeader.VOTE_HOUR}');
			$('#selectVoteMin').select2('val', '${requestScope.reVoteHeader.VOTE_MIN}');
			/* var votePer = "${requestScope.reVoteHeader.VOTE_PER}"; */
			/* $('input[name="raVotePer"][value='+votePer+']').attr("checked","checked"); */
			$('.ui-title').find('span').html('<ui:i18n key="修改投票"/>');
			$('#imgUrl').val('${requestScope.reVoteHeader.imgUrl}');
			$('#voteDesc').val('${requestScope.reVoteHeader.voteDesc}');
			var prevDiv = document.getElementById('preview');
			if('${requestScope.reVoteHeader.imgUrl}' == ''){
				prevDiv.innerHTML = '<span><ui:i18n key="添加图片"/></span>';
			}else{
				prevDiv.innerHTML = '<img id="imgInput" alt="logo" src="${requestScope.reVoteHeader.imgUrl}" />';				
			}
		}
		
		$('#fileupload').fileupload({
			url:'/admin/upload', //文件上传地址，当然也可以直接写在input的data-url属性内
	        formData:{imageType : 3}, //如果需要额外添加参数可以在这里添加
	        done:function(e,res){
			//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
			//注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
			//返回的数据在res.result中，假设我们服务器返回了一个json对象
				$this = $('#picFile_'+IDX);
				$.each(res.result, function (index, file) {
					
					if (file.success) {
						//alert(file.imgUrl+"|||"+file.fileId);
						$this.show();
						$this.find('img').attr('src', file.fileUrl);
						$this.find('input[type="hidden"]').val(file.fileId);
					} else {
						alert('error');
						$this.hide();
						$this.find('img').attr('src', '');
						$this.find('input[type="hidden"]').val('');
					}
	            });
			}
		});
		
		$('#voteImg').fileupload({
			url : '/admin/upload', //文件上传地址，当然也可以直接写在input的data-url属性内
	        formData : {imageType : 3}, //如果需要额外添加参数可以在这里添加
	        done : function(e,res){
			//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
			//注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
			//返回的数据在res.result中，假设我们服务器返回了一个json对象
				$this = $('#picFile_'+IDX);
				$.each(res.result, function (index, file) {
					var prevDiv = document.getElementById('preview');
					if (file.success) {
						//alert(file.imgUrl+"|||"+file.fileId);
						prevDiv.innerHTML = '<img id="imgInput" alt="logo" src="' + file.fileUrl + '" />';
						$("#imgUrl").val(file.fileUrl);
					} else {
						alert('error');
						prevDiv.innerHTML = '<span><ui:i18n key="添加图片"/></span>';
					}
	            });
			}
		});
		$('#preview').click(function(){
			$('#voteImg').trigger('click');
		});
	});
	
	//pic upload
	function picUpload(obj) {
		
		$this = $(obj).closest('.ui-oImgBg');
		IDX = $this.find('.imgAdd').data('id');
		$('#files').click();
	}
	
	//pic delete
	function picDelete(obj) {
		
		$this = $(obj).closest('.ui-upLoad');
		$this.hide();
		$this.find('img').attr('src','');
		$this.find('input[type="hidden"]').val('00000');
	}
	
	//goback
	function popReturn() {
		
		window.history.back();
	}
	
	//add option
	function optionAdd(obj) {
		
		$this = $(obj).closest('.ui-questBg'); 
		var questionCheck = $this.find('input[name="QUESTIONS"]');
		var optionCheck = $this.find('input[name="OPTIONS"]');
		var vCheck = 0;
		
		if (questionCheck.val() == '') {
			
			alert('<ui:i18n key="请完善问题的标题"/>'+'.');
			return;
		}
		
		$(optionCheck).each(function(i){
			
			if ($(this).val() == '') {
				vCheck = i+1;
				return false;
			}
	    });
		if (vCheck > 0) {
			
			alert('<ui:i18n key="请完善选项"/>'+vCheck+'<ui:i18n key="的内容"/>.');
			return;
		}
		//return;
		var optionCount = $this.find('.ui-optionList .ui-optionBg').length;
		var questionId = $this.closest('.ui-qBBg').data('id');
		var optionList = '<div class="ui-optionBg">'+
								'<div class="ui-option">'+
									'<div class="ui-oTitle"><ui:i18n key="选项"/>'+(optionCount+1)+'：</div>'+
									'<div class="ui-oNm">'+
										'<input type="text" name="OPTIONS" value="" />'+
										'<input type="hidden" name="optionId" value="00000" />'+
									'</div>'+
									'<div class="ui-oImgBg">'+
										'<img class="imgAdd" src="/admin/images/icon/btn_add.png" data-id="'+questionId+'_'+optionCount+'" onclick="picUpload(this);" />&nbsp;&nbsp;&nbsp;&nbsp;'+
										'<img class="imgDel" src="/admin/images/icon/icon-minus2.png" onclick="optionDel(this);" />'+
									'</div>'+
								'</div>'+
								'<div class="ui-upLoad" id="picFile_'+questionId+'_'+optionCount+'">'+
									'<img src="" />'+
									'<input type="hidden" name="OPTIONIMGS" value="00000" />'+
									'<span onclick="picDelete(this);"><ui:i18n key="删除"/></span>'+
								'</div>'+
						 '</div>';
		$this.find('.ui-optionList').append(optionList);
	}
	
	//del option
	function optionDel(obj){

		if(confirm('<ui:i18n key="您确定需要删除吗"/>？')) {
			
			var qDex = $(obj).closest('.ui-qBBg').data('id');
			$this = $(obj).closest('.ui-optionBg');
			var questId = $(obj).closest('.ui-questBg').find('.ui-questTiBg input[name="questId"]').val();
			var optionId = $this.find('input[name="optionId"]').val();
			//alert(questId);
			//alert(optionId);
			//return;
			if (VOTE_ID != "" && questId != "00000" && optionId != "00000") {
				//alert('delete');
				$.ajax({
					data : {voteId : VOTE_ID, questId : questId, optionId : optionId, jobType : 3},
					url : "/admin/vote/voteDelete.htm",
					success : function(res) {

						if (res.success){
							alert('<ui:i18n key="删除成功"/>.');
						} else {
							
							alert('<ui:i18n key="请检查信息"/>,'+res.err_msg+'.');
						}
					},
					error : function(obj, e, msg) {
						
						alert('<ui:i18n key="网络出现故障"/>.');
					}
				});
			}
			
			$this.siblings('.ui-optionBg').each(function(idx){
	
				var id = qDex + '_' + idx;
	 			$(this).find('.ui-oTitle').html('<ui:i18n key="选项"/>' + (idx + 1) + '：');
	 			$(this).find('.imgAdd').attr('data-id', id);
	 			$(this).find('.ui-upLoad').attr('id', 'picFile_' + id);
	 		});
	 		$this.remove();
		}
	}
	
	//question hide
	function hide(obj) {
		
		$this = $(obj).closest('.ui-questBg');
		$this.find('.ui-optionList').fadeOut(100);
		$this.find('.ui-optionAddBg').fadeOut(100);
		$this.find('.ui-Show').hide();
		$this.find('.ui-Hide').show();
		
	}
	
	//question hide
	function show(obj) {
		
		$this = $(obj).closest('.ui-questBg');
		$this.find('.ui-optionList').fadeIn(1000);
		$this.find('.ui-optionAddBg').fadeIn(1000);
		$this.find('.ui-Show').show();
		$this.find('.ui-Hide').hide();
		
	}
	
	//add question
	function questAdd(obj) {		

		var questionCheck = 0;
		var optionCheck = 0;
		var optionQCheck = 0;
		
	    $('.ui-qBg .ui-qBBg').each(function(idx) {
			
	    	var question = $(this).find('input[name="QUESTIONS"]');
	    	optionQCheck = Number(idx)+1;
	    	//alert(idx);
			if (question.val() == "") {
				
				questionCheck = Number(idx)+1;
				return false;
			}

			$(this).find('.ui-optionList .ui-optionBg').each(function(idx) {

				var option = $(this).find('input[name="OPTIONS"]');
				
				if (option.val() == "") {
					optionCheck = Number(idx)+1;
					return false;
				}
			});
			if (optionCheck > 0) {
				return false;
			}
	    });
	    if (questionCheck > 0) {
	    	
	    	alert('<ui:i18n key="请完善问题"/>'+questionCheck+'<ui:i18n key="的标题"/>.');
	    	return;
	    }
	    if (optionCheck > 0) {
	    	
	    	alert('<ui:i18n key="请完善问题"/>'+optionQCheck+'<ui:i18n key="中的选项"/>'+optionCheck+'<ui:i18n key="的内容"/>.');
	    	return;
	    }
		
		$this = $(obj).closest('.ui-right-content').find('.ui-qBg');
		var questCount = $this.find('.ui-qBBg').length;
		var questList = '<div class="ui-qBBg"  data-id="'+questCount+'">'+
							'<div class="ui-qTBg">'+
								'<div class="ui-qText"><ui:i18n key="问题"/>'+(questCount+1)+'</div>'+
								'<div class="ui-qLine"></div>'+
								'<div class="ui-qDelete" onclick="questDel(this);">'+
									'<img src="/admin/images/pointMst/main_delete.png" />&nbsp;'+
									'<span><ui:i18n key="删除问题"/></span>'+
								'</div>'+
							'</div>'+
							'<div class="ui-questBg">'+
								'<div class="ui-questTiBg">'+
									'<div class="ui-qTitle"><ui:i18n key="标题"/>：</div>'+
									'<div class="ui-qNm">'+
										'<input type="text" name="QUESTIONS" value="" />'+
										'<input type="hidden" name="questId" value="00000" />'+
									'</div>'+
									'<div class="ui-qOnlyBg">'+
										'<label class="radio">'+
											'<input type="radio" value="Y" class="icradio" name="raOnly_'+questCount+'" checked="checked"><ui:i18n key="单选"/>'+
										'</label>&nbsp;&nbsp;'+ 
										'<label class="radio">'+
											'<input type="radio" value="N" class="icradio" name="raOnly_'+questCount+'"><ui:i18n key="可多选"/>&nbsp;'+
										'</label>'+
									'</div>'+
								'</div>'+
								'<div class="ui-optionList">'+								
									'<div class="ui-optionBg">'+
										'<div class="ui-option">'+
											'<div class="ui-oTitle"><ui:i18n key="选项"/>1：</div>'+
											'<div class="ui-oNm">'+
												'<input type="text" name="OPTIONS" value="" />'+
												'<input type="hidden" name="optionId" value="00000" />'+
											'</div>'+
											'<div class="ui-oImgBg">'+
												'<img class="imgAdd" src="/admin/images/icon/btn_add.png" data-id="'+questCount+'_0" onclick="picUpload(this);" />'+
											'</div>'+
										'</div>'+
										'<div class="ui-upLoad" id="picFile_'+questCount+'_0">'+
											'<img src="" />'+
											'<input type="hidden" name="OPTIONIMGS" value="00000" />'+
											'<span onclick="picDelete(this);"><ui:i18n key="删除"/></span>'+ 
										'</div>'+
									'</div>'+
									'<div class="ui-optionBg">'+
										'<div class="ui-option">'+
											'<div class="ui-oTitle"><ui:i18n key="选项"/>2：</div>'+
											'<div class="ui-oNm">'+
												'<input type="text" name="OPTIONS" value="" />'+
												'<input type="hidden" name="optionId" value="00000" />'+
											'</div>'+
											'<div class="ui-oImgBg">'+
												'<img class="imgAdd" src="/admin/images/icon/btn_add.png" data-id="'+questCount+'_1" onclick="picUpload(this);" />'+
											'</div>'+
										'</div>'+
										'<div class="ui-upLoad" id="picFile_'+questCount+'_1">'+
											'<img src="" />'+
											'<input type="hidden" name="OPTIONIMGS" value="00000" />'+
											'<span onclick="picDelete(this);"><ui:i18n key="删除"/></span>'+ 
										'</div>'+
									'</div>'+
								'</div>'+
								'<div class="ui-optionAddBg">'+
									'<div class="ui-optionAdd" onclick="optionAdd(this);">'+
										'<img src="/admin/images/icon/icon-plus2.png" />'+
										'<span><ui:i18n key="添加选项"/></span>'+
									'</div>'+
								'</div>'+
								'<div class="ui-Show" onclick="hide(this);">'+
									'<img src="/admin/images/cust/up.png" />&nbsp;&nbsp;&nbsp;'+
									'<span><ui:i18n key="隐藏选项"/></span>'+
								'</div>'+
								'<div class="ui-Hide" onclick="show(this);">'+
									'<img src="/admin/images/cust/btn_detail.png" />&nbsp;&nbsp;&nbsp;'+
									'<span><ui:i18n key="打开选项"/></span>'+
								'</div>'+
							'</div>'+
						'</div>';
		$this.append(questList);
		$('.icradio').iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	  });
	}
	
	//del question
	function questDel(obj){ 
		
		if(confirm('<ui:i18n key="您确定需要删除吗"/>？')) {
			
			$this = $(obj).closest('.ui-qBBg');
			var questId = $this.find('input[name="questId"]').val();
			//alert(questId);
			if (VOTE_ID != "" && questId != "00000") {
				//alert('delete');
				$.ajax({
					data : {voteId : VOTE_ID, questId : questId, jobType : 2},
					url : "/admin/vote/voteDelete.htm",
					success : function(res) {

						if (res.success){
							
							alert('<ui:i18n key="删除成功"/>.');
						} else {
							
							alert('<ui:i18n key="请检查信息"/>'+',' + res.err_msg);
						}
					},
					error : function(obj, e, msg) {
						
						alert('<ui:i18n key="网络出现故障"/>'+'.');
					}
				});
			}
			$this.siblings('.ui-qBBg').each(function(idx){

	 			$(this).find('.ui-qText').html('<ui:i18n key="问题"/>'+(idx+1)+'：');
	 			$(this).attr('data-id', idx);
	 			$(this).find('input[type="radio"]').attr('name', 'raOnly_'+idx);
	 			
	 			var qDex = idx;
	 			$(this).find('.ui-optionBg').each(function(idx){
	 				
	 				var id = qDex+'_'+idx;
	 	 			$(this).find('.imgAdd').attr('data-id', id);
	 	 			$(this).find('.ui-upLoad').attr('id', 'picFile_'+id);
	 	 			//$(this).find('input[type="text"]').attr('name', 'OPTIONS_'+qDex);
	 	 			//$(this).find('input[type="hidden"]').attr('name', 'OPTIONIMGS_'+qDex);
	 	 		});
	 		});
	 		$this.remove();
		}
	}
	
	//save vote
	function save() {
		
		if (VOTE_ID == "") {
			var voteNm = $('#txtVoteNm').val();
			var voteDt = $('#txtVoteDt').val();
			var	voteHour = $('#selectVoteHour').find('option:selected').val();
			var voteMin = $('#selectVoteMin').find('option:selected').val();
			var votePer = $('input[name="raVotePer"]:checked').val();
			var questions = "";
			var questionCheck = 0;
			var options = "";
			var optionCheck = 0;
			var optionQCheck = 0;
			
			if (voteNm == "") {
				
				alert('<ui:i18n key="请输入投票名称"/>.');
				return;
			}
			if (voteDt == "" || voteHour == "" || voteMin == "") {
				
				alert('<ui:i18n key="请完善截止时间"/>.');
				return;
			}
			var imgUrl=$("#imgUrl").val();
			var voteDesc=$("#voteDesc").val();
			if(voteDesc==""){
				alert('<ui:i18n key="请完善描述内容"/>.');
				return;
			}
			if(imgUrl==""){
				alert('<ui:i18n key="请选择图片"/>.');
				return;
			}
		    $('.ui-qBg .ui-qBBg').each(function(idx) {
				
		    	var question = $(this).find('input[name="QUESTIONS"]');
		    	var questionType = $(this).find('input[name="raOnly_'+idx+'"]:checked');
		    	optionQCheck = Number(idx)+1;
		    	//alert(idx);
				if (question.val() == "") {
					
					questionCheck = Number(idx)+1;
					return false;
				} else {
					questions += question.val() + "|,|" + questionType.val() + "|@|";
				}
	
				$(this).find('.ui-optionList .ui-optionBg').each(function(idx) {
	
					var option = $(this).find('input[name="OPTIONS"]');
					var optionImg = $(this).find('input[name="OPTIONIMGS"]');
					
					if (option.val() == "") {
						optionCheck = Number(idx)+1;
						return false;
					} else {
						options += option.val() + "|$|" + optionImg.val() + "|,|";
					}
				});
			    options = options.substring(0, options.length-3);
				if (optionCheck > 0) {
					return false;
				} else {
					options += "|@|";
				}
		    });
		    if (questionCheck > 0) {
		    	
		    	alert('<ui:i18n key="请完善问题"/>'+questionCheck+'<ui:i18n key="的标题"/>.');
		    	return;
		    }
		    if (optionCheck > 0) {
		    	
		    	alert('<ui:i18n key="请完善问题"/>'+optionQCheck+'<ui:i18n key="中的选项"/>'+optionCheck+'<ui:i18n key="的内容"/>.');
		    	return;
		    }
		    questions = questions.substring(0,questions.length-3);
		    options = options.substring(0, options.length-3);
		    //alert(questions);
		    //alert(options);
		    //return;
		    var params = {
		    	voteNm : voteNm,
		    	voteDt : voteDt,
		    	voteHour : voteHour,
		    	voteMin : voteMin,
		    	votePer : votePer,
		    	voteQuestions : questions,
		    	voteOptions : options,
		    	voteId : VOTE_ID,
		    	voteDesc:voteDesc,
		    	imgUrl:imgUrl
		    };
			$.ajax({
				data : params,
				url : "/admin/vote/save.htm",
				success : function(res) {
	
					if (res.success){
						
						alert('<ui:i18n key="保存成功"/>.');
						location.href = '/admin/vote/voteList.htm';
					} else {
						
						alert('<ui:i18n key="请检查信息"/>,'+res.err_msg+'.');
					}
				},
				error : function(obj, e, msg) {
					
					alert('<ui:i18n key="网络出现故障"/>.');
				}
			});
		} else {
			modify();
		}
	}
	
	//save vote
	function modify() {
		
		var voteNm = $('#txtVoteNm').val();
		var voteDt = $('#txtVoteDt').val();
		var	voteHour = $('#selectVoteHour').find('option:selected').val();
		var voteMin = $('#selectVoteMin').find('option:selected').val();
		var votePer = $('input[name="raVotePer"]:checked').val();
		var questions = "";
		var questionCheck = 0;
		var options = "";
		var optionCheck = 0;
		var optionQCheck = 0;
		//alert(voteMin);
		//return;
		if (voteNm == "") {
			
			alert('<ui:i18n key="请输入投票名称"/>.');
			return;
		}
		if (voteDt == "" || voteHour == "" || voteMin == "") {
			
			alert('<ui:i18n key="请完善截止时间"/>.');
			return;
		}
		var imgUrl=$("#imgUrl").val();
		var voteDesc=$("#voteDesc").val();
		if(voteDesc==""){
			alert('<ui:i18n key="请完善描述内容"/>.');
			return;
		}
		if(imgUrl==""){
			alert('<ui:i18n key="请选择图片"/>.');
			return;
		}
	    $('.ui-qBg .ui-qBBg').each(function(idx) {
			
	    	var question = $(this).find('input[name="QUESTIONS"]');
	    	var questionId = $(this).find('input[name="questId"]');
	    	var questionType = $(this).find('input[name="raOnly_'+idx+'"]:checked');
	    	optionQCheck = Number(idx)+1;
	    	//alert(idx);
			if (question.val() == "") {
				
				questionCheck = Number(idx)+1;
				return false;
			} else {
				questions += question.val() + "|,|" + questionType.val() + "|,|" + questionId.val() + "|@|";
			}

			$(this).find('.ui-optionList .ui-optionBg').each(function(idx) {

				var option = $(this).find('input[name="OPTIONS"]');
				var optionId = $(this).find('input[name="optionId"]');
				var optionImg = $(this).find('input[name="OPTIONIMGS"]');
				
				if (option.val() == "") {
					optionCheck = Number(idx)+1;
					return false;
				} else {
					options += option.val() + "|$|" + optionImg.val() + "|$|" + optionId.val() + "|,|";
				}
			});
		    options = options.substring(0, options.length-3);
			if (optionCheck > 0) {
				return false;
			} else {
				options += "|@|";
			}
	    });
	    if (questionCheck > 0) {
	    	
	    	alert('<ui:i18n key="请完善问题"/>'+questionCheck+'<ui:i18n key="的标题"/>.');
	    	return;
	    }
	    if (optionCheck > 0) {
	    	
	    	alert('<ui:i18n key="请完善问题"/>'+optionQCheck+'<ui:i18n key="中的选项"/>'+optionCheck+'<ui:i18n key="的内容"/>.');
	    	return;
	    }
	    questions = questions.substring(0,questions.length-3);
	    options = options.substring(0, options.length-3);
	    //alert(questions);
	    //alert(options);
	    //return;
	    var params = {
	    	voteNm : voteNm,
	    	voteDt : voteDt,
	    	voteHour : voteHour,
	    	voteMin : voteMin,
	    	votePer : votePer,
	    	voteQuestions : questions,
	    	voteOptions : options,
	    	voteId : VOTE_ID,
	    	voteDesc:voteDesc,
	    	imgUrl:imgUrl
	    };
		$.ajax({
			data : params,
			url : '/admin/vote/modify.htm',
			success : function(res) {

				if (res.success){
					
					alert('<ui:i18n key="保存成功"/>.');
					location.href = '/admin/vote/voteList.htm?voteNm='+VOTE_NM+'&voteType='+VOTE_TYPE;
				} else {
					
					alert('<ui:i18n key="请检查信息"/>,'+res.err_msg+'.');
				}
			},
			error : function(obj, e, msg) {
				
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
	
	
</script>
</head>
<body>
	<%-- <jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType" />
	</jsp:include> --%>
	<!-- ▼ Main container -->
	<div class="container">
		<%-- <jsp:include page="/admin/inc/menuleft.jsp">
			<jsp:param value="${topMenuType}" name="topMenuType" />
			<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1" />
			<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2" />
		</jsp:include> --%>
		<div class="ui-right-content">



			<form id="fileupload" method="POST" enctype="multipart/form-data" action="">
				<input id="files" type="file" name="files[]" accept="image/png,image/jpeg" style="display: none;" />
			</form> 
			
			<div class="ui-voteBg">
				<div class="ui-vote">
					<div class="uiNametext cssadd1"><ui:i18n key="投票名称"/><span style="color:#d1102d;">*</span>：</div>
					<div class="uiNameCom">
						<input type="text" id="txtVoteNm" value="" />
					</div>
					<div class="uiTimetext" ><ui:i18n key="截止时间"/><span style="color:#d1102d;">*</span>：</div>
					<div class="uiTimeCom">
						<input type="text" id="txtVoteDt" class="datepicker calendar" value="" />
						<select id="selectVoteHour" class="select2 selectCss" data-placeholder='<ui:i18n key="时"/>'>
							<option value=""></option>
							<option value="00">00</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
						</select>
						<select id="selectVoteMin" class="select2 selectCss" data-placeholder='<ui:i18n key="分"/>'>
							<option value=""></option>
							<option value="00">00</option>
							<option value="05">05</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
							<option value="35">35</option>
							<option value="40">40</option>
							<option value="45">45</option>
							<option value="50">50</option>
							<option value="55">55</option>
						</select>
					</div>
				</div>
				<div class="ui-vote2">
					<div class="uiNametext cssadd2"><ui:i18n key="添加描述"/><span style="color:#d1102d;">*</span>：</div>
					<div class="uiNameCom">
						<input type="text" id="voteDesc" value="" />
					</div>
					<div class="uiPowertext cssadd3"><ui:i18n key="投票权限"/><span style="color:#d1102d;">*</span>：</div>
					<div class="uiPowerCom">
						<label class="radio">
							<input type="radio" value="all_peo" <c:if test="${requestScope.reVoteHeader.VOTE_PER eq 'all_peo'}">checked="checked"</c:if>  class="icradio"  name="raVotePer" ><ui:i18n key="所有人都可参与"/>
						</label>&nbsp;&nbsp; 
						<label class="radio">
							<input type="radio" value="care_me" <c:if test="${requestScope.reVoteHeader.VOTE_PER eq 'care_me'}">checked="checked"</c:if> class="icradio"  name="raVotePer"><ui:i18n key="仅关注我的人可参与"/>
						</label>
					</div>
				</div>
				<div class="ui-vote3">
					<div class="uiNametext"><ui:i18n key="添加图片"/><span style="color:#d1102d;">*</span>：</div>
					<!-- <div class="uiImg" id="preview">
						<i class="icon-plus3"></i>
					</div> -->
					<div class="img-publish-div" id="preview">
						<span><ui:i18n key="添加图片"/></span>
					</div>
					<input type="text" id="imgUrl" value=""/>	
					<input type="file" id="voteImg" accept="image/png,image/jpeg" style="display: none;" />
				</div>
			</div>
			
			<div class="ui-qBg">
				
				<c:choose>
					<c:when test="${empty requestScope.reVoteQlist}">
						<div class="ui-qBBg"  data-id="0">
							<div class="ui-qTBg">
								<div class="ui-qText"><ui:i18n key="问题"/>1</div>
								<!-- <div class="ui-qLine0"></div> -->
							</div>
							<div class="ui-questBg">
								<div class="ui-questTiBg">
									<div class="ui-qTitle"><ui:i18n key="标题"/>：</div>
									<div class="ui-qNm">
										<input type="text" name="QUESTIONS" value="" />
										<input type="hidden" name="questId" value="00000" />
									</div>
									<div class="ui-qOnlyBg">
										<label class="radio">
											<input type="radio" value="Y" name="raOnly_0" class="icradio" checked="checked"><ui:i18n key="单选"/>
										</label>&nbsp;&nbsp; 
										<label class="radio">
											<input type="radio"  class="icradio"  value="N" name="raOnly_0"><ui:i18n key="可多选"/>&nbsp;
										</label>
									</div>
								</div>
								<div class="ui-optionList">
								
									<div class="ui-optionBg">
										<div class="ui-option">
											<div class="ui-oTitle"><ui:i18n key="选项"/>1：</div>
											<div class="ui-oNm">
												<input type="text" name="OPTIONS" value="" />
												<input type="hidden" name="optionId" value="00000" />
											</div>
											<div class="ui-oImgBg">
												<img class="imgAdd" src="/admin/images/icon/btn_add.png" data-id="0_0" onclick="picUpload(this);" />
											</div>
										</div>
										<div class="ui-upLoad" id="picFile_0_0">
											<img src="" />
											<input type="hidden" name="OPTIONIMGS" value="00000" />
											<span onclick="picDelete(this);"><ui:i18n key="删除"/></span> 
										</div>
									</div>
									<div class="ui-optionBg">
										<div class="ui-option">
											<div class="ui-oTitle"><ui:i18n key="选项"/>2：</div>
											<div class="ui-oNm">
												<input type="text" name="OPTIONS" value="" />
												<input type="hidden" name="optionId" value="00000" />
											</div>
											<div class="ui-oImgBg">
												<img class="imgAdd" src="/admin/images/icon/btn_add.png" data-id="0_1" onclick="picUpload(this);" />
											</div>
										</div>
										<div class="ui-upLoad" id="picFile_0_1">
											<img src="" />
											<input type="hidden" name="OPTIONIMGS" value="00000" />
											<span onclick="picDelete(this);"><ui:i18n key="删除"/></span> 
										</div>
									</div>
													
								</div>
								<div class="ui-optionAddBg">
									<div class="ui-optionAdd" onclick="optionAdd(this);">
										<img src="/admin/images/icon/icon-plus2.png" />
										<span><ui:i18n key="添加选项"/></span>
									</div>
								</div>
								<div class="ui-Show" onclick="hide(this);">
									<img src="/admin/images/cust/up.png" />&nbsp;&nbsp;&nbsp;
									<span><ui:i18n key="隐藏选项"/></span>
								</div>
								<div class="ui-Hide" onclick="show(this);">
									<img src="/admin/images/cust/btn_detail.png" />&nbsp;&nbsp;&nbsp;
									<span><ui:i18n key="打开选项"/></span>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestScope.reVoteQlist}" var="itemQ" varStatus="statusQ">
							<div class="ui-qBBg"  data-id="${statusQ.index}">
								<div class="ui-qTBg">
									<div class="ui-qText"><ui:i18n key="问题"/>${statusQ.index+1}</div>
									<c:choose>
										<c:when test="${statusQ.index < 1}">
											<!-- <div class="ui-qLine0"></div> -->
										</c:when>
										<c:otherwise>
											<div class="ui-qLine"></div> 
											<div class="ui-qDelete" onclick="questDel(this);">
												<img src="/admin/images/pointMst/main_delete.png" />&nbsp;
												<span><ui:i18n key="删除问题"/></span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="ui-questBg">
									<div class="ui-questTiBg">
										<div class="ui-qTitle"><ui:i18n key="标题"/>：</div>
										<div class="ui-qNm">
											<input type="text" name="QUESTIONS" value="${itemQ.QUEST_NM}" />
											<input type="hidden" name="questId" value="${itemQ.QUEST_ID}" />
										</div>
										<div class="ui-qOnlyBg">
											<c:choose>
												<c:when test="${itemQ.RADIO_ONLY eq 'Y'}">
													<label class="radio">
														<input type="radio" value="Y" name="raOnly_${statusQ.index}"  class="icradio"  checked="checked"><ui:i18n key="单选"/>
													</label>&nbsp;&nbsp; 
													<label class="radio">
														<input type="radio" value="N"  class="icradio"  name="raOnly_${statusQ.index}"><ui:i18n key="可多选"/>&nbsp;
													</label>
												</c:when>
												<c:otherwise>
													<label class="radio">
														<input type="radio" value="Y"  class="icradio"  name="raOnly_${statusQ.index}"><ui:i18n key="单选"/>
													</label>&nbsp;&nbsp; 
													<label class="radio">
														<input type="radio" value="N"  class="icradio"  name="raOnly_${statusQ.index}" checked="checked"><ui:i18n key="可多选"/>&nbsp;
													</label>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="ui-optionList">
									
										<c:forEach items="${itemQ.subList}" var="itemO" varStatus="statusO">
											<div class="ui-optionBg">
												<div class="ui-option">
													<div class="ui-oTitle"><ui:i18n key="选项"/>${statusO.index+1}：</div>
													<div class="ui-oNm">
														<input type="text" name="OPTIONS" value="${itemO.OP_NM}" />
														<input type="hidden" name="optionId" value="${itemO.OP_ID}" />
													</div>
													<div class="ui-oImgBg">
														<img class="imgAdd" src="/admin/images/icon/btn_add.png" data-id="${statusQ.index}_${statusO.index}" onclick="picUpload(this);" />
														<c:if test="${statusO.index >= 2}">
															&nbsp;&nbsp;
															<img class="imgDel" src="/admin/images/icon/icon-minus2.png" onclick="optionDel(this);" />
														</c:if>
													</div>
												</div>
												<c:choose>
													<c:when test="${itemO.IMG_ID eq '00000'}">
														<div class="ui-upLoad" id="picFile_${statusQ.index}_${statusO.index}">
															<img src="${itemO.IMG_URL}" />
															<input type="hidden" name="OPTIONIMGS" value="${itemO.IMG_ID}" />
															<span onclick="picDelete(this);"><ui:i18n key="删除"/></span> 
														</div>
													</c:when>
													<c:otherwise>
														<div class="ui-upLoad" style="display: block;" id="picFile_${statusQ.index}_${statusO.index}">
															<img src="${itemO.IMG_URL}" />
															<input type="hidden" name="OPTIONIMGS" value="${itemO.IMG_ID}" />
															<span onclick="picDelete(this);"><ui:i18n key="删除"/></span> 
														</div>
													
													</c:otherwise>
												</c:choose>
											</div>
										</c:forEach>
														
									</div>
									<div class="ui-optionAddBg">
										<div class="ui-optionAdd" onclick="optionAdd(this);">
											<img src="/admin/images/icon/icon-plus2.png" />
											<span><ui:i18n key="添加选项"/></span>
										</div>
									</div>
									<div class="ui-Show" onclick="hide(this);">
										<img src="/admin/images/cust/up.png" />&nbsp;&nbsp;&nbsp;
										<span><ui:i18n key="隐藏选项"/></span>
									</div>
									<div class="ui-Hide" onclick="show(this);">
										<img src="/admin/images/cust/btn_detail.png" />&nbsp;&nbsp;&nbsp;
										<span><ui:i18n key="打开选项"/></span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</div>
				
			<div class="ui-questAddBg">
				<div class="ui-questAdd" onclick="questAdd(this);">
					<img src="/admin/images/icon/icon-plus2.png" />
					<span><ui:i18n key="添加问题"/></span>
				</div>
			</div>
			
			<div class="ui-Save">
				<!-- <img src="/admin/images/goodsClass/save.png" onclick="save();" /> -->
				<%-- <div class="submit-div-transport submit-transport" onclick="save();">
					<span><ui:i18n key="保存 "/></span>
				</div> --%>
				<span class="button bg-red js-trans-order-confirm" onclick="save();">
					<span class="button-icon conform"></span>
						<ui:i18n key="保存"/>
				</span>
				<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="popReturn();">
					<span class="button-icon cancel"></span>
						<ui:i18n key="取消"/>
				</span>
			</div>

		</div>
	</div>
	<!-- ▲ Main container -->



	<!-- ▼ Main footer -->
	<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
	<!-- ▲  Main footer -->
</body>
</html>