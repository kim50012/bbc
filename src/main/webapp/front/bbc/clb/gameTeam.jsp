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
		<title>${label.伙伴比赛列表}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%>
		<link rel="stylesheet" type="text/css" href="../css/jquery.typeahead.css"/>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery-weui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/jquery.typeahead.js" type="text/javascript" charset="utf-8"></script>
		
		
		<style type="text/css">
				.month input{
					width:1.8rem;
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
					width:1.2rem; 
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
				.name1{
					line-height:0.4rem;
				}
				.name2{
				}
				
				.avatar img {
					height:0.44rem;
					width:0.44rem;
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
			<div class="modules">
				<div class="" style="height:0.7rem;width:100%;border-bottom:1px solid #ddd;">
					<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
						<div class="flex">
							<p class="flex1 title-icon">${label.伙伴比赛列表}</p>
							<button class="add-btn" onclick="window.location='/front/bbc/clb/gameReg.htm?intClbsq=${amsClb.CLB_SQ}';"></button>
						</div>
					</div>
				</div>
				
				<div class="" style="height:1.4rem;width:100%;border-bottom:1px solid #ddd;padding-right:0.2rem;">
					
					<div class="module list-head" style="border-top:none;background:#fff;border-bottom:none;">
						<ul class="flex">
							<li class="flex3 cell" style="width:2rem">	
						        <div class="typeahead__container" style="padding-top:0.1rem;">
						            <div class="typeahead__field">
							            <span class="typeahead__query">
							                <input id="strMbrnma1"
							                       name="q"
							                       type="search"
							                       autofocus
							                       autocomplete="off"
							                       placeholder="${label.请输入}"
							                       value="${strMbrsnma1}"
							                       class="name-input" style="margin-bottom:0.02rem;">
							            </span>
						            </div>
						        </div>
						        <div class="typeahead__container">
						            <div class="typeahead__field">
							            <span class="typeahead__query">
							                <input id="strMbrnma2"
							                       name="q"
							                       type="search"
							                       autofocus
							                       autocomplete="off"
							                       placeholder="${label.请输入}"
							                       value="${strMbrsnma2}"
							                       class="name-input" style="margin-bottom:0rem;">
							            </span>
						            </div>
						        </div>
							
							</li>
							<li class="flex3 cell" style="width:0.5rem">vs</li>
							<li class="flex3 cell" style="width:2rem">
						        <div class="typeahead__container" style="padding-top:0.1rem;">
						            <div class="typeahead__field">
							            <span class="typeahead__query">
							                <input id="strMbrnmb1"
							                       name="q"
							                       type="search"
							                       autofocus
							                       autocomplete="off"
							                       placeholder="${label.请输入}"
							                       value="${strMbrsnmb1}"
							                       class="name-input" style="margin-bottom:0.02rem;">
							            </span>
						            </div>
						        </div>						
						        <div class="typeahead__container">
						            <div class="typeahead__field">
							            <span class="typeahead__query">
							                <input id="strMbrnmb2"
							                	   name="q"
							                       type="search"
							                       autofocus
							                       autocomplete="off"
							                       placeholder="${label.请输入}"
							                       value="${strMbrsnmb2}"
							                       class="name-input" style="margin-bottom:0.02rem;">
							            </span>
						            </div>
						        </div>
							</li>
							<li class="flex3 cell-6 cell">
								<button class="btn-borders float1" onclick="search('');" style="width:1rem;vertical-align:middle;background:#01cfb9;color:#fff;">${label.查询}</button>
							</li>
						</ul>
					</div>
					
				</div>			
			
				<div class="switcharea-apply">
					<div class="module list-head" style="border-top:none;background:#fff;">
						<ul class="flex">
							<li class="flex3 cell-1 cell">${label.日期}</li>
							<li class="flex3 cell-2 cell">Coin</li>
							<li class="flex3 cell-3 cell">A ${label.队}</li>
							<li class="flex3 cell-7 cell"></li>
							<li class="flex3 cell-4 cell">B ${label.队}</li>
							<li class="flex3 cell-5 cell">Coin</li>
						</ul>
					</div>
					<div class="module" style="border:none;background:#fff;font-size:0.22rem;">
					
					
					<c:set var="win" value="${0 }" />
					<c:set var="lose" value="${0 }" />
					<c:set var="bbca" value="${0 }" />
					<c:set var="bbcb" value="${0 }" />
					<!-- START Data Loop -->
					<c:forEach var="atrMtcList" items="${atrMtcList}" varStatus="status">
						
						<!-- 경기기록 -->
						<ul class="flex list110 ul-list word">
							<li class="flex3 cell-1 cell"><div style="line-height:0.26rem;"><span class="name1">[${status.count}]</span><br><span class="name2">${atrMtcList.MTC_MMDD}</span></div></li>
							
							<c:set var="bbca" value="${bbca+atrMtcList.BBC_A1}" />
							<c:set var="bbcb" value="${bbcb+atrMtcList.BBC_B1}" />
							<c:if test="${atrMtcList.A_TEM_SCR > atrMtcList.B_TEM_SCR}">
								<c:set var="win" value="${win+1}" />
							</c:if>
							<c:if test="${atrMtcList.A_TEM_SCR < atrMtcList.B_TEM_SCR}">
								<c:set var="lose" value="${lose+1}" />
							</c:if>
<%-- 							<c:if test="${atrMtcList.VTC_TEM_DV == 'A'}"> --%>
<%-- 								<c:set var="win" value="${win+1}" /> --%>
<%-- 							</c:if> --%>
<%-- 							<c:if test="${atrMtcList.VTC_TEM_DV == 'B'}"> --%>
<%-- 								<c:set var="lose" value="${lose+1}" /> --%>
<%-- 							</c:if> --%>
							<li class="flex3 cell-2 cell">${atrMtcList.BBC_TAG_A1}</li>
							<li class="flex3 cell-3 cell"><div style="line-height:0.26rem;"><div class="name1">${atrMtcList.MBR_NM_A1}</div><div class="name1">${atrMtcList.MBR_NM_A2}</div></div></li>
							<li class="flex3 cell-7 cell">${atrMtcList.A_TEM_SCR}:${atrMtcList.B_TEM_SCR}</li>
							<li class="flex3 cell-4 cell" ><div style="line-height:0.26rem;"><div class="name2">${atrMtcList.MBR_NM_B1}</div><div class="name2">${atrMtcList.MBR_NM_B2}</div></div></li>
							<li class="flex3 cell-5 cell">${atrMtcList.BBC_TAG_B1}</li>

						</ul>
					
					 </c:forEach>
					<!-- END Data Loop -->
					
						<!-- 경기기록 -->
						<ul class="flex list110 ul-list word" style="background: #edd3ca40;">
							<li class="flex3 cell-1 cell">${label.合计}</li>
							
							<li class="flex3 cell-2 cell">${bbca}</li>
							<li class="flex3 cell-3 cell"><div style="line-height:0.26rem;"><div class="name1">${strMbrsnma1}</div><div class="name1">${strMbrsnma2}</div></div></li>
							<li class="flex3 cell-7 cell">${win} : ${lose}</li>
							<li class="flex3 cell-4 cell"><div style="line-height:0.26rem;"><div class="name2">${strMbrsnmb1}</div><div class="name2">${strMbrsnmb2}</div></div></li>
							<li class="flex3 cell-5 cell">${bbcb}</li>

						</ul>
						
					</div>
				</div>
			</div>
			
			<br><br><br>
		
			<input type="hidden" id="intMbrsqa1" value="${intMbrsqa1}"/>
			<input type="hidden" id="intMbrsqa2" value="${intMbrsqa2}"/>
			<input type="hidden" id="intMbrsqb1" value="${intMbrsqb1}"/>
			<input type="hidden" id="intMbrsqb2" value="${intMbrsqb2}"/>
			
		<style type="text/css">
		.typeahead__list, .typeahead__dropdown {min-width: 300px;}
		</style>

		
		<script type="text/javascript">

		    var data = ${kewordData};
		    //name, bbc, rank, imgUrl, keyword, id, grade
		    
		    var template = '<span class="row">' +
		    '<span class="avatar">' +
		    '<img class="member-head" src="{{imgUrl}}">' +
		    '</span>' +
		    //'<span class="username">{{name}} <small style="color:#777;">({{id}})</small></span>' +
		    '<span class="username">{{name}} </span>' +
		    ' <span class="id">( {{rank}}${label.位}, {{bbc}}${label.分} )</span>' +
		    '</span>';
		    
		    typeof $.typeahead === 'function' && $.typeahead({
		        input: "#strMbrnma1",
		        minLength: 0,
		        maxItem: 8,
		        //order: "asc",
		        cashe: false,
		        searchOnFocus: false,
		        emptyTemplate: 'no result for {{query}}',
		        //display: ["name"],
		        correlativeTemplate: true,
		        templateValue: "{{name}}",
		        source: {
		        	myGroup: {
		                data: data,
		                display: ["name", "keyword"],
		                template: template
		            }
		        },
		        callback: {
		            onClickAfter: function (node, a, item, event) {
		            	$("#intMbrsqa1").val(item.id);
// 		            	fn_onchange();
		            }
		        },
		        debug: true
		    });
		    typeof $.typeahead === 'function' && $.typeahead({
		        input: "#strMbrnma2",
		        minLength: 0,
		        maxItem: 8,
		        order: "asc",
		        searchOnFocus: false,
		        emptyTemplate: 'no result for {{query}}',
		        //display: ["name"],
		        correlativeTemplate: true,
		        templateValue: "{{name}}",
		        source: {
		        	myGroup: {
		                data: data,
		                display: ["name", "keyword"],
		                template: template
		            }
		        },
		        callback: {
		            onClickAfter: function (node, a, item, event) {
		            	$("#intMbrsqa2").val(item.id);
// 		            	fn_onchange();
		            }
		        },
		        debug: true
		    });
		    typeof $.typeahead === 'function' && $.typeahead({
		        input: "#strMbrnmb1",
		        minLength: 0,
		        maxItem: 8,
		        order: "asc",
		        searchOnFocus: false,
		        emptyTemplate: 'no result for {{query}}',
		        //display: ["name"],
		        correlativeTemplate: true,
		        templateValue: "{{name}}",
		        source: {
		        	myGroup: {
		                data: data,
		                display: ["name", "keyword"],
		                template: template
		            }
		        },
		        callback: {
		            onClickAfter: function (node, a, item, event) {
		            	$("#intMbrsqb1").val(item.id);
// 		            	fn_onchange();
		            }
		        },
				selector: {
					list: "typeahead__list2",
				},
		        debug: true
		    });
		    typeof $.typeahead === 'function' && $.typeahead({
		        input: "#strMbrnmb2",
		        minLength: 0,
		        maxItem: 8,
		        order: "asc",
		        searchOnFocus: false,
		        emptyTemplate: 'no result for {{query}}',
		        //display: ["name"],
		        correlativeTemplate: true,
		        templateValue: "{{name}}",
		        source: {
		        	myGroup: {
		                data: data,
		                display: ["name", "keyword"],
		                template: template
		            }
		        },
		        callback: {
		            onClickAfter: function (node, a, item, event) {
		            	$("#intMbrsqb2").val(item.id);
// 		            	fn_onchange();
		            }
		        },
				selector: {
					list: "typeahead__list2",
				},
		        debug: true
		    });
		    
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
				
				//if ($("#intMbrsqa2").val() == "0" && $("#intMbrsqb2").val() == "0") {
				//	alert("${label.请输入姓名}");
				//	return;
				//}
				
				window.location='gameTeam.htm?intClbsq=${intClbsq}&intMbrsqa1='+$("#intMbrsqa1").val() + '&intMbrsqa2='+$("#intMbrsqa2").val() + '&intMbrsqb1='+$("#intMbrsqb1").val() + '&intMbrsqb2='+$("#intMbrsqb2").val();
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
		</script>	
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		
		<c:set var="helpTag" value="15" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="두 팀간의 경기 결과를 조회하는 화면입니다.<BR><BR>혹 이벤트 경기가 생겼다면 이 화면을 이용, 그동안 상대편과의 전적을 검색하여 승부 예측을 해보세요 ^^" />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是查看两个队的比赛结果。<br><br>如果有特别活动比赛的话，就是使用这个画面可以预测出来哪个队胜利。" />
		</c:if>
		
		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 		
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
	</body>
	</html>