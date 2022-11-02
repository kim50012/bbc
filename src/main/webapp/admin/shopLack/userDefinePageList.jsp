<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="自定义页面模块"/></title>  
 
<style type="text/css">
 
 /****for test ****/
 body{
/*  	background-color: #000; */
 }
 
 .container {
  box-sizing: border-box;
   width: 910px;  
   margin-left: auto;
   margin-right: auto;
 /*   background-color: #fff; */
  }

 /****for test ****/
 .poupDiv{
 	position:absolute;
 	width:300px;
 	height:620px;
 	border-radius:47px;
 	background-color: #fff; 
 	box-shadow:0 0 10px #fff;
 	display:none;
 }
  .poupDiv .poup-top-title{
  	width:100%;
  	height:70px;
 	text-align: center;
  }
   .poupDiv .poup-foot{
  	width:100%;
  	height:63px;
 	text-align: center;
 	vertical-align: bottom;
 	padding-top:7px;
  }
 
.poup-body-div{
	width:274px;
	height:480px;
	border-radius:7px;
	margin-left:13px;
	background-image: url("/admin/images/sendMsgAll/iphone_top.png");
	background-position: 0 0;
	background-repeat: no-repeat;
	border:1px solid #eee; 
} 
.poup-body-div .body-title{
	width:200px;
	margin-left:39px;
	height:20px;
	color:#fff;
	text-align: center;
	margin-top:20px;
	font-size:9px;
}
.poup-body-div .body-msg-div{
	width:100%;
	position: relative;
}
 .close-div-img{
 	position: absolute;
 	margin-left:300px;
 	cursor: pointer;
 }
</style> 

<script type="text/javascript">

var gcNm = '';
var gexingGcNm = '';
var gcId = '';
var goodsId = '';
var isPublishing = false;

</script>
<script type="text/javascript">

/* function fn_GetData(newFlag) {


	var pageCurr = $('#btnSerachGrid').data('pageNo') || 1;
	var pageUnit = $('#btnSerachGrid').data('pageSize') || 10;
	
	if (newFlag) {
		pageCurr = 1;
		pageUnit = 10;
	}
	
	
	 $.ajax({
  	 		data:{
  	 			goodsNm: $('#searchGoodsNm').val()
  	 			,pageCurr : pageCurr
  	 			,pageUnit : pageUnit
  	 		},
			type : "POST",
			url : "/admin/shopLack/getUserDefinePageList.htm",
			success : function(data) {
				
				var list = data.data || [];
				if(list.length > 0 ){
					 
					$('.js-result-grid-content').html(template('tpl_goods-search-result', data));
					$('#pageSize').text(pageUnit);
					$('#pageTotal').text(list[0].TOTAL_CNT);
					
					var $tbody = $('.js-result-grid-content').next();
					 if(data.fisrtPage){
						 $tbody.find('.js-page-first').removeClass('page-first').addClass('page-first-disabled');
					 }else{
						 $tbody.find('.js-page-first').removeClass('page-first-disabled').addClass('page-first');
					 }
					 
					 if(data.hasPreviousPage){
						 $tbody.find('.js-page-preview').removeClass('page-preview-disabled').addClass('page-preview');
					 }else{
						 $tbody.find('.js-page-preview').removeClass('page-preview').addClass('page-preview-disabled');
					 }
					 if(data.hasNextPage){
						 $tbody.find('.js-page-next').removeClass('page-next-disabled').addClass('page-next');
					 }else{
						 $tbody.find('.js-page-next').removeClass('page-next').addClass('page-next-disabled');
					 }
					 
					 if(data.lastPage){
						 $tbody.find('.js-page-last').removeClass('page-last').addClass('page-last-disabled');
					 }else{
						 $tbody.find('.js-page-last').removeClass('page-last-disabled').addClass('page-last');
					 }
					 
					 var  totalMsg = '每页'+ data.pageSize + '条, 共' + data.totalCount + '条';
					 $tbody.find('.js-totalSum').html(totalMsg);
					 
				 
					 var $combo2 = $('#currentPage');
					 $combo2.html('');
					 for(var i = 1; i <= data.totalPageCount ; i++){
						 $combo2.append('<option value="' + i + '">' + i + '</option>');
					 }
					 $combo2.select2('val',data.pageNo).trigger('change.default');
					 
					 
					 $('.grid-has-result').show();
					 $('.grid-not-result').hide();
					 
					 $('#btnSerachGrid').data('pageNo',data.pageNo);
					 $('#btnSerachGrid').data('pageSize',data.pageSize);
					 $('#btnSerachGrid').data('totalPageCount',data.totalPageCount);
						 
				}else{
					$('.js-result-grid-content').html('');
					$('.grid-has-result').hide();
					$('.grid-not-result').show();
				}
				
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
} */
//自定义模块的删除操作
function deleteUserDefinePage(pageId){
	if(confirm('<ui:i18n key="您确定要删除吗"/>?')) {
	 	$.ajax({
  	 		data : {
  	 			pageId : pageId
  	 		},
			type : 'POST',
			url : '/admin/shopLack/deleteDynamicPage.htm',
			success : function(data) {
				alert('<ui:i18n key="删除成功"/>.');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
// 				window.location.href = '/admin/shopLack/userDefinePageList.htm';
			},
			error : function(xhr, status, e) {
				alert('<ui:i18n key="保存失败"/>.\n' + 'error: ' + status);
			}
		});
	}
}

function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	
	var params = {
			serachTitle : $('#searchGoodsNm').val()
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/shopLack/userDefinePageFragment.htm';
	 
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
function review(url){
	$('#iframe').attr('src',url);

	showBpopup({
		id : 'showNowBefore',
		width : 300,
		height : 620,
		top : 30
	});
}
function closeBpopup(){
	$('#showNowBefore').bPopup().close();
}
</script>

</head>
<body>
	<!-- ▼ Main container --> 
        <div class="container"> 

            <!-- ▼ detali content  --> 
           	<form action="">
           		<input type="hidden" id="goodsId" value="" /> 
           	</form>
           	
           	<form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
		         <input id="files" type="file" name="files[]" multiple style="display: none;" >  
		    </form>
            
			<div class="goods-step-area" >
				
			  	<div class="goods-content-step js-goods-content-step-1">
			  			
				<!-- ▼ 查询表单区域  --> 
					<div class="query-from">
			       		<div class="form-table" >
			       		 	<table class="ftable">
			       		 		<colgroup>
			       		 			<col width="15%" />
			       		 			<col width="85%" />
			       		 		</colgroup>
			       		 		<tr>
			       		 			<td class="flabel last" ><ui:i18n key="页面名称"/>：</td>
			       		 			<td class="fcomp last">
			       		 				<input type="text" id="searchGoodsNm" class="w18" />
			       		 			</td>
			       		 		</tr>
			       		 	</table>
			       		</div>
			       		 
			       		<!-- -->
			       		<div class="butttn-area m1" >
			       		   <span class="button" onclick="searchData();">
			       		   	  <span class="button-icon search"></span>
			       		   	 <ui:i18n key="查询"/> 
			       		   </span>
			       		</div>
			      	</div>
			  	<!-- ▲ 查询表单区域  -->
		  	
			  	<div class="result-grid" style="margin-top: 50px;">
				      	<div class="result-grid-header">
			   				<div class="result-grid-tools">
			   				   <span class="result-grid-tool" onclick="window.location='/admin/shopLack/addUserDefinePageEditor.htm'">
			      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
			      		   		</span>
			   				</div>
			   			</div>
	   				<div class="js-grid-content">
		   				<div class="result-data-warp" style="">
		   					<table class="result-grid-table">
					      		<colgroup>
				      		 			<col width="20%" />
				      		 			<col width="25%" />
				      		 			<col width="25%" />
				      		 			<col width="30%" />
				      		 		</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th><ui:i18n key="页面ID"/></th>
					      		 		<th><ui:i18n key="页面名称"/></th>
					      		 		<th><ui:i18n key="创建日期"/></th>
					      		 		<th><ui:i18n key="操作"/></th>
					      		 	</tr>
					      		 </thead>
					      		 <tbody  class="result-grid-tbody">
					      		 	<c:forEach items="${list }" var="list" varStatus="status">
					      		 	<tr>	
										<td>${list.PAGE_ID}</td>
										<td class="js-grid-gc-nm">${list.PAGE_NM}</td>
										<td class="js-grid-gexing-nm">${list.CREATED_DT} </td>
										<td class="js-grid-gexing-nm">
											<span class="gridbutton red"  onclick="review('${list.URL_PC}');"><ui:i18n key="预览"/></span>												
											<span class="gridbutton red"  onclick="window.location='/admin/shopLack/modifyUserDefinePageEditor.htm?pageId=${list.PAGE_ID}';"><ui:i18n key="编辑"/></span>
											<span class="gridbutton red"  onclick="deleteUserDefinePage(${list.PAGE_ID});"><ui:i18n key="删除"/></span>	
										</td>
									</tr>
					      		 	</c:forEach>
					      		 </tbody>
					      	</table>
		   				</div>
				      	
				      	<ui:paging page="${page }" />
			     	</div>
		      	</div>
	
			</div><!--js-goods-content-step-1 -->
			  		
			  		 
		</div>	
	<!-- end22 -->

            <!-- ▲ detali content -->
	</div>

	<%-- <!-- ▲ Main container -->
	  <!-- ▼ Main footer -->
      <jsp:include page="/admin/inc/footer.jsp"></jsp:include>
	<!-- ▲  Main footer --> --%>

	<!-- 弹出选择文件的弹出框 -->
	<div class="poupDiv" id="showNowBefore">
      	<img src="/admin/images/sendMsgAll/btn_close.png" class="close-div-img" onclick="closeBpopup();"/>
      		<div class="poup-top-title">
      			<img src="/admin/images/sendMsgAll/iphone_1.png"/>
      		</div>
      		<div class="poup-body-div">
      			<div class="body-title">
      				圃美多绿色食品
      			</div>
      			<div class="body-msg-div">
      				<iframe id="iframe" width="274" height="437" frameBorder=0 scrolling=yes  src=""></iframe>
				</div>
      		</div>
      		<div class="poup-foot">
      			<img src="/admin/images/sendMsgAll/iphone_home.png"/>
      		</div>
      </div>


 <script id="tpl_goods-search-result" type="text/html">
		{{each data}}
			 <tr>	
				<td>{{$value.PAGE_ID}}</td>
				<td class="js-grid-gc-nm">{{$value.PAGE_NM}}</td>
				<td class="js-grid-gexing-nm">{{$value.CREATED_DT}} </td>
				<td class="js-grid-gexing-nm">
					<span class="gridbutton red"  onclick="review('{{$value.URL_PC}}');"><ui:i18n key="预览"/></span>												
					<span class="gridbutton red"  onclick="window.location='/admin/shopLack/modifyUserDefinePageEditor.htm?pageId={{$value.PAGE_ID}}';"><ui:i18n key="编辑"/></span>
					<span class="gridbutton red"  onclick="deleteUserDefinePage({{$value.PAGE_ID}});"><ui:i18n key="删除"/></span>	
				</td>
			</tr>
		{{/each}}
 </script>
<!--  <script>
 fn_GetData(true);
 </script> -->
</body>
</html>