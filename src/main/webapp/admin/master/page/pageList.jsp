<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="浏览量数据管理"/></title> 
<style type="text/css">

.limit-span{
 	word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;
 	margin-left:0;
 	text-align: center;
 	width:100%;
 }
</style>
<script type="text/javascript">
$(function(){
	$(".js-add-page").click(function(){
		 $('#createPagePopup input').val('');
		 showBpopup({
			id : 'createPagePopup',
			width : 450 
		});	  	 
	});
});


//打开修改页面
function showUpdatePoupe(pageTp,pageNm,pageUrl,pageGroup,pageGroup2){
	$('#pageTp').val(pageTp);
	$('#pageNm_up').val(pageNm);
	$('#pageUrl_up').val(pageUrl);
	$('#pageGroup_up').val(pageGroup);
	$('#pageGroup2_up').val(pageGroup2);
	showBpopup({
		id : 'updatePagePopup',
		width : 450 
	});	  	 

}

//保存
function save(){
	var pageNm = $('#pageNm_cr').val();
	var pageUrl = $('#pageUrl_cr').val();
	var pageGroup = $('#pageGroup_cr').val();
	var pageGroup2 = $('#pageGroup2_cr').val();
	if(pageNm == ''){
		alert('<ui:i18n key="页面名称不能为空"/>.');
		return;
	}
	if(pageUrl == ''){
		alert('<ui:i18n key="页面链接不能为空"/>.');
		return;
	}
	if(pageGroup == ''){
		alert('<ui:i18n key="页面分类不能为空"/>.');
		return;
	}
	var params = {
			jobType : 'I'
			,pageNm : pageNm
			,pageUrl : pageUrl
			,pageGroup : pageGroup
			,pageGroup2 : pageGroup2
	};
	$.ajax({
		data : params,
		url : '/admin/master/page/save.htm',
		success : function(res){
			if(res.success){
				alert('<ui:i18n key="保存成功"/>.');
				$('#createPagePopup').bPopup().close(); 
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				
			}else{
				alert(res.err_msg);
			}
		},
		error : function(a, msg, c){
			alert('<ui:i18n key="网络出现故障"/>.');
		}
	});
}
//修改
function update(){
	var pageTp = $('#pageTp').val();
	var pageNm = $('#pageNm_up').val();
	var pageUrl = $('#pageUrl_up').val();
	var pageGroup = $('#pageGroup_up').val();
	var pageGroup2 = $('#pageGroup2_up').val();
	if(pageNm == ''){
		alert('<ui:i18n key="页面名称不能为空"/>.');
		return;
	}
	if(pageUrl == ''){
		alert('<ui:i18n key="页面链接不能为空"/>.');
		return;
	}
	if(pageGroup == ''){
		alert('<ui:i18n key="页面分类不能为空"/>.');
		return;
	}
	var params={
			jobType : 'U'
			,pageTp : pageTp
			,pageNm : pageNm
			,pageUrl : pageUrl
			,pageGroup : pageGroup
			,pageGroup2 : pageGroup2
	};
	$.ajax({
		data : params,
		url : '/admin/master/page/save.htm',
		success : function(res){
			if(res.success){
				alert('<ui:i18n key="保存成功"/>.');
				$('#updatePagePopup').bPopup().close(); 
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
			}else{
				alert(res.err_msg);
			}
		},
		error : function(a, msg, c){
			alert('<ui:i18n key="网络出现故障"/>.');
		}
	});
}
//删除
function stop(pageTp){
	var conf = window.confirm('<ui:i18n key="您确定要删除本条信息吗"/>？');
    if(conf == false) {
        return ;
        }
    else {
    var jobType = 'D';
    var isDelete = 1;
	var params = {
			pageTp:pageTp
			,isDelete:isDelete
			,jobType:jobType
			};
	$.ajax({
		data  :params,
		url : '/admin/master/page/delete.htm',
		success : function(res){
			if(res.success){
				alert('<ui:i18n key="删除成功"/>.');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				$('.b-close').click();
// 				window.location.reload();
			}else{
				alert(res.err_msg);
			}
		},
		error : function(a, msg, c){
			alert('<ui:i18n key="网络出现故障"/>.');
		}
	});
    }
}
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var pageNm = $('#pageNm').val();
	var pageGroup = $('#pageGroup').select2('val'); 
	var params = {
			pageNm : pageNm
			,pageGroup:pageGroup
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/master/page/pageListFragment.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		 $this.hideLoading();
	 });
	 
}
</script>
</head>
<body>
<!-- ▼ header  --> 
  	<%@ include file="/admin/inc/banner_top.jsp"%> 
<!-- ▲ header  -->
<!-- ▼ container  --> 
<div class="contents clearfix">
	<!-- ▼标题 -->
	<div class="clearfix" style="margin-top: 40px;">
		<div class="title-warp">
			<img alt="" src="/admin/images/pageManage/icon_code.png">
			<span class="title-name"><ui:i18n key="浏览量数据管理"/></span>
		</div>
		<div class="action-tools">
			<span class="action-tool">
   		   		<img class="action-tool-icon refresh" alt="" src="/admin/images/groupCreate/toback.png" onclick="ggChangeShop();" />
		  		<span class="action-name" onclick="ggChangeShop();" ><ui:i18n key="返回店铺目录"/></span>
   		   	</span>
		</div>
	</div>
	<!-- ▲标题 -->
	<!-- ▼ 查询表单区域  --> 
       <div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
    		 			<col width="12%" />
    		 			<col width="38%" />
    		 			<col width="12%" />
    		 			<col width="38%" />
    		 		</colgroup>
    		 		<tr>
    		 			<td class="flabel"><ui:i18n key="页面名称"/>：</td>
    		 			<td class="fcomp"><input type="text" id="pageNm"/></td>
    		 			<td class="flabel"><ui:i18n key="页面分类"/>：</td>
    		 			<td class="fcomp">
    		 				<select class="select2" style="width:100%"  data-placeholder="<ui:i18n key="请选择"/>" id="pageGroup">
    		 					<option value=""></option>
    		 					<c:forEach items="${allPageGroup }" var="allPageGroup">
    		 					<option value="${allPageGroup.PAGE_GROUP }">${allPageGroup.PAGE_GROUP }</option>
    		 					</c:forEach>	 					
    		 				</select>
    		 			</td>
    		 		</tr>
       		 	</table>
       		</div>
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button" onclick="search();">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/> 
       		   </span>
       		</div>
      	</div>
  		<!-- ▲ 查询表单区域  -->

  <!--  -->
  <div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
				<div class="result-grid-tools">
				   <span class="result-grid-tool js-add-page" onclick="">
	  		   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="新建"/>
	  		   		</span>
				</div>
	  		</div>
  			<div class="js-grid-content">
  				<div class="result-data-warp">
  					<table class="result-grid-table">
		      		<colgroup>
	      		 			<col width="15%" />
	      		 			<col width="15%" />
	      		 			<col width="25%" />
	      		 			<col width="15%" />
	      		 			<col width="15%" />
	      		 			<col width="15%" />
	      		 		</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th><ui:i18n key="页面ID"/></th>
		      		 		<th><ui:i18n key="页面名称"/></th>
		      		 		<th><ui:i18n key="页面链接"/></th>
		      		 		<th><ui:i18n key="页面分类"/></th>
		      		 		<th><ui:i18n key="页面分类"/>2</th>
		      		 		<th><ui:i18n key="操作"/></th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody">
		      		 <c:forEach items="${list}" var="list">
		      		 	<tr>
		      		 		<td>${list.PAGE_TP }</td>
		      		 		<td><span class="limit-span" title="${list.PAGE_NM }">${list.PAGE_NM }</span></td>
		      		 		<td><span class="limit-span" title="${list.PAGE_URL }">${list.PAGE_URL }</span></td>
		      		 		<td><span class="limit-span" title="${list.PAGE_GROUP }">${list.PAGE_GROUP }</span></td>
		      		 		<td><span class="limit-span" title="${list.PAGE_GROUP2 }">${list.PAGE_GROUP2 }</span></td>
	      		 			<td>
		      		 			<span class="gridbutton red" onclick="showUpdatePoupe('${list.PAGE_TP}','${list.PAGE_NM }','${list.PAGE_URL }','${list.PAGE_GROUP }','${list.PAGE_GROUP2 }')"><ui:i18n key="编辑"/></span>
			      		 		<span class="gridbutton red" onclick="stop('${list.PAGE_TP}');"><ui:i18n key="删除"/></span>	
	      		 			</td>
      		 			</tr>
		      		 </c:forEach>
		      		 </tbody>
		      	</table>
  				</div>
	      	
	      	 <ui:paging page="${page }" />
     	</div>
      </div>
  <!--  -->
</div>
<!-- ▲ container  -->

<!-- ▼ bpopup area -->
<div class="bpopup2" id="createPagePopup">
 	<div class="bpopupWarp">
 		 <div class="bpopupHeaderWarp">
			<h3 class="bpopupTitle js-title"><ui:i18n key="新建"/></h3>
			<div class="bpopupColseWarp">
				<img class="b-close" src="/admin/images/goodsSell/close.png" />
			</div>
		</div>
 		 <div class="bpopupContentWarp"> 
 		 	<!--  方式1 -->
 		 	<!-- <iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
 		 	 -->
 		 	 <!--  方式2 -->
 		 	 <div class="bpopupInner js-bpopup-inner"> 
 		 	    <form action="">
 		 	    		<div class="form-warp clearfix" >
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px">
				  			 		<ui:i18n key="页面名称"/><a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="pageNm_cr" placeholder="<ui:i18n key="请输入页面名称"/>" class="w21"  >
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px" >
				  			 		<ui:i18n key="页面链接"/><a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="pageUrl_cr" placeholder="<ui:i18n key="请输入页面链接"/>" class="w21"  >
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px" >
				  			 		<ui:i18n key="页面分类"/><a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id=pageGroup_cr placeholder="<ui:i18n key="请输入页面分类"/>" class="w21"  >
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px" >
				  			 		<ui:i18n key="页面分类"/>2 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text"  id="pageGroup2_cr" placeholder="<ui:i18n key="请输入页面分类"/>2" class="w21"  >
				  			 	 </div>
				  			 </div>
				  			 
				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="save();">
											<span class="button-icon conform"></span>
											<span class="button-name"><ui:i18n key="保存"/></span>
										</span>
										<span class="button bg-red  js-cancel b-close" style="margin-left:70px;">
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


 
<!-- strat修改 -->
<!-- ▼ bpopup area -->
<div class="bpopup2" id="updatePagePopup">
 	<div class="bpopupWarp">
 		 <div class="bpopupHeaderWarp">
			<h3 class="bpopupTitle js-title"><ui:i18n key="修改"/></h3>
			<div class="bpopupColseWarp">
				<img class="b-close" src="/admin/images/goodsSell/close.png" />
			</div>
		</div>
 		 <div class="bpopupContentWarp"> 
 		 	<!--  方式1 -->
 		 	<!-- <iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
 		 	 -->
 		 	 <!--  方式2 -->
 		 	 <div class="bpopupInner js-bpopup-inner"> 
 		 	    <form action="">
 		 	    		<div class="form-warp clearfix" >
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px" >
				  			 	<ui:i18n key="页面名称"/><a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="pageNm_up" placeholder="<ui:i18n key="请输入页面名称"/>" class="w21"  >
				  			 	 	<input type="hidden" id="pageTp" value=""/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px" >
				  			 		<ui:i18n key="页面链接"/><a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id="pageUrl_up" placeholder="<ui:i18n key="请输入页面链接"/>" class="w21"  >
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px" >
				  			 		<ui:i18n key="页面分类"/><a class="label-required"></a> : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" id=pageGroup_up placeholder="<ui:i18n key="请输入页面分类"/>" class="w21"  >
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 100px" >
				  			 		<ui:i18n key="页面分类"/>2 : 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text"  id="pageGroup2_up" placeholder="<ui:i18n key="请输入页面分类"/>2" class="w21"  >
				  			 	 </div>
				  			 </div>
				  			 
				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="update();">
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
<!-- end修改  -->
</body>
</html>


