<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
 
<style type="text/css">
.result-grid-tool img {margin-bottom: -2px;}
</style> 
 
<script type="text/javascript">

	$(function(){
		
		$('.js-serach').click(function(){
			search();
		});
	});
	
	function goodsDel(id) {

		if (id == "") {
			
			alert('<ui:i18n key="请重新打开此页面"/>.');
			return;
		}
		
		if (confirm('<ui:i18n key="您确定删除该商品吗"/>?')) {
			
			$.ajax({
				data : {goodsId : id},
				type : "POST",
				url : "/admin/goods/ajaxGoodsDelete.htm",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {

					if (res.success) {
						
						alert('<ui:i18n key="删除成功"/>.');
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
// 						location.reload();
					} else {
						
						alert('<ui:i18n key="删除失败"/>\n' + res.err_msg + '.');
					}
				},
				error : function(obj, e, msg) {
					
					alert('<ui:i18n key="网络出现故障"/>.');
				}
			});
		}
	}
	
	function goPage(goodsId) {
		
		if (goodsId == "") {
			
			displayCreate('/admin/goods/goodsCreate.htm');
		} else {
			
			displayModify('/admin/goods/goodsModify.htm?goodsId='+goodsId);
		}
	}
	
	function displayCreate(url,name,icon) {
		
		parent.ggShowTab({
			'url' : url || '',
			'name' : '<ui:i18n key="商品登记基本信息"/>',
			'icon' : 'shopoperation' 
		});  
	}
	
	function displayModify(url,name,icon) {
		
		parent.ggShowTab({
			'url' : url || '',
			'name' : '<ui:i18n key="商品登记基本信息"/>',
			'icon' : 'shopoperation' 
		});  
	}
	
	function displayCopy(url,name,icon) {
		
		parent.ggShowTab({
			'url' : url || '',
			'name' : '编辑商品详情',
			'icon' : 'shopoperation' 
		});  
	}
	
	function showPage(pageNo, pageSize) {
		window.scrollTo(0,0);
		query(pageNo, pageSize);
	}

	function search() {
		
		query(1, 10); 
	}

	function query(pageNo, pageSize) {
		
		//console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var goodsNm = $.trim($('input[name=goodsNm]').val());
		var params = {
				goodsNm	: goodsNm
				, pageCurr : pageNo
				, pageUnit : pageSize
			}
		var url = '/admin/goods/listFragment.htm';		 
		var $this = $('.js-grid-content');
		
		$this.showLoading();
		$this.load(url, params, function(){
			 
			$this.find('.select2').select2({
				
				minimumResultsForSearch : 5
				, allowClear : true 
			}); 
			$('.pic-small').hover(function(){
				 
				var $this = $(this);
				var offset = $this.offset();
				var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
				
				$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
				$('body').append($div);
			},function(){
				$('.js-show-big-pic').remove();
			});
			 
			$this.hideLoading();
		 });
	}
</script>
</head>

<body>
	<!-- ▼ container  --> 
	<div class="container">
		
		
		
		<!-- ▼ 查询表单区域  --> 
		<div class="query-from">
			<div class="form-table" >
				<table class="ftable">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
					</colgroup>
					<tr>
						<td class="flabel"><ui:i18n key="商品名称"/>：</td>
						<td class="fcomp" colspan="3">
							<input type="text" name="goodsNm" />
						</td>
					</tr>
				</table>
			</div>	 
			<!--searchBtn-->
			<div class="butttn-area m1" >
				<span class="button js-serach">
					<span class="button-icon search"></span>
					<span class="button-name"><ui:i18n key="查询"/></span> 
				</span>
			</div>	 
			<!--searchBtn-->
		</div>
		<!-- ▲ 查询表单区域  -->	
		
		<!-- ▼ 查询list区域  -->
		<div class="result-grid pic" style="margin-top: 40px;">
			<div class="result-grid-header">
				<div class="result-grid-tools">
					<span class="result-grid-tool" onclick="goPage('');">
						<img alt="" src="/admin/images/goods/plus.png" />
						<span class="tool-name"><ui:i18n key="新建"/></span> 
      		   		</span>
   				</div>
   			</div>
			<div class="js-grid-content">
				<div class="result-data-warp">
					<table class="result-grid-table">
			 			<colgroup>
				 			<col width="84px" />
				 			<col width="20%" />
				 			<col width="18%" />
				 			<col width="18%" />
				 			<col width="18%" />
				 			<col />
						</colgroup>
						<thead class="result-grid-thead">
							<tr>
								<th colspan="2"><ui:i18n key="商品名称"/></th>
								<th><ui:i18n key="标准分类"/>-<ui:i18n key="第1级"/></th>
								<th><ui:i18n key="标准分类"/>-<ui:i18n key="第2级"/></th>
								<th><ui:i18n key="标准分类"/>-<ui:i18n key="第3级"/></th>
								<th><ui:i18n key="操作"/></th>
							</tr>
						</thead>
						<tbody class="result-grid-tbody">
							<c:forEach items="${requestScope.reList}" var="items" varStatus="status">
							<tr>
								<td class="pic">
									<img class="pic-small" alt="" src="${items.goodsImg}">
								</td>
								<td class="text-left">${items.goodsNm}</td>
								<td>${items.goodsClassOneNm}</td>
								<td>${items.goodsClassTwoNm}</td>
								<td>${items.goodsClassThreeNm}</td>
								<td>
									<span class="gridbutton red" onclick="goPage('${items.goodsId}');"><ui:i18n key="编辑"/></span>
									<span class="gridbutton red" onclick="goodsDel('${items.goodsId}');"><ui:i18n key="删除"/></span>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<ui:paging page="${page}" />  
			</div>
		</div>
		<!-- ▲ 查询list区域  -->
		
		
		
	</div>
	<!-- ▲ container  -->
</body>
</html>