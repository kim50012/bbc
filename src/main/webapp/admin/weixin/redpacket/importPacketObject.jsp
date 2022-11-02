<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <link rel="stylesheet" type="text/css" href="/admin/css/popup/popup-v2.css" />
<style type="text/css">
	.text_area{
		width:300px;
		padding-left:20px;
		padding-top:20px;
		height:100px;
		line-height:20px;
	}
	.title_show {
	    height: 20px;
	    width: 280px;
	    position: absolute;
	    top: 2px;
	    left: 30px;
	    display: inline-block;
	    background-color: #fff;
	    text-align: center;
	    color:#d1102d;
	}
	.import_submit{
		width:80px !important;
		height:30px;
		background-color:#d0112d;
		border-radius:2px;
		border:0;
		color:#fff;
		font-size:12px;
		margin-left:20px;
	}
	.import_title{
		padding-left:30px;
		padding-top:20px;
		display:inline-block;
		background-image: url("/admin/images/redPacket/A4-08_03.png");
		background-repeat: no-repeat;
		background-position: 10px 22px;
		padding-bottom:2px;
	}
	.import_result{
		width:98%;
		margin-left:1%;
		position: relative;
		border:1px solid #eee;
		margin-bottom:71px;
	}
	.import_result div{
		width:49%;
		display: inline-block;
		padding-top:20px;
		padding-bottom:20px;
		text-align: center;
	}
	.import_result div .result_title{
		padding-right:30px;
		width:72px;
		text-align: left;
		display:inline-block;
	}
	.import_result div .result_num{
		border-bottom:1px solid #eee;
		width:60px !important;
		display: inline-block;
		font-weight: bold;
	}
	.import_result div .result_suffix{
		padding-left:20px;
	}
	.submit-div{
		width:100%;
		text-align: center;
		height:50px;
		position: fixed;
		bottom:0;
		background-color: #fff;
		padding-top:20px;
	}
</style>
<script type="text/javascript">

	$(function(){
		$('.import_submit').click(function(){
			var openIdAll = $('.text_area').val();
			var param = {openIdAll : openIdAll};
			if(Trim(openIdAll) == ''){
				alert('<ui:i18n key="请填写发送对象"/>');
				return;
			}
			parent.window.showLoad();
			$.ajax({
				data : param,
				url : '/admin/wx/redpacket/getOpenIdList.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					var list = data.result;
					$('.result-grid-tbody').children().remove();
					if(list.length > 0){
						for(var i = 0;i<list.length;i++){
							var htm = '<tr>'+
						      		 		'<td>'+
												'<span class="text-ellipsis">'+list[i].OPENID+'</span>'+
											'</td>'+
						      		 		'<td>'+
												'<span class="text-ellipsis">'+list[i].NICKNAME+'</span>'+
											'</td>'+
						      		 		'<td>'+list[i].SUBSCRIBE_NAME+'</td>'+
						      		 	'</tr>';
							$('.result-grid-tbody').append(htm);
						}
						var moneyOne = 0;
						if($('#packetNum').val() == ''){
							moneyOne = 0;
						}else{
							moneyOne = $('#packetNum').val();
						} 
						$('#cancelCustNum').text(data.cancelCustNum);
						$('#importCustNum').text(list.length);
						$('#subscribeCustNum').text(data.subscribeCustNum);
						$('#predictMoneyNum').text(data.subscribeCustNum*moneyOne);
						$("#openIdAll").val(data.openIdY);
						if(data.errorOpenId != ''){
							showBpopup({
								id : 'poupeTwo',
								width : 400,
								top:50
							});
							$('#showOpenId').html(data.errorOpenId );
							/* alert(data.errorOpenId+"<ui:i18n key="这些不是该店铺的OPENID"/>"); */
						}
						parent.window.closeLoad();
					}else{
						$("#openIdAll").val('');
						$('.text_area').val('');
						parent.window.closeLoad();
						if(data.errorOpenId != ''){
							showBpopup({
								id : 'poupeTwo',
								width : 400,
								top:50
							});
							$('#showOpenId').html(data.errorOpenId);
							/* alert(data.errorOpenId+"<ui:i18n key="这些不是该店铺的OPENID"/>"); */
						}else{
							$('.text_area').val('');
							alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>');							
						}
					}
				},
				error : function(a, msg, c) {
					parent.window.closeLoad();
					alert("error: " + msg);
				}
			});
		});
		$('.js-trans-order-cancel').click(function(){
			parent.window.closePoupDivImport(); 
		});
		$('#packetNum').change(function(){
			var num = $(this).val();
			if(num.match(/^[1-9]\d*$|^\d+\.\d{1,2}$/)){
				var money = Number($('#subscribeCustNum').text())*num;
				$('#predictMoneyNum').text(money);
			}else{
				alert('<ui:i18n key="红包金额格式不正确"/>');
				$(this).val(0);
				$('#predictMoneyNum').text(0);
			}
		});
		
		
		$('.js-trans-order-confirm').click(function(){
			var jobType = $(this).data('type');
			var  packetName = $('#packetName').val();
			if(packetName == ''){
				alert('<ui:i18n key="请填写红包名称"/>。');
				return;
			}
			var  packetDetail = $('#packetDetail').val();
			if(packetDetail == ''){
				alert('<ui:i18n key="请填写红包详情"/>。');
				return;
			}
			var createdDateFrom = $('#createdDateFrom').val();
			var createdDateTo = $('#createdDateTo').val();
			if(createdDateFrom == '' || createdDateTo == ''){
				alert('<ui:i18n key="请选择活动时间"/>.');
				return;
			}
			var date1 = new Date(createdDateFrom);
			var date2 = new Date(createdDateTo);
			if(date1 > date2){
				alert('<ui:i18n key="活动时间选择错误"/>！');
				return;
			}
			var  packetNum = $('#packetNum').val();
			if(packetNum == ''){
				alert('<ui:i18n key="请填写红包金额"/>。');
				return;
			}else{
				packetNum = parseInt(packetNum*100);
			}
			var openIdAll = $("#openIdAll").val();
			if(Trim(openIdAll) == ''){
				alert('<ui:i18n key="请填写发送对象"/>');
				return;
			}
			var actId = $('#actId').val();
			var param = {
							 openIdAll : openIdAll
							,packetName : packetName
							,packetDetail : packetDetail
							,createdDateFrom : createdDateFrom
							,createdDateTo : createdDateTo
							,packetNum : packetNum
							,jobType : jobType
							,actId : actId
							,wishing:''
						};
			parent.window.showLoad();
			$.ajax({
				data : param,
				url : '/admin/wx/redpacket/saveOpenIdList.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.map.RE_CODE == 'S'){
						parent.window.closeLoad();
						alert('<ui:i18n key="操作成功"/>');
						parent.window.closePoupDivImportReload(); 
					}else if(data.map.RE_CODE == 'E'){
						parent.window.closeLoad();
						alert('<ui:i18n key="存在重复的OPENID"/>，<ui:i18n key="不可插入"/>');
					}else{
						parent.window.closeLoad();
						alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>');
					}
				},
				error : function(a, msg, c) {
					parent.window.closeLoad();
					alert("error: " + msg);
				}
			});
		});
	});
	//去掉字符串前后所有空格
	 function Trim(str){ 
         return str.replace(/(^\s*)|(\s*$)/g, ""); 
 	}
	function toRedpacketList(){
		$("#poupeTwo").bPopup().close(); 
	}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="popup-container"> 
		
		<div class="popup-top-area clearfix">
    		<div class="form-warp clearfix" style="padding: 13px 20px;" >
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label" style="width: 70px;">
	  			 		<ui:i18n key="红包名称"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  class="js-search-title w20" id="packetName" maxlength="10"  value="${map.ACT_NAME }" placeholder='<ui:i18n key="请输入红包名称(最多十位)"/>' style="width:230px;" >
	  			 	 </div>
	  			 	 <div class="form-label" style="width: 70px;">
	  			 	 		<ui:i18n key="红包详情"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  class="js-search-title w18" id="packetDetail" placeholder='<ui:i18n key="请输入红包详情"/>' value="${map.REMARK }" >
	  			 	 </div>
	  			 </div>
	  			  <div class="control-warp"  >
	  			 	 <div class="form-label" style="width: 70px;">
	  			 		<ui:i18n key="活动期间"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" id="createdDateFrom" class="datepicker calendar" style="width:95px;"  value="${requestScope.map.ACT_DT_BEGIN}" />
						<span class="line"><img src="/admin/images/orders/wave line.png"></span>
						<input type="text" id="createdDateTo" class="datepicker calendar" style="width:95px;" value="${requestScope.map.ACT_DT_END}" />
	  			 	 </div>
	  			 	 <div class="form-label" style="width: 70px;">
	  			 	 		<ui:i18n key="红包金额"/>: 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  class="js-search-title w18" id="packetNum" placeholder='<ui:i18n key="请输入红包金额"/>（<ui:i18n key="单位"/>：<ui:i18n key="元"/>）' value="${map.MONEY_ONE }" >
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp" style="margin-top:10px;" >
	  			 	 <div class="form-label" style="width: 70px;vertical-align: top;">
	  			 		<ui:i18n key="发送对象"/>: 
	  			 		<input type="hidden" value=""  id = "openIdAll"/>
	  			 	 </div>
	  			 	 <div class="form-control" style="position: relative;">
	  			 	 	<span class="title_show">OPENID</span>
	  			 	 	<textarea rows="5" cols="1" class="text_area"></textarea>
	  			 	 </div>
	  			 	 <div class="form-label">
	  			 	 	<input type="button" value='<ui:i18n key="确认导入"/>' class="import_submit"/>
	  			 	 </div>
	  			 </div>   
  			</div>
		</div>
	 
		<div class="js-contents">
			<div class="popup-content-warp">
				<div class="popup-content-item-warp"  style="height: 280px;">
					  <div class="result-grid">
					      	<div class="js-grid-content">
					      		<table class="result-grid-table">
					      		 	<colgroup>
								      		<col width="300px"  />
					      		 			<col width="240px" />
					      		 			<col />
							      		</colgroup>
						      		 <thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th>OPENID</th>
						      		 		<th><ui:i18n key="昵称"/></th>
						      		 		<th><ui:i18n key="关注与否"/></th>
						      		 	</tr>
						      		 </thead>
						      	</table>
					      		<div class="grid-fixed" style="height: 229px;">
							      	<table class="result-grid-table fixed">
							      		<colgroup>
								      		<col width="300px"  />
					      		 			<col width="240px" />
					      		 			<col />
							      		</colgroup>
							      		 <tbody  class="result-grid-tbody">
							      		 	<%-- <c:forEach items="${page.data}" var="item" varStatus="status">
							      		 		<tr>
								      		 		<td>
														<span class="text-ellipsis">${item.PAGE_TYPE_NM }</span>
													</td>
								      		 		<td>
														<span class="text-ellipsis">${item.PAGE_NM }</span>
													</td>
								      		 		<td>${item.URL }</td>
								      		 	</tr>
							      		 	</c:forEach> --%>
							      		 </tbody>
							      	</table>
						      	</div>
					      	
					      	</div>
				      </div>
				</div>
			</div>	 
		</div>
		<span class="import_title"><ui:i18n key="导入结果"/></span>
		<div class="import_result">
			<div>
				<span class="result_title" <c:if test="${currLanguage eq 'ko-KR' }">style="width:95px;"</c:if>><ui:i18n key="上传用户数"/></span>
				<span class="result_num" style="color:#00da1f;" id="importCustNum">0</span>
				<span class="result_suffix">（<ui:i18n key="名"/>）</span>
			</div>
			<div>
				<span class="result_title" <c:if test="${currLanguage eq 'ko-KR' }">style="width:95px;"</c:if>><ui:i18n key="取关用户数"/></span>
				<span class="result_num" style="color:#d1102d;" id="cancelCustNum">0</span>
				<span class="result_suffix">（<ui:i18n key="名"/>）</span>
			</div>
			<div>
				<span class="result_title" <c:if test="${currLanguage eq 'ko-KR' }">style="width:95px;"</c:if>><ui:i18n key="关注用户数"/></span>
				<span class="result_num" style="color:#3473dd;" id ="subscribeCustNum">0</span>
				<span class="result_suffix">（<ui:i18n key="名"/>）</span>
			</div>
			<div>
				<span class="result_title" <c:if test="${currLanguage eq 'ko-KR' }">style="width:95px;"</c:if>><ui:i18n key="预计发送金额"/></span>
				<span class="result_num" style="color:#3473dd;" id="predictMoneyNum">0</span>
				<span class="result_suffix">（<ui:i18n key="元"/>）</span>
			</div>
		</div>
		<div class="submit-div">
			<input type="hidden" value="${requestScope.actId }" id ="actId"/>
			<span class="button bg-red js-trans-order-confirm" 
				<c:choose>
					<c:when test="${requestScope.actId == '' or empty(requestScope.actId) }">data-type="I"</c:when>
					<c:otherwise>data-type="U"</c:otherwise>
				</c:choose>>
				<span class="button-icon conform"></span>
					<ui:i18n key="保存"/>
			</span>
			<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;">
				<span class="button-icon cancel"></span>
					<ui:i18n key="取消"/>
			</span>
		</div>
	</div>
	<!-- ▲ container  -->
	
	<div class="bpopup2" id="poupeTwo">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
	 		 	<h3 class="bpopupTitle js-title"><ui:i18n key="提示信息"/></h3>
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
 		 	    			<div style="width:100%;text-align: center;font-size:14px;margin-bottom:10px;"><ui:i18n key="错误的OPENID"/></div>
				  			 <div class="control-warp" style="width: 100%;text-align: left;max-height:150px;overflow-y:auto;border:1px solid #e5e5e5; " id="showOpenId" >
				  			 </div>
							<div style="width:100%;text-align: center;font-size:14px;margin-top:10px;"><ui:i18n key="以上OPENID不是该公众账号的粉丝"/></div>
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
	
</body>
</html>