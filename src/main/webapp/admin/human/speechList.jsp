<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
 
<style type="text/css">
.result-grid-tool img {margin-bottom: -2px;}
.red2 {color: #c5c5c5;}
.selectCss {width: 230px;}
</style> 
 
<script type="text/javascript">

	$(function(){
		
		$('.js-serach').click(function(){
			
			newAdd();
			search();
		});
	});
	
	function newAdd() {
		
		$.ajax({
			type : "POST",
			url : "/admin/human/ingCheck.htm",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(res) {

				if (res.success) {
					
					if (res.getCount == 0 && $(".result-grid-tools").length == 0) {
						
						var newAdd = '<div class="result-grid-tools">' +
									     '<span class="result-grid-tool" onclick="goPage(\'\',\'N\');">' +
										    '<img alt="" src="/admin/images/goods/plus.png" />' +
											'<span class="tool-name"><ui:i18n key="新建"/></span>' +
					      		         '</span>' +
					   				 '</div>';
					   	$('.result-grid-header').append(newAdd);
					} else {
						
						$(".result-grid-tools").remove();
					}
				}
			},
			error : function(obj, e, msg) {
				
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
	
	function goodsDel(id) {

		if (id == "") {
			
			alert('<ui:i18n key="请重新打开此页面"/>.');
			return;
		}
		
		if (confirm('<ui:i18n key="您确定删除该演讲吗"/>?')) {
			
			$.ajax({
				data : {lectId : id},
				type : "POST",
				url : "/admin/human/delete.htm",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {

					if (res.success) {
						
						alert('<ui:i18n key="删除成功"/>.');
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
					} else {
						
						alert('<ui:i18n key="操作失败"/>\n' + res.err_msg + '.');
					}
				},
				error : function(obj, e, msg) {
					
					alert('<ui:i18n key="网络出现故障"/>.');
				}
			});
		}
	}
	
	function goodsEnd(id, optionId) {

		if (id == "") {
			
			alert('<ui:i18n key="请重新打开此页面"/>.');
			return;
		}
		
		if (confirm('<ui:i18n key="您确定结束该演讲吗"/>?')) {
			
			$.ajax({
				data : {lectId : id},
				type : "POST",
				url : "/admin/human/end.htm",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {

					if (res.success) {
						
						goPage(id, optionId);
					} else {
						
						alert('<ui:i18n key="操作失败"/>\n' + res.err_msg + '.');
					}
				},
				error : function(obj, e, msg) {
					
					alert('<ui:i18n key="网络出现故障"/>.');
				}
			});
		}
	}
	
	function goodsIng(id) {

		if (id == "") {
			
			alert('<ui:i18n key="请重新打开此页面"/>.');
			return;
		}
		
		if (confirm('<ui:i18n key="您确定进行该演讲吗"/>?')) {

			$.ajax({
				data : {lectId : id},
				type : "POST",
				url : "/admin/human/ingCheck.htm",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {

					if (res.success) {
						if (res.getCount == 0) {
							
							$.ajax({
								data : {lectId : id},
								type : "POST",
								url : "/admin/human/ing.htm",
								dataType : "json",
								contentType : "application/x-www-form-urlencoded; charset=UTF-8",
								success : function(res) {

									if (res.success) {
										
										alert('<ui:i18n key="操作成功"/>.');
										var pageCurr = Number($('#currentPage').find('option:selected').val());
										var pageUnit = Number($('#pageUnit').find('option:selected').val());
										showPage(pageCurr,pageUnit);
									} else {
										
										alert('<ui:i18n key="操作失败"/>\n' + res.err_msg + '.');
									}
								},
								error : function(obj, e, msg) {
									
									alert('<ui:i18n key="网络出现故障"/>.');
								}
							});
						} else {
							
							alert('<ui:i18n key="请先结束进行中的演讲"/>.');
						}
					} else {
						
						alert('<ui:i18n key="操作失败"/>\n' + res.err_msg + '.');
					}
				},
				error : function(obj, e, msg) {
					
					alert('<ui:i18n key="网络出现故障"/>.');
				}
			});
		}
	}
	
	function goPage(lectId, optionId) {
		
		displayCreate('/admin/human/speechPublish.htm?lectId='+lectId+'&optionId='+optionId);
	}
	
	function displayCreate(url,name,icon) {
		
		parent.ggShowTab({
			'url' : url || '',
			'name' : '<ui:i18n key="演讲编辑"/>',
			'icon' : 'shopoperation' 
		});  
	}
	
	function displayModify(url,name,icon) {
		
		parent.ggShowTab({
			'url' : url || '',
			'name' : '<ui:i18n key="演讲管理修改"/>',
			'icon' : 'shopoperation' 
		});  
	}
	
/* 	function displayCopy(url,name,icon) {
		
		parent.ggShowTab({
			'url' : url || '',
			'name' : '编辑商品详情',
			'icon' : 'shopoperation' 
		});  
	} */
	
	function showPage(pageNo, pageSize) {
		window.scrollTo(0,0);
		query(pageNo, pageSize);
	}

	function search() {
		
		query(1, 10); 
	}

	function query(pageNo, pageSize) {
		
		//console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var lectDt = $.trim($('input[name=lectDt]').val());
		var lectId = $('#lectNm').find('option:selected').val();
		var params = {
				lectDt	: lectDt,
				lectId	: lectId,
				pageCurr : pageNo,
				pageUnit : pageSize
			}
		var url = '/admin/human/speechListFragment.htm';		 
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
						<td class="flabel"><ui:i18n key="演讲日期"/>：</td>
						<td class="fcomp">
							<input type="text" name="lectDt" class="datepicker calendar date1" />
						</td>
						<td class="flabel"><ui:i18n key="演讲题目"/>：</td>
						<td class="fcomp">
							<select id="lectNm" class="select2 selectCss" data-placeholder='<ui:i18n key="请选择演讲题目"/>'>
								<option value=""></option>
								<c:forEach items="${requestScope.getLectNmList}" var="items" varStatus="status">
									<option value="${items.LECT_ID}">${items.LECT_NM}</option>
								</c:forEach>
							</select>
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
				<c:if test="${requestScope.getCount eq 0}">
					<div class="result-grid-tools">
						<span class="result-grid-tool" onclick="goPage('','N');">
							<img alt="" src="/admin/images/goods/plus.png" />
							<span class="tool-name"><ui:i18n key="新建"/></span> 
	      		   		</span>
	   				</div>
				</c:if>
   			</div>
			<div class="js-grid-content">
				<div class="result-data-warp">
					<table class="result-grid-table">
			 			<colgroup>
				 			<col width="84px" />
				 			<col width="20%" />
				 			<col width="12%" />
				 			<col width="25%" />
				 			<col width="9%" />
				 			<col width="8%" />
				 			<col />
						</colgroup>
						<thead class="result-grid-thead">
							<tr>
								<th><ui:i18n key="演讲图片"/></th>
								<th><ui:i18n key="演讲题目"/></th>
								<th><ui:i18n key="演讲日期"/></th>
								<th><ui:i18n key="演讲介绍"/></th>
								<th><ui:i18n key="主讲人姓名"/></th>
								<th><ui:i18n key="状态"/></th>
								<th><ui:i18n key="操作"/></th>
							</tr>
						</thead>
						<tbody class="result-grid-tbody">
							<c:forEach items="${requestScope.list}" var="items" varStatus="status">
							<tr>
								<td class="pic">
									<img class="pic-small" alt="" src="${items.BANNER_URL}">
								</td>
								<td>${items.LECT_NM}</td>
								<td>${items.LECT_DT}</td>
								<td><div style="overflow-y: auto; height: 70px; text-align: left;">${items.LECT_DESC}</div></td>
								<td>${items.LECTURER_NM}</td>
								<td>${items.STATUS_NM}</td>
								<td>
									<c:choose>
										<c:when test="${items.STATUS eq 1}">
											<span class="gridbutton red" onclick="goPage('${items.LECT_ID}','N');"><ui:i18n key="编辑"/></span>
											<span class="gridbutton red" onclick="goodsDel('${items.LECT_ID}');"><ui:i18n key="删除"/></span>
											<span class="gridbutton red" onclick="goodsEnd('${items.LECT_ID}','E');"><ui:i18n key="结束"/></span>
										</c:when>
										<c:otherwise>
											<span class="gridbutton red" onclick="goPage('${items.LECT_ID}','E');"><ui:i18n key="编辑"/></span>
											<span class="gridbutton red2"><ui:i18n key="删除"/></span>
											<span class="gridbutton red2"><ui:i18n key="结束"/></span>
										</c:otherwise>
									</c:choose>
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