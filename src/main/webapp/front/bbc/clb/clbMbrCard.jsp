<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html >
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>${amsMbr.CLB_NIK_NM } ${label.信息 }</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<link rel="stylesheet" type="text/css" href="../css/jquery.typeahead.css"/>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery.typeahead.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<style type="text/css">
				.month input{
					width:3.7rem;
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
					width:1.4rem; 
				}
				.cell-3{
					width:1rem; 
				}
				.cell-4 {
					width:1.1rem; 
				}
				.cell-5{
					width:1.1rem; 
				}
				.cell-6 {
					width:1.17rem; 
				}
	</style>
	<body>
		<div class="content">
			<div class="module" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="" style="height:0.7rem;width:100%;">
					<div class="float" style="width:0.72rem;height:0.7rem;padding-left:0.2rem;line-height:0.7rem; ">
						${label.姓名}
					</div>
					<div class="month float" style="height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
				        <div class="typeahead__container">
				            <div class="typeahead__field">
					            <span class="typeahead__query" style="padding-top:0.07rem;">
					                <input id="strMbrnm"
					                	   name="q"
					                       type="search"
					                       autofocus
					                       autocomplete="off"
					                       placeholder="${label.输入姓名}"
					                       value="${amsMbr.CLB_NIK_NM }"
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.59rem;">
					            </span>
				            </div>
				        </div>
					</div>
					<input type="hidden" id="intMbrsq" value="${intMbrsq}"/>
					
					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;">
						<button class="btn-borders" onclick="search();" style="vertical-align:middle;background:#01cfb9;color:#fff;">${label.查询}</button>
						
					</div>
				</div>
			</div>
			<div class="modules" style="border-bottom:none;">
					<div class="sub-content flex">
						<div class="lev-wrap">
							<p class="left small" style="font-size:0.22rem;color:#222;">${label.会员等级}</p>
							<img class="lev" src="${amsMbr.MBR_MAI_IMG_PTH}"/>
						</div>
						<div class="flex1 lev-info">
							<p class="lh20 small">${amsMbr.CLB_NIK_NM }  </p>
							<p class="lh20 small">${label.双打} Ranking ${amsMbr.CLB_RANK }${label.位}</p>
							<p class="lh20 small">${label.单打} Ranking ${amsMbr.CLB_SINGLES_RANK }${label.位}</p>
							<p class="lh20 small">${amsMbr.CLB_GD_NM}</p>
						</div>
					</div>
					<div class="module" style="background:#fff;border-bottom:none;padding-bottom:0.2rem;">
					
						<c:if test="${amsMbr.CLB_GD != 'E' && amsMbr.CLB_GD != 'F'}">
							<div class="list80 flex">
								<p class="left-part">${label.俱乐部排名}</p>
								<p>${amsMbr.CLB_RANK } ${label.位}</p>
							</div>
							<div class="list80 flex">
								<p class="left-part">${label.总比赛}</p>
								<p>${amsMbr.GAME_CNT }${label.比赛}</p>
							</div>
							<div class="list80 flex">
								<p class="left-part">${label.胜率}（${label.胜}/${label.败}）</p>
								<p>${amsMbr.WIN_RATE }%（${amsMbr.WIN }${label.胜}/${amsMbr.LOSE }${label.败}）</p>
							</div>
							<div class="list80 flex">
								<p class="left-part">BB Coin</p>
								<p>${amsMbr.CLB_BBC } Coin</p>
							</div>
						</c:if>
					
						<div class="list80 flex">
							<p class="left-part ">${label.加入日期}</p>
							<p>${amsMbr.CLB_JIN_DT }</p>
						</div>
						<div class="list80 flex">
							<p class="left-part ">${label.加入期间}</p>
							<p>${amsMbr.JIN_SUM_MM }</p>
						</div>
					</div>
			</div>
			
			
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="flex">
						<p class="flex1 title-icon">${label.定期活动} ${label.比赛次数}</p>
<!-- 						<button id="btn"  style="background:none;color:#666;font-size:0.22rem;">更多></button> -->
				</div>
			</div>
			<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.年} / ${label.月}</li>
					<li class="flex2 cell-2 cell">${label.活动次数}</li>
					<li class="flex2 cell-3 cell">${label.比赛数}</li>
					<li class="flex2 cell-4 cell">${label.参加率}</li>
					<li class="flex2 cell-5 cell">BB Coin</li>
				</ul>
			</div>
			<div class="module" style="border-top:none;background:#fff;padding-bottom:0.2rem;">
				<!-- START Data Loop -->
				<c:forEach var="atrMtcMbrEXC" items="${atrMtcMbrEXC}" varStatus="status">  
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell" style="text-decoration:underline;" onclick="window.location.href='/front/bbc/clb/clbMbrMonthly.htm?intClbsq=${intClbsq}&intMbrsq=${intMbrsq}&datFrdt=${atrMtcMbrEXC.EXC_DT}';">${atrMtcMbrEXC.EXC_DT}</li>
						<li class="flex2 cell-2 cell">${atrMtcMbrEXC.EXC_CNT} / ${atrMtcMbrEXC.EXC_CNT_TT}</li>
						<li class="flex2 cell-3 cell">${atrMtcMbrEXC.GAME_CNT}</li>
						<li class="flex2 cell-4 cell">${atrMtcMbrEXC.EXC_RATE}%</li>
						<li class="flex2 cell-5 cell">${atrMtcMbrEXC.BBC}</li>
					</ul>
				 </c:forEach>
				<!-- END Data Loop -->
			</div>
			

			<c:if test="${amsMbr.CLB_GD != 'E'}">	
			
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="flex">
						<p class="flex1 title-icon">Best${label.伙伴} – BB Coin Top 10</p>
<!-- 						<button id="btn"  style="background:none;color:#666;font-size:0.22rem;">更多></button> -->
				</div>
			</div>
			<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">${label.比赛数}</li>
					<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
					<li class="flex2 cell-5 cell">${label.胜率}</li>
					<li class="flex2 cell-6 cell">BB Coin</li>
				</ul>
			</div>
			<div class="module" style="border-top:none;background:#fff;padding-bottom:0.2rem;">

				<!-- START Data Loop -->
				<c:forEach var="atrMtcMbrB" items="${atrMtcMbrB}" varStatus="status">  
					
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${intClbsq}&intMbrsq=${atrMtcMbrB.MBR_SQ}';">${atrMtcMbrB.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${atrMtcMbrB.GAME_CNT}</li>
						<li class="flex2 cell-4 cell">${atrMtcMbrB.WIN}/${atrMtcMbrB.LOSE}</li>
						<li class="flex2 cell-5 cell">${atrMtcMbrB.WIN_RATE}%</li>
						<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTeam.htm?intClbsq=${intClbsq}&intMbrsqa1=${intMbrsq}&intMbrsqa2=${atrMtcMbrB.MBR_SQ}';">${atrMtcMbrB.BBC_TAG}</li>
					</ul>
				 </c:forEach>
				<!-- END Data Loop -->
				
			</div>
			
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="flex">
						<p class="flex1 title-icon">Best${label.伙伴} – ${label.胜率} Top 10</p>
<!-- 						<button id="btn"  style="background:none;color:#666;font-size:0.22rem;">更多></button> -->
				</div>
			</div>
			<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">${label.比赛数}</li>
					<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
					<li class="flex2 cell-5 cell">${label.胜率}</li>
					<li class="flex2 cell-6 cell">BB Coin</li>
				</ul>
			</div>
			<div class="module" style="border-top:none;background:#fff;">

				<!-- START Data Loop -->
				<c:forEach var="atrMtcMbrW" items="${atrMtcMbrW}" varStatus="status">  
					
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${intClbsq}&intMbrsq=${atrMtcMbrW.MBR_SQ}';">${atrMtcMbrW.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${atrMtcMbrW.GAME_CNT}</li>
						<li class="flex2 cell-4 cell">${atrMtcMbrW.WIN}/${atrMtcMbrW.LOSE}</li>
						<li class="flex2 cell-5 cell">${atrMtcMbrW.WIN_RATE}%</li>
						<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTeam.htm?intClbsq=${intClbsq}&intMbrsqa1=${intMbrsq}&intMbrsqa2=${atrMtcMbrW.MBR_SQ}';">${atrMtcMbrW.BBC_TAG}</li>
					</ul>
				 </c:forEach>
				<!-- END Data Loop -->
				
			</div>

			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="flex">
						<p class="flex1 title-icon">${label.伙伴} Top 10 - ${label.多}${label.比赛数}</p>
<!-- 						<button id="btn"  style="background:none;color:#666;font-size:0.22rem;">更多></button> -->
				</div>
			</div>
			<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">${label.比赛数}</li>
					<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
					<li class="flex2 cell-5 cell">${label.胜率}</li>
					<li class="flex2 cell-6 cell">BB Coin</li>
				</ul>
			</div>
			<div class="module" style="border-top:none;background:#fff;">

				<!-- START Data Loop -->
				<c:forEach var="atrMtcMbrG" items="${atrMtcMbrG}" varStatus="status">  
					
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${intClbsq}&intMbrsq=${atrMtcMbrG.MBR_SQ}';">${atrMtcMbrG.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${atrMtcMbrG.GAME_CNT}</li>
						<li class="flex2 cell-4 cell">${atrMtcMbrG.WIN}/${atrMtcMbrG.LOSE}</li>
						<li class="flex2 cell-5 cell">${atrMtcMbrG.WIN_RATE}%</li>
						<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTeam.htm?intClbsq=${intClbsq}&intMbrsqa1=${intMbrsq}&intMbrsqa2=${atrMtcMbrG.MBR_SQ}';">${atrMtcMbrG.BBC_TAG}</li>
					</ul>
				 </c:forEach>
				<!-- END Data Loop -->
				
			</div>
			
			<!-- 천적 -->
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;display:none;">
				<div class="flex">
						<p class="flex1 title-icon" style="color: #ff0000;">상대전적('천적':붉은색 배경)</p>
<!-- 						<button id="btn"  style="background:none;color:#666;font-size:0.22rem;">更多></button> -->
				</div>
			</div>
			<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">${label.比赛数}</li>
					<li class="flex2 cell-4 cell">My${label.胜}/${label.败}</li>
					<li class="flex2 cell-5 cell">My${label.胜率}</li>
					<li class="flex2 cell-6 cell">BB Coin</li>
				</ul>
			</div>
			<div class="module" style="border-top:none;background:#fff;padding-bottom:0.2rem;">

				<!-- START Data Loop -->
				<c:forEach var="atrMtcMbrK" items="${atrMtcMbrK}" varStatus="status">  
					
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${intClbsq}&intMbrsq=${atrMtcMbrK.MBR_SQ}';">${atrMtcMbrK.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${atrMtcMbrK.GAME_CNT}</li>
						<li class="flex2 cell-4 cell">${atrMtcMbrK.WIN}/${atrMtcMbrK.LOSE}</li>
						<li class="flex2 cell-5 cell">${atrMtcMbrK.WIN_RATE}%</li>
						<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTeam.htm?intClbsq=${intClbsq}&intMbrsqa1=${intMbrsq}&intMbrsqb1=${atrMtcMbrK.MBR_SQ}';">${atrMtcMbrK.BBC_TAG}</li>
					</ul>
				 </c:forEach>
				<!-- END Data Loop -->
				
			</div>
			
			
			<!-- 밥 -->
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="flex">
						<p class="flex1 title-icon">상대전적(<span style="color: #0000ff;">'밥':파란색</span>, <span style="color: #ff0000;">'천적':붉은색</span>)</p>
<!-- 						<button id="btn"  style="background:none;color:#666;font-size:0.22rem;">更多></button> -->
				</div>
			</div>
			<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">${label.比赛数}</li>
					<li class="flex2 cell-4 cell">My${label.胜}/${label.败}</li>
					<li class="flex2 cell-5 cell">My${label.胜率}</li>
					<li class="flex2 cell-6 cell">BB Coin</li>
				</ul>
			</div>
			<div class="module" style="border-top:none;background:#fff;padding-bottom:0.2rem;">

				<!-- START Data Loop -->
				<c:forEach var="atrMtcMbrJ" items="${atrMtcMbrJ}" varStatus="status">  
					
					<ul class="flex list78 ul-list word" ${atrMtcMbrJ.FLAG_TAG}>
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell" style="text-decoration:underline;" onclick="window.location='/front/bbc/clb/clbMbrCard.htm?intClbsq=${intClbsq}&intMbrsq=${atrMtcMbrJ.MBR_SQ}';">
							${atrMtcMbrJ.CLB_NIK_NM} ${atrMtcMbrJ.ICON_TAG}
						</li>
						<li class="flex2 cell-3 cell">${atrMtcMbrJ.GAME_CNT}</li>
						<li class="flex2 cell-4 cell">${atrMtcMbrJ.WIN}/${atrMtcMbrJ.LOSE}</li>
						<li class="flex2 cell-5 cell">${atrMtcMbrJ.WIN_RATE}%</li>
						<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/gameTeam.htm?intClbsq=${intClbsq}&intMbrsqa1=${intMbrsq}&intMbrsqb1=${atrMtcMbrJ.MBR_SQ}';">${atrMtcMbrJ.BBC_TAG}</li>
					</ul>
				 </c:forEach>
				<!-- END Data Loop -->
				
			</div>
			
			</c:if>		
			
		</div>
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		
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
		        input: "#strMbrnm",
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
		            	$("#intMbrsq").val(item.id);
		            },
		        	onHideLayout: function (node, query) {
		            	if ($("#strMbrnm").val() == "") {
			            	$("#intMbrsq").val("");
		            	}
		            }
		        },
		        debug: true
		    });		

			function search(strOrderby) {
				var intMbrsq = $("#intMbrsq").val();
				window.location='clbMbrCard.htm?intClbsq=${intClbsq}&intMbrsq='+intMbrsq;
			}
		</script>
		

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
				
			
	</body>
</html>