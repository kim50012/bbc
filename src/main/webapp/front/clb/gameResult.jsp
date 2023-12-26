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
		<title>${label.比赛结果}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<link rel="stylesheet" type="text/css" href="../css/jquery.typeahead.css"/>
		
		<script src="../js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<%@ include file="/front/bbc/inc/remjs.jsp"%> 
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/jquery.typeahead.js" type="text/javascript" charset="utf-8"></script>
		
	</head>
	<body style="background:#fff;text-align:center;" > <!-- onload="fn_GameSave('S');"> -->
			<div class="competition">
				<div class="party float">
					<div class="competition-red">
					 	<p class="fullname float">${label.姓名}</p>
					 	<p class="fraction float">${label.分数}</p>
					</div>
					<div class="name float">
<!-- 						<input class="name-input" style="margin-bottom:0.02rem;" type="text" name="" id="" value="" placeholder="请输入"/ > -->
<!-- 						<input class="name-input" style="margin-bottom:0rem;" type="text" name="" id="" value="" placeholder="请输入"/> -->
												
				        <div class="typeahead__container">
				            <div class="typeahead__field">
					            <span class="typeahead__query">
					                <input id="strMbrnma1"
					                       name="q"
					                       type="search"
					                       autofocus
					                       autocomplete="off"
					                       placeholder="${label.请输入}"
					                       value="${atrMtc.MBR_NM_A1}"
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.69rem;"
					                       readonly="readonly">
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
					                       value="${atrMtc.MBR_NM_A2}"
					                       class="name-input" style="margin-bottom:0rem;height: 0.69rem;"
					                       readonly="readonly">
					            </span>
				            </div>
				        </div>
				        
					</div>
					<div class="score float">
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="intAtemscr" id="intAtemscr" value="${atrMtc.A_TEM_SCR}" onchange="fn_onchange();" placeholder="${label.请输入}" readonly="readonly"/>
					</div>
				</div>
				<div class="vs float">vs
				</div>
				<div class="another-party float">
					<div class="competition-blue">
						<p class="fraction float">${label.分数}</p>
					 	<p class="fullname1 float">${label.姓名}</p>
					</div>
					<div class="score float">
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="intBtemscr" id="intBtemscr" value="${atrMtc.B_TEM_SCR}" onchange="fn_onchange();" placeholder="${label.请输入}" readonly="readonly"/>
					</div>
					<div class="name float">
				        <div class="typeahead__container">
				            <div class="typeahead__field">
					            <span class="typeahead__query">
					                <input id="strMbrnmb1"
					                       name="q"
					                       type="search"
					                       autofocus
					                       autocomplete="off"
					                       placeholder="${label.请输入}"
					                       value="${atrMtc.MBR_NM_B1}"
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.69rem;"
					                       readonly="readonly">
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
					                       value="${atrMtc.MBR_NM_B2}"
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.69rem;"
					                       readonly="readonly">
					            </span>
				            </div>
				        </div>
					</div>
				</div>
			</div>
			<div class="competition1">
				<div class="party float">
					<div class="competition-red">
					 	<p class="fullname float">${label.现在}BB Coin</p>
					 	<p class="fraction float">${label.让分}</p>
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;"type="text" name="intMtcclbbbca1" id="intMtcclbbbca1"  value="${atrMtc.MTC_CLB_BBC_A1}" readonly="readonly" />						
						<input class="name-input" style="margin-bottom:0rem;" type="text" name="intMtcclbbbca2" id="intMtcclbbbca2"  value="${atrMtc.MTC_CLB_BBC_A2}" readonly="readonly"/>
					</div>
					<div class="score float">
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="CAL_HND_CAP_A1" id="CAL_HND_CAP_A1" value="${atrMtc.CAL_HND_CAP_A}" readonly="readonly" />
					</div>
				</div>
				<div class="vs float">vs
				</div>
				<div class="another-party float">
					<div class="competition-blue">
						<p class="fraction float">${label.让分}</p>
					 	<p class="fullname1 float">${label.现在}BB Coin</p>
					</div>
					<div class="score float">
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="CAL_HND_CAP_B1" id="CAL_HND_CAP_B1" value="${atrMtc.CAL_HND_CAP_B}" readonly="readonly" />
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;" type="text" name="intMtcclbbbcb1" id="intMtcclbbbcb1" value="${atrMtc.MTC_CLB_BBC_B1}" readonly="readonly" />						
						<input class="name-input" style="margin-bottom:0rem;" type="text" name="intMtcclbbbcb2" id="intMtcclbbbcb2" value="${atrMtc.MTC_CLB_BBC_B2}" readonly="readonly"/>
					</div>
				</div>
			</div>
			<div class="competition2">
				<div class="party3" style="width:100%;height:2.18rem;">
					<div class="competition-green" style="width:100%;height:0.69rem;border-bottom:1px solid #d2d2d2;background:#f9f9ff;">
					 	<p class="fullname float">${label.最终}BB Coin</p>
					 	<p class="fraction float" style="width:2.98rem;">${label.比赛结果}（${label.加权值}）</p>
					 	<p class="fullname1 float">${label.最终}BB Coin</p>
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;font-size: 0.5rem;" type="text" name="BBC_A1" id="BBC_A1" value="${atrMtc.BBC_A1}" readonly="readonly" />						
						<input class="name-input" style="margin-bottom:0rem;font-size: 0.5rem;" type="text" name="BBC_A2" id="BBC_A2" value="${atrMtc.BBC_A2}" readonly="readonly"/>
					</div>
					<div class="score float" >
						<input class="score-input red" style="width:2.72rem;font-size:0.3rem;" type="text" name="WEIGHT" id="WEIGHT" value="${atrMtc.WEIGHT_BBC}%" readonly="readonly" />
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;font-size: 0.5rem;" type="text" name="BBC_B1" id="BBC_B1" value="${atrMtc.BBC_B1}" readonly="readonly" />						
						<input class="name-input" style="margin-bottom:0rem;font-size: 0.5rem;" type="text" name="BBC_B2" id="BBC_B2" value="${atrMtc.BBC_B2}" readonly="readonly"/>
					</div>
				</div>
			</div>	


			<input type="hidden" id="intMbrsqa1" value="${atrMtc.MBR_SQ_A1}"/>
			<input type="hidden" id="intMbrsqa2" value="${atrMtc.MBR_SQ_A2}"/>
			<input type="hidden" id="intMbrsqb1" value="${atrMtc.MBR_SQ_B1}"/>
			<input type="hidden" id="intMbrsqb2" value="${atrMtc.MBR_SQ_B2}"/>


			
<!-- 			<div style="text-align: center;margin-top: 0.2rem;"> -->
<%-- 					<button class="btn-submit" id="btnCal" onclick="fn_GameSave('S');" style="background-color: #c0c0c0;">${label.比赛结果查看} (${label.保存})</button> --%>
<%-- 					<button class="btn-submit" id="btnSave" onclick="fn_GameSave('U');" style="display:none;background-color: red;">${label.比赛结果保存}</button> --%>
<%-- 					<button class="btn-submit" id="btnMsg" onclick="window.location='gameReg.htm?intClbsq=${intClbsq}';" style="display:none;"></button> --%>
<!-- 			</div> -->
			
<!-- 			<div style="text-align: center;margin-top: 0.3rem;"> -->
<%-- 					<button class="btn-submit" id="btnMsg" onclick="fn_GameDel('D');" style="background-color: #c0c0c0;">${label.比赛结果}${label.删除}</button> --%>
<!-- 			</div> -->
	

<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
	<style>
	.typeahead__list, .typeahead__dropdown {min-width: 300px;}
	</style>

<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->

		<%@ include file="/front/bbc/inc/returnPage.jsp"%>

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
	</body>
</html>