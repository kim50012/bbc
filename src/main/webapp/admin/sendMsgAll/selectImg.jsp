<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key=""/></title>  
<style type="text/css">
 
.title-out-div{
	width:100%;
	position: relative;	
	height:50px;
	line-height:50px;
	font-size:12px;
	color:#5f5f5f;
}
.title-out-div .title-left-div{
	float:left;
	margin-left:20px;
}
.title-out-div .title-left-div .upload-file-img{
	padding-left:25px;
	background-image: url("/admin/images/sendMsgAll/icon_upload.png");
	background-position: 0 2px;
	background-repeat: no-repeat;
	cursor: pointer;
}
.title-out-div .title-left-div .refresh-page{
	padding-left:25px;
	background-image: url("/admin/images/sendMsgAll/icon_refresh.png");
	background-position: 0 2px;
	background-repeat: no-repeat;
	margin-left:20px;
	cursor: pointer;
}
.title-out-div .title-right-div{
	float:right;
	margin-right:40px;
	position: relative;
}
.title-out-div .title-right-div input{
	width:142px;
	padding-right:30px;
	margin-bottom:3px;
	height:20px;
}
.title-out-div .title-right-div img{
	position: absolute;
	right:10px;
	top:17px;
	cursor: pointer;
}
.showimg-body-out-div{
	width:100%;
	border-bottom:1px solid #eee;
	border-top:1px solid #eee;
}
.showimg-body-out-div .showimg-body-div{
	width:98%;
	margin-left:1%;
	height:380px;
	overflow-x:hidden; 
	position: relative;
}
.showimg-body-out-div .showimg-body-div .img-one-div{
	float:left;
	margin-left:10px;
	margin-right:11px;
	margin-top:15px;
	width:140px;
	height:130px;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show{
	width:140px;
	height:108px;
	border:1px solid #eee; 
	position: relative;
	cursor: pointer;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show img:first-child{
	width:100%;
	height:100%;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show .selected-img-top{
	position: absolute;
	z-index:30;
	display:none;
	top:43px;
	left:53px;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show .img-select{
	width:100%;
	height:100%;
	position: absolute;
	top:0;
	left:0;
	background-position: 54px 43px;
	/* background-image: url("/admin/images/sendMsgAll/icon_choice.png"); */
	background-repeat: no-repeat;
	background-color: #000;
	opacity:0.4;
	display:none;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show .img-select.selected{
	display: inline-block;
	cursor: pointer;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-name{
	width:100%;
	word-break:break-word;
	text-overflow: -o-ellipsis-lastline; 
	overflow: hidden; 
	text-overflow: ellipsis; 
	display: -webkit-box; 
	-webkit-line-clamp: 1; 
	-webkit-box-orient: vertical;
	font-size:12px;
	color:#a2a2a2;
	text-align: center;
	vertical-align: bottom;
	margin-top:3px;
}
.bottom-div-pageNum{
	height:68px;
	line-height:68px;
	position: relative;
}
.bottom-div-pageNum .page-select{
	float:right;
	width:450px;
}
.bottom-div-pageNum .page-select img{
	cursor: pointer;
}
.bottom-div-pageNum .page-select .select2{
	width:100px;
	margin-left:20px;
	margin-right:20px;
	
}
.bottom-div-pageNum .page-select .pageShowNum{
	display: inline-block;
	font-size:12px;
	color:#5f5f5f;
	margin-left:30px;
}
.bottom-div-pageNum  .submit-div{
	width:70px;
	height:30px;
	background-color: #fb6e52;
	color:#fff;
	font-size:12px;
	float:left;
	text-align: center;
	line-height:30px;
	display: inline-block;
	margin-top:19px;
	border-radius:2px;
	cursor: pointer;
}
.bottom-div-pageNum  .submit-div.confirm{
	margin-left:40px;
	margin-right:20px;
}
.container{
	width:830px;
}
</style> 
 
<script type="text/javascript">
	$(function(){
		//选择图片
		$('.image-show').click(function(){
			$($('.img-select.selected').parent().find('.selected-img-top')).hide();
			$('.img-select.selected').removeClass('selected');
			var obj = $(this).parent().find('.img-select');
			var obj2 = $(this).parent().find('.selected-img-top');
			$(obj).addClass('selected');
			$(obj2).show();
			$(".img-select.selected,.selected-img-top").click(function(){
				$($(this).parent().find('.img-select')).removeClass('selected');
				event=event||window.event;    
			    event.stopPropagation();
			    $($(this).parent().find('.selected-img-top')).hide();
			});
		});
		//上传图片
		$('.upload-file-img').click(function(){
			$('#fileEntity').trigger("click");
		});
		//刷新图片列表
		$('.refresh-page').click(function(){
			window.location.reload();
		});
		
		//关闭页面
		$('.submit-div.cancel').click(function(){
			parent.window.closebpoupMe();
		});
		//确认选择了的图片，并返回到主页面
		$('.submit-div.confirm').click(function(){
			var obj=$('.img-select.selected');
			if(typeof(obj.data('fileid')) == 'undefined'){
				alert('<ui:i18n key="请选择图片"/>');
				return;
			}
			parent.window.closeDiv(obj.data('fileid'),obj.data('filename'),obj.data('fullurl'));
		});
	});
	//分页操作
	function gets_value(){
		//存储分页的页数
		var pageCurr = $('#whole').find('option:selected').val();
		window.location.href = '/admin/sendMsgAll/selectImg.htm?fileGroup=' + ${fileGroup} + '&pageCurr='+pageCurr;
	}
	//页面的上一页，下一页，第一页，最后一页的操作。
	function pageNext(pageCurr){
		window.location.href = '/admin/sendMsgAll/selectImg.htm?fileGroup=' + ${fileGroup} + '&pageCurr='+pageCurr;
	}
	//文件名类似查询
	function selectByName(){
		var fileName = $('#fileName').val();
		window.location.href = '/admin/sendMsgAll/selectImg.htm?fileGroup=' + ${fileGroup} + '&fileName='+fileName;
	}
	//上传文件
	function publishFile(file){
		var picPath = file.value;
		var logoFileName = picPath.substring(picPath.lastIndexOf('\\') + 1, picPath.length);
	    var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
	    if(type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png'){
	    	 alert('<ui:i18n key="图片格式不正确"/>');
	    	 return;
	    }
		var param = { 
						logoFileName : logoFileName
						,fileType : 1
						,fileGroup : ${fileGroup}
		};
		var fileSize = file.files[0].size;
	    if( fileSize > (1*1024*1024)){
	  		alert('<ui:i18n key="图片太大"/>,<ui:i18n key="大小限制1M以内容"/>');
	  		return;
	  	}
	    $('.container').showLoading();
		$.ajaxFileUpload({
			data: param,
			url : '/admin/master/file/uploadFile.htm',   
			secureuri : false,
			fileElementId :'fileEntity',
			dataType : 'json',
			type:'post',
			success : function (data){
				$('.container').hideLoading(); 
				if(data.fileId != ''){
			        alert(data.resultLogoImg);
			    	window.location.reload();
				}else{
					alert(data.resultLogoImg);
				}
			},
			error: function (data, e){
				$('.container').hideLoading(); 
				alert(e );
			}
		});	
	}
	
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="title-out-div">
			<div class="title-left-div">
				<span class="upload-file-img"><ui:i18n key="上传本地图片"/></span>
				<input type="file" id="fileEntity" name="fileEntity" onchange="publishFile(this);" style="display: none;" />
				<span class="refresh-page"><ui:i18n key="刷新"/></span>
			</div>
			<div class="title-right-div">
				<input type="text" value="${requestScope.fileName}" id="fileName" />
				<img alt="" src="/admin/images/sendMsgAll/query.png" onclick="selectByName();"/>
			</div>
		</div>
		<div class="showimg-body-out-div">
			<div class="showimg-body-div">
				<c:forEach items="${list}" var="list" varStatus="status">
					<div class="img-one-div">
						<div class="image-show" >
							<img src="${list.FULL_URL }"/>
							<div class="img-select" data-fileid="${list.FILE_ID }" data-filename="${list.FILE_NM }" data-fullurl="${list.FULL_URL }"></div>
							<img src="/admin/images/sendMsgAll/icon_choice.png" class="selected-img-top"/>
						</div>
						<span class="image-name" title="${list.FILE_NM }">
							${list.FILE_NM }
						</span>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="bottom-div-pageNum">
			<div class="submit-div confirm">
				<ui:i18n key="确认"/>	
			</div>
			<div class="submit-div cancel">
				<ui:i18n key="取消"/>
			</div>
			<div class="page-select">
				<c:choose>
					<c:when test="${requestScope.pageCurr==1}">
						<img src="/admin/images/goodsSell/page_firstno.png"
							style="margin-right: 20px;" />
						<img src="/admin/images/goodsSell/page_headno.png" />
					</c:when>
					<c:otherwise>
						<img src="/admin/images/goodsSell/page_first.png"
							onclick="pageNext('1');"
							style="margin-right: 20px;" />
						<img src="/admin/images/goodsSell/page_front.png"
							onclick="pageNext(${requestScope.pageCurr-1});" />
					</c:otherwise>
				</c:choose> 
				<select class="select2" id="whole" onchange="gets_value();">
					<c:forEach var='i' begin="1" end="${requestScope.pageCount }" varStatus="status">
						<c:if test="${status.index==requestScope.pageCurr }">
							<option value="${status.index}" selected="selected">${status.index}</option>
						</c:if>
						<c:if test="${status.index!=requestScope.pageCurr }">
							<option value="${status.index}">${status.index}</option>
						</c:if>
					</c:forEach>
					<c:if test="${requestScope.pageCount==0 }">
			    		<option  selected="selected">1</option>
			    	</c:if>
				</select> 
				<c:choose>
					<c:when test="${requestScope.pageCurr==requestScope.pageCount or requestScope.pageCount==0}">
						<img src="/admin/images/goodsSell/page_nextno.png" "/>
						<img src="/admin/images/goodsSell/page_endno.png" style="margin-left: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/admin/images/goodsSell/page_next.png"  onclick="pageNext(${requestScope.pageCurr+1});" />
						<img src="/admin/images/goodsSell/page_last.png"  style="margin-left: 20px;" onclick="pageNext(${requestScope.pageCount});" />
					</c:otherwise>
				</c:choose> 
				<div class="pageShowNum">
					<span><ui:i18n key="每页"/>50<ui:i18n key="条"/>，<ui:i18n key="共"/> ${requestScope.pageUnitCount } <ui:i18n key="条"/></span>
				</div>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
	
</body>
</html>