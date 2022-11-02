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
<title>배드민턴 예절지수 평가</title>
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
                      <span class="bold fontBlue font20">초심자배려</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">나는 초심자들과 일주일에 ?회 경기(난타)를 한다</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},0);">전혀 하지 않는다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},5);">1~2회 정도 한다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">3회 이상 한다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">초심자 배려를 위해 1~2회라도 난타, 게임을 해주는 배려가 필요합니다.</div>
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
                      <span class="bold fontBlue font20">예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">회원분들 사이의 인사 예절</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},6);">경기장 들어올때 나갈때 나의 주변만 인사한다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},4);">어색한 경우 가끔 인사를 하지 않는다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">경기장 오고갈때 및 경기 전후에 항상 한다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">선후배를 막론하고 먼저 인사하고 인사에 답례하는 것이 예의 입니다.</div>
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
                      <span class="bold fontBlue font20">예절부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">셔틀콕 전달에 대한 예의</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},3);">셔틀콕이 본인 가까운데 있어도 잘 안줍는 편이다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},5);">셔틀콕을 라켓으로 쳐서 코트 밑으로 보낼때가 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">내 주변의 콕은 먼저 움직여서 받기 좋게 넘겨 준다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	가까운 사람이 줍는 것이 서로에 대한 예의 입니다.<br>
                    	우리편의 공격이 실패하여 콕이 코트 중간에 있는 경우 상대방을 배려하여 주워주는 것 또한 예의 입니다.<br><br>
                    	또한 상대편에게 넘겨줄 때에는 네트위로 상대방이 볼 때 넘겨주어야 하며<br>
                    	파트너에겐 가능한 손으로, 받을 때에는 손이나 라켓 헤드에 공손히, 던져주거나 라켓으로 쳐서 전달하지 않도록 합니다.
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
                      <span class="bold fontBlue font20">경기예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">셔틀콕으로 상대방을 맞췄을 경우</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},3);">내가 맞아서 맞추려고 노력한적이 있다.</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},6);">웃음을 참지 못해 웃는 경우가 종종 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">바로 사과를 먼저 한다.</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	셔틀콕에 맞은 상대방 입장 생각, 그 자리에서 바로 사과, 1득점보다는 사람이 우선입니다.<br>
                    	얼굴이나 머리 등 위험한 부위에 맞은 경우에는 코트를 넘어가서 상대방을 살피고 사과를 하는 것이 좋습니다. 
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
                      <span class="bold fontBlue font20">경기예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기에 지고 있거나 파트너의 실수에 대한 대처</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},1);">못하는 파트너에게 경기중 문제점을 지적한다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},3);">실수에 말은 못하고 언짢은 표정, 행동을 가끔 한다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">실수에 따뜻한 격려 및 파트너 잘칠땐 화이팅을~</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},7);">실수에 말없이 아무런 반응을 보이지 않는다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	지고있다고 인상쓰지말고 파트너에게 불평하지 말아야 합니다.<br>
                    	아무리 이벤트 경기, 꼭 이겨야하는 중요한 경기에 지고 있더라도 파트너와 화이팅 하며 파트너쉽을 좋게 만드는 것이 결과도 좋습니다.
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
                      <span class="bold fontBlue font20">경기예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기에 이기고 있을때 세러머니 행동</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},3);">상대방에게 너무 하다는 소리를 들은 적이 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},5);">늘 조심하며, 조용한 편이다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},8);">상대방 기선 제압을 위해 종종 하는 편이다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">파트너와의 화이팅은 항상 하는 편이다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	지나친 세레머니는 상대편 자극하게 되며 이기고 있을때 웃거나 상대 자극하는 사소한 말 자제해야 합니다.<br>
                    	상대편에게 자극이 되지 않는 선에서 파트너와의 세러머니는 반듯이 필요한 행동 입니다.
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
                      <span class="bold fontBlue font20">경기예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기 참여 횟수에 대한 생각</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">기다리는 회원이 있으면 쉬었다가 경기한다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},5);">같은 사람과 연속 경기를 한적이 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},3);">선배 및 고수들이 안쳐준다고 불평한적 있다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	배드민턴은 선배 및 고수들이 안쳐준다고 불평하지 말고 함께 쳐주는 것에 감사하며, 하수가 함께 치자고 할때 언제든 함께 해주는 것이 예의 입니다.<br>
                    	기다리고 있는 회원분들을 생각하며 비슷한 사람들과 계속 경기에 들어가는 것을 자제하는 것이 좋은 모습니다.
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
                      <span class="bold fontBlue font20">경기규칙 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">서비스 반칙에 대한 예절</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},4);">경기중 상대편에게 지적 받은 적 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},8);">지적 받은 후 규칙을 찾아 본 적이 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">주변에 도움을 받아 연습한 적이 있다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	너무 높게 팔 들거나 이중 동작을 하지 않도록 하며 경기 중 상대편에게 심한 지적은 하지 말아야 합니다.<br>
                    	평소에 자신이 서비스 반칙을 하지 않는지 주변에 도움을 받아 스스로 고쳐 나가는 것이 좋습니다.
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
                      <span class="bold fontBlue font20">경기예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기중의 인,아웃 판정</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},2);">애매한 경우 나에게 유리하게 판정한 적 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},5);">상대편 코트의 인아웃을 항의한 적 있다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">가까운 코트의 의견을 무조건 존중한다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	가까이서 본 상대편 판정을 존중하여야 합니다. 설사 오판이더라도..<br>
                    	혹여나 시비가 생길 우려가 있는 경우에는 바로 재 플레이를 하여 회원들 간 마음이 상하지 않도록 하여야 합니다.
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
            <div class="container pt20" style="padding-bottom: 2rem;">
              <!----------  문제 ${req}  ---------->
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>문제 ${req}</span>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">경기예절 부문</span>
                      <span class="fontOrange font20" id="sts${req}"> (진행중) </span>
                    </div>
                  </div>
                </div>
                <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">경기를 임하는 자세</div>
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;" id="btn${req}">
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},6);">경기를 이기기 위해 파트너 공까지 치는 경향이다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},10);">승패가 결정나기 전까지 최선을 다한다</div>
	                <div class="blueBtn subBtn f-col font26" style="margin-bottom:0.1rem;" onclick="ans(${req},5);">실력 차이가 너무 나서 경기를 포기한 경우가 있다</div>
	              </div>
	            </div>
              </div>
              <!----------  답 ${req}  ---------->
              <div class="modelChild" style="display:none;" id="ans${req}">
                <div class="childOne" id="childOne">
                  <div class="modelOnly oneModel">
                    <div class="fontColor5 font30 mt20" style="line-height:0.38rem;">
                    	아무리 실력이나 스코아 차이가 많이나는 상황이라도 경기를 포기하거나 성의 없이 하지 말아야 합니다.<br>
                    	이것은 파트너에 대한 매너이기도 하며 상대편에 대한 예의 입니다. 
					</div>
                  </div>
                </div>
              </div>


	            <div class="btn-wrap" style="padding-top: 1rem;padding-bottom: 0;" id="start">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
	                <div class="blueBtn subBtn f-col font26" onclick="resultView();">평기 결과 보기</div>
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

	function ans(req, point) {
		sucCnt = sucCnt + point;
		strFail = strFail + ", " + req + ":" + point;
		reqCnt++;
		$("#sts"+req).html("(완료)");
		$("#btn"+req).hide();
	}
	
	// appPage2
	function resultView() {
		for (var i=1; i < 11; i++) {
			$("#ans"+i).show();			
		}
		
		var $_that = $(".scroll-wrap");
        $_that.animate({scrollTop: '0px'}, 0);

		$("#restart").show();
		
		var pit = Math.round(sucCnt);

		var para1 = "MBR_TEST_RESULT_SAVE_MMOB";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = "${loginMbrSq}";
		var para4 = pit;
		
		var load = loading();
		load.show()

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
							message : "※ 시험 결과 ※"+"<br><br>"+"●예절지수 : "+pit+" 점"+"<br><br>"+"각 항목별 올바른 예절 방법을 다시 한번 확인해주세요~",
							type : 'alert',
							callback : function() {
								load.hide()
							}
						})
						
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
		  		    title: '배드민턴 예절지수 평가', // 分享标题
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
		  		    desc: '배드민턴 예절지수 평가', // 分享描述
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
