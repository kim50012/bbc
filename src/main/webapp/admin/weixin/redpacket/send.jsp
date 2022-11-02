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
.container{
	width: 650px;
	height: 230px;
	margin: 0 25px;
	box-sizing: border-box;
}
.number{
	width: 160px;
	height: 20px;
	border-bottom: 1px solid #000000;
	display: inline-block;
	margin-bottom: -5px;
	text-align: center;
	color: #3473dd;
	font-weight: bold;
}
.money{
	width: 170px;
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
	padding-left: 15px
}
.status{
	padding-left: 15px
}
.form-table .ftable .flabel{
	padding-left: 0
}
</style>
<script type="text/javascript">
	
	//点击发送按钮
	function clickSendBtn(){
		showBpopup({
			id : 'poupeOne',
			width : 350
		});
		
	}
	//确认发送
	function sendRedpacket(){
		//红包id
		var actId = '${requestScope.act.actId}'
		//红包金额
		var totalAmount = '${requestScope.act.totalAmount * 100}';
		//红包祝福语
		var wishing = '${requestScope.act.wishing}';
		//活动名称
		var actName = '${requestScope.act.actName}';
		//活动详情
		var remark = '${requestScope.act.remark}';
		
		var params = {
			actId:actId,
			totalAmount:totalAmount,
			wishing:wishing,
			actName:actName,
			remark:remark
		};
		
		$.ajax({
			data : params,
			url : '/admin/wx/redpacket/sendRedPage.htm',
			success : function(data){
				if(data.result == "S"){
					showBpopup({
						id : 'poupeTwo',
						width : 350
					});
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
		
	}
	function toRedpacketList(){
		$('#bpoupImgDiv').bPopup().close();
		window.parent.closeSend();
		window.parent.toRedPackItem();  
	}
</script>
</head>

<body>
	 <div class="container">
	<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 10px">
			<div class="title-warp">
				<img alt="" src="/admin/images/redPacket/xinxigaikuang.png">
				<span class="title-name"><ui:i18n key="信息概要"/></span>
			</div>
		</div>
	<!-- ▲标题 -->
	<!-- ▼ 查询表单区域  --> 
       <div class="query-from" style="border: 0">
       		<div class="form-table" style="width: 100%">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="13%" />
       		 			<col width="39%" />
       		 			<col width="16%" />
       		 			<col width="33%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="红包名称"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" disabled="disabled" autocomplete="off" style="width: 160px" value="${requestScope.act.actName }" title="${requestScope.act.actName }"/>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="红包详情"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" disabled="disabled" autocomplete="off" style="width: 170px" value="${requestScope.act.remark }" title="${requestScope.act.remark }"/>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="发送对象数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number">
       		 					${requestScope.act.sendNum }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="预计发送金额"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="money">
       		 					${requestScope.act.totalAmount * requestScope.act.sendNum} 
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
	  	
	  	<div class="navi-button-area" style="width:100%;" onclick="clickSendBtn()">
  			<span class="btn-step js-btn-load" ><span><ui:i18n key="发送"/></span></span>
  		</div> 
  		
  		<hr> 
  		
	</div>
	
	<!-- ▼ 确定发送后的弹窗 -->
	<div class="bpopup2" id="poupeOne">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
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
				  			 <div class="control-warp" style="width: 100%;text-align: center;" >
				  			 	<ui:i18n key="确认发送红包？"/>
				  			 </div>

				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="sendRedpacket();">
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
	<!-- 确定发送后的弹窗 -->
	
	<!-- ▼ 确定发送后的弹窗 -->
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
						  				<span class="button bg-red js-confirm"  onclick="toRedpacketList();">
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
	<!-- 确定发送后的弹窗 -->
</body>
</html>