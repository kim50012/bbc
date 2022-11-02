<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title>${label.日志管理}::${label.添加日志}</title>
<link rel="stylesheet" type="text/css" href="/admin/css/goods/blog-editor.css" />
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

		$('.js-to-step3').click(function() {
			 
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
			
			var item = $('#blog-main-img-add').data(
					'field-item')
					|| [];
			if (item.length == 0) {
				alert('${label.请选择商品主图片}');
				return;
			}

			$('.js-goods-step-img').removeClass('goods-step-1').removeClass('goods-step-2').addClass('goods-step-3');
			$('.goods-content-step').hide();
			$('.js-goods-content-step-3').show();
			$('.app-sidebar').hide();
			$('body,html').animate({scrollTop : 0}, 100);

		});

		$('.js-preview-setp2').click(function() {
				$('.js-goods-step-img').removeClass('goods-step-1').removeClass('goods-step-3').addClass('goods-step-2');
				$('.goods-content-step').hide();
				$('.js-goods-content-step-2').show();
				$('body,html').animate({ scrollTop : 0 }, 100);

			});

		$(window).scroll(function() {
			if (!$('.js-goods-content-step-3').is(':hidden')) {
				$('.js-field-area').animate({
					top : _.max([$('#step-content-region').offset().top - $(document).scrollTop(), 60 ])
				}, 100);
			}
		});

		$('#blog-main-img-add').click(function() {
			
			showBpopupWindow({
				id:'bpopup',
				height:'500',
				action: '/admin/weixin/material/showImageWindow.htm?fileGroup=3&type=1'
			});
		 
		});
		$("#openBlogClassifyManager").click(function(){
			var wNum=document.body.clientWidth;
			var lNum=(wNum-800)/2;
			window.open('/admin/blog/blogClassifyManager.htm','newwindow','width=800,height=500,top=100,left='+lNum);
		});
		$('#blogGroupAdd').popover({
			placement : 'bottom',
			html : true,
			content : ' <div style="">'
					+ '		<input type="text" class="inval" placeholder="${label.请输入日志分类名}..." style="margin-top:5px;" class="w21">'
					+ '		<span class="btn js-btn-confirm">${label.确认}</span>'
					+ '		<span class="btn js-btn-cancel">${label.取消}</span>'
					+ '</div>'
		});

		var blogGroupAddPopover = $('#blogGroupAdd').data('popover');

		blogGroupAddPopover.tip().on(
				'click',
				'.js-btn-confirm',
				function(evt) {
					var $input = $(this).siblings('input');
					var blogGrupName = $input.val().trim() || '';
					if (blogGrupName == '') {
						alert('${label.请输入日志分类名}');
						return;
					}

					$.ajax({
						data : {
							blogGrupName : blogGrupName
						},
						type : "POST",
						url : "/admin/blog/saveBlogGroup.htm",
						success : function(data) {
							if (data.success) {
								alert('${label.添加成功}');
								$('#blogGroup').append(
										'<option value="' + data.OUT_BG_ID + '">'
												+ data.OUT_BG_NM
												+ '</option>');
								$('#blogGroup').select2('val',
										data.OUT_BG_ID);
								$('#blogGroupAdd').popover('hide');
							} else {
								alert(data.errorMsg);
								$input.val('');
							}
						},
						error : function(xhr, status, e) {
							alert("error: " + status);
						}
					});

				});

		blogGroupAddPopover.tip().on('click', '.js-btn-cancel', function(evt) {
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
 
	<!-- ▼ Main container -->
	<div class="container" style="height: 499px">

		<%--  --%>
		<!-- ▼ detali content  -->
		<div class="ui-right-content" style="min-height: 499px">
			<form action="">
				<input type="hidden" id="goodsId" value="${displayMaster.GOODS_ID }" />
				<input type="hidden" id="displayId"
					value="${displayMaster.DISPLAY_ID }" /> <input type="hidden"
					id="gcId" value="${displayMaster.GC_ID }" /> <input type="hidden"
					id="pageId" value="${pageHeader.pageId }" />
			</form>

			<form id="previewForm" method="post" target="_preview"
				action="/admin/goods/displayPreview.htm">
				<input type="hidden" id="jsonStr" name="jsonStr" value="" />
			</form>

			<div class="goods-step-area">
				<div class="text-top clearfix">
					<div>
						<ul class="ui-nav-tab">
							<li>${label.编辑基本信息}</li>
							<li>${label.编辑详情}</li>
						</ul>
					</div>
				</div>


				<div class="goods-step goods-step-2 js-goods-step-img clearfix"></div>

				<div class="goods-content-step js-goods-content-step-2" style="">
					<div class="title-area">
						<div class="title-desc">
							<a class="icons-pen" href="javascript:void(0);"></a> <span>${label.编辑基本信息}</span>
						</div>

					</div>

					<div class="form-group clearfix">


						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.日志标题}<a class="label-required"></a> :
							</div>
							<div class="form-control">
								<input type="text" id="blogTitle" placeholder="${label.请输入日志标题}..."class="w42" value="">
							</div>
						</div>
						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.日志内容}<a class="label-required"></a> :
							</div>
							<div class="form-control">
								<textarea id="blogDetail" cols="100" class="w42" style="height: 60px; text-align: left;"></textarea>
							</div>
						</div>
						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.日志分类}<a class="label-required"></a> :
							</div>
							<div class="form-control">
								<select id="blogGroup" data-placeholder="${label.请选择}"
									class="select2 sw42">
									<option value=""></option>
									<c:forEach items="${requestScope.blogGroupList}" var="items" varStatus="status">
										<option value="${items.BG_ID}">${items.BG_NM}</option>
									</c:forEach>
								</select> <img id="blogGroupAdd" src="/admin/images/icon/icon-plus2.png"
									title="${label.添加BlogGroup}" style="cursor: pointer; margin-left: 10px;">
									<img  id="openBlogClassifyManager" src="/admin/images/icon/list.png" style="cursor: pointer; margin-left: 5px;"/>
							</div>
						</div>

						<div class="control-group">
							<div class="form-label">
								<a class="label-prefix"></a>${label.主图片}<a class="label-required"></a> :
							</div>
							<div class="controls">
								<ul class="module-goods-list clearfix js-main-img ">
									<li id="blog-main-img-add"><a href="javascript:void(0);"
										class="add-goods"><i class="icon-plus3"></i></a></li>
								</ul>
							</div>
						</div>

						<div class="control-group">
							<div class="form-label">&nbsp;</div>
							<div class="controls">
								<span style="color: red;">${label.图片推荐尺寸}：(320px * 320px)</span>
							</div>
						</div>

					</div>

					<div class="navi-button-area">
						<!-- <span class="btn-step js-preview-setp1" ><span>上一步</span></span> -->
						<span class="btn-step js-to-step3"><span>${label.下一步}</span></span>
					</div>
				</div>
				<!-- end js-goods-content-step-2 -->

				<div class="goods-content-step js-goods-content-step-3"
					style="display: none;">
					<div class="step-sp clearfix"></div>
					<div class="js-field-area" style="left:0">
						<div class="field-area-header" style="">${label.添加内容}</div>
						<ul>
							<li><a class="js-new-field" data-field-type="type-01">${label.图片滚动}</a></li>
							<li><a class="js-new-field" data-field-type="type-05">${label.商品列表}</a></li>
							<li><a class="js-new-field" data-field-type="type-12">1${label.张图}</a></li>
							<li><a class="js-new-field" data-field-type="type-13">2${label.张图}</a></li>
							<li><a class="js-new-field" data-field-type="type-18">3${label.张图}</a></li>
							<li><a class="js-new-field" data-field-type="type-20">${label.标题栏}</a></li>
							<li><a class="js-new-field" data-field-type="type-99">${label.富文本}</a></li>
						</ul>
					</div>

					<!-- - -->
					<div class="app-init-container">
						<div id="app-region" class="app__content">
							<div class="goods-edit-area">
								<!-- --- -->
								<div id="step-content-region">
									<div class="app-design clearfix">
										<div class="app-preview">
											<div class="app-header"></div>
											<div class="app-entry">
												<div class="app-config">
													<div id="app-field-header" class="app-field"
														style="cursor: default; display: none;" data-field-type="header" >
														<h1>
															<span></span>
														</h1>

													</div>
													 
												</div>
												<div class="app-fields js-fields-region">
													<div class="app-fields ui-sortable">
														<!-- edding area -->
														<!-- edding area -->

													</div>
												</div>
											</div>
											<div class="app-footer"></div>

										</div>
										<div class="app-sidebar" style="margin-top: -1000px; "></div>
									</div>
								</div>
								<!-- --- -->

							</div>
						</div>
					</div>
					<!-- - -->
					<div class="navi-button-area">
						<span class="btn-step js-preview-setp2"><span>${label.上一步}</span></span> <span
							class="btn-step js-btn-load"><span>${label.保存}</span></span> <span
							class="btn-step js-btn-unload" style="display: none;"><span>${label.下架}</span></span>
						<span class="btn-step js-btn-preview"  style="display: none;"><span>${label.预览}</span></span>
					</div>
				</div>
				<!--js-goods-content-step-3 -->

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
		$(function() {
			$('.ui-sortable').sortable({
				axis : "y"
			});
			$(".ui-sortable").disableSelection();
			$('.app-field:first').trigger("click");
			$('.app-field').click(bindShowSidebar);

			//保存
			$('.js-btn-load')
					.click(
							function() {

								if (isPublishing) {
									return false;
								}
								var item = $('#blog-main-img-add').data(
										'field-item')
										|| [];
								//var item =  $('#app-field-header').data('field-item') || [];
								//  var item2 = $('#app-field-header').data('field-item2') || [];
								if (item.length < 1) {
									alert('${label.请选择商品主图片}');
									isPublishing = false;
									return false;
								}
								/*  if(item2.length < 1){
								   alert('请选择商品展示图');
								   isPublishing =  false;
								   return false;
								 } */

								var pp = {};
								pp.blogTitle = $('#blogTitle').val();
								pp.blogDetail = $('#blogDetail').val();
								pp.blogGroup = $('#blogGroup').val();
								pp.mainImgId = item[0].id;
								/* for(var i = 0 ; i  < item2.length ; i++){
									eval('('+ 'pp.goodsDtlSlideImg' + (i+ 1) + ' =  item2[' +i + '].id )');
								} */

								var params = [];
								$('.js-fields-region .app-field')
										.each(
												function(idx) {
													var $item = $(this);
													var type = $item
															.data('field-type');
													if (type == 'type-01') {
														var item = $item
																.data('field-item')
																|| [];
														var obj = {
															type : type,
															item : item
														}
														params.push(obj);

													} else if (type == 'type-05') {
														var goods_group = $item
																.data('field-goods_group')
																|| '';
														var size = $item
																.data('field-size');
														var goods_number_type = $item
																.data('field-goods_number_type');
														var obj = {
															goods_group : goods_group,
															type : type,
															size : size,
															goods_number_type : goods_number_type
														}
														params.push(obj);
													} else if (type == 'type-12') {
														var item = $item
																.data('field-item')
																|| [];
														var obj = {
															type : type,
															item : item
														}
														params.push(obj);
													} else if (type == 'type-13') {
														var item = $item
																.data('field-item')
																|| [];
														var leftWidht = $item
																.data('field-left-width') || 50;
														var obj = {
															type : type,
															item : item,
															leftWidht : leftWidht
														}
														params.push(obj);
													} else if (type == 'type-18') {
														var item = $item
																.data('field-item')
																|| [];
														var obj = {
															type : type,
															item : item
														}
														params.push(obj);
													} else if (type == 'type-20') {
														var name = $item
																.data('field-name')
																|| '';
														var link = $item
																.data('field-link')
																|| '';
														var linkType = $item
																.data('field-link-type')
																|| '1';
														var obj = {
															type : type,
															name : name,
															link : link,
															linkType : linkType
														}
														params.push(obj);
													} else if (type == 'type-99') {
														var name = $item
																.attr('data-field-name')
																|| '';
														var obj = {
															type : type,
															content : $item
																	.find(
																			'.js-richtext')
																	.html()

														}
														params.push(obj);
													}

												});

								pp.tpls = params;
								//   alert(JSON.stringify(pp)); 
								
								$('body').showLoading({'vPos':'200px'   });
								
								$.ajax({
											url : "/admin/blog/createBlog.htm",
											type : "POST",
											data : {
												jsonStr : JSON.stringify(pp)
											},
											success : function(data) {
												$('body').hideLoading();
												if (data.success) {
													alert('${label.保存成功}');
													window.location.href = '/admin/shopLack/blogControl.htm';
												} else {
													alert('${label.保存失败}!' + data.msg );
													isPublishing = false;
												}
											},
											error : function(xhr, status, e) {
												$('body').hideLoading();
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
				shopGoodsClassLevelOneCombo = data || [];
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
	</script>
	<script type="text/javascript">
		$(function() {
	
			$('#goodsClassAdd').click(
					function() {
						$('#modal_test').find('.modal-title').text('${label.添加商品分类}');
						$('#ifr_001').attr("src",
								'/admin/goods/addShopGoodsClass.htm');

						$('#modal_test').on('show', function() {
							//$('#ifr_001').attr("src",'/admin/goods/addShopGoodsClass.htm');        
						});

						$('#modal_test').modal({
							backdrop : 'static',
							keyboard : false
						//,  remote:'/admin/goods/list.htm'
						}).css({
							'position' : 'absolute',
							'top' : '100px',
							width : '600px',
							'margin-left' : function() {
								return -($(this).width() / 2);
							}
						});
					});

			$('#addGoodsSpec').click(
					function() {
						$('#modal_test').find('.modal-title').text('${label.添加商品规格}');
						$('#ifr_001').attr(
								"src",
								'/admin/goods/addShopGoodsSpec.htm?gc_id='
										+ gcId);
						$('#modal_test').on('show', function() {
							//$('#ifr_001').attr("src",'/admin/goods/addShopGoodsSpec.htm?gc_id=' + gcId);        
						});

						$('#modal_test').modal({
							backdrop : 'static',
							keyboard : false
						//,  remote:'/admin/goods/list.htm'
						}).css({
							'position' : 'absolute',
							'top' : '100px',
							width : '600px',
							'margin-left' : function() {
								return -($(this).width() / 2);
							}
						});
					});

			$('#modal_test').on('hidden.bs.modal', function(event) {
				$('#modal_test').find('.modal-title').text('');
				$('#ifr_001').attr("src", '');
			});

		})
	</script>
	<%@ include file="/admin/template/blogEditorTemplate-v2.jsp"%>

</body>
</html>