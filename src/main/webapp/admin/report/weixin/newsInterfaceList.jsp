<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="图文消息接口列表"/></title>  
<style type="text/css">
	 .title-limite{
	 	word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;
	 }
	 .interface-table{width:100%;font-size:12px;color:#5f5f5f;text-align: left;margin-top:20px;margin-bottom:25px;}
	 .interface-table tr td{height:45px; line-height: 45px;}
	 .interface-table tr td input{width:140px;font-size:12px;color:#5f5f5f;background-color: #f7f7f7;}
</style> 
 
<script type="text/javascript">
var flag_music=true;
var audio =document.createElement("audio");
	$(function(){
		//条件查询数据
		$('.query-interface').click(function(){
			query(1,10);
		});
	});
	//分页操作
	function showPage(pageNo, pageSize){
		query(pageNo, pageSize);
	}
	//分页的查询
	function query(pageNo, pageSize){
		
		console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var beginDate = $('#beginDate').val();
		var endDate = $('#endDate').val();
		var date1 = new Date(beginDate);
		var date2 = new Date(endDate);
		if(date1>date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		var title = $('#title').val();
		var params = {
				title : title
				,beginDate : beginDate
				,endDate : endDate
				,pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/report/weixin/newsInterfaceListFrament.htm';
		 
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
	//信息的详情页面
	function showMsgDetail(id){
		for(var i = 0;i < 15;i++){
			$('#detail-msg' + i).val($('#detailMsg' + id).data('msgd' + i));
		}
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 730,
			height : 447
		});
	}
	//关闭弹出框
	function closebpoupMe(){
		closeBpopupWindow('bpoupMessageUpdate');
	}
	//打开修改弹出窗
	function modifyInterface(wxMsgId){
		$('#wxMsgId').val(wxMsgId);
		showIframeBpopupWindow({
			id : 'bpoupMessageUpdate',
			width : 850,
			height : 490,
			action : $('#iframe_avi_music_image').attr('src')
		});
	}
	function closeDivInterface(msgId){
		var wxMsgId = $('#wxMsgId').val();
		$.ajax({
			data : {
						msgId : msgId
						,wxMsgId : wxMsgId
					},
			url : '/admin/report/weixin/newsInterfaceModifyId.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result == 'success'){
					alert('<ui:i18n key="操作成功"/>');
					closebpoupMe();
					query(1,10);
				}else if(data.result == 'fail'){
					alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>');
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
	<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="14%" />
       		 			<col width="36%" />
       		 			<col width="10%" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="图文标题"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="title" value="${requestScope.title }" style="width:200px;" />
						</td>
       		 			<td class="flabel"><ui:i18n key="日期"/>：</td>
       		 			<td class="fcomp">
       		 				<input autocomplete="off"  value="${requestScope.beginDate }" type="text" id="beginDate" style="width:100px;" class="w100 datepicker calendar"/>
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
							<input autocomplete="off" value="${requestScope.endDate }" style="width:100px;" type="text" id="endDate" class="w100 datepicker calendar" />
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button query-interface">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   	 <input type="hidden" value="" id="wxMsgId"/>
       		   </span>
       		</div>
      	</div>
		<div class="result-grid" style="margin-top: 30px;">
	      	<%-- <div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="createAutoReply();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div> --%>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="8%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="12%" />
		      		 			<col width="30%" />
		      		 			<col width="10%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="店铺ID"/></th>
			      		 		<th><ui:i18n key="图文消息ID"/></th>
			      		 		<th><ui:i18n key="Message ID"/></th>
			      		 		<th><ui:i18n key="HZM MsgId"/></th>
			      		 		<th><ui:i18n key="HZM NewsId"/></th>
			      		 		<th><ui:i18n key="图文消息标题"/></th>
			      		 		<th><ui:i18n key="时间"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.SHOP_ID }</td>
									<td>${list.MSGID}</td>
									<td>${list.WX_MSGID}</td>
									<td>
										<c:choose>
		           							<c:when test="${list.MSG_ID eq 0}">
		           							</c:when>
		           							<c:otherwise>
		           								${list.MSG_ID }
		           							</c:otherwise>
		           						</c:choose>
		           					</td>
									<td >
										<c:choose>
			           						<c:when test="${list.NEWS_ID  eq 0}">
			           						</c:when>
			           						<c:otherwise>
			           							${list.NEWS_ID }
			           						</c:otherwise>
			           					</c:choose>
									</td>
									<td style="text-align: left;"><span title="${list.TITLE }" class="title-limite">${list.TITLE }</span></td>
									<td ><span>${list.REF_DATE}</span></td>
									<td>
										<span class="gridbutton red"  onclick="modifyInterface(${list.WX_MSGID });"><ui:i18n key="编辑"/></span>
										<span class="gridbutton red" data-msgd0="${list.TITLE }" data-msgd1="${list.SHOP_ID }"  data-msgd2="${list.MSGID }" data-msgd3="${list.WX_MSGID}" data-msgd4="${list.MSG_ID }" data-msgd5="${list.NEWS_ID }" data-msgd6="${list.USER_SOURCE }" data-msgd7="${list.INT_PAGE_READ_USER }" data-msgd8="${list.INT_PAGE_READ_COUNT }" data-msgd9="${list.ORI_PAGE_READ_USER }" data-msgd10="${list.ORI_PAGE_READ_COUNT }" data-msgd11="${list.SHARE_USER }" data-msgd12="${list.SHARE_COUNT }" data-msgd13="${list.ADD_TO_FAV_USER }" data-msgd14="${list.ADD_TO_FAV_COUNT }"  onclick="showMsgDetail(${status.index});" id="detailMsg${status.index}">
											<ui:i18n key="详情"/>
										</span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />
	     	</div>
	      </div>
   <!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpoupMessage" >
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="详情"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<table class="interface-table">
		 		 		<thead>
			 		 		<tr>
			 		 			<td style="width:30px;"></td>
			 		 			<td style="width:140px;"><ui:i18n key="图文消息标题"/></td>
			 		 			<td colspan="3">
			 		 				<input type="text" readonly="readonly" id="detail-msg0" style="width:500px;"/>
			 		 			</td>
			 		 		</tr>
			 		 	</thead>
			 		 	<tbody>
			 		 		<tr>
			 		 			<td></td>
			 		 			<td><ui:i18n key="店铺ID"/></td>
			 		 			<td style="width:220px;"><input type="text" readonly="readonly" id="detail-msg1"/></td>
			 		 			<td style="width:140px;"><ui:i18n key="图文消息ID"/></td>
			 		 			<td><input type="text" readonly="readonly" id="detail-msg2" /></td>
			 		 		</tr>
			 		 		<tr>
			 		 			<td></td>
			 		 			<td><ui:i18n key="MessageID"/></td>
			 		 			<td><input type="text" readonly="readonly" id="detail-msg3"/></td>
			 		 			<td ><ui:i18n key="HZM MsgId"/></td>
			 		 			<td ><input type="text" readonly="readonly" id="detail-msg4" /></td>
			 		 		</tr>
			 		 		<tr>
			 		 			<td></td>
			 		 			<td><ui:i18n key="HZM NewsId"/></td>
			 		 			<td><input type="text" readonly="readonly" id="detail-msg5"/></td>
			 		 			<td ><ui:i18n key="用户源数"/></td>
			 		 			<td ><input type="text" readonly="readonly" id="detail-msg6" /></td>
			 		 		</tr>
			 		 		<tr>
			 		 			<td></td>
			 		 			<td><ui:i18n key="图文页阅读人数"/></td>
			 		 			<td><input type="text" readonly="readonly" id="detail-msg7"/></td>
			 		 			<td ><ui:i18n key="图文页阅读次数"/></td>
			 		 			<td ><input type="text" readonly="readonly" id="detail-msg8" /></td>
			 		 		</tr>
			 		 		<tr>
			 		 			<td></td>
			 		 			<td><ui:i18n key="原文页阅读人数"/></td>
			 		 			<td><input type="text" readonly="readonly" id="detail-msg9"/></td>
			 		 			<td ><ui:i18n key="原文页阅读次数"/></td>
			 		 			<td ><input type="text" readonly="readonly" id="detail-msg10" /></td>
			 		 		</tr>
			 		 		<tr>
			 		 			<td></td>
			 		 			<td><ui:i18n key="分享人数"/></td>
			 		 			<td><input type="text" readonly="readonly" id="detail-msg11"/></td>
			 		 			<td ><ui:i18n key="分享次数"/></td>
			 		 			<td ><input type="text" readonly="readonly" id="detail-msg12" /></td>
			 		 		</tr>
			 		 		
			 		 		<tr>
			 		 			<td></td>
			 		 			<td><ui:i18n key="收藏的人数"/></td>
			 		 			<td><input type="text" readonly="readonly" id="detail-msg13"/></td>
			 		 			<td ><ui:i18n key="收藏的次数"/></td>
			 		 			<td ><input type="text" readonly="readonly" id="detail-msg14" /></td>
			 		 		</tr>
			 		 	</tbody>
		 		 	</table>
		 		 </div>
		 	</div>
		</div>
	<!-- ▲ bpopup area -->
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="bpoupMessageUpdate" >
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="详情信息"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_avi_music_image"  style="overflow: hidden;" src="/admin/report/weixin/updateNewsInterface.htm"></iframe>
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->
	
	</div>
	<!-- ▲ container  -->
</body>
</html>