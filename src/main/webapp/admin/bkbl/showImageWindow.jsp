<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/admin/template/tagsInc.jsp"%>
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiInc.jsp"%>
<title>${label.选择图片 }</title>
 
<style type="text/css">
	body{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	max-width:1000px;
	min-width:900px;
	}
	#fileNm{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
  .btnArea {
	position: relative;
	padding-top: 10px;
	padding-bottom: 10px;
	border-top: 1px solid #e7e7eb;
	text-align: center;
}

.btnArea .saveBtn {
	display: inline-block;
	padding-right: 20px;
	padding-left: 20px;
	height: 30px;
	max-width: 50px;
	border: 2px solid #0e9715;
	border-radius: 20px;
	line-height: 30px;
	cursor: pointer;
}

.btnArea .saveBtn + .saveBtn {
	margin-left: 20px;
}

.popupWarp {
	margin-top: 10px;
	margin-right: 9px;
	margin-left: 9px;
	width: 980px;
	border: 1px solid #e7e7eb;
}

.popupWarp .headerArea {
	position: relative;
	border-bottom: 1px solid #e7e7eb;
}

.headerArea .searchArea {
	display: inline-block;
	padding-top: 10px;
}

.searchArea .searchBtn {
	display: inline-block;
	margin-top: 0;
	margin-right: 10px;
	margin-left: 10px;
	padding-right: 8px;
	padding-left: 8px;
	height: 26px;
	border: 2px solid #0e9715;
	border-radius: 8px;
	font-size: 16px;
	line-height: 26px;
	cursor: pointer;
}

.rightLinkArea {
	float: right;
	display: inline-block;
}

.addNewNews {
	display: inline-block;
	margin-top: 10px;
	margin-right: 10px;
	padding-right: 10px;
	padding-left: 10px;
	height: 30px;
	color: #000;
	font-size: 16px;
	line-height: 30px;
}

.addNewNews:hover {
	color: #000;
	text-decoration: underline;
}

.contentWarp {
	border: 1pxsolid red;
}

.contentArea {
	position: relative;
	overflow-x: hidden;
	overflow-y: auto;
	height: 350px;
	border: 1pxsolid red;
}

.appmsgWarp {
	float: left;
	margin-top: 30px;
	margin-left: 40px;
	width: 400px;
	cursor: pointer;
}
</style>

<style type="text/css">

 li {
  display: list-item;
  text-align: -webkit-match-parent;
}

 
  .img_item {
  position: relative;
  float: left;
  text-align: center;
  margin-right: 11px;
  margin-bottom: 10px;
}



.frm_radio_label, .frm_checkbox_label {
  display: inline-block;
  text-align: left;
  cursor: pointer;
  margin-right: 1em;
}
 .img_item_bd {
  margin: 0;
  border: 1px solid #e7e7eb;
  width: 160px;
}



.frm_checkbox_label.img_item_bd
.frm_radio_label, .frm_checkbox_label {
  display: inline-block;
  text-align: left;
  cursor: pointer;
  margin-right: 1em;
}

 .img_item .pic {
  width: 160px;
  height: 120px;
}
  .img_item .pic {
  display: block;
  border-bottom: 1px solid #e7e7eb;
}


  .img_item .lbl_content {
  height: 32px;
  line-height: 32px;
  text-align: left;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  display: block;
  width: 140px;
  padding: 0 10px;
}

  .img_item_bd.selected .selected_mask {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}

  .img_item_bd.selected .selected_mask_inner {
  width: 160px;
  height: 160px;
  -moz-opacity: .6;
  -khtml-opacity: .6;
  opacity: .6;
  background-color: #000;
  filter: alpha(opacity=60);
}


 .img_item_bd.selected .selected_mask_icon {
  position: absolute;
  top: 0;
  left: 0;
  background: transparent url(/admin/images/weixin/icon_checked.png) no-repeat 0 0; 
  width: 160px;
  height: 156px;
  vertical-align: middle;
  display: inline-block;
  background-position: 50% 50%;
}
 </style>
 
 <style type="text/css">
	
	.page-navigation {
		text-align: center;
		width: auto;
		height: 30px;
		line-height: 30px;
		margin-top: 8px;
		margin-bottom: 8px;
	}
	
	.page-navigation .page-navi {
		display: inline-block;
		padding: 0 10px;
		vertical-align: middle;
	}
	
	.page-navigation .page-select {
		width: 70px;
		margin: 0 10px;
		text-align: center;
	}
	
	.page-navi .page-icon {
		width: 14px;
		height: 12px;
		display: inline-block;
		cursor: pointer;
		background-image: url("/admin/images/icon/page-navigation.png");
		background-repeat: no-repeat;
	}
	
	.page-icon.page-first {
		background-position: 2px 0px;
	}
	
	.page-icon.page-preview {
		background-position: -25px 0px;
	}
	
	.page-icon.page-next {
		background-position: -12px 0px;
	}
	
	.page-icon.page-last {
		background-position: -41px 0px;
	}
	
	.page-icon.page-first-disabled {
		background-position: 2px -12px;
		cursor: not-allowed;
	}
	
	.page-icon.page-preview-disabled {
		background-position: -25px -12px;
		cursor: not-allowed;
	}
	
	.page-icon.page-next-disabled {
		background-position: -12px -12px;
		cursor: not-allowed;
	}
	
	.page-icon.page-last-disabled {
		background-position: -41px -12px;
		cursor: not-allowed;
	}
	
	.page-navigation .total {
		
	}
	
	.pageing-total-summary{
       	position:absolute; float: right;text-align: right;right: 0; top:0; letter-spacing: 2px;padding-right: 10px;
    }
	
</style>
<c:choose>
	<c:when test="${type eq 1 }">
	 	<script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow('bpopup');
				}
			});
			$('#selectedMsg').click(function(){
				//alert($('.img_item_bd.selected').size());
				//return ;
			
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}
				
				$('.img_item_bd.selected').each(function(idx){
					if(idx == 0){
						var data =  {
								tempId:_.random(1000000000, 9999999999),
								id : $(this).data('id'),
								title: $(this).data('name'),
								attachment_url : $(this).data('url'),
								linkUrl : ''
						}
						
						if(!!window.parent && !!window.parent.settingMainImgae){
							window.parent.settingMainImgae(data);
						}
						return false;
					}
				});
			});
			
			 $('.js_imageitem').click(function(){
				 $('.img_item_bd').removeClass('selected');
				 $(this).find('.img_item_bd').addClass('selected');
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 2 }">
	 	<script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow();
				}
			});
			$('#selectedMsg').click(function(){
				//alert($('.img_item_bd.selected').size());
				//return ;
				
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}
				
				$('.img_item_bd.selected').each(function(idx){
					fileId = $(this).data('id');
					fileUrl = $(this).data('url');
				});
			 
				if(!!window.parent && !!window.parent.selectImgFromAlbum){
					window.parent.selectImgFromAlbum(fileId,fileUrl);
					window.parent.closeWindow();
				}
			});
			
			 $('.js_imageitem').click(function(){
				 $('.img_item_bd').removeClass('selected');
				 $(this).find('.img_item_bd').addClass('selected');
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 3 }">
		 <script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow('bpopup');
				}
			});
			$('#selectedMsg').click(function(){
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}
				
				var array = [];
				
				$('.img_item_bd.selected').each(function(idx){
					var data =  {
							tempId:_.random(1000000000, 9999999999),
							id : $(this).data('id'),
							title: $(this).data('name'),
							attachment_url : $(this).data('url'),
							linkUrl : ''
					}
					array.push(data); 
				});
			 
				 
				if(!!window.parent && !!window.parent.setttingHeaderSliderImages){
					window.parent.setttingHeaderSliderImages(array);
				}
			});
			
			 $('.js_imageitem').click(function(){
				 var $this = $(this);  
				 if($this.find('.img_item_bd').hasClass('selected')){
					 $this.find('.img_item_bd').removeClass('selected');
				 }else{
					 $this.find('.img_item_bd').addClass('selected');
				 }
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 4 }">
		<script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow('bpopup');
				}
			});
			$('#selectedMsg').click(function(){
			
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}
				
				var array = [];
				
				$('.img_item_bd.selected').each(function(idx){
					var data =  {
							tempId:_.random(1000000000, 9999999999),
							id : $(this).data('id'),
							title: $(this).data('name'),
							attachment_url : $(this).data('url'),
							linkUrl : ''
					}
					array.push(data); 
				});
			 
				 
				if(!!window.parent && !!window.parent.setttingType01SliderImages){
					window.parent.setttingType01SliderImages(array);
				}
			});
			
			 $('.js_imageitem').click(function(){
				 var $this = $(this);  
				 if($this.find('.img_item_bd').hasClass('selected')){
					 $this.find('.img_item_bd').removeClass('selected');
				 }else{
					 $this.find('.img_item_bd').addClass('selected');
				 }
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 5 }">
		<script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow('bpopup');
				}
			});
			$('#selectedMsg').click(function(){
				//alert($('.img_item_bd.selected').size());
				//return ;
			
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}
				
				$('.img_item_bd.selected').each(function(idx){
					if(idx == 0){
						var data =  {
								tempId:_.random(1000000000, 9999999999),
								id : $(this).data('id'),
								title: $(this).data('name'),
								attachment_url : $(this).data('url'),
								linkUrl : ''
						}
						
						if(!!window.parent && !!window.parent.setttingTypeOneImage){
							window.parent.setttingTypeOneImage(data);
						}
						return false;
					}
				});
			});
			
			 $('.js_imageitem').click(function(){
				 $('.img_item_bd').removeClass('selected');
				 $(this).find('.img_item_bd').addClass('selected');
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 6 }">
	<script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow('bpopup');
				}
			});
			$('#selectedMsg').click(function(){
			
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}else if($('.img_item_bd.selected').size() > 2){
					alert('${label.只能选择2个图片}!');
					return false;
				}
				
				var array = [];
				
				$('.img_item_bd.selected').each(function(idx){
					var data =  {
							tempId:_.random(1000000000, 9999999999),
							id : $(this).data('id'),
							title: $(this).data('name'),
							attachment_url : $(this).data('url'),
							linkUrl : ''
					}
					array.push(data); 
				});
				 
				if(!!window.parent && !!window.parent.setttingTypeTwoImage){
					window.parent.setttingTypeTwoImage(array);
				}
			});
			
			 $('.js_imageitem').click(function(){
				 var $this = $(this);  
				 if($this.find('.img_item_bd').hasClass('selected')){
					 $this.find('.img_item_bd').removeClass('selected');
				 }else{
					 $this.find('.img_item_bd').addClass('selected');
				 }
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 7 }">
		 <script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow('bpopup');
				}
			});
			$('#selectedMsg').click(function(){
			
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}else if($('.img_item_bd.selected').size() > 3){
					alert('${label.只能选择3个图片}!');
					return false;
				}
				
				var array = [];
				
				$('.img_item_bd.selected').each(function(idx){
					var data =  {
							tempId:_.random(1000000000, 9999999999),
							id : $(this).data('id'),
							title: $(this).data('name'),
							attachment_url : $(this).data('url'),
							linkUrl : ''
					}
					array.push(data); 
				});
				 
				if(!!window.parent && !!window.parent.setttingTypeThreeImage){
					window.parent.setttingTypeThreeImage(array);
				}
			});
			
			 $('.js_imageitem').click(function(){
				 var $this = $(this);  
				 if($this.find('.img_item_bd').hasClass('selected')){
					 $this.find('.img_item_bd').removeClass('selected');
				 }else{
					 $this.find('.img_item_bd').addClass('selected');
				 }
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 8 }">
		<script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow();
				}
			});
			$('#selectedMsg').click(function(){
				//alert($('.img_item_bd.selected').size());
				//return ;
				
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				}
				
				$('.img_item_bd.selected').each(function(idx){
					fileId = $(this).data('id');
					fileUrl = $(this).data('url');
				});
			 
				if(!!window.parent && !!window.parent.selectListImgFromAlbum){
					window.parent.selectListImgFromAlbum(fileId,fileUrl);
					window.parent.closeWindow();
				}
			});
			
			 $('.js_imageitem').click(function(){
				 $('.img_item_bd').removeClass('selected');
				 $(this).find('.img_item_bd').addClass('selected');
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 9 }">
		<script type="text/javascript">
		$(function(){
			$('#closeWindow').click(function(){
				if(!!window.parent && !!window.parent.closeWindow){
					window.parent.closeWindow('bpopup');
				}
			});
			$('#selectedMsg').click(function(){
			
				if($('.img_item_bd.selected').size() == 0){
					alert('${label.没有选中的图片}!');
					return false;
				} 
				
				var array = [];
				
				$('.img_item_bd.selected').each(function(idx){
					var data =  {
							tempId:_.random(1000000000, 9999999999),
							id : $(this).data('id'),
							title: $(this).data('name'),
							attachment_url : $(this).data('url'),
							linkUrl : ''
					}
					array.push(data); 
				});
				 
				if(!!window.parent && !!window.parent.setttingType06Image){
					window.parent.setttingType06Image(array);
				}
			});
			
			 $('.js_imageitem').click(function(){
				 var $this = $(this);  
				 if($this.find('.img_item_bd').hasClass('selected')){
					 $this.find('.img_item_bd').removeClass('selected');
				 }else{
					 $this.find('.img_item_bd').addClass('selected');
				 }
			 });
		});
		</script>
	</c:when>
	<c:when test="${type eq 10 }"></c:when>
	<c:otherwise>
	
	</c:otherwise>
</c:choose>

<script type="text/javascript">
$(function(){
	 $("#fileupload").fileupload({
			url:"/admin/upload",				//文件上传地址，当然也可以直接写在input的data-url属性内
			formData:{fileGroup : ${fileGroup}},//如果需要额外添加参数可以在这里添加
			maxNumberOfFiles:1,
			done:function(e,res){ 
				window.location.href="/admin/weixin/material/showImageWindow.htm?fileGroup=3&type=1"; 
			}
		});
 
		$('.js-new-file-upload').click(function(){
			$('#files').click();
		});
		$('.js-img-reload').click(function(){
			location.reload();
		});
});


function showPage(pageNo, pageSize){
 	$('#pageCurr').val(pageNo); 
 	$('#searchForm').submit();
}
function searchDate(){
	$('#pageCurr').val(1); 
 	$('#fileName').val($('#fileNm').val()); 
 	$('#searchForm').submit();
}
 
</script>
 
</head>
<body>
	<%-- 查询表单域  --%>
	<form id="searchForm" action="/admin/weixin/material/showImageWindow.htm">
		<input type="hidden"  name="pageCurr" id="pageCurr" value="" />
		<input type="hidden"  name="fileName" id="fileName" value="${fileName }" />
		<input type="hidden"  name="fileGroup" id="fileGroup" value="${fileGroup }" />
		<input type="hidden"  name="type" id="type" value="${type }" />
	</form>

	<input type="hidden" id="fileId" value=""  />
	<input type="hidden" id="fileUrl" value="" />
	
	<%-- 上传表单域  --%>
 	<form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
		<input class="hiddenInputFile" style="display: none;" id="files" type="file" multiple name="files[]" accept="image/png,image/jpeg"   >  
	</form>

	<div class="popupWarp" >
		<div  class="headerArea">
			<div class="searchArea" style="">
				 <input type="text" id="fileNm" value="${fileName }" placeholder="${label.标题}" style="margin-left: 10px;" >
				 <span id="search" onclick="searchDate();" class="searchBtn" style="/* cursor: not-allowed; */">${label.查询}</span>
			</div>
			<div class="rightLinkArea" style="">
				 <a class="addNewNews js-new-file-upload"  href="javascript:void(0);" >
				 	${label.上传图片 }
				 </a>
				 <a class="addNewNews js-img-reload"  href="javascript:void(0);" >
				 	${label.重新加载}
				 </a>
				
			</div>
		</div>
		
		<div class="contentWarp">
		
			<div class="contentArea">
			    <!--  -->
			    <ul class="group js_list img_list" style="display:relative; padding-top: 10px; padding-left: 30px;">
					<c:forEach items="${page.data}" var="item" varStatus="subStatus">
						<li class="img_item js_imageitem" data-id="${item.FILE_ID }" data-name="${item.FILE_NM }" data-url="${item.FULL_URL }">
						    <label class="frm_checkbox_label img_item_bd"  data-id="${item.FILE_ID }" data-name="${item.FILE_NM }"  data-url="${item.FULL_URL }">
						        <img src="${item.FULL_URL }" alt="${item.FILE_NM }" class="pic">
						        <span class="lbl_content" title="${item.FILE_NM }" >${item.FILE_NM }</span>
						        <div class="selected_mask">
						            <div class="selected_mask_inner"></div>
						            <div class="selected_mask_icon"></div>
						        </div>
						    </label>
						</li>
					 </c:forEach>
				</ul>
			    <!--  -->
			</div>
			
			<div style="position: relative; ">
				<div class="page-navigation" style="position: relative;" >
		         	<a class="page-navi">
			         	<c:choose>
			         		<c:when test="${page.fisrtPage }">
			         			<span class="page-icon js-page-first page-first-disabled"></span>
			         		</c:when>
			         		<c:otherwise>
			         			<span class="page-icon js-page-first page-first" onclick="showPage(1 , ${page.pageSize });"></span>
			         		</c:otherwise>
			         	</c:choose>
		         	</a>
		         	<a class="page-navi">
		         		<c:choose>
		         		<c:when test="${page.hasPreviousPage }">
		         			<span class="page-icon js-page-preview page-preview" onclick="showPage(${page.pageNo - 1 } , ${page.pageSize });"></span>
		         		</c:when>
		         		<c:otherwise>
		         			<span class="page-icon js-page-preview page-preview-disabled"></span>
		         		</c:otherwise>
		         	</c:choose>
		         		
		         	</a>
		         	<select id="currentPage" onchange="showPage(this.value,${page.pageSize });" class="page-select select2 js-current-page">
		         	   <c:forEach var="idx" begin="1" end="${page.totalPageCount }"  > 
						      <option value="${idx }" <c:if test="${page.pageNo eq idx }">selected="selected"</c:if> >${idx }</option>
						</c:forEach> 
		         	</select>
		         	<a class="page-navi">
		         		<c:choose>
		         		<c:when test="${page.hasNextPage }">
		         			<span class="page-icon js-page-next page-next" onclick="showPage(${page.pageNo + 1 } , ${page.pageSize });"></span>
		         		</c:when>
		         		<c:otherwise>
		         			<span class="page-icon js-page-next page-next-disabled"></span>
		         		</c:otherwise>
		         	</c:choose>
		         	
		         		
		         	</a>
		         	<a class="page-navi">
		         		<c:choose>
		         		<c:when test="${page.lastPage }">
		         			<span class="page-icon js-page-last page-last-disabled"></span>
		         		</c:when>
		         		<c:otherwise>
		         			<span class="page-icon js-page-last page-last" onclick="showPage( ${page.totalPageCount },${page.pageSize });"></span>
		         		</c:otherwise>
		         	</c:choose> 
		         	</a>
		         	<!-- <select id="pageUnit" class="page-select select2 js-page-unit" >
		         		<option value="10">10</option>
		         		<option value="20">20</option>
		         		<option value="30">30</option>
		         		<option value="50">50</option>
		         	</select> 
		         	<span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span>
		         	-->
		         	
		    		<div  class="js-totalSum  pageing-total-summary" style=" ">
		    			 ${label.每页}${page.pageSize }${label.条}, ${label.共}${page.totalCount }${label.条}
		    		</div>
		    	</div>
			</div>
		</div>
		
		
		<div class="btnArea" style="" >
				<span id="selectedMsg" class="saveBtn" style="">${label.确认}</span>
				<span id="closeWindow" class="saveBtn" style="">${label.取消}</span>
			</div>
	</div>
</body>
</html>