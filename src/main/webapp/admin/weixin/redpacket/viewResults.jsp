<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%>  
<title></title>
<style type="text/css">
body{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
input{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
} 

.number{
	width: 60px;
	height: 20px;
	border-bottom: 1px solid #000000;
	display: inline-block;
	margin-bottom: -5px;
	text-align: center;
	color: #3473dd;
	font-weight: bold;
}
.money{
	width: 70px;
	height: 20px;
	border-bottom: 1px solid #000000;
	display: inline-block;
	margin-bottom: -5px;
	text-align: center;
	color: #3473dd;
	font-weight: bold;
}
.danwei{
	height: 20px;
	display: inline-block;
}
.navi-button-area {
	margin: 0 auto;
	text-align: center;
	height: 34px;
	padding: 8px 0;
	background-color: #fff;
}
.btn-step {
	display: inline-block;
  	height: 30px;
	line-height: 30px;
	border-radius: 2px;
	cursor: pointer;
	background-color: #d1102d;
	text-align: center;
	width: 80px;
	color: #fff;
	font-size: 12px;
	background-repeat: no-repeat;
	background-position: 70px 9px;
	border: 0; 
  	padding-left: 0;
  	padding-right:0;
}

.result-grid .result-grid-table .result-grid-tbody tr{
	border-bottom: none;
}
hr{
	margin: 10px 0
}
.nickName{
	padding-left: 5px
}
.subscribe{
	padding-left: 10px
}
.result{
	padding-left: 10px
}
.sendDate{
	padding-left: 15px
}
.bufaResult{
	padding-left: 15px
}
.bufaSendDate{
	padding-left: 25px
}
.warning{
	width: 100%;
}
.openId-color{
	color: #3473dd;
	cursor: pointer;
}

</style>
<script type="text/javascript">
	//查询
	function search(){
		//红包id
		var actId = '${requestScope.actId}';
		//OPENID
		var openId = $('#openId').val();
		//用户昵称
		var nickName = $('#nickName').val();
		//发送结果
		var redParkStatus = $('#redParkStatus').val();
		//商户订单号
		var mchBillno = $('#mchBillno').val();
		
		var params = {
				actId:actId
				,openId : openId
				,nickName : nickName
				,redParkStatus : redParkStatus
				,mchBillno : mchBillno
		}
		var url = '/admin/wx/redpacket/viewResultsFragment.htm';
		 
		 var $this = $('.resultList');	
		 $this.showLoading();
		 $this.load(url , params ,  function(){ 
			$this.find('.select2').select2({
				 minimumResultsForSearch:5
				 ,allowClear: true 
			 });
			 $this.hideLoading();
		 });
		 
	}
	function toSendAgain(){
		$('#iframe').attr('src','/admin/wx/redpacket/sendAgain.htm?actId=${requestScope.actId}');    
		showBpopup({
			id : 'bpoupImgDiv',
			width : 700
		});

	}
	function closeSend(){
		$('#ifrPage').attr('src','');
		$('#bpoupImgDiv').bPopup().close(); 
	}
	function toViewResults(){
		window.location.href='/admin/wx/redpacket/viewResults.htm?actId=${requestScope.actId}';
	}
	function sendHist(times,openId){
		if(times>0){
			$('#iframe1').attr('src','/admin/wx/redpacket/ressiueHistory.htm?actId=${requestScope.actId}&openId='+openId);    
			showBpopup({
				id : 'bpoupHistory',
				width : 700
			});
		}
	}
	function mouseover(id,times){
		if(times>0){
			$('#openId'+id).addClass('openId-color');
		}
		
	}
	function mouseout(id){
		$('#openId'+id).removeClass('openId-color');
	}
</script>
</head>

<body>
	 <div class="container">
	<!-- ▼标题 -->
		<div class="clearfix">
			<div class="title-warp">
				<img alt="" src="/admin/images/redPacket/xinxigaikuang.png">
				<span class="title-name"><ui:i18n key="信息概要"/></span>
			</div>
		</div>
	<!-- ▲标题 -->
	<!-- ▼ 查询表单区域  --> 
       <div class="query-from">
       		<div class="form-table" style="width: 100%">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="11%" />
       		 			<col width="25%" />
       		 			<col width="11%" />
       		 			<col width="20%" />
       		 			<col width="11%" />
       		 			<col width="20%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="红包名称"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" disabled="disabled" autocomplete="off" style="width: 190px" value="${requestScope.act.actName }" title="${requestScope.act.actName }"/>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="红包详情"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" disabled="disabled" autocomplete="off" style="width: 160px" value="${requestScope.act.remark }" title="${requestScope.act.remark }"/>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="红包金额"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" disabled="disabled" autocomplete="off" style="width: 160px" value="${requestScope.act.totalAmount }"/>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="活动期间"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" id="dateStart" value="${requestScope.act.beginDate }" name="dateStart"  autocomplete="off" disabled="disabled" style="width: 75px"/>
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
		  			 	 	<input type="text" id="dateEnd" value="${requestScope.act.endDate }" name="dateEnd"  autocomplete="off" disabled="disabled" style="width: 75px"/>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="OPENID"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" autocomplete="off" id="openId" name="openId" style="width: 160px" />
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="昵称"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" autocomplete="off" id="nickName" name="nickName" style="width: 160px" />
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="发送结果"/>：</td>
       		 			<td class="fcomp last">
       		 				<select style="width:213px;" class="select2" id="redParkStatus" name="redParkStatus" data-placeholder="" >
								<option value="">全部</option>
								<option value="2">成功</option>
								<option value="1">失败</option>
								<option value="4">未发送</option>
							</select>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="商户订单号"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" id="mchBillno" name="mchBillno" autocomplete="off" style="width: 160px" />
       		 			</td>
       		 			<td class="fcomp last" style="text-align: right;" colspan="2">
       		 				<span class="button" onclick="search();">
			       		   	  <span class="button-icon search"></span>
			       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
			       		    </span>
			       		    <span class="button" onclick="toSendAgain();" style="margin-left: 18px;margin-right: 4px;">
			       		   	  <span class="button-icon" ><img alt="" src="/admin/images/redPacket/bufa.png" style="margin-bottom: 3px"></span>
			       		   	  <span class="button-name"><ui:i18n key="补发"/></span> 
			       		    </span>
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
      	</div>
	  	<!-- ▲ 查询表单区域  -->
	  	
	  	<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 10px">
			<div class="title-warp">
				<img alt="" src="/admin/images/redPacket/A4-08_03.png">
				<span class="title-name"><ui:i18n key="最初导入结果"/></span>
			</div>
		</div>
		<!-- ▲标题 -->
		 
		
		<!-- ▼ 查询表单区域  --> 
       <div class="query-from" style="border-left: 0;border-right: 0;margin: 10px 0">
       		<div class="form-table" style="width: 100%">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="13%" />
       		 			<col width="12%" />
       		 			<col width="14.5%" />
       		 			<col width="10.5%" />
       		 			<col width="13%" />
       		 			<col width="12%" />
       		 			<col width="13%" />
       		 			<col width="12%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="上传用户数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number" style="color:#00da1f">
       		 					${requestScope.view.SUM_NUM }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="取关用户数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number" style="color:#d1102d ">
       		 					${requestScope.view.OUT_NUM }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="关注用户数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number">
       		 					${requestScope.view.SUSSCESS_NUM }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="预计发送金额"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number">
       		 					${requestScope.view.SEND_MONEY }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="元"/>)
       		 				</div>
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
      	</div>
	  	<!-- ▲ 查询表单区域  -->
	
	  	<div class="resultList">	
	  		<div class="result-grid" style="margin-top: 10px">
		  		<div class="js-grid-content" style="height: 50px">
		 			<div class="result-data-warp" style="">
		 				
		 				<table class="result-grid-table">
				      		<colgroup>
		      		 			<col width="25%" />
		      		 			<col width="25%" />
		      		 			<col/>
		      		 			<col width="8%" />
		      		 			<col width="8%" />
		      		 			<col width="13%" />
		      		 			<col width="8%" />
<!-- 		      		 			<col width="6%" /> -->
<!-- 		      		 			<col width="15%" /> -->
			      		 	</colgroup>
				      		 <thead class="result-grid-thead">
				      		 	<tr>
				      		 		<th><ui:i18n key="OPENID"/></th>
				      		 		<th><ui:i18n key="商户订单号"/></th>
				      		 		<th><ui:i18n key="昵称"/></th>
				      		 		<th><ui:i18n key="关注与否"/></th>
				      		 		<th><ui:i18n key="发送结果"/></th>
				      		 		<th><ui:i18n key="发送日期"/></th>
				      		 		<th><ui:i18n key="补发次数"/></th>
<%-- 				      		 		<th><ui:i18n key="补发结果"/></th> --%>
<%-- 				      		 		<th><ui:i18n key="补发日期"/></th> --%>
				      		 	</tr>
				      		 </thead>
			      		</table>
			      		
		 			</div> 
		     	</div>
	     	
		     	<div class="js-grid-content" style="height: 200px;overflow: auto;padding-right: 5px">
		 			<div class="result-data-warp">
		 				<table class="result-grid-table">
				      		<colgroup>
		      		 			<col width="25%" />
		      		 			<col width="25%" />
		      		 			<col/>
		      		 			<col width="8%" />
		      		 			<col width="8%" />
		      		 			<col width="13%" />
		      		 			<col width="8%" />
<!-- 		      		 			<col width="6%" /> -->
<!-- 		      		 			<col width="15%" /> -->
			      		 	</colgroup>
				      		 <tbody  class="result-grid-tbody">	
				      		 	<c:forEach items="${list }" var="list" varStatus="status">
				      		 		<tr>
					      		 		<td onclick="sendHist('${list.RESSIUE_TIME}','${list.RE_OPENID }')" 
					      		 			onmouseover="mouseover('${status.index }','${list.RESSIUE_TIME}')" 
					      		 			onmouseout="mouseout('${status.index }')"
					      		 			id="openId${status.index }">
					      		 			${list.RE_OPENID }
					      		 		</td>
					      		 		<td class="">${list.MCH_BILLNO }</td>
					      		 		<td class="nickName">${list.NICKNAME }</td>
					      		 		<td class="subscribe">${list.SUBSCRIBE }</td>
					      		 		<td class="result">${list.RED_PARK_STATUS }</td>
					      		 		<td class="sendDate">${list.SEND_DT }</td>
					      		 		<td class="">${list.RESSIUE_TIME }</td>
<%-- 					      		 		<td class="bufaResult">${list.REISSUE }</td> --%>
<%-- 					      		 		<td class="bufaSendDate">${list.RESEND_DT }</td> --%>
					      		 	</tr>
				      		 	</c:forEach>
				      		 </tbody>
			      		</table>
			      		
		 			</div> 
		     	</div>
	     	</div>
	     	
	     	<hr>
	     	
	     	<!-- ▼标题 -->
			<div class="clearfix" style="margin-top: 10px">
				<div class="title-warp">
					<img alt="" src="/admin/images/redPacket/fasongjieguo.png" style="margin-bottom: 9px">
					<span class="title-name"><ui:i18n key="发送结果"/></span>
				</div>
			</div>
			<!-- ▲标题 -->
			
		  	<div class="query-from" style="border-left: 0;border-right: 0;margin: 10px 0">
       		<div class="form-table" style="width: 100%">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="14%" />
       		 			<col width="11%" />
       		 			<col width="14%" />
       		 			<col width="11%" />
       		 			<col width="12%" />
       		 			<col width="13%" />
       		 			<col width="13%" />
       		 			<col width="12%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="发送成功总数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number" style="color:#3473dd">
       		 					${requestScope.number.SUSSCESS }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="补发成功数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number" style="color:#3473dd">
       		 					${requestScope.number.REISSUE_SUCCESS }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="发送失败总数"/>：</td>
       		 			<td class="fcomp last" >
       		 				<div class="number" style="color:#d1102d">
       		 					${requestScope.number.FAIL }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="补发失败数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number"  style="color:#d1102d">
       		 					${requestScope.number.REISSUE_FAIL }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="flabel last"><ui:i18n key="实际发送总金额"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number"  style="color:#3473dd">
       		 					${requestScope.number.SEND_MONEY }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="元"/>)
       		 				</div>
       		 			</td>
       		 			<td colspan="6"></td>
       		 		</tr>
       		 	</table>
       		</div>
      	</div>
		  	
		  	<div class="navi-button-area" style="width:100%;margin: 15px 0 10px 0" >
	  			<span class="btn-step js-btn-load" onclick="window.location.href='/admin/wx/redpacket/redPackItem.htm?actId=${requestScope.actId}'"><span><ui:i18n key="确认"/></span></span>
	  			<span class="btn-step js-btn-load" style="margin-left: 20px" onclick="window.location.href='/admin/wx/redpacket/redPackItem.htm?actId=${requestScope.actId}'"><span><ui:i18n key="返回"/></span></span>
	  		</div> 
	  		
	  		<div class="warning">
	  			<div>
	  				<span style="color:#d1102d">*</span> 
	  				<ui:i18n key="目前微信接口未提供实际向客户发送成功与否的结果值，以及“过期未领退款”等特殊情况的反馈值，该页面仅用于显示提交给微信服务器的操作结果。"/>
	  			</div>
	  			<div style="margin-left: 1px">
	  				&nbsp;&nbsp;<ui:i18n key="显示的发送结果与金额可能与实际情况不一致，必要时请前往微信支付商户平台再次确认"/>。
	  			</div>
	  		</div>
	  		
	  	</div>		
  		
	</div>
	
	<!-- ▼弹出补发弹出框 -->
	<div class="bpopup2" id="bpoupImgDiv">
		<div class="bpopupWarp">
			<div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="补发红包"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
			<div class="bpopupContentWarp"> 
				<iframe class="js-content-iframe" style="margin-bottom: -4px" id="iframe" width="700" height="230" frameBorder=0 scrolling=yes  src="/admin/wx/redpacket/sendAgain.htm"></iframe>
			</div>
		</div>
	</div>
	<!-- ▲ 弹出补发弹出框 -->
	
	<!-- ▼弹出补发弹出框 -->
	<div class="bpopup2" id="bpoupHistory">
		<div class="bpopupWarp">
			<div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="补发履历"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
			<div class="bpopupContentWarp"> 
				<iframe class="js-content-iframe" style="margin-bottom: -4px" id="iframe1" width="700" height="230" frameBorder=0 scrolling=yes ></iframe>
			</div>
		</div>
	</div>
	<!-- ▲ 弹出补发弹出框 -->
</body>
</html>