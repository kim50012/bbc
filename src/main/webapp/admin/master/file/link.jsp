<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <link rel="stylesheet" type="text/css" href="/admin/css/popup/popup-v2.css" />

<script type="text/javascript">

 console.log('max=${max}');
 console.log('conformMethod=${conformMethod}');
 console.log('clsoeMethod=${clsoeMethod}');
 console.log('fileGroup=${fileGroup}');
 console.log('fileName=${fileName}');

 $(function(){
	 
	 search();
 })
</script>

<script type="text/javascript">
function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
 
	var serachTitle = $('.js-search-title', $this).val();
	var serachLinkType = $('.js-search-link-type', $this).select2('val');
	var max = $('#max').val();
	var conformMethod = $('#conformMethod').val();
	var clsoeMethod = $('#clsoeMethod').val();
	
	var params = {
			serachTitle : serachTitle 
			,serachLinkType : serachLinkType  
			,conformMethod : conformMethod
			,clsoeMethod : clsoeMethod
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/master/file/linkFragment.htm';
	 var $this = $('.js-contents');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		
		 $this.find('.icradio').iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	  });
		
		$('.js-conform').click(function(){
			console.log('---------------');
			
			if(!!window.parent){
				var conformMethod = eval('window.parent.${conformMethod}');
				console.log(conformMethod);
				if(!!conformMethod){
					var checkedCount = $('.js-link-item:checked').size();
				 	if(checkedCount == 0){
						 alert('<ui:i18n key="请选择链接地址"/>.');
						 return false;
					}
				 	
				 	if(checkedCount > 1){
						 alert('<ui:i18n key="只能选择链接地址"/>.');
						 return false;
					}
				 	
				 	var linkItem = {
						pageId : $('.js-link-item:checked').data('pageId')
						,pageNm : $('.js-link-item:checked').data('pageNm')
						,pageType :$('.js-link-item:checked').data('pageType')
						,url :$('.js-link-item:checked').data('url')
					}
					conformMethod(linkItem);
				}
			}
			 
			/* 
			if(!!window.parent && !!window.parent.settingMainImgae){
				window.parent.settingMainImgae(data);
			}
			 */
			
		}); 
		$('.js-cancel').click(function(){
			if(!!window.parent){
				var clsoeMethod = eval('window.parent.${clsoeMethod}');
				console.log(clsoeMethod);
				if(!!clsoeMethod){
					clsoeMethod(1111111111);
				}
			}
		}); 
		
		 $this.hideLoading();
	 });
	 
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="popup-container"> 
		<form id="searchForm" action="">
			<input type="hidden"  name="conformMethod" id="conformMethod" value="${conformMethod }" />
			<input type="hidden"  name="clsoeMethod" id="clsoeMethod" value="${clsoeMethod }" />
		</form>
		
		<div class="popup-top-area clearfix">
			  <form action="">
		    		<div class="form-warp clearfix" style="padding: 13px 20px;" >
		  			 <div class="control-warp"  >
		  			 	 <div class="form-label" style="width: 80px;">
		  			 		<ui:i18n key="标题"/>: 
		  			 	 </div>
		  			 	 <div class="form-control">
		  			 	 	<input type="text"  class="js-search-title w15" placeholder=""  >
		  			 	 	
		  			 	 </div>
		  			 	 
		  			 	 
		  			 	 <div class="form-label" style="width: 80px;">
		  			 	 <c:choose>
		  			 	 	<c:when test="${ serachLinkType gt 90}">
		  			 	 		<ui:i18n key="消息类型"/>: 
		  			 	 	</c:when>
		  			 	 	<c:otherwise>
		  			 	 		<ui:i18n key="链接类型"/>: 
		  			 	 	</c:otherwise>
		  			 	 </c:choose>
		  			 	 </div>
		  			 	 <div class="form-control">
		  			 	 	<select class="js-search-link-type select2 sw15" data-placeholder="<ui:i18n key="请选择"/>...">
		  		 					<c:forEach items="${linkTypeCombo }" var="item">
		  		 						<option value="${item.comboKey }" <c:if test="${item.comboKey eq serachLinkType}"> selected="selected" </c:if>>${item.comboValue }</option>
		  		 					</c:forEach>	
		  		 				</select>
		  			 	 </div>
		  			 	  <span class="button bg-red  js-search-link-button" style="float: right;"  onclick="search();">
							<span class="button-icon search"></span>
							<span class="button-name"><ui:i18n key="查询"/></span>
						</span> 
		  			 </div> 
	  			</div>
		    </form>
		</div>	
	 
		<div class="js-contents">
		</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>