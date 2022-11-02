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

.form-table .ftable .flabel{
	padding-left: 0
}
.warning{
	width: 100%;
	margin-top: 15px
}
</style>
<script type="text/javascript">
	
	//点击发送按钮
	function clickSendBtn(){
		var actId  = '${requestScope.actId}';
		var openId = $('#openId').val();
		if(openId == ""){
			showBpopup({
				id : 'poupeTwo',
				width : 350
			});
			$('.tishiText').text("请输入用户OPENID");
			return;
		}
		
		var params = {
				actId:actId,
				openId:openId,
			};
			
		$.ajax({
			data : params,
			url : '/admin/wx/redpacket/openIdSearch.htm',
			success : function(data){
				if(data.result.MSG == "S"){
					showBpopup({
						id : 'poupeOne',
						width : 350
					});
				}else{
// 					$('.openId').text('');
// 					$('.nickName').text('');
// 					$('.fasong').html('');
					showBpopup({
						id : 'poupeTwo',
						width : 350
					});
					$('.tishiText').text('<ui:i18n key="'+data.result.MSG+'"/>');
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
		
	}
	//确认补发
	function sendRedpacket(){
		//红包id
		var actId = '${requestScope.actId}'
		//红包金额
		var openId = $('#openId').val();
		
		var params = {
			actId:actId,
			openId:openId,
		};
		
		$.ajax({
			data : params,
			url : '/admin/wx/redpacket/reissue.htm',
			success : function(data){
				if(data.result == "S"){
					showBpopup({
						id : 'poupeThree',
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
		window.parent.toViewResults();  
	}
	function closePoupe(){
		$('#poupeTwo').bPopup().close();
	}
	function search(){
		var actId  = '${requestScope.actId}';
		var openId = $('#openId').val();
		if(openId == ""){
			showBpopup({
				id : 'poupeTwo',
				width : 350
			});
			$('.tishiText').text("请输入用户OPENID");
			return;
		}
		
		var params = {
				actId:actId,
				openId:openId,
			};
			
		$.ajax({
			data : params,
			url : '/admin/wx/redpacket/openIdSearch.htm',
			success : function(data){
				if(data.result.MSG == "S"){
					$('.openId').text(data.result.OPENID);
					$('.nickName').text(data.result.NICKNAME);
					$('.fasong').html(
								'<span class="button" onclick="clickSendBtn();">'+
									'<span class="button-name"><ui:i18n key="发送"/></span>'+
								'</span>'
								);
				}else{
					$('.openId').text('');
					$('.nickName').text('');
					$('.fasong').html('');
					showBpopup({
						id : 'poupeTwo',
						width : 350
					});
					$('.tishiText').text('<ui:i18n key="'+data.result.MSG+'"/>');
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
		
	}
</script>
</head>

<body>
	 <div class="container">

	<!-- ▼ 查询表单区域  --> 
       <div class="query-from" style="border: 0">
       		<div class="form-table" style="width: 100%">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="15%" />
       		 			<col width="45%" />
       		 			<col width="15%" />
       		 			<col width="25%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="OPENID"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" id="openId" autocomplete="off" style="width: 250px" />
       		 			</td>
       		 			<td class="flabel last"></td>
       		 			<td class="fcomp last" style="text-align: center">
							<span class="button" onclick="search();">
			       		   	  <span class="button-icon search"></span>
			       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
			       		    </span>
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
      	</div>
	  	<!-- ▲ 查询表单区域  -->
	  	
	  	<div class="result-grid"">
			<table class="result-grid-table">
				 <colgroup>
						<col width="33%"  />
						<col width="33%" />
						<col width="33%" />
				</colgroup>
				 <thead class="result-grid-thead">
				 	<tr>
				 		<th><ui:i18n key="OPENID"/></th>
				 		<th><ui:i18n key="昵称"/></th>
				 		<th></th>
				 	</tr>
				 </thead>
				 <tbody  class="result-grid-tbody"> 
				 	<tr>
				 		<td class="openId">
				 			
				 		</td>
				 		<td class="nickName">
				 			
				 		</td>
				 		<td style="padding-left:25px" class="fasong">
				 			
				 		</td>
				 	</tr>
				 </tbody>
			</table>
				
		</div>
  		
  		<div class="warning">
  			<span style="color:#d1102d">*</span> <ui:i18n key="该功能仅用于对“过期未领退款”等特殊情况的补发处理，擅自违规使用将予以责任追究！"/>
  		</div>

	</div>
	
	<!-- ▼ 确定发送弹窗 -->
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
	<!-- 确定发送弹窗 -->
	
	<!-- ▼ 提示弹窗 -->
	<div class="bpopup2" id="poupeTwo">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" onclick="closePoupe();"/>
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
				  			 	<span class="tishiText"></span>
				  			 </div>

				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="closePoupe();">
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
	<!-- 提示弹窗 -->
	
	<!-- ▼ 确定发送后的弹窗 -->
	<div class="bpopup2" id="poupeThree">
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
				  			 	<span class="tishiText1">程序开始执行，稍后请在结果查看页确认发送状态。</span>
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