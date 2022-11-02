<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="主页"/></title>  
<script type="text/javascript">
$(function(){
 	$('.js-tabs .tabpanel-header-item').click(function(){
 		$(this).addClass('on').siblings().removeClass('on');
 		var index = $(this).data('index');
  		var target =  '.' + $(this).data('target');
  		$(target).each(function(idx){
  			if($(this).data('index') == index){
  				$(this).show();
  			}else{
  				$(this).hide();
  			}
  		});
  	});
})
function showPage(){};

function tempShowTab(url){
	
	
	if('${backUserSession.userId}' != 'admin') return false;
	
	/* parent.ggShowTab({
		'url' : url || '',
		'name' : '<ui:i18n key="所有订单"/>',
		'icon' : 'shopoperation' 
	});   */
	/* parent.ggShowTab({
		'url' : '/admin/shop/transport/sheetList.htm',
		'name' : '<ui:i18n key="运费标准管理"/>temp',
		'icon' : 'shopoperation' 
	});  
	 */
	/* parent.ggShowTab({
		'url' : '/admin/report/newsfeedSummary.htm',
		'name' : '<ui:i18n key="newsfeed"/>',
		'icon' : 'data' 
	});  */ 
	
/* 	parent.ggShowTab({
		'url' : '/admin/report/custStatus.htm',
		'name' : '<ui:i18n key="newsfeed"/>',
		'icon' : 'data' 
	});  */ 
/* 	parent.ggShowTab({
		'url' : '/admin/weixin/menu/menuList.htm',
		'name' : '<ui:i18n key="menulist"/>',
		'icon' : 'data' 
	});   */
	/* parent.ggShowTab({
		'url' : '/admin/weixin/reply/auto.htm',
		'name' : '<ui:i18n key="auto replay"/>',
		'icon' : 'shopoperation' 
	});   */
  /* 	parent.ggShowTab({
		'url' : '/admin/goods/display/displayCreate.htm',
		'name' : '<ui:i18n key="displayCreate"/>',
		'icon' : 'shopoperation' 
	});   
 	parent.ggShowTab({
		'url' : '/admin/goods/display/displayModify.htm?displayId=10167',
		'name' : '<ui:i18n key="displayModify"/>',
		'icon' : 'shopoperation' 
	});   */
  /* 	parent.ggShowTab({
		'url' : '/admin/blog/blogCreate.htm',
		'name' : '<ui:i18n key="blogCreate"/>',
		'icon' : 'shopoperation' 
	});    */
  /* 	parent.ggShowTab({
		'url' : '/admin/weixin/material/newsfeedList.htm',
		'name' : '<ui:i18n key="wechat"/>',
		'icon' : 'wechat' 
	});   */ 
  /* 	parent.ggShowTab({
		'url' : '/admin/weixin/mass/massMain.htm',
		'name' : '<ui:i18n key="qunfa"/>',
		'icon' : 'wechat' 
	});  */  
   /*  	parent.ggShowTab({
		'url' : '/admin/goods/goods/sellList.htm',
		'name' : '<ui:i18n key="qunfa"/>',
		'icon' : 'wechat' 
	});  */  
    /* 	parent.ggShowTab({
		'url' : '/admin/goods/goods/selloutList.htm',
		'name' : '<ui:i18n key="qunfa"/>',
		'icon' : 'wechat' 
	}); */   
    parent.ggShowTab({
		'url' : '/admin/goods/goods/storeList.htm',
		'name' : '<ui:i18n key="qunfa"/>',
		'icon' : 'wechat' 
	});   
    parent.ggShowTab({
		'url' : '/admin/report/cust/custAnalyze.htm',
		'name' : '<ui:i18n key="qunfa"/>',
		'icon' : 'wechat' 
	});   
}
</script>
<script type="text/javascript">
$(function(){
	
	$('.js-serach').click(function(){
		$('.form-table').initForm();
		
		/*   function(){
			$(':input',$(this))
			.not(':button, :submit, :reset, :hidden')
			.val('')
			.removeAttr('checked')
			.removeAttr('selected');
		} */
	});
});

function showPopup(){
	
	if('${backUserSession.userId}' != 'admin') return false;
	
	 showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="选择图片"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/picture.htm?fileGroup=2&max=3' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																		// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																		// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																		// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
		});	 		
}

//弹出窗口
function choosePicture(obj){
	 console.log('-------parent');
	 //obj为返回的数组 格式 
	/*  [
	  {
		  "fileId" : ...
		  ,"fileNm" : ...
		  ,"fileUrl" : ...
	  },
	  {
		  "fileId" : ...
		  ,"fileNm" : ...
		  ,"fileUrl" : ...
	  }
	  ] */
	 //这里写自己的逻辑
	
	 
	 closeWindow();
	}
//关闭窗口	
function closeWindow(){
	 closeBpopupWindow('bpopupPicture');
	}
</script>
 
</head>
<body>
	 
		  	<!-- ▼ 查询表单区域  --> 
			<!-- ▲ 查询表单区域  -->
		<div class="container">
		
			<div>
				
			</div>
		
		
			<div class="demotitle" onclick="showPopup()">Modal With Iframe</div>
			
			
			<hr/>
			
			<div class="demotitle" onclick="">表单查询域</div>
		  	<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="20%" />
	       		 			<col width="30%" />
	       		 			<col width="20%" />
	       		 			<col width="30%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel">text：</td>
	       		 			<td class="fcomp"><input type="text" /></td>
	       		 			<td class="flabel">下拉框：</td>
	       		 			<td class="fcomp">
	       		 				<select class="select2" style="width: 100%;">
	       		 					<option>请选择</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 					<option value="1">22222</option>
	       		 				</select>
	       		 			</td>
	       		 		</tr>
	       		 		<tr>
	       		 			<td class="flabel last" >订单号：</td>
	       		 			<td class="fcomp last">
	       		 				<input class="icradio" type="radio" name="iCheck">&nbsp;&nbsp;Yes
	       		 				&nbsp;&nbsp;&nbsp;
	       		 				<input class="icradio" type="radio" name="iCheck" checked>&nbsp;No
	       		 			</td>
	       		 			<td class="flabel last">付款方式：</td>
	       		 			<td class="fcomp last">
								<input class="iccheckbox" type="checkbox">&nbsp;蓝色
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="iccheckbox" type="checkbox" checked>&nbsp;紫色
							</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		
	       		 
	       		<!-- -->
	       		<div class="butttn-area m2" >
	       		   <span class="button js-serach">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询 "/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	      	
	      	
	      	
	      	<!-- ▼ Tab  --> 
	     <div class="demotitle" onclick="tempShowTab('/admin/orders/orderList.htm');">Tab</div>
	      	<div class="tabpanel">
	      			<div class="tabpanel-header">
	      				<div class="js-tabs tabpanel-header-items clearfix">
	      					<div class="tabpanel-header-item on"  data-index="1" data-target="tabpanel-content">所有订单<span class="num"></span></div>
	      					<div class="tabpanel-header-item"  data-index="2" data-target="tabpanel-content">待付款<span class="num">(9999)</span></div>
	      					<div class="tabpanel-header-item"  data-index="3" data-target="tabpanel-content">待发货<span class="num">(12)</span></div>
	      					<div class="tabpanel-header-item"  data-index="4" data-target="tabpanel-content">已发货<span class="num"></span></div>
	      					<div class="tabpanel-header-item"  data-index="5" data-target="tabpanel-content">已签收<span class="num"></span></div>
	      					<div class="tabpanel-header-item"  data-index="6" data-target="tabpanel-content">交易成功<span class="num"></span></div>
	      					<div class="tabpanel-header-item"  data-index="7" data-target="tabpanel-content">退款订单<span class="num"></span></div>
	      					<div class="tabpanel-header-item"  data-index="8" data-target="tabpanel-content">退款成功<span class="num"></span></div>
	      				</div>
	      				
	      				<div class="tabpanel-tools">
	      				   <span class="tabpanel-tool">
			       		   	  <img alt="" src="/admin/images/v2-icons/ico_export.png" />
							   <span class="tool-name"><ui:i18n key="批量导出"/></span> 
			       		   </span>
	      				</div>
	      			</div>
	      			<div class="js-tabs-contents tabpanel-contents">
	 					<div class="tabpanel-content" data-index="1">11111111</div>
	 					<div class="tabpanel-content" data-index="2" style="display: none;">222</div>
	 					<div class="tabpanel-content" data-index="3" style="display: none;">333</div>
	 					<div class="tabpanel-content" data-index="4" style="display: none;">444</div>
	 					<div class="tabpanel-content" data-index="5" style="display: none;">55555</div>
	 					<div class="tabpanel-content" data-index="6" style="display: none;">666</div>
	 					<div class="tabpanel-content" data-index="7" style="display: none;">777</div>
	 					<div class="tabpanel-content" data-index="8" style="display: none;">8888</div>
	      			</div>
	      	</div>
	      	<!-- ▲ Tab  -->	
	      	
	      	<!-- ▼ 普通表格  --> 
			
	      <div class="demotitle">普通表格</div>
	      <div class="result-grid">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/ico_export.png" />
					  	 <span class="tool-name"><ui:i18n key="批量导出"/></span> 
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
			      	<table class="result-grid-table">
			      		 <colgroup>
				      		<col width="20%"  />
	      		 			<col width="10%" />
	      		 			<col width="30%" />
	      		 			<col width="20%" />
	      		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th>运费模板</th>
			      		 		<th>制定区域</th>
			      		 		<th>配送区域</th>
			      		 		<th>创建日期</th>
			      		 		<th>操作</th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<tr>
			      		 		<td>上海配送模板</td>
			      		 		<td>市</td>
			      		 		<td>上海</td>
			      		 		<td>2015-06-28</td>
			      		 		<td><span class="gridbutton green">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	<tr>
			      		 		<td>上海配送模板</td>
			      		 		<td>市</td>
			      		 		<td>上海</td>
			      		 		<td>2015-06-28</td>
			      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	<tr>
			      		 		<td  >上海配送模板</td>
			      		 		<td>市</td>
			      		 		<td>上海</td>
			      		 		<td>2015-06-28</td>
			      		 		<td><span class="gridbutton green">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 </tbody>
			      	</table>
	      		</div>
	      		
	      	   <ui:paging page="${page }"/>  
			<%--    <ui:paging page="${page }" showSize="false" position="right" btn1text="确认" />   --%>
			   
	      </div>
	      <!-- ▲ 普通表格  -->
	      <!-- ▼ 带checkbox的表格  --> 
	       <div class="demotitle">带checkbox的表格</div>
	      
	      <div class="result-grid">
	      	<table class="result-grid-table">
	      		 	<colgroup>
				      		<col width="80px"  />
	      		 			<col width="10%" />
	      		 			<col width="35%" />
	      		 			<col width="25%" />
	      		 			<col />
			      		</colgroup>
	      		 <thead class="result-grid-thead">
	      		 	<tr>
	      		 		<th class="chk"><input class="iccheckbox" type="checkbox" name="checkall" >&nbsp;&nbsp;全选</th>
	      		 		<th>制定区域</th>
	      		 		<th>配送区域</th>
	      		 		<th>创建日期</th>
	      		 		<th>操作</th>
	      		 	</tr>
	      		 </thead>
	      		 <tbody  class="result-grid-tbody">
	      		 	<tr>
	      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-28</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 	<tr>
	      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-28</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 	<tr>
	      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-28</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 	<tr>
	      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-28</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 </tbody>
	      	</table>
	      		<ui:paging page="${page }" />
	      </div>
	      <!-- ▲ 带checkbox的表格  -->
	      
	      <!-- ▼ 表头固定  --> 
	      <div class="demotitle">表头固定</div>
	      <div class="result-grid">
	      	<div class="js-grid-content">
	      		<table class="result-grid-table">
	      		 	<colgroup>
				      		<col width="80px"  />
	      		 			<col width="10%" />
	      		 			<col width="35%" />
	      		 			<col width="25%" />
	      		 			<col />
			      		</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th class="chk"><input class="iccheckbox" type="checkbox" name="checkall" >&nbsp;&nbsp;全选</th>
		      		 		<th>制定区域</th>
		      		 		<th>配送区域</th>
		      		 		<th>创建日期</th>
		      		 		<th>操作</th>
		      		 	</tr>
		      		 </thead>
		      	</table>
	      		<div class="grid-fixed">
				      	<table class="result-grid-table fixed">
				      		<colgroup>
					      		<col width="80px"  />
		      		 			<col width="10%" />
		      		 			<col width="35%" />
		      		 			<col width="25%" />
		      		 			<col />
				      		</colgroup>
				      		 <tbody  class="result-grid-tbody">
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-08</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-09</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-21</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-22</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-23</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-24</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-25</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-22</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-23</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-24</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-25</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-22</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-23</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-24</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 	<tr>
				      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check"></td>
				      		 		<td>市</td>
				      		 		<td>上海</td>
				      		 		<td>2015-06-25</td>
				      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
				      		 	</tr>
				      		 </tbody>
				      	</table>
			      	</div>
	      	
	      	</div>
	      	
	      	
	      		<ui:paging page="${page }" />
	      </div>
	      
	      <!-- ▲ 表头固定  -->
	      
	     	<!-- ▼ 带有图片的表格  --> 
	      <div class="demotitle">带有图片的表格</div>
	      <div class="result-grid pic">
	      	<table class="result-grid-table">
	      		 <colgroup>
		      		<col width="120px"  />
     		 			<col width="10%" />
     		 			<col width="35%" />
     		 			<col width="25%" />
     		 			<col />
	      		</colgroup>
	      		 <thead class="result-grid-thead">
	      		 	<tr>
	      		 		<th></th>
	      		 		<th>制定区域</th>
	      		 		<th>配送区域</th>
	      		 		<th>创建日期</th>
	      		 		<th>操作</th>
	      		 	</tr>
	      		 </thead>
	      		 <tbody  class="result-grid-tbody">
	      		 	<tr>
	      		 		<td class="pic">
	      		 			<img class="pic-small" alt="" src="/uploads/8/2015/05/22/8_shop_2015_05_22_17_28_21_29238.jpg">
	      		 		</td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-25</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 	<tr>
	      		 		<td class="pic">
	      		 			<img class="pic-small" alt="" src="/uploads/8/2015/05/26/8_blog_2015_05_26_11_10_49_60046.png">
	      		 		</td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-22</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 	 
	      		 </tbody>
	      	</table>
	      </div>
	      <!-- ▲ 带有图片的表格  -->
	      
	      	<!-- ▼ 带有checkbox + 图片的表格  --> 
	       <div class="demotitle">带有checkbox + 图片的表格</div>
	      
	       <div class="result-grid pic">
	      	<table class="result-grid-table">
	      		<colgroup>
		      		<col width="60px"  />
		      		<col width="120px"  />
     		 			<col width="10%" />
     		 			<col width="35%" />
     		 			<col width="25%" />
     		 			<col />
	      		</colgroup>
	      		 <thead class="result-grid-thead">
	      		 	<tr>
	      		 		<th class="chk" colspan="2"><input class="iccheckbox" type="checkbox" name="checkall" >&nbsp;&nbsp;全选</th>
	      		 		<th>制定区域</th>
	      		 		<th>配送区域</th>
	      		 		<th>创建日期</th>
	      		 		<th>操作</th>
	      		 	</tr>
	      		 </thead>
	      		 <tbody  class="result-grid-tbody">
	      		 	<tr>
	      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check" ></td>
	      		 		<td class="pic">
	      		 			<img class="pic-small" alt="" src="/uploads/8/2015/05/22/8_shop_2015_05_22_17_28_21_29238.jpg">
	      		 		</td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-25</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 	<tr>
	      		 		<td class="chk"><input class="iccheckbox" type="checkbox" name="check" ></td>
	      		 		<td class="pic">
	      		 			<img class="pic-small" alt="" src="/uploads/8/2015/05/26/8_blog_2015_05_26_11_10_49_60046.png">
	      		 		</td>
	      		 		<td>市</td>
	      		 		<td>上海</td>
	      		 		<td>2015-06-22</td>
	      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
	      		 	</tr>
	      		 	 
	      		 </tbody>
	      	</table>
	      </div>
	      <!-- ▲ 带有checkbox + 图片的表格  -->
	      
	      <!-- =================== -->
	      <!-- ▼ 可排序表格  --> 
			
	      <div class="demotitle">可排序表格</div>
	      <div class="result-grid sortable">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/ico_export.png" />
					  	 <span class="tool-name"><ui:i18n key="批量导出"/></span> 
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
			      	<table class="result-grid-table">
			      		 <colgroup>
				      		<col width="90px"  />
	      		 			<col width="100px" />
	      		 			<col width="180px" />
	      		 			
	      		 			<col width="1px" />
	      		 			<col width="20px" />
	      		 			<col width="20px" />
	      		 			<col width="10px" />
	      		 			<col width="200px" />
	      		 			<col width="100px" />
	      		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th colspan="3">一级菜单</th>
			      		 		<th  colspan="5">二级菜单</th>
			      		 		<th></th>
			      		 		<th>操作</th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<tr>
			      		 		<td>
			      		 			<div class="arrow-warp">
			      		 				<div class="arrow-up gray"></div>
			      		 				<div class="arrow-down"></div>
			      		 			</div>
			      		 		</td>
			      		 		<td>速食食料食品</td>
			      		 		<td class="grid-line"></td>
			      		 		<td class="level-two-first"></td>
			      		 		<td class="grid-line"></td>
			      		 		<td class="grid-line"></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	<tr>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td class="level-two-normal"></td>
			      		 		<td class="grid-line"></td>
			      		 		<td>
			      		 			<div class="arrow-warp">
			      		 				<div class="arrow-up gray"></div>
			      		 				<div class="arrow-down"></div>
			      		 			</div>
			      		 		</td>
			      		 		<td></td>
			      		 		<td class="text-left">拌冷面</td>
			      		 		<td></td>
			      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	<tr class="level-one-last">
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td class="level-two-last"></td>
			      		 		<td class="grid-line"></td>
			      		 		<td>
			      		 			<div class="arrow-warp">
			      		 				<div class="arrow-up"></div>
			      		 				<div class="arrow-down gray"></div>
			      		 			</div>
			      		 		</td>
			      		 		<td></td>
			      		 		<td class="text-left">韩式猪肉水饺</td>
			      		 		<td></td>
			      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	 
			      		 	 
			      		 	 <tr>
			      		 		<td>
			      		 			<div class="arrow-warp">
			      		 				<div class="arrow-up"></div>
			      		 				<div class="arrow-down"></div>	
			      		 			</div>
			      		 		</td>
			      		 		<td>速食食料食品</td>
			      		 		<td class="grid-line"></td>
			      		 		<td class="level-two-first"></td>
			      		 		<td class="grid-line"></td>
			      		 		<td class="grid-line"></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	<tr class="level-one-last">
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td class="level-two-last"></td>
			      		 		<td class="grid-line"></td>
			      		 		<td>
			      		 			<div class="arrow-warp">
			      		 				<div class="arrow-up gray"></div>
			      		 				<div class="arrow-down gray"></div>
			      		 			</div>
			      		 		</td>
			      		 		<td></td>
			      		 		<td class="text-left">韩式猪肉水饺</td>
			      		 		<td></td>
			      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	 
			      		 	 <tr class="level-one-last">
			      		 		<td>
			      		 			<div class="arrow-warp">
			      		 				<div class="arrow-up"></div>
			      		 				<div class="arrow-down gray"></div>	
			      		 			</div>
			      		 		</td>
			      		 		<td>速食食料食品</td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td></td>
			      		 		<td><span class="gridbutton red">编辑</span><span class="gridbutton red">删除</span></td>
			      		 	</tr>
			      		 	 
			      		 </tbody>
			      	</table>
	      		</div>
			    <ui:paging page="${page }" />
			    </div>
	      </div>
	      <!-- ▲ 可排序表格  -->
	      <!-- =================== -->
		</div>
   
	 
	 
	 
	    <!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpopupPicture">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
		 		 </div>
		 	</div>
		</div>
		<!-- ▲ bpopup area -->
</body>
</html>