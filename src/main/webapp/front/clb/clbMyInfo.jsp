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
		<title>${label.会员信息}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
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
		</style>
	</head>
	<body>
		<div class="wrap no-footer">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">修改会员信息</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
				
				<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
						<div class="flex">
								<p class="flex1 title-icon">기본정보</p>
						</div>
				</div>
				<div class="modules" style="margin-top: 0;">
					
					<div class="sub-content">
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.俱乐部名}</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="" value="${amsClb.CLB_NM}" placeholder="${label.请输入}" readonly="readonly"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">ID</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="" value="${amsClbMbr.MBR_SQ}" placeholder="${label.请输入}" readonly="readonly"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex"  id="updateBIRTHDAY">	
							<p class="flex1">${label.加入日期}</p>
							<div class="flex1">
								<input  class="right" type="text" name="" id="" value="${amsClbMbr.CLB_JIN_DT}" readonly="readonly"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1">${label.自动搜索}Keyword</p>
							<div class="flex1">
								<input  class="right" type="text" name="" id="" value="${amsClbMbr.CLB_NIK_KEYWORD}" readonly="readonly"/>
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
						<div class="flex">
								<p class="flex1 title-icon">수정 가능한 정보</p>
						</div>
				</div>
				<div class="modules" style="margin-top: 0;">
				
					<div class="sub-content">
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.姓名}</p>
							<div class="flex1">
								<input class="right" type="text" name="strClbniknm" id="strClbniknm" value="${amsClbMbr.CLB_NIK_NM}" placeholder="${label.请输入}" />
							</div>
						</div>
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">회원 참여 알림</p>
							<div class="flex1">
								<select class="dropdown" id="strClbgd" dir="rtl" style="color:#666;padding-right: 0;">
									<option value="Y">알림</option>
									<option value="N">해제</option>
								</select>
							</div>
						</div>
						
					</div>
				</div>
				<!--
				<div class="modules">
					<div class="sub-content">
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.初期}BB Coin</p>
							<div class="flex1">
								<input class="right" type="number" name="intJinclbbbc" id="intJinclbbbc" value="${amsClbMbr.JIN_CLB_BBC}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">BB Coin</p>
							<div class="flex1">
								<input class="right" type="number" name="intClbbbc" id="intClbbbc" value="${amsClbMbr.CLB_BBC}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 flex">
								<p class="flex1">${label.会员等级}</p>
								<p class="right-btn level-select">${amsClbMbr.CLB_GD_NM}</p>
								<input type="hidden" name="strClbgd" id="strClbgd" value="${amsClbMbr.CLB_GD}"/>
						</div>
					</div>
				</div>
				-->
				<div style="text-align: center;margin-top: 0.8rem;">
					<button class="btn-submit" onclick="fn_ClbMbrModify();">${label.保存}</button>
				</div>
				<div style="text-align: center;margin-top: 0.2rem;">
					<button class="btn-submit" onclick="history.back();" style="background: #555555;">${label.取消}</button>
				</div>
			</div>
		</div>
		<!--会员等级的弹窗-->

		<div class="pop-up-wrap" style="display:none;">
			<ul class="pop-up-content" style="overflow:auto;">
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>${label.管理员}</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdA" class="float1"><input  type="radio" name="strClbga" id="strClbgdA" data-clbgdnm="${label.管理员}" value="A" /></label>
					</div>
				</li>
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>${label.普通管理员}</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdB" class="float1"><input  type="radio" name="strClbgd" id="strClbgdB" data-clbgdnm="${label.普通管理员}" value="B" /></label>
					</div>
				</li>
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>${label.普通会员}</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdC" class="float1"><input  type="radio" name="strClbgd" id="strClbgdC" data-clbgdnm="${label.普通会员}" value="C" /></label>
					</div>
				</li>
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>${label.访客}</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdD" class="float1"><input  type="radio" name="strClbgd" id="strClbgdD" data-clbgdnm="${label.访客}" value="D" /></label>
					</div>
				</li>
			</ul>
		</div>

		 <script type="text/javascript">

	  		$(document).ready(function(){
	  			
	  			document.getElementById("strClbgd").value = "${amsClbMbr.ALERT}";
	  			
	  		});

     		$(function(){
     		 	$("#time").calendar({
			        onChange: function (p, values, displayValues) {
			        	$("#time").siblings("p").hide()
			        }
		      	})
     		 	$(".level-select").on("click",function(){
     		 		$(".pop-up-wrap").show()
     		 	})
				$("input[type='radio']").change(function(){
					if ($("input[type='radio']").is(':checked')) {
						$(".radio-box").removeClass("checked");
				        $(this).parents(".radio-box").addClass("checked");
				   }
				    //$(".level-select").html($(this).val())
				    $(".level-select").html($(this).data("clbgdnm"));
				    $("#strClbgd").val($(this).val());
				    $(".pop-up-wrap").hide();
				    $(".level-select").addClass("active");
				})
					
			});
     		

			
     		function fn_ClbMbrModify() {

     			var intClbsq = "${amsClb.CLB_SQ}";
     			var intMbrsq = "${intMbrsq}";
     			var strClbniknm = $('#strClbniknm').val();
     			var strClbgd = $('#strClbgd').val();
     			

     			if (strClbniknm == "") {
     				alert("${label.请输入}${label.姓名}");
     				return;
     			}
     			
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 			,strClbniknm : strClbniknm
     			 	 			,intMbrsq : intMbrsq
     			 	 			,strClbgd : strClbgd
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/clb/clbMyModify.htm",
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
