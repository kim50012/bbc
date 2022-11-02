<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>${label.设定定期活动}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/check.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/jquery-weui.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		.radio-box label.active:before{
			background-image: url(../img/radio-checked-red.png);
		}
		.right-btn.active:after{
			display: none;
		}
		.right-btn.active{
			color:#666;
		}
		.pop-up-wrap-club{
			border:1px solid red;
		}
		</style>
	</head>
	<body>
		<div class="wrap no-footer">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">参加活动</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
				
				<div class="modules">
					<div class="space1"></div>
					<div class="sub-content">
						<div class="list90 bottom-dashed flex ">
							<p class="flex1 title-icon" style="line-height: 0.9rem;">${amsClb.CLB_NM}</p>
						</div>
						<div class="list90 bottom-dashed flex">
							<div class="flex1" style="text-align:center;">
								${label.星期}
							</div>
							<div class="flex1" style="text-align:center;">
								${label.活动类型}
							</div>
							<div class="flex1" style="text-align:center;">
								${label.场地}
							</div>
							<div class="flex1" style="text-align:center;">
								${label.开始时间}
							</div>
							<div class="flex1" style="text-align:center;">
								${label.结束时间}
							</div>
						</div>
						<div class="list90 flex">
							<p class="flex1" style="text-align:center;">${label.星期一}</p>
							<div class="flex1">
								<select class="dropdown" id="selExctp1" dir="Ltl" style="color:#666;text-align:left;">
									<option value="1001" <c:if test="${amsClbExc.EXC_TP1 == '1001'}">selected</c:if>>${label.定期活动}</option>
									<option value="1002" <c:if test="${amsClbExc.EXC_TP1 == '1002'}">selected</c:if>>${label.非定期活动}</option>
								</select>
							</div>
							<div class="flex1">
								<input class="left" type="text" id="strExcTit1" value="${amsClbExc.EXC_TIT1}" placeholder="${label.请输入}"/>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcFrtme1" dir="rtl" style="color:#666;" onchange="iniTme(1, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcTotme1" dir="rtl" style="color:#666;" onchange="iniTme(1, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						
						<div class="list90 bottom-dashed flex">
							<p class="flex1" style="text-align:center;">${label.星期二}</p>
							<div class="flex1">
								<select class="dropdown" id="selExctp2" dir="Ltl" style="color:#666;text-align:left;">
									<option value="1001" <c:if test="${amsClbExc.EXC_TP2 == '1001'}">selected</c:if>>${label.定期活动}</option>
									<option value="1002" <c:if test="${amsClbExc.EXC_TP2 == '1002'}">selected</c:if>>${label.非定期活动}</option>
								</select>
							</div>
							<div class="flex1">
								<input class="left" type="text" id="strExcTit2" value="${amsClbExc.EXC_TIT2}" placeholder="${label.请输入}"/>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcFrtme2" dir="rtl" style="color:#666;" onchange="iniTme(2, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcTotme2" dir="rtl" style="color:#666;" onchange="iniTme(2, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1" style="text-align:center;">${label.星期三}</p>
							<div class="flex1">
								<select class="dropdown" id="selExctp3" dir="Ltl" style="color:#666;text-align:left;">
									<option value="1001" <c:if test="${amsClbExc.EXC_TP3 == '1001'}">selected</c:if>>${label.定期活动}</option>
									<option value="1002" <c:if test="${amsClbExc.EXC_TP3 == '1002'}">selected</c:if>>${label.非定期活动}</option>
								</select>
							</div>
							<div class="flex1">
								<input class="left" type="text" id="strExcTit3" value="${amsClbExc.EXC_TIT3}" placeholder="${label.请输入}"/>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcFrtme3" dir="rtl" style="color:#666;" onchange="iniTme(3, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcTotme3" dir="rtl" style="color:#666;" onchange="iniTme(3, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1" style="text-align:center;">${label.星期四}</p>
							<div class="flex1">
								<select class="dropdown" id="selExctp4" dir="Ltl" style="color:#666;text-align:left;">
									<option value="1001" <c:if test="${amsClbExc.EXC_TP4 == '1001'}">selected</c:if>>${label.定期活动}</option>
									<option value="1002" <c:if test="${amsClbExc.EXC_TP4 == '1002'}">selected</c:if>>${label.非定期活动}</option>
								</select>
							</div>
							<div class="flex1">
								<input class="left" type="text" id="strExcTit4" value="${amsClbExc.EXC_TIT4}" placeholder="${label.请输入}"/>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcFrtme4" dir="rtl" style="color:#666;" onchange="iniTme(4, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcTotme4" dir="rtl" style="color:#666;" onchange="iniTme(4, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1" style="text-align:center;">${label.星期五}</p>
							<div class="flex1">
								<select class="dropdown" id="selExctp5" dir="Ltl" style="color:#666;text-align:left;">
									<option value="1001" <c:if test="${amsClbExc.EXC_TP5 == '1001'}">selected</c:if>>${label.定期活动}</option>
									<option value="1002" <c:if test="${amsClbExc.EXC_TP5 == '1002'}">selected</c:if>>${label.非定期活动}</option>
								</select>
							</div>
							<div class="flex1">
								<input class="left" type="text" id="strExcTit5" value="${amsClbExc.EXC_TIT5}" placeholder="${label.请输入}"/>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcFrtme5" dir="rtl" style="color:#666;" onchange="iniTme(5, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcTotme5" dir="rtl" style="color:#666;" onchange="iniTme(5, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1" style="text-align:center;">${label.星期六}</p>
							<div class="flex1">
								<select class="dropdown" id="selExctp6" dir="Ltl" style="color:#666;text-align:left;">
									<option value="1001" <c:if test="${amsClbExc.EXC_TP6 == '1001'}">selected</c:if>>${label.定期活动}</option>
									<option value="1002" <c:if test="${amsClbExc.EXC_TP6 == '1002'}">selected</c:if>>${label.非定期活动}</option>
								</select>
							</div>
							<div class="flex1">
								<input class="left" type="text" id="strExcTit6" value="${amsClbExc.EXC_TIT6}" placeholder="${label.请输入}"/>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcFrtme6" dir="rtl" style="color:#666;" onchange="iniTme(6, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcTotme6" dir="rtl" style="color:#666;" onchange="iniTme(6, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1" style="text-align:center;">${label.星期日}</p>
							<div class="flex1">
								<select class="dropdown" id="selExctp7" dir="Ltl" style="color:#666;text-align:left;">
									<option value="1001" <c:if test="${amsClbExc.EXC_TP7 == '1001'}">selected</c:if>>${label.定期活动}</option>
									<option value="1002" <c:if test="${amsClbExc.EXC_TP7 == '1002'}">selected</c:if>>${label.非定期活动}</option>
								</select>
							</div>
							<div class="flex1">
								<input class="left" type="text" id="strExcTit7" value="${amsClbExc.EXC_TIT7}" placeholder="${label.请输入}"/>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcFrtme7" dir="rtl" style="color:#666;" onchange="iniTme(7, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
							<div class="flex1">
								<select class="dropdown" id="strExcTotme7" dir="rtl" style="color:#666;" onchange="iniTme(7, this.value);">
									<option value="">${label.无}</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option>
									<option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option><option value="07:00">07:00</option>
									<option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option>
									<option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="12:00">12:00</option>
									<option value="12:30">12:30</option><option value="13:00">13:00</option><option value="13:30">13:30</option><option value="14:00">14:00</option>
									<option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option>
									<option value="16:30">16:30</option><option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									<option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option>
									<option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option>
									<option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part" style="text-align:center;width: 1.5rem;">${label.定期活动}${label.内容}</p>
							<div class="flex1">
								<textarea class="textboxcontent" id="strExcdct" placeholder="请输入" style="width:95%;height:1rem;padding:0px;padding-top:0.34rem;padding-bottom:0.14rem;">${amsClbExc.EXC_DCT1}</textarea>
							</div>
						</div>
						<div class="list90 flex">
							<p class="left-part" style="text-align:center;width: 1.5rem;">${label.非定期活动}${label.内容}</p>
							<div class="flex1">
								<textarea class="textboxcontent" id="strExcdct0" placeholder="请输入" style="width:95%;height:1rem;padding:0px;padding-top:0.34rem;padding-bottom:0.14rem;">${amsClbExc.EXC_DCT2}</textarea>
							</div>
						</div>
						
					</div>
				</div>
				
				<div style="text-align: center;margin-top: 0.4rem;">
					<button class="btn-submit" id="btnsubmitExcReg" onclick="fn_ExcReg();">${label.保存}</button>
				</div>
			</div>
			
		</div>
		<!--俱乐部的弹窗-->

		 <script type="text/javascript">
		 
		 	function iniTme(num, val) {
		 		if (val == '${label.无}') {
		 			$("#excFrtme"+num).val('${label.无}');
		 			$("#excTotme"+num).val('${label.无}');
		 		}
		 	}
		 
     		function fn_ExcReg() {
     			
     			var intClbsq = "${amsClb.CLB_SQ}";
     			var strExcTit1 = $('#strExcTit1').val();
     			var strExcTit2 = $('#strExcTit2').val();
     			var strExcTit3 = $('#strExcTit3').val();
     			var strExcTit4 = $('#strExcTit4').val();
     			var strExcTit5 = $('#strExcTit5').val();
     			var strExcTit6 = $('#strExcTit6').val();
     			var strExcTit7 = $('#strExcTit7').val();

     			var strExcFrtme1 = $('#strExcFrtme1').val();
     			var strExcFrtme2 = $('#strExcFrtme2').val();
     			var strExcFrtme3 = $('#strExcFrtme3').val();
     			var strExcFrtme4 = $('#strExcFrtme4').val();
     			var strExcFrtme5 = $('#strExcFrtme5').val();
     			var strExcFrtme6 = $('#strExcFrtme6').val();
     			var strExcFrtme7 = $('#strExcFrtme7').val();

     			var strExcTotme1 = $('#strExcTotme1').val();
     			var strExcTotme2 = $('#strExcTotme2').val();
     			var strExcTotme3 = $('#strExcTotme3').val();
     			var strExcTotme4 = $('#strExcTotme4').val();
     			var strExcTotme5 = $('#strExcTotme5').val();
     			var strExcTotme6 = $('#strExcTotme6').val();
     			var strExcTotme7 = $('#strExcTotme7').val();

     			var selExctp1 = $('#selExctp1').val();
     			var selExctp2 = $('#selExctp2').val();
     			var selExctp3 = $('#selExctp3').val();
     			var selExctp4 = $('#selExctp4').val();
     			var selExctp5 = $('#selExctp5').val();
     			var selExctp6 = $('#selExctp6').val();
     			var selExctp7 = $('#selExctp7').val();
     			
     			var strExcdct = $('#strExcdct').val();
     			var strExcdct0 = $('#strExcdct0').val();

     			var strExcdct1 = "";
     			var strExcdct2 = "";
     			var strExcdct3 = "";
     			var strExcdct4 = "";
     			var strExcdct5 = "";
     			var strExcdct6 = "";
     			var strExcdct7 = "";
     			
     			if (strExcTit1 != "") {
         			if (strExcFrtme1 > strExcTotme1) {
         				alert("${label.请确认活动时间}");
         				$('#strExcFrtme1').focus();
         				return;
         			}
     			}
     			
     			if (strExcdct == "") {
     				alert("${label.请输入内容}");
     				return;
     			}

     			if (selExctp1 == "1001") {strExcdct1 = strExcdct;} else {strExcdct1 = strExcdct0;}
     			if (selExctp2 == "1001") {strExcdct2 = strExcdct;} else {strExcdct2 = strExcdct0;}
     			if (selExctp3 == "1001") {strExcdct3 = strExcdct;} else {strExcdct3 = strExcdct0;}
     			if (selExctp4 == "1001") {strExcdct4 = strExcdct;} else {strExcdct4 = strExcdct0;}
     			if (selExctp5 == "1001") {strExcdct5 = strExcdct;} else {strExcdct5 = strExcdct0;}
     			if (selExctp6 == "1001") {strExcdct6 = strExcdct;} else {strExcdct6 = strExcdct0;}
     			if (selExctp7 == "1001") {strExcdct7 = strExcdct;} else {strExcdct7 = strExcdct0;}
     			
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 			,strExcTit1 : strExcTit1
     			 	 			,strExcTit2 : strExcTit2
     			 	 			,strExcTit3 : strExcTit3
     			 	 			,strExcTit4 : strExcTit4
     			 	 			,strExcTit5 : strExcTit5
     			 	 			,strExcTit6 : strExcTit6
     			 	 			,strExcTit7 : strExcTit7
     			 	 			,strExcFrtme1 : strExcFrtme1
     			 	 			,strExcFrtme2 : strExcFrtme2
     			 	 			,strExcFrtme3 : strExcFrtme3
     			 	 			,strExcFrtme4 : strExcFrtme4
     			 	 			,strExcFrtme5 : strExcFrtme5
     			 	 			,strExcFrtme6 : strExcFrtme6
     			 	 			,strExcFrtme7 : strExcFrtme7
     			 	 			,strExcTotme1 : strExcTotme1
     			 	 			,strExcTotme2 : strExcTotme2
     			 	 			,strExcTotme3 : strExcTotme3
     			 	 			,strExcTotme4 : strExcTotme4
     			 	 			,strExcTotme5 : strExcTotme5
     			 	 			,strExcTotme6 : strExcTotme6
     			 	 			,strExcTotme7 : strExcTotme7
     			 	 			,strExcdct : strExcdct
     			 	 			,strExcdct1 : strExcdct1
     			 	 			,strExcdct2 : strExcdct2
     			 	 			,strExcdct3 : strExcdct3
     			 	 			,strExcdct4 : strExcdct4
     			 	 			,strExcdct5 : strExcdct5
     			 	 			,strExcdct6 : strExcdct6
     			 	 			,strExcdct7 : strExcdct7
     			 	 			,strExctp1 : selExctp1
     			 	 			,strExctp2 : selExctp2
     			 	 			,strExctp3 : selExctp3
     			 	 			,strExctp4 : selExctp4
     			 	 			,strExctp5 : selExctp5
     			 	 			,strExctp6 : selExctp6
     			 	 			,strExctp7 : selExctp7
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/clb/clbExcRegSave.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.href="/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClb.CLB_SQ}";
     						}else{
     							loadingHide();
     		     				alert("${label.失败了}");
     						}
     						
     					},
     					error : function(xhr, status, e) {
     						loadingHide();
     						alert("Error : " + status);
     					}
     				});
     		}

     		$(document).ready(function(){

     			document.getElementById("strExcFrtme1").value = "${amsClbExc.EXC_FR_TME1}";
     			document.getElementById("strExcFrtme2").value = "${amsClbExc.EXC_FR_TME2}";
     			document.getElementById("strExcFrtme3").value = "${amsClbExc.EXC_FR_TME3}";
     			document.getElementById("strExcFrtme4").value = "${amsClbExc.EXC_FR_TME4}";
     			document.getElementById("strExcFrtme5").value = "${amsClbExc.EXC_FR_TME5}";
     			document.getElementById("strExcFrtme6").value = "${amsClbExc.EXC_FR_TME6}";
     			document.getElementById("strExcFrtme7").value = "${amsClbExc.EXC_FR_TME7}";

     			document.getElementById("strExcTotme1").value = "${amsClbExc.EXC_TO_TME1}";
     			document.getElementById("strExcTotme2").value = "${amsClbExc.EXC_TO_TME2}";
     			document.getElementById("strExcTotme3").value = "${amsClbExc.EXC_TO_TME3}";
     			document.getElementById("strExcTotme4").value = "${amsClbExc.EXC_TO_TME4}";
     			document.getElementById("strExcTotme5").value = "${amsClbExc.EXC_TO_TME5}";
     			document.getElementById("strExcTotme6").value = "${amsClbExc.EXC_TO_TME6}";
     			document.getElementById("strExcTotme7").value = "${amsClbExc.EXC_TO_TME7}";
     			
     		});
     		
     	</script>
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
		
	</body>
	
</html>
