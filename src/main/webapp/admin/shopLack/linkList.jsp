<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="链接清单"/></title>
<!-- <script type="text/javascript" src="/admin/master/file/ZeroClipboard.js"></script>     -->
<style type="text/css">
.result-grid .result-grid-table .result-grid-tbody tr td{
	background-color: #fff;
	position: relative;
}
.PoupDivConnect{
	width:470px;
	height:60px;
	border:1px solid #c5c5c5;
	position:absolute;
	background-color: #fff;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
	left:-440px;
	top:-10px;
	display: none;
	z-index: 100;
 }
 .ui-box{
	height:60px;
	line-height:60px;
	text-align: left;
}
.submitDiv{
	display:inline-block;
	width:70px;
	height:30px;
	font-size:14px;
	color:#ffffff;
	line-height:30px;
	text-align: center;
	margin-top:0px;
	border-radius:2px;
	cursor: pointer;
}

.submitDiv.revise{
	background-color: #fb6e52;
	margin-left:5px;
}
.submitDiv.submit{
	background-color: #fb6e52;
	margin-left:15px;
} 
 .ui-box input{
	width:240px;
	margin-top:-2.4px;
	margin-left:5px;
}
.dropDown1,.dropDown3,.dropDown2
 {
 	width:0;
 	height:0; 
 	overflow:hidden;
 	border-width:10px; 
 	border-style:dotted dotted solid;  
 	position:absolute
 }
 
 .PoupDivBody{
 	position: absolute; 
 	width:8px; 
 	height:8px; 
 	left:550px; 
 	top:25px
 }
  .PoupDivConnect  .PoupDivBody{
  	position: absolute; 
 	width:8px; 
 	height:8px; 
 	left:470px; 
 	top:22px
  }
 .dropDown1{
  	border-color: transparent transparent  transparent #c5c5c5 ; 
  	top:-0.6px; 
  	z-index:0; 
 }
 .dropDown3{
  	border-color: transparent transparent  transparent #c5c5c5 ; 
  	top:0.5px; 
  	z-index:0; 
 }
 .dropDown2{
  	border-color: transparent transparent  transparent #ffffff ;  
  	top:0; 
  	z-index:1; 
 }
 

</style>
<script type="text/javascript">
$(function(){
	$('#pageType').select2('val','1');
	$('#pageType').attr('readonly',true);
	$('#serachTitle').val('${serachTitle1}');
	if('${serachLinkType1}' == ''){
		$('#serachLinkType').select2('val','2');
	}else{
		$('#serachLinkType').select2('val','${serachLinkType1}');
	}
	
	$('.js-add-page').click(function(){
		 showBpopup({
			id : 'createLinkPopup',
			width : 450 
		});	  	 
	});
	
	$('.js-confirm').click(function(){
		if($('#pageType').val() == ''){
			alert('<ui:i18n key="请选择链接类型" />');
			$('#pageType').focus();
			return false;
		}
		if($('#title').val() == ''){
			alert('<ui:i18n key="请填写标题" />');
			$('#title').focus();
			return false;
		}
		if($('#link').val() == ''){
			alert('<ui:i18n key="请填写链接地址" />');
			$('#link').focus();
			return false;
		}
		var params={
				pageType:$('#pageType').val()
				,title:$('#title').val()
				,link:$('#link').val()
		};
		$.ajax({
			data : params,
			url : '/admin/shopLack/linkSave.htm', 
			success : function(data){
				if(data.result == 'S'){
					alert('<ui:i18n key="保存成功"/>');
					window.location.reload();
				}else{
					alert('<ui:i18n key="保存失败"/>,<ui:i18n key="请重新操作"/>');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	});
});
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var serachTitle1 = $('#serachTitle').val();
	var serachLinkType1 = $('#serachLinkType').val();
	var params = {
			serachTitle1 : serachTitle1
			,serachLinkType1 : serachLinkType1
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/shopLack/linkListFragment.htm';
	 
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
//弹出连接框
function bPoupDivDisplayConnect(poupId,flg,url,pageId){
	$('.PoupDivConnect').hide();
	
	if(flg == 1){
		$('.PoupDivConnect').css('left','-440px');
		$('#text'+pageId).val(url);
	}else{
		$('.PoupDivConnect').css('left','-400px');
		$('#text'+pageId).val(('<%=basePath%>'.substr(0,'<%=basePath%>'.length-1)+url));
	}
	$('#'+poupId).show();
	
}
//关闭弹出框
function cancelActionConnect(cancelId){
	$('#'+cancelId).hide();
}

function copyUrl2(fileId){
 	var Url2 = document.getElementById('text'+fileId);
 	Url2.select(); // 选择对象
	document.execCommand('Copy'); // 执行浏览器复制命令
	alert( '<ui:i18n key="复制成功"/>' );
	$('#connectPoupDiv'+ fileId).hide();
}

function linkSave(){
	if($('#pageType').val() == ''){
		alert('<ui:i18n key="请选择链接类型" />');
		$('#pageType').focus();
		return false;
	}
	if($('#title').val() == ''){
		alert('<ui:i18n key="请填写标题" />');
		$('#title').focus();
		return false;
	}
	if($('#link').val() == ''){
		alert('<ui:i18n key="请填写链接地址" />');
		$('#link').focus();
		return false;
	}
	var params={
			pageType:$('#pageType').val()
			,title:$('#title').val()
			,link:$('#link').val()
	};
	$.ajax({
		data : params,
		url : '/admin/shopLack/linkSave.htm', 
		success : function(data){
			if(data.result == 'S'){
				alert('<ui:i18n key="创建成功"/>');
				location.reload();
			}else{
				alert('<ui:i18n key="创建失败"/>,<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	});
}
</script>
</head>
<body>
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
    		 			<td class="flabel"><ui:i18n key="链接类型" />：</td>
    		 			<td class="fcomp">
    		 				<select data-placeholder="<ui:i18n key="请选择" />" id="serachLinkType" class="select2"  style="width: 90%;" >
							  <option value=""></option> 
							  <c:forEach items="${pageTypeList}" var="item" varStatus="status">
							  	<option value="${item.CD_ID }">${item.CD_VAL }</option> 
							  </c:forEach>
							</select>
    		 			</td>
    		 			<td class="flabel"><ui:i18n key="标题" />：</td>
    		 			<td class="fcomp">
    		 				<input type="text" id="serachTitle" clsss="js-serach-title" style="width: 90%;"  >
    		 			</td>
    		 		</tr>
    		 	</table>
    		</div>
    		
    		<div class="butttn-area m1" onclick="javascript:searchData();">
    		   <span class="button">
    		   	  <span class="button-icon search"></span>
    		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
    		   </span>
    		</div>
   	</div>
	<!-- ▲ 查询表单区域  -->
	<!-- ▼ 普通表格  --> 
	    <div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header" >
   				<div class="result-grid-tools js-add-page">
      		   		<span class="result-grid-tool js-add-page">
     		   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="新建"/>
     		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp">
   					<table class="result-grid-table">
			      	 	<thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th style="width:25%;"><ui:i18n key="标题" /></th>
			      		 		<th style="width:55%;"><ui:i18n key="链接" /></th>
			      		 		<th style="width:20%;"><ui:i18n key="操作" /></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody" >
				      		<c:choose>
								<c:when test="${list!= null && fn:length(list) > 0}">
									<c:forEach items="${list}" var="item" varStatus="status">
										<tr>
											<td>${item.PAGE_NM}</td>
											<td>${item.URL}</td>
											<td>
												<span class="gridbutton red" onclick="bPoupDivDisplayConnect('connectPoupDiv${item.PAGE_ID}',1,'${item.URL }','${item.PAGE_ID}');"><ui:i18n key="链接"/></span>
												<span class="gridbutton red" onclick="bPoupDivDisplayConnect('connectPoupDiv${item.PAGE_ID}',2,'${item.URL }','${item.PAGE_ID}');"><ui:i18n key="完整链接"/></span>
												<div class="PoupDivConnect" id="connectPoupDiv${item.PAGE_ID }">
											        <div class="PoupDivBody">
											            <div class="dropDown1"></div>
											            <div class="dropDown2"></div>
											            <div class="dropDown3"></div>
											        </div>
											        <div class="ui-box">
											        		<input style="margin-left:20px;"  type="text" id="text${item.PAGE_ID }" readonly="readonly" value="${item.URL }"/>
											        		<div class="submitDiv submit copy"  id="textDiv${item.PAGE_ID }" onclick="copyUrl2(${item.PAGE_ID })">
											        			<span data-item="${item.PAGE_ID }" ><ui:i18n key="复制"/></span>
											        		</div>
													  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${item.PAGE_ID }');">
													  			<span><ui:i18n key="取消"/></span>
													  		</div>
													</div>
										    	</div>
							    	
											</td>
										</tr>
						        	</c:forEach>
						        	<tr style="border: 0;">
						        		<td colspan="3" style="height: 3px;border: 0;"></td>
						        	</tr>
						        </c:when>
					        </c:choose>
			      		 </tbody>
		      		</table>
   				</div>
   				<ui:paging page="${page }" />
   			</div>
   		</div> 
   		<!-- ▲ 普通表格 --> 
   		<!-- ▼ bpopup area -->
		<div class="bpopup2" id="createLinkPopup">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="新建"/><ui:i18n key="链接"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png"  onclick="cancel()"/>
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	 <!--  方式2 -->
		 		 	 <div class="bpopupInner js-bpopup-inner"> 
		 		 	    <form action="">
		 		 	    		<div class="form-warp clearfix" >
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px">
						  			 		<ui:i18n key="链接类型"/><a class="label-required"></a> : 
						  			 	 </div>
						  			 	 <div class="form-control">
					  			 	 		<select data-placeholder="<ui:i18n key="请选择"/>" id="pageType" disabled="disabled" class="select2" style="width: 240px;"   >
											  <option value=""></option> 
											  <c:forEach items="${pageTypeList}" var="item" varStatus="status">
											  	 <option value="${item.CD_ID }">${item.CD_VAL }</option> 
											  </c:forEach>
											</select>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px">
						  			 		<ui:i18n key="标题"/><a class="label-required"></a> : 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text" value="" id="title" style="width: 218px;"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label"  style="width: 100px;vertical-align: top;">
						  			 		<ui:i18n key="链接地址"/><a class="label-required"></a>: 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text" value="" id="link" style="width: 218px;"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp text-center">
						  			 	<div class="popup-form-actions">
							  			 	 <div class="buttons-action">
								  				<span class="button bg-red js-confirm" >
													<span class="button-icon conform"></span>
													<span class="button-name"><ui:i18n key="保存"/></span>
												</span>
												<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="cancel()">
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
</div>
</body>
</html>