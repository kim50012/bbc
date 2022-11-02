<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="消息管理 "/></title>
<style type="text/css">

 .custNickNm{
	cursor: pointer;
	display: inline-block;
	white-space:nowrap; 
	text-overflow:ellipsis;
	overflow: hidden;
	width:120px;
}
.text1{
	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	width: 290px;
}
.text2{
	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	width: 290px;
}
.img-send{
	max-height: 50px;
	max-width: 50px;
	border: 1px solid #e5e5e5;
}
</style>

<script type="text/javascript">

function openChatWindow(custSysId){
	
	$('#ifrPage').attr('src','/admin/cust/chatWindow.htm?cust_sys_id=' + custSysId);
	showBpopup({
		id : 'chatPopup',
		width : 700 
	});
}
function closeChatWindow(){
	$('#ifrPage').attr('src','');
	$('#chatPopup').bPopup().close(); 
}
//分页
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}
//查询
function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var flag = '';
	if(document.getElementById('FLAG').checked == true){
		flag = 'ALL';
	}else{
		flag ='LAST';
	}
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间错误"/>！');
		return;
	}
	var params = {
			flag : flag
			,startDate : startDate
			,endDate : endDate
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/cust/msg/msgListFragment.htm';
	 
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
	     	var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
	      	$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
	     	 $('body').append($div);
	      },function(){
	      	$('.js-show-big-pic').remove();
	      } 
	  );
		 $this.hideLoading();
	 });
	 
}
function ggDoDownload(action, params){
	
	console.log('action=' + action);
	console.log('params=');
	console.log(params);
	
	// 创建Form  
    var form = $('<form></form>');  
 	// 设置属性  
    form.attr('action', action);  
    form.attr('method', 'POST');  
    
    for(var key in params){
        form.append($('<input type="text" name="' + key + '" value="' + params[key] + '" />'));  
   	}
	console.log(form.html());
    form.appendTo(document.body).submit().remove();
	
}
function exportExcel(){
	if(window.confirm('<ui:i18n key="您确定要导出Excel吗"/>?')){
		var flag = '';
		if(document.getElementById('FLAG').checked == true){
			flag = 'ALL';
		}else{
			flag = 'LAST';
		}
		var startDate = $('#startDate').val().trim();
		var endDate = $('#endDate').val().trim();
		
		var params = {
				flag : flag
				,startDate : startDate
				,endDate : endDate
		}
		
		var url = '/admin/cust/msg/doExcel.htm';
		
		ggDoDownload(url,params);
	}
}
 function showImg(url){
	window.open(url);
}
</script>
</head>

<body>
	<!-- ▼ Main container -->
	<div class="container">
	
		<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="10%" />
	       		 			<col width="40%" />
	       		 			<col width="7%" />
	       		 			<col width="43%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="日期"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<input type="text" id="startDate" class="w9 datepicker calendar" value="${requestScope.startDate}" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
			  			 	 	<input type="text" id="endDate" class="w9 datepicker calendar" value="${requestScope.endDate}" />
	       		 			</td>
	       		 			<td class="flabel last">
	       		 				<input class="iccheckbox" type="checkbox" name="FLAG" id="FLAG" >
	       		 			</td>
	       		 			<td class="fcomp last"><ui:i18n key="查询全部"/></td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<!-- -->
	       		<div class="butttn-area m1" >
	       		   <span class="button" onclick="search();">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	  		
			<div class="result-grid pic" style="margin-top: 50px;">
			
				<div class="result-grid-header">
	   				<div class="result-grid-tools">
	   				   <span class="result-grid-tool" onclick="exportExcel();">
	      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出Excel"/>
	      		   		</span>
	   				</div>
	   			</div>
				
				<table class="result-grid-table">
					 <colgroup>
							<col width="120px"  />
							<col width="120px" />
							<col width="280px" />
							<col width="280px" />
							<col width="90px" />
					</colgroup>
					 <thead class="result-grid-thead">
					 	<tr>
					 		<th><ui:i18n key="粉丝"/></th>
					 		<th></th>
					 		<th><ui:i18n key="消息内容"/></th>
					 		<th><ui:i18n key="回复内容"/></th>
					 		<th><ui:i18n key="操作"/></th>
					 	</tr>
					 </thead>
					 <tbody  class="result-grid-tbody">
					 <c:forEach items="${list }" var="list" varStatus="status"> 
					 	<tr>
					 		<td class="pic" style="padding-right: 0;">
					 			<img alt="" src="${list.WX_IF_HEADIMGURL}" class="pic-small" onclick="openChatWindow('${list.CUST_SYS_ID}');">
					 		</td>
					 		<td style="text-align: left;padding-top: 15px;">
					 			<div class="custNickNm" title="${list.CUST_NICK_NM }" onclick="openChatWindow('${list.CUST_SYS_ID}');">${list.CUST_NICK_NM }</div>
					 			<div style="margin-top: 35px">${list.GRADE_NM }</div>
					 		</td>
					 		<td>
			 					<span style="color:gray">${list.CUST_RECEIVE_DT }</span></br>
			 					<c:choose>
	           						<c:when test="${list.CUST_MSG_TYPE == 'text'}">
	           							<div class="text1" title="${list.CUST_CONTENT }">${list.CUST_CONTENT }</div>
	           						</c:when>
	           						<c:when test="${list.CUST_MSG_TYPE == 'image'}">	       							
	           							 <c:choose>
	           								<c:when test="${empty list.FULL_URL}">
	           									<img alt="" src="${list.CUST_PIC_URL }" class="img-send" onclick="showImg('${list.CUST_PIC_URL }')">
	           								</c:when>
	           								<c:otherwise>
	           									<img alt="" src="${list.FULL_URL }" class="img-send" onclick="showImg('${list.FULL_URL }')">
	           								</c:otherwise>
	           							</c:choose> 
	           						</c:when>
	           						<c:otherwise>
	           							暂无回复
	           						</c:otherwise>
	           					</c:choose>
							</td>
					 		<td>
			 					<span style="color:gray;">${list.SHOP_RECEIVE_DT }</span></br>			           	
	           					<c:choose>
	           						<c:when test="${list.SHOP_MSG_TYPE == 'text'}">
	           							<div class="text2" title="${list.SHOP_CONTENT }">${list.SHOP_CONTENT }</div>
	           						</c:when>
	           						<c:when test="${list.SHOP_MSG_TYPE == 'image'}">
	           							<c:choose>
	           								<c:when test="${empty list.FULL_URL}">
	           									<img alt="" src="${list.SHOP_PIC_URL }" class="img-send" onclick="showImg('${list.SHOP_PIC_URL }')">
	           								</c:when>
	           								<c:otherwise>
	           									<img alt="" src="${list.FULL_URL }" class="img-send" onclick="showImg('${list.FULL_URL }')">
	           								</c:otherwise>
	           							</c:choose>
	           						</c:when>
	           						<c:otherwise>
	           							<div class="text2">暂无回复</div> 
	           						</c:otherwise>
	           					</c:choose>	
					 		</td>
					 		<td>
					 			<span class="gridbutton red" onclick="openChatWindow('${list.CUST_SYS_ID}')"><ui:i18n key="回复"/></span>
					 		</td>
					 	</tr>
					 </c:forEach>
					 </tbody>
				</table>
				
				<ui:paging page="${page }" />
			</div>
		<!-- end详细数据 --> 
	</div>
	<!-- ▲ Main container -->
	
	
	
	<style scoped="scoped">
		.divPopup {width: 700px; height: 490px; margin: 0 auto 0; overflow: hidden; display: none;border-radius: 10px 10px 0px 0px;}
		.divPopup .divPopup-header {width: 100%; height: 40px; background-color: #636363; border-radius: 10px 10px 0px 0px;}
		.divPopup .divPopup-header .divPopup-header-text {width: 80%; height: 40px; line-height: 40px; float: left; font-size: 16px;}
		.divPopup .divPopup-header .divPopup-header-text span {margin-left: 30px; color: #ffffff; font-size: 14px;}
		.divPopup .divPopup-header .divPopup-header-close {width: 20%; height: 40px; line-height: 40px; text-align: right; float: left;}
		.divPopup .divPopup-header .divPopup-header-close img {width: 14px; height: 14px; margin-right: 20px; cursor: pointer;}
		
		.divPopup .divPopup-container {width: 460px; height: 255px; position: relative;}
		.divPopup .divPopup-container .ifrPopup {width:100%; height: 100%; left: 0; top: 0; border-radius: 0px 0px 10px 10px;}
	</style> 
       
	<!-- ▼ Popup -->
	<div class="chatPopup divPopup" id="chatPopup">
		<iframe id="ifrPage" class="ifrPopup" style="width: 700px; height: 490px; " frameborder="0" allowTransparency="true" scrolling="no" vspace="0" hspace="0"></iframe>
	</div>
	<!-- ▲ Popup -->

	<!-- ▼ Main footer -->
	<%-- <footer class="ui-footer">
		<div class="ui-footer-inner clearfix">
			<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
		</div>
	</footer> --%>
	<!-- ▲ Main footer -->
</body>
</html>