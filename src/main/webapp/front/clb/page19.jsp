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
<title>초심자 예절, 안전 필기 시험</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
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
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		$("#appPage2").prepend(htm)
		$(".app-header")
				.click(
						function() {
							window.location.href = '/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
						});
	});
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
        <div class="content" id="appPage2">
          <div class="scroll-wrap refresh-wrap">
          
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="1" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;" id="reqHd${req }">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">시스템부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자들의 경기 결과는 기분 상하지 않도록 시스템에 입력하지 않고 좀 더 실력을 쌓은 후에 입력한다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue"id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자라 하더라도 모든 경기결과를 입력해야 합니다.<br>승급전 및 교류전 등 파트너 선정의 데이터로 활용되기 때문입니다.<br>선별하여 입력하는 경우 때에 따라 상대방의 기분을 상하게 할 수 있으니 모든 경기를 입력하는 습관을 갖는게 좋습니다.<br>그리고 초심자 분들은 시스템에 자주 접속해서 회원분들의 이름을 빨리 숙지해 주시기 바랍니다^^</div>
                  </div>
                </div>
              </div>

            </div>
            
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="2" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">시스템부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">잊고 있던 하루 전날의 경기 결과는 과감히 입력하지 않는다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">시스템 규정상 하루가 지난 경기는 입력하지 않습니다. 최대한 당일 입력하시는 것이 좋습니다.</div>
                  </div>
                </div>
              </div>

            </div>
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="3" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">시스템 및 예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자들끼리의 경기시 가장 잘치는 사람이 각각 파트너를 지정해주며, 기타 사항에도 늘 잘치는 사람 말을 따르는 것이 좋다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	초심자분들의 실력은 종이 한장 차이 입니다.<br>  
						어느 누가 실력이 가장 좋다고 판단이 어려우니 서로 합의하 정하는 것이 좋습니다.<br>
					</div>
                  </div>
                </div>
              </div>

            </div>
            
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="4" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">시스템 및 예절 부분</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">사석(뒤풀이 등)에서 같은 초심자의 경우라도 조금 더 잘치는 내가 친구의 잘못된 플레이는 기분이 상하더라도 알려주고 가르쳐 준다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	초심자들의 실력은 종이 한장 차이 입니다.<br>
                    	특히 사석(뒷풀이)에서 비슷한 실력의 파트너에게 플레이에 대한 지적 보다는 화이팅을 하는 것이 예의 입니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="5" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">안전부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자간의 경기 시 내가 후위에 있고 득점 할 수 있는 짧은 콕이 온 경우 무리하게 득점하려고 하지 말고 앞 사람의 움직임을 보며 플레이를 하여야 한다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	앞사람은 뒷 사람을 볼 수 없어 운이 없는 경우 큰 부상이 발생할 수 있습니다. 항상 후위에 있는 사람이 앞사람과 충돌 상황을 판단하여 피해 주어야 합니다.<br> 
						아무리 득점을 할 수 있는 좋은 기회라 하더라도 앞사람과 충돌이 예상 될 경우에는 후위 사람이 무조건 피해 주어야 합니다.<br>
						안전에 대한 플레이는 항상 주의하여야 합니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="6" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자들 경기 시 남여 파트너의 경우 혼복대형(여자 앞에 남자 뒤에)으로 플레이 하는 것이 좋으며 비슷한 실력의 사람끼리 맞추어 치는 것이 좋다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	초심자들의 종이 한장 차이입니다.<br>  
						남여 혼복 대형보다는 로테이션 연습을 할 수 있는 대형이 좋으며 여러 분들과 자유로이 많은 플레이를 하는 것이 중요합니다.<br>
						초심자에서 승급하기 전까지 승패는 큰 의미가 없습니다 ^^ 
					</div>
                  </div>
                </div>
              </div>

            </div>
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="7" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자분들은 경기이사님의 판단에 따라 레슨이 필요할 경우 레슨을 수강해야만 한다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	배드민턴은 가장 중요한게 자세와 폼 입니다. <br>
                    	가장 기본인 하이클리어가 어느정도 되어야 게임에 들어갈 수 있습니다. <br>
                    	레슨을 통해 정확한 자세와 폼을 익힐 경우 보다 재미난 배드민턴 경기를 즐길 수 있습니다. 
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="8" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자는 기본기 습득이  중요 하므로 승리 여부에 집착하기 보다 경기를 통해 다양한 기술을 체득할 수 있도록 경기에 임하는 것이 좋다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	초심자들의 실력은 종이 한장 차이 입니다.<br>
                    	초심자를 탈출할 D조 정도 실력(300~450)은 되어야, 배드민턴의 기본인 스텝,하이클리어,드롭,헤어핀 등 모두를 어느정도 구사할 수 있습니다.<br>
                    	특정 약점 혹은 특정 기술만 익혀 승리만 한다면 실력의 느는 한계에 부딪칩니다.<br>
                    	D조가 되기까지는 초심자는 승부에 연연해 하지 마시고, 모든 면에서 골고루 연습하고 훈련해야 합니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="9" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자와 고수가 함께하는 경기 중 고수가 받지 못하는 내 뒤로 넘어가는 공은 내가 어떻게는 치려고 노력을 해야한다.(혹은 엔드라인이 넘어 갔는지 확인하기 위에 뒤를 돌아본다.)</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	초심자가 생각하는 것 보다 고수들은 빠르며 모든 볼을 칠 수 있습니다. 내가 치려고 뒤로 돌아보는 순간 고수가 받아친 콕에 눈이 맞아 실명할 수 있습니다.<br>
                    	초심자와의 경기에도 마찬가지이며 나의 뒤로 넘어가는 볼은 절대 뒤를 돌아 쳐다 보지 않아야 합니다.<br>  
						* 굉장히 위험하고 조심스러운 상황이므로 특히 주의 바랍니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="10" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기 시 파트너가 실수를 하더라도 이해해주며, 잘한 점은 적극 칭찬하고 화이팅을 하여 최상의 경기력을 이끌어 내는 것이 좋다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	파터너쉽은 복식에서 가장 중요한 부분입니다.<br>
                    	누구와 편이 되어도 항상 열심히 치며, 항상 같이 치고 싶은 최상의 파트너가 될 수 있도록 매너인이 됩시다 ~<br>
                    	단, 너무 큰 리엑션은 상대편에게 예의에 어긋나므로 주의해야 한다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="11" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">안전부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기가 1점 남았을때 발이 쥐가 났다(삐끗) 하더라도, 큰 무리가 없다면 경기를 마무리 하는 것이 좋다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	경기가 1점 남았더라도 몸에 이상이 있을 경우 경기를 중단해야 합니다.<br> 
						큰 부상으로 이어질수 있습니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="12" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">${amsClb.CLB_NM} 회원들과의 친목교류 및 신속한 적응을 위해 가급적 월례회는 참가해야 하며, 기타 친목을 위한 뒷풀이도 참여하는 것이 좋다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	월례회는 매월 첫째주 금요일 정규 운동 시간에 진행합니다. 운동시간 끝나기 5분전~! 기억 해주세요~<br>
                    	뒷풀이는 참석하면 친목도모에 좋으나 강요하지는 않습니다.<br>참석 후에는 너무 많은 음주와 늦은 귀가만 조심하시면 될거 같네요~<br> 
						재미있는 분위기의 뒷풀이 후, 다음 날 과음으로 인한 가족들 반대때문에 일주일만에 탈퇴하신분도 계시다는 전설이.. ㅋㅋㅋ 
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="13" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기 들어갈때 반드시 새콕이 아니어도 최대한 깃털이 손상되지 않은 깨끗한 콕으로 골라서 경기에 들어간다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	경기들어갈땐 반드시 한번도 안친 새콕으로 들어가야 합니다.<br>한번이라도 거의 새거 같은 콕은 난타 칠때 연습용으로 사용하세요.<br>
                    	* 초보 분들이 특히 잘 안지키시는 룰 입니다. * <br>
                    	*단, 새거 같은 콕을 가져가서, 새콕 4개를 묻어두고 헌 콕으로 경기를 시작할 경우는 괜찮습니다.<br>
						이 경우, 초심자들은 스윙 스피드가 낮아 4개 콕이 모두 남는 경우가 있습니다.<br><br>
						
						이런 규칙이 있는 이유는 몇번 친 콕은 새거 같아도, 내구성이 급격히 떨어져 있기에 금방 손상이 되어 콕이 남아나질 않습니다.<br>
						승리팀이 남은 콕을 가져가야 하는데, 쓰던 콕 가져와서 하나 이하로 남게되면 기분이 좋지 않습니다.<br>
						같은 초보끼리라서 우리끼리니까 괜찮아 하시다가 그게 습관이 되어 다른 회원분들과 헌콕으로 경기를 하게되면 말도 못하고 기분이 상하게 됩니다.<br>
						반드시 꼬옥! 새콕 가지고 들어가주세요 ~<br>
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="14" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기 후 내가 가져온 콕을 사용하지 않았더라도 승리팀이 남은 콕(2개이하) 가져가며, 3개가 남을 경우, 하나는 패자팀에서 가져가는 것이 매너이다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	*각 클럽마다 규칙은 조금씩 다르지만, 대부분 이 룰을 따릅니다.<br>
						남은콕이 2개 이하면 승리팀이 모두 가져가고, 3개 남을 경우 남은 한개는 패배팀에 줍니다.<br> 
						누굴 줄지는 패배팀에서 알아서 ~, 물론 4개 다 남으면 4명 서로 하나씩 다시 가져갑니다.<br><br>
                    	*그리고 클럽에서 지정한 콕을 사용하셔야 합니다. <br>
                    	간혹 타 클럽과의 경기, 교류전 등으로 다른 콕이 생겼다면 상대편에 양해를 구하고 해당 콕을 사용합니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="15" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기 시 심판이 없을 경우 라인의 인아웃 여부는 콕이 떨어진 쪽에서 가장 가까운 사람이 우선 판정하고, 상대편은 승복한다. 인아웃으로 판정시비 문제가 일지 않도록 서로 배려해 준다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	타 클럽과의 교류전의 경우에 인아웃에 매우 민감합니다.<br> 
                    	하지만 초보분들은 클럽내 일상경기의 경우에는 서로 상대방을 존중해주시고, 가까운 쪽의 판단을 무조건 따라주세요~
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="16" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">안전부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                	동지옹 코트의 경우 좌우측 벽에 소화전이 있으며, 노출된 소화전문이 유리로 되어있어 급격한 방향전환으로 소화전 유리에 부딛칠 경우 큰 부상을 입을수 있으니 주의해야 한다.
                </div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	2년전 소화전에 부딛치며 유리가 깨져 크게 다친 경우가 있습니다.<br>주의 바랍니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="17" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">타 클럽과의 교류전을 마친 후 나와 잘 맞는 파트너를 경기이사님께 알려드리고 다음 경기에 편성해 주십사 부탁드린다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	배드민턴은 복식 경기입니다. 각 파트너 조합은 경기이사님이 많이 고심해서 짜내고 있습니다.<br>   
						모든 회원분들이 원하는 모든 조합은 불가능 합니다.<br>
						짜여진 조편성으로 묵묵히 최선을 다해주세요 ~
					</div>
                  </div>
                </div>
              </div>

            </div>
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="18" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">안전부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">고수들의 경기 영상을 보니 네트 바로 앞에서 높게 뜬 공을 푸시 (강하게 끊어치는 기술)하는 것이 멋있어 보였다. 나도 그런 기회가 왔을때 시도해보아야 겠다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},true);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},false);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	네트앞에서 강하게 친 콕이 상대편 코트 네트 앞에 서있는 초보분의 눈을 강타할 수 있기에, 초보분들의 경우 네트앞 강한 푸시 플레이는 자제해 주시기 바랍니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="19" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 0.2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절 및 안전부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">배드민턴 운동시 지참해야 할 것들은 전용민턴상의/하의, 전용민턴화, 민턴채 수건은 필수 이다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	네. 추가로 샤워시설이 있는 민턴장의 경우 갈아입을 옷도 가져오시면 좋습니다.
						일반티셔츠를 입고 올 경우 하절기에 땀으로 흠뻑 젖어 민망한 상황이 연출될 수 있습니다.<br> 
						특히 하절기에 민턴상의는 필수중의 필수 입니다.<br>  
						아울러 전용 민턴화는 바닥 매트와의 최적화된 마찰계수가 있어 발목부상을 막을수 있습니다.<br>
						일반 운동화 착용시 발목이 겹질릴 수 있습니다.
					</div>
                  </div>
                </div>
              </div>

            </div>
            
            
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
			<c:set var="req" value="20" />
          	<!-- ---------------Setting---------------- -->
          	<!-- ---------------Setting---------------- -->
            <div class="container pt20" style="padding-bottom: 2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">가습하는 것이 귀찮기도 하지만 동절기에는 콕에 습기가 없어 잘 깨지는 경향이 있으니, 1분간 가습 한 콕을 사용하는 것이 좋다.</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;" id="btn${req}">
	                <div class="orangeBtn subBtn f-col font26" onclick="ans(${req},false);">아니다(X)</div>
	                <div class="blueBtn subBtn f-col font26" onclick="ans(${req},true);">그렇다(O)</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="title borderBt">
                      <div>
                        <div class="f-row">
                          <span class="bold font20 fontBlue" id="ansDft${req}">정답 : 아니다(X)</span>
                        </div>
                        <div class="f-row">
                          <span class="bold font20 fontColor5" id="ansRlt${req}">정답</span>
                        </div>
                      </div>
                    </div>
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	동절기에는 습기가 없는 콕은 잘 깨지니 적당히 가습(최대 1분)하여 콕 손상을 예방하는 것이 좋습니다.<br>
                    	클럽에서 준비한 가습기가 비치되어 있지 않을 경우 카운터에 가습기가 있습니다.<br>
                    	운동전 집에서 가습을 미리 하고 오셔도 좋습니다.<br>
                    	단 너무 오랜 시간 가습할 경우 문제가 되니 적당히 가습을 해서 사용하세요. 
					</div>
                  </div>
                </div>
              </div>

	            <div class="btn-wrap" style="padding-top: 1rem;padding-bottom: 0;" id="start">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
	                <div class="blueBtn subBtn f-col font26" onclick="resultView();">시험 결과 제출하기</div>
	              </div>
	            </div>
	            
	            
	            <div class="btn-wrap" style="padding-top: 1rem;padding-bottom: 0;display:none;" id="restart">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
	                <div class="blueBtn subBtn f-col font26" onclick="window.location.reload();">재 시험 보러 가기</div>
	              </div>
	            </div>
            
            
            </div>
            
            
            
            
          </div>
        </div>

	</div>

</body>
<script type="text/javascript">

	var sucCnt = 0;
	var faiCnt = 0;
	var strFail = "";
	var reqCnt = 0;

	$(function() {
		// getData("${amsClb.TODAY}");
	});

	function ans(req, ans) {
		var fa = ", "+req;
		reqCnt++;
		var ansHtml = "<font color='red'>오답</font>";
		if (ans && (req == 0 || req == 1 || req == 3 || req == 4 || req == 6 || req == 8 || req == 9 || req == 13 || req == 17 || req == 18)) {
			var ansHtml = "<font color='blue'>정답</font>";
			$("#ansDft"+req).html("정답 : 아니다(X)");
			sucCnt++;
			var fa = "";
		}
		if (ans && (req == 0 || req == 2 || req == 5 || req == 7 || req == 10 || req == 11 || req == 12 || req == 14 || req == 15 || req == 16 || req == 19 || req == 20)) {
			var ansHtml = "<font color='blue'>정답</font>";
			$("#ansDft"+req).html("정답 : 그렇다(O)");
			sucCnt++;
			var fa = "";
		}
		strFail = strFail +fa;
		$("#ansRlt"+req).html(ansHtml);
		$("#sts"+req).html("(완료)");
		$("#btn"+req).hide();
	}
	
	// appPage2
	function resultView() {
		for (var i=1; i < 21; i++) {
			$("#ans"+i).show();			
		}
		
		$("#start").hide();
		
		var $_that = $(".scroll-wrap");
        $_that.animate({scrollTop: '0px'}, 0);

		$("#restart").show();
		

		var para1 = "MBR_TEST_RESULT_SAVE_MMOA";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = "${loginMbrSq}";
		var para4 = (sucCnt * 5);
		
		var load = loading();
		load.show();

		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4,
						para5 : strFail,
						para6 : reqCnt
					},
					type : "POST",
				    contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						messageBox({
							title : '확인',
							message : "※ 시험 결과 ※"+"<br><br>"+"●정답 : "+sucCnt+" 문제"+"<br>"+"●오답 : "+(20-sucCnt)+" 문제"+"<br><br>"+"오답 확인 후 재평가 제출해주세요~",
							type : 'alert',
							callback : function() {
							}
						})
						load.hide();
						
					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});				
		
	}
	
	
</script>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

	$(function(){ 
		  wx.config({
			    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
			    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
			    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
			    signature: "${signInfo.signature }",// 必填，签名，见附录1
			    jsApiList: [//分享接口
			       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
			        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
			                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});  
		  
		  	wx.ready(function(){
		  		
		  		wx.onMenuShareTimeline({
		  		    title: '초심자 예절, 안전 필기 시험', // 分享标题
					link: '${shareInfo.link}',
		  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
		  		    success: function () { 
		  		        // 用户确认分享后执行的回调函数
		  		    },
		  		    cancel: function () { 
		  		        // 用户取消分享后执行的回调函数
		  		    }
		  		});
		  		
		  		wx.onMenuShareAppMessage({
		  		    title: '${amsClb.CLB_NM}', // 分享标题
		  		    desc: '초심자 예절, 안전 필기 시험', // 分享描述
		  		    link: '${shareInfo.link}',
					imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
		  		    success: function () { 
		  		        // 用户确认分享后执行的回调函数
		  		       // alert('success 11');
		  		    },
		  		    cancel: function () { 
		  		        // 用户取消分享后执行的回调函数
		  		    	// alert('error 11');
		  		    }
		  		});
			});
		  	
		  	
		  	wx.error(function(res){
		  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
	
		  	});
		  
	});
</script>
</html>
