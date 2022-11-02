<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="普通商品发布"/></title>  
<style type="text/css">
 .gray{color:#a2a2a2;}
 .index-set-table{
	width:100%;
}
.goods-name-limit{word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;}
 .result-grid .result-grid-table .result-grid-tbody td .index-set-table tr{border:0;}
 .result-grid .result-grid-table .result-grid-tbody td .index-set-table tr td {padding:0;border:0;}
.index-set-table img{width:9px;max-width:9px;}
.index-set-table .index-first-img{margin-right:5px;cursor: pointer;}
.index-set-table .index-before-img{margin-top:10px;cursor: pointer;}
.index-set-table .index-next-img{margin-top:-10px;cursor: pointer;}
.index-set-table .index-num-span{margin-left:20%;margin-top:5px;}
.td-css{vertical-align: top;}
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
</style> 
 
<script type="text/javascript">
	$(function(){
		 $('.dateCss').datepicker();
		//商品的上移
		$('.index-before-img').click(function(){
			var displayId = $(this).attr('data-displayId');
			var jobType = 'A';
			var option = 'UP';
			var reserve = 0;
			var param = {
							displayId : displayId
							,jobType : jobType
							,option : option
							,reserve : reserve
						};
			$.ajax({
				data : param,
				url : '/admin/goods/display/updateDisplayGoodsPosition.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
						$('.b-close').click();
						
					}else{
						alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>。');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		});
		//商品的下移
		$('.index-next-img').click(function(){
			var displayId = $(this).attr('data-displayId');
			var jobType = 'A';
			var option = 'DOWN';
			var reserve = 0;
			var param  =  {
					displayId : displayId
					,jobType : jobType
					,option : option
					,reserve : reserve
				};
			$.ajax({
				data : param,
				url : '/admin/goods/display/updateDisplayGoodsPosition.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
						$('.b-close').click();
					}else{
						alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		});
		$('.index-first-img').click(function(){
			var displayId = $(this).attr('data-displayId');
			var jobType = '';
			var option = 'DOWN';
			var reserve = 0;
			var param  =  {
					displayId : displayId
					,jobType : jobType
					,option : option
					,reserve : reserve
				};
			$.ajax({
				data : param,
				url : '/admin/goods/display/updateDisplayGoodsPosition.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
						$('.b-close').click();
					}else{
						alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>。');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		});
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
		var url = '/admin/goods/display/normalListFragment.htm';
		 
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
			//商品的上移
				$('.index-before-img').click(function(){
					var displayId = $(this).attr('data-displayId');
					var jobType = 'A';
					var option = 'UP';
					var reserve = 0;
					var param = {
									displayId : displayId
									,jobType : jobType
									,option : option
									,reserve : reserve
								};
					$.ajax({
						data : param,
						url : '/admin/goods/display/updateDisplayGoodsPosition.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
						success : function(data){
							if(data.result == 'success'){
								var pageCurr = Number($('#currentPage').find('option:selected').val());
								var pageUnit = Number($('#pageUnit').find('option:selected').val());
								showPage(pageCurr,pageUnit);
								$('.b-close').click();
							}else{
								alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>。');
							}
						},
						error : function(a, msg, c) {
							alert('error: ' + msg);
						}
					});
				});
				//商品的下移
				$('.index-next-img').click(function(){
					var displayId = $(this).attr('data-displayId');
					var jobType = 'A';
					var option = 'DOWN';
					var reserve = 0;
					var param  =  {
							displayId : displayId
							,jobType : jobType
							,option : option
							,reserve : reserve
						};
					$.ajax({
						data : param,
						url : '/admin/goods/display/updateDisplayGoodsPosition.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
						success : function(data){
							if(data.result == 'success'){
								query(1,10);
							}else{
								alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>');
							}
						},
						error : function(a, msg, c) {
							alert('error: ' + msg);
						}
					});
				});
				$('.index-first-img').click(function(){
					var displayId = $(this).attr('data-displayId');
					var jobType = '';
					var option = 'DOWN';
					var reserve = 0;
					var param  =  {
							displayId : displayId
							,jobType : jobType
							,option : option
							,reserve : reserve
						};
					$.ajax({
						data : param,
						url : '/admin/goods/display/updateDisplayGoodsPosition.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
						success : function(data){
							if(data.result == 'success'){
								query(1,10);
							}else{
								alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>。');
							}
						},
						error : function(a, msg, c) {
							alert('error: ' + msg);
						}
					});
				});
			 $this.hideLoading();
		 });
		 
	}
	/*打开弹出框*/
	function bPoupDivDisplay(displayId){
		$('#displayGoodsId').val(displayId);
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 350,
			height : 215,
		});
	}
	/*打开弹出框*/
	function bPoupDivPlush(displayId){
		$('#displayGoodsId').val(displayId);
		$('#dateType').val('');
		showIframeBpopupWindow({
			id : 'bpoupMessagePublish',
			width : 350,
			height : 265,
		});
	}
	/*关闭弹出框*/
	function cancel(){
		closeBpopupWindow('bpoupMessage');
	}
	/*关闭弹出框*/
	function cancelPublish(){
		closeBpopupWindow('bpoupMessagePublish');
	}
	/*商品上架操作*/
	function displayPublishListGoods(){
		var displayId = $('#displayGoodsId').val();;  
		//存储上架备注信息
		var endDesc = $('#endDesc').val();
		//存储商品ID
		var goodsId = $('#goodsId' + displayId).val();
		//存储上架发布的结束时间
		var dateType = $('#dateType').val();
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
// 					cancelPublish();
// 					query(1,10);
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
					$('.b-close').click();
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
	//商品的下架操作。
	function displayDownListGoods(){
		var displayId = $('#displayGoodsId').val();;  
		//存储上架备注信息
		var endDesc = $('#endDesc').val();
		//存储商品ID
		var goodsId = $('#goodsId'+displayId).val();
		var param = {
						displayId : displayId
						,goodsId : goodsId
						,endDesc : endDesc
					};
		$.ajax({
			data : param,
			url : '/admin/goods/goods/updateDisplayGoods.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result == 'success'){
					alert('<ui:i18n key="商品下架成功"/>');
// 					cancel();
// 					query(1,10);
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
					$('.b-close').click();
				}else{
					alert('<ui:i18n key="商品下架失败"/>，<ui:i18n key="请重新操作"/>。');
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
	function displayCreate(){
		parent.ggShowTab({
			'url' : '/admin/goods/display/displayCreate.htm',
			'name' : '<ui:i18n key="编辑商品详情"/>',
			'icon' : 'shopoperation' 
		});  
	}
	function displayCopy(displayId){
		parent.ggShowTab({
			'url' : '/admin/goods/display/displayCopy.htm?displayId=' + displayId,
			'name' : '<ui:i18n key="编辑商品详情"/>',
			'icon' : 'shopoperation' 
		});  
	}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		
		<div class="result-grid" style="margin-top: 30px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				    <span class="result-grid-tool" onclick="displayCreate()">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="商品上架"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
				      		<col width="70px"  />
				      		<col width="90px"  />
				      		<col width="160px"  />
	     		 			<col width="270px" />
	     		 			<col width="180px" />
	     		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="排序编号"/></th>
			      		 		<th></th>
			      		 		<th><ui:i18n key="商品名称"/></th>
			      		 		<th><ui:i18n key="标准分类"/>-<ui:i18n key="第一级"/>><ui:i18n key="第二级"/>><ui:i18n key="第三级"/></th>
			      		 		<th><ui:i18n key="店铺个性分类"/>-<ui:i18n key="第一级"/>><ui:i18n key="第二级"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${goodsList}" var="list"  varStatus="status"> 
				      		 	<tr>
				      		 		<td>
				      		 			<table class="index-set-table">
			           						<tr>
			           							<td rowspan="2" style="width:30%;text-align: right;border:0;">
			           								<c:if test="${requestScope.first!=list.SORT_NO }">
			           									<img class="index-first-img" src="/admin/images/goodsDisplay/list_top.png" data-displayId="${list.DISPLAY_ID }"/>
			           								</c:if>
			           								<c:if test="${list.SORT_NO==requestScope.first }">
			           									<img style="margin-right:5px;"  src="/admin/images/goodsDisplay/list_top2.png"/>
			           								</c:if>
			           							</td>
			           							<td style="width:10%;border:0;vertical-align: bottom;">
			           								<c:if test="${requestScope.first!=list.SORT_NO }">
			           									<img  class="index-before-img" src="/admin/images/goodsClass/main_redup.png" data-displayId="${list.DISPLAY_ID }"/>
			           								</c:if>
			           								<c:if test="${list.SORT_NO==requestScope.first }">
			           									<img style="margin-top:10px;"  src="/admin/images/goodsClass/main_up.png"/>
			           								</c:if>
			           							</td>
			           							<td rowspan="2" style="width:60%;text-align: left;border:0;">
			           								<span class="index-num-span">${list.SORT_NO }</span>
			           							</td>
			           						</tr>
			           						<tr>
			           							<td style="border:0;vertical-align: top;">
			           								<c:if test="${requestScope.last!=(list.SORT_NO) }">
			           									<img  class="index-next-img" src="/admin/images/goodsClass/main_reddown.png" data-displayId="${list.DISPLAY_ID }"/>
			           								</c:if>
			           								<c:if test="${requestScope.last==(list.SORT_NO) }">
			           									<img style="margin-top:-10px;"  src="/admin/images/goodsClass/main_down.png"/>
			           								</c:if>
			           							</td>
			           						</tr>
			           					</table>
				      		 		</td>
				      		 		<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.GOODS_LIST_IMG_URL }">
				      		 		</td>
				      		 		<td class="td-css"  style="text-align: left;vertical-align: top;padding-left:5px;"><div style="height:7px;"></div>
				      		 			<span class="goods-name-limit">${list.GOODS_NM}</span><br>
				      		 			<span class="goods-name-limit">${list.DESC_TITLE}</span>
				      		 			<input type="hidden" value="${list.GOODS_ID }" id="goodsId${list.DISPLAY_ID}"/>
				      		 		</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.GOODS_CLASS_NM }</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.SHOP_GOODS_CLASS_NM }</td>
				      		 		<td  class="td-css"><div style="height:7px;"></div>
				      		 			<span class="gridbutton red"  onclick="modifyGoods(${list.DISPLAY_ID });"><ui:i18n key="编辑"/></span>
				      		 			<span class="gridbutton red"  onclick="displayCopy('${list.DISPLAY_ID }');"><ui:i18n key="复制"/></span>
				      		 			<c:if test="${list.isDisplay==1}">
											<span class="gridbutton red"  onclick="bPoupDivDisplay(${list.DISPLAY_ID});"><ui:i18n key="下架"/></span>
										</c:if>
										<c:if test="${list.isDisplay==0}">
											<c:if test="${list.STOCK_QTY > 0}">
												<span class="gridbutton green"  onclick="bPoupDivPlush(${list.DISPLAY_ID});"><ui:i18n key="上架"/></span>
											</c:if>
											<c:if test="${list.STOCK_QTY <= 0}">
												<span class="gridbutton gray"  onclick="window.confirm('<ui:i18n key="该商品不可以上架"/>');" ><ui:i18n key="上架"/></span>
											</c:if>
										</c:if>
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
				 		 	<span style="font-size:14px;color:#333;"><ui:i18n key="您确定下架该商品吗"/>？</span>
							<input style="margin-top:10px;margin-bottom:30px;" type="text" id="endDesc" value="" placeholder='<ui:i18n key="请输入商品下架备注信息"/>'/><br>
							<input type="hidden" value="" id="displayGoodsId"/>
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
				
				<div class="bpopup2" id="bpoupMessagePublish" >
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
							<input style="margin-top:10px;" class="dateCss" id="dateType" type="text" autocomplete="off" placeholder='<ui:i18n key="请选择发布结束日期"/>'/><span class="mustInput">*</span>
							<input style="margin-top:10px;margin-bottom:30px;" type="text" placeholder='<ui:i18n key="请填写上架详情"/>' id="startDesc"/><br>
							<span class="button bg-red js-trans-order-confirm"  onclick="displayPublishListGoods();">
								<span class="button-icon conform"></span>
								<ui:i18n key="保存"/>
							</span>
							<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancelPublish();">
								<span class="button-icon cancel"></span>
									<ui:i18n key="取消"/>
							</span>
				 		</div>
				 	</div>
				</div>
			<!-- ▲ bpopup area -->
	</div>
	<!-- ▲ container  -->
</body>
</html>