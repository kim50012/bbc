<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/admin/template/tagsInc.jsp" %> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" />  
<jsp:include page="/admin/js/goods/goods-editor-v2.jsp" />

<script type="text/javascript">
$(function(){
	$('#pageNm').keyup(function(){
		var val = $(this).val() || '<ui:i18n key="页面名称"/>';
		$('.js-page-title-text').text(val);
	});
});
</script> 
</head>
<body>
	 
	<!-- ▼ Main container --> 
        <div class="container">
        	 <form action="">
	       		<input type="hidden" id="pageId" value="${pageHeader.pageId }" /> 
	       		<input type="hidden" id="pageType" value="4" /> 
	       	</form>
		    
     	<div id="app-region" class="app-region-container" >
				<div class="app-design clearfix">
					<div class="app-preview">
					 	<div class="app-header"></div>
			   			<div class="app-entry">
			   				<div class="app-config">
				        	 	<div class="page-title">
					                <span class="js-page-title-text">${pageHeader.pageNm }</span>
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
								 						data-img-left-name="${items.details[0].val05}"  
								 						data-img-right-name="${items.details[1].val05}">
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
			    					<td style="width: 33.3%;"><span class="js-new-field" data-field-type="type-52"><ui:i18n key="商品"/></span></td>
			    				</tr>
			    				<tr>
			    					<td><span class="js-new-field" data-field-type="type-12">1<ui:i18n key="张图"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-13">2<ui:i18n key="张图"/></span></td>
			    					<td><span class="js-new-field" data-field-type="type-18">3<ui:i18n key="张图"/></span></td>
			    				</tr>
			    				<tr>
			    					<td><span class="js-new-field" data-field-type="type-20"><ui:i18n key="标题栏"/></span></td>
			    					<td colspan="2"><span class="js-new-field" data-field-type="type-99"><ui:i18n key="富文本"/></span></td>
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
					
					
					<div class="page-title-warp" >
						<div class="form-warp clearfix">
							<div class="control-warp">
						        <div class="form-label">
						            <ui:i18n key="页面名称"/><a class="label-required"></a>:
						        </div>
						        <div class="form-control">
						            <input type="text" id="pageNm" name="pageNm" class="w33" maxlength="15" value="${pageHeader.pageNm }"/> 
						        </div>
						    </div>
						</div>
					</div>
					
					
				</div>
		 	</div>
		 	
        	<div style="text-align: center; margin-top: 30px;">
			 	<span class="button js-btn-save" style="margin-left: 20px;">
       		   	  	<span class="button-name"  > <ui:i18n key="发布"/> </span> 
       		   	</span> 
			 	<span class="button js-btn-clsoe"  style="margin-left: 20px;">
       		   	  	<span class="button-name" > <ui:i18n key="返回"/> </span> 
       		   	</span> 
			 </div> 
        	           
    </div>
 

<script type="text/javascript">
 						    		 
$(function(){
    //上架
    $('.js-btn-save').click(function(){
    
    	if( isPublishing){
    		return false;
    	}
    	
		var pageNm = $('#pageNm').val().trim();
    	if(pageNm == ''){
    		alert('${label.请输入页面名称}');
    		isPublishing = false;
    		return false;
    	}
    	
    	
    	
    	var pp ={};
    	pp.pageId = $('#pageId').val();
    	pp.pageType = $('#pageType').val();
    	pp.pageNm = pageNm;
    	
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
   			   	leftWidth: $item.data('fieldLeftWidth') || 50, 
   			   	imgLeftName: $item.data('imgLeftName') || '', 
   			   	imgRightName: $item.data('imgRightName') || '' 
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
      
      $.ajax({
			url : '/admin/editor/modifyEditor.htm',
    	    data:{jsonStr: JSON.stringify(pp)},
			success : function(res) {
				if(res.success){
					alert('<ui:i18n key="保存成功"/>');
					//window.top.closeTab();
					window.location.href = '/admin/shopLack/userDefinePageList.htm';
				}else{
					alert('<ui:i18n key="保存失败"/>!\n' + res.err_msg);
					isPublishing =  false;
				}
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
    });
    
    
    $('.js-btn-clsoe').click(function(){
    	//window.top.closeTab();
    	window.location.href = '/admin/shopLack/userDefinePageList.htm';
    });
});
 
</script>
 
	<jsp:include page="/admin/template/customEditorTemplate-v2.jsp" />
</body>
</html> 