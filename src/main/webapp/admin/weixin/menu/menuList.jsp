<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<script type="text/javascript" src="/admin/js/popup_layer.js"></script>
</head>
<body>
 
	<!-- ▼ Main container -->
	<div class="container">
	 	
	 	 <!-- ▼ 可排序表格  --> 
	      <div class="result-grid sortable" style="margin-top: 30px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool js-add-menu" onclick="showAddTopMenuWindow(${menuListSize});">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" />
					  	 <span class="tool-name"><ui:i18n key="新建"/></span> 
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" >
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
			      		 		<th colspan="3"><ui:i18n key="一级菜单"/></th>
			      		 		<th  colspan="5"><ui:i18n key="二级菜单"/></th>
			      		 		<th></th>
			      		 		<th> <ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${requestScope.menuList}" var="item" varStatus="status">
			      		 		<c:choose>
									<c:when test="${not empty item.subList }">
										<tr>
						      		 		<td>
						      		 			<div class="arrow-warp">
						      		 				<c:choose>
						      		 					<c:when test="${status.first}">
						      		 						<div class="arrow-up gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-up" onclick="sortToUp(${item.MENU_ID});"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 				<c:choose>
						      		 					<c:when test="${status.last}">
						      		 						<div class="arrow-down gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-down" onclick="sortToDown(${item.MENU_ID});"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 			</div>
						      		 		</td>
						      		 		<td>${item.MENU_NM }</td>
						      		 		<td class="grid-line"></td>
						      		 		<td class="level-two-first"></td>
						      		 		<td class="grid-line"></td>
						      		 		<td class="grid-line"></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td>
						      		 			<span class="gridbutton red" onclick="showAddSecondMenuWindow('${item.MENU_ID}','${item.MENU_NM }','${item.subListSize }');"><ui:i18n key="新建"/></span>
						      		 			<span class="gridbutton red" onclick="showEditTopMenuWindow('${item.MENU_ID}','${item.MENU_NM }');"><ui:i18n key="编辑"/></span>
						      		 			<span class="gridbutton red" onclick="deleteMenu('${item.MENU_ID}');"><ui:i18n key="删除"/></span>
						      		 		</td>
						      		 	</tr>
						      		 	
						      		 	
						      		 	<c:forEach items="${item.subList}" var="subItem" varStatus="subStatus">
											<c:choose>
				      		 					<c:when test="${not subStatus.last}">
				      		 						 <tr>
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td class="level-two-normal"></td>
									      		 		<td class="grid-line"></td>
									      		 		<td>
									      		 			<div class="arrow-warp">
									      		 				<c:choose>
									      		 					<c:when test="${subStatus.first}">
									      		 						<div class="arrow-up gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-up" onclick="sortToUp(${subItem.MENU_ID});"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 				<c:choose>
									      		 					<c:when test="${subStatus.last}">
									      		 						<div class="arrow-down gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-down" onclick="sortToDown(${subItem.MENU_ID});"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 			</div>
									      		 		</td>
									      		 		<td></td>
									      		 		<td class="text-left">${subItem.MENU_NM }</td>
									      		 		<td></td>
									      		 		<td>
									      		 			<span class="gridbutton red" onclick="showModifyMenuPopup('${subItem.MENU_ID}');"><ui:i18n key="编辑"/></span>
									      		 			<span class="gridbutton red" onclick="deleteMenu('${subItem.MENU_ID}');"><ui:i18n key="删除"/></span>
									      		 		</td>
									      		 	</tr>
				      		 					</c:when>
				      		 					<c:otherwise>
				      		 						 <tr class="level-one-last">
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td class="level-two-last"></td>
									      		 		<td class="grid-line"></td>
									      		 		<td>
									      		 			<div class="arrow-warp">
									      		 				<c:choose>
									      		 					<c:when test="${subStatus.first}">
									      		 						<div class="arrow-up gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-up"  onclick="sortToUp(${subItem.MENU_ID});"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 				<c:choose>
									      		 					<c:when test="${subStatus.last}">
									      		 						<div class="arrow-down gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-down"  onclick="sortToDown(${subItem.MENU_ID});"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 			</div>
									      		 		</td>
									      		 		<td></td>
									      		 		<td class="text-left">${subItem.MENU_NM }</td>
									      		 		<td></td>
									      		 		<td>
									      		 			<span class="gridbutton red" onclick="showModifyMenuPopup('${subItem.MENU_ID}');"><ui:i18n key="编辑"/></span>
									      		 			<span class="gridbutton red" onclick="deleteMenu('${subItem.MENU_ID}');"><ui:i18n key="删除"/></span>
									      		 		</td>
									      		 	</tr>
				      		 					</c:otherwise>
				      		 				</c:choose>
																	      		 		
						      		 	</c:forEach>
						      		 	
						      		 	
									</c:when>			      		 			
									<c:otherwise>
										 <tr class="level-one-last">
						      		 		<td>
						      		 			<div class="arrow-warp">
						      		 				<c:choose>
						      		 					<c:when test="${status.first}">
						      		 						<div class="arrow-up gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-up"  onclick="sortToUp(${item.MENU_ID});"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 				<c:choose>
						      		 					<c:when test="${status.last}">
						      		 						<div class="arrow-down gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-down"  onclick="sortToDown(${item.MENU_ID});"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 			</div>
						      		 		</td>
						      		 		<td>${item.MENU_NM }</td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td>
						      		 			<span class="gridbutton red" onclick="showAddSecondMenuWindow('${item.MENU_ID}','${item.MENU_NM }','${item.subListSize }');"><ui:i18n key="新建"/></span>
						      		 			<span class="gridbutton red" onclick="showModifyMenuPopup('${item.MENU_ID}');"><ui:i18n key="编辑"/></span>
						      		 			<span class="gridbutton red" onclick="deleteMenu('${item.MENU_ID}');"><ui:i18n key="删除"/></span>
						      		 		</td>
						      		 	</tr>
									</c:otherwise>
			      		 		</c:choose>
			      		 	</c:forEach>
			      		 </tbody>
			      	</table>
	      		</div>
			  <%--   <ui:paging page="${page }" /> --%>
			    </div>
	      </div>
	      <!-- ▲ 可排序表格  -->
	      
	      <div style="text-align: center; margin-top: 30px;">
	      	<div class="buttons-action">
					<span class="button bg-red js-publish-menu"  onclick="publishMenu();">
						<span class="button-icon conform"></span>
						<span class="button-name"><ui:i18n key="发布"/></span>
					</span>
				</div>
	      </div>
	      
	      
	      <script type="text/javascript">
	      
	      	function sortToUp(menuId){
	      		moveMenu(menuId, 'UP');
	      	}
	      	function sortToDown(menuId){
	      		moveMenu(menuId, 'DOWN');
	      	}
	      	
	      	
	      	function moveMenu(menuId, direction){
	      		$.ajax({
					url : '/admin/weixin/menu/moveMenu.htm',
					data : {
						 MENU_ID : menuId
						, MENU_OPTION : direction
					},
					success : function(res) {
						if (res.success) {
						 location.reload();
						} else {
							alert('<ui:i18n key="请检查信息"/>'+','+res.err_msg+'.');
						}
					},
					error : function(obj, e, msg) {
						alert('<ui:i18n key="网络出现故障"/>'+'.');
					}
				});
	      	}
	      	
	      	function showAddTopMenuWindow(size){
	      		
	      		if(size >= 3){
	      			alert('<ui:i18n key="最多只能添加三个一级菜单，当前已达设置上限"/>.');
	      			return false;
	      		}
	      		
	      	 	$('#addMenuPopup').initForm()  ;
	      		
	      		 showBpopup({
	     			id : 'addMenuPopup',
	     			width : 450 
	     		});	  	 
	      	}
	      	
	      	function addTopMenu(){
	      		var $this = $('#addMenuPopup');
	      		var menuName =  $('.js-menu-name', $this).val();
	      		$.ajax({
					url : '/admin/weixin/menu/addMenu.htm',
					data : {
						 MENU_NM : menuName
					},
					success : function(res) {
						if (res.success) {
						 location.reload();
						} else {
							alert('<ui:i18n key="请检查信息"/>'+','+res.err_msg+'.');
						}
					},
					error : function(obj, e, msg) {
						alert('<ui:i18n key="网络出现故障"/>'+'.');
					}
				});
	      		
	      	}
	      	
	      	function showAddSecondMenuWindow(menuId, menuName,size){
	      		
	      		if(size >= 5){
	      			alert('<ui:i18n key="同一个一级菜单下最多只能添加五个二级菜单，当前已达设置上限"/>.');
	      			return false;
	      		}
	      		
	      		$('#addSecondMenuPopup').initForm();
	      		var $this = $('#addSecondMenuPopup');
	      		$this.data('menuId',menuId);
	      		 $('.js-menu-level-one-name',$this).text(menuName);
	      		 showBpopup({
		     			id : 'addSecondMenuPopup',
		     			width : 450 
		     		});	 
	      		
	      	}
	      	
	      	function addSecondMenu(){ 
	      		var $this = $('#addSecondMenuPopup');
	      		var menuId = $this.data('menuId');
	      		var menuName =  $('.js-menu-name', $this).val();
	      		
	      		
	      		if(!menuId){
	      			alert('<ui:i18n key="菜单ID不能为空"/>.');
	      			return false;
	      		}
	      		if($.trim(menuName)==''){
	      			alert('<ui:i18n key="请输入二级菜单名"/>.')
	      			return false;
	      		}
	      		
	      		$.ajax({
					url : '/admin/weixin/menu/addMenu.htm',
					data : {
						 MENU_ID : menuId
						 ,MENU_NM : menuName
					},
					success : function(res) {
						if (res.success) {
						 location.reload();
						} else {
							alert('<ui:i18n key="请检查信息"/>'+','+res.err_msg+'.');
						}
					},
					error : function(obj, e, msg) {
						alert('<ui:i18n key="网络出现故障"/>'+'.');
					}
				});
	      		
	      	}
	      	
	      	
	      	function showEditTopMenuWindow(menuId,menuName){
	      		var $this = $('#modifyMenuPopup');
	      		$this.data('menuId',menuId);
	      		 $('.js-menu-name',$this).val(menuName);
	      		 showBpopup({
		     			id : 'modifyMenuPopup',
		     			width : 450 
		     		});	 
	      	
	      	}
	      	
	      	function topMenuRename(){ 
	      		var $this = $('#modifyMenuPopup');
	      		var menuId = $this.data('menuId');
	      		var menuName =  $('.js-menu-name', $this).val();
	      		 
	      		
	      		if(!menuId){
	      			alert('<ui:i18n key="菜单ID不能为空"/>.');
	      			return false;
	      		}
	      		if(menuName == ''){
	      			alert('<ui:i18n key="菜单名不能为空"/>.');
	      			return false;
	      		}
	      		
	      		$.ajax({
					url : '/admin/weixin/menu/menuRename.htm',
					data : {
						 MENU_ID : menuId
						 ,MENU_NM : menuName
					},
					success : function(res) {
						if (res.success) {
						 location.reload();
						} else {
							alert('<ui:i18n key="请检查信息"/>'+','+res.err_msg+'.');
						}
					},
					error : function(obj, e, msg) {
						alert('<ui:i18n key="网络出现故障"/>'+'.');
					}
				});
	      		
	      	}
	      	
	      	function modifyMenu(){
	      		
	      	}
	      	
	      	function showModifyMenuPopup(menuId){
	      		var $this = $('#modifySecondMenuPopup');
	      		$this.data('menuId',menuId);
	      		 
	      		var url = '/admin/weixin/menu/modifyMenuPopup.htm';
	      		var params = { MENU_ID : menuId};
	      		$('.js-bpopup-inner', $this).load(url , params ,  function(){
	      			
	      			$('.icradio,.iccheckbox', $this).iCheck({
	      		 	    checkboxClass: 'icheckbox_square-firebrick',
	      		 	    radioClass: 'iradio_square-firebrick',
	      		 	    increaseArea: '0%' // optional
	      		 	  });
	      			
	      			
	      			 $('.js-send-msg',$this).on('ifChecked', function(event){
	      				 $('.js-send-type-label').text('<ui:i18n key="发送内容"/>');
	      				 $('.js-menu-contents',$this).show();
	      				 $('.js-preview',$this).show();
	      				 $('.js-link-url',$this).hide();
						 $('.js-input',$this).hide();
						 $('.js-choose',$this).show();
					 });
	      			 
	      			
	      			 
	      			 $('.js-url',$this).on('ifChecked', function(event){
	      				 $('.js-send-type-label').text('<ui:i18n key="网页地址"/>');
	      				 $('.js-menu-contents',$this).hide();
	      				 $('.js-preview',$this).hide();
	      				 $('.js-link-url',$this).show();
						 $('.js-input',$this).show();
						 $('.js-choose',$this).show();
					 });
	      			 
	      			 $('.js-scancode-push',$this).on('ifChecked', function(event){
	      				 $('.js-send-type-label').text('');
	      				 $('.js-menu-contents',$this).hide();
	      				 $('.js-preview',$this).hide();
	      				 $('.js-link-url',$this).hide();
						 $('.js-input',$this).hide();
						 $('.js-choose',$this).hide();
					 });
	      			 
	      			 $('.js-scancode-waitmsg',$this).on('ifChecked', function(event){
	      				 $('.js-send-type-label').text('');
	      				 $('.js-menu-contents',$this).hide();
	      				 $('.js-preview',$this).hide();
	      				 $('.js-link-url',$this).hide();
						 $('.js-input',$this).hide();
						 $('.js-choose',$this).hide();
					 });
	      			 
					 
	      			$('.js-input',$this).click(function(){
	      				$('.js-link-url', $this).attr('readonly',false);
	      			});
	      			$('.js-preview',$this).click(function(){
	      				console.log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
	      				var pageId = $('.js-send-msg',$this).data('pageId');
	      				var pageType = $('.js-send-msg',$this).data('pageType');
	      				if(typeof(pageId) == 'undefined'){
	      					alert('<ui:i18n key="请选择链接"/>');
	      					return;
	      				}
	      				//alert(pageType);
	      				//window.open('/admin/msgControl/msgControlPreviewWeixin.htm?messageId='+pageId,'newwindow','width=320, height=568, menubar=no, status=no, toolbar=no');
	      				if(Number(pageType) == 95 || pageType == "95" || Number(pageId) < 1000){
	      					window.open('/admin/weixin/reply/previewNewsMaterial.htm?msgId='+pageId,'newwindow','width=272, height=568, menubar=no, status=no, toolbar=no');
	      				}else {
	      					window.open('/admin/msgControl/msgControlPreviewWeixin.htm?messageId='+pageId,'newwindow','width=320, height=568, menubar=no, status=no, toolbar=no');
	      				}
	      				
	      				
	      			});
	      			$('.js-modiy-seconde-menu',$this).click(function(){
	      				var menuId = $this.data('menuId');
	      				var menuName = $('.js-menu-name', $this).val();
	      				var pageId = '';
	      				var pageNm = '';
	      				var pageUrl = '';
	      				var menuOpType = '';
	      				
	      				if(menuName ==''){
	      					alert('<ui:i18n key="菜单名不能为空"/>!');
      						return false;
	      				}
	      				
	      				if($('.js-send-msg').is(':checked')){//click类型
	      					pageId = $('.js-send-msg',$this).data('pageId');
	      					pageNm = $('.js-menu-contents', $this).val();
	      					menuOpType = 'click';
	      					
	      					if(pageId == ''){
	      						alert('<ui:i18n key="发送内容不能为空"/>!');
	      						return false;
	      					}
	      				}else if($('.js-url').is(':checked')){//view类型
	      					pageUrl = $('.js-link-url', $this).val();
	      					menuOpType = 'view';
	      					if(pageUrl == ''){
	      						alert('<ui:i18n key="网页地址不能为空"/>!');
	      						return false;
	      					}
	      				}else if($('.js-scancode-push').is(':checked')){//scancode_push类型
	      					pageId = $('.jjs-scancode-waitmsg',$this).data('pageId');
	      					menuOpType = 'scancode_push';
	      				}else if($('.js-scancode-waitmsg').is(':checked')){//scancode_push类型
	      					pageId = $('.js-scancode-waitmsg',$this).data('pageId');
	      					menuOpType = 'scancode_waitmsg';
	      				} 
	      				
	      				if(menuOpType == ''){
	      					alert('<ui:i18n key="请选择菜单类型"/>!');
      						return false;
	      				}
	      				 
	      				$.ajax({
	    					url : '/admin/weixin/menu/modifyMenu.htm',
	    					data : {
	    						 MENU_ID : menuId
	    						 ,MENU_NM : menuName
	    						 ,MENU_OP_TYPE : menuOpType
	    						 ,MENU_OP_ID : pageId
	    						 ,MENU_OP_TITLE : pageNm
	    						 ,MENU_OP_COM : pageUrl
	    					},
	    					success : function(res) {
	    						if (res.success) {
	    						 location.reload();
	    						} else {
	    							alert('<ui:i18n key="请检查信息"/>'+','+res.err_msg+'.');
	    						}
	    					},
	    					error : function(obj, e, msg) {
	    						alert('<ui:i18n key="网络出现故障"/>'+'.');
	    					}
	    				});
	      				
	      				
	      				
	      			});
	      			
	      			$('.js-choose',$this).click(function(){
	      				
	      				var $th2 = $('.js-bpopup-inner', $('#chooseLinkPopup'));

	      				var serachLinkType = '';
	      				if($('.js-send-msg').is(':checked')){
	      					serachLinkType = 91;
	      					
	      				}else{
	      					serachLinkType = 2;
	      					$('.js-link-url', $this).attr('readonly',true);
	      				}
	      				
	      				$th2.load('/admin/weixin/menu/linkTypePage.htm' , {serachLinkType : serachLinkType} ,  function(){
	      					$('.icradio,.iccheckbox', $th2).iCheck({
	    	      		 	    checkboxClass: 'icheckbox_square-firebrick',
	    	      		 	    radioClass: 'iradio_square-firebrick',
	    	      		 	    increaseArea: '0%' // optional
	    	      		 	  });
	      					$('.select2', $th2).select2({
	      						 minimumResultsForSearch:5
	      						 ,allowClear: true 
	      					 });	
	      					
	      					
	      					$('.js-conform' , $th2).click(function(){
	    	      				var cnt = 0;
	    	      				
	    	      				$('.js-check-item',$th2).each(function(){
	    	      				   if($(this).is(':checked')){
	    	      					 cnt++;
	    	      				   }
	    	      			 	}); 
	    	      				
	    	      				if(cnt == 0){
	    	      					alert('没有选中对象');
	    	      					return false;
	    	      				}
	    	      				
	    	      				if(cnt > 1){
	    	      					alert('只能选择一个');
	    	      					return false;
	    	      				}
	    	      				
	    	      				$('.js-check-item',$th2).each(function(){
	    		      				   if($(this).is(':checked')){
	    		      					 var pageId = $(this).data('pageId');
	    		      					 var pageNm = $(this).data('pageNm');
	    		      					 var pageType = $(this).data('pageType');
	    		      					 var url = $(this).data('url');
	    		      					 console.log('pageId=' + pageId);
	    		      					 console.log('pageNm=' + pageNm);
	    		      					 console.log('pageType=' + pageType);
	    		      					 console.log('url=' + url);
	    		      					 
	    		      					 setLinkValue(pageId, pageNm , pageType , url);
	    		      				   }
	    		      			 	}); 
	    	      				
	    	      				
	    	      				
	    	      			});
	      					
	    	      			$('.js-cancel' ,$th2).click(function(){
	    	      				closeBpopupWindow('chooseLinkPopup');
	    	      			});
	      					
	      					
	      					$('.js-search-link-button', $th2).click(function(){
	      						var serachTitle = $('.js-search-title', $th2).val();
	      						var serachLinkType = $('.js-search-link-type', $th2).select2('val');
	      						queryLinkPage(1, 10,serachTitle, serachLinkType);
	      						
	      					});
	      					
	      				});
	      				
	      				
	      				showBpopup({
			     			id : 'chooseLinkPopup',
			     			width : 810,
			     			top:20 
			     			//,follow: false
			     		});	 
	      			});
	      			 
	      			
	      			showBpopup({
		     			id : 'modifySecondMenuPopup',
		     			width : 660,
		     			top:100 
		     		});	 
	      		});
					  
	      		
	      	}
	      	
	      	function  setLinkValue(pageId, pageNm , pageType , url){
	      		
	      		var $this = $('#modifySecondMenuPopup');
	      		
	      		if(pageType > 90){
	      			$('.js-send-msg', $this).data('pageId', pageId);
	      			$('.js-send-msg', $this).data('pageType', pageType);
	      			$('.js-menu-contents', $this).val(pageNm);
	      		}else{
	      			$('.js-link-url', $this).val(url);
	      		}
	      		closeBpopupWindow('chooseLinkPopup');
	      	}
	      	
	      	
	      	function deleteMenu(menuId){
	      		if (confirm('<ui:i18n key="您确定需要删除吗"/>?')) {
	    			$.ajax({
	    				url : "/admin/weixin/menu/delete.htm",
	    				data : {
	    					MENU_ID : menuId
	    				},
	    				success : function(res){
	    					if (res.success) {
	    						alert('<ui:i18n key="删除成功"/>.');
	   						 	location.reload();
	   						} else {
	   							alert('<ui:i18n key="删除失败"/>\n' + res.err_msg + '.');
	   						} 
	    				},
	    				error : function(a, msg, c){
	    					alert('<ui:i18n key="网络出现故障"/>'+'.');
	    				}
	    			});
	    		}
	      	}
	      	
	      	
	      	function showLinkPage(pageNo, pageSize){
	      		
	      		var $this = $('.js-bpopup-inner', $('#chooseLinkPopup'));
	      		var serachTitle = $('.js-search-title', $this).val();
				var serachLinkType = $('.js-search-link-type', $this).select2('val');
				
				queryLinkPage(pageNo,pageSize,serachTitle,serachLinkType );
	      	}
	      	
	      	function queryLinkPage(pageNo, pageSize,serachTitle, serachLinkType){
	      		var params = {
	      				serachTitle : serachTitle || ''
	      				,serachLinkType : serachLinkType || ''
	      				,pageCurr : pageNo
	      				,pageUnit : pageSize
	      		}
	      		var url = '/admin/weixin/menu/linkTypePageFragment.htm';
	      		 
	      		 var $this = $('.js-link-page-grid');	
	      		 $this.showLoading();
	      		 $this.load(url , params ,  function(){ 
	      			 
      				$('.icradio,.iccheckbox', $this).iCheck({
      		 	    	checkboxClass: 'icheckbox_square-firebrick',
      		 	    	radioClass: 'iradio_square-firebrick',
      		 	    	increaseArea: '0%' // optional
      		 	  	});
	      			 
	      			$('.select2',$this).select2({
	      				 minimumResultsForSearch:5
	      				 ,allowClear: true 
	      			 });
	      			
	      			
	      			$('.js-conform' , $this).click(function(){
	      				var cnt = 0;
	      				
	      				$('.js-check-item',$this).each(function(){
	      				   if($(this).is(':checked')){
	      					 cnt++;
	      				   }
	      			 	}); 
	      				
	      				if(cnt == 0){
	      					alert('没有选中对象');
	      					return false;
	      				}
	      				
	      				if(cnt > 1){
	      					alert('只能选择一个');
	      					return false;
	      				}
	      				
	      				$('.js-check-item',$this).each(function(){
		      				   if($(this).is(':checked')){
		      					 var pageId = $(this).data('pageId');
		      					 var pageNm = $(this).data('pageNm');
		      					 var pageType = $(this).data('pageType');
		      					 var url = $(this).data('url');
		      					 console.log('pageId=' + pageId);
		      					 console.log('pageNm=' + pageNm);
		      					 console.log('pageType=' + pageType);
		      					 console.log('url=' + url);
		      					 
		      					 setLinkValue(pageId, pageNm , pageType , url);
		      					 
		      					  
		      					 
		      				   }
		      			 	}); 
	      				
	      			});
	      			
	      			$('.js-cancel' , $this).click(function(){
	      				closeBpopupWindow('chooseLinkPopup');
	      			});
	      			 $this.hideLoading();
	      		 });
	      		
	      	}
	      	
	      	
	      //菜单发布-批量
	    	function publishMenu() {
	    		
	    		if (confirm('<ui:i18n key="您确定要发布吗"/>?')) {
	    			
	    			$.ajax({
	    				url : "/admin/weixin/menu/publishMenu.htm",
	    				data : {},
	    				success : function(res){
	    					if (res.success) {
	    						alert('<ui:i18n key="发布成功"/>.\n<ui:i18n key="请注意"/>,<ui:i18n key="由于微信客户端缓存"/>,\n<ui:i18n key="需要24小时微信客户端才会展现出来"/>');
	   						 	//location.reload();
	   						} else {
	   							alert('<ui:i18n key="发布失败"/>\n' + res.err_msg + '.');
	   						} 
	    				},
	    				error : function(a, msg, c){
	    					alert('<ui:i18n key="网络出现故障"/>'+'.');
	    				}
	    			});
	    			
	    			/* $.ajax({
	    				data : {SEARCH_TYPE : "3"},
	    				type : "POST",
	    				url : "/admin/weixin/menu/ajaxCheck.htm",
	    				dataType : "json",
	    				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    				success : function(data) {
	    						
	    					var list = data.reList;
	    					if (list.length > 0) {
	    						
	    						alert('${label.菜单必须指定操作}.\n${label.如果存在二级菜单},${label.二级菜单必须指定操作}');
	    						return;
	    					} else {

	    						$.ajax({
	    							data : {MENU_ID : ""},
	    							type : "POST",
	    							url : "/admin/weixin/menu/publish.htm",
	    							dataType : "json",
	    							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    							success : function(res) {
	    								
	    								if (res.success) {
	    									
	    									alert('${label.发布成功}\n${label.请注意}，${label. 由于微信客户端缓存}，\n${label.需要24小时微信客户端才会展现出来}');
	    									location.reload();
	    								} else {
	    									
	    									alert("${label.发布失败}!\n" + res.err_msg);
	    								}
	    							},
	    							error : function(obj, e, msg) {
	    								alert("${label.网络出现故障}.");
	    							}
	    						});
	    					}
	    				},
	    				error : function(obj, e, msg) {
	    					alert("${label.网络出现故障}.");
	    				}
	    			}); */
	    		}
	    	}	
	      </script>
	 
	 	 
	 
	 
		 
	</div>
	<!-- ▲ Main container -->
		
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="addMenuPopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="添加一级菜单"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 100px;">
					  			 	 	<ui:i18n key="菜单名"/><a class="label-required"></a> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  class="js-menu-name w21" placeholder="<ui:i18n key="请输入菜单名"/>"  >
					  			 	 </div>
					  			 </div> 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="addTopMenu();">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="">
												<span class="button-icon cancel"></span>
												<span class="button-name"><ui:i18n key="取消"/></span>
											</span>
						  				</div>
					  				</div>
					  			 </div>
					  		</div>	 
	 		 	    </form>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->	
	
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="addSecondMenuPopup"> 
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="添加二级菜单"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 100px;">
					  			 		<ui:i18n key="一级菜单名"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<!-- <input type="text"  class="js-menu-level-one-name w21" placeholder="" disabled="disabled"  > -->
					  			 	 	<span class="js-menu-level-one-name"></span>
					  			 	 </div>
					  			 </div> 
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 100px;">
					  			 		<ui:i18n key="二级菜单名"/><a class="label-required"></a> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  class="js-menu-name w21" placeholder="<ui:i18n key="请输入二级菜单名"/>"  >
					  			 	 </div>
					  			 </div> 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="addSecondMenu();">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="">
												<span class="button-icon cancel"></span>
												<span class="button-name"><ui:i18n key="取消"/></span>
											</span>
						  				</div>
					  				</div>
					  			 </div>
					  		</div>	 
	 		 	    </form>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->	
	
	
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="modifyMenuPopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="修改一级菜单名称"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 100px;">
					  			 	<ui:i18n key="菜单名"/><a class="label-required"></a> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  class="js-menu-name w21" placeholder="<ui:i18n key="请输入菜单名"/>"  >
					  			 	 </div>
					  			 </div> 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="topMenuRename();">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="">
												<span class="button-icon cancel"></span>
												<span class="button-name"><ui:i18n key="取消"/></span>
											</span>
						  				</div>
					  				</div>
					  			 </div>
					  		</div>	 
	 		 	    </form>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->	
	
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="modifySecondMenuPopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="修改二级菜单"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <!-- ======== -->
	 		 	    <!-- ======== -->
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->	
	
	
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="chooseLinkPopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="选择链接页面"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <!--  -->
	 		 	    	
	 		 	    
	 		 	    
	 		 	    <!--  -->
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->	
	 
 
</body>
</html>