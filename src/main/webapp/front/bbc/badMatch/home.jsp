<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>배드민턴 대회 관리</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem5.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/headerMatch.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
<style>
.app {
	padding-top: 0;
}

.app-header {
	position: relative;
}

.app-header .logo img {
	width: 0.60rem;
}
.headerTitle {
	width: 5.2rem;
	overflow: initial;
	padding-left: 0.2rem;
	font-size: 0.3rem;
	line-height: 1;
	font-weight: bold;
}


.footer {
    position: fixed;
    width: 100%;
    height: 0.98rem;
    left: 0;
    bottom: 0;
    display: flex;
    flex-flow: row;
    background: #191a1f;
    z-index: 100;
}
.footer .footer-menu {
    flex: 1;
    text-align: center;
    color: #676767;
    font-size: 0.2rem;
    padding-top: 0.1rem;
    box-sizing: border-box;
}
.footer .footer-menu.active {
    color: #01cfb9;
}
.footer .footer-menu {
    flex: 1;
    text-align: center;
    color: #676767;
    font-size: 0.2rem;
    padding-top: 0.1rem;
    box-sizing: border-box;
}
.footer .footer-menu .participate {
    background: url(../img/participate.png) no-repeat center center;
    background-size: 0.44rem 0.44rem;
}
.footer .footer-menu > span {
    display: inline-block;
    width: 0.45rem;
    height: 0.45rem;
}
.footer .footer-menu .club {
    background: url(../img/club.png) no-repeat center center;
    background-size: 0.44rem 0.44rem;
}
.footer .footer-menu > span {
    display: inline-block;
    width: 0.45rem;
    height: 0.45rem;
}
.footer .footer-menu .discuss {
    background: url(../img/participate1.png) no-repeat center center;
    background-size: 0.44rem 0.44rem;
}
.footer .footer-menu > span {
    display: inline-block;
    width: 0.45rem;
    height: 0.45rem;
}
.footer .footer-menu .system {
    background: url(../img/system.png) no-repeat center center;
    background-size: 0.44rem 0.44rem;
}
.footer .footer-menu > span {
    display: inline-block;
    width: 0.45rem;
    height: 0.45rem;
}
.footer .footer-menu .mine {
    background: url(../img/mine.png) no-repeat center center;
    background-size: 0.44rem 0.44rem;
}
.footer .footer-menu > span {
    display: inline-block;
    width: 0.45rem;
    height: 0.45rem;
}
   	@media(min-width:720px) {
 		.footer {
 			width:400px;
 		}
   	}
</style>
<script>
	$(function() {
		//var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="/front/bbc/img/systemLogo2.jpg"></image><p class="headerTitle">배드민턴 대회 관리</p></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="/front/bbc/img/bau-title.jpg" style="width: 4rem;"></image></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
		$("#app").prepend(htm);

		if ("${userInfo.B_LVL}" == "N") {
			messageBox({
				title : '알림',
				message : '회원 가입이 필요합니다.',
				type : 'alert',
				callback : function() {
					window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page4';
				}
			})
		}

		if ("${userInfo.B_LVL}" == "") {
			messageBox({
				title : '알림',
				message : '아래 QR 코드를 꾸욱 눌러 스캔후 가입하세요.<br><br><img src="/uploads/68/2020/08/26/68_material_2020_08_26_14_39_48_16996.jpg" style="width: 4.5rem;"/>',
				type : 'alert',
				callback : function() {
					window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page4';
				}
			})
		}

	});
	wechatShareMsg = "배드민턴 대회관리 시스템 BAUNet의 대회를 조회하세요.";
</script>
<style>
.subBtn {
	padding: 0.2rem 0.1rem;
}
</style>
</head>

<body>
	<div class="app">

        <!--内容区域-->
        <div class="content" id="app">
	        <div style="height: 100%;">
	          <div class="container" style="height: 100%;position: relative;">
	            <h4 class="title">배드민턴 대회</h4>
	            <c:if test="${userInfo.AUTH == 'A' || userInfo.AUTH == 'B'}">
	            <div class="btn-white" onclick="window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page1';" style="position: absolute;top: 0.15rem;right: 0.4rem;">
	            	+ 대회 신규생성
	            </div>
	            </c:if>
	            <div class="tab-header">
	              <div onclick="tab(this, 3)"><p>전체</p></div>
	              <div onclick="tab(this, 1)"><p>진행중</p></div>
	              <div onclick="tab(this, 2)"><p>종료</p></div>
	            </div>
	            
	            <div class="scroll-wrap f-col pb22" id="tab1" style="padding-bottom: 4rem;">
	              <ul class="list-group" id="list-group1">
	              </ul>
	            </div>
	            
	            <div class="scroll-wrap f-col pb22" id="tab2" style="padding-bottom: 4rem;">
	              <ul class="list-group" id="list-group2">
	              </ul>
	            </div>
	            
	            <div class="scroll-wrap f-col pb22" id="tab3" style="padding-bottom: 4rem;">
	              <ul class="list-group" id="list-group3">
	              </ul>
	            </div>
	            
	          </div>
	        </div>
            
        </div>
        
			<div class="footer">
				<div class="footer-menu" onclick="window.location='/front/bbc/exc/excDoList.htm';">
					<span class="participate"></span>
					<p style="color:#cbcbcb;padding-top: 0.05rem;">운동참여</p>
				</div>
				<div class="footer-menu" onclick="window.location='/front/bbc/clb/clb.htm';">
					<span class="club"></span>
					<p style="color:#cbcbcb;padding-top: 0.05rem;">클럽</p>
				</div>
				<div class="footer-menu" onclick="window.location='/front/bbc/badMatch/getPage.htm?pageName=home';">
					<span class="discuss"></span>
					<p style="color:#01cfb9;padding-top: 0.05rem;">민턴대회</p>
				</div>				
				<div class="footer-menu" onclick="window.location='/front/bbc/itd/itd.htm?shopId=68&amp;magazineGroupId=10030';">
					<span class="system"></span>
					<p style="color:#cbcbcb;padding-top: 0.05rem;">시스템소개</p>
				</div>
				<div class="footer-menu" onclick="window.location='/front/bbc/mbr/myPage.htm';">
					<span class="mine"></span>
					<p style="color:#cbcbcb;padding-top: 0.05rem;">My Page</p>
				</div>

			</div>        

	</div>

</body>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
  function tab(el, index) {
    $(".active").removeClass('active');
    $(el).addClass('active');
    if(index == 1) {
        $("#tab1").show();
        $("#tab2").hide();
  	  	$("#tab3").hide();
		getData('0', 1);
    } else if(index == 2) {
        $("#tab1").hide();
        $("#tab2").show();
  	  	$("#tab3").hide();
		getData('1', 2);
  	  getData(1);
    } else if(index == 3) {
        $("#tab1").hide();
        $("#tab2").hide();
  	  	$("#tab3").show();
		getData('2', 3);
    }
  }
  $(function() {
    $(".tab-header p").eq(0).click()
  })
  
</script>
<script type="text/javascript">

// 	$(function() {
// 		getData('0', 3);
// 	});

	function getData(para2, idx) {

		var para1 = "BADMATCH_SELECT";

		var load = loading();
		load.show()

		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para4 : "${loginMbrSq}"
					},
					type : "POST",
					url : "/front/bbc/badMatch/getData.htm",
					success : function(data) {
						
						$("#list-group"+idx).html("");
						
						if (data.list.length != 0) {

							for (var i = 0; i < data.list.length; i++) {
								var htm = '';
								var backImgTag = "";
								var hiddenTag = "";
								
								if (data.list[i].MCH_TYPE == "Y") {
									backImgTag = "border: 1px solid #e42e43;background: url(../img/good.png) no-repeat right 0;background-size: 1.2rem 1.2rem;";	
									hiddenTag = 'style="display:none;"';
									if (data.list[i].STS == 1) {
										backImgTag = "border: 1px solid #e42e43;background: url(../img/good.png) no-repeat right 0;background-size: 1.2rem 1.2rem;background-color:#f4f5f8;";
									}
								}
								else {
									backImgTag = "border: 1px solid #CCCCCC;";
									if (data.list[i].STS == 1) {
										backImgTag = "border: 1px solid #CCCCCC;background-color:#f4f5f8;";
									}
								}

								var matchTitle = "";
								
								if ((data.list[i].MCH_SQ == 5 || data.list[i].MCH_SQ == 14 || data.list[i].MCH_SQ == 17 || data.list[i].MCH_SQ == 18) && data.list[i].MCH_TYPE == "Y") {
									matchTitle = ''
										+ '  <div class="f-row-x-s mt12 mb20">'
										+ '    <div class="f-row">'
										+ '      <p><img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner2/title.jpg" style="width:100%;"></p>'
										+ '    </div>'
										+ '  </div>'
										;
								}
								
								htm = ''
									+ '<li style="margin-top: 0.3rem;padding: 0.2rem;border-radius: 0.2rem;'+backImgTag+'" onclick="window.location.href=\'/front/bbc/badMatch/getPage.htm?pageName=page2&para3='+data.list[i].MCH_SQ+'\';">'
									+ '  <div class="f-row-x-s mt12 mb20">'
									+ '    <div class="f-row">'
									+ '      <p class="fullname">'+data.list[i].CITY+'</p>'
									+ '    </div>'
									+ '    <p class="font20" '+hiddenTag+'>'+data.list[i].REG_DT+'</p>'
									+ '  </div>'
									+ '  <div class="f-row scroll-title" style="margin-bottom: 0.3rem;">'
									+ '    <p class="font24 bold fontColor5">'+data.list[i].MCH_NM+'</p>'
									+ '  </div>'
									+ matchTitle
									+ '  <div class="f-row-x-s mt12 mb20">'
									+ '    <div class="f-row">'
									+ '      <p class="fullname" style="white-space: initial;max-width: 6.5rem;">- 주체자 : '+data.list[i].AGENT+'</p>'
									+ '    </div>'
									+ '  </div>'
									+ '  <div class="f-row-x-s mt12 mb20">'
									+ '    <div class="f-row">'
									+ '      <p class="fullname" style="white-space: initial;max-width: 6.5rem;">- 담당자 : '+data.list[i].CONT_NM+'</p>'
									+ '    </div>'
									+ '  </div>'
									+ '  <div class="f-row-x-s mt12 mb20">'
									+ '    <div class="f-row">'
									+ '      <p class="fullname" style="white-space: initial;max-width: 6.5rem;">- 대회시간 : '+data.list[i].MCH_DT+' '+data.list[i].MCH_TM+'</p>'
									+ '    </div>'
									+ '  </div>'
									+ '  <div class="f-row-x-s mt12">'
									+ '    <div class="f-row">'
									+ '      <p class="font24 bold '+data.list[i].STSTAG+' mr6">['+data.list[i].STSNM+'] </p>'
									+ '    </div>'
									+ '    <div>'
// 									+ '      <i class="fourDPlex icon-schedule fontColor5"></i>'
									+ '      <span class="tab-img" style="font-size: 0.3rem;"><img src="/front/bbc/img/xfn-friend-met.png" style="height: 0.35rem;border: 0;margin-bottom: 0;">&nbsp;'+data.list[i].CNT+'</span>'
									+ '    </div>'
									+ '  </div>'
									+ '</li>'							

								$("#list-group"+idx).append(htm);

							}
						} else {
							$("#list-group"+idx).html("");
							
							var htm = '';
							
							htm = ''
								+ '<li style="margin-top: 0.3rem;padding: 0.2rem;border: 1px solid #CCCCCC;border-radius: 0.2rem;">'
								+ '  <div class="f-row scroll-title" style="margin-bottom: 0;">'
								+ '    <p class="font24 bold fontColor5" style="width:100%;text-align:center;">데이터가 없습니다.</p>'
								+ '  </div>'
								+ '</li>';
							
							$("#list-group"+idx).append(htm);
						}
						load.hide();

					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}
	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%> 
</html>
