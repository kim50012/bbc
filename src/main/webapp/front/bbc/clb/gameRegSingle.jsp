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
		<title>${label.输入比赛结果}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<link rel="stylesheet" type="text/css" href="../css/jquery.typeahead.css"/>
		
		<script src="../js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<%@ include file="/front/bbc/inc/remjs.jsp"%> 
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/jquery.typeahead.js" type="text/javascript" charset="utf-8"></script>
		
	</head>
	<body style="background:#fff;text-align:center;">
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
					                       value="${loginNickName}"
					                       class="name-input" style="margin-bottom:0.02rem;height: 1.42rem;">
					            </span>
				            </div>
				        </div>
				        
					</div>
					<div class="score float">
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="intAtemscr" id="intAtemscr" value="" onchange="fn_onchange();" placeholder="${label.请输入}"/ >
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
						<input class="score-input" type="text" style="font-size: 0.42rem;" name="intBtemscr" id="intBtemscr" value="" onchange="fn_onchange();" placeholder="${label.请输入}"/ >
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
					                       class="name-input" style="margin-bottom:0.02rem;height: 1.42rem;">
					            </span>
				            </div>
				        </div>				

					</div>
				</div>
			</div>


			<input type="hidden" id="intMbrsqa1" value="${loginMbrSq}"/>
			<input type="hidden" id="intMbrsqa2"/>
			<input type="hidden" id="intMbrsqb1"/>
			<input type="hidden" id="intMbrsqb2"/>


			
			<div style="text-align: center;margin-top: 0.2rem;">
					<button class="btn-submit" id="btnSave" onclick="fn_GameSave('I');" style="background-color: red;">${label.比赛结果保存}</button>
					<button class="btn-submit" id="btnMsg" onclick="window.location='gameReg.htm?intClbsq=${intClbsq}';" style="display:none;"></button>
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
            	$("#intAtemscr").focus();
            }
        },
		selector: {
			list: "typeahead__list2",
		},
        debug: true
    });

    	function fn_onchange() {
			$('#btnMsg').hide();
    	}

		function fn_GameSave(strJobtype) {
			
 			var intClbsq= "${intClbsq}";	  // 클럽시퀀스
			var intMbrsqa1= $('#intMbrsqa1').val();			// [경기선수] 선수 A1
			var intMtcclbbbca1= $('#intMtcclbbbca1').val();	// [경기선수] 경기시코인 A1
			var intMbrsqb1= $('#intMbrsqb1').val();			// [경기선수] 선수 B1
			var intMtcclbbbcb1= $('#intMtcclbbbcb1').val();	// [경기선수] 경기시코인 B1
			var intAtemscr= $('#intAtemscr').val();			// [경기선수] A팀 점수
			var intBtemscr= $('#intBtemscr').val();			// [경기선수] B팀 점수
			
			var strMbrnma1= $('#strMbrnma1').val();			// [경기선수] 선수 이름 A1
			var strMbrnmb1= $('#strMbrnmb1').val();			// [경기선수] 선수 이름 B1

			if ((strMbrnma1 == "") || (intMbrsqa1 == "")) {
				alert("${label.请输入姓名}");
				$('#strMbrnma1').val("");
				$('#intMbrsqa1').val("");
				$('#intMbrsqa1').focus();
				return;
			}
			if ((strMbrnmb1 == "") || (intMbrsqb1 == "")) {
				alert("${label.请输入姓名}");
				$('#strMbrnmb1').val("");
				$('#intMbrsqb1').val("");
				$('#intMbrsqb1').focus();
				return;
			}
			
			if (intMbrsqa1 == intMbrsqb1) {
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
			 	 			,intMbrsqb1 : intMbrsqb1
			 	 			,intMtcclbbbcb1 : intMtcclbbbcb1
			 	 			,intAtemscr : intAtemscr
			 	 			,intBtemscr : intBtemscr
			 	 			,strJobtype : strJobtype
			 	 			,strMbrnma1 : strMbrnma1
			 	 			,strMbrnmb1 : strMbrnmb1
			 	 			,strJobtype : strJobtype
			 	 		},
					type : "POST",
					url : "/front/bbc/clb/gameSaveSingles.htm",
					success : function(data) {
						//alert(data);
						//var list = data.data || [];
						if(data.MSG_OUT=="S"){

		     				alert("${label.保存成功了}");
		     				window.location="/front/bbc/clb/gameRegSingle.htm?intClbsq=${intClbsq}";
							
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
		
		<c:set var="helpTag" value="15" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="단식 경기 결과를 등록하는 화면입니다.<BR><BR>단식은 자신을 기준으로 상위 2단계 하위 2단계의 상대와 경기를 하였을 경우에만 순위에 반영되며 그 이외 경기는 순위와 상관없이 경기 기록에만 등록됩니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是登记单打的比赛结果。<br><br>单打的话,以自己为基准，只能在排名前第二段和后二段的对手比赛时生效。" />
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