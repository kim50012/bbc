<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <title><ui:i18n key="日志管理"/></title>

<style type="text/css">
.container {
  box-sizing: border-box;
   width: 910px;  
   margin-left: auto;
   margin-right: auto;
 /*   background-color: #fff; */
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

function openPoupMessage(){
	
	showBpopup({
		id : 'poupMessage',
		width : 450 
	});	
	$.ajax({
		url : '/admin/blog/showPointPoupe.htm',
		success : function(data){
			$('#like').val(data.show.LIKE_POINT);
			$('#reply').val(data.show.REPLY_POINT);
			$('#share').val(data.show.SHARE_POINT); 
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
}

function fn_MainPage_Delete(blogId) {
	if(confirm('<ui:i18n key="您确定要删除吗"/>?')) {
	 	$.ajax({
  	 		data:{
  	 			blogId: blogId
  	 		},
			url : '/admin/shopLack/deleteShopBlog.htm',
			success : function(data) {
				alert('<ui:i18n key="删除成功"/>.');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
// 				var blogTitle = $('#blogTitle').val();
// 				window.location.href = '/admin/shopLack/blogControl.htm?blogTitle=' + blogTitle;
			},
			error : function(xhr, status, e) {
				alert('<ui:i18n key="保存失败"/>.\n' + 'error: ' + status);
			}
		});
	}
	
}

//积分设定保存
function pointSave(){
	var like = $('#like').val();
	var reply = $('#reply').val();
	var share = $('#share').val();
	if(isNaN(like) || isNaN(reply) || isNaN(share)){
		alert('<ui:i18n key="积分值必须为数字"/>.');
		return;
	}
	var params={
			likePoint : like,
			replyPoint : reply,
			sharePoint : share
	};
	$.ajax({
		data : params,
		url : '/admin/blog/pointSave.htm',
		success : function(data){
			if (data.result == 'success'){
				alert('<ui:i18n key="保存成功"/>.');
// 				window.location.href = '/admin/shopLack/blogControl.htm';
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				$('.b-close').click();
			} else if (data.result == 'fail'){
				alert('<ui:i18n key="保存失败"/>.');
			}
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
}



/* function blogCreate(){
	parent.ggShowTab({
		'url' : '/admin/blog/blogCreate.htm',
		'name' : '<ui:i18n key="编辑日志详情"/>',
		'icon' : 'shopLack' 
	});  
}
function blogModify(blogId){
	parent.ggShowTab({
		'url' : '/admin/blog/blogModify.htm?blogId=' + blogId,
		'name' : '<ui:i18n key="编辑日志详情"/>',
		'icon' : 'shopLack' 
	});  
} */

function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var blogGroupId = $("#blogGroupId").find("option:selected").val();
	var params = {
			blogGroupId : blogGroupId
			,blogTitle : $('#blogTitle').val()
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/shopLack/blogControlFragment.htm';
	 
	 var $this = $('.result-grid.pic');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		 $this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 }); 
		 
		 $('.pic-small').hover(function(){
		     	var $this = $(this);
		     	var offset = $this.offset();
		     	var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 74,  'top':offset.top  });
		      	$div.append($('<img class="pic-big" />').attr('src',$this.attr('src')));
		     	 $('body').append($div);
		      },function(){
		      	$('.js-show-big-pic').remove();
		      } 
		  );
		 
		 $this.hideLoading();
	 });
	 
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
				       		 			<col width="35%" />
				       		 			<col width="15%" />
				       		 			<col width="35%" />
				       		 		</colgroup>
				       		 		<tr>
				       		 			<td class="flabel last" ><ui:i18n key="日志标题"/>：</td>
				       		 			<td class="fcomp last">
				       		 				<input type="text" id="blogTitle" value="${requestScope.blogTitle }"  class="w18" />
				       		 			</td>
				       		 			<td class="flabel last" ><ui:i18n key="日志类型"/>：</td>
				       		 			<td class="fcomp last">
				       		 				<select class="select2" id="blogGroupId" style="width:190px;">
					            				<option value=""></option>
					            				<c:forEach items="${groupList }" var="list" varStatus="status">
					            					<c:if test="${list.IS_DELETE=='0' }">
					            						<option value="${list.BG_ID }" <c:if test="${list.BG_ID==requestScope.blogGroupId }">selected="selected"</c:if>>${list.BG_NM }</option>
					            					</c:if>
					            				</c:forEach>
					            			</select>
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
			  			
				  		<div class="result-grid pic" style="margin-top: 50px;">
			
							<div class="result-grid-header">
				   				<div class="result-grid-tools">
				   				   <span class="result-grid-tool" onclick="window.location.href='/admin/blog/blogCreate.htm'">
				      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
				      		   		</span>
				      		   		<span class="result-grid-tool" onclick="openPoupMessage()" style="margin-left: 20px">
				      		   	 	 	<img alt="" src="/admin/images/cust/integral_01.png" /><ui:i18n key="Blog积分设定"/>
				      		   		</span>
				   				</div>
				   			</div>
				
							<table class="result-grid-table">
								 <colgroup>
										<col width="120px" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="20%" />
										<col width="20%" />
								</colgroup>
								 <thead class="result-grid-thead">
								 	<tr>
								 		<th><ui:i18n key="日志图片"/></th>
								 		<th><ui:i18n key="日志ID"/></th>
								 		<th><ui:i18n key="日志类型"/></th>
								 		<th><ui:i18n key="日志标题"/></th>
								 		<th><ui:i18n key="生成日期"/></th>
								 		<th><ui:i18n key="操作"/></th>
								 	</tr>
								 </thead>
								 <tbody  class="result-grid-tbody">
								 <c:forEach items="${list }" var="list" varStatus="status"> 
								 	<tr>
								 		<td class="pic">
								 			<img alt="" src="${list.BLOG_FILE_URL}" class="pic-small" onclick="openChatWindow('${list.CUST_SYS_ID}');">
								 		</td>
								 		<td>${list.BLOG_ID}</td>
								 		<td>${list.BLOG_GROUP_NM}</td>
								 		<td>${list.BLOG_TITLE}</td>
								 		<td>${list.CREATED_DT}</td>
								 		<td>
								 			<span class="gridbutton red" onclick="window.location.href='/admin/blog/blogModify.htm?blogId=${list.BLOG_ID }'"><ui:i18n key="编辑"/></span>
								 			<span class="gridbutton red" onclick="fn_MainPage_Delete(${list.BLOG_ID});" ><ui:i18n key="删除"/></span>
								 		</td>
								 	</tr>
								 </c:forEach>
								 </tbody>
							</table>
				
							<ui:paging page="${page }" />
						</div>
			  		
			  		</div><!--js-goods-content-step-1 -->
			  		
			  		 
			  	</div>	
				<!-- end22 -->
			

            <!-- ▲ detali content -->
        </div>
		
		<!-- ▼ bpopup area -->
		<div class="bpopup2" id="poupMessage">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="Blog积分设定"/></h3>
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
						  			 	 <div class="form-label" style="text-align: center;width: 80px" >
						  			 		<ui:i18n key="点赞"/>： 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text" id="like" value="" />
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<ui:i18n key="积分值"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="text-align: center;width: 80px" >
						  			 		<ui:i18n key="评价"/>： 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text"  id="reply"/>
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<ui:i18n key="积分值"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="text-align: center;width: 80px" >
						  			 		<ui:i18n key="分享"/>：
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text"  id="share" />
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<ui:i18n key="积分值"/>
						  			 	 </div>
						  			 </div>

						  			 <div class="control-warp text-center">
						  			 	<div class="popup-form-actions">
							  			 	 <div class="buttons-action">
								  				<span class="button bg-red js-confirm"  onclick="pointSave();">
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

</body>
</html>