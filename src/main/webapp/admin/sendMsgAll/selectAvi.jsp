<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key=""/></title>  
<style type="text/css">
 .container{
	width:830px;
}
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
	margin-right:2%;
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
.title_show_td{
	border-bottom:1px solid #eeeeee;
	text-align: left;
	vertical-align: top;
}
.title_show_td span{
	width:320px;
	display:inline-block;  
	white-space:nowrap; 
	text-overflow:ellipsis; 
	overflow:hidden;
	margin-top:2px;
	position: absolute;
	margin-left:10px;
}
.avi_show{
	width:110px;
	height:60px;
	border:1px solid #eeeeee;
	margin-left:0px;
	display: inline-block;
	text-align: center;
	line-height: 60px;
}
.avi_show video{
	width:110px;
	height:60px;
	z-index:2;
	margin-right:10px;
}
.avi_show img{
	z-index:3;
	position: absolute;
	margin-top:13px;
	margin-left:35px;
	cursor: pointer;
}
.showimg-body-out-div{
	width:100%;
	border-bottom:1px solid #eee;
}
</style> 
 
<script type="text/javascript">
	$(function(){
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
			var radObj = document.getElementsByName('check');
			var length = radObj.length;
			for(var i = 0;i < length;i++){
				if(radObj[i].checked){
					var obj = $(radObj[i]);
					parent.window.closeDiv(obj.data('fileid'),obj.data('filename'),obj.data('fullurl'));
					return;
				}
			}
			alert('<ui:i18n key="请选择视频"/>');
		});
	});
	//分页操作
	function gets_value(){
		//存储分页的页数
		var pageCurr = $('#whole').find('option:selected').val();
		window.location.href = '/admin/sendMsgAll/selectAvi.htm?fileGroup=' + ${fileGroup} + '&pageCurr='+pageCurr;
	}
	//页面的上一页，下一页，第一页，最后一页的操作。
	function pageNext(pageCurr){
		window.location.href = '/admin/sendMsgAll/selectAvi.htm?fileGroup=' + ${fileGroup} + '&pageCurr='+pageCurr;
	}
	//文件名类似查询
	function selectByName(){
		var fileName = $('#fileName').val();
		window.location.href = '/admin/sendMsgAll/selectAvi.htm?fileGroup=' + ${fileGroup} + '&fileName='+fileName;
	}
	//上传文件
	function publishFile(file){
		var picPath = file.value;
		var logoFileName = picPath.substring(picPath.lastIndexOf('\\') + 1, picPath.length);
	    var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
	    if(type != 'mp4'){
	    	 alert('<ui:i18n key="视频格式不正确"/>');
	    	 return;
	    }
	    var fileSize = file.files[0].size;
	    if( fileSize > (10*1024*1024)){
	  		alert('<ui:i18n key="视频太大"/>,<ui:i18n key="请重新选择"/>');
	  		return;
	  	}
		var param = { 
						logoFileName : logoFileName
						,fileType : 3
						,fileGroup : ${fileGroup}
		};
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
	//视频的暂停，播放
	function showVideo(fileId){
		var video = document.getElementById("videoShow"+fileId);
		if(video.paused){
			video.play();
			$("#video_show_img"+fileId).attr("style","visibility: hidden;");
		}else{
			video.pause();
			$("#video_show_img"+fileId).attr("style","visibility: visible;");
		}
	}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="title-out-div">
			<div class="title-left-div">
				<span class="upload-file-img"><ui:i18n key="上传本地视频"/></span>
				<input type="file" id="fileEntity" name="fileEntity" onchange="publishFile(this);" style="display: none;" />
				<span class="refresh-page"><ui:i18n key="刷新"/></span>
			</div>
			<div class="title-right-div">
				<input type="text" value="${requestScope.fileName}" id="fileName" />
				<img alt="" src="/admin/images/sendMsgAll/query.png" onclick="selectByName();"/>
			</div>
		</div>
		<div class="showimg-body-out-div">
			<div class="result-grid" style="width:96%;margin-left:2%;height:340px;">
		      	<div class="js-grid-content">
		      		<table class="result-grid-table">
		      		 	<colgroup>
				      		<col width="130px"  />
	      		 			<col width="60%" />
	      		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th class="chk"></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="创建时间"/></th>
			      		 	</tr>
			      		 </thead>
			      	</table>
		      		<div class="grid-fixed" style="height:288px;">
				      	<table class="result-grid-table fixed">
				      		<colgroup>
					      		<col width="130px"  />
		      		 			<col width="60%" />
		      		 			<col />
				      		</colgroup>
				      		 <tbody  class="result-grid-tbody">
				      		 	<c:forEach items="${list}" var="list" varStatus="status">
				      		 		<tr>
					      		 		<td class="chk" style="text-align: center;"><input class="iccheckbox" type="radio" name="check" value="" data-fileid="${list.FILE_ID }" data-filename="${list.FILE_NM }" data-fullurl="${list.FULL_URL }"></td>
					      		 		<td  class="title_show_td">
											<div class="avi_show">
												<img src="/admin/images/myFile/video_play.png" id="video_show_img${list.FILE_ID }" onclick="showVideo('${list.FILE_ID}');"/>
												<video id="videoShow${list.FILE_ID}" onclick="showVideo(${list.FILE_ID});" >
													<source src="${list.FULL_URL}" type="video/mp4">
													<source src="${list.FULL_URL}" type="video/ogg">
													<source src="${list.FULL_URL}" type="video/webm">
												</video>
											</div>
											<span title="${list.FILE_NM }">${list.FILE_NM }</span>
										</td>
					      		 		<td style="padding-top:13px;vertical-align: top;">${list.CREATED_DT }</td>
					      		 	</tr>
				      		 	</c:forEach>
				      		 </tbody>
				      	</table>
			      	</div>
	      		</div>
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
					<span><ui:i18n key="每页"/>10<ui:i18n key="条"/>，<ui:i18n key="共"/> ${requestScope.pageUnitCount } <ui:i18n key="条"/></span>
				</div>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>