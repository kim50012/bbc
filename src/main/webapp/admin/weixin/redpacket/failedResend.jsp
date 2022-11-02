<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key=""/></title>  
<style type="text/css">
.container{
	width:700px;
}
.form-table{
	margin-left: auto;
	margin-right: auto;
}
.text-width{
	width: 155px;
	background: #fff;
}
.text-underline{
	width: 125px;
	text-align: right;
}
.result-grid-table{
	margin-left:2.5%;
}
.text-left{
	padding-left: 15px;
}
</style> 
 
<script type="text/javascript">
	$(function(){
		//设置发送对象数和预计重发金额
		var checkCount = $('input[name=subcheck]:checked').length;
		$('#sendCount').val(checkCount);
		var amount = ${redpacketMap.TOTAL_AMOUNT };
		var totalAount =amount*checkCount/100;
		$('#sendAmount').val(totalAount);
		
		//全选
		$('#checkall').on('ifChecked', function(event){
			$('input[type=checkbox]').iCheck('check');
			$('input[type=checkbox][nam=subcheck]').attr('checked','checked');
		});
		//反选
		$('#checkall').on('ifUnchecked', function(event){
			$('input[type=checkbox]').iCheck('uncheck');
			$('input[type=checkbox][name=subcheck]').removeAttr('checked');
		});
		
		
		$('input[name=subcheck]').on('ifChecked', function(event){
			var seqId= $(this).attr('data-seq-id');
			updateJobStatus(seqId,1);
		});
		$('input[name=subcheck]').on('ifUnchecked', function(event){
			var seqId= $(this).attr('data-seq-id');
			updateJobStatus(seqId,0);
		});
		
		
		$('.js-resend').click(function(){
			
			var checkCount = $('input[name=subcheck]:checked').length;
			if(checkCount == 0){
				alert('<ui:i18n key="请选择需要重发的用户"/>.'); 
				return false;
			}
			
			showBpopup({
 				id : 'poupeOne',
 				width : 300 
 			});
		});
		
		
		$('.js-confirm,.b-close1').click(function(){
			
			//再次发送完成后修改job_status
			var redpacketId = ${redpacketMap.ACT_ID };
			var shopId = ${redpacketMap.SHOP_ID }; 
			var params={
					jobStatus : 0 ,
					redpacketId : redpacketId , 
					shopId : shopId
			};
			$.ajax({
				url: '/admin/wx/redpacket/updateJobStatus.htm',
				data: params,
				success: function(data){ 
					if(data.result == 'success') {
						query();
						$('#sendCount').val(0);
						$('#sendAmount').val(0);
						closeBpopupWindow('resendresult');
					} else {
						alert('<ui:i18n key="发送状态更新失败"/>.');
					}
				},
				error: function(a, msg, c){
					alert('<ui:i18n key="网络出现故障"/>.');
				}
			});
			
		});
		
		
	});
	
	function sendRedpacket(){
		$('#poupeOne').bPopup().close(); 
	
			
//			var $this = $('.result-data-warp');	
//		 	$this.showLoading();
		var redpacketId = ${redpacketMap.ACT_ID };
		var shopId = ${redpacketMap.SHOP_ID }; 
		var params={redpacketId : redpacketId , shopId : shopId};
		$.ajax({
			url: '/admin/wx/redpacket/resend.htm',
			data: params,
			success: function(data){ 
//					$this.hideLoading();
// 				    //重发完成显示重发的结果信息
//					var resendSucceedCount = data.RESEND_SUCCEED_COUNT;
//					var resendFailedCount = data.RESEND_FIALED_COUNT;
//					var redpacketAmount = $('#redpacketAmount').val();
//					$('#resendSucceedCount').val(resendSucceedCount);
//					$('#resendFailedCount').val(resendFailedCount);
//					$('#resendAmount').val(resendSucceedCount*redpacketAmount/100);
//		 			showBpopup({
//		 				id : 'resendresult',
//		 				width : 700 
//		 			});
			},
			error: function(a, msg, c){
//					$this.hideLoading();
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
		
		showBpopup({
			id : 'poupeTwo',
			width : 300 
		});
	}
	
	function toRedpacketList(){
		parent.window.closeResendWindow();
	}
	
	function query(){
		 var redpacketId = ${redpacketMap.ACT_ID };
		 var shopId = ${redpacketMap.SHOP_ID };
		 var sendStatus = 1;
		 var params = {
				 shopId : shopId ,
				 redpacketId : redpacketId ,
				 sendStatus :sendStatus
		 };
		 var url = '/admin/wx/redpacket/failedResendFragment.htm';
		 
		 var $this = $('.result-data-warp');	
		 $this.showLoading();
		 $this.load(url , params ,  function(){ 
			//全选
			$('#checkall').on('ifChecked', function(event){
				$('input[type=checkbox]').iCheck('check');
				$('input[type=checkbox][nam=subcheck]').attr('checked','checked');
			});
			//反选
			$('#checkall').on('ifUnchecked', function(event){
				$('input[type=checkbox]').iCheck('uncheck');
				$('input[type=checkbox][name=subcheck]').removeAttr('checked');
			});
			$('input[name=subcheck]').on('ifChecked', function(event){
				var seqId= $(this).attr('data-seq-id');
				updateJobStatus(seqId,1);
			});
			$('input[name=subcheck]').on('ifUnchecked', function(event){
				var seqId= $(this).attr('data-seq-id');
				updateJobStatus(seqId,0);
			});
			$('.icradio,.iccheckbox').iCheck({
		 	    checkboxClass : 'icheckbox_square-firebrick',
		 	    radioClass : 'iradio_square-firebrick',
		 	    increaseArea : '0%' // optional
		 	});
			 $this.hideLoading();
		 });
		 
	}
	
	
	function updateJobStatus(seqId,status){
		var checkCount = $('input[name=subcheck]:checked').length;
		$('#sendCount').val(checkCount);
		var amount = ${redpacketMap.TOTAL_AMOUNT };
		var totalAount =amount*checkCount/100;
		$('#sendAmount').val(totalAount);
		var redpacketId = ${redpacketMap.ACT_ID };
		var shopId = ${redpacketMap.SHOP_ID }; 
		var params={
				seqId : seqId , 
				jobStatus : status ,
				redpacketId : redpacketId , 
				shopId : shopId
		};
		$.ajax({
			url: '/admin/wx/redpacket/updateJobStatus.htm',
			data: params,
			success: function(data){ 
				if(data.result == 'success') {
					
				} else {
					alert('<ui:i18n key="发送状态更新失败"/>.');
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
	
	
</script>
 
</head>
<body>
	<input type="hidden" id="redpacketAmount" value="${redpacketMap.TOTAL_AMOUNT }"/>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from" style="border:0;">
       		<div class="form-table" >
       		 	<table class="ftable" style="width: 90%;">
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="红包名称"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="" value="${redpacketMap.ACT_NAME }" 
       		 					readonly="readonly" class="text-width" />
						</td>
       		 			<td class="flabel"><ui:i18n key="红包详情"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="" value="${redpacketMap.REMARK }" 
       		 					readonly="readonly" class="text-width"/>
						</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="重发对象数"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="sendCount" value="" class="text-underline" readonly="readonly"
       		 					   style="border:none;border-bottom: 1px solid #eee;color: #d1102d;font-weight: bold;background: #fff;"
       		 					   onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
       		 			     &nbsp;(<ui:i18n key="名"/>)
						</td>
       		 			<td class="flabel"><ui:i18n key="预计重发金额"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="sendAmount" value="" class="text-underline" readonly="readonly"
       		 					   style="border:none;border-bottom: 1px solid #eee;color: #3473dd;font-weight: bold;background: #fff;"
       		 					   onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
       		 			    &nbsp;(<ui:i18n key="元"/>)
						</td>
       		 		</tr>
       		 	</table>
       		</div>
      	</div>
      	<div class="result-grid" >
	     	<div class="js-link-page-grid">
	     		<div class="result-data-warp" style="min-height: 290px;">
	     			<table class="result-grid-table" style="width: 95%;">
		      		 	<colgroup>
					      		<col width="90px"  />
		      		 			<col width="250px" />
		      		 			<col width="130px" />
		      		 			<col />
				      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th class="chk">
			      		 			<input class="iccheckbox" type="checkbox" name="checkall" id="checkall">
			      		 				<ui:i18n key="全选"/>
			      		 		</th>
			      		 		<th><ui:i18n key="OPENID"/></th>
			      		 		<th><ui:i18n key="昵称"/></th>
			      		 		<th><ui:i18n key="错误信息"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
				      		 <c:forEach items="${requestScope.list}" var="item" varStatus="status">
				      		 	<tr>
				      		 		<td class="chk">
				      		 			<input class="iccheckbox js-check-item" type="checkbox" name="subcheck"  
				      		 				   <c:if test="${item.JOB_STATUS ==1}">checked="checked"</c:if> 
				      		 				   data-seq-id="${item.SEQID }"  data-open-id="${item.RE_OPENID }"/>
				      		 		</td>
				      		 		<td>${item.RE_OPENID }</td>
				      		 		<td>${item.NICKNAME }</td>
				      		 		<td>${item.ERROR_CODE }</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
			      	</table>
	     		</div>
	     		<div class="control-warp text-center" style="margin-bottom: 20px;">
					<div class="popup-form-actions">
						<div class="buttons-action">
			  				<span class="button bg-red js-resend">
								<span class="button-icon conform"></span>
								<span class="button-name"><ui:i18n key="重发"/></span>
							</span>
						</div>
					</div>
			 	</div>
	     	</div>
     	</div>
     	
	</div>
	
	<!-- ▲ container  -->
	
	<!-- popup area start -->
	<div class="bpopup2" id="resendresult">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="重发结果"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png"/>
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    	<table class="ftable" style="width: 90%;margin-left: 5%;">
		       		 		<tr>
		       		 			<td class="flabel"><ui:i18n key="发送成功数"/>：</td>
		       		 			<td class="fcomp">
		       		 				<input type="text" id="resendSucceedCount" value=""  class="text-underline" readonly="readonly"
		       		 					   style="border:none;border-bottom: 1px solid #eee;color: #3473dd;background: #fff;"/>
		       		 				 &nbsp;(<ui:i18n key="名"/>)
								</td>
		       		 			<td class="flabel" style="padding-left: 50px;"><ui:i18n key="发送失败数"/>：</td>
		       		 			<td class="fcomp">
		       		 				<input type="text" id="resendFailedCount" value=""  class="text-underline" readonly="readonly"
		       		 					   style="border:none;border-bottom: 1px solid #eee;color: #d1102d;background: #fff;"/>
		       		 				 &nbsp;(<ui:i18n key="名"/>)
								</td>
		       		 		</tr>
		       		 		<tr>
		       		 			<td class="flabel"><ui:i18n key="实际发送金额"/>：</td>
		       		 			<td class="fcomp">
		       		 				<input type="text" id="resendAmount" value=""  class="text-underline" disabled="disabled"
		       		 					   style="border:none;border-bottom: 1px solid #eee;color: #3473dd;background: #fff;"/>
		       		 			     &nbsp;(<ui:i18n key="元"/>)
								</td>
		       		 			<td class="flabel"></td>
		       		 			<td class="fcomp">
								</td>
		       		 		</tr>
		       		 	</table>
		       		 	
		       		 	<div class="control-warp text-center" style="margin-top: 30px;">
				 			<div class="popup-form-actions">
				  			 	 <div class="buttons-action">
					  				<span class="button bg-red js-confirm">
										<span class="button-icon conform"></span>
										<span class="button-name"><ui:i18n key="确认"/></span>
									</span>
				  				</div>
				 			</div>
				 		</div>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<div class="bpopup2" id="poupeOne">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<div class="bpopupColseWarp">
					<img class="b-close1" src="/admin/images/goodsSell/close.png" />
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
				  			 <div class="control-warp" style="width: 100%;text-align: center;" >
				  			 	<ui:i18n key="确认发送红包？"/>
				  			 </div>

				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red"  onclick="sendRedpacket();">
						  					<span class="button-icon conform"></span>
											<span class="button-name"><ui:i18n key="确定"/></span>
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
	
	<div class="bpopup2" id="poupeTwo">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" onclick="toRedpacketList()"/>
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
				  			 <div class="control-warp" style="width: 100%;text-align: center;" >
				  			 	<ui:i18n key="程序开始执行，稍后请在结果查看页确认发送状态。"/>
				  			 </div>

				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red"  onclick="toRedpacketList();">
						  					<span class="button-icon conform"></span>
											<span class="button-name"><ui:i18n key="确定"/></span>
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
	
	<!-- popup area end   -->
</body>
</html>