<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%--  <%@ include file="/admin/template/uiInc.jsp"%>  --%>
  <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title>${label.日志管理 }::${label.添加日志}</title>  
 <link rel="stylesheet" type="text/css" href="/admin/css/goods/blog-editor.css" />  
  <!-- <script type="text/javascript" src="/admin/js/goods/blog-editor.js"></script> -->
   <%@ include file="/admin/js/goods/blog-editor.jsp"%>
 <style type="text/css">
 	body{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
 	input,button{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
 	.ui-nav-tab>li {
		width: 50%;
	}
	 .goods-step {
		background-image: url("/admin/images/goods/goods-step2.png");
	}
	
	.goods-step-2 {
		background-position: 0px 0px;
	}
	
	.goods-step-3 {
		background-position: 0px -20px;
	}
 
 </style>
 
<script type="text/javascript">

 

$(function() {

	$('.js-to-step3').click(function(){
		if($('#blogTitle').val().trim() == ''){
		  alert('${label.请输入日志标题}');
		  $('#blogTitle').focus();
		  return ;
		};
		if($('#blogDetail').val().trim() == ''){
		  alert('${label.请输入日志内容}');
		  $('#blogDetail').focus();
		  return ;
		};
		if($('#blogGroup').val()  == ''){
		  alert('${label.请选择日志分类}');
		  $('#blogGroup').focus();
		  return ;
		};
		
		 var item =  $('#blog-main-img-add').data('field-item') || [];
		 if(item.length == 0){
			 alert('${label.请选择商品主图片}');
			  return ;
		 }  
		    
		$('.js-goods-step-img').removeClass('goods-step-1').removeClass('goods-step-2').addClass('goods-step-3');
		$('.goods-content-step').hide();
		$('.js-goods-content-step-3').show();
		$('.app-sidebar').hide();
		$('body,html').animate({scrollTop:0},100); 
		
	});
	
 
	
	$('.js-preview-setp2').click(function(){
		$('.js-goods-step-img').removeClass('goods-step-1').removeClass('goods-step-3').addClass('goods-step-2');
		$('.goods-content-step').hide();
		$('.js-goods-content-step-2').show();
		$('body,html').animate({scrollTop:0},100);  
		
	});
	
	
	$(window).scroll(function () {
		if( ! $('.js-goods-content-step-3').is(':hidden')){
		  $('.js-field-area').animate({top: _.max([$('#step-content-region').offset().top -$(document).scrollTop(),60])  },100); 
		}
	});
	
	
	
	$('#blog-main-img-add').click(function(){
		showBpopupWindow({
			id:'bpopup',
			action: '/admin/weixin/material/showImageWindow.htm?fileGroup=3&type=1'
		});
		/* 
		
	  	$('#modal_blog').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		 }).css({
			 'position':'absolute',
			  'top':'100px',
			  width: '700px',  
				 'margin-left': function () {  
				    return -($(this).width() / 2);  
				   }  
			});   */
	});
	//调用日志管理页面
	$("#openBlogClassifyManager").click(function(){
		var wNum=document.body.clientWidth;
		var lNum=(wNum-800)/2;
		window.open('/admin/blog/blogClassifyManager.htm','newwindow','width=800,height=500,top=100,left='+lNum);
	});
	
	$('#blogGroupAdd').popover({
		placement : 'bottom',
		html : true,
		content: ' <div style="">'
				+ '		<input type="text" class="inval" placeholder="${label.请输入日志分类名}..." style="margin-top:5px;" class="w21">'
				+ '		<span class="btn js-btn-confirm">${label.确认}</span>'
				+ '		<span class="btn js-btn-cancel">${label.取消}</span>'
				+ '</div>'
	});
	
	var blogGroupAddPopover = $('#blogGroupAdd').data('popover');
	
	blogGroupAddPopover.tip().on('click', '.js-btn-confirm', function(evt){
		var $input = $(this).siblings('input');
		 var blogGrupName = $input.val().trim() || '';
		 if(blogGrupName == ''){
			 alert('${label.请输入日志分类名}');
			 return ;
		 }
		 
		 $.ajax({
	   	 		data:{
	   	 			blogGrupName: blogGrupName
	   	 		},
				type : "POST",
				url : "/admin/blog/saveBlogGroup.htm",
				success : function(data) {
					if(data.success){
						alert('${label.添加成功}');
						$('#blogGroup').append('<option value="' + data.OUT_BG_ID + '">' + data.OUT_BG_NM + '</option>');
						$('#blogGroup').select2('val',data.OUT_BG_ID);
						$('#blogGroupAdd').popover('hide');
					}else{
						alert(data.errorMsg);
						$input.val('');
					}
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
			});
		 
	});
	
	blogGroupAddPopover.tip().on('click', '.js-btn-cancel', function(evt){
		 $('#blogGroupAdd').popover('hide');
	 });
}); 

function reloadMethod(bgName){
	$.ajax({
		url : "/admin/blog/getBlogManage.htm",
		type : "POST",
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
 

<link rel="stylesheet" type="text/css" href="/admin/css/test.css" /> 
</head>
<body>
	<%-- <jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType"/> 
	</jsp:include> --%>
	<!-- ▼ Main container --> 
        <div class="container" style="height: 499px">
        	<!-- ▼ Left Menu  --> 
        	<%-- <jsp:include page="/admin/inc/menuleft.jsp">
				<jsp:param value="${topMenuType}" name="topMenuType"/> 
				<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1"/> 
				<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2"/> 
			</jsp:include> --%>
		    <!-- ▲ Left Menu  -->
		    
		    
            <%--  --%>
            <!-- ▼ detali content  --> 
            <div class="ui-right-content" style="min-height: 499px">
            	<form action="">
            		<input type="hidden" id="blogId" value="${blogMaster.BLOG_ID }" /> 
            		<input type="hidden" id="pageId" value="${blogMaster.PAGE_ID }" /> 
            	</form>
            	
            	<form id="previewForm" method="post" target="_preview"  action="/admin/goods/displayPreview.htm">
            		<input type="hidden" id="jsonStr" name="jsonStr" value="" /> 
            	</form>
            
				<div class="goods-step-area" >
			  		 <div class="text-top clearfix">
			  		 	<div>
			  				<ul class="ui-nav-tab">
				  				<li>${label.编辑基本信息} </li>
				  				<li>${label.编辑详情} </li>
			  				</ul>
			  			</div>
			  		</div>
			  		
			  		
			  		<div class="goods-step goods-step-2 js-goods-step-img clearfix"></div>
			  		
			  		<div class="goods-content-step js-goods-content-step-2" style=" ">
			  			<div class="title-area"  >
			  				<div class="title-desc">
			  					<a class="icons-pen" href="javascript:void(0);"></a>
			  					<span>${label.编辑基本信息}</span>
			  				</div>
			  				
			  			</div>
			  		
			  			<div class="form-group clearfix" >
				  			 
			  			 
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.日志标题}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="blogTitle" placeholder="${label.请输入日志标题}..." class="w42" value="${blogMaster.BLOG_TITLE }">
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.日志内容}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<textarea id="blogDetail" cols="100"  class="w42" style="height: 60px; text-align: left;" >${blogMaster.BLOG_DETAIL }</textarea>
				  			 	 </div>
				  			 </div>
			  		
				  			<div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.日志分类}<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="blogGroup" data-placeholder="${label.请选择}" class="select2 sw42"   >
							            <option value=""></option>
							            <c:forEach items="${requestScope.blogGroupList}" var="items" varStatus="status">
											<option value="${items.BG_ID}"   <c:if test="${blogMaster.BLOG_GROUP_ID eq items.BG_ID }"> selected="selected" </c:if>>${items.BG_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 	 
				  			 	 	<img   id="blogGroupAdd" src="/admin/images/icon/icon-plus2.png" title="${label.添加日志分类}"    style="cursor: pointer; margin-left: 10px;"   >
				  			 	 	<img  id="openBlogClassifyManager" src="/admin/images/icon/list.png" style="cursor: pointer; margin-left: 5px;"/>
				  			 	 </div>
				  			 </div>
				  			 
				  			<div class="control-group">
								<div class="form-label"  >
				  			 		<a class="label-prefix"></a>${label.主图片}<a class="label-required"></a> : 
				  			 	 </div>
								<div class="controls">
									<ul class="module-goods-list clearfix js-main-img " > 
										<li class="sort" data-goods-id="1"> 
											<a href="javascript:void(0);" target="_blank">
											<img src="${blogMaster.BLOG_FILE_URL }" alt="${label.商品图}" width="50" height="50"></a>
											<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
										</li>
										<li id="blog-main-img-add"  data-field-item='[${blogMainImg}]'>
											<a href="javascript:void(0);" class="add-goods"><i class="icon-plus3"></i></a>
										</li>
									</ul>
								</div>
							</div>
				  			 
				  			 <div class="control-group">
								<div class="form-label"  >
				  			 		&nbsp; 
				  			 	 </div>
								<div class="controls">
									<span style="color:red;">${label.图片推荐尺寸}：(320px * 320px)</span>
								</div>
							</div>
							
				  		</div>
				  		
				  		<div class="navi-button-area">
				  			<!-- <span class="btn-step js-preview-setp1" ><span>上一步</span></span> -->
				  			<span class="btn-step js-to-step3" ><span>${label.下一步}</span></span>
				  		</div>
			  		</div><!-- end js-goods-content-step-2 -->
			  		 
			  		 <div class="goods-content-step js-goods-content-step-3" style="display: none;">
			  		 <div class="step-sp clearfix"></div>
			  		 		<div class="js-field-area" style="left:0">
								<div class="field-area-header" style="">
									${label.添加内容}
								</div>
								<ul>
						      <!--   <li><a class="js-new-field" data-field-type="rich_text">富文本</a></li> -->
							        <li><a class="js-new-field" data-field-type="type-01">${label.图片滚动}</a></li> 
							     <!--    <li><a class="js-new-field" data-field-type="type-02">02</a></li> 
							        <li><a class="js-new-field" data-field-type="type-03">03</a></li> 
							        <li><a class="js-new-field" data-field-type="type-04">04</a></li> 
							        <li><a class="js-new-field" data-field-type="type-05">05</a></li> 
							        <li><a class="js-new-field" data-field-type="type-06">06</a></li>  -->
							        <li><a class="js-new-field" data-field-type="type-05">${label.商品列表}</a></li> 
							     <!--    <li><a class="js-new-field" data-field-type="type-08">08</a></li> 
							        <li><a class="js-new-field" data-field-type="type-09">09</a></li> 
							        <li><a class="js-new-field" data-field-type="type-10">10</a></li> 
							        <li><a class="js-new-field" data-field-type="type-11">11</a></li>  -->
							        <li><a class="js-new-field" data-field-type="type-12">1${label.张图}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-13">2${label.张图}</a></li> 
							       <!--  <li><a class="js-new-field" data-field-type="type-14">14</a></li> 
							        <li><a class="js-new-field" data-field-type="type-15">15</a></li> 
							        <li><a class="js-new-field" data-field-type="type-16">16</a></li> 
							        <li><a class="js-new-field" data-field-type="type-17">17</a></li>  -->
							        <li><a class="js-new-field" data-field-type="type-18">3${label.张图}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-20">${label.标题栏}</a></li> 
							        <li><a class="js-new-field" data-field-type="type-99">${label.富文本}</a></li> 
								</ul>
							</div>
			  		 	
			  		 		<!-- - -->
			  		 		<div class="app-init-container">
			               		<div id="app-region" class="app__content" >
			                       	<div class="goods-edit-area">
										<!-- --- -->
										<div id="step-content-region">
											<div class="app-design clearfix">
												<div class="app-preview">
										    		<div class="app-header"></div>
										   			 <div class="app-entry">
										        		<div class="app-config">
										            		<div id="app-field-header" class="app-field" style="cursor: default; display:none;" data-field-type="header" data-field-item2='${slideImgsJson }' >
										                		<h1><span></span></h1>
										                		
										                		<%-- <c:choose>
										                			<c:when test="${empty slideImgs}">
										                				<div class="goods-details-block">
														                    <h4>Banner展示区</h4>
														                    <p>固定样式 ,最多可选5个图片</p>
														                </div>
														                <div class="sliderImg" style="display:none;">
																			<ul></ul>
																		</div>
										                			</c:when>
										                			<c:otherwise>
										                				<div class="goods-details-block"  style="display:none;">
														                    <h4>Banner展示区</h4>
														                    <p>固定样式 ,最多可选5个图片</p>
														                </div>
														                <div class="sliderImg">
																			<ul>
																				<c:forEach items="${slideImgs}" var="items" varStatus="status">
																				   <li><a href="javascript:void(0);"><img src="${items.attachment_url }"></a></li> 
																				</c:forEach>
																			</ul>
																		</div>
										                				
										                			</c:otherwise>
										                		</c:choose> --%>
										                		
												                
										            		</div>
										            		<%-- <div class="js-config-region">
										            			<div class="app-field clearfix"  data-field-type="detail" >
										            				<div class="control-group">
																        <div class="goods-details-block" style="background: #fff;">
																            <h4>商品详情区</h4>
																            <p>点击进行编辑</p>
																        </div>
																	</div>
																	<div class="actions">
																	    <div class="actions-wrap">
																	        <span class="action edit">编辑</span>
																	    </div>
																	</div>
																</div>
															</div> --%>
										        		</div>
										        		<div class="app-fields js-fields-region">
										        			<div class="app-fields ui-sortable">
										        			<!-- edding area -->
										        			 
										        			 <c:set var="pageItems" value="${pageHeader.items }"></c:set>
										        			 <c:forEach items="${pageHeader.items }" var="items" varStatus="status">
															 		<c:choose>
															 			<c:when test="${items.tmplNo eq '01'}">
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
																						<span class="action edit">${label.编辑}</span>
																						<%--  <span class="action add">加内容</span>  --%>
																						<span class="action delete">${label.删除}</span>
																					</div>
																				</div>
																				<div class="sort">
																					<i class="sort-handler"></i>
																				</div>
																			</div>
															 			</c:when>
															 			<c:when test="${items.tmplNo  eq '05'}">
															 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-05" 
															 					data-field-size="${items.details[0].val02}" 
															 					data-field-goods_number_type="${items.details[0].val03}" 
															 					data-field-goods_group="${items.details[0].val01}"
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
																						<%--  <span class="action add">加内容</span>  --%> 
																						<span class="action delete">${label.删除}</span>
																					</div>
																				</div>
																				<div class="sort">
																					<i class="sort-handler"></i>
																				</div>
																			</div>
															 			</c:when>
															 			<c:when test="${items.tmplNo  eq '12'}">
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
																				<div class="actions">
																					<div class="actions-wrap">
																						<span class="action edit">${label.编辑}</span>
																						<%--  <span class="action add">加内容</span>  --%>
																						<span class="action delete">${label.删除}</span>
																					</div>
																				</div>
																				<div class="sort">
																					<i class="sort-handler"></i>
																				</div>
																			</div>
															 			</c:when>
															 			<c:when test="${items.tmplNo  eq '13'}">
															 				<div class="app-field clearfix ui-sortable-handle" data-field-type="type-13"  data-field-item='${items.showJson}' data-field-left-width="${items.details[0].val04}">
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
																						<%--  <span class="action add">加内容</span>  --%>
																						<span class="action delete">${label.删除}</span>
																					</div>
																				</div>
																				<div class="sort">
																					<i class="sort-handler"></i>
																				</div>
																			</div>
															 			</c:when>
															 			<c:when test="${items.tmplNo  eq '18'}">
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
																						<%--  <span class="action add">加内容</span>  --%>
																						<span class="action delete">${label.删除}</span>
																					</div>
																				</div>
																				<div class="sort">
																					<i class="sort-handler"></i>
																				</div>
																			</div>
															 			</c:when>
															 			<c:when test="${items.tmplNo  eq '20'}">
															 				<div class="app-field clearfixui-sortable-handle" data-field-type="type-20"
															 					 data-field-id="1" 
																				 data-field-link="${items.details[0].val03}" 
																				 data-field-name="${items.details[0].val01}" 
																				 data-field-link-type="${items.details[0].val02}"
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
																						<%--  <span class="action add">加内容</span>  --%>
																						<span class="action delete">${label.删除}</span>
																					</div>
																				</div>
																				<div class="sort">
																					<i class="sort-handler"></i>
																				</div>
																			</div>
															 			</c:when>
															 			<c:when test="${items.tmplNo  eq '99'}">
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
																						<%--  <span class="action add">加内容</span>  --%>
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
										    		<div class="app-footer"></div>
										    	 
												</div>
												<div class="app-sidebar" style="margin-top: -1000px;">
												</div>
											</div>
										</div>
										<!-- --- -->
										
									</div>
			             		</div>
			                </div>    
			  		 		<!-- - -->
			  		 		<div class="navi-button-area">
					  			<span class="btn-step js-preview-setp2" ><span>${label.上一步}</span></span>
					  			<span class="btn-step js-btn-load" ><span>${label.保存}</span></span>
					  			<span class="btn-step js-btn-unload" style="display:none;"><span>${label.下架}</span></span>
					  			<span class="btn-step js-btn-preview"  style="display: none;"><span>${label.预览}</span></span>
					  		</div>  
			  		</div><!--js-goods-content-step-3 -->
			  		 
			  	</div>	
				<!-- end22 -->
			
			</div> 
            <!-- ▲ detali content -->
        </div>

		<!-- ▲ Main container -->
		  <!-- ▼ Main footer -->
       <jsp:include page="/admin/inc/footer.jsp"></jsp:include>
		<!-- ▲  Main footer -->


<script type="text/javascript">
$(function(){
	   $('.ui-sortable').sortable({ axis: "y"});  
		  $( ".ui-sortable" ).disableSelection(); 
		  $('.app-field:first').trigger("click");
	    $('.app-field').click(bindShowSidebar);
	    
	    //保存
	    $('.js-btn-load').click(function(){
	    
	    	if( isPublishing){
	    		return false;
	    	}
	    	var item =  $('#blog-main-img-add').data('field-item') || [];
	       //var item =  $('#app-field-header').data('field-item') || [];
	   	 //  var item2 = $('#app-field-header').data('field-item2') || [];
	  	    if(item.length < 1){
	  	       alert('${label.请选择商品主图片}');
	  	     isPublishing =  false;
	  	       return false;
	  	    }
	  	  /*  if(item2.length < 1){
	  		   alert('请选择商品展示图');
	  		   isPublishing =  false;
	  		   return false;
	  	   } */
	    	
	    	var pp ={};
	  	 	pp.blogId = $('#blogId').val();
	  	 	pp.pageId = $('#pageId').val();
	    	pp.blogTitle = $('#blogTitle').val();
	    	pp.blogDetail = $('#blogDetail').val();
	    	pp.blogGroup = $('#blogGroup').val() ;
	    	pp.mainImgId = item[0].id;
	    	/* for(var i = 0 ; i  < item2.length ; i++){
	    		eval('('+ 'pp.goodsDtlSlideImg' + (i+ 1) + ' =  item2[' +i + '].id )');
	    	} */
	    	
	    	var params = [];
		      $('.js-fields-region .app-field').each(function(idx){
		    	  var $item = $(this);
		    	  var type =  $item.data('field-type');
		    	  if(type == 'type-01'){
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item 					    			    	   		
		    	   		}
		    	   		params.push(obj);
	    		  
		    	  }else if(type == 'type-05'){ 
		    		  var goods_group = $item.data('field-goods_group') || '';
			    	  var size = $item.data('field-size');
			    	  var goods_number_type = $item.data('field-goods_number_type');
		    	   		var obj ={
		    			   goods_group : goods_group,							    			    	   		
		    			   type : type,							    			    	   		
		    			   size : size,							    			    	   		
		    			   goods_number_type :goods_number_type				    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-12'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item 					    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-13'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var leftWidht = $item.data('field-left-width') || 50;
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item,
		    			   leftWidht: leftWidht
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-18'){ 
		    		  var item = $item.data('field-item') || [];
		    		  var obj ={
		    			   type : type,							    			    	   		
		    			   item : item
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-20'){ 
			    	  var name = $item.data('field-name') || '';
		    		  var link = $item.data('field-link') || '';
		    		  var linkType = $item.data('field-link-type') || '1';
		    	   		var obj ={
		    			   type : type,							    			    	   		
		    			   name : name,							    			    	   		
		    			   link : link,							    			    	   		
		    			   linkType : linkType						    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }else if(type == 'type-99'){ 
			    	  var name = $item.attr('data-field-name') || '';
		    	   		var obj ={
		    			   type : type,							    			    	   		
		    			   content : $item.find('.js-richtext').html() 							    			    	   		
		    			    					    			    	   		
		    	   		}
		    	   		params.push(obj);
		    	  }
		    	  
	      });
	      
		      
		      pp.tpls = params;
	    //  alert(JSON.stringify(pp)); 
	    $('body').showLoading({'vPos':'200px'   });
	      $.ajax({
				url : "/admin/blog/modifyBlog.htm",
				type : "POST",
	    	    data:{jsonStr: JSON.stringify(pp)},
				success : function(data) {
					$('body').hideLoading();
					if(data.success){
						alert('${label.保存成功}');
						 window.location.href = '/admin/shopLack/blogControl.htm';
					}else{
						$('body').hideLoading();
						alert('${label.保存失败}!' + data.msg );
						isPublishing =  false;
					}
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
			});
	    });
	    
	});
	 
</script>
		
<script type="text/javascript">
//获取商品组的下拉框
var shopGoodsClassLevelOneCombo = [];
$.ajax({
	type : "GET",
	url : "/admin/combo/list.htm?t=101",
	success : function(data) {
		shopGoodsClassLevelOneCombo = data ||[];
	},
	error : function(xhr, status, e) {
		alert("error: " + status);
	}
});
</script>
<script type="text/javascript">
$(function(){
	
	$('#goodsClassAdd').click(function(){
		$('#modal_test').find('.modal-title').text('${label.添加商品分类}');
		$('#ifr_001').attr("src",'/admin/goods/addShopGoodsClass.htm');        
		
		$('#modal_test').on('show', function () {
			//$('#ifr_001').attr("src",'/admin/goods/addShopGoodsClass.htm');        
		});     
 
		$('#modal_test').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		}).css({
	 		'position':'absolute',
	  		'top':'100px',
	  		width: '600px',  
		 	'margin-left': function () {  
		    	return -($(this).width() / 2);  
		   	}  
		}); 
	});
	
	$('#addGoodsSpec').click(function(){     
		$('#modal_test').find('.modal-title').text('${label.添加商品规格}');
		$('#ifr_001').attr("src",'/admin/goods/addShopGoodsSpec.htm?gc_id=' + gcId);        
		$('#modal_test').on('show', function () {
			//$('#ifr_001').attr("src",'/admin/goods/addShopGoodsSpec.htm?gc_id=' + gcId);        
		});     
 
		$('#modal_test').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		}).css({
	 		'position':'absolute',
	  		'top':'100px',
	  		width: '600px',  
		 	'margin-left': function () {  
		    	return -($(this).width() / 2);  
		   	}  
		}); 
	});
	
	
	$('#modal_test').on('hidden.bs.modal', function (event) {
		$('#modal_test').find('.modal-title').text('');
		$('#ifr_001').attr("src",'');        
	});

})
</script>
	 <%@ include file="/admin/template/blogEditorTemplate.jsp"%> 
	 
</body>
</html>