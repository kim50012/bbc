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
							<p class="right-btn club-select">${label.请选择}</p>
							<input type="hidden" id="intClbsq" />
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1">${label.活动类型}</p>
							<div class="radio-box flex1 cen">
								<label for="r1"><input type="radio" name="strExctp"  id="r1" value="1001" />${label.定期活动}</label>
							</div>
							<div class="radio-box flex1 right">
								<label for="r2"><input type="radio"  name="strExctp"  id="r2" value="1002" />${label.非定期活动}</label>
							</div>
							<div class="radio-box flex1 right">
								<label for="r3"><input type="radio"  name="strExctp"  id="r3" value="1003" />${label.友谊赛}</label>
							</div>
							<div class="radio-box flex1 right">
								<label for="r4"><input type="radio"  name="strExctp"  id="r4" value="1004" />${label.聚会}</label>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1">${label.参与人员}</p>
							<div class="flex1">
								<input class="right" type="tel" id="intAtdcnt" value="" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex"  id="updateBIRTHDAY">	
							<p class="flex1">${label.活动日期}</p>
							<label for="datExcfrdt" style="position: relative;">
								<input style="color:#666;" class="right weui-input" id="datExcfrdt" type="text" value="" >
								<p class="right-btn" style="position: absolute;height: 100%;top: 0;right:0;">${label.请选择}</p>
							</label>
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
									<option value="11:00">11:00</option>
									<option value="11:30">11:30</option>
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
									<option value="11:00">11:00</option>
									<option value="11:30">11:30</option>
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
								<input class="right" type="text" id="strExctit" value="" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 flex">
							<p class="left-part">${label.内容}</p>
							<div class="flex1">
<%-- 								<input class="right" type="text" id="strExcdct" value="" placeholder="${label.请输入}"/> --%>
								<textarea class="textboxcontent" id="strExcdct" placeholder="请输入" style="width:95%;height:1.5rem;padding:0px;padding-top:0.34rem;padding-bottom:0.14rem;text-align:right;"></textarea>
							</div>
						</div>
						
					</div>
				</div>
				
				<div style="text-align: center;margin-top: 0.5rem;">
					<button class="btn-submit" id="btnsubmitExcReg" onclick="fn_ExcReg();">${label.提交}</button>
				</div>
				<div style="text-align: center;margin-top: 0.2rem;">
					<button class="btn-submit" id="btnsubmitExcReg" onclick="window.location='/front/bbc/exc/excDoList.htm';" style="background-color: #c0c0c0;">${label.取消}</button>
				</div>
			</div>
			
		</div>
		<!--俱乐部的弹窗-->

		<div class="pop-up-wrap pop-up-wrap-club" style="display:none;">
						<ul class="pop-up-content" style="overflow:auto;">
						
						
							<!-- START Data Loop -->
							<c:forEach var="amsClbList" items="${amsClbList}" varStatus="status">  
								<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
									<div class="float" style="width:4rem;height:0.6rem;">
										<p>${amsClbList.CLB_NM}</p>
									</div>
									<div class="radio-box " style="padding-top:0.18rem;">
											<label for="r1-${status.count}" class="float1"><input  type="radio" name="activityType1" id="r1-${status.count}" data-clbnm="${amsClbList.CLB_NM}" value="${amsClbList.CLB_SQ}" /></label>
									</div>
								</li>
							 </c:forEach>
							<!-- END Data Loop -->
							
							
						</ul>
		</div>



		<!--参与人员弹窗-->

<!-- 		<div class="pop-up-wrap pop-up-wrap-number" style="display:none;"> -->
<!-- 						<ul class="pop-up-content" style="overflow:auto;"> -->
<!-- 							<li class="level-1" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;"> -->
<!-- 								<div class="float" style="width:4rem;height:0.6rem;"> -->
<!-- 									<p>金在中</p> -->
<!-- 								</div> -->
<!-- 								<div class="radio-box " style="padding-top:0.18rem;"> -->
<!-- 										<label for="r5" class="float1"><input  type="radio" name="activityType" id="r5" value="金在中" /></label> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 							<li class="level-1" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;"> -->
<!-- 								<div class="float" style="width:4rem;height:0.6rem;"> -->
<!-- 									<p>张嘉佳</p> -->
<!-- 								</div> -->
<!-- 								<div class="radio-box " style="padding-top:0.18rem;"> -->
<!-- 										<label for="r6" class="float1"><input  type="radio" name="activityType" id="r6" value="张嘉佳" /></label> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 							<li class="level-1" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;"> -->
<!-- 								<div class="float" style="width:4rem;height:0.6rem;"> -->
<!-- 									<p>黄庭观</p> -->
<!-- 								</div> -->
<!-- 								<div class="radio-box " style="padding-top:0.18rem;"> -->
<!-- 										<label for="r7" class="float1"><input  type="radio" name="activityType" id="r7" value="黄庭观" /></label> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 						<div class="buttons"> -->
<%-- 							<span class="cancel">${label.不公开}</span> --%>
<%-- 							<span>${label.公开}</span> --%>
<!-- 						</div> -->
<!-- 		</div> -->

		 <script type="text/javascript">
     		$(function(){
     		 	$("#datExcfrdt").calendar({
			        onChange: function (p, values, displayValues) {
	
			          $("#datExcfrdt").siblings("p").hide()
			        }
		      	})
     		 	$(".club-select").on("click",function(){
     		 		$(".pop-up-wrap-club").show()
//      		 		$(".pop-up-wrap-club input[type='radio']").change(function(){
// 						if ($("input[type='radio']").is(':checked')) {
// 							$(".radio-box").removeClass("checked");
// 					        $(this).parents(".radio-box").addClass("checked");
// 					   }
// 					    $(".club-select").html($(this).data("clbnm"));
// 					    $("#intClbsq").val($(this).val());
// 					    $(".pop-up-wrap-club").hide();
// 					    $(".club-select").addClass("active");
// 					});
     		 		

     		 		$(".pop-up-wrap-club input[type='radio']").change(function(){
						if ($(":radio[name='strExctp']").is(':checked')) {
							$(".radio-box").removeClass("checked");
					        $(this).parents(".radio-box").addClass("checked");
					   }
						if ($(":radio[name='activityType1']").is(':checked')) {
							$(".radio-box").removeClass("checked");
					        $(this).parents(".radio-box").addClass("checked");
					   }
					    $(".club-select").html($(this).data("clbnm"));
					    $("#intClbsq").val($(this).val());
					    $(".pop-up-wrap-club").hide();
					    $(".club-select").addClass("active");
					});     		 		
     		 		
     		 		$(".pop-up-wrap-club input[type='radio']").click(function(){
					    $(".pop-up-wrap-club").hide();
					});
     		 	})
     		 	
// 				$(".level-select").on("click",function(){
//      		 		$(".pop-up-wrap-number").show()
//      		 		$(".pop-up-wrap-number input[type='radio']").change(function(){
// 						if ($("input[type='radio']").is(':checked')) {
// 							$(".radio-box").removeClass("checked");
// 					        $(this).parents(".radio-box").addClass("checked");
// 					   }
// 						console.log($(".level-select").html());
// 					    $(".level-select").html($(this).val());
// 					    $(".pop-up-wrap-number").hide();
// 					    $(".level-select").addClass("active");
// 					})
//      		 	})

			});
			
     		function fn_ExcReg() {
     			
     			var strExctp = $(':radio[name="strExctp"]:checked').val();
     			var intClbsq = $('#intClbsq').val();
     			var intAtdcnt = $('#intAtdcnt').val();
     			var datExcfrdt = $('#datExcfrdt').val();
     			var datExcfrdttime = $('#datExcfrdttime').val();
     			var datExctofrtime = $('#datExctofrtime').val();
     			var strExctit = $('#strExctit').val();
     			var strExcdct = $('#strExcdct').val();
     			
     			if (intClbsq == "") {
     				alert("${label.请选择俱乐部}");
     				return;
     			}
     			
     			if (strExctp == "" || strExctp == null || strExctp == "undefined") {
     				alert("${label.请选择活动类型}");
     				return;
     			}

     			if (intAtdcnt == "" || intAtdcnt == "0") {
     				if (strExctp == "1002") {
	     				alert("${label.请输入参与人员}");
	     				return;
     				}
     			}
     			
     			if (datExcfrdt == "") {
     				alert("${label.请输入加入日期}");
     				return;
     			}
     			
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
     			 	 			strExctp : strExctp
     			 	 			,intClbsq : intClbsq
     			 	 			,intAtdcnt : intAtdcnt
     			 	 			,datExcfrdt : datExcfrdt
     			 	 			,datExctofr : datExctofr
     			 	 			,strExctit : strExctit
     			 	 			,strExcdct : strExcdct
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/exc/excRegSave.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.href="/front/bbc/exc/excDoList.htm";
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
		

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
				
		
	</body>
	
</html>
