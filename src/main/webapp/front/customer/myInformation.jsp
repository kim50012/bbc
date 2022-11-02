<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>我的资料</title>
<style type="text/css">
	body{
		background-color: #F5F5F5;
	}
</style>
<script type="text/javascript">

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
					<span class="user_info_content">${customer.CUST_REAL_NM }</span>
				</td>
				<td class="td_right">
				</td>
			</tr>
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
			<tr>
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
			</tr>
		</table>
	</div>
	<div class="user_link" style="margin-top: 20px;padding-bottom: 10px;">
		<table style="width: 100%;">
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
	<div class="bottom_fixed length2">
		<a href="/front/main/main2.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image">
		</a>
	</div>