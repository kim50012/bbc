<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="优惠券管理"/></title>  
<style type="text/css">
 .result-grid-table{
 	font-size:12px;
 	color:#5f5f5f;
 }
 .gray{
 	color:#a2a2a2;
 }
</style> 
 
<script type="text/javascript">
	$(function(){
		$('.search-roulette').click(function(){
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
		var statusId = $('#STATUS_ID').val(); 
		if(statusId == '5'){
			statusId = '';
		}
		var couponNm = $('#COUPON_NM').val();
		var params = {
				statusId : statusId
				,couponNm : couponNm
				,pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/voucher/voucherListFragment.htm';
		 
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
	//信息的创建
	function addVoucher(){
		window.location.href = '/admin/voucher/voucherCreate.htm';
	}
	//修改摇奖活动
	function modifyVoucher(couponId){
		window.location.href = '/admin/voucher/voucherUpdate.htm?couponId=' + couponId;
	}
	function start(couponId){
		var conf = window.confirm('<ui:i18n key="确定要启用吗"/>？');
		if(conf == false) {
	        return ;
	        }
	    else {
		var couponId = couponId;
		var param = {couponId : couponId};
		$.ajax({
			data:param,
			url : '/admin/voucher/start.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result=='success'){
					alert('<ui:i18n key="启用成功"/>');
					window.location.href='/admin/voucher/voucher.htm';
				}else{
					alert('<ui:i18n key="启用失败"/>，<ui:i18n key="请重新操作"/>');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		 });
		}
	}
	function stop(couponId){
		var conf = window.confirm('<ui:i18n key="确定要停用吗"/>？');
		if(conf == false) {
	        return ;
	        }
	    else {
		var couponId=couponId;
		var param={couponId:couponId};
		$.ajax({
			data:param,
			url : '/admin/voucher/stop.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result == 'success'){
					alert('<ui:i18n key="停用成功"/>');
					window.location.href = '/admin/voucher/voucher.htm';
				}else{
					alert('<ui:i18n key="停用失败"/>，<ui:i18n key="请重新操作"/>');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		 });
	    }
	}
	function toCust(couponId,custLevel){
		//刚打开cust时flag=0，进入cust以后flag=1；
		var flag=0;
		$('#iframe_avi_music_image').attr('src','/admin/voucher/custPoupe.htm?couponId=' + couponId + '&gradeId=' + custLevel + '&flag=' + flag);
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 900,
			height : 490,
			action : $('#iframe_avi_music_image').attr('src')
		});
	}
	function closebpoupMe(){
		closeBpopupWindow('bpoupMessage');
	}
	function closeDiv(){
		closeBpopupWindow('bpoupMessage');
		window.location.href = '/admin/voucher/voucher.htm';
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
       		 			<col width="15%" />
       		 			<col width="35%"/>
       		 			<col width="10%"/>
       		 			<col/>
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="优惠券名称"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" style="width:210px;" value="${requestScope.couponNm}" id="COUPON_NM" />
						</td>
						<td class="flabel" ><ui:i18n key="状态"/>：</td>
       		 			<td class="fcomp">
       		 				<select class="select2" data-placeholder="" id="STATUS_ID" style="width:210px;">
								<option value=""></option>
								<option value="5"><ui:i18n key="全部"/></option>
								<option value="1"><ui:i18n key="待发放"/></option>
								<option value="2"><ui:i18n key="使用中"/></option>
								<option value="3"><ui:i18n key="已停用"/></option>
								<option value="4"><ui:i18n key="已过期"/></option>
							</select>
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button search-roulette">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
		<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="addVoucher();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="140px" />
		      		 			<col width="140px" />
		      		 			<col width="80px" />
		      		 			<col width="80px" />
		      		 			<col width="80px" />
		      		 			<col width="80px" />
		      		 			<col width="150px" />
		      		 			<col width="80px" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="优惠券名称"/></th>
			      		 		<th><ui:i18n key="金额"/>（<ui:i18n key="元"/>）</th>
			      		 		<th><ui:i18n key="发行数量"/></th>
			      		 		<th><ui:i18n key="发放客户数"/></th>
			      		 		<th><ui:i18n key="领取客户数"/></th>
			      		 		<th><ui:i18n key="已使用数"/></th>
			      		 		<th><ui:i18n key="有效期限"/></th>
			      		 		<th><ui:i18n key="状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td><span class="COUPON_NM">${list.COUPON_NM }</span></td>
									<td>
										${list.FACE_VALUE}<ui:i18n key="元"/>
			           					<br>
			           					<span style="color: #a2a2a2;font-size: 12px"><ui:i18n key="最低订单金额"/>${list.BUY_AMOUNT}<ui:i18n key="元"/></span>
			           				</td>
									<td>${list.CIRCULATION_CNT }</td>
									<td>${list.CUST_CNT }</td>
									<td>${list.RECEIVE_CNT }</td>
									<td>${list.USE_CNT }</td>
									<td>${list.VALIDITY_F_DT}~${list.VALIDITY_T_DT}</td>
									<td>${list.STATUS_NM}</td>
									<td>
						           		<c:choose>
				           					<c:when test="${list.STATUS_ID==1}">
				           						<span class="gridbutton red"  onclick="modifyVoucher(${list.COUPON_ID });"><ui:i18n key="编辑"/></span>
				           					</c:when>
				           					<c:otherwise>
				           						<span class="gridbutton gray" ><ui:i18n key="编辑"/></span>
				           					</c:otherwise>
				           				</c:choose>
				           				<c:choose>
				           					<c:when test="${list.STATUS_ID==3 or list.STATUS_ID==4 }">
				           						<c:if test="${list.STATUS_ID==3}">
				           							<span class="gridbutton green" onclick="start('${list.COUPON_ID}');"><ui:i18n key="启用"/></span><br>
				           							<span class="gridbutton gray" ><ui:i18n key="发放优惠券"/></span>
				           						</c:if>
				           						<c:if test="${list.STATUS_ID==4}">
				           							<span class="gridbutton gray" ><ui:i18n key="启用"/></span><br>
				           							<span class="gridbutton gray" ><ui:i18n key="发放优惠券"/></span>
				           						</c:if>
				           					</c:when>
				           					<c:otherwise>
				           						<span class="gridbutton red" onclick="stop('${list.COUPON_ID}');"><ui:i18n key="停用"/></span><br>
				           						<span class="gridbutton red" onclick="toCust('${list.COUPON_ID}','${list.CUST_LEVEL}');"><ui:i18n key="发放优惠券"/></span>
				           					</c:otherwise>
				           				</c:choose>
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
							<h3 class="bpopupTitle js-title"><ui:i18n key="选定发放对象"/></h3>
							<div class="bpopupColseWarp">
								<img class="b-close" src="/admin/images/goodsSell/close.png" />
							</div>
						</div>
				 		 <div class="bpopupContentWarp"> 
				 		 	<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_avi_music_image"  style="overflow: hidden;" src=""></iframe>
				 		 </div>
				 	</div>
				</div>
			<!-- ▲ bpopup area -->
	</div>
	<!-- ▲ container  -->
</body>
</html>