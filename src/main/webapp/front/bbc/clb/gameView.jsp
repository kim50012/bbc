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
		<title>${label.修改比赛结果}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<link rel="stylesheet" type="text/css" href="../css/jquery.typeahead.css"/>
		
		<script src="../js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<%@ include file="/front/bbc/inc/remjs.jsp"%> 
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/jquery.typeahead.js" type="text/javascript" charset="utf-8"></script>
		
	</head>
	<body style="background:#fff;text-align:center;width:100%;" > <!-- onload="fn_GameSave('S');"> -->
	
	
			<div style="text-align: center;padding-top: 0.4rem;padding-bottom: 0.2rem;">
					<button class="btn-submit" id="btnCal" onclick="fn_GameSave('S');" style="background-color: #c0c0c0;">${label.比赛结果查看} (${label.保存})</button>
					<button class="btn-submit" id="btnSave" onclick="fn_GameSave('U');" style="display:none;background-color: red;">${label.比赛结果保存}</button>
					<button class="btn-submit" id="btnMsg" onclick="window.location='gameReg.htm?intClbsq=${intClbsq}';" style="display:none;"></button>
			</div>
			
	
			<div class="competition" style="margin: 0 auto;">
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
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.69rem;">
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
					                       class="name-input" style="margin-bottom:0rem;height: 0.69rem;">
					            </span>
				            </div>
				        </div>
				        
					</div>
					<div class="score float">
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="intAtemscr" id="intAtemscr" value="${atrMtc.A_TEM_SCR}" onchange="fn_onchange();" placeholder="${label.请输入}"/ >
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
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="intBtemscr" id="intBtemscr" value="${atrMtc.B_TEM_SCR}" onchange="fn_onchange();" placeholder="${label.请输入}"/ >
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
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.69rem;">
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
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.69rem;">
					            </span>
				            </div>
				        </div>
					</div>
				</div>
			</div>
			<div class="competition1" style="margin: 0 auto;display:no<c:if test="${(loginMbrSq == '20') || loginMbrSq == '20'}">1</c:if>ne;">
				<div class="party float">
					<div class="competition-red">
					 	<p class="fullname float">${label.现在}BB Coin</p>
					 	<p class="fraction float">${label.让分}</p>
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;"type="text" name="intMtcclbbbca1" id="intMtcclbbbca1"  value="${atrMtc.MTC_CLB_BBC_A1}" readonly="readonly"/ >						
						<input class="name-input" style="margin-bottom:0rem;" type="text" name="intMtcclbbbca2" id="intMtcclbbbca2"  value="${atrMtc.MTC_CLB_BBC_A2}" readonly="readonly"/>
					</div>
					<div class="score float">
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="CAL_HND_CAP_A1" id="CAL_HND_CAP_A1" value="${atrMtc.CAL_HND_CAP_A}" readonly="readonly"/ >
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
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="CAL_HND_CAP_B1" id="CAL_HND_CAP_B1" value="${atrMtc.CAL_HND_CAP_B}" readonly="readonly"/ >
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;" type="text" name="intMtcclbbbcb1" id="intMtcclbbbcb1" value="${atrMtc.MTC_CLB_BBC_B1}" readonly="readonly"/ >						
						<input class="name-input" style="margin-bottom:0rem;" type="text" name="intMtcclbbbcb2" id="intMtcclbbbcb2" value="${atrMtc.MTC_CLB_BBC_B2}" readonly="readonly"/>
					</div>
				</div>
			</div>
			<div class="competition2" style="margin: 0 auto;">
				<div class="party3" style="width:100%;height:2.18rem;">
					<div class="competition-green" style="width:100%;height:0.69rem;border-bottom:1px solid #d2d2d2;background:#f9f9ff;">
					 	<p class="fullname float">${label.最终}BB Coin</p>
					 	<p class="fraction float" style="width:2.98rem;">${label.比赛结果}（${label.加权值}）</p>
					 	<p class="fullname1 float">${label.最终}BB Coin</p>
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;font-size: 0.5rem;" type="text" name="BBC_A1" id="BBC_A1" value="${atrMtc.BBC_A1}" readonly="readonly"/ >						
						<input class="name-input" style="margin-bottom:0rem;font-size: 0.5rem;" type="text" name="BBC_A2" id="BBC_A2" value="${atrMtc.BBC_A2}" readonly="readonly"/>
					</div>
					<div class="score float" >
						<input class="score-input red" style="width:2.72rem;font-size:0.3rem;" type="text" name="WEIGHT" id="WEIGHT" value="${atrMtc.WEIGHT_BBC}%" readonly="readonly"/ >
					</div>
					<div class="name float">
						<input class="name-input" style="margin-bottom:0.02rem;font-size: 0.5rem;" type="text" name="BBC_B1" id="BBC_B1" value="${atrMtc.BBC_B1}" readonly="readonly"/ >						
						<input class="name-input" style="margin-bottom:0rem;font-size: 0.5rem;" type="text" name="BBC_B2" id="BBC_B2" value="${atrMtc.BBC_B2}" readonly="readonly"/>
					</div>
				</div>
			</div>	
			<div class="competition2" style="height:1.5rem;margin: 0 auto;">
				<div class="party3" style="width:100%;height:2.18rem;">
					<div class="competition-green" style="width:100%;height:0.69rem;border-bottom:1px solid #d2d2d2;background:#f9f9ff;">
					 	<p class="fullname float" style="width:50%;">1 Team Name</p>
					 	<p class="fullname1 float" style="width:50%;">2 Team Name</p>
					</div>
					<div class="name float" style="width:47.5%;">
						<input class="name-input" style="margin-bottom:0.02rem;font-size: 0.5rem;width:100%;" type="text" name="teamA" id="teamA" value="${atrMtc.A_TEAM_NM}">
					</div>
					<div class="name float" style="width:47.5%;">
						<input class="name-input" style="margin-bottom:0.02rem;font-size: 0.5rem;width:100%;" type="text" name="teamB" id="teamB" value="${atrMtc.B_TEAM_NM}">
					</div>
				</div>
			</div>	


			<input type="hidden" id="intMbrsqa1" value="${atrMtc.MBR_SQ_A1}"/>
			<input type="hidden" id="intMbrsqa2" value="${atrMtc.MBR_SQ_A2}"/>
			<input type="hidden" id="intMbrsqb1" value="${atrMtc.MBR_SQ_B1}"/>
			<input type="hidden" id="intMbrsqb2" value="${atrMtc.MBR_SQ_B2}"/>


			
			<div style="text-align: center;margin-top: 0.3rem;">
					<button class="btn-submit" id="btnMsg" onclick="fn_GameDel('D');" style="background-color: #c0c0c0;">${label.比赛结果}${label.删除}</button>
			</div>
	

<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
	<style>
	.typeahead__list, .typeahead__dropdown {min-width: 300px;}
	</style>

    <script>

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
            	$("#intMtcclbbbca1").val(item.bbc);
            	fn_onchange();
            	$("#strMbrnma2").focus();
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
            	$("#intMtcclbbbca2").val(item.bbc);
            	fn_onchange();
            	$("#strMbrnmb1").focus();
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
            	$("#intMtcclbbbcb1").val(item.bbc);
            	fn_onchange();
            	$("#strMbrnmb2").focus();
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
            	$("#intMtcclbbbcb2").val(item.bbc);
            	fn_onchange();
            	$("#intAtemscr").focus();
            }
        },
		selector: {
			list: "typeahead__list2",
		},
        debug: true
    });

    	function fn_onchange() {
			$('#btnCal').show();
			$('#btnSave').hide();
			$('#btnMsg').hide();
    	}

		function fn_GameSave(strJobtype) {

 			var intClbsq= "${intClbsq}";	  // 클럽시퀀스
 			var intMtcsq= "${intMtcsq}";	  // 클럽시퀀스
			var intMbrsqa1= $('#intMbrsqa1').val();			// [경기선수] 선수 A1
			var intMtcclbbbca1= $('#intMtcclbbbca1').val();	// [경기선수] 경기시코인 A1
			var intMbrsqa2= $('#intMbrsqa2').val();			// [경기선수] 선수 A2
			var intMtcclbbbca2= $('#intMtcclbbbca2').val();	// [경기선수] 경기시코인 A2
			var intMbrsqb1= $('#intMbrsqb1').val();			// [경기선수] 선수 B1
			var intMtcclbbbcb1= $('#intMtcclbbbcb1').val();	// [경기선수] 경기시코인 B1
			var intMbrsqb2= $('#intMbrsqb2').val();			// [경기선수] 선수 B2
			var intMtcclbbbcb2= $('#intMtcclbbbcb2').val();	// [경기선수] 경기시코인 B2
			var intAtemscr= $('#intAtemscr').val();			// [경기선수] A팀 점수
			var intBtemscr= $('#intBtemscr').val();			// [경기선수] B팀 점수
			
			var strMbrnma1= $('#strMbrnma1').val();			// [경기선수] 선수 이름 A1
			var strMbrnma2= $('#strMbrnma2').val();			// [경기선수] 선수 이름 A2
			var strMbrnmb1= $('#strMbrnmb1').val();			// [경기선수] 선수 이름 B1
			var strMbrnmb2= $('#strMbrnmb2').val();			// [경기선수] 선수 이름 B2

			var strHmenm= $('#teamA').val();			// 
			var strAwynm= $('#teamB').val();			// 
			
			if ((strMbrnma1 == "") || (intMbrsqa1 == "")) {
				alert("${label.请输入姓名}");
				$('#strMbrnma1').val("");
				$('#intMbrsqa1').val("");
				$('#intMbrsqa1').focus();
				return;
			}
			if ((strMbrnma2 == "") || (intMbrsqa2 == "")) {
				alert("${label.请输入姓名}");
				$('#strMbrnma2').val("");
				$('#intMbrsqa2').val("");
				$('#intMbrsqa2').focus();
				return;
			}
			if ((strMbrnmb1 == "") || (intMbrsqb1 == "")) {
				alert("${label.请输入姓名}");
				$('#strMbrnmb1').val("");
				$('#intMbrsqb1').val("");
				$('#intMbrsqb1').focus();
				return;
			}
			if ((strMbrnmb2 == "") || (intMbrsqb2 == "")) {
				alert("${label.请输入姓名}");
				$('#strMbrnmb2').val("");
				$('#intMbrsqb2').val("");
				$('#intMbrsqb2').focus();
				return;
			}
			
			if (
					(intMbrsqa1 == intMbrsqa2) || (intMbrsqa1 == intMbrsqb1) || (intMbrsqa1 == intMbrsqb2) ||
					(intMbrsqa2 == intMbrsqb1) || (intMbrsqa2 == intMbrsqb2) || (intMbrsqb1 == intMbrsqb2)
				) {
				alert("${label.姓名重复了}");
				return;
			}
			
			if (intAtemscr == "") {
				alert("${label.请输入分数}");
				$('#intAtemscr').focus();
				return;
			}
			if (intBtemscr == "") {
				alert("${label.请输入分数}");
				$('#intBtemscr').focus();
				return;
			}
			
			loadingShow();
			
			 $.ajax({
			 	 		data:{
			 	 			intClbsq : intClbsq
			 	 			,intMbrsqa1 : intMbrsqa1
			 	 			,intMtcclbbbca1 : intMtcclbbbca1
			 	 			,intMbrsqa2 : intMbrsqa2
			 	 			,intMtcclbbbca2 : intMtcclbbbca2
			 	 			,intMbrsqb1 : intMbrsqb1
			 	 			,intMtcclbbbcb1 : intMtcclbbbcb1
			 	 			,intMbrsqb2 : intMbrsqb2
			 	 			,intMtcclbbbcb2 : intMtcclbbbcb2
			 	 			,intAtemscr : intAtemscr
			 	 			,intBtemscr : intBtemscr
			 	 			,strJobtype : strJobtype
			 	 			,intMtcsq : intMtcsq
			 	 			,strHmenm : strHmenm
			 	 			,strAwynm : strAwynm
			 	 		},
					type : "POST",
					url : "/front/bbc/clb/gameUpdate.htm",
					success : function(data) {
						//alert(data);
						//var list = data.data || [];
						if(data.MSG_OUT=="S"){
							$('#WEIGHT').val(data.WEIGHT+"%");
							$('#CAL_HND_CAP_A1').val(data.CAL_HND_CAP_A1);
							$('#BBC_A1').val(data.BBC_A1);
							$('#BBC_A2').val(data.BBC_A2);
							$('#CAL_HND_CAP_B1').val(data.CAL_HND_CAP_B1);
							$('#BBC_B1').val(data.BBC_B1);
							$('#BBC_B2').val(data.BBC_B2);
							
							if (strJobtype == "S") {

								if (data.BBC_A1 > 0) {
									$('#BBC_A1').addClass("red");
								}
								if (data.BBC_A2 > 0) {
									$('#BBC_A2').addClass("red");
								}
								if (data.BBC_B1 > 0) {
									$('#BBC_B1').addClass("red");
								}
								if (data.BBC_B2 > 0) {
									$('#BBC_B2').addClass("red");
								}

								if (data.BBC_A1 <= 0) {
									$('#BBC_A1').removeClass("red");
								}
								if (data.BBC_A2 <= 0) {
									$('#BBC_A2').removeClass("red");
								}
								if (data.BBC_B1 <= 0) {
									$('#BBC_B1').removeClass("red");
								}
								if (data.BBC_B2 <= 0) {
									$('#BBC_B2').removeClass("red");
								}
								
								$('#btnCal').hide();
								$('#btnMsg').hide();
								$('#btnSave').show();
								loadingHide();
							}
							else {
								$('#btnCal').hide();
								$('#btnSave').hide();
								if(intMbrsqa1=="${loginMbrSq}" || intMbrsqa2 == "${loginMbrSq}") {
									if (data.BBC_A1 > data.BBC_B1) {
										$('#btnMsg').html("${label.恭喜恭喜} + "+data.BBC_A1+"${label.分}");	
									}
									else {
										$('#btnMsg').html("${label.保存成功了}.");	
									}
								} else if(intMbrsqb1=="${loginMbrSq}" || intMbrsqb2 == "${loginMbrSq}") {
									if (data.BBC_A1 < data.BBC_B1) {
										$('#btnMsg').html("${label.恭喜恭喜} + "+data.BBC_B1+"${label.分}");	
									}
									else {
										$('#btnMsg').html("${label.保存成功了}.");	
									}
								} else {
									$('#btnMsg').html("${label.保存成功了}.");	
								}
								$('#btnMsg').html();
								$('#btnMsg').show();
			     				alert("${label.保存成功了}");
			     				//window.location="/front/bbc/clb/gameReg.htm?intClbsq=${intClbsq}";
			     				

								if(intMbrsqa1=="${loginMbrSq}" || intMbrsqa2 == "${loginMbrSq}" || intMbrsqb1 == "${loginMbrSq}" || intMbrsqb2 == "${loginMbrSq}") {
									window.location="/front/bbc/clb/gameTody.htm?intClbsq=${intClbsq}&intMbrsq=${loginMbrSq}";
								} else {
									window.location="/front/bbc/clb/gameTody.htm?intClbsq=${intClbsq}";	
								}
							}
							
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
		


		function fn_GameDel(strJobtype) {

 			var intClbsq= "${intClbsq}";	  // 클럽시퀀스
 			var intMtcsq= "${intMtcsq}";	  // 클럽시퀀스

     		if (!confirm("${label.确认删除吗}?")) {
 				return;
 			}
     		
 			loadingShow();
     		
			 $.ajax({
			 	 		data:{
			 	 			intClbsq : intClbsq
			 	 			,strJobtype : strJobtype
			 	 			,intMtcsq : intMtcsq
			 	 		},
					type : "POST",
					url : "/front/bbc/clb/gameDel.htm",
					success : function(data) {
						//alert(data);
						//var list = data.data || [];
						if(data.MSG_OUT=="S"){
		     				window.location="/front/bbc/clb/gameTody.htm?intClbsq=${intClbsq}&datFrdt=${datFrdt}&datTodt=${datTodt}";
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

<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------- -->

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