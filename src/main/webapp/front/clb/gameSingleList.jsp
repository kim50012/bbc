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
		<title>${label.单打}${label.比赛结果}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery-weui.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
				.month input{
					width:1.4rem;
					height:0.4rem;
					padding:0 0.2rem;
					border:1px solid #d2d2d2;
					font-size:0.2rem;
					border-radius:0.04rem;
					color:#aaa;
				}
				.cell-1{
					width:0.8rem; 
				}
				.cell-2{
					width:0.9rem; 
				}
				.cell-3{
					width:1.1rem; 
				}
				.cell-4 {
					width:1.1rem; 
				}
				.cell-5{
					width:0.9rem; 
				}
				.cell-6 {
					width:1rem; 
				}
				.cell-7 {
					width:0.8rem; 
				}
			
				.cell-6 img{
					height:0.17rem;
					width:0.17rem;
					margin-left:0.06rem;
				}
				.single{
					width:0.86rem;
					
				}
				.btn-borders{
					margin-top: 0.18rem;
				}
				.screen{
					position: absolute;
				    width: 1.06rem;
				    right: 0;
				    font-size:0.22rem;
				    top: 0.65rem;
				}
	
		</style>
	</head>
	<body>
		<div class="content">
			<div class="module" >
					<div class="list-110">
						<p  class="club-logo1 float" >
							<img src="${amsClb.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="word-title float" style="white-space:nowrap;overflow:ellipsis;" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClb.CLB_SQ}';">
							${amsClb.CLB_NM}【<span>${amsClb.CLB_MBR_CNT}</span>人】
						</p>
						<div class="number-information float" style="padding-right: 0.2rem;right: 0;position: absolute;">
							<div class="number-name" >${amsClb.MBR_NM}</div> 
							<div class="number-level" >${amsClb.CLB_GD_NM}</div>
						</div>
					</div>
			</div>
			<div class="modules" style>
				<div class="" style="height:0.7rem;width:100%;border-bottom:1px solid #ddd;">
					<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
						<div class="flex">
							<p class="flex1 title-icon">${label.单打}${label.比赛列表}</p>
							<button class="add-btn" onclick="window.location='/front/bbc/clb/gameRegSingle.htm?intClbsq=${amsClb.CLB_SQ}';"></button>
						</div>
					</div>
				</div>
				
				<div class="" style="height:0.7rem;width:100%;border-bottom:1px solid #ddd;">
					<div class="month float" style="width:2rem;height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
						<input type="text" style="" name="datFrdt" id="datFrdt" value="${datFrdt }" placeholder="选择日期">
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">~</div>
					<div class="month float" style="width:2rem;height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
						<input type="text" style="" name="datTodt" id="datTodt" value="${datTodt }" placeholder="选择日期">
					</div>
					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;padding-right:0;">
						<button class="btn-borders float1" onclick="search('');" style="width:1rem;vertical-align:middle;background:#01cfb9;color:#fff;">${label.查询}</button>
					</div>
				</div>			
			
				<div class="switcharea-apply">
					<div class="module list-head" style="border-top:none;background:#fff;">
						<ul class="flex">
							<li class="flex3 cell-1 cell">${label.日期}</li>
							<li class="flex3 cell-2 cell">Rank</li>
							<li class="flex3 cell-3 cell">${label.胜}</li>
							<li class="flex3 cell-7 cell"></li>
							<li class="flex3 cell-4 cell">${label.败}</li>
							<li class="flex3 cell-5 cell">Rank</li>
							<li class="flex3 cell-6 cell">${label.注册}</li>
						</ul>
					</div>
					<div class="module" style="border:none;background:#fff;font-size:0.22rem;">
					
					<!-- START Data Loop -->
					<c:forEach var="atrMtcList" items="${atrMtcList}" varStatus="status">  
						
						<!-- 경기기록 -->
						<ul class="flex list110 ul-list word">
							<li class="flex3 cell-1 cell"><div style="line-height:0.26rem;"><span class="name1">[${status.count}]</span><br><span class="name1">${atrMtcList.MTC_MMDD}</span></div></li>
							<li class="flex3 cell-2 cell">${atrMtcList.SINGLES_RANK_A}</li>
							<li class="flex3 cell-3 cell"><div style="line-height:0.26rem;"><div class="name1" style="line-height: 0.7rem;">${atrMtcList.MBR_NM_A}</div></div></li>
							<li class="flex3 cell-7 cell">${atrMtcList.SCR_A}:${atrMtcList.SCR_B}</li>
							<li class="flex3 cell-4 cell" ><div style="line-height:0.26rem;"><div class="name2" style="line-height: 0.7rem;">${atrMtcList.MBR_NM_B}</div></li>
							<li class="flex3 cell-5 cell">${atrMtcList.SINGLES_RANK_B}</li>
							<c:if test="${atrMtcList.MTC_SQ == atrMtcList.MTC_SQ_MAX && (amsClb.CLB_GD == 'A' || amsClb.CLB_GD == 'B' || atrMtcList.REG_MBR_SQ == loginMbrSq)}">
								<li class="flex3 cell-6 cell" onclick="gameDel('D', ${atrMtcList.CLB_SQ}, ${atrMtcList.MTC_SQ});"><div class="name1">${atrMtcList.REG_MBR_NM}</div><div class="name1"><img src="../img/modify-btn3.png" ></div></li>
							</c:if>
							<c:if test="${atrMtcList.MTC_SQ != atrMtcList.MTC_SQ_MAX}">
								<li class="flex3 cell-6 cell"><div class="name1">${atrMtcList.REG_MBR_NM}</div></li>
							</c:if>
							
						</ul>
					
					 </c:forEach>
					<!-- END Data Loop -->
					
					</div>
				</div>
			</div>
			
			<BR><BR><BR>
			
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".down").click(function(){
					$(".screen").toggle();
				});
				$(".single").click(function(){
					$(".down").html($(this).html());
					$(".screen").hide();
				});
			});
			function search(strOrderby) {
				window.location='gameSingleList.htm?intClbsq=${intClbsq}&strOrderby='+strOrderby+'&datFrdt='+$("#datFrdt").val()+"&datTodt="+$("#datTodt").val();
			}
     		$(function(){
     		 	$("#datFrdt").calendar({
			        onChange: function (p, values, displayValues) {
	
			          $("#datFrdt").siblings("p").hide()
			        }
		      	});
     		 	$("#datTodt").calendar({
			        onChange: function (p, values, displayValues) {
	
			          $("#datTodt").siblings("p").hide()
			        }
		      	});
			});
     		

    		function gameDel(strJobtype, intClbsq, intMtcsq) {
    			
         		if (!confirm("${label.确认删除吗}?")) {
     				return;
     			}
    			
    			loadingShow();
    			
    			 $.ajax({
    			 	 		data:{
    			 	 			strJobtype : strJobtype
    			 	 			,intClbsq : intClbsq
    			 	 			,intMtcsq : intMtcsq
    			 	 		},
    					type : "POST",
    					url : "/front/bbc/clb/gameSaveSingles.htm",
    					success : function(data) {
    						//alert(data);
    						//var list = data.data || [];
    						if(data.MSG_OUT=="S"){

    		     				window.location="/front/bbc/clb/gameSingleList.htm?intClbsq=${intClbsq}&datFrdt=${datFrdt}&datTodt=${datTodt}";
    							
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
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		<%@ include file="/front/bbc/inc/loading.jsp"%>
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
		 
	</body>
	</html>