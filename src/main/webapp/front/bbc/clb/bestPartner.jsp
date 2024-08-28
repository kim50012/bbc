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
		<title>${label.Best伙伴查询}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<link rel="stylesheet" type="text/css" href="../css/jquery.typeahead.css"/>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery.typeahead.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
				.month input{
					width:2.5rem;
					height:0.4rem;
					padding:0 0.2rem;
					border:1px solid #d2d2d2;
					font-size:0.2rem;
					border-radius:0.04rem;
					color:#aaa;
				}
				.cell-1{
					width:0.7rem; 
				}
				.cell-2{
					width:1rem; 
				}
				.cell-3{
					width:1rem; 
				}
				.cell-4 {
					width:0.94rem; 
				}
				.cell-5{
					width:0.9rem; 
				}
				.cell-6 {
					width:1.1rem; 
				}
				.cell-7{
					width:1rem; 
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
		
			<div class="fixed" style="top: 0;">
				<div class="module">
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
					<div class="list68 flex">
						<p class="flex1 switch-btn switch-btn1 active"><span>베스트파트너</span></p>
						<p><div class="parting-line"></div></p>
						<p class="flex1 switch-btn switch-btn2"><span>파트너 조별 순위</span></p>
					</div>
				</div>
			</div>
				
			<div class="module" id="listA" style="border-top:none;background:#fff;padding-top: 0.7rem;">
			
<!-- 				<div class="" style="height:0.7rem;width:100%;"> -->
<!-- 					<div class="float" style="width:0.72rem;height:0.7rem;padding-left:0.2rem;line-height:0.7rem; "> -->
<%-- 						${label.姓名} --%>
<!-- 					</div> -->
<!-- 					<div class="month float" style="height:0.7rem;line-height:0.7rem;margin-right:0.1rem;"> -->
<!-- 				        <div class="typeahead__container"> -->
<!-- 				            <div class="typeahead__field"> -->
<!-- 					            <span class="typeahead__query" style="padding-top:0.07rem;"> -->
<!-- 					                <input id="strMbrnm" -->
<!-- 					                	   name="q" -->
<!-- 					                       type="search" -->
<!-- 					                       autofocus -->
<!-- 					                       autocomplete="off" -->
<%-- 					                       placeholder="${label.输入姓名}" --%>
<%-- 					                       value="${strMbrnickname }" --%>
<!-- 					                       class="name-input" style="margin-bottom:0.02rem;height: 0.59rem;"> -->
<!-- 					            </span> -->
<!-- 				            </div> -->
<!-- 				        </div> -->
<!-- 					</div> -->
<!-- 					<div class="float" style="height:0.7rem;line-height:0.7rem;position:relative;padding-right:0;"> -->
<%-- 						<button class="btn-borders float1" onclick="search();" style="vertical-align:middle;background:#01cfb9;color:#fff;">${label.查询}</button> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				<input type="hidden" id="intMbrsq" value="${intMbrsq}"/>
				<!-- START Data Loop -->
				<c:forEach var="atrMtcList" items="${atrMtcList}" varStatus="status">  
						
				<c:if test="${status.count%10 == 1 and status.count >= 1}">
				<div class="module list-head" style="border-top:none;">
					<ul class="flex">
						<li class="flex2 cell-1 cell">${label.排序}</li>
						<li class="flex2 cell-2 cell">${label.姓名}</li>
						<li class="flex2 cell-7 cell">${label.姓名}</li>
						<li class="flex2 cell-3 cell">${label.合计}Coin</li>
						<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
						<li class="flex2 cell-5 cell" style="text-decoration:underline;" onclick="search('WIN_RATE');">${label.胜率}</li>
						<li class="flex2 cell-6 cell" style="text-decoration:underline;" onclick="search('BBC');">BB Coin</li>
					</ul>
				</div>
				</c:if>						
						
				<ul class="flex list78 ul-list word">
					<li class="flex2 cell-1 cell">${status.count}</li>
					<c:set var="myTaga" value="" />
					<c:if test="${atrMtcList.MBR_SQ_A == amsClb.MBR_SQ}">
						<c:set var="myTaga" value="background-color:#c8fcf7;" />
					</c:if>
					<li class="flex2 cell-2 cell" style="text-decoration:underline;${myTaga}" onclick="search2('${atrMtcList.MBR_SQ_A}', '');">${atrMtcList.MBR_NM_A}</li>
					<c:set var="myTaga" value="" />
					<c:if test="${atrMtcList.MBR_SQ_B == amsClb.MBR_SQ}">
						<c:set var="myTaga" value="background-color:#c8fcf7;" />
					</c:if>
					<li class="flex2 cell-7 cell" style="text-decoration:underline;${myTaga}" onclick="search2('${atrMtcList.MBR_SQ_B}', '');">${atrMtcList.MBR_NM_B}</li>
					<li class="flex2 cell-3 cell">${atrMtcList.MTC_CLB_BBC}</li>
					<li class="flex2 cell-4 cell">${atrMtcList.WIN}/${atrMtcList.LOSE}</li>
					<li class="flex2 cell-5 cell">${atrMtcList.WIN_RATE}%</li>
					<li class="flex2 cell-6 cell" onclick="gotoGameTeam('${atrMtcList.MBR_SQ_A}', '${atrMtcList.MBR_SQ_B}');">${atrMtcList.BBC_TAG}</li>
				</ul>
				
				</c:forEach>
				<!-- END Data Loop -->
					
				<br><br><br>
					
			</div>
			
			<div class="module" id="listB" style="border-top:none;background:#fff;display:none;padding-top: 0.7rem;">
			
				<!-- START Data Loop -->
				<c:forEach var="atrMtcList" items="${atrMtcList2}" varStatus="status">  
						

				<c:if test="${atrMtcList.RANKING == 1}">
				<div class="module list-head" style="border-top:none;">
					<ul class="flex">
						<li class="flex2 cell-1 cell">${label.排序}</li>
						<li class="flex2 cell-2 cell">${label.姓名}</li>
						<li class="flex2 cell-7 cell">${label.姓名}</li>
						<li class="flex2 cell-3 cell">${label.合计}Coin</li>
						<li class="flex2 cell-4 cell">${label.胜}/${label.败}</li>
						<li class="flex2 cell-5 cell">${label.胜率}</li>
						<li class="flex2 cell-6 cell">BB Coin</li>
					</ul>
				</div>
				</c:if>						
						
				<ul class="flex list78 ul-list word">
					<li class="flex2 cell-1 cell">${atrMtcList.LVL}-${atrMtcList.RANKING}</li>
					<c:set var="myTaga" value="" />
					<c:if test="${atrMtcList.MBR_SQ_A == amsClb.MBR_SQ}">
						<c:set var="myTaga" value="background-color:#c8fcf7;" />
					</c:if>
					<li class="flex2 cell-2 cell" style="text-decoration:underline;${myTaga}" onclick="search2('${atrMtcList.MBR_SQ_A}', '');">${atrMtcList.MBR_NM_A}</li>
					<c:set var="myTaga" value="" />
					<c:if test="${atrMtcList.MBR_SQ_B == amsClb.MBR_SQ}">
						<c:set var="myTaga" value="background-color:#c8fcf7;" />
					</c:if>
					<li class="flex2 cell-7 cell" style="text-decoration:underline;${myTaga}" onclick="search2('${atrMtcList.MBR_SQ_B}', '');">${atrMtcList.MBR_NM_B}</li>
					<li class="flex2 cell-3 cell">${atrMtcList.MTC_CLB_BBC}</li>
					<li class="flex2 cell-4 cell">${atrMtcList.WIN}/${atrMtcList.LOSE}</li>
					<li class="flex2 cell-5 cell">${atrMtcList.WIN_RATE}%</li>
					<li class="flex2 cell-6 cell" onclick="gotoGameTeam('${atrMtcList.MBR_SQ_A}', '${atrMtcList.MBR_SQ_B}');">${atrMtcList.BBC_TAG}</li>
				</ul>
				
				</c:forEach>
				<!-- END Data Loop -->
					
				<br><br><br>
					
			</div>
			
			
		<script type="text/javascript">

		$(document).ready(function(){
				$(".switch-btn").on("click",function(){
					$(".switch-btn").removeClass("active");
					$(this).addClass("active");
					if($(this).attr("class").indexOf("switch-btn1") >= 0){
						$("#listA").show();
						$("#listB").hide();
					}
					else if($(this).attr("class").indexOf("switch-btn2") >= 0){
						$("#listA").hide();
						$("#listB").show();
					}
			});
		});

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
				window.location='bestPartner.htm?intClbsq=${intClbsq}&strOrderby='+strOrderby+'&intMbrsq='+intMbrsq;
			}
			function search2(intMbrsq, strOrderby) {
				window.location='bestPartner.htm?intClbsq=${intClbsq}&strOrderby='+strOrderby+'&intMbrsq='+intMbrsq;
			}
			
			function gotoGameTeam(intMbrsqa1, intMbrsqa2) {
				window.location='/front/bbc/clb/gameTeam.htm?intClbsq=${intClbsq}&intMbrsqa1='+intMbrsqa1+'&intMbrsqa2='+intMbrsqa2+'&intMbrsqb1=0&intMbrsqb2=0';
			}
		
			$(document).ready(function(){
				$(".down").click(function(){
					$(".screen").toggle();
				});
				$(".single").click(function(){
					$(".down").html($(this).html());
					$(".screen").hide();
				});
			});
		</script>	
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		
		<c:set var="helpTag" value="15" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="클럽내 파트너간이 파트너쉽을 볼수 있는 화면 입니다.<BR><BR>자신과 가장 잘 맞는 파트너가 누구인지 혹은 조금 더 호흡을 맞춰볼 파트너는 누구인지 볼 수 있습니다.<BR><BR>자신과 잘 맞는 파트너와 클럽 내 BEST 파트너를 달성해보세요 ^^<BR>단, WORST 파트너도 존재합니다.. " />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这是在俱乐部内能看到最佳的伙伴的画面。<br><br>能看到谁是比较配合我而且向后可以跟他一起参加比赛。<br><br>不过能存在最不佳的伙伴。" />
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