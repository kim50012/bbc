<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="已售罄的商品"/></title>  
<style type="text/css">
 .result-grid-table{
 	font-size:12px;
 	color:#5f5f5f;
 }
 .gray{
 	color:#a2a2a2;
 }
 .goods-name-span{
 	position: absolute;
 	margin-left:-25px;
 	margin-top:-8px;
 	
 }
 .select-all-span{
 	position: absolute;
 	margin-left:-15px;
 	margin-top:-8px;
 }
 .td-css{
 	vertical-align: top;
 }
 .goods-name-limit{
 	word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;
 }
 .PoupDiv{
 	display:none;
 	width:210px;
 	border:1px solid #c5c5c5;
 	position:absolute;
 	background-color: #fff;
 	z-index: 2000;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
	right:30px;
	top:30px; 
}
 .dropDown1,.dropDown2
 {
 	width:0;
 	height:0; 
 	overflow:hidden;
 	border-width:10px; 
 	border-style:dotted dotted solid;  
 	position:absolute
 }
 .PoupDivBody{
 	position: absolute; 
 	width:20px; 
 	height: 20px; 
 	left:50px; 
 	top:-20px
 }
 .dropDown1{
 	border-color:transparent transparent #c5c5c5;
 	top:-1px
 }
 .dropDown2{
 	border-color:transparent transparent #FFFFFF; 
 	top:0
 }
 .ui-box-body{
 	box-sizing:border-box;
 	max-height:380px;
	padding: 15px 15px 15px 0; 
 }

 .ui-box-body .scroll{ 
 	max-height:350px;
	overflow-y: auto;
	cursor: pointer; 
	padding-left:10px;
 }
 .ui-box-body li {
	line-height: 30px;
	font-size: 14px;
	padding-left: 30px; 
}
.ui-box-body li.active,.ui-box-body li:hover { 
	background-color: #f2f2f2;
}

   .ui-box-body li .ui-list-item-arrow{
	isplay:inline-block;
	float:right;
	 margin-right: 15px; 
}

.ui-box-body li.active .ui-list-item-arrow , .ui-box-body li:hover .ui-list-item-arrow{ 
	color: #d54658;
}

 .ui-box-body .scroll ol li{
 	font-size:14px;
 	margin-top:12px;
 	margin-left:10px;
 }
 .gray{color:#a2a2a2;}
 .end-desc{word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;}
  .mustInput{
	color:red;
	position: absolute;
	margin-top:20px;
	margin-left:3px;
	font-size:14px;
}
.dateCss{
	  background-image: url(/admin/images/cust/calendar.png);
	  background-repeat: no-repeat;
	  background-position: 95% 7px;
	  font-size: 12px;
	  cursor: pointer; 
}
.result-grid-tool{
	padding-left:20px;
	position: relative;
}
.result-grid-tool img{
	position: absolute;
	top:5px;
	left:0;
}
.result-grid.pic .result-grid-table .result-grid-tbody tr td.pic {
  padding-left:0;
  padding-right:0;
}
</style> 
 
<script type="text/javascript">
	$(function(){
		$('#selectAll').on('ifChecked', function(event){
			 $('.js-check-item').iCheck('check');
		 });
		 $('#selectAll').on('ifUnchecked', function(event){
			 $('.js-check-item').iCheck('uncheck');
		 });
		 $('.dateCss').datepicker();
	});
	//分页操作
	function showPage(pageNo, pageSize){
		window.scrollTo(0,0);
		query(pageNo, pageSize);
	}
	//分页的查询
	function query(pageNo, pageSize){
		
		console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var params = {
				 pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/goods/goods/storeListFragment.htm';
		 
		 var $this = $('.js-grid-content');	
		 $this.showLoading();
		 $this.load(url , params ,  function(){ 
			 $this.find('.select2').select2({
				 minimumResultsForSearch:5
				 ,allowClear: true 
			 }); 
			 $('.pic-small').hover(function(){
			     	var $this = $(this);
			     	var offset = $this.offset();
			     	var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
			      	$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
			     	 $('body').append($div);
			      },function(){
			      	$('.js-show-big-pic').remove();
			      } 
			  );
			 $('#selectAll').on('ifChecked', function(event){
				 $('.js-check-item').iCheck('check');
			 });
			 $('#selectAll').on('ifUnchecked', function(event){
				 $('.js-check-item').iCheck('uncheck');
			 });
			 $('.iccheckbox').iCheck({
			 	    checkboxClass: 'icheckbox_square-firebrick',
			 	    radioClass: 'iradio_square-firebrick',
			 	    increaseArea: '0%' // optional
			 	  });
			 $this.hideLoading();
		 });
		 
	}
	//弹出商品上架框
	function bPoupDivDisplay(displayId){
		if(displayId == 'list'){
			var display = "";  
			$('input[name="displayId"]:checked').each(function(){  
				display = display + ',' + $(this).val();//向数组中添加元素  
			});
			if(display == ''){
				alert('<ui:i18n key="请选择需要上架的商品"/>！');
				return;
			}
			$('#displayGoodsId').val(displayId);
		}else{
			$('#displayGoodsId').val(displayId);
		}
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 350,
			height : 265,
		});
	}
	//判断标志，判断鼠标状态
	var isOut = true;
	//弹出修改商品分类的下拉框
	function showList(){
		var displayId = '';
		$('input[name="displayId"]:checked').each(function(){  
			displayId = displayId+','+$(this).val();//向数组中添加元素  
		}); 
		if(displayId == ''){
			alert('<ui:i18n key="请选择需要分组的商品"/>！');
			return;
		} 
		$('.PoupDiv').attr('style','display:inline');
		event.cancelBubble = true;
	}
	//当鼠标不在商品分类下拉框下的时候，点击关闭下拉框
	document.onmousedown = function(){
		var closeDiv = document.getElementById('PoupDivClose');
		if(closeDiv.style.display != 'none' && isOut){
			closeDiv.style.display = 'none';
		}
	};
	//鼠标移出事件，当鼠标不在框内时候，将标志isOut改为true；
	function mouseOut(){
		isOut = true;
	}
	//鼠标移出事件，当鼠标在框内时候，将标志isOut改为false；
	function mouseIn(){
		isOut = false;
	}
	//修改商品分组
	function updateGoodsGroup(sgcIdValue){
		//存储商品的分组的ID号
		var sgcId = sgcIdValue;
		//存储要更改分组的商品的上架ID
		var displayId = '';  
		var goodsId = '';
		$('input[name="displayId"]:checked').each(function(){  
			displayId = displayId + ',' + $(this).val();//向数组中添加元素  
			goodsId = goodsId + ',' + $('#goodsId' + $(this).val()).val();
		});  
		var param = {
						sgcId : sgcId
						,displayId : displayId
						,goodsId : goodsId
					};
		$.ajax({
			data : param,
			url : '/admin/goods/goods/updateGoodsGroup.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result == 'success'){
					alert('<ui:i18n key="更改商品分组成功"/>');
// 					window.location.reload();//调用AdminGoodsSellAction中goodsSell方法进行页面刷新
					$('#PoupDivClose').css('display','none');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				}else{
					alert('<ui:i18n key="更改商品分组失败"/>，<ui:i18n key="请重新操作"/>。');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	}
	//关闭弹出窗
	function cancel(){
		closeBpopupWindow('bpoupMessage');
	}
	//一组商品的上架操作。
	function displayDownListGoods(){
		var displayId = $('#displayGoodsId').val();;  
		//存储上架备注信息
		var endDesc = $('#endDesc').val();
		//存储商品ID
		var goodsId = '';
		if(displayId == 'list'){
			displayId = '';
			$('input[name="displayId"]:checked').each(function(){  
				displayId = displayId + ',' + $(this).val();//向数组中添加元素  
				goodsId = goodsId + ',' + $('#goodsId'+$(this).val()).val();	
			});
			displayId = displayId.substr(1,displayId.length);
			goodsId = goodsId.substr(1,goodsId.length);
		}else{
			goodsId = $('#goodsId' + displayId).val();
		}
		//存储上架发布的结束时间
		var dateType=$('#dateType').val();
		if(typeof(dateType) == 'undefined' || dateType == ''){
			alert('<ui:i18n key="请填写商品发布的结束时间"/>');
			return ;
		}
		//存储上架备注信息
		var startDesc = $('#startDesc').val();
		var param = {
						displayId : displayId
						,goodsId : goodsId
						,endDate : dateType
						,startDesc : startDesc
					};
		$.ajax({
			data : param,
			url : '/admin/goods/goods/publishGoods.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result=='success'){
					alert('<ui:i18n key="商品上架成功"/>');
// 					window.location.reload();//调用AdminGoodsSellAction中goodsSell方法进行页面刷新
					$('.b-close').click();
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				}else if(data.result=='failDate'){
					alert('<ui:i18n key="选择的商品发布结束时间错误"/>');
				}else if(data.result=='fail'){
					alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>。');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	}
	function modifyGoods(displayId){
		var url = '/admin/goods/display/displayModify.htm?displayId=' + displayId;
		parent.ggShowTab({
			'url' : url || '',
			'name' : '<ui:i18n key="编辑商品详情"/>',
			'icon' : 'shopoperation' 
		}); 
	}
	//商品的删除操作。
	function deleteGoods(){
		var displayId = $('#displayGoodsId').val();;  
		//存储商品ID
		var goodsId = '';
		if(displayId == 'list'){
			displayId = '';
			$('input[name="displayId"]:checked').each(function(){  
				displayId = displayId + ',' + $(this).val();//向数组中添加元素  
				goodsId = goodsId + ',' + $('#goodsId'+$(this).val()).val();	
			});
			displayId = displayId.substr(1,displayId.length);
			goodsId = goodsId.substr(1,goodsId.length);
		}else{
			goodsId = $('#goodsId'+displayId).val();
		}
		var param = {
						displayId : displayId
				 		,goodsId : goodsId
				 	};
		$.ajax({
			data : param,
			url : '/admin/goods/goods/deleteGoods.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result == 'success'){
					alert('<ui:i18n key="商品删除成功"/>');
					cancelDelete();
// 					window.location.reload();//调用AdminGoodsSellAction中goodsSell方法进行页面刷新
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				}else if(data.result == 'fail'){
					alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>。');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	}
	//弹出删除框
	function GoodsbPoupDivDelete(displayId){
		if(displayId == 'list'){
			var display = '';  
			var flag=true;
			$('input[name="displayId"]:checked').each(function(){
				if((($('#sumSalesQty'+$(this).val()).html())) != '0'){
					flag = false;
				}else{
					display = display + ',' + $(this).val();//向数组中添加元素 
				}
			});
			if(!flag){
				alert('<ui:i18n key="不可选择总销量不为零的商品"/>');
				return;
			}
			if(display == ''){
				alert('<ui:i18n key="请选择需要删除的商品"/>！');
				return;
			}
			$('#displayGoodsId').val(displayId);
		}else{
			$('#displayGoodsId').val(displayId);
		}
		showIframeBpopupWindow({
			id : 'bpoupMessageDelete',
			width : 350,
			height : 185,
		});
	}
	//关闭删除弹出框
	function cancelDelete(){
		closeBpopupWindow('bpoupMessageDelete');
	}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		
		<div class="result-grid pic" style="margin-top: 30px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				    <span class="result-grid-tool" onclick="showList();">
      		   	 	 	<img  alt="" src="/admin/images/goodsSell/ico_revise.png" /><ui:i18n key="修改商品分组"/>
      		   		</span>
      		   		<span class="result-grid-tool" style="margin-left:20px;" onclick="GoodsbPoupDivDelete('list');">
      		   	 	 	<img alt="" src="/admin/images/goodsSell/ico_delete.png" /><ui:i18n key="删除"/>
      		   		</span>
      		   		<span class="result-grid-tool" style="margin-left:20px;" onclick="bPoupDivDisplay('list');">
      		   	 	 	<img alt="" src="/admin/images/goodsSell/ico_grounding.png" /><ui:i18n key="上架"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
				      		<col width="35px"  />
				      		<col width="90px"  />
	     		 			<col width="100px" />
	     		 			<col width="100px" />
	     		 			<col width="80px" />
	     		 			<col width="80px" />
	     		 			<col width="100px" />
	     		 			<col width="100px" />
	     		 			<col width="100px" />
	     		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th class="chk" style="width:35px;"><input class="iccheckbox" type="checkbox" name="checkall" id="selectAll"  ></th>
			      		 		<th style="text-align: left;"><span class="select-all-span"><ui:i18n key="全选"/></span></th>
			      		 		<th style="text-align: left;"><span class="goods-name-span"><ui:i18n key="商品名称"/></span></th>
			      		 		<th><ui:i18n key="价格"/></th>
			      		 		<th><ui:i18n key="库存"/></th>
			      		 		<th><ui:i18n key="总销量"/></th>
			      		 		<th><ui:i18n key="发布时间"/></th>
			      		 		<th><ui:i18n key="下架时间"/></th>
			      		 		<th><ui:i18n key="下架备注信息"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${page.data}" var="list"  varStatus="status"> 
				      		 	<tr>
				      		 		<td class="chk" style="width:35px;"><input class="iccheckbox js-check-item" value="${list.DISPLAY_ID}" name="displayId" type="checkbox" name="check" >
				      		 			<input type="hidden" value="${list.GOODS_ID }" id="goodsId${list.DISPLAY_ID}"/>
				      		 		</td>
				      		 		<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.GOODS_LIST_IMG_URL }">
				      		 		</td>
				      		 		<td class="td-css" style="text-align: left;padding-left:5px;">
				      		 			
				      		 			<span class="goods-name-limit" title="${list.GOODS_NM}">${list.GOODS_NM}</span>
				      		 		</td>
				      		 		<td class="td-css">￥${list.PRICE_UNIT_SALES}</td>
				      		 		<td class="td-css">${list.STOCK_QTY }</td>
				      		 		<td class="td-css"><span id="sumSalesQty${list.DISPLAY_ID}">${list.SALES_QTY}</span></td>
				      		 		<td class="td-css">${list.LAST_SALES_DT }</td>
				      		 		<td class="td-css">${list.END_DATE }</td>
				      		 		<td class="td-css"><span class="end-desc" title="${list.END_DESC }">${list.END_DESC }</span></td>
				      		 		<td  class="td-css">
				      		 			<span class="gridbutton red"  onclick="modifyGoods(${list.DISPLAY_ID });"><ui:i18n key="编辑"/></span>
				      		 			<c:if test="${list.SALES_QTY==0}">
			           						<span class="gridbutton red"  onclick="GoodsbPoupDivDelete(${list.DISPLAY_ID})"><ui:i18n key="删除"/></span>
			           					</c:if>
			           					<c:if test="${list.SALES_QTY!=0}">
			           						<span class="gridbutton gray" ><ui:i18n key="删除"/></span>
			           					</c:if>
				      		 			<span class="gridbutton green"  onclick="bPoupDivDisplay(${list.DISPLAY_ID});"><ui:i18n key="上架"/></span>
				      		 		</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />
	     	</div>
	      </div>
	      <!-- ▼ bpopup area -->
				<div class="bpopup2" id="bpoupMessage" >
				 	<div class="bpopupWarp">
				 		 <div class="bpopupHeaderWarp">
							<h3 class="bpopupTitle js-title"><ui:i18n key="系统提示"/></h3>
							<div class="bpopupColseWarp">
								<img class="b-close" src="/admin/images/goodsSell/close.png" />
							</div>
						</div>
				 		<div class="bpopupContentWarp" style="text-align: center;"> 
				 		 	<div style="height:30px;"></div>
				 		 	<span style="font-size:14px;color:#333;"><ui:i18n key="您确定上架该商品吗"/>？</span>
							<input type="hidden" value="" id="displayGoodsId"/>
							<input style="margin-top:10px;" class="dateCss" id="dateType" type="text"  placeholder='<ui:i18n key="请选择发布结束日期"/>'/><span class="mustInput">*</span>
							<input style="margin-top:10px;margin-bottom:30px;" type="text" placeholder='<ui:i18n key="请填写上架详情"/>' id="startDesc"/><br>
							<span class="button bg-red js-trans-order-confirm"  onclick="displayDownListGoods();">
								<span class="button-icon conform"></span>
								<ui:i18n key="保存"/>
							</span>
							<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancel();">
								<span class="button-icon cancel"></span>
									<ui:i18n key="取消"/>
							</span>
				 		</div>
				 	</div>
				</div>
				<div class="bpopup2" id="bpoupMessageDelete" >
				 	<div class="bpopupWarp">
				 		 <div class="bpopupHeaderWarp">
							<h3 class="bpopupTitle js-title"><ui:i18n key="系统提示"/></h3>
							<div class="bpopupColseWarp">
								<img class="b-close" src="/admin/images/goodsSell/close.png" />
							</div>
						</div>
				 		<div class="bpopupContentWarp" style="text-align: center;"> 
				 		 	<div style="height:30px;"></div>
				 		 	<span style="font-size:14px;color:#333;"><ui:i18n key="您确定删除该商品吗"/>？</span><br>
							<div style="height:30px;"></div>
							<span class="button bg-red js-trans-order-confirm"  onclick="deleteGoods();">
								<span class="button-icon conform"></span>
								<ui:i18n key="保存"/>
							</span>
							<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancelDelete();">
								<span class="button-icon cancel"></span>
									<ui:i18n key="取消"/>
							</span>
				 		</div>
				 	</div>
				</div>
			<!-- ▲ bpopup area -->
			<!-- Start 修改店铺中商品分类的下拉显示。  -->
			<div class="PoupDiv" id="PoupDivClose" onmouseover="mouseIn();" onmouseout="mouseOut();">
		        <div class="PoupDivBody">
		            <div class="dropDown1"></div>
		            <div class="dropDown2"></div>
		        </div>
		        <div class="ui-box">
				  	<div class="ui-box-header">
				  		<h3 class="title"></h3>
				  	</div>
				  	<div class="ui-box-body">
				  		<div class="scroll">
				  			<ol>
				  				<c:forEach items="${shopGoodsClass}" var="shopgoods" varStatus="status">
					  				<li onclick="updateGoodsGroup(${shopgoods.sgcId});">
					  					<span>${shopgoods.sgcNm}<span>
					  				</li>
				  				</c:forEach>
				  			</ol>
				  		</div>
				  	</div>
				 </div>
	    	</div> 
			<!--End  -->	
	</div>
	<!-- ▲ container  -->
</body>
</html>