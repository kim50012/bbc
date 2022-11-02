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
		<title>${label.参加活动}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<style>
		.blink {
		    -webkit-animation: blink 2.5s linear infinite;
		} 
		@-webkit-keyframes blink {
		    0% { color: red; }
		    33% { color: yellow; }
		    66% { color: blue; }
		    100% { color: green; }
		/*    from { background-color: red;}
		    to {background-color: green;}  */
		}
		</style>		
	</head>
	<%@ include file="/front/bbc/inc/tags.jsp"%>
	<body style="background:#fff;">
		<div class="wrap no-footer" style="background:#fff;">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">北京羽毛球俱乐部</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
			
				<!-- START Data Loop -->
				<c:set var="hmeClbsq" value="${amsExcList.HME_CLB_SQ}"/>
			
				<div class="module">
					<div class="list110 flex" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsExcList.HME_CLB_SQ}';">
						<p class="club-logo">
							<img class="club-icon" src="${amsExcList.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="flex1 row1 word-title">${amsExcList.HME_CLB_NM}</p>
						<p class="row1">
							<div class="sub-content-title" style="margin:0;">
								<span>${amsExcList.EXC_TP_NM}</span>
							</div>						
						</p>
					</div>
					<div class="sub-content">
						<div class="list flex row1" style="padding-top:0.2rem;"><span class="text-outline">${label.场地}：</span><p>${amsExcList.EXC_TIT}</p></div>
						<div class="list flex row1"><span class="text-outline">${label.时间}：</span><p>${amsExcList.EXC_DATE}  ${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}</p></div>
						<div class="list flex row1" style="padding-top:0.2rem;"><span class="text-outline">${label.参加人员}：</span><p>${label.共}${amsExcList.JIN_EXC_CNT}+${amsExcList.JIN_LES_CNT}${label.个人}</p></div>
						<div class="flex Participant-title bottom-dashed top-dashed">
							<p class="flex1 title-icon">자동 경기 생성 옵션</p>
						</div>
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">코트수</p>
							<div class="flex1">
								<select class="dropdown" id="intCortcnt" dir="rtl" style="color:#666;padding-right: 0;">
									<option value="1" <c:if test="${amsExcList.CORT_CNT == 1}">selected</c:if>>1</option>
									<option value="2" <c:if test="${amsExcList.CORT_CNT == 2}">selected</c:if>>2</option>
									<option value="3" <c:if test="${amsExcList.CORT_CNT == 3}">selected</c:if>>3</option>
									<option value="4" <c:if test="${amsExcList.CORT_CNT == 4}">selected</c:if>>4</option>
									<option value="5" <c:if test="${amsExcList.CORT_CNT == 5}">selected</c:if>>5</option>
									<option value="6" <c:if test="${amsExcList.CORT_CNT == 6}">selected</c:if>>6</option>
									<option value="7" <c:if test="${amsExcList.CORT_CNT == 7}">selected</c:if>>7</option>
									<option value="8" <c:if test="${amsExcList.CORT_CNT == 8}">selected</c:if>>8</option>
									<option value="9" <c:if test="${amsExcList.CORT_CNT == 9}">selected</c:if>>9</option>
									<option value="10" <c:if test="${amsExcList.CORT_CNT == 10}">selected</c:if>>10</option>
								</select>
							</div>
						</div>
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">인당최소경기수</p>
							<div class="flex1">
								<select class="dropdown" id="intMbrmingamecnt" dir="rtl" style="color:#666;padding-right: 0;">
									<option value="1" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 1}">selected</c:if>>1</option>
									<option value="2" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 2}">selected</c:if>>2</option>
									<option value="3" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 3}">selected</c:if>>3</option>
									<option value="4" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 4}">selected</c:if>>4</option>
									<option value="5" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 5}">selected</c:if>>5</option>
									<option value="6" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 6}">selected</c:if>>6</option>
									<option value="7" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 7}">selected</c:if>>7</option>
									<option value="8" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 8}">selected</c:if>>8</option>
									<option value="9" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 9}">selected</c:if>>9</option>
									<option value="10" <c:if test="${amsExcList.MBR_MIN_GAME_CNT == 10}">selected</c:if>>10</option>
								</select>
							</div>
						</div>
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">파트너 코인차이</p>
							<div class="flex1">
								<select class="dropdown" id="intPartnerbasiccoin" dir="rtl" style="color:#666;padding-right: 0;">
									<option value="200" <c:if test="${amsExcList.PARTNER_BASIC_COIN == 200}">selected</c:if>>200</option>
									<option value="300" <c:if test="${amsExcList.PARTNER_BASIC_COIN == 300}">selected</c:if>>300</option>
									<option value="400" <c:if test="${amsExcList.PARTNER_BASIC_COIN == 400}">selected</c:if>>400</option>
									<option value="500" <c:if test="${amsExcList.PARTNER_BASIC_COIN == 500}">selected</c:if>>500</option>
								</select>
							</div>
						</div>
						
						<div class="list90 flex">
							<p class="left-part">상대팀 코인차이</p>
							<div class="flex1">
								<select class="dropdown" id="intTeambasiccoin" dir="rtl" style="color:#666;padding-right: 0;">
									<option value="50" <c:if test="${amsExcList.TEAM_BASIC_COIN == 50}">selected</c:if>>50</option>
									<option value="100" <c:if test="${amsExcList.TEAM_BASIC_COIN == 100}">selected</c:if>>100</option>
									<option value="150" <c:if test="${amsExcList.TEAM_BASIC_COIN == 150}">selected</c:if>>150</option>
									<option value="200" <c:if test="${amsExcList.TEAM_BASIC_COIN == 200}">selected</c:if>>200</option>
									<option value="250" <c:if test="${amsExcList.TEAM_BASIC_COIN == 250}">selected</c:if>>250</option>
									<option value="300" <c:if test="${amsExcList.TEAM_BASIC_COIN == 300}">selected</c:if>>300</option>
								</select>
							</div>
						</div>
						
					</div>
				</div>
				<!-- END Data Loop -->
				
				
				<c:set var="excSeqMax" value="0" />
				
				<div class="modules" style="border-bottom:none;">
					<div class="sub-content" id="subContentDiv">
					
							<div class="list78 noborder bottom-dashed flex hang" style="padding:0;">
								<p class="flex1" style="min-width:1.4rem;max-width:75px;">이름</p>
								
								<p class="flex1" style="min-width:0.9rem;">Coin</p>
								
								<div class="radio-box flex1 right" style="text-overflow: initial;">
									1그룹
								</div>
								<div class="radio-box flex1 right" style="text-overflow: initial;">
									2그룹
								</div>
								<div class="radio-box flex1 right" style="text-overflow: initial;">
									3그룹
								</div>
								<div class="radio-box flex1 right" style="text-overflow: initial;">
									4그룹
								</div>
								<div class="radio-box flex1 right">
									지각
								</div>
								
							</div>
							
						<!-- START Data Loop -->
						<c:forEach var="amsJinList" items="${amsJinList}" varStatus="status">  
							
							<c:if test="${excSeqMax < amsJinList.SEQ}">
								<c:set var="excSeqMax" value="${amsJinList.SEQ}" />
							</c:if>
							
							
							<div class="list78 noborder bottom-dashed flex hang" style="padding:0;">
								<p class="flex1" style="min-width:1.4rem;max-width:75px;">${amsJinList.SEQ}.${amsJinList.MBR_NM}<span class="${amsJinList.GND_DV_TAG}"></span></p>
								<input type="hidden" id="txtMbrSq_${amsJinList.SEQ}" value="${amsJinList.MBR_SQ}"/>
								
								<p class="flex1" style="min-width:0.9rem;">${amsJinList.CLB_BBC}</p>
								
								<div class="radio-box flex1 right">
									<input type="radio"  name="optGroup_${amsJinList.SEQ}"  id="optGroup_${amsJinList.SEQ}" value="0" style="display:block;width: 80%;height: 0.4rem;vertical-align: middle;margin: 0.2rem;border: solid 1px #c0c0c0;" <c:if test="${amsJinList.MBR_GROUP == 0}">checked</c:if> />
								</div>
								<div class="radio-box flex1 right">
									<input type="radio"  name="optGroup_${amsJinList.SEQ}"  id="optGroup_${amsJinList.SEQ}" value="1" style="display:block;width: 80%;height: 0.4rem;vertical-align: middle;margin: 0.2rem;border: solid 1px #c0c0c0;" <c:if test="${amsJinList.MBR_GROUP == 1}">checked</c:if> />
								</div>
								<div class="radio-box flex1 right">
									<input type="radio"  name="optGroup_${amsJinList.SEQ}"  id="optGroup_${amsJinList.SEQ}" value="2" style="display:block;width: 80%;height: 0.4rem;vertical-align: middle;margin: 0.2rem;border: solid 1px #c0c0c0;" <c:if test="${amsJinList.MBR_GROUP == 2}">checked</c:if> />
								</div>
								<div class="radio-box flex1 right">
									<input type="radio"  name="optGroup_${amsJinList.SEQ}"  id="optGroup_${amsJinList.SEQ}" value="3" style="display:block;width: 80%;height: 0.4rem;vertical-align: middle;margin: 0.2rem;border: solid 1px #c0c0c0;" <c:if test="${amsJinList.MBR_GROUP == 3}">checked</c:if> />
								</div>
								<div class="radio-box flex1 right">
									<input type="checkbox"  name="chkDly_${amsJinList.SEQ}"  id="chkDly_${amsJinList.SEQ}" style="display:block;width: 80%;height: 0.4rem;vertical-align: middle;margin: 0.2rem;" <c:if test="${amsJinList.EXC_JIN_DLY == 1}">checked</c:if> />
								</div>
								
							</div>
							
						 </c:forEach>
						<!-- END Data Loop -->
						
					</div>
				</div>
				
			</div>
			
			
		</div>
			
		<c:if test="${(amsExcList.CLB_GD == 'A') || amsClb.amsExcList == 'B'}">
			<c:if test="${(amsExcList.EXC_GAME == 'N') and ( amsExcList.EXC_TP == '1001' || amsExcList.EXC_TP == '1002') and amsExcList.JIN_EXC_CNT > 6}">
				<div style="text-align: center;margin-top: 0.2rem;">
						<button class="btn-submit" id="btnSave" onclick="fn_gameTodaySave();" style="background-color: red;">${label.自动比赛生成}</button>
				</div>
			</c:if>
		</c:if>
		
		<c:if test="${(loginMbrSq == 20) || (loginMbrSq == 22) || (loginMbrSq == 28) || (loginMbrSq == 29)}">
			<div style="text-align: center;margin-top: 0.2rem;">
					<button class="btn-submit" id="btnSave" onclick="fn_gameTodaySave();" style="background-color: red;">${label.自动比赛生成} (재생성)</button>
			</div>
		</c:if>
		
		<div>
			<br/><br/><br/><br/>
		</div>
		
		<script type="text/javascript">
		
   		function fn_gameTodaySave() {
    		
   			var num = "${excSeqMax}";
			var strMbrsqstr = "";
			var strMbrgroupstr = "";
			var strExcjindlystr = "";
			var intCortcnt = $("#intCortcnt").val();
			var intPartnerbasiccoin = $("#intPartnerbasiccoin").val();
			var intTeambasiccoin = $("#intTeambasiccoin").val();
			var intMbrmingamecnt = $("#intMbrmingamecnt").val();
			

			for(var i=0;i<=num;i++){
				var iMbrsq = $("#txtMbrSq_"+i).val();
				var iMbrgroupstr = $(':radio[name="optGroup_'+i+'"]:checked').val();
				var iExcjindlystr = 0;
				if ($("#chkDly_"+i).is(":checked")) {
					iExcjindlystr = 1;
				}
				if (i==1) {
					strMbrsqstr = iMbrsq;
					strMbrgroupstr = iMbrgroupstr;
					strExcjindlystr = iExcjindlystr; 
				}
				else {
					strMbrsqstr = strMbrsqstr + ',' + iMbrsq;
					strMbrgroupstr = strMbrgroupstr + ',' + iMbrgroupstr;
					strExcjindlystr = strExcjindlystr + ',' + iExcjindlystr; 
				}
			}
   			
   			var intExcsq = "${intExcsq}";
   			var strJobtype = "S";
   			var intClbsq = "${hmeClbsq}";

       		if (!confirm("${label.自动比赛生成吗}?")) {
   				return;
   			}
       		
   			loadingShow();
   			
   			$.ajax({
	 	 		data:{
	 	 			intExcsq : intExcsq
	 	 			,strJobtype : strJobtype
	 	 			,intClbsq : intClbsq
	 	 			,intCortcnt : intCortcnt
	 	 			,intPartnerbasiccoin : intPartnerbasiccoin
	 	 			,intTeambasiccoin : intTeambasiccoin
	 	 			,intMbrmingamecnt : intMbrmingamecnt
	 	 			,strMbrsqstr : strMbrsqstr
	 	 			,strMbrgroupstr : strMbrgroupstr
	 	 			,strExcjindlystr : strExcjindlystr
	 	 		},
				type : "POST",
				url : "/front/bbc/clb/gameTodaySaveNew.htm",
				success : function(data) {
						
						console.log(data);

	    				if (data.MSG_OUT != 'S') {
	    					alert(data.MSG_OUT);
     		    			loadingHide();
	    					return;
	    				}	
	    				
						window.location.href="/front/bbc/clb/gameTody.htm?intClbsq="+intClbsq;
				},
				error : function(xhr, status, e) {
					loadingHide();
					alert("Error : " + status);
				}
  			});
   		}
			
	</script>
	
			<!-- START bottom menu -->
			<c:set var="menuTag" value="1" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		
		<c:set var="helpTag" value="65" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="자동경기 매칭을 하는 화면입니다.<br><br>경기장 몇 코트를 사용하는지 입력하시고, 한 회원의 최소 경기 수를 입력 후 회원을 그룹으로 나누어 경기를 생성하면 각 그룹에 속한 분들끼리 자동으로 경기가 생성됩니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="자동경기 매칭을 하는 화면입니다.<br><br>경기장 몇 코트를 사용하는지 입력하시고, 한 회원의 최소 경기 수를 입력 후 회원을 그룹으로 나누어 경기를 생성하면 각 그룹에 속한 분들끼리 자동으로 경기가 생성됩니다." />
		</c:if>
		
		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 

		<a href="excJin.htm?intExcsq=${intExcsq}" class="r_pg_top show" style="bottom: 65px;background-image: url(/front/bbc/img/btn_home.png);">홈으로</a>
		
		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
	</body>
	
</html>