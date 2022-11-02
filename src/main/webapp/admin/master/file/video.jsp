<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/popup/popup-v2.css" />

<script type="text/javascript">

//  console.log('max=${max}');
//  console.log('conformMethod=${conformMethod}');
//  console.log('clsoeMethod=${clsoeMethod}');
//  console.log('fileGroup=${fileGroup}');
//  console.log('fileName=${fileName}');

 $(function(){
	 
	search();
	var num = 0;
	 
	$("#fileupload").fileupload({
		url:"/admin/upload",				//文件上传地址，当然也可以直接写在input的data-url属性内
		formData:{
			fileGroup : ${fileGroup}
			,fileType : 3
		},//如果需要额外添加参数可以在这里添加
		maxNumberOfFiles:1,
		done:function(e,res){ 
//         	console.log('over');
//         	console.log(e);
//         	console.log(res.result[0].message);
        	num = 0;
			$('.js-contents').hideLoading();
        	if (!res.result[0].success) {
        		alert(res.result[0].message);
        		return false;
        	}
			search();
		},  
        progressall: function (e, data) {//设置上传进度事件的回调函数
// 			console.log('start');
	        if (num == 0) {
	        	num = num + 1;
	       	 	$('.js-contents').showLoading();
	        } 
        }
	});

	$('.js-upload-video').click(function(){
		$('#files').click();
	});
	 
	 $('.js-reload').click(function(){
		 search();
	 });
 })
</script>

<script type="text/javascript">
function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
 
	var fileName = $('#fileName').val();
	var fileGroup = $('#fileGroup').val();
	var max = $('#max').val();
	var conformMethod = $('#conformMethod').val();
	var clsoeMethod = $('#clsoeMethod').val();
	
	var params = {
			fileName : fileName
			,fileGroup : fileGroup
			,max : max
			,conformMethod : conformMethod
			,clsoeMethod : clsoeMethod
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/master/file/videoFragment.htm';
	 var $this = $('.js-contents');	
// 	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		
	 	$('.js-video-item').click(function(){
			var $this = $(this); 
			<c:if test="${max eq 1}">
				$('.js-video-item').not($this).removeClass('selected');
			</c:if>
			if($this.hasClass('selected')){
				$this.removeClass('selected');
			}else{
				$this.addClass('selected');
			}
		}); 
		
		$('.js-conform').click(function(){
			console.log('---------------');
			
			if(!!window.parent){
				var conformMethod = eval('window.parent.${conformMethod}');
				console.log(conformMethod);
				if(!!conformMethod){
					var max = ${max};
					var videos = [];
					$('.js-video-item.selected').each(function(){
						videos.push({
							fileId : $(this).data('fileId')
							,fileNm : $(this).data('fileNm')
							,fileUrl : $(this).data('fileUrl')
						});
					});
					
					if(videos.length == 0){
						alert('<ui:i18n key="没有选中的视频文件"/>!');
						return false;
					}
					
					if(max > 0){//max=0 无限制张数
						if(videos.length > max){
							alert('<ui:i18n key="最多只能选择{0}视频文件"  params1="${max}"/>!');
							return false;
						}
					}
					 
					console.log('videos=');
					console.log(videos);
					conformMethod(videos);
					 
				}
			}
			 
			/* 
			if(!!window.parent && !!window.parent.settingMainImgae){
				window.parent.settingMainImgae(data);
			}
			 */
			
		}); 
		$('.js-cancel').click(function(){
			if(!!window.parent){
				var clsoeMethod = eval('window.parent.${clsoeMethod}');
				console.log(clsoeMethod);
				if(!!clsoeMethod){
					clsoeMethod(1111111111);
				}
			}
		}); 
		
		 $this.hideLoading();
	 });
	 
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="popup-container"> 
		<form id="searchForm" action="">
			<input type="hidden"  name="pageCurr" id="pageCurr" value="" />
			<input type="hidden"  name="fileGroup" id="fileGroup" value="${fileGroup }" />
			<input type="hidden"  name="max" id="max" value="${max }" />
			<input type="hidden"  name="conformMethod" id="conformMethod" value="${conformMethod }" />
			<input type="hidden"  name="clsoeMethod" id="clsoeMethod" value="${clsoeMethod }" />
		</form>
		<%-- 上传表单域  --%>
	 	<form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
			<input class="hiddenInputFile" style="display: none;" id="files" type="file" multiple name="files[]" accept="video/vnd.rn-realvideo, audio/x-ms-wma,video/x-msvideo,video/mpeg,video/mp4"   >  
		</form>
		
		<div class="popup-top-area clearfix">
			<div class="popup-toolbar">
				 <div class="popup-tool js-upload-video" style="">
				 	<img alt="" src="/admin/images/v2-icons/icon_upload.png" />
				   <span class="tool-name"><ui:i18n key="上传本地视频"/></span>
				 </div>
				 <div class="popup-tool js-reload">
				 	<img alt="" src="/admin/images/v2-icons/icon_refresh.png" />
				 	<span  class="tool-name"><ui:i18n key="刷新"/></span>
				 </div>
				 <div class="popup-tool">
				 	<span class="tool-word"><ui:i18n key="视频文件需小于10M"/></span>
				 </div>
			</div>		 
		
			<div class="popup-search-warp">
				<input type="text"  class="popup-search-input w18" id="fileName" value="${requestScope.fileName}"/>
				<img alt="" src="/admin/images/sendMsgAll/query.png" onclick="search();"/>
			</div>
			
		</div>	
	 
		<div class="js-contents">
	  	</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>