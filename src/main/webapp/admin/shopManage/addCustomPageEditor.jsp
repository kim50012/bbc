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
           		<input type="hidden" id="goodsId" value="" /> 
           		<input type="hidden" id="pageType" value="1" /> 
           	</form>
           	
           	<div id="app-region" class="app-region-container" >
				<div class="app-design clearfix">
					<div class="app-preview">
					 	<div class="app-header"></div>
			   			<div class="app-entry">
			   				<div class="app-config">
				        	 	<div class="page-title">
					                <span class="js-page-title-text"><ui:i18n key="页面名称"/></span>
			            		</div>
			   				</div>
			   				
			   				<div class="app-fields js-fields-region">
			        			<div class="app-fields ui-sortable">
			        			<!-- edding area -->
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
						            <input type="text" id="pageNm" name="pageNm" class="w33" maxlength="15"/> 
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

		<!-- ▲ Main container -->

<script type="text/javascript">
$(function(){
    //保存
    $('.js-btn-save').click(function(){
    
    	if (isPublishing) {
    		return false;
    	}
    	
		var pageNm = $('#pageNm').val().trim();
    	if (pageNm == '') {
    		alert('<ui:i18n key="请输入页面名称"/>');
    		isPublishing = false;
    		return false;
    	}

    	var pp ={};
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
	   		} else if (type == 'type-05') { 
	    	   	params.push({
					type : type,							    			    	   		
   			   		goodsGroup : $item.data('goodsGroup') || '',							    			    	   		
   			   		goodsSize : $item.data('goodsSize') || '',							    			    	   		
   			   		goodsNumberType :$item.data('goodsNumberType') || 0				    			    	   		
   	   			});
	   		} else if (type == 'type-52') { 
				params.push({
					type : type,							    			    	   		
					goodsSize : $item.data('goodsSize')  || 1,							    			    	   		
   			   		item : $item.data('fieldItem') || []
   	   			});
			} else if (type == 'type-12') { 
	    	   	params.push({
	    	   		type : type,							    			    	   		
	    			item : $item.data('fieldItem') || [] 
	    	   	});
	    	} else if (type == 'type-13') { 
	    	   	params.push({
		    		type : type,							    			    	   		
	   			   	item : $item.data('fieldItem') || [] ,
	   			   	leftWidth: $item.data('fieldLeftWidth') || 50, 
	   			   	imgLeftName: $item.data('imgLeftName') || '', 
	   			   	imgRightName: $item.data('imgRightName') || '' 
	    	   	});
	   		} else if (type == 'type-18') { 
	    	   	params.push({
					type : type,							    			    	   		
   			   		item : $item.data('fieldItem') || [] 
	    	   	});
	    	} else if (type == 'type-20') { 
				params.push({
					type : type,							    			    	   		
   			   		linkNm : $item.data('linkNm') || '',							    			    	   		
   			   		linkUrl : $item.data('linkUrl') || '',							    			    	   		
   			   		linkType : $item.data('linkType') || 1						    			    	   		
   	   			});
	    	} else if (type == 'type-99') { 
	    	  	params.push({
					type : type,							    			    	   		
					content : $item.find('.js-richtext').html() 							    			    	   		
   	   			});
	    	}
		});
      
    	pp.tpls = params;
    	//console.log('=pp==');
       	//console.log(pp);
       	
    	if (pp.tpls.length == 0) {
    		alert('<ui:i18n key="请编辑店铺主页"/>');
    		isPublishing = false;
    		return false;
    	}
       	
		for (var i=0; i<pp.tpls.length; i++) {
    	   
			var type = pp.tpls[i].type;
			
	    	if (type == 'type-01') {
	    	   	if (pp.tpls[i].item.length == 0) {
	    	   		alert('<ui:i18n key="请选择图片"/>');
	    	   		return false;
	    	   	}
	   		} else if (type == 'type-05') { 
	    	   	if (pp.tpls[i].goodsGroup == '') {
	    	   		alert('<ui:i18n key="请选择商品来源"/>');
	    	   		return false;
	    	   	}		
	   		} else if (type == 'type-52') { 
	    	   	if (pp.tpls[i].item.length == 0) {
	    	   		alert('<ui:i18n key="请选择图片"/>');
	    	   		return false;
	    	   	}
			} else if (type == 'type-12') { 
	    	   	if (pp.tpls[i].item.length == 0) {
	    	   		alert('<ui:i18n key="请选择图片"/>');
	    	   		return false;
	    	   	}
	    	} else if (type == 'type-13') { 
	    	   	if (pp.tpls[i].item.length == 0) {
	    	   		alert('<ui:i18n key="请选择图片"/>');
	    	   		return false;
	    	   	}
	   		} else if (type == 'type-18') { 
	    	   	if (pp.tpls[i].item.length == 0) {
	    	   		alert('<ui:i18n key="请选择图片"/>');
	    	   		return false;
	    	   	}
	    	} else if (type == 'type-20') { 
	    	   	if (pp.tpls[i].linkNm == '') {
	    	   		alert('<ui:i18n key="请输入标题名"/>');
	    	   		return false;
	    	   	} 
	    	   	if (pp.tpls[i].linkUrl == '') {
	    	   		alert('<ui:i18n key="请输入链接地址"/>');
	    	   		return false;
	    	   	}
	    	} else if (type == 'type-99') { 
	    	   	if (pp.tpls[i].content == '') {
	    	   		alert('<ui:i18n key="请输入富文本内容"/>');
	    	   		return false;
	    	   	}
	    	}
       	}
      
		$.ajax({
			url : '/admin/editor/createEditor.htm',
    	    data:{jsonStr: JSON.stringify(pp)},
			success : function(res) {
				if(res.success){
					alert('<ui:i18n key="保存成功"/>');
					//window.top.closeTab();
					window.location.href = '/admin/shopManage/shopMainPageList.htm';
					//window.history.back();
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
    	window.location.href = '/admin/shopManage/shopMainPageList.htm';
    });
});
  
</script>
 

<jsp:include page="/admin/template/customEditorTemplate-v2.jsp" />
</body>
</html>