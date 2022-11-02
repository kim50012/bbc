<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退款/退货</title>
<%@ include file="/front/main/messageTip.jsp"%>
<style type="text/css">
body{
	background:#FAFAFA;
  	width:100%;  
}
.containt{
	background: #fff;
	padding-top: 20px;
	padding-bottom: 20px;
	box-shadow:1px 1px 1px #D0D0D0; 
}
table{
	width: 90%;
	margin: auto;
	
}
td{
 	margin-bottom: 3px; 
 	padding-top: 3px; 
	height: 25px;
	line-height: 25px;
}
select,textarea{
	width: 99%;
	font-size: 15px;
	font-family: "微软雅黑";
}

</style>
<script type="text/javascript">
	$(function(){
		$("#confirm").click(function(){
			if($.trim($("#custRequestDesc").val())==''){
				alertTip("请输入内容");
				return false;
			}
			var params = {
					custReturnRequestType:$.trim($("#custReturnRequestType").val()),
					custReturnReasonType:$.trim($("#custReturnReasonType").val()),
					custRequestDesc:$.trim($("#custRequestDesc").val()),
					orderId:'${orderId }',
					goodsId:'${goodsId }',
					displayId:'${displayId }',
				};
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/order/custReturnInsert.htm",
				success: function(data){ 
					if(data.status == "S") {
						alertTip("");
					} else {
						alertTip("");
						return false;
					}
				},
				error: function(a, msg, c){
					alertTip("error: " + msg);
				}
			});
		});
	});
</script>
</head>
<body> 
	<div class="containt">
		<table>
			<tr>
				<td>
					<span class="getMessage">
						顾客要求类型：
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<select id="custReturnRequestType">
						<option value="1">退换</option>
						<option value="2">退款</option>
						<option value="3">部分退款</option>
						<option value="4">其他</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="height: 4px;">
				</td>
			</tr>
			<tr>
				<td>
					<span class="getMessage">
						退款原因(此项必填)：
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<select id="custReturnReasonType">
						<option value="1">收到商品破损</option>
						<option value="2">商品错发/漏发</option>
						<option value="3">商品需要维修</option>
						<option value="4">收到商品与描述不符</option>
						<option value="5">商品质量问题</option>
						<option value="6">未收到货</option>
						<option value="7">未按约顶时间发货</option>
						<option value="8">收到假货</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="height: 4px;">
				</td>
			</tr>
			<tr>
				<td>
					<span class="getMessage" >
						顾客要求内容：
					</span>
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="" cols="" style="height: 100px;" id="custRequestDesc"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="bottom_fixed length2" style="box-shadow:-1px -1px 1px #D0D0D0;">
		<div class="button" >
			<a class="btn1 footer_cart" id="cancel" style="margin-top: 5px;margin-bottom: 5px;">取消</a>
			<a class="btn1 footer_bought" id="confirm" style="margin-top: 5px;margin-bottom: 5px;">确认</a>
		</div>
	</div>
</body>
</html>