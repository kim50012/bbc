<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/admin/template/tagsInc.jsp" %> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" />  
<jsp:include page="/admin/js/goods/blog-editor-v2.jsp" />

<style type="text/css">

.status-bar-title td{width:50%;}
.status-bar {
  background-image: url(/admin/images/goods/display_step2.png);
}

</style>
 
 
<script type="text/javascript">
$(function(){
	
	$('.sliderImg').each(function(){
		imgSlider($(this));
	});

	//在上架修改页面-第1个Tab页面点击下一步
	$('.js-to-step2').click(function(){
		// <//%--
		 
		if($('#blogTitle').val().trim() == ''){
		  alert('<ui:i18n key="请输入日志标题"/>!');
		  $('#blogTitle').focus();
		  return ;
		};
		if($('#blogDetail').val().trim() == ''){
		  alert('<ui:i18n key="请输入日志内容"/>!');
		  $('#blogDetail').focus();
		  return ;
		};
		if($('#blogGroup').val()  == ''){
		  alert('<ui:i18n key="请选择日志分类"/>!');
		  $('#blogGroup').focus();
		  return ;
		};
	    
		 if($('.js-mian-img-warp .form-pic').size() == 0){
			 alert('<ui:i18n key="请选择主图片"/>!');
			  return ;
		 }  
	   //--%>
		
	 	$('.js-status-bar').removeClass('goods-step-1').addClass('goods-step-2');
		$('.js-contents-step').hide();
		$('.js-contents-step2').show();
		$('body,html').animate({scrollTop:0},100); 
		
	});
	
	//在上架修改页面-第二个Tab页面点击上一步
	$('.js-preview-setp1').click(function(){
	 	$('.js-status-bar').removeClass('goods-step-2').addClass('goods-step-1');
		$('.js-contents-step').hide();
		$('.js-contents-step1').show();
		$('body,html').animate({scrollTop:0},100); 
	});
	
	
	$('.js-main-img-add').click(function(){
		showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="选择图片"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/picture.htm?fileGroup=3&max=1' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																		// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																		// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																		// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
		});	
	});	
	
	
	$('#openBlogClassifyManager').click(function(){
		openDiv();
	});
});

//弹出窗口
function choosePicture(obj){
	 //console.log('-------parent');
	 obj = obj || [];
	 if(obj.length > 0){
		 var img  = obj[0];
	 	 //console.log(img);
	 	 
	 	var hh = (_.template($('#tpl_main_img').html())(img));
	 	
	 	 //console.log(hh);
	 	
	 	$('.js-mian-img-warp .form-pic').remove();
	 	$('.js-mian-img-warp').prepend(hh);
	 }
	 
	 closeWindow();
	}
//关闭窗口	
function closeWindow(){
	 closeBpopupWindow('bpopupPicture');
}
 
 
function reloadMethod(bgName){
	$.ajax({
		url : '/admin/blog/getBlogManage.htm',
		success : function(data) {
			var list=data.list;
			if (list.length>0) {
				var blogGroup = $('#blogGroup').find('option:selected').val();
				$('#blogGroup').children().remove();
				var htm="<option value=''></option>";
				for(var i=0;i<list.length;i++){
					if(list[i].BG_NM==bgName && bgName!=""){
						blogGroup=list[i].BG_ID;
					}
					htm+="<option value='"+list[i].BG_ID+"'>"+list[i].BG_NM+"</option>";
				}
				$('#blogGroup').append(htm);
				$("#blogGroup").select2("val",blogGroup);	
			} else {
				window.location.reload();
			}
		},
		error : function(xhr, status, e) {
			alert("error: " + status);
		}
	});
}
</script>

 <script type="text/javascript">
 function delMainPic(obj){
   $(obj).closest('.form-pic').remove() ;
 }
 </script>
 
 
 <script type="text/javascript">
$(function(){
	$('.js-btn-save').click(function(){
		console.log('js-btn-upload');
		var mainImgId = '';
		 $('.js-mian-img-warp .form-pic').each(function(){
			 mainImgId = $(this).data('fileId');
		 });
		 if(mainImgId == ''){
			 alert('<ui:i18n key="请选择商品主图片"/>!');
			 isPublishing = false;
	  	       return false;
		 }
		 
	 	var pp ={};
		pp.blogId = $('#blogId').val();
  	 	pp.pageId = $('#pageId').val();
		pp.blogTitle = $('#blogTitle').val();
		pp.blogDetail = $('#blogDetail').val();
		pp.blogGroup = $('#blogGroup').val();
		pp.mainImgId = mainImgId;
		
		var params = [];
	    $('.js-fields-region .app-field').each(function(idx){
	    	var $item = $(this);
	    	var type =  $item.data('field-type');
	    	if(type == 'type-01'){
	    	   	params.push({
	    	   		type : type,							    			    	   		
	    			item : $item.data('fieldItem') || [] 
	    	   	});
	   		}else if(type == 'type-05'){ 
	    	   	params.push({
    			   type : type,							    			    	   		
    			   goodsGroup : $item.data('goodsGroup') || '',							    			    	   		
    			   goodsSize : $item.data('goodsSize') || '',							    			    	   		
    			   goodsNumberType :$item.data('goodsNumberType') || 0				    			    	   		
    	   		});
	   		}else if(type == 'type-12'){ 
	    	   	params.push({
	    	   		type : type,							    			    	   		
	    			item : $item.data('fieldItem') || [] 
	    	   	});
	    	}else if(type == 'type-13'){ 
	    	   	params.push({
	    			type : type,							    			    	   		
    			   	item : $item.data('fieldItem') || [] ,
    			   	leftWidth: $item.data('fieldLeftWidth') || 50
	    	   	});
	   		}else if(type == 'type-18'){ 
	    	   	params.push({
    			   type : type,							    			    	   		
    			   item : $item.data('fieldItem') || [] 
	    	   	});
	    	}else if(type == 'type-20'){ 
    	   		params.push({
    			   type : type,							    			    	   		
    			   linkNm : $item.data('linkNm') || '',							    			    	   		
    			   linkUrl : $item.data('linkUrl') || '',							    			    	   		
    			   linkType : $item.data('linkType') || 1						    			    	   		
    	   		});
	    	}else if(type == 'type-52'){ 
    	   		params.push({
    			   type : type,							    			    	   		
    			   goodsSize : $item.data('goodsSize')  || 1,							    			    	   		
    			   item : $item.data('fieldItem') || []
    	   		});
	    	  }else if(type == 'type-99'){ 
	    	  	params.push({
    			   type : type,							    			    	   		
    			   content : $item.find('.js-richtext').html() 							    			    	   		
    	   		});
	    	}
		});
		
	    pp.tpls = params;
    	//console.log('=pp==');
    	//console.log(pp);
       	
		for (var i=0; i<pp.tpls.length; i++) {
    	   
			var type = pp.tpls[i].type;
			
	    	if (type == 'type-99') { 
	    	   	if (pp.tpls[i].content == '') {
	    	   		alert('<ui:i18n key="请输入富文本内容"/>');
	    	   		return false;
	    	   	}
	    	}
       	}
    	
    	$('body').showLoading({'vPos':'200px'   });
    	
    	$.ajax({
			url : '/admin/blog/modifyBlog.htm',
    	    data:{jsonStr: JSON.stringify(pp)},
			success : function(res) {
				$('body').hideLoading();
				if(res.success){
					alert('<ui:i18n key="保存成功"/>');
					//window.top.closeTab();
					window.location.href = '/admin/shopManage/blogControl.htm';
				}else{
					alert('<ui:i18n key="保存失败"/>!\n' + res.err_msg);
				}
			},
			error : function(xhr, status, e) {
				$('body').hideLoading();
				alert("error: " + status);
			}
		});
		
	});	
	
	 
});

function openDiv(){
	$('#iframe_avi_music_image').attr('src','/admin/blog/blogClassifyManager.htm');
	showIframeBpopupWindow({
		id : 'bpoupMessage',
		width : 650,
		height : 450,
		action : $('#iframe_avi_music_image').attr('src')
	});
}
function closebpoupMe(){
	closeBpopupWindow('bpoupMessage');
}
</script>
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
	
		<form action="">
          		<input type="hidden" id="blogId" value="${blogMaster.BLOG_ID }" /> 
          		<input type="hidden" id="pageId" value="${blogMaster.PAGE_ID }" /> 
          	</form>
	
		<div class="status-bar-warp">
			<table class="status-bar-title">
				<tr>
					<td><ui:i18n key="编辑基本信息"/></td>
					<td><ui:i18n key="编辑详情"/></td>
				</tr>
			</table>
			<div class="status-bar goods-step-1 js-status-bar"></div>
		</div>
		
		<div style="background-color: #e3e3e3;width: 100%;height: 1px; margin: 30px 0;">
	  	</div>
	
		<div class="contents-step js-contents-step js-contents-step1 clearfix">
		 	<div class="form-warp clearfix" >
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="日志标题"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="blogTitle" placeholder="<ui:i18n key="请输入日志标题"/>"class="w42"  value="${blogMaster.BLOG_TITLE }">
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="日志内容"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
				  		<textarea id="blogDetail" cols="100" class="w42" style="height: 60px; text-align: left;resize: none;">${blogMaster.BLOG_DETAIL }</textarea>
	  			 	 </div>
	  			 </div>
	  			    
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		 <ui:i18n key="日志分类"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
						 <select id="blogGroup" data-placeholder="${label.请选择}" class="select2 sw42">
							<option value=""></option>
							<c:forEach items="${requestScope.blogGroupList}" var="items" varStatus="status">
								<option value="${items.BG_ID}"   <c:if test="${blogMaster.BLOG_GROUP_ID eq items.BG_ID }"> selected="selected" </c:if>>${items.BG_NM}</option>
							</c:forEach>
						</select>
						 
					<!-- 	 <img class="addicon" id="blogGroupAdd" style="" src="/admin/images/icon/icon-plus2.png"  > -->
						<img  id="openBlogClassifyManager" src="/admin/images/icon/list.png" style="cursor: pointer; margin-left: 5px;"/>
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="control-warp "  >
	  			 	 <div class="form-label" style="vertical-align: top;" >
	  			 	 	<ui:i18n key="主图片"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<div class="js-mian-img-warp clearfix" >
	  			 	 		<div class="form-pic" data-file-id="${blogMaster.BLOG_FILE_ID }" >
								<img alt="${blogMaster.BLOG_TITLE }" src="${blogMaster.BLOG_FILE_URL }">
								<div class="pic-del-mask">
									<div class="pic-del" onclick="delMainPic(this);"></div>
								</div>
							</div>
		  			 	 	<div class="pic-add js-main-img-add">
								<span><ui:i18n key="添加图片"/></span>
							</div>
							<div class="pic-tip">
								<ui:i18n key="图片推荐尺寸"/> ：(320px * 320px)
							</div>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
  			 </div>
		    
		    <div style="text-align: center; margin-top: 20px;">
			 	 <span class="button js-to-step2" style="padding-right: 6px;" onclick="">
       		   	  	<span class="button-icon arrow-right" style="float: right;"></span>
       		   	  	<span class="button-name" style="float: right;"><ui:i18n key="下一步"/></span> 
       		   	</span>
			 </div> 
			 
		</div>
		
		
		<div class="contents-step js-contents-step js-contents-step2 clearfix"  style="display: none;">
		 	<div id="app-region" class="app-region-container" >
				<div class="app-design clearfix">
					<div class="app-preview">
					 	<div class="app-header"></div>
			   			<div class="app-entry">
			   				<div class="app-config">
				        	 	<div id="app-field-header" class="app-field" style="cursor: default; display: none;" >
			            		</div>
			   				</div>
			   				
			   				<div class="app-fields js-fields-region">
			        			<div class="app-fields ui-sortable">
			        			<!-- edding area -->
			        			<c:set var="pageItems" value="${pageHeader.items }"></c:set>
			        			 <c:forEach items="${pageHeader.items }" var="items" varStatus="status">
								 		<c:choose>
								 			<c:when test='${items.tmplNo eq "01"}'>
										 		<div class="app-field clearfix ui-sortable-handle" data-field-type="type-01" data-field-item='${items.showJson}'>
													<div class="control-group"> 
													
														<c:choose>
								                			<c:when test="${empty items.details}">
								                				 <div class="type01"> 
																	<ul>
																		<li class="left js-img-left">
																			<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image5.png"  /></span>
																		</li>
																	</ul>
																</div>  
															    	<div class="sliderImg" style="display:none;">
																		<ul>
																		</ul>
																	</div>
								                			</c:when>
								                			<c:otherwise>
								                				 <div class="type01" style="display:none;"> 
																	<ul>
																		<li class="left js-img-left">
																			<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image5.png"  /></span>
																		</li>
																	</ul>
																</div>  
															    	<div class="sliderImg" >
																		<ul>
																			<c:forEach items="${items.details }" var="details" >
																				<li><a href="javascript:void(0);"><img src="${details.val01 }" alt="${details.val02 }" /></a></li>
																			</c:forEach>
																		</ul>
																	</div>
								                			 
								                				
								                			</c:otherwise>
								                		</c:choose>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit" >${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "05"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-05"  
								 					data-id="${status.index }"
								 					data-goods-group="${items.details[0].val01}"
								 					data-goods-number-type="${items.details[0].val03}" 
								 					data-goods-size="${items.details[0].val02}" 
								 					>
													<div class="control-group">
														<ul class="sc-goods-list clearfix size-1 card pic">
															<!-- 小图  -->
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
															<li class="goods-card small-pic card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
																	</div>
																	
																</a>
															</li>
														</ul>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span> 
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "12"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-12" data-field-item='${items.showJson}'>
													<div class="control-group">
														<div class="type12"> 
															<ul>
																<li>
																	<span class="good-img-block"><img class="dispaly-img" src="${items.details[0].val01}"></span>
																</li>
															</ul>
														</div>  
														<div class="component-border"></div>
													</div>
													<div class="actions" style="text-align:center;">
														  <div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div> 
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "13"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-13"  
								 						data-field-item='${items.showJson}' 
								 						data-left-width="${items.details[0].val04}"  
								 						data-img-left-name=""  
								 						data-img-right-name="">
													<div class="control-group">
														<div class="type13"> 
															<ul>
																<li class="left js-img-left" style="width: ${items.details[0].val04}%;">
																	<span class="good-img-block"><img class="dispaly-img" src="${items.details[0].val01}"></span>
																</li>
																<li class="right js-img-right" style="width: ${items.details[1].val04}%;">
																	<span class="good-img-block"><img class="dispaly-img" src="${items.details[1].val01}"></span>
																</li>
															</ul>
														</div>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "18"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-18" data-field-item='${items.showJson}' >
													<div class="control-group">
														<div class="type18"> 
															<ul>
																<li class="left">
																	<img class="dispaly-img" src="${items.details[0].val01}">
																</li>
																<li class="left">
																	<img class="dispaly-img" src="${items.details[1].val01}">
																</li>
																<li class="left">
																	<img class="dispaly-img" src="${items.details[2].val01}">
																</li>
															</ul>
														</div>
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:when test='${items.tmplNo eq "20"}'>
								 				<div class="app-field clearfixui-sortable-handle" data-field-type="type-20"
								 					 data-field-id="1" 
													 data-link-nm="${items.details[0].val01}" 
													 data-ink-type="${items.details[0].val02}"
													 data-link-url="${items.details[0].val03}" 
								 				>
													<div class="control-group">
														<div class="type19"> 
															<div class="type19-title js-type19-title">${items.details[0].val01}</div>
															<div class="type19-disc">
																<h3 class="type19-icon type-icon-1">+</h3>
															</div>
														</div> 
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			
								 			 
								 			<c:when test='${items.tmplNo eq "52"}'>
								 			
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-52"  
								 					data-field-item='${items.showJson}'
								 					data-goods-size="${items.details[0].val01}" 
								 					>
													<div class="control-group">
								 					<c:set value="${items.details[0].val01}" var="size52"></c:set>
								 					
								 					<c:choose>
								 						<c:when test="${size52 eq 0 }">
								 						  <ul class="sc-goods-list clearfix size-${size52} card pic">
								 							<c:set value="${3 - fn:length(items.details)}" var="diff"></c:set>
								 							<c:forEach items="${items.details }" var="details" > 
																 <!-- 大图  -->
																<li class="goods-card big-pic card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="${details.val04}" style="width:100%; height:auto;">
																		</div>
																	</a>
																</li>
																
															</c:forEach>
															<c:if test="${diff gt 0}">
															<c:forEach begin="1" end="${diff }" var="item" > 
																  <!-- 大图  -->
																<li class="goods-card big-pic card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
																		</div>
																	</a>
																</li>
															</c:forEach>
															</c:if>
								 							</ul>
															<div class="component-border"></div>
								 						</c:when>
								 						<c:when test="${size52 eq 1 }">
								 							<ul class="sc-goods-list clearfix size-${size52} card pic">
								 							<c:set value="${4 - fn:length(items.details)}" var="diff"></c:set>
								 							<c:forEach items="${items.details }" var="details" > 
																 <!-- 小图  -->
																<li class="goods-card small-pic card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="${details.val04}" style="width:100%; height:auto;">
																		</div>
																	</a>
																</li>
																
															</c:forEach>
															<c:if test="${diff gt 0}">
															<c:forEach begin="1" end="${diff }" var="item" > 
																  <!-- 小图  -->
																	<li class="goods-card small-pic card ">
																		<a href="javascript: void(0);" class="link js-goods clearfix">
																			<div class="photo-block">
																				<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png" >${diff }
																			</div>
																			
																		</a>
																	</li>
															</c:forEach>
															</c:if>
								 							</ul>
															<div class="component-border"></div>
								 						</c:when>
								 						<c:otherwise>
								 							<ul class="sc-goods-list clearfix size-${size52} card list">
								 							<c:set value="${4 - fn:length(items.details)}" var="diff"></c:set>
								 							<c:forEach items="${items.details }" var="details" > 
																<!-- 详细列表 -->
															<li class="goods-card card ">
																<a href="javascript: void(0);" class="link js-goods clearfix">
																	<div class="photo-block">
																		<img class="goods-photo js-goods-lazy" src="${details.val04}">
																	</div>
																	
																</a>
															</li>
																
															</c:forEach>
															<c:if test="${diff gt 0}">
															<c:forEach begin="1" end="${diff }" var="item" > 
																  <!-- 详细列表 -->
																<li class="goods-card card ">
																	<a href="javascript: void(0);" class="link js-goods clearfix">
																		<div class="photo-block">
																			<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png"> 
																		</div>
																		
																	</a>
																</li>
															</c:forEach>
															</c:if>
								 							</ul>
															<div class="component-border"></div>
								 						</c:otherwise> 
								 					</c:choose>
								 						 
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span> 
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 	 
								 			
								 			
								 			<c:when test='${items.tmplNo == "99"}'>
								 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-99">
													<div class="control-group">
														<div class="type99"> 
															<div class="richtext js-richtext">
																${items.details[0].val01}
															</div>
														</div> 
														<div class="component-border"></div>
													</div>
													<div class="actions">
														<div class="actions-wrap">
															<span class="action edit">${label.编辑}</span>
															<span class="action delete">${label.删除}</span>
														</div>
													</div>
													<div class="sort">
														<i class="sort-handler"></i>
													</div>
												</div>
								 			</c:when>
								 			<c:otherwise>
								 				${items.tmplNo }<br>
								 			</c:otherwise>
								 		</c:choose>
									</c:forEach>
			        			 
			        			<!-- edding area -->
			        			</div>
			        		</div>
			   				
			    		</div>
			    		<div class="app-contorls">
			    			<table style="width: 100%;">
			    				<tr>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-01"><ui:i18n key="图片滚动"/></span></td>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-05"><ui:i18n key="商品列表"/></span></td>
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-20"><ui:i18n key="标题栏"/></span></td>
			    				</tr>
			    				<tr>
			    					<td><span class="js-new-field" data-field-type="type-12">1<ui:i18n key="张图"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-13">2<ui:i18n key="张图"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-18">3<ui:i18n key="张图"/></span></td>
			    				</tr>
			    				<tr>
			    					<td colspan="3"><span class="js-new-field" data-field-type="type-99"><ui:i18n key="富文本"/></span></td>
			    				</tr>
			    			</table>
			    		</div>
			    		<div class="app-footer"></div>
					</div>
				
					<div class="app-sidebar" style="margin-top: -1000px;">
						<div class="arrow"></div>
						<div class="app-sidebar-inner js-sidebar-region">
							<div>
								<form class="form-horizontal js-sidebar-editor" novalidate="">
								</form>
							</div>
						</div>
					</div>
				</div>
		 	</div>
		 
		 	<div style="text-align: center; margin-top: 30px;">
			 	<span class="button js-preview-setp1" style="padding-left: 6px;"  onclick="" >
       		   	  	<span class="button-icon arrow-left" style="float: left;"></span>
       		   	  	<span class="button-name"  style="float: left;"> <ui:i18n key="上一步"/> </span> 
       		   	</span> 
			 	<span class="button js-btn-save" style="margin-left: 20px;">
       		   	  	<span class="button-name"  style="float: left;" > <ui:i18n key="保存"/> </span> 
       		   	</span> 
			 <%-- 	<span class="button js-btn-preview"  style="margin-left: 20px;">
       		   	  	<span class="button-name"  style="float: left;"> <ui:i18n key="预览"/> </span> 
       		   	</span>  --%>
			 </div> 
		</div>
	
	</div>
	<!-- ▲ container  -->
	 <!-- ▼ bpopup area -->
				<div class="bpopup2" id="bpoupMessage" >
				 	<div class="bpopupWarp">
				 		 <div class="bpopupHeaderWarp">
							<h3 class="bpopupTitle js-title"><ui:i18n key="日志分类管理"/></h3>
							<div class="bpopupColseWarp">
								<img class="b-close" src="/admin/images/goodsSell/close.png" />
							</div>
						</div>
				 		 <div class="bpopupContentWarp"> 
				 		 	<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_avi_music_image"  style="overflow: hidden;" src=""></iframe>
				 		 </div>
				 	</div>
				</div>
			<!-- ▲ bpopup area -->
<jsp:include page="/admin/template/blogEditorTemplate-v2.jsp" />
</body>
</html>	