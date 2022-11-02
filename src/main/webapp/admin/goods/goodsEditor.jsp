<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiInc.jsp"%> 
<title>商品登记::编辑商品详情</title>  
 <link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor.css" />  
 
<script type="text/javascript">
var gcNm = '';
var gexingGcNm = '';
var gcId = '';
var goodsId = '';
var isPublishing = false;

$(function() {
	$(window).scroll(function () {
		$('.js-field-area').animate({top: _.max([$('#step-content-region').offset().top -$(document).scrollTop(),60])  },100); 
	});
}); 

</script>
<script type="text/javascript">
$(function(){
	
	 $("#fileupload").fileupload({
	        url:"/admin/upload",//文件上传地址，当然也可以直接写在input的data-url属性内
	        formData:{},//如果需要额外添加参数可以在这里添加
	        done:function(e,res){
	            //done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
	            //注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
	            //返回的数据在res.result中，假设我们服务器返回了一个json对象
	            
	           $.each(res.result, function (index, file) {
	        	   if(file.success){
	        	   		//$('#resultImg').append('<li><img src="' + file.fileUrl + '" width="50px" height="50px"></li>') ;
	        	   	   $('.modal.fade.hide.in select.js-current-page').trigger('change');
	        	   	    
	        		  // modal fade hide in
	        	   		
	        	   }else{
	        		   alert(file.message);
	        	   }
	            });
	        }
	    });
	 
	 $('.js-file-upload').click(function(){
		 $('#files').click();
	 });
})

</script>

<link rel="stylesheet" type="text/css" href="/admin/css/test.css" /> 
</head>
<body>
	<jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType"/> 
	</jsp:include>
	<!-- ▼ Main container --> 
        <div class="container">
        	<!-- ▼ Left Menu  --> 
        	<jsp:include page="/admin/inc/menuleft.jsp">
				<jsp:param value="${topMenuType}" name="topMenuType"/> 
				<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1"/> 
				<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2"/> 
			</jsp:include>
		    <!-- ▲ Left Menu  -->
		    
            <%--  --%>
            <!-- ▼ detali content  --> 
            <div class="ui-right-content">
            	<form action="">
            		<input type="hidden" id="goodsId" value="" /> 
            	</form>
            	
            	<form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
			         <input id="files" type="file" name="files[]" multiple style="display: none;" >  
			    </form>
            
				<div class="goods-step-area" >
			  		 <!-- <div class="text-top clearfix">
			  		 	<div>
			  				<ul class="ui-nav-tab">
				  				<li>商品选择</li>
				  				<li>编辑基本信息  </li>
				  				<li>编辑商品详情 </li>
			  				</ul>
			  			</div>
			  		</div> -->
			  		
			  		
			  		<!-- <div class="goods-step goods-step-1 js-goods-step-img clearfix"></div> -->
			  		<%--
			  		<div class="goods-content-step js-goods-content-step-1">
			  			
			  			
			  			<div class="title-area"  >
			  				<div class="title-desc">
			  					<a class="icons-bag" href="javascript:void(0);"></a>
			  					<span>商品选择</span>
			  				</div>
			  				
			  				<div class="controll-area ">
			  					<a class="search-m" href="javascript:void(0);"></a>
			  					<span class="button"  id="btnSerachGrid">查 询</span>
			  				</div>
			  			</div>
			  			 
			  			
			  			<div class="search-area">
			  				<form class="form-horizontal" novalidate="">
								<div class="control-group">
				        			<label class="control-label">商品名称：</label>
				        			<div class="controls">
				            			<input type="text" id="searchGoodsNm"  class="w18" />
				        			</div>
				    			</div>
								<!-- <div class="control-group">
				        			<label class="control-label"><em class="required">*</em>二级分类：</label>
				        			<div class="controls">
				            			<input type="text" name="url"  value="" maxlength="200"  class="w15"> 
				        			</div>
				    			</div> -->
								 
							</form>
			  			</div>
			  		
			  				<div class="ui-gridarea clearfix" style="min-height: 250px;">
								<table class="grid">
									<thead>
										<tr>
											<td style="width: 5%;"></td>
											<td style="width: 25%;">商品名称</td>
											<td style="width: 40%;">标准分类-第1级>第2级>第3级</td>
											<td style="width: 30%;">商品登记时间</td>
										</tr>
									</thead>
									<tbody class="js-result-grid-content">
											 
									</tbody>
									<tfoot data-target="#btnSerachGrid" id="js-result-grid-footer">
								        <tr>
								        	<td colspan="4"  class="grid-has-result" style="display: none;">
								        	  <div style="position: relative;">
												<div class="page-navigation" style="margin-top: 20px;" >
										         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
										         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
										         	<select id="currentPage" class="page-select select2 js-current-page" >
										         		 
										         	</select>
										         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
										         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
										         	<select id="pageUnit" class="page-select select2 js-page-unit" >
										         		<option value="10">10</option>
										         		<option value="20">20</option>
										         		<option value="30">30</option>
										         		<option value="50">50</option>
										         	</select>
										         	<span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span>
										    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
										    			 每页10条, 共12条
										    		</div>
										    	</div>
										    	</div>
											</td> 
								        </tr>
								        <tr class="grid-not-result" style="display: none;">
											<td colspan="4" style="padding-right: 4%; height: 35px; text-align: right;">
												 查询没有数据
											</td>
										 </tr>
									</tfoot>
								</table>
						</div>
			  			<div class="navi-button-area">
				  			<span class="btn-step js-to-setp2" ><span>下一步</span></span>
				  		</div>
			  		</div><!--js-goods-content-step-1 -->
			  		
			  		
			  		<div class="goods-content-step js-goods-content-step-2" style=" ">
			  			<div class="title-area"  >
			  				<div class="title-desc">
			  					<a class="icons-pen" href="javascript:void(0);"></a>
			  					<span>编辑基本信息</span>
			  				</div>
			  				
			  			</div>
			  		
			  			<div class="form-group clearfix" >
				  			<div class="control-group">
				  			 	 <div class="form-label">
				  			 		<a class="label-prefix"></a>标准商品分类 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<span class="form-span" id="step2_goods_category">商品/茶叶/特产/滋补品 > 方便面速食/罐头 > 面试</span>
				  			 	 </div>
				  			 </div>
			  			 
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>上架标题<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="descTitle" placeholder="请输入上架标题..." class="w42">
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>上架内容<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<textarea id="descDetail" cols="100"  class="w42" style="height: 60px; text-align: left;" ></textarea>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>新旧区分 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" name="isUsed" id="isUsedYes" value="1" checked="checked" /> 全新 
				  			 	 	&nbsp; &nbsp; &nbsp; &nbsp;
				  			 	 	<input type="radio" name="isUsed" id="isUsedNo" value="2" /> 二手
				  			 	 </div>
				  			 </div>
			  			 
				  			 <div class="control-group">
				  			 	 <div class="form-label">
				  			 		<a class="label-prefix"></a>商品标签 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	 <ul class="goods-tag">
				  			 	 	 	<li><img id="goods-tag-add" class="ic-plus2" src="/admin/images/icon/icon-plus2.png"  >查询新标签(查询关键词) </li>
				  			 	 	 </ul>
				  			 	 </div>
				  			 </div>
			  		
				  			<div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>商品分类<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="goods-class-level1" data-placeholder="请选择" class="select2 sw21"   >
							            <option value=""></option>
							            <c:forEach items="${requestScope.goodClassLevel1}" var="items" varStatus="status">
											<option value="${items.SGC_ID}">${items.SGC_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 	<select id="goods-class-level2" data-placeholder="请选择" class="select2 sw21"   >
							            <option value=""></option> 
						         	 </select>
				  			 	 	<img   id="goodsClassAdd" src="/admin/images/icon/icon-plus2.png" title="添加商品分类"    style="cursor: pointer; margin-left: 10px;"   >
				  			 	 </div>
				  			 </div>
			  			 
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>商店规格<a class="label-required"></a>: 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<span style="display:inline-block;width:75px;">规格1：</span>
				  			 	 	<select id="goods-spec-big1" data-placeholder="请选择" class="select2 sw36"   >
							            <option value=""></option>
						         	 </select>
						         	 
						         	 <img id="addGoodsSpec" src="/admin/images/icon/icon-plus2.png"  title="添加商品规格"   style="cursor: pointer; margin-left: 10px;"  >
				  			 	 </div>
				  			 </div>
				  			  <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	  <span style="display:inline-block;width:75px;">&nbsp;</span>
				  			 	 	<select id="goods-spec-small1" data-placeholder="请选择" class="chosen-select-deselect sw36" multiple   >
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			  <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 	 </div>
				  			 	 <div class="form-control">
						         	 <span style="display:inline-block;width:75px;">规格2：</span>
				  			 	 	<select id="goods-spec-big2" data-placeholder="请选择" class="select2 sw36"   >
							            <option value=""></option>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			  <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<span style="display:inline-block;width:75px;">&nbsp; </span>
				  			 	 	<select id="goods-spec-small2" data-placeholder="请选择" class="chosen-select-deselect sw36" multiple   >
						         	 </select>
				  			 	 </div>
				  			 </div>
			  			 
				  			  <div class="control-group" id="goods-stock-area" >
				  			 	</div>
			  			 	<div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>库存位置<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="goods-stock-province" data-placeholder="请选择" class="select2 sw21"   >
							            <option value=""></option>
							            <c:forEach items="${requestScope.provinceCombo}" var="items" varStatus="status">
											<option value="${items.AREAID}">${items.AREANAME}</option>
										</c:forEach>
						         	 </select>
				  			 	 	<select id="goods-stock-city" data-placeholder="请选择" class="select2 sw21"   >
							            <option value=""></option> 
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>物流费<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="transSheetId" data-placeholder="请选择" class="select2 sw33"   >
				  			 	 		 <option value=""></option>
							            <c:forEach items="${requestScope.goodTransportCombo}" var="items" varStatus="status">
											<option value="${items.TRANS_SHEET_ID}">${items.TRANS_SHEET_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>是否使用优惠券 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select data-placeholder="请选择" class="select2 sw33"   >
				  			 	 		<option value=""></option>
							            <c:forEach items="${requestScope.voucherAbleCombo}" var="items" varStatus="status">
											<option value="${items.VOUCHER_ID}">${items.VOUCHER_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>折扣政策 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select data-placeholder="请选择" class="select2 sw33"   >
				  			 	 		<option value=""></option>
							           <c:forEach items="${requestScope.discountPolicyCombo}" var="items" varStatus="status">
											<option value="${items.VOUCHER_ID}">${items.VOUCHER_NM}</option>
										</c:forEach>
						         	 </select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  >
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>发布时间<a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	 <input type="text" id="startDate" class="w15 datepicker" readonly="readonly" > 
				  			 	 	 ~ <input type="text" id="endDate" class="w15 datepicker"  readonly="readonly" >
				  			 	 </div>
				  			 </div>
				  			 <div class="control-group"  style="display: none;">
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>发布备注 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<textarea id="displayMemo" cols="100"  class="w30" style="height: 60px; text-align: left;" ></textarea>
				  			 	 </div>
				  			 </div>
				  			 
				  			  <div class="control-group"  style="display: none;">
				  			 	 <div class="form-label"  >
				  			 		<a class="label-prefix"></a>活动内容 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="eventDesc" placeholder="请输入活动内容..." class="w30">
				  			 	 </div>
				  			 </div>
				  			 
				  			 <div class="control-group">
								<div class="form-label"  >
				  			 		<a class="label-prefix"></a>商品主图片<a class="label-required"></a> : 
				  			 	 </div>
								<div class="controls">
									<ul class="module-goods-list clearfix js-main-img " > 
										<li id="goods-main-img-add">
											<a href="javascript:void(0);" class="add-goods"><i class="icon-plus3"></i></a>
										</li>
									</ul>
								</div>
							</div>
				  		</div>
				  		
				  		<div class="navi-button-area">
				  			<span class="btn-step js-preview-setp1" ><span>上一步</span></span>
				  			<span class="btn-step js-to-step3" ><span>下一步</span></span>
				  		</div>
			  		</div><!-- end js-goods-content-step-2 -->
			  		  --%>
			  		 <div class="goods-content-step js-goods-content-step-3" >
			  		 <div class="step-sp clearfix"></div>
			  		 		<div class="js-field-area" style=" ">
								<div class="field-area-header" style="">
									添加内容
								</div>
								<ul>
						      <!--   <li><a class="js-new-field" data-field-type="rich_text">富文本</a></li> -->
							        <li><a class="js-new-field" data-field-type="type-01">图片滚动</a></li> 
							     <!--    <li><a class="js-new-field" data-field-type="type-02">02</a></li> 
							        <li><a class="js-new-field" data-field-type="type-03">03</a></li> 
							        <li><a class="js-new-field" data-field-type="type-04">04</a></li> 
							        <li><a class="js-new-field" data-field-type="type-05">05</a></li> 
							        <li><a class="js-new-field" data-field-type="type-06">06</a></li>  -->
							        <li><a class="js-new-field" data-field-type="type-05">商品列表</a></li> 
							     <!--    <li><a class="js-new-field" data-field-type="type-08">08</a></li> 
							        <li><a class="js-new-field" data-field-type="type-09">09</a></li> 
							        <li><a class="js-new-field" data-field-type="type-10">10</a></li> 
							        <li><a class="js-new-field" data-field-type="type-11">11</a></li>  -->
							        <li><a class="js-new-field" data-field-type="type-12">1张图</a></li> 
							        <li><a class="js-new-field" data-field-type="type-13">2张图</a></li> 
							       <!--  <li><a class="js-new-field" data-field-type="type-14">14</a></li> 
							        <li><a class="js-new-field" data-field-type="type-15">15</a></li> 
							        <li><a class="js-new-field" data-field-type="type-16">16</a></li> 
							        <li><a class="js-new-field" data-field-type="type-17">17</a></li>  -->
							        <li><a class="js-new-field" data-field-type="type-18">3张图</a></li> 
							        <li><a class="js-new-field" data-field-type="type-20">标题栏</a></li> 
							        <li><a class="js-new-field" data-field-type="type-99">富文本</a></li> 
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
										            		<div id="app-field-header" class="app-field" style="cursor: default;" data-field-type="header">
										                		<h1><span></span></h1>
												                <div class="goods-details-block">
												                    <h4>Banner展示区</h4>
												                    <p>固定样式 ,最多可选5个图片</p>
												                </div>
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
										        			 
										        			<!-- edding area -->
																 
										        			</div>
										        		</div>
										    		</div>
										    		<div class="app-footer"></div>
										    		
										    		
										    	<!-- 	<div class="js-add-region">
										    			<div>
										    				<div class="app-add-field">
										    					<h4>添加内容</h4>
															    <ul>
															        <li><a class="js-new-field" data-field-type="rich_text">富文本</a></li>
															        <li><a class="js-new-field" data-field-type="type-01">图片滚动</a></li> 
															        <li><a class="js-new-field" data-field-type="type-02">02</a></li> 
															        <li><a class="js-new-field" data-field-type="type-03">03</a></li> 
															        <li><a class="js-new-field" data-field-type="type-04">04</a></li> 
															        <li><a class="js-new-field" data-field-type="type-05">05</a></li> 
															        <li><a class="js-new-field" data-field-type="type-06">06</a></li> 
															        <li><a class="js-new-field" data-field-type="type-05">商品列表</a></li> 
															        <li><a class="js-new-field" data-field-type="type-08">08</a></li> 
															        <li><a class="js-new-field" data-field-type="type-09">09</a></li> 
															        <li><a class="js-new-field" data-field-type="type-10">10</a></li> 
															        <li><a class="js-new-field" data-field-type="type-11">11</a></li> 
															        <li><a class="js-new-field" data-field-type="type-12">1张图</a></li> 
															        <li><a class="js-new-field" data-field-type="type-13">2张图</a></li> 
															        <li><a class="js-new-field" data-field-type="type-14">14</a></li> 
															        <li><a class="js-new-field" data-field-type="type-15">15</a></li> 
															        <li><a class="js-new-field" data-field-type="type-16">16</a></li> 
															        <li><a class="js-new-field" data-field-type="type-17">17</a></li> 
															        <li><a class="js-new-field" data-field-type="type-18">3张图</a></li> 
															        <li><a class="js-new-field" data-field-type="type-20">标题栏</a></li> 
															        <li><a class="js-new-field" data-field-type="type-99">富文本</a></li> 
															        <li><a class="js-new-field" data-field-type="image_ad">图片<br>广告</a> </li>
															        <li><a class="js-new-field" data-field-type="cube2">魔方</a></li>
															        <li><a class="js-new-field" data-field-type="title">标题</a></li>
															        <li><a class="js-new-field" data-field-type="text_nav">文本<br>导航</a></li>
															        <li><a class="js-new-field" data-field-type="nav">图片<br>导航</a></li>
															        <li><a class="js-new-field" data-field-type="link">关联<br>链接</a></li>
															        <li><a class="js-new-field" data-field-type="search">商品<br>搜索</a></li>
															        <li><a class="js-new-field" data-field-type="showcase">橱窗</a></li>
															        <li><a class="js-new-field" data-field-type="line">辅助线</a></li>
															        <li><a class="js-new-field" data-field-type="white">辅助<br>空白</a></li>
															        <li><a class="js-new-field" data-field-type="component">自定义<br>模块</a></li>
															    </ul>
															</div>
														</div>
													</div> -->
												</div>
												
												
												<div class="app-sidebar" style="margin-top: -1000px;">
												    
												</div>
												
												
												<!-- <div class="app-actions" style="bottom: 0px;">
												    <div class="form-actions text-center">
												        <button class="btn js-switch-step" data-next-step="2">上一步</button>
												        <input class="btn btn-primary js-btn-load" type="submit" value="上架" data-loading-text="上架...">
												        <input class="btn js-btn-unload" type="submit" value="下架" data-loading-text="下架...">
												        <input class="btn js-btn-preview" type="submit" value="预览" data-loading-text="预览效果...">
												    </div>
												</div> -->
											</div>
										</div>
										<!-- --- -->
										
									</div>
			             		</div>
			                </div>    
			  		 		<!-- - -->
			  		 		<div class="navi-button-area">
					  			<span class="btn-step js-preview-setp2" ><span>上一步</span></span>
					  			<span class="btn-step js-btn-load" ><span>上架</span></span>
					  			<span class="btn-step js-btn-unload" ><span>下架</span></span>
					  			<span class="btn-step js-btn-preview" ><span>预览</span></span>
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
var editor = '';						    		 
$(function(){
	//点击添加组件响应事件 
   $('.js-new-field').click(function(){
	  var $this = $(this);
	  $('.app-field.editing').removeClass('editing');   
	  
	  var $fields =  $('.js-fields-region .app-fields');
	  var dataFieldType = $this.attr('data-field-type') ;
	  var tpl = ''; 
	  var paramObj = {};
	  
	  if(dataFieldType == 'type-01'){
		  paramObj = {
			      type :dataFieldType,
			      item : []
			 };
		  tpl = template('tpl_type_01',paramObj);
	  }else if(dataFieldType == 'type-05'){
		  paramObj = {
			      type :dataFieldType ,
			  	  size: 1 ,
			  	  goods_number_type:0
			 };
		  tpl = template('tpl_type_05',paramObj);
	  }else if(dataFieldType == 'type-12'){
		  paramObj = {
			      type :dataFieldType,
			      item : []
			 };
		  tpl = template('tpl_type_12',paramObj);
	  }else if(dataFieldType == 'type-13'){
		  paramObj = {
			      type :dataFieldType,
			      item : []
			 };
		  tpl = template('tpl_type_13',paramObj);
	  }else if(dataFieldType == 'type-18'){
		  paramObj = {
			      type :dataFieldType ,
			      item : []
			 };
		  tpl = template('tpl_type_18',paramObj);
	  }else if(dataFieldType == 'type-20'){
		  paramObj = {
			      type :dataFieldType
			 };
		  tpl = template('tpl_type_20',paramObj);
	  }else if(dataFieldType == 'type-99'){
		  paramObj = {
			      type :dataFieldType
			 };
		  tpl = template('tpl_type_99',paramObj);
	  }else{
		  paramObj = {
			      type :dataFieldType  
			 };
		  tpl = template('tpl_type_00',paramObj);
	  }
	    
	  $fields.append(tpl);
	  
	  $('html, body').animate({scrollTop: $(document).height()}, 300); 

	 
	  $('.ui-sortable').sortable({ axis: "y"});  
	  $( ".ui-sortable" ).disableSelection(); 
	  $('.app-field').unbind('click');
	  $('.app-field').click(paramObj,bindShowSidebar);
	  
	  $('.app-field:last').trigger("click");
	  
	  $('.app-field .actions .action.delete').click(function(){
	  		$(this).closest('.app-field').remove(); 
	  		$('.app-sidebar').hide();
	  		$('.js-fields-region .app-field:last-of-type').click();
	  });
	  
	});
   
    $('.app-field').click(bindShowSidebar);
    
    //上架
    $('.js-btn-load').click(function(){
    
    	if( isPublishing){
    		return false;
    	}
    	var item =  $('#goods-main-img-add').data('field-item') || [];
       //var item =  $('#app-field-header').data('field-item') || [];
   	   var item2 = $('#app-field-header').data('field-item2') || [];
  	    if(item.length < 1){
  	       alert('请选择商品主图片');
  	     isPublishing =  false;
  	       return false;
  	    }
  	   if(item2.length < 1){
  		   alert('请选择商品展示图');
  		   isPublishing =  false;
  		   return false;
  	   }
    	
    	var pp ={};
    	pp.goodsId = goodsId;
    	pp.gcId = gcId;
    	pp.sgcIdSplit = $('#goods-class-level1').val() + ',' + $('#goods-class-level2').val();
    	pp.isUsed = $("[name='isUsed']:checked").val();
    	pp.stockAreaId = ($('#goods-stock-city').val() == '') ? $('#goods-stock-province').val() : $('#goods-stock-city').val() ;
    	pp.transSheetId = $('#transSheetId').val() ;
    	pp.startDt = $('#startDate').val();
    	pp.endDt = $('#endDate').val();
    	pp.startDesc = $('#displayMemo').val();
    	pp.eventDesc = $('#eventDesc').val();
    	pp.descTitle = $('#descTitle').val();
    	pp.descDetail = $('#descDetail').val();
    	pp.goodsListImg = item[0].id;
    	for(var i = 0 ; i  < item2.length ; i++){
    		eval('('+ 'pp.goodsDtlSlideImg' + (i+ 1) + ' =  item2[' +i + '].id )');
    	}
    	
    	var tagSplit = [];
		$('.tag-split').each(function(){
			tagSplit.push($(this).text());			
		});
		pp.tagIdSplit = _.uniq(tagSplit).join(',');
		
		
		var  stocks = [];
		var stockObj = {};
		$('#goods-stock-area input').each(function(){
			var id = $(this).data('id');
			var type = $(this).data('type');
			var value = $(this).val();
			 
			if(type == "price"){
				stockObj = {};
				stockObj.id = id;
				stockObj.price = value;
			}else if(type == "unit"){
				stockObj.unit = value;
			}else if(type == "stock"){
				stockObj.stock = value;
				stocks.push(stockObj);
			}
		});
		
		pp.stocks = stocks;
    
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
      
      $.ajax({
			url : "/admin/goods/createTemp.htm",
			type : "POST",
    	    data:{jsonStr: JSON.stringify(pp)},
			success : function(data) {
				if(data.success){
					alert('上架成功');
					window.location.href = '/admin/goods/goods/sellList.htm';
				}else{
					alert('上架失败');
					isPublishing =  false;
				}
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
    });
});
 

//显示编辑器功能
function bindShowSidebar(e){ 
	var $this = $(this);
	
	var type = $this.attr('data-field-type') ;
  	
  	if(type == 'detail'){
  		
  		return ;
  	}
	
    var top = $this.position().top; 
   	$('.app-field').removeClass('editing');
   	$this.addClass('editing');
   	$('.app-sidebar').show();
   	$('.app-sidebar').css("margin-top", top + 'px');
  	// $this.addClass('editing').siblings().removeClass('active'); ;
  	
 //  alert($this.attr('data-field-type') + ',' + e.data.type);
  	
  	
  	if(type == 'header'){
  		e.data = {};
  		$('.app-sidebar').css("margin-top", (top + 66) + 'px');
  	}
   
   e.data.type = type;
  // alert($this.attr('data-field-type') + ',' + e.data.type);
  	if(type == 'header'){
  	   //var item = $this.attr('data-field-item') || '[]';
  	   var item2 = $this.attr('data-field-item2') || '[]';
 	  // e.data.item = JSON.parse(item);
 	   e.data.item2 = JSON.parse(item2);
 	   $('.app-sidebar').html(template('tpl_sidebar_header', e.data));
 	  /*** 
 	   
 	  $('.js-add-one-goods').click(function(){
		  	$('#modal_header_01').modal({
			  	backdrop: 'static', 
			  	keyboard: false
			  	//,  remote:'/admin/goods/list.htm'
			 });
	  });
 	  ****/
 	  $('.js-add-goods').click(function(){
		  	$('#modal_header_02').modal({
			  	backdrop: 'static', 
			  	keyboard: false
			  	//,  remote:'/admin/goods/list.htm'
			 }).css({
				 'position':'absolute',
				  'top':'100px',
				  width: '700px',  
					 'margin-left': function () {  
					    return -($(this).width() / 2);  
					   }  
				});
	  });
 	   
  	}else if(type == 'type-01'){
	   var item = $this.attr('data-field-item') || '[]';
	   e.data.item = JSON.parse(item);
	   $('.app-sidebar').html(template('tpl_sidebar_01', e.data));
	   
	 
		  $('.js-add-goods').click(function(){
			  	$('#modal_01').modal({
				  	backdrop: 'static', 
				  	keyboard: false
				  	//,  remote:'/admin/goods/list.htm'
				 }).css({
					 'position':'absolute',
					  'top':'100px',
					  width: '700px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});
		  });
		  $('.js-img-area li.sort').hover(function(){
	   			//$(this).closest('.sort').find('.close-modal').removeClass('hide');
			  	$(this).find('.close-modal').removeClass('hide');
	   		} ,function(){
	   			//$(this).closest('.sort').find('.close-modal').addClass('hide');
	   			$(this).find('.close-modal').addClass('hide');
	   	  });
		  	
		  $('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem);
	   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
				alert('shoudong');
		  });
	  	
	   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
		  		$this = $(this);
		  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
		  		$('#modal_1_link').modal({
				  	backdrop: 'static', 
				  	keyboard: false
				  	//,  remote:'/admin/goods/list.htm'
				 }).css({
					 'position':'absolute',
					  'top':'100px',
					  width: '700px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});
		  	});
			  	 
		  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
				   var val = $(this).val();
				   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
				    
				    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
					array = JSON.parse(array);
					for(var i= 0 ; i < array.length ; i++){
						if(array[i].tempId == tempId){
							array[i].linkUrl = val || '';
							$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
							break;
						}
					}
					//array.push(data);
					//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
			   });
		  
   }else if(type == 'type-05'){
		e.data.goods_number_type = $this.attr('data-field-goods_number_type');
	    e.data.goods_group = $this.attr('data-field-goods_group');
		e.data.size = $this.attr('data-field-size');
		e.data.goods_group_list = shopGoodsClassLevelOneCombo;
		$('.app-sidebar').html(template('tpl_sidebar_05', e.data));
		
		$('.form-horizontal [name=goods_group_list]').change(render07);
		$('.form-horizontal input:radio,.form-horizontal input:checkbox').click(render07);
		   
   }else if(type == 'type-12'){
	   var item = $this.attr('data-field-item') || '[]';
	   e.data.item = JSON.parse(item);
		$('.app-sidebar').html(template('tpl_sidebar_12', e.data));
		 
		  $('.js-add-goods').click(function(){
			  	$('#modal_12').modal({
				  	backdrop: 'static', 
				  	keyboard: false
				  	//,  remote:'/admin/goods/list.htm'
				 }).css({
					 'position':'absolute',
					  'top':'100px',
					  width: '700px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});
		  });
		  $('.js-img-area li.sort').hover(function(){
	   			//$(this).closest('.sort').find('.close-modal').removeClass('hide');
			  	$(this).find('.close-modal').removeClass('hide');
	   		} ,function(){
	   			//$(this).closest('.sort').find('.close-modal').addClass('hide');
	   			$(this).find('.close-modal').addClass('hide');
	   	  });
		  	
		  $('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem2);
	   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
				alert('shoudong');
		  });
	  	
	   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
		  		$this = $(this);
		  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
		  		$('#modal_1_link').modal({
				  	backdrop: 'static', 
				  	keyboard: false
				  	//,  remote:'/admin/goods/list.htm'
				 }).css({
					 'position':'absolute',
					  'top':'100px',
					  width: '700px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});
		  	});
			  	 
		  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
				   var val = $(this).val();
				   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
				    
				    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
					array = JSON.parse(array);
					for(var i= 0 ; i < array.length ; i++){
						if(array[i].tempId == tempId){
							array[i].linkUrl = val || '';
							$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
							break;
						}
					}
					//array.push(data);
					//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
			   });
		   
   }else if(type == 'type-13'){
	   var item = $this.attr('data-field-item') || '[]';
	   var leftWidth =  $('.app-field.editing').attr('data-field-left-width') || 50 ;
	   e.data.item = JSON.parse(item);
		$('.app-sidebar').html(template('tpl_sidebar_13', e.data));
		 
		  $('.js-add-goods').click(function(){
			  	$('#modal_13').modal({
				  	backdrop: 'static', 
				  	keyboard: false
				  	//,  remote:'/admin/goods/list.htm'
				 }).css({
					 'position':'absolute',
					  'top':'100px',
					  width: '700px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});
		  });
		  
		  $( ".js-img-width-slider" ).slider({
		     // range: true,
		     // min: 0,
		     // max: 500,
		     // values: [ 75, 300 ],
		      range: "max",
		      min: 20,
		      max: 80,
		      value: leftWidth,
		      slide: function( event, ui ) {
		        $( ".js-img-left-width" ).val(  ui.value + '%');
		        $( ".js-img-right-width" ).val( (100 - ui.value)  + '%');
		        
		        $('.app-field.editing').find('.js-img-left').css('width',ui.value + '%');
		        $('.app-field.editing').find('.js-img-right').css('width',(100 - ui.value) + '%');
		        
		        $('.app-field.editing').attr('data-field-left-width',ui.value || 50) ;
		      }
		  
		    });
		 		 $( ".js-img-left-width" ).val( $( ".js-img-width-slider" ).slider( "value" )    + '%');
		 		 $( ".js-img-right-width" ).val((100 - $( ".js-img-width-slider" ).slider( "value" ) )    + '%');
		  
		 		 
		 		$('.js-img-area li.sort').hover(function(){
		   			//$(this).closest('.sort').find('.close-modal').removeClass('hide');
				  	$(this).find('.close-modal').removeClass('hide');
		   		} ,function(){
		   			//$(this).closest('.sort').find('.close-modal').addClass('hide');
		   			$(this).find('.close-modal').addClass('hide');
		   	  });
			  	
			  $('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem);
		   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
					alert('shoudong');
			  });
		  	
		   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
			  		$this = $(this);
			  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
			  		$('#modal_1_link').modal({
					  	backdrop: 'static', 
					  	keyboard: false
					  	//,  remote:'/admin/goods/list.htm'
					 }).css({
						 'position':'absolute',
						  'top':'100px',
						  width: '700px',  
							 'margin-left': function () {  
							    return -($(this).width() / 2);  
							   }  
						});
			  	});
				  	 
			  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
					   var val = $(this).val();
					   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
					    
					    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
						array = JSON.parse(array);
						for(var i= 0 ; i < array.length ; i++){
							if(array[i].tempId == tempId){
								array[i].linkUrl = val || '';
								$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
								break;
							}
						}
						//array.push(data);
						//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
				   });
		//$('.form-horizontal [name=goods_group_list]').change(render07);
		//$('.form-horizontal input:radio,.form-horizontal input:checkbox').click(render07);
		   
   }else if(type == 'type-18'){
	   var item = $this.attr('data-field-item') || '[]';
	    e.data.item = JSON.parse(item);
		$('.app-sidebar').html(template('tpl_sidebar_18', e.data));
		 
		  $('.js-add-goods').click(function(){
			  	$('#modal_18').modal({
				  	backdrop: 'static', 
				  	keyboard: false
				  	//,  remote:'/admin/goods/list.htm'
				 }).css({
					 'position':'absolute',
					  'top':'100px',
					  width: '700px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});
		  });
		  
		  $('.js-img-area li.sort').hover(function(){
	   			//$(this).closest('.sort').find('.close-modal').removeClass('hide');
			  	$(this).find('.close-modal').removeClass('hide');
	   		} ,function(){
	   			//$(this).closest('.sort').find('.close-modal').addClass('hide');
	   			$(this).find('.close-modal').addClass('hide');
	   	  });
		  	
		  $('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem3);
	   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
				alert('shoudong');
		  });
	  	
	   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
		  		$this = $(this);
		  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
		  		$('#modal_1_link').modal({
				  	backdrop: 'static', 
				  	keyboard: false
				  	//,  remote:'/admin/goods/list.htm'
				 }).css({
					 'position':'absolute',
					  'top':'100px',
					  width: '700px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});
		  	});
			  	 
		  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
				   var val = $(this).val();
				   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
				    
				    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
					array = JSON.parse(array);
					for(var i= 0 ; i < array.length ; i++){
						if(array[i].tempId == tempId){
							array[i].linkUrl = val || '';
							$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
							break;
						}
					}
					//array.push(data);
					//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
			   });
		   
   }else if(type == 'type-20'){
	   e.data.name = $this.attr('data-field-name') || '';
	   e.data.link = $this.attr('data-field-link') || '';
	   e.data.linkType = $this.attr('data-field-link-type') || 1;
	   
	   $('.app-sidebar').html(template('tpl_sidebar_20', e.data)); 
	   
	   $('.js-sidebar-region [name=title]').keyup(function(){
		   var title = $(this).val();
		    $('.app-field.editing').attr('data-field-name',title);
		    $('.app-field.editing').find('.js-type19-title').html(title || '标题');
	   });
	   $('.js-sidebar-region [name=url]').keypress(function(){
		   var val = $(this).val();
		    $('.app-field.editing').attr('data-field-link',val);
	   });
	   
	   $('.js-sidebar-region [name=linkType]').click(function(){
		   var val = $(this).val();
		    $('.app-field.editing').attr('data-field-link-type',val);
	   });
	   ////***
	   
	   
	   /////
	   
	   $('.js-url-input').click(function(){
		  $(this).siblings('[name=url]').removeAttr('readonly')  ; 
	   });
	   $('.js-url-select').click(function(){
		    $(this).siblings('[name=url]').attr('readonly',true)  ; 
		    $('#modal_20').modal({
			  	backdrop: 'static', 
			  	keyboard: false
			  	//,  remote:'/admin/goods/list.htm'
			 }).css({
				 'position':'absolute',
				  'top':'100px',
				  width: '700px',  
					 'margin-left': function () {  
					    return -($(this).width() / 2);  
					   }  
				});

	   });	
   }else if(type == 'type-99'){
	   if(!!editor){
		   editor.destroy();
		   $('#js-editor').remove();
		   $('#containerWarp').html('');
	   }
	   
		$('.app-sidebar').html(template('tpl_sidebar_99', e.data));
		  
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
	       	// ,initialFrameWidth :480
	       	  ,initialFrameHeight :300
	       	 ,elementPathEnabled : false
	        });
		 
	        editor.ready(function() {
	        	editor.setContent($('.app-field.editing').find('.js-richtext').html()); 
	        	editor.addListener("selectionchange",function(type,event){
	        		//$('#result').html(editor.getContent());
	        		$('.app-field.editing').find('.js-richtext').html(editor.getContent()  );
	        	 })
	         
	        });
		
   }else{
	   $('.app-sidebar').html('no content');
   }
  
} ;

function render07(){
	  var size 			=  $('.form-horizontal input[name="size"]:checked').val();
	  var goods_number_type =  $('.form-horizontal input[name="goods_number_type"]:checked').val();
	  var  goods_group = $('[name=goods_group_list]').val();
	  var paramObj = {
			  type:'type-05',
			   goods_group : goods_group,
			 size: size ,
			 goods_number_type:goods_number_type
		 };
	 var tpl = template('tpl_type_05', paramObj);

	 $('.editing').after(tpl).remove();
	 $('.app-field').unbind('click');
	  $('.app-field').click(paramObj,bindShowSidebar);
   }
 
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

<!-- ============================================= -->
 
 
 <!-- ==================Template area ======================== -->
 <script id="tpi-grid-stock" type="text/template">   
{{  
	var rowspans = [1];  
	var linesize = 1;
	var itemsLen = items.length;  
	for(var i = items.length - 1 ; i > -1  ; i--){
		rowspans.unshift(linesize *= items[i].subitems.length);  
	} 
	linesize =  rowspans.shift();  
}}


<div class="form-label" style="float: left;width:150px;"  >
	<a class="label-prefix"></a>商品库存<a class="label-required"></a> : 
 </div>

<table class="table goods-stock" style="width: 500px; ">
	<thead>
		<tr> 
{{ 
	for(var i = 0; i < items.length  ; i++){   
}}
			<th style="width: {{=60/items.length}}%;">{{=items[i].value}}</th> 
{{	 
	}	
}}  
			<th style="width: 20%;">原价</th>
			<th style="width: 20%;">单价</th>
			<th style="width: 20%;">库存</th>
		</tr>
	</thead>
	<tbody> 
{{  
	for(var i = 0; i < linesize  ; i++){ 
}}
		<tr>
{{
		for(var j = 0; j < rowspans.length ; j++){ 
			if(i % rowspans[j] == 0){ 
				if(j == 0){
}}
			<td data-spec-id="{{=items[j].subitems[i / rowspans[j]].code }}" rowspan="{{=rowspans[j]}}">{{=items[j].subitems[i / rowspans[j]].value}}</td>  
{{
				}else{
}}
			<td data-spec-id="{{=items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].code}}" rowspan="{{=rowspans[j]}}">{{=items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].value }}</td>

{{
				}
			}
		}

		var ids='';
		for(var j = 0; j < rowspans.length ; j++){  
 			ids +=  items[j].code + '-' + items[j].subitems[parseInt(i / rowspans[j]) % items[j].subitems.length].code + '|'; 
		} 

		ids = ids.substring(0,ids.length-1);
}}
 
			<td><input type="text" name="sku_price" class="js-price"	 data-id="{{=ids}}" data-type="price" data-name="原价" value=""  style="width: 50px;text-align:center;" ></td>
			<td><input type="text" name="sku_price" class="js-unit"	 	 data-id="{{=ids}}" data-type="unit" data-name="单价" value=""  style="width: 50px;text-align:center;" ></td>
			<td><input type="text" name="stock_num" class="js-stock-num" data-id="{{=ids}}" data-type="stock" data-name="库存" value=""  style="width: 50px;text-align:center;" ></td>  
		</tr>
{{ 
	}  
}}

	</tbody>
</table> 
</script>
 
  <script id="tpl_type_00"  type="javascript/html">
	<div class="app-field clearfix editing"  data-field-type="{{type}}" >
		<div class="control-group"> 
			<div style="height: 200px;border: 1px solid red; margin: 5px;"> 
				未实现...
			</div>  
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span>
				<span class="action add">加内容</span>
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
 <script id="tpl_type_01"  type="javascript/html">
	<div class="app-field clearfix editing"  data-field-type="{{type}}" >
		<div class="control-group"> 
			<div class="type01"> 
				<ul>
					<li class="left js-img-left">
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image5.png"  /></span>
					</li>
				</ul>
			</div>  
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span>
				<span class="action add">加内容</span>
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
 <script id="tpl_type_12"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type12"> 
				<ul>
					<li>
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image1.png"  /></span>
					</li>
				</ul>
			</div>  
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span>
				<span class="action add">加内容</span>
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
 <script id="tpl_type_13"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type13"> 
				<ul>
					<li class="left js-img-left">
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image2.png"  /></span>
					</li>
					<li class="right js-img-right">
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image2.png"  /></span>
					</li>
				</ul>
			</div>
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span>
				<span class="action add">加内容</span>
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
<script id="tpl_type_18"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type18"> 
				<ul>
					<li class="left">
						<img  class="dispaly-img" src="/admin/images/widget/good-image3.png"  />
					</li>
					<li class="left">
						<img  class="dispaly-img" src="/admin/images/widget/good-image3.png"  />
					</li>
					<li class="left">
						<img  class="dispaly-img" src="/admin/images/widget/good-image3.png"  />
					</li>
				</ul>
			</div>
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span>
				<span class="action add">加内容</span>
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
 <script id="tpl_type_20"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type19" > 
				<div class="type19-title js-type19-title">热销产品</div>
				<div class="type19-disc" >
					<h3 class="type19-icon type-icon-1">+</h3>
				</div>
			</div> 
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span>
				<span class="action add">加内容</span>
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
 <script id="tpl_type_99"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type99"> 
				<div class="richtext js-richtext">
					富文本区域
				</div>
			</div> 
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span>
				<span class="action add">加内容</span>
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
<script id="tpl_type_05"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}" data-field-size="{{size}}" 
			data-field-goods_number_type="{{goods_number_type}}" data-field-goods_group="{{goods_group}}">
		<div class="control-group">
			<ul class="sc-goods-list clearfix size-{{size}} card {{if size < 3}}pic{{else}}list{{/if}}">
				{{if size == 0}}
				 <!-- 大图  -->
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
					</a>
				</li>
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
					</a>
				</li>
				{{else if size == 1}}
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
				 
				{{else if size == 2}}
				<!-- 一大两小  -->
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				{{else}}
				<!-- 详细列表 -->
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				{{/if}}
				
			</ul>
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">编辑</span> 
				<span class="action add">加内容</span> 
				<span class="action delete">删除</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script> 
<script id="tpl_sidebar_header" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
<%-- 			<div class="control-group">
					<label class="control-label">商品主图片：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							 {{if item.length > 0}}
								{{each item}}
								<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<a href="javascript:void(0);" >
											<img src="{{$value.attachment_url}}" alt="商品图" width="50" height="50">
										</a>
										<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
									</li>
								{{/each}}
							 {{/if}} 
							 
							<li id="li-goods-one-add">
								<a href="javascript:void(0);" class="js-add-one-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
					</div>
				</div> 
	--%>	 			
				<div class="control-group">
					<label class="control-label">商品展示图：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							{{if item2.length > 0}}
								{{each item2}}
								<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<a href="javascript:void(0);" >
											<img src="{{$value.attachment_url}}" alt="商品图" width="50" height="50">
										</a>
										<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
									</li>
								{{/each}}
							 {{/if}} 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
					</div>
				</div> 
			</form>
		</div>
	</div>
</script>  
<script id="tpl_sidebar_01" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label">选择商品：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
					</div>
				</div> 
				<div class="control-group">
						<ul  class="js-img-area"  > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="商品图"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">手输</button>
												<button class="btn js-url-select" type="button">选择</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div> 
			</form>
		</div>
	</div>
</script>
 
<script id="tpl_sidebar_05" type="text/html">
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label">商品来源：</label>
					<div class="controls">
						<label class="combo inline"> 
							<select name="goods_group_list" class="select2">
									<option value="ALL">all</option>
								{{each goods_group_list}} 
									<option value="{{$value.comboKey}}" {{if goods_group == $value.comboKey }}selected=""{{/if}}>{{$value.comboValue}}</option>
								{{/each}}
							</select>
						</label>
					</div>
				</div>
				<div class="control-group" style="display:none;">
					<label class="control-label">显示个数：</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="goods_number_type" value="0" {{if goods_number_type == 0 }}checked=""{{/if}}>6
						</label>
						<label class="radio inline">
							<input type="radio" name="goods_number_type" value="1" {{if goods_number_type == 1 }}checked=""{{/if}}>12
						</label>
						<label class="radio inline">
							<input type="radio" name="goods_number_type" value="2" {{if goods_number_type == 2 }}checked=""{{/if}}>18
						</label>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">列表样式：</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="size" value="0" {{if size == 0 }}checked=""{{/if}}>大图
						</label>
						<label class="radio inline">
							<input type="radio" name="size" value="1" {{if size == 1 }}checked=""{{/if}}>小图
						</label>
<%-- 
						<label class="radio inline">
							<input type="radio" name="size" value="2" {{if size == 2 }}checked=""{{/if}}>一大两小
						</label>
 --%>
						<label class="radio inline">
							<input type="radio" name="size" value="3" {{if size == 3 }}checked=""{{/if}}>详细列表
						</label>
					 	
					</div>
				</div>
			</form>
		</div>
	</div>
</script> 
<script id="tpl_sidebar_12" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label">选择商品：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
					</div>
				</div> 
				<div class="control-group">
						<ul  class="js-img-area"  > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="商品图"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">手输</button>
												<button class="btn js-url-select" type="button">选择</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div> 
			</form>
		</div>
	</div>
</script> 
<script id="tpl_sidebar_13" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label">选择商品111：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
					</div>
				</div> 
				<div class="control-group">
						<ul  class="js-img-area" > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="商品图"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">手输</button>
												<button class="btn js-url-select" type="button">选择</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div>
				<div class="control-group">
        			<label class="control-label"><em class="required">*</em>图片宽度：</label>
        			<div class="controls controls-slider">
						<div  class="js-img-width-slider"></div>
        			</div>
    			</div>
				<div class="control-group inline">
        			<label class="control-label"></label>
        			<div class="controls inline">
            			 左侧图片&nbsp;<input type="text" class="js-img-left-width" readonly  style="width:60px;"  >&nbsp;&nbsp;
						右侧图片&nbsp;<input type="text" class="js-img-right-width" readonly   style="width:60px;"    >
 
        			</div>
    			</div>
			</form>
		</div>
	</div>
</script> 
<script id="tpl_sidebar_18" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label">选择商品：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="control-group">
						<ul  class="js-img-area"  > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="商品图"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">手输</button>
												<button class="btn js-url-select" type="button">选择</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div> 
			</form>
		</div>
	</div>
</script>
<script id="tpl_sidebar_20" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
        			<label class="control-label"><em class="required">*</em>标题名：</label>
        			<div class="controls">
            			<input type="text" name="title" value="{{name}}" maxlength="10"> 
        			</div>
    			</div>
				<div class="control-group">
        			<label class="control-label"><em class="required">*</em>链接地址：</label>
        			<div class="controls">
            			<input type="text" name="url"  value="{{link}}" maxlength="200">
 						<button class="btn js-url-input" type="button">手输</button>
						<button class="btn js-url-select" type="button">选择</button>
        			</div>
    			</div>

				<div class="control-group">
					<label class="control-label">链接图标：</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="linkType" value="1" {{if linkType == 1 }}checked=""{{/if}}>1
						</label>
						<label class="radio inline">
							<input type="radio" name="linkType" value="2"  {{if linkType == 2 }}checked=""{{/if}}>2
						</label>
						<label class="radio inline">
							<input type="radio" name="linkType" value="3" {{if linkType == 3 }}checked=""{{/if}}>3
						</label>
						<label class="radio inline">
							<input type="radio" name="linkType" value="4" {{if linkType == 4}}checked=""{{/if}}>4
						</label>
						<label class="radio inline">
							<input type="radio" name="linkType" value="5" {{if linkType == 5}}checked=""{{/if}}>5
						</label>
					</div>
				</div>
			</form>
		</div>
	</div>
</script>
<script id="tpl_sidebar_99" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<div id="containerWarp">
					 <div id="js-editor" class="js-editor edui-default" style=""></div>
					</div>
				</div> 
				<textarea name="editorValue" id="ueditor_textarea_editorValue" style="display: none;"></textarea>	
			</form>
		</div>
	</div>
</script>
<script id="tpl-modal_goods" type="text/html">
	<table class="table">
		<colgroup>
			<col class="modal-col-img">
			<col class="modal-col-title">
			<col class="modal-col-time" span="2">
			<col class="modal-col-action">
		</colgroup> 
		<!-- 表格头部 -->
		<thead>    
			<tr>
				<th class="title">图片</th>
				<th class="title">名称</th>
				<th class="time">时间</th>
				<th class="opts">操作</th>
			</tr> 
		</thead>
		<!-- 表格数据区 -->
		<tbody> 
		{{each data}} 
			<tr>
				<td class="img"><img src="{{$value.FULL_URL}}" width="50" height="60" /></td> 
				<td class="title">{{$value.FILE_ID}}-{{$value.FILE_NM}}</td> 
				<td class="time">{{$value.CREATED_DT}}</td>
				<td class="opts"> 
					<span class="js-choose choose-btn" data-id="{{$value.FILE_ID}}" data-title="{{$value.FILE_NM}}"  
						data-attachment_url="{{$value.FULL_URL}}"  >选取</span>
				</td> 
			</tr>
		{{/each}}
		
		</tbody>
	</table>
</script>
<script id="tpl-modal_goods_item" type="text/html">
	<li class="sort" data-goods-id="{{tempId}}"> 
		<a href="javascript:void(0);" target="_blank">
		<img src="{{attachment_url}}" alt="商品图" width="50" height="50"></a>
		<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
	</li> 
</script> 
<script id="tpl-modal_goods_item_new" type="text/html">
	<li class="sort" data-goods-id="{{tempId}}"> 
		<div class="div-img-warp">
			<div class="div-img">
				 <a href="javascript:void(0);" >
					<img src="{{attachment_url}}" alt="商品图"  >
				 </a>
				 <a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
			</div>
			<div class="div-img-link">
				URL：<br><input type="text" class="js-link" style="width:240px;" />
				<button class="btn js-url-input" type="button">手输</button>
				<button class="btn js-url-select" type="button">选择</button>
			</div>
		</div>
	</li>
</script> 
<script id="tpl_modal_20" type="text/html">
	<table class="table">
		<colgroup>
			<col class="modal-col-name">
			<col class="modal-col-link" >
			<col class="modal-col-select"  >
		</colgroup> 
		<!-- 表格头部 -->
		<thead>    
			<tr>
				<th class="name">标题</th>
				<th class="link">链接</th>
				<th class="options">
<%--
					<form class="form-search">
	              	<div class="search-warp" style="">  
	                 	<input type="text" class="input-medium" />
						<a href="javascript:void(0);" class="search-btn js-fetch-page"></a>  
					</div>
	            </form>
	            
	            --%>
				</th>
			</tr> 
		</thead>
		<!-- 表格数据区 -->
		<tbody> 
		{{each data}} 
			<tr>
				<td class="name">{{$value.PAGE_NM}}</td> 
				<td class="link">{{$value.URL}}</td>
				<td class="options" > 
					<span class="js-choose choose-btn" href="javascript:void(0);" 
						data-id="{{$value.PAGE_ID}}" data-link="{{$value.URL}}"  
						data-name="{{$value.PAGE_NM}}">选取</span>
				</td> 
			</tr>
		{{/each}}
		</tbody>
	</table>
 </script>
<script id="tpl_goods-search-result" type="text/html">
		{{each data}} 
			 <tr>
			   <td class="textalign" style="text-align: right;">
				 <input type="checkbox" name="goods-checked" data-goods-id="{{$value.GOODS_ID}}" data-gc-id="{{$value.GC_ID_LV2}}" />
			   </td>
				<td>{{$value.GOODS_NM}}</td>
				<td class="js-grid-gc-nm">{{$value.GC_NM_LV1}} > {{$value.GC_NM_LV2}} > {{$value.GC_NM_LV3}}</td>
				<td class="js-grid-gexing-nm">{{$value.CREATED_DT}} </td>
			</tr>
		{{/each}}
 </script>
 
 
 
 <!-- ==================Template area ======================== -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_header_01" tabindex="-1" role="dialog" aria-labelledby="modal_header_01_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >选择图片 | <a class="title-upload js-file-upload" >上传图片</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	        <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_header_01_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_header_01_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_header_02" tabindex="-1" role="dialog" aria-labelledby="modal_header_02_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >选择图片 | <a class="title-upload js-file-upload" >上传图片</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	        <div class="page-navigation" >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_header_02_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_header_02_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    			 
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_01" tabindex="-1" role="dialog" aria-labelledby="modal_01_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >选择图片 | <a class="title-upload js-file-upload" >上传图片</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_01_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_01_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_12" tabindex="-1" role="dialog" aria-labelledby="modal_12_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >选择图片 | <a class="title-upload js-file-upload" >上传图片</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_12_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_12_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade hide" id="modal_13" tabindex="-1" role="dialog" aria-labelledby="modal_13_label" aria-hidden="true">
   <div class="modal-dialog">
     <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >选择图片 | <a class="title-upload js-file-upload" >上传图片</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_13_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_13_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_18" tabindex="-1" role="dialog" aria-labelledby="modal_18_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >选择图片 | <a class="title-upload js-file-upload" >上传图片</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_18_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_18_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_20" tabindex="-1" role="dialog"  aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >选择连接</span> 
             <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
      
         <div class="serachArea" style="padding: 15px 15px 0 15px ; ">
         	<table style="width: 100%;  ">
         		<tr>
         			<td style="width:15%;">标题</td>
         			<td style="width:30%;"><input type="text" id="serachTitle" clsss="js-serach-title" style="width: 90%;margin-bottom: 0;"  ></td>
         			<td style="width:15%;">链接类型</td>
         			<td style="width:30%;">
         				<select data-placeholder="请选择" id="serachLinkType" class="select2" style="width: 99%;"   >
						  <option value=""></option> 
						  <option value="1">1</option> 
						  <option value="2">2</option> 
						  <option value="3">3</option> 
						  <option value="4">4</option> 
						</select>
					</td>
					<td style="width:10%;">
						<span id="modal_20_serach" style=" 
						display: inline-block;
						padding: 2px 10px;
						background: #eee;
						border-radius: 2px;
						border: 1px solid #e5e5e5;
						
						 ">查询</span>
					</td>
         		</tr>
         	</table>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_20_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_20_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 <!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_1_link" tabindex="-1" role="dialog"  aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >新建分类</span> 
             <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="serachArea" style="padding: 15px 15px 0 15px ; ">
         	<table style="width: 100%;  ">
         		<tr>
         			<td style="width:15%;">标题</td>
         			<td style="width:30%;">
         				<input type="text" id="modal_1_link_serach-title" class="js-serach-title" style="width: 90%;margin-bottom: 0;"  >
         			</td>
         			<td style="width:15%;">链接类型</td>
         			<td style="width:30%;">
         				<select data-placeholder="请选择" id="modal_1_link_link-type" class="select2 js-serach-link-type" style="width: 99%;"   >
						  <option value=""></option> 
						  <option value="1">1</option> 
						  <option value="2">2</option> 
						  <option value="3">3</option> 
						  <option value="4">4</option> 
						</select>
					</td>
					<td style="width:10%;">
						<span id="modal_1_link_serach" style=" 
						display: inline-block;
						padding: 2px 10px;
						background: #eee;
						border-radius: 2px;
						border: 1px solid #e5e5e5;
						
						 ">查询</span>
					</td>
         		</tr>
         	</table>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div>
	        <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_1_link_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_1_link_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 <!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_test" tabindex="-1" role="dialog"  aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >添加商品分类</span> 
             <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="serachArea" style="padding: 15px 15px 0 15px ; ">
         	 
         </div>
         <div class="modal-body">
            	 <iframe id="ifr_001" style="zoom: 0.6;" height="540"   src="" frameborder="1" width="99.6%"></iframe> 
         </div>
          <%--<div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div> 
         </div>--%>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 

<script type="text/javascript">
$(function(){
	
	$('#goodsClassAdd').click(function(){
		$('#modal_test').find('.modal-title').text('添加商品分类');
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
		$('#modal_test').find('.modal-title').text('添加商品规格');
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
<!-- modal_header_01 -->

<script type="text/javascript">
function showData(id){
	var $this = $(id);
	$.ajax({
  	 	data:{
  	 		 pageCurr : $this.data('pageNo') || 1
	 		 ,pageUnit : $this.data('pageSize') || 8
  	 	},
		type : "POST",
		url : "/admin/goods/goodsListNew.htm",
		success : function(data) {
			
			$this.find('.modal-body').html(template('tpl-modal_goods', data));
			
			var list = data.data || [];
			if(list.length > 0 ){
				/* $('#modal_header_01_pageSize').text(pageUnit); */
				$( id + '_pageTotal').text(list[0].TOTAL_CNT);
				if(data.fisrtPage){
					$this.find('.js-page-first').removeClass('page-first').addClass('page-first-disabled');
				 }else{
					 $this.find('.js-page-first').removeClass('page-first-disabled').addClass('page-first');
				 }
				 
				 if(data.hasPreviousPage){
					 $this.find('.js-page-preview').removeClass('page-preview-disabled').addClass('page-preview');
				 }else{
					 $this.find('.js-page-preview').removeClass('page-preview').addClass('page-preview-disabled');
				 }
				 if(data.hasNextPage){
					 $this.find('.js-page-next').removeClass('page-next-disabled').addClass('page-next');
				 }else{
					 $this.find('.js-page-next').removeClass('page-next').addClass('page-next-disabled');
				 }
				 
				 if(data.lastPage){
					 $this.find('.js-page-last').removeClass('page-last').addClass('page-last-disabled');
				 }else{
					 $this.find('.js-page-last').removeClass('page-last-disabled').addClass('page-last');
				 }
				 
				 var  totalMsg = '每页'+ data.pageSize + '条, 共' + data.totalCount + '条';
				 $this.find('.js-totalSum').html(totalMsg);
				 
				 var $combo2 = $(id + '_currentPage');
				 $combo2.html('');
				 for(var i = 1; i <= data.totalPageCount ; i++){
					 $combo2.append('<option value="' + i + '">' + i + '</option>');
				 }
				 $combo2.select2('val',data.pageNo).trigger('change.default');
				 
				 $this.data('pageNo',data.pageNo);
				 $this.data('pageSize',data.pageSize);
				 $this.data('totalPageCount',data.totalPageCount);
			}
			
			$this.find('.js-choose').click(function(){
				 if($(this).hasClass('btn-selected')){
					 $(this).removeClass('btn-selected').html('选取');
				 } else{
					 $(this).addClass('btn-selected').html('取消');
				 }
			 });
		},
		error : function(xhr, status, e) {
			alert("error: " + status);
		}
	});
	
}

</script>

<script type="text/javascript">
$(function(){
	
	$('#modal_header_01_currentPage').bind('change.defalut',$.noop);
	$('#modal_header_01_currentPage').bind('change.change',function(){
		$('#modal_header_01').data('pageNo',$(this).val());
		showData('#modal_header_01');
	});
	
	$('#modal_header_01').on('show.bs.modal', function () {
		var id = '#modal_header_01';
		 var $this = $(this);
		 $this.data('pageNo',1);
		 showData(id);
      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
    		var $th = $(this);
    		if($th.attr('class').indexOf('-disabled') > -1 ){
    			return ;
    		}
    		if($th.hasClass('js-page-first')){
    			$this.data('pageNo',1);
    		}else if($th.hasClass('js-page-preview')){
    			var pageNo = $this.data('pageNo') || 1;
    			$this.data('pageNo',_.max([1, --pageNo]));
    		}else if($th.hasClass('js-page-next')){
    			var pageNo = $this.data('pageNo') || 2  ;
    			$this.data('pageNo',++pageNo);
    		}else if($th.hasClass('js-page-last')){
    			$this.data('pageNo',$this.data('totalPageCount'));
    		}
    		showData(id);
    	});
      	
	 });

	$('#modal_header_01').on('shown.bs.modal', function () {
		   var $this = $(this);	  
		  		$this.find('.js-btn-select').unbind('click').click(function(){
		  			if($this.find('.js-choose.btn-selected').size() == 0){
		  				alert('没有选定内容!');
		  				
		  			}else if($this.find('.js-choose.btn-selected').size() == 1){
		  				
		  				//
		  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
					 	var title =$this.find('.js-choose.btn-selected').attr('data-title');
					 	var attachment_url = $this.find('.js-choose.btn-selected').attr('data-attachment_url');
					 
					 	var data =  {
							 tempId:_.random(1000000000, 9999999999),
							 id : id,
							 title:title,
							 attachment_url : attachment_url,
							 linkUrl : ''
						 }
						var tpl =  template('tpl-modal_goods_item', data);
				 
						//$('.module-goods-list #li-goods-one-add').siblings().remove();
						//$('.module-goods-list #li-goods-one-add').before(tpl);
						$('#goods-main-img-add').siblings().remove();
						$('#goods-main-img-add').before(tpl);
		  				
		  				//
						$('#goods-main-img-add').data('field-item',[data]);
						$('#goods-main-img-add').siblings().hover(function(){
						  	$(this).find('.close-modal').removeClass('hide');
				   		} ,function(){
				   			$(this).find('.close-modal').addClass('hide');
				   		});
					  	$('.js-main-img a.close-modal').click(fnRemoveGoodsItem4);
					  	 
						 
					  	$this.modal('hide');
		  				 
		  			}else if($this.find('.js-choose.btn-selected').size() > 1){
		  				alert('只能选择1个!');
		  			}
		  });
		   
	   });
	
})
</script>
<script type="text/javascript">
$(function(){
	
	$('#modal_header_02_currentPage').bind('change.defalut',$.noop);
	$('#modal_header_02_currentPage').bind('change.change',function(){
		$('#modal_header_02').data('pageNo',$(this).val());
		showData('#modal_header_02');
	});
	
	$('#modal_header_02').on('show.bs.modal', function () {
		var id = '#modal_header_02';
		var $this = $(id);
		 $this.data('pageNo',1);
		 showData(id);
      	$( id + ' .page-navi .page-icon').unbind('click').click(function(){
    		var $th = $(this);
    		if($th.attr('class').indexOf('-disabled') > -1 ){
    			return ;
    		}
    		if($th.hasClass('js-page-first')){
    			$this.data('pageNo',1);
    		}else if($th.hasClass('js-page-preview')){
    			var pageNo = $this.data('pageNo') || 1;
    			$this.data('pageNo',_.max([1, --pageNo]));
    		}else if($th.hasClass('js-page-next')){
    			var pageNo = $this.data('pageNo') || 2  ;
    			$this.data('pageNo',++pageNo);
    		}else if($th.hasClass('js-page-last')){
    			$this.data('pageNo',$this.data('totalPageCount'));
    		}
    		showData(id);
    	});
		///
       
		});

	$('#modal_header_02').on('shown.bs.modal', function () {
		   var $this = $(this);	  
		  		$this.find('.js-btn-select').unbind('click').click(function(){
		  			if($this.find('.js-choose.btn-selected').size() == 0){
		  				alert('没有选定内容!');
		  				return;
		  			}
		  			////////////
		  			var array  =  $('.app-field.editing').attr('data-field-item2') || '[]' ;
					array = JSON.parse(array);
	  		
		  			$this.find('.js-choose.btn-selected').each(function(){
		  				var id = $(this).attr('data-id');
						var title =$(this).attr('data-title');
						var attachment_url = $(this).attr('data-attachment_url');
						 
						var data =  {
								tempId:_.random(1000000000, 9999999999),
								id : id,
								title:title,
								attachment_url : attachment_url,
								linkUrl : ''
						}
						array.push(data);
					 });
		  		 
		  			array = _.last(array, 5);
		  			$('.app-field.editing').attr('data-field-item2',JSON.stringify(array));
		  			
		  			$('.module-goods-list #li-goods-add').siblings().remove();
		  			for(var i = 0 ; i < array.length;i++){
		  				var tpl =  template('tpl-modal_goods_item', array[i]);
						$('.module-goods-list #li-goods-add').before(tpl);
		  			}
		  			
		  			$('.module-goods-list li.sort').hover(function(){
					  	$(this).find('.close-modal').removeClass('hide');
			   		} ,function(){
			   			$(this).find('.close-modal').addClass('hide');
			   		});
				  	$('.module-goods-list a.close-modal').click(fnRemoveGoodsItem2);
					$this.modal('hide');
		  			/////////////
		  			 
		  });
	   });
	
})
</script>
<script type="text/javascript">
$(function(){
	$('#modal_01_currentPage').bind('change.defalut',$.noop);
	$('#modal_01_currentPage').bind('change.change',function(){
		$('#modal_01').data('pageNo',$(this).val());
		showData('#modal_01');
	});
	
	$('#modal_01').on('show.bs.modal', function () {
		var id = '#modal_01';
		 var $this = $(this);
		 $this.data('pageNo',1);
		 showData(id);
      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
    		var $th = $(this);
    		if($th.attr('class').indexOf('-disabled') > -1 ){
    			return ;
    		}
    		if($th.hasClass('js-page-first')){
    			$this.data('pageNo',1);
    		}else if($th.hasClass('js-page-preview')){
    			var pageNo = $this.data('pageNo') || 1;
    			$this.data('pageNo',_.max([1, --pageNo]));
    		}else if($th.hasClass('js-page-next')){
    			var pageNo = $this.data('pageNo') || 2  ;
    			$this.data('pageNo',++pageNo);
    		}else if($th.hasClass('js-page-last')){
    			$this.data('pageNo',$this.data('totalPageCount'));
    		}
    		showData(id);
    	});
      	
	 });

	   $('#modal_01').on('shown.bs.modal', function () {
		   var $this = $(this);	  
	   		$this.find('.js-btn-select').unbind('click').click(function(){
	   			$this.find('.js-choose.btn-selected').each(function(){
	   				var id = $(this).attr('data-id');
					 var title =$(this).attr('data-title');
					 var attachment_url = $(this).attr('data-attachment_url');
					 
					 var data =  {
							 tempId:_.random(1000000000, 9999999999),
							 id : id,
							 title:title,
							 attachment_url : attachment_url,
							 linkUrl : ''
						 }
					var tpl =  template('tpl-modal_goods_item_new', data);
				 
					$('.js-img-area').append(tpl);
					  
					var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
					array = JSON.parse(array);
					array.push(data);
					$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
	   				
	   			});
	   			
	   			$('.js-img-area li.sort').hover(function(){
				  	$(this).find('.close-modal').removeClass('hide');
		   		} ,function(){
		   			$(this).find('.close-modal').addClass('hide');
		   		});
			  	$('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem);
	   			
	   			$('.js-img-area .js-url-input').unbind('click').click(function(){
			  		
			  		alert('shoudong');
			  	});
			  	$('.js-img-area .js-url-select').unbind('click').click(function(){
			  		
			  		$this = $(this);
			  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
			  		
			  		$('#modal_1_link').modal({
					  	backdrop: 'static', 
					  	keyboard: false
					  	//,  remote:'/admin/goods/list.htm'
					 }).css({  
						  width: '600px',  
						 'margin-left': function () {  
						    return -($(this).width() / 2);  
						   }  
					});  
			  	});
			  	
			  	
			  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
					   var val = $(this).val();
					   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
					    
					    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
						array = JSON.parse(array);
						for(var i= 0 ; i < array.length ; i++){
							if(array[i].tempId == tempId){
								array[i].linkUrl = val || '';
								$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
								break;
							}
						}
						//array.push(data);
						//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
					    
				   });
	   			
	   			$this.modal('hide');
	  			 
	  		});
	   	 
	    });
	
})
</script>
<script type="text/javascript">
$(function(){
	$('#modal_12_currentPage').bind('change.defalut',$.noop);
	$('#modal_12_currentPage').bind('change.change',function(){
		$('#modal_12').data('pageNo',$(this).val());
		showData('#modal_12');
	});
	
	$('#modal_12').on('show.bs.modal', function () {
		var id = '#modal_12';
		 var $this = $(this);
		 $this.data('pageNo',1);
		 showData(id);
      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
    		var $th = $(this);
    		if($th.attr('class').indexOf('-disabled') > -1 ){
    			return ;
    		}
    		if($th.hasClass('js-page-first')){
    			$this.data('pageNo',1);
    		}else if($th.hasClass('js-page-preview')){
    			var pageNo = $this.data('pageNo') || 1;
    			$this.data('pageNo',_.max([1, --pageNo]));
    		}else if($th.hasClass('js-page-next')){
    			var pageNo = $this.data('pageNo') || 2  ;
    			$this.data('pageNo',++pageNo);
    		}else if($th.hasClass('js-page-last')){
    			$this.data('pageNo',$this.data('totalPageCount'));
    		}
    		showData(id);
    	});
      	
	 });
 
	   $('#modal_12').on('shown.bs.modal', function () {
		   var $this = $(this);	  
		  		$this.find('.js-btn-select').unbind('click').click(function(){
		  			if($this.find('.js-choose.btn-selected').size() == 0){
		  				alert('没有选定内容!');
		  				
		  			}else if($this.find('.js-choose.btn-selected').size() == 1){
		  				
		  				//
		  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
					 	var title =$this.find('.js-choose.btn-selected').attr('data-title');
					 	var attachment_url = $this.find('.js-choose.btn-selected').attr('data-attachment_url');
					 
					 	var data =  {
							 tempId:_.random(1000000000, 9999999999),
							 id : id,
							 title:title,
							 attachment_url : attachment_url,
							 linkUrl : ''
						 }
						var tpl =  template('tpl-modal_goods_item_new', data);
					 	//alert(attachment_url);
				 
						$('.js-img-area').html(tpl);
						//$('.module-goods-list #li-goods-add').siblings().remove();
						//$('.module-goods-list #li-goods-add').before(tpl);
		  				
						
		  				//
						$('.app-field.editing').attr('data-field-item',JSON.stringify([data]));
		  				
						$('.app-field.editing').find('.type12').find('img').attr('src',attachment_url);
						
						
						$('.js-img-area li.sort').hover(function(){
						  	$(this).find('.close-modal').removeClass('hide');
				   		} ,function(){
				   			$(this).find('.close-modal').addClass('hide');
				   		});
					  	$('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem2);
			   			
			   			$('.js-img-area .js-url-input').unbind('click').click(function(){
					  		
					  		 
					  	});
					  	$('.js-img-area .js-url-select').unbind('click').click(function(){
					  		
					  		$this = $(this);
					  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
					  		
					  		$('#modal_1_link').modal({
							  	backdrop: 'static', 
							  	keyboard: false
							  	//,  remote:'/admin/goods/list.htm'
							 }).css({  
								  width: '600px',  
								 'margin-left': function () {  
								    return -($(this).width() / 2);  
								   }  
							});  
					  	});
					  	
					  	
					  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
							   var val = $(this).val();
							   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
							    
							    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
								array = JSON.parse(array);
								for(var i= 0 ; i < array.length ; i++){
									if(array[i].tempId == tempId){
										array[i].linkUrl = val || '';
										$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
										break;
									}
								}
								//array.push(data);
								//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
							    
						   });
						 
					  	$this.modal('hide');
		  				 
		  			}else if($this.find('.js-choose.btn-selected').size() > 1){
		  				alert('只能选择1个!');
		  			}
		  });
	   });
	
})
</script>
<script type="text/javascript">
$(function(){
	$('#modal_13_currentPage').bind('change.defalut',$.noop);
	$('#modal_13_currentPage').bind('change.change',function(){
		$('#modal_13').data('pageNo',$(this).val());
		showData('#modal_13');
	});
	
	$('#modal_13').on('show.bs.modal', function () {
		var id = '#modal_13';
		 var $this = $(this);
		 $this.data('pageNo',1);
		 showData(id);
      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
    		var $th = $(this);
    		if($th.attr('class').indexOf('-disabled') > -1 ){
    			return ;
    		}
    		if($th.hasClass('js-page-first')){
    			$this.data('pageNo',1);
    		}else if($th.hasClass('js-page-preview')){
    			var pageNo = $this.data('pageNo') || 1;
    			$this.data('pageNo',_.max([1, --pageNo]));
    		}else if($th.hasClass('js-page-next')){
    			var pageNo = $this.data('pageNo') || 2  ;
    			$this.data('pageNo',++pageNo);
    		}else if($th.hasClass('js-page-last')){
    			$this.data('pageNo',$this.data('totalPageCount'));
    		}
    		showData(id);
    	});
      	
	 });
 
	   $('#modal_13').on('shown.bs.modal', function () {
		   var $this = $(this);	  
		  		$this.find('.js-btn-select').unbind('click').click(function(){
		  			if($this.find('.js-choose.btn-selected').size() < 1){
		  				alert('没有选定内容!');
		  			}else if($this.find('.js-choose.btn-selected').size() >2){
		  				alert('只能选择2个图片!');
		  			}else{

		  		////////////
		  				var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
						array = JSON.parse(array);
		  		
			  			$this.find('.js-choose.btn-selected').each(function(){
			  				var id = $(this).attr('data-id');
							var title =$(this).attr('data-title');
							var attachment_url = $(this).attr('data-attachment_url');
							 
							var data =  {
									tempId:_.random(1000000000, 9999999999),
									id : id,
									title:title,
									attachment_url : attachment_url,
									linkUrl : ''
							}
							array.push(data);
						 });
			  		 
			  			array = _.last(array, 2);
			  			$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
			  			
			  			$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image2.png');
			  			for(var i = 0; i < array.length; i++){
			  				$('.app-field.editing').find('.dispaly-img')[i].src = array[i].attachment_url;
			  			}
			  			 
			  			
			  			
			  			$('.js-img-area').html('');
			  			
			  			//$('.module-goods-list #li-goods-add').siblings().remove();
			  			for(var i = 0 ; i < array.length;i++){
			  				//var tpl =  template('tpl-modal_goods_item', array[i]);
							//$('.module-goods-list #li-goods-add').before(tpl);
							
							var tpl =  template('tpl-modal_goods_item_new', array[i]);
							$('.js-img-area').append(tpl);
			  			}
			  			 
			  			$('.js-img-area li.sort').hover(function(){
						  	$(this).find('.close-modal').removeClass('hide');
				   		} ,function(){
				   			$(this).find('.close-modal').addClass('hide');
				   		});
					  	$('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem);
			   			
			   			$('.js-img-area .js-url-input').unbind('click').click(function(){
					  		 
					  	});
					  	$('.js-img-area .js-url-select').unbind('click').click(function(){
					  		
					  		$this = $(this);
					  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
					  		
					  		$('#modal_1_link').modal({
							  	backdrop: 'static', 
							  	keyboard: false
							  	//,  remote:'/admin/goods/list.htm'
							 }).css({  
								  width: '600px',  
								 'margin-left': function () {  
								    return -($(this).width() / 2);  
								   }  
							});  
					  	});
					  	
					  	
					  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
							   var val = $(this).val();
							   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
							    
							    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
								array = JSON.parse(array);
								for(var i= 0 ; i < array.length ; i++){
									if(array[i].tempId == tempId){
										array[i].linkUrl = val || '';
										$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
										break;
									}
								}
								//array.push(data);
								//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
							    
						   });
			  			
			  			 $this.modal('hide');
		  			} 
		  });
	   });
	   
	
})
</script>
<script type="text/javascript">
$(function(){
	$('#modal_18_currentPage').bind('change.defalut',$.noop);
	$('#modal_18_currentPage').bind('change.change',function(){
		$('#modal_18').data('pageNo',$(this).val());
		showData('#modal_18');
	});
	
	$('#modal_18').on('show.bs.modal', function () {
		var id = '#modal_18';
		 var $this = $(this);
		 $this.data('pageNo',1);
		 showData(id);
      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
    		var $th = $(this);
    		if($th.attr('class').indexOf('-disabled') > -1 ){
    			return ;
    		}
    		if($th.hasClass('js-page-first')){
    			$this.data('pageNo',1);
    		}else if($th.hasClass('js-page-preview')){
    			var pageNo = $this.data('pageNo') || 1;
    			$this.data('pageNo',_.max([1, --pageNo]));
    		}else if($th.hasClass('js-page-next')){
    			var pageNo = $this.data('pageNo') || 2  ;
    			$this.data('pageNo',++pageNo);
    		}else if($th.hasClass('js-page-last')){
    			$this.data('pageNo',$this.data('totalPageCount'));
    		}
    		showData(id);
    	});
      	
	 });

	   $('#modal_18').on('shown.bs.modal', function () {
		   var $this = $(this);	  
		   
		  		$this.find('.js-btn-select').unbind('click').click(function(){
		  			if($this.find('.js-choose.btn-selected').size() < 1){
		  				alert('没有选定内容!');
		  			}else if($this.find('.js-choose.btn-selected').size() >3){
		  				alert('只能选择3个图片!');
		  			}else{

		  				var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
						array = JSON.parse(array);
		  		
			  			$this.find('.js-choose.btn-selected').each(function(){
			  				var id = $(this).attr('data-id');
							var title =$(this).attr('data-title');
							var attachment_url = $(this).attr('data-attachment_url');
							 
							var data =  {
									tempId:_.random(1000000000, 9999999999),
									id : id,
									title:title,
									attachment_url : attachment_url,
									linkUrl : ''
							}
							array.push(data);
						 });
			  		 
			  			array = _.last(array, 3);
			  			$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
			  			$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image3.png');
			  			for(var i = 0; i < array.length; i++){
			  				$('.app-field.editing').find('.dispaly-img')[i].src = array[i].attachment_url;
			  			}
			  			
			  			$('.js-img-area').html('');
			  			
			  			//$('.module-goods-list #li-goods-add').siblings().remove();
			  			for(var i = 0 ; i < array.length;i++){
			  				//var tpl =  template('tpl-modal_goods_item', array[i]);
							//$('.module-goods-list #li-goods-add').before(tpl);
							
							var tpl =  template('tpl-modal_goods_item_new', array[i]);
							$('.js-img-area').append(tpl);
			  			}
			  			 
			  			$('.js-img-area li.sort').hover(function(){
						  	$(this).find('.close-modal').removeClass('hide');
				   		} ,function(){
				   			$(this).find('.close-modal').addClass('hide');
				   		});
					  	$('.js-img-area a.close-modal').unbind('click').click(fnRemoveGoodsItem3);
			   			
			   			$('.js-img-area .js-url-input').unbind('click').click(function(){
					  		
					  		alert('shoudong');
					  	});
					  	$('.js-img-area .js-url-select').unbind('click').click(function(){
					  		
					  		$this = $(this);
					  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
					  		
					  		$('#modal_1_link').modal({
							  	backdrop: 'static', 
							  	keyboard: false
							  	//,  remote:'/admin/goods/list.htm'
							 }).css({  
								  width: '600px',  
								 'margin-left': function () {  
								    return -($(this).width() / 2);  
								   }  
							});  
					  	});
					  	
					  	
					  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
							   var val = $(this).val();
							   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
							    
							    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
								array = JSON.parse(array);
								for(var i= 0 ; i < array.length ; i++){
									if(array[i].tempId == tempId){
										array[i].linkUrl = val || '';
										$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
										break;
									}
								}
								//array.push(data);
								//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
							    
						   });
			  			
			  			 $this.modal('hide');
		  			} 
		  });
	   });
	
})
</script>
<script type="text/javascript">
function showLinkData(id){
	
	var serachTitle = '';
	var serachLinkType = '';
	
	if(id == '#modal_20'){
		serachTitle = $('#serachTitle').val();
		serachLinkType = $('#serachLinkType').val()
	}else if(id == '#modal_1_link'){
		serachTitle = $('#modal_1_link_serach-title').val();
		serachLinkType = $('#modal_1_link_link-type').val()
	}
	
	var $this = $(id);
	$.ajax({
  	 	data:{
  	 		  pageCurr : $this.data('pageNo') || 1
	 		 ,pageUnit : $this.data('pageSize') || 10
	 		 ,serachTitle : serachTitle
	  	 	  ,serachLinkType : serachLinkType
  	 	},
		type : "POST",
		url : "/admin/goods/linkList.htm",
		success : function(data) {
			$this.find('.modal-body').html(template('tpl_modal_20', data));
			
			var list = data.data || [];
			if(list.length > 0 ){
				/* $('#modal_header_01_pageSize').text(pageUnit); */
				$( id + '_pageTotal').text(list[0].TOTAL_CNT);
				if(data.fisrtPage){
					$this.find('.js-page-first').removeClass('page-first').addClass('page-first-disabled');
				 }else{
					 $this.find('.js-page-first').removeClass('page-first-disabled').addClass('page-first');
				 }
				 
				 if(data.hasPreviousPage){
					 $this.find('.js-page-preview').removeClass('page-preview-disabled').addClass('page-preview');
				 }else{
					 $this.find('.js-page-preview').removeClass('page-preview').addClass('page-preview-disabled');
				 }
				 if(data.hasNextPage){
					 $this.find('.js-page-next').removeClass('page-next-disabled').addClass('page-next');
				 }else{
					 $this.find('.js-page-next').removeClass('page-next').addClass('page-next-disabled');
				 }
				 
				 if(data.lastPage){
					 $this.find('.js-page-last').removeClass('page-last').addClass('page-last-disabled');
				 }else{
					 $this.find('.js-page-last').removeClass('page-last-disabled').addClass('page-last');
				 }
				 
				 var  totalMsg = '每页'+ data.pageSize + '条, 共' + data.totalCount + '条';
				 $this.find('.js-totalSum').html(totalMsg);
				 
				 var $combo2 = $(id + '_currentPage');
				 $combo2.html('');
				 for(var i = 1; i <= data.totalPageCount ; i++){
					 $combo2.append('<option value="' + i + '">' + i + '</option>');
				 }
				 $combo2.select2('val',data.pageNo).trigger('change.default');
				 
				 $this.data('pageNo',data.pageNo);
				 $this.data('pageSize',data.pageSize);
				 $this.data('totalPageCount',data.totalPageCount);
			}
			
			$this.find('.js-choose').click(function(){
				 if($(this).hasClass('btn-selected')){
					 $(this).removeClass('btn-selected').html('选取');
				 } else{
					 $(this).addClass('btn-selected').html('取消');
				 }
			 });
		},
		error : function(xhr, status, e) {
			alert("error: " + status);
		}
	});
}

$(function(){
	$('#modal_20_currentPage').bind('change.defalut',$.noop);
	$('#modal_20_currentPage').bind('change.change',function(){
		$('#modal_20').data('pageNo',$(this).val());
		showLinkData('#modal_20');
	});
	
	$('#modal_20').on('show.bs.modal', function () {
		var id = '#modal_20';
		 var $this = $(this);
		 $this.data('pageNo',1);
		 showLinkData(id);
      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
    		var $th = $(this);
    		if($th.attr('class').indexOf('-disabled') > -1 ){
    			return ;
    		}
    		if($th.hasClass('js-page-first')){
    			$this.data('pageNo',1);
    		}else if($th.hasClass('js-page-preview')){
    			var pageNo = $this.data('pageNo') || 1;
    			$this.data('pageNo',_.max([1, --pageNo]));
    		}else if($th.hasClass('js-page-next')){
    			var pageNo = $this.data('pageNo') || 2  ;
    			$this.data('pageNo',++pageNo);
    		}else if($th.hasClass('js-page-last')){
    			$this.data('pageNo',$this.data('totalPageCount'));
    		}
    		showLinkData(id);
    	});
      	
	 });
   
   $('#modal_20').on('shown.bs.modal', function () {
		   var $this = $(this);	
		   $('#modal_20_serach').unbind('click').click(function(){
			   showLinkData('#modal_20');
		   });
		   
	  		$this.find('.js-btn-select').unbind('click').click(function(){ 
	  			if($this.find('.js-choose.btn-selected').size() > 0){
	  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
					 var link = $this.find('.js-choose.btn-selected').attr('data-link');
					 var name = $this.find('.js-choose.btn-selected').attr('data-name');
					 var data =  {
							 id : id,
							 link : link,
							 name : name  
						 }
					 
					 //$('.app-field.editing').attr('data-field-item',JSON.stringify(data));
					 $('.app-field.editing').attr('data-field-id',id).attr('data-field-link',link).attr('data-field-name',name)  ;
					 $('.app-field.editing').find('.js-type19-title').html(name);
					 
					 $('.js-sidebar-region [name=title]').val(name);
					 $('.js-sidebar-region [name=url]').val(link);
					 
					 $this.modal('hide');
	  			}else{
	  				alert('没有选定内容!');
	  			}
	  });
   });
   
	
})
</script>
<script type="text/javascript">
$(function(){
	$('#modal_1_link_currentPage').bind('change.defalut',$.noop);
	$('#modal_1_link_currentPage').bind('change.change',function(){
		$('#modal_1_link').data('pageNo',$(this).val());
		showLinkData('#modal_1_link');
	});
	
	
	$('#modal_1_link').on('show.bs.modal', function () {
			var id = '#modal_1_link';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showLinkData(id);
	     	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	   		var $th = $(this);
	   		if($th.attr('class').indexOf('-disabled') > -1 ){
	   			return ;
	   		}
	   		if($th.hasClass('js-page-first')){
	   			$this.data('pageNo',1);
	   		}else if($th.hasClass('js-page-preview')){
	   			var pageNo = $this.data('pageNo') || 1;
	   			$this.data('pageNo',_.max([1, --pageNo]));
	   		}else if($th.hasClass('js-page-next')){
	   			var pageNo = $this.data('pageNo') || 2  ;
	   			$this.data('pageNo',++pageNo);
	   		}else if($th.hasClass('js-page-last')){
	   			$this.data('pageNo',$this.data('totalPageCount'));
	   		}
	   		showLinkData(id);
	   	});   	 
    });
   
   $('#modal_1_link').on('shown.bs.modal', function () {
		   var $this = $(this);	
		   $('#modal_1_link_serach').unbind('click').click(function(){ 
			   showLinkData('#modal_1_link');
		   });
		   
	  		$this.find('.js-btn-select').unbind('click').click(function(){ 
	  			if($this.find('.js-choose.btn-selected').size() > 0){
	  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
					 var link = $this.find('.js-choose.btn-selected').attr('data-link');
					 var name = $this.find('.js-choose.btn-selected').attr('data-name');
					 var data =  {
					 	link : link 
					 }
					 $('.js-img-area .js-active').find('input').val(link).trigger('keypress');
					 $this.modal('hide');
	  			}else{
	  				alert('没有选定内容!');
	  			}
	  	});
   });
	
   
   
	$('#modal_1_link').on('show.bs.modal', function (event) {
	   //alert('show.bs.modal');
	   //var button = $(event.relatedTarget) // Button that triggered the modal
	   /****
	   var recipient = button.data('whatever') // Extract info from data-* attributes
	   // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	   // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	   var modal = $(this)
	   modal.find('.modal-title').text('New message to ' + recipient)
	   modal.find('.modal-body input').val(recipient)
	   
	   ***/
	});
   	$('#modal_1_link').on('shown.bs.modal', function (event) {
	   //alert('shown.bs.modal');
	   /****
	   var button = $(event.relatedTarget) // Button that triggered the modal
	   var recipient = button.data('whatever') // Extract info from data-* attributes
	   // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	   // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	   var modal = $(this)
	   modal.find('.modal-title').text('New message to ' + recipient)
	   modal.find('.modal-body input').val(recipient)
	   
	   ***/
	});
   	$('#modal_1_link').on('hide.bs.modal', function (event) {
	   //alert('hide.bs.modal');
	});
   	$('#modal_1_link').on('hidden.bs.modal', function (event) {
	   //alert('hidden.bs.modal');
	});
   	$('#modal_1_link').on('loaded.bs.modal', function (event) {
	   //alert('loaded.bs.modal');
	});
   
})
</script>
<script type="text/javascript">
$(function(){
	
	
})
</script>
<script type="text/javascript">
$(function(){
	
	
})
</script>
<script type="text/javascript">
$(function(){
	
	
})
</script>

<script type="text/javascript">
   
   function fnRemoveGoodsItem(){
		
		var tempId = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
	  	var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
		array = JSON.parse(array);
	    var array2 =[];
		for(var i in array){
		 	if(array[i].tempId != tempId ){
		    	array2.push(array[i]);
		 	} 
		} 
		$('.app-field.editing').attr('data-field-item',JSON.stringify(array2));
		
		$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image2.png');
		for(var i = 0; i < array2.length; i++){
			$('.app-field.editing').find('.dispaly-img')[i].src = array2[i].attachment_url;
		}
			 
   }
   
   function fnRemoveGoodsItem2(){
		var id = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
		$('.app-field.editing').attr('data-field-item','');
		$('.app-field.editing').find('.type12').find('img').attr('src','/admin/images/widget/good-image1.png');
  }
   
   function fnRemoveGoodsItem3(){
		
		var tempId = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
	  	var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
		array = JSON.parse(array);
	    var array2 =[];
		for(var i in array){
		 	if(array[i].tempId != tempId ){
		    	array2.push(array[i]);
		 	} 
		} 
		$('.app-field.editing').attr('data-field-item',JSON.stringify(array2));
		
		$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image3.png');
		for(var i = 0; i < array2.length; i++){
			$('.app-field.editing').find('.dispaly-img')[i].src = array2[i].attachment_url;
		}
			 
  }
   
   function fnRemoveGoodsItem4(){
		var id = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
		$('#goods-main-img-add').data('field-item','');
		 
 }
	  	
</script>
<!-- ============================================= -->
	<script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>
</body>
</html>