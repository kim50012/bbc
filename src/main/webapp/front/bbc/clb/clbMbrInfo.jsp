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
				
				<div class="modules">
					
					<div class="sub-content">
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.俱乐部名}</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="" value="${amsClb.CLB_NM}" placeholder="${label.请输入}" readonly="readonly"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.姓名}</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="" value="${amsClbMbr.CLB_NIK_NM}" placeholder="${label.请输入}" readonly="readonly"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">ID</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="" value="${amsClbMbr.MBR_SQ}" placeholder="${label.请输入}" readonly="readonly"/>
							</div>
						</div>
<!-- 						<div class="list90 bottom-dashed flex"> -->
<!-- 							<p class="left-part">${label.密码}</p> -->
<!-- 							<div class="flex1"> -->
<%-- 								<input class="right" type="password" name="" id="" value="" placeholder="${label.请输入}"/> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="list90 bottom-dashed flex"> -->
<%-- 							<p class="left-part">${label.手机号码}</p> --%>
<!-- 							<div class="flex1"> -->
<%-- 								<input class="right" type="text" name="" id="" value="${amsClbMbr.CLB_NIK_NM}" placeholder="${label.请输入}" readonly="readonly"/> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="list90 flex"> -->
<%-- 							<p class="left-part">${label.问候语}</p> --%>
<!-- 							<div class="flex1"> -->
<%-- 								<input  class="right moretext" type="textarea" name="" id="" value="" placeholder="${label.请输入}" readonly="readonly"/> --%>
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="list90 bottom-dashed flex"  id="updateBIRTHDAY">	
							<p class="flex1">${label.加入日期}</p>
<!-- 							<label for="time" style="position: relative;"> -->
<!-- 								<input style="color:#666;" class="right weui-input" id="time" type="text" value="" > -->
<%-- 								<p class="right-btn" style="position: absolute;height: 100%;top: 0;right:0;">${amsClbMbr.CLB_JIN_DT}</p> --%>
<!-- 							</label> -->
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
				<div class="modules">
					<div class="sub-content">
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.姓名}</p>
							<div class="flex1">
								<input class="right" type="text" name="strClbniknm" id="strClbniknm" value="${amsClbMbr.CLB_NIK_NM}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">Level</p>
							<div class="flex1">
								<select class="dropdown" id="strBmtgd" dir="rtl" style="color:#666;padding-right: 0.24rem;" placeholder="${label.请输入}">
									<option value="A">A ${label.组}</option>
									<option value="B">B ${label.组}</option>
									<option value="C">C ${label.组}</option>
									<option value="D">D ${label.组}</option>
									<option value="E">E ${label.组}</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">성별</p>
							<div class="flex1">
								<select class="dropdown" id="strGnddv" dir="rtl" style="color:#666;padding-right: 0.24rem;" placeholder="${label.请输入}">
									<option value="MALE">남성</option>
									<option value="FEMA">여성</option>
								</select>
							</div>
						</div>
						
						<c:set var="varDisplay" value="initial" />
						
						<c:if test="${amsClb.CLB_SQ == 11}">
							<c:set var="varDisplay" value="none" />
						</c:if>
						<div class="list90 bottom-dashed flex" style="display:${varDisplay};">
							<p class="left-part">${label.初期}BB Coin</p>
							<div class="flex1">
								<input class="right" type="number" name="intJinclbbbc" id="intJinclbbbc" value="${amsClbMbr.JIN_CLB_BBC}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex" style="display:${varDisplay};">
							<p class="left-part">BB Coin</p>
							<div class="flex1">
								<input class="right" type="number" name="intClbbbc" id="intClbbbc" value="${amsClbMbr.CLB_BBC}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex" style="display:${varDisplay};">
							<p class="left-part">생일</p>
							<div class="flex1">
								<input class="right" type="text" name="strClBthdt" id="strClBthdt" value="${amsClbMbr.BTH_DT}" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex" style="display:${varDisplay};">
							<p class="left-part">양력/음력</p>
							<div class="flex1">
								<select class="dropdown" id="strClBthdttp" dir="rtl" style="color:#666;padding-right: 0.24rem;" placeholder="${label.请输入}">
									<option value="0">양력</option>
									<option value="1">음력</option>
								</select>
							</div>
						</div>
						
						<c:if test="${amsClb.CLB_SQ == 11}">
						<div class="list90 bottom-dashed flex">
							<p class="left-part">클럽</p>
							<div class="flex1">
								<select class="dropdown" id="selClb" dir="rtl" style="color:#666;padding-right: 0.24rem;" placeholder="${label.请输入}">
									<option value="">ALL</option>
									<option value="1">BBC</option>
									<option value="2">WJBC</option>
									<option value="3">BSC</option>
									<option value="4">BWC</option>
									<option value="6">HBC</option>
									<option value="8">SBBC</option>
								</select>
							</div>
						</div>
						</c:if>
						

						<div class="list90 flex">
								<p class="flex1">${label.会员等级}</p>
								<p class="right-btn level-select">${amsClbMbr.CLB_GD_NM}</p>
								<input type="hidden" name="strClbgd" id="strClbgd" value="${amsClbMbr.CLB_GD}"/>
						</div>
					</div>
				</div>
				<div style="text-align: center;margin-top: 0.8rem;">
					<button class="btn-submit" onclick="fn_ClbMbrModify();">${label.保存}</button>
				</div>
				<c:if test="${amsClb.CLB_SQ == 9}">
				<div style="text-align: center;margin-top: 0.8rem;">
					<button class="btn-submit" onclick="addMbr('${amsClbMbr.MBR_SQ}');">정회원추가</button>
				</div>
				</c:if>
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
							<label for="strClbgdB" class="float1"><input  type="radio" name="strClbgb" id="strClbgdB" data-clbgdnm="${label.普通管理员}" value="B" /></label>
					</div>
				</li>
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>${label.普通会员}</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdC" class="float1"><input  type="radio" name="strClbgc" id="strClbgdC" data-clbgdnm="${label.普通会员}" value="C" /></label>
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
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>Coach</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdE" class="float1"><input  type="radio" name="strClbge" id="strClbgdE" data-clbgdnm="Coach" value="E" /></label>
					</div>
				</li>
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>${label.新手}</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdF" class="float1"><input  type="radio" name="strClbgf" id="strClbgdF" data-clbgdnm="${label.新手}" value="F" /></label>
					</div>
				</li>
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>${label.非会员}</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdX" class="float1"><input  type="radio" name="strClbgx" id="strClbgdX" data-clbgdnm="${label.非会员}" value="X" /></label>
					</div>
				</li>
				<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
					<div class="float" style="width:4rem;height:0.6rem;">
						<p>탈퇴</p>
					</div>
					<div class="radio-box " style="padding-top:0.18rem;">
							<label for="strClbgdZ" class="float1"><input  type="radio" name="strClbz" id="strClbgdZ" data-clbgdnm="탈퇴" value="Z" /></label>
					</div>
				</li>
			</ul>
		</div>

		 <script type="text/javascript">

	  		$(document).ready(function(){

	  			document.getElementById("strClBthdttp").value = "${amsClbMbr.BTH_DT_TP}";
	  			document.getElementById("strBmtgd").value = "${amsClbMbr.BMT_GD}";
				<c:if test="${amsClb.CLB_SQ == 11}">
	  			document.getElementById("selClb").value = "${amsClbMbr.BMTYEAR}";
				</c:if>
				document.getElementById("strGnddv").value = "${amsClbMbr.GND_DV}";
	  			
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
     			var strClbgd = $('#strClbgd').val();
     			var intJinclbbbc = $('#intJinclbbbc').val();
     			var intClbbbc = $('#intClbbbc').val();
     			var strClbniknm = $('#strClbniknm').val();
     			var datJindt = $('#strClBthdt').val();
     			var intYywincnt = $('#strClBthdttp').val();
     			var strBmtgd = $('#strBmtgd').val();
     			var strGnddv = $('#strGnddv').val();
				
     			if (strClbniknm == "") {
     				alert("${label.请输入}${label.姓名}");
     				return;
     			}
     			
     			if (strClbgd == "") {
     				alert("${label.请输入}${label.会员等级}");
     				return;
     			}

				<c:if test="${amsClb.CLB_SQ != 11}">
     			if (intJinclbbbc == "") {
     				alert("${label.请输入}${label.初期}BB Coin");
     				return;
     			}
     			
     			if (intClbbbc == "") {
     				alert("${label.请确认}BB Coin");
     				return;
     			}
				</c:if>

				<c:if test="${amsClb.CLB_SQ == 11}">
				datJindt = $('#selClb').val();
     			if (datJindt == "") {
     				alert("${label.请输入} Club!");
     				return;
     			}
				</c:if>
				
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 			,strClbgd : strClbgd
     			 	 			,intJinclbbbc : intJinclbbbc
     			 	 			,intClbbbc : intClbbbc
     			 	 			,intMbrsq : intMbrsq
     			 	 			,strClbniknm : strClbniknm
     			 	 			,strAtttp : datJindt
     			 	 			,intYywincnt : intYywincnt
     			 	 			,strBmtgd : strBmtgd
     			 	 			,strGnddv : strGnddv
     			 	 		},
     					type : "POST",
 					    contentType : "application/x-www-form-urlencoded;charset=utf-8",
     					url : "/front/bbc/clb/clbMbrModifyNew.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.href="/front/bbc/clb/clbMbrList.htm?intClbsq=${amsClb.CLB_SQ}";
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
     		
     		function addMbr(a) {

     			if(!confirm("정회원으로 추가하시겠습니까?")) {
     				return;
     			}
     			
     			var para1 = "MBR_FEE_USER_SAVE";
     			var para2 = "${amsClb.CLB_SQ}";
     			var para3 = a;
     			var para4 = "A";

     			$.ajax({
     						data : {
     							para1 : para1,
     							para2 : para2,
     							para3 : para3,
     							para4 : para4
     						},
     						type : "POST",
     					    contentType : "application/x-www-form-urlencoded;charset=utf-8",
     						url : "/front/bbc/clb/getData.htm",
     						success : function(data) {
     							window.location.reload();
     						},
     						error : function(xhr, status, e) {
     							window.location.reload();
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
