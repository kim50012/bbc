<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>资料修改</title>
<%@ include file="/front/main/messageTip.jsp"%>
<style type="text/css">
	body{
		background-color: #F5F5F5;
	}
	.divBottom{
		position:absolute;
		bottom:0px;
		border-top:1px solid #eeeeee;
		height:58px;
		width:100%;
		text-align: center;
		background:#eaedf1;
	}
	.divBottom .revise{
		display:inline-block;
		background-color:#f1c102;
		height:36px;
		width:40%;
		min-width:70px;
		color:#ffffff;
		margin-top:13px;
		margin-right:5%;
		line-height:36px;
		text-align:center;
		font-size:13px;
		border-radius:4px;
		cursor: pointer;
	}
	.submitDiv{
		position:fixed; 
		left:0; 
		bottom:0; 
		width:100%; 
		z-index:1; 
		/* text-align:center;  */
		white-space:nowrap; 
		box-sizing:border-box; 
	/* 	padding:10px 50px 10px 10px;  */
		background:#eaedf1;
	}
	.user_info_content.addressComit{
		display:inline-block;  
		white-space:nowrap; 
		text-overflow:ellipsis; 
		overflow:hidden;
		width:90%;
	}
</style>
<script type="text/javascript">
	function modifyCustMessage(){
		var customerId=$("#customerId").val();
		var custName=$("#custName").val();
		var custMobilePhone=$("#custMobilePhone").val();
		if(!custMobilePhone.match(/^\d*$/)){
			alertTip("手机号格式错误");
			return;
		}
		var param={customerId:customerId,custName:custName,custMobilePhone:custMobilePhone};
		$.ajax({
		 	data:param,
			type : "POST",
			url : "/front/customer/modifyCustMessage.htm",   //调用OrderConfirm中的modifyAddress方法，修改此地址信息。
			success : function(data) {
				if(data.ret=="fail"){
					alertTip("修改信息失败");
				}else{
					alertTip("修改信息成功");
					//调用OrderConfirm中的goodsReceipt方法，跳转到goodsReceipt页面。
					window.location.href="/front/customer/myPage.htm";
				}
			},
			error : function(xhr, status, e) {
				alertTip("error: " + status);
			}
		});
	}
	$(function(){
		var widthAll= document.body.clientWidth;
		$(".user_info_content.addressComit").attr("style","width:"+(widthAll-110)+"px");
		$(".addressClick").click(function(){
			window.location.href="/front/customer/goodsReceipt.htm";
		});
	});
</script>
</head>
<body>

	<div class="user_head">
		<div class="headImage">
			<div style="float: left;margin-left: 20px;width: 100px;height: 80px;line-height: 138px;">
				<span>头  像：</span>
			</div>
			<div style="float: right;">
				<a href="#"> 
					<img alt="" src="${customer.WX_IF_HEADIMGURL }" class="head_portrait">
				</a>
			</div>
		</div>
	</div>
	<div class="user_link" style="margin-top: 20px;padding-bottom: 10px;">
		<table style="width: 100%;">
			<tr>
				<td  class="td_title">
					<span class="user_info_span">姓名:</span>
				</td>
				<td class="td_cotent">
					<%-- <span class="user_info_content">${customer.CUST_REAL_NM }</span> --%>
					<input style="font-size:12px; height:30px;width:100%;border-radius:4px;border:1px solid #e5e5e5;" value="${customer.CUST_REAL_NM }" id="custName"/>
					<input type="hidden" id="customerId" value="${customer.CUST_SYS_ID} "/>
				</td>
				<td class="td_right">
				</td>
			</tr>
			<tr>
				<td  class="td_title">
					<span class="user_info_span">电话号码:</span>
				</td>
				<td  class="td_cotent">
					<input style="font-size:12px;height:30px;width:100%;border-radius:4px;border:1px solid #e5e5e5;" value="${customer.MOBILE_NO }" id="custMobilePhone"/>
				</td>
				<td class="td_right">
				</td>
			</tr>
			<tr>
				<td  class="td_title">
					<span class="user_info_span">收货地址:</span>
				</td>
				<td  class="td_cotent addressClick">
					<span class="user_info_content addressComit">
						${customer.PROVINCE_NM }
						${customer.CITY_NM }
						${customer.DISTRICT_NM }
						${customer.ADR_DETAIL }
					</span>
				</td>
				<td class="td_right addressClick">
					<img src="/front/skin/main/img/order/right.png" class="td_right_img"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="user_link" style="margin-top: 20px;padding-bottom: 10px;">
		<table style="width: 100%;">
			<tr>
				<td  class="td_title">
					<span class="user_info_span">用户名:</span>
				</td>
				<td  class="td_cotent">
					<span class="user_info_content">${customer.CUST_NICK_NM }</span>
				</td>
				<td class="td_right">
				</td>
			</tr>
			<%-- <tr>
				<td  class="td_title">
					<span class="user_info_span">收货地址:</span>
				</td>
				<td  class="td_cotent">
					<span class="user_info_content">
						${customer.PROVINCE_NM }
						${customer.CITY_NM }
						${customer.DISTRICT_NM }
						${customer.ADR_DETAIL }
					</span>
				</td>
				<td class="td_right">
					<img src="/front/skin/main/img/order/right.png" class="td_right_img"/>
				</td>
			</tr> --%>
			<tr>
				<td  class="td_title">
					<span class="user_info_span">客户等级:</span>
				</td>
				<td class="td_cotent">
					<span class="user_info_content">${customer.GRADE_NM }</span>
				</td>
				<td class="td_right">
				</td>
			</tr>
			<tr>
				<td  class="td_title">
					<span class="user_info_span">积分:</span>
				</td>
				<td  class="td_cotent">
					<span class="user_info_content">
						<c:choose>
							<c:when test="${customer.POINT==null }">0</c:when>
							<c:otherwise>${customer.POINT }</c:otherwise>
						</c:choose>
					</span>
				</td>
				<td class="td_right">
				</td>
			</tr>
			<tr>
				<td  class="td_title">
					<span class="user_info_span">购买金额:</span>
				</td>
				<td  class="td_cotent">
					<span class="user_info_content">
						<c:choose>
							<c:when test="${customer.PRICE_SUM==null }">0</c:when>
							<c:otherwise>${customer.PRICE_SUM }</c:otherwise>
						</c:choose>元
					</span>
				</td>
				<td class="td_right">
				</td>
			</tr>
		</table>
	</div>
	<div style="height:60px;width:100%;display: inline-block;"></div>
	<div class="bottom_fixed length2" style="width:50px;">
		<a href="/front/main/main2.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image">
		</a>
	</div>
	<div class="submitDiv">
		<div class="divBottom">
			<div class="revise" onclick="history.back();">
				<span>取     消</span> 
			</div>
			<div class="divSubmit" onclick="modifyCustMessage();">
				<span>确     定</span> 
			</div>
		</div>
	</div>
</body>
</html>