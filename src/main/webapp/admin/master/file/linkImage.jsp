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
	query(1, 50); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
 
	var serachTitle = $('.js-search-title', $this).val();
	var serachLinkType = $('#serachLinkType').val();
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
	var url = '/admin/master/file/linkImageFragment.htm';
	 var $this = $('.js-contents');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		
		
		$('.js-picture-img').click(function(){
			var $this = $(this); 
				
			<c:if test="${max eq 1}">
				$('.js-picture-img').not($this).removeClass('selected');
			</c:if>
				
			if($this.hasClass('selected')){
				$this.removeClass('selected');
			}else{
				$this.addClass('selected');
			}
		}); 
		
		  
		
		$('.js-conform').click(function(){
			console.log('---------------');
			
			if(!!window.parent){
				var conformMethod = eval('window.parent.${conformMethod}');
				console.log(conformMethod);
				if(!!conformMethod){
					
					var max = ${max};
					var pictures = [];
					$('.js-picture-img.selected').each(function(){
						pictures.push({
							id : $(this).data('id'),
							pageId: $(this).data('pageId'),
							pageName : $(this).data('pageName'),
							linkUrl : $(this).data('linkUrl'),
							imgFileId : $(this).data('imgFileId'),
							imgFileUrl : $(this).data('imgFileUrl') 
						});
					});
					
					if(pictures.length == 0){
						alert('<ui:i18n key="没有选中的图片"/>!');
						return false;
					}
					
					if(max > 0){//max=0 无限制张数
						if(pictures.length > max){
							alert('<ui:i18n key="最多只能选择{0}图片"  params1="${max}"/>!');
							return false;
						}
					}
					 
					console.log('pictures=');
					console.log(pictures);
					conformMethod(pictures);
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
			<input type="hidden"  name="max" id="max" value="${max }" />
			<input type="hidden"  name="serachLinkType" id="serachLinkType" value="${serachLinkType }" />
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
		  			 	 </div>
		  			 	 <div class="form-control">
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