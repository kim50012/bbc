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
		<title>${label.提交活动}</title>
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
							<p class="flex1">${label.俱乐部}</p>
							<p class="right-btn club-select active">${amsExcList.HME_CLB_NM}</p>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1">${label.活动类型}</p>
							<p class="right-btn club-select active">${amsExcList.EXC_TP_NM}</p>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1">${label.参与人员}</p>
							<div class="flex1">
								<input class="right" type="tel" id="intAtdcnt" value="${amsExcList.ATD_CNT}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex"  id="updateBIRTHDAY">	
							<p class="flex1">${label.活动日期}</p>
							<p class="right-btn club-select active">${amsExcList.EXC_DATE}</p>
							<input type="hidden" id="datExcfrdt" value="${amsExcList.EXC_DATE}"/>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.活动开始时间}</p>
							<div class="flex1">
								<select class="dropdown" id="datExcfrdttime" dir="rtl" style="color:#666;padding-right: 0;">
									<option>${label.请输入}</option>
									<option value="04:00">04:00</option>
									<option value="04:30">04:30</option>
									<option value="05:00">05:00</option>
									<option value="05:30">05:30</option>
									<option value="06:00">06:00</option>
									<option value="06:30">06:30</option>
									<option value="07:00">07:00</option>
									<option value="07:30">07:30</option>
									<option value="08:00">08:00</option>
									<option value="08:30">08:30</option>
									<option value="09:00">09:00</option>
									<option value="09:30">09:30</option>
									<option value="10:00">10:00</option>
									<option value="10:30">10:30</option>
									<option value="12:00">12:00</option>
									<option value="12:30">12:30</option>
									<option value="13:00">13:00</option>
									<option value="13:30">13:30</option>
									<option value="14:00">14:00</option>
									<option value="14:30">14:30</option>
									<option value="15:00">15:00</option>
									<option value="15:30">15:30</option>
									<option value="16:00">16:00</option>
									<option value="16:30">16:30</option>
									<option value="17:00">17:00</option>
									<option value="17:30">17:30</option>
									<option value="18:00">18:00</option>
									<option value="18:30">18:30</option>
									<option value="19:00">19:00</option>
									<option value="19:30">19:30</option>
									<option value="20:00">20:00</option>
									<option value="20:30">20:30</option>
									<option value="21:00">21:00</option>
									<option value="21:30">21:30</option>
									<option value="22:00">22:00</option>
									<option value="22:30">22:30</option>
									<option value="23:00">23:00</option>
									<option value="23:30">23:30</option>
									<option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.活动结束时间}</p>
							<div class="flex1">
								<select class="dropdown" id="datExctofrtime" dir="rtl" style="color:#666;padding-right: 0;">
									<option>${label.请输入}</option>
									<option value="04:00">04:00</option>
									<option value="04:30">04:30</option>
									<option value="05:00">05:00</option>
									<option value="05:30">05:30</option>
									<option value="06:00">06:00</option>
									<option value="06:30">06:30</option>
									<option value="07:00">07:00</option>
									<option value="07:30">07:30</option>
									<option value="08:00">08:00</option>
									<option value="08:30">08:30</option>
									<option value="09:00">09:00</option>
									<option value="09:30">09:30</option>
									<option value="10:00">10:00</option>
									<option value="10:30">10:30</option>
									<option value="12:00">12:00</option>
									<option value="12:30">12:30</option>
									<option value="13:00">13:00</option>
									<option value="13:30">13:30</option>
									<option value="14:00">14:00</option>
									<option value="14:30">14:30</option>
									<option value="15:00">15:00</option>
									<option value="15:30">15:30</option>
									<option value="16:00">16:00</option>
									<option value="16:30">16:30</option>
									<option value="17:00">17:00</option>
									<option value="17:30">17:30</option>
									<option value="18:00">18:00</option>
									<option value="18:30">18:30</option>
									<option value="19:00">19:00</option>
									<option value="19:30">19:30</option>
									<option value="20:00">20:00</option>
									<option value="20:30">20:30</option>
									<option value="21:00">21:00</option>
									<option value="21:30">21:30</option>
									<option value="22:00">22:00</option>
									<option value="22:30">22:30</option>
									<option value="23:00">23:00</option>
									<option value="23:30">23:30</option>
									<option value="23:59">23:59</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.场地}</p>
							<div class="flex1">
								<input class="right" type="text" id="strExctit" value="${amsExcList.EXC_TIT}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 flex">
							<p class="left-part">${label.内容}</p>
							<div class="flex1">
								<textarea class="textboxcontent" id="strExcdct" placeholder="请输入" style="width:95%;height:1rem;padding:0px;padding-top:0.34rem;padding-bottom:0.14rem;text-align:right;">${amsExcList.EXC_DCT}</textarea>
							</div>
						</div>
						
					</div>
				</div>
				
				<div style="text-align: center;margin-top: 0.8rem;">
					<button class="btn-submit" id="btnsubmitExcReg" onclick="fn_ExcReg();">${label.修改}</button>
				</div>
			</div>
			
		</div>
		<!--俱乐部的弹窗-->

		 <script type="text/javascript">

	  		$(document).ready(function(){
	  			
	  			document.getElementById("datExcfrdttime").value = "${amsExcList.EXC_FR_TIME}";
	  			document.getElementById("datExctofrtime").value = "${amsExcList.EXC_TO_TIME}";
	  			
	  		});
  		
     		function fn_ExcReg() {
     			
     			var intAtdcnt = $('#intAtdcnt').val();
     			var datExcfrdt = $('#datExcfrdt').val();
     			var datExcfrdttime = $('#datExcfrdttime').val();
     			var datExctofrtime = $('#datExctofrtime').val();
     			var strExctit = $('#strExctit').val();
     			var strExcdct = $('#strExcdct').val();
     			var intExcsq = "${intExcsq}";
     			
     			if (datExcfrdttime >= datExctofrtime) {
     				alert("${label.请确认活动时间}");
     				return;
     			}
     			
     			if (strExctit == "") {
     				alert("${label.请输入场地}");
     				return;
     			}
     			
     			if (strExcdct == "") {
     				alert("${label.请输入内容}");
     				return;
     			}
     			
     			var datExctofr = datExcfrdt + " " + datExctofrtime;
     			datExcfrdt = datExcfrdt + " " + datExcfrdttime;
     			
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intExcsq : intExcsq
     			 	 			,intAtdcnt : intAtdcnt
     			 	 			,datExcfrdt : datExcfrdt
     			 	 			,datExctofr : datExctofr
     			 	 			,strExctit : strExctit
     			 	 			,strExcdct : strExcdct
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/exc/msgRegUpdate.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.href="/front/bbc/exc/msgDoList.htm";
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
     		
     		
     	</script>
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		

			
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
		$(function(){ 
			  wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
				    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
				    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
				    signature: "${signInfo.signature }",// 必填，签名，见附录1
				    jsApiList: [//分享接口
				       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
				        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
				                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});  
			  
			  	wx.ready(function(){
			  		
			  		wx.onMenuShareTimeline({
			  		    title: '회원 참여 공지 목록', // 分享标题
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${shareInfo.title}', // 分享标题
			  		    desc: '회원 참여 공지 목록', // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		       // alert('success 11');
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    	// alert('error 11');
			  		    }
			  		});
				});
			  	
			  	
			  	wx.error(function(res){
			  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		
			  	});
			  
		});
	</script>		
		
	</body>
	
</html>
