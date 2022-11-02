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
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>차량 배차관리</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="../css/date.css" />
<script>var intClbSq = "${amsExcList.CLB_SQ}";</script>
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/headerBBC.js" type="text/javascript" charset="utf-8"></script>
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
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsExcList.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsExcList.HME_CLB_NM}</div></header>'
		$("#appHD").prepend(htm)
		$(".logo")
				.click(
						function() {
							window.location.href = '/front/bbc/clb/clbDetMy.htm?intClbsq=${amsExcList.HME_CLB_SQ }';
						});
		getNoCarMemberData();
	});
</script>
<style>
.subBtn {
	padding: 0.2rem 0.1rem;
}
.title1 .bold {
    font-size: 0.33rem;
}
.pb12 {
    padding-bottom: 0.12rem;
	background: #fff;
	padding-right: 0.32rem;
	padding-left: 0.32rem;
}
.title2 {
	background: #fff;
	padding-right: 0.32rem;
	padding-left: 0.32rem;
}
.table3 {
    padding-bottom: 0.22rem;
}
</style>
</head>

<body>


<div class="app top5App" id="app">
	<div class="content" id="appHD">
	
        <div class="container scroll-wrap" style="height: 100%;">
          <div class="tabHead pb22">
            <div class="tabSelected" onclick="changeTab(this, 1)" id="infoCar">차량 탑승 정보</div>
            <div onclick="changeTab(this, 2)" id="creCar">배차 등록</div>
          </div>
          <div id="tab1" class="f-col" style="padding-top: 0;padding-bottom: 2rem;">
            <div class="tabContent">
              <div class="table" style="padding-bottom:0;">
                <table class="table-col2" cellspacing="0" cellpadding="0" width="100%" border="1">
                  	<colgroup>
                    	<col width="27%" />
                    	<col width="73%" />
                  	</colgroup>
					<tr>
             			<th><p>${label.场地}</p></th><!-- 경기장 -->
             			<td style="font-weight:bold;">
             				<div class="tab-img">
             					<img src="../image/downLoad9.gif" style="border: 0;height: 0.4rem;"/>
             					<span>${amsExcList.EXC_TIT}</span>
             					<img src="../image/downLoad9.gif" style="border: 0;height: 0.4rem;"/>
           					</div>
           				</td>
           			</tr>
           			<tr>
             			<th><p>${label.日期}</p></th><!-- 시간 -->
             			<td style="font-weight:bold;">${amsExcList.EXC_DATE} ${amsExcList.WEEKNAME} ${amsExcList.EXC_FR_TIME}~${amsExcList.EXC_TO_TIME}</td>
           			</tr>
           			<tr>
             			<th><p>미 탑승 인원</p></th>
             			<td style="font-weight:bold;" id="noCarMember"></td>
           			</tr>
           			<tr>
             			<th><p>${label.时间}</p></th><!-- 시간 -->
             			<td style="font-weight:bold;">${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}</td>
           			</tr>
                  	<tr>
                    	<th>
                      		<p>${label.场地}</p>
                    	</th>
                    	<td>
			          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
			                <div class="confirmBtn subBtn f-col font28" onclick="window.location.href='/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}';">운동공지보기</div>
			              </div>
                    	</td>
                  	</tr>
                </table>
                
	          	<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
	          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
	                <div class="confirmBtn subBtn f-col" style="font-size:0.28rem;" onclick="openReg();">+ 차량운행등록</div>
	              </div>
	            </div>
                
		      </div>
	            
	            
	          <div class="refresh-wrap">
	            <div class="container pt20" style="padding-left:0; padding-right:0;">
	                <div class="title1 pt12" style="padding:0;">
	                  <div class="f-row">
	                    <i class="fourDPlex icon-sanjiao"></i>
	                    <span>배차 현황</span>
	                  </div>
	                </div>
					<c:set var="chair" value="0" />
					<c:set var="divEndTag" value="" />
					<c:forEach var="amsJinList" items="${amsJinList}" varStatus="status">
						<c:if test="${amsJinList.CAR_YN == 'Y'}">
							<c:set var="chair" value="0" />
							  ${divEndTag }
							  <c:set var="divEndTag" value="</div>" />
				              <div class="modelOnly" style="margin-top:0.2rem;">
				                <div class="title news borderBt">
				                  <div class="date-wrap">
				                    <div class="imgTab">
				                      <img src="/front/bbc/img/em/car.png" style="width: 0.6rem;display: inline;"/>
				                      <img src="${amsJinList.MBR_MAI_IMG_PTH}" style="width: 0.6rem;display: inline;"/>
				                    </div>
				                    <span>${amsJinList.MBR_NM}</span>
				                    <span>탑승인원 : ${amsJinList.EXC_JIN_TP} 명</span>
									<c:if test="${amsJinList.EXC_JIN_TP > amsJinList.CNT}">
										<div class="confirmBtn" onclick="openReg2('${amsJinList.MBR_SQ}');" style="background-color: #ec8921;">탑승신청</div>
									</c:if>
									<c:if test="${amsJinList.EXC_JIN_TP <= amsJinList.CNT}">
										<div class="delBtn">탑승마감</div>
									</c:if>
				                  </div>
				                </div>
				                <div class="bold fontBlue font20 mt20 pb20 borderBt" style="line-height: 0.4rem;">
				                	${amsJinList.EXC_JIN_CMT}
		                      		<c:if test="${amsJinList.MBR_SQ == loginMbrSq}">
		                      			<span class="delBtn" onclick="delCarMsg('${amsJinList.CAR_MBR_SQ}');" style="display: inline-block;">배차삭제</span>
		                      		</c:if>
				                </div>
						</c:if>
						
						<c:if test="${amsJinList.CAR_YN == 'N'}">
								<c:set var="chair" value="${chair+1 }" />
				                <div class="fontColor5 font20 mt20 lineH24">
			                      <div>
			                        <div class="f-row" style="padding-left: 0.2rem;">
					                  <div class="imgTab">
					                      <img src="/front/bbc/img/em/chair${chair }.png" style="width: 0.6rem;display: inline;"/>
					                      <img src="${amsJinList.MBR_MAI_IMG_PTH}" style="width: 0.6rem;display: inline;"/>
					                  </div>
					                  <span class="bold font20" style="padding-left:0.2rem;">${amsJinList.MBR_NM}</span>
					                  <div style="max-width:3.8rem;padding-left:0.2rem;line-height: 1.8;">
					                  		<span class="font20">${amsJinList.EXC_JIN_CMT}</span>
				                      		<c:if test="${amsJinList.MBR_SQ == loginMbrSq}">
				                      			<span class="delBtn" onclick="delCarMsg('${amsJinList.CAR_MBR_SQ}');">삭제</span>
				                      		</c:if>
					                  </div>
			                          
			                        </div>
			                      </div>
				                </div>
						</c:if>					  
					  
					</c:forEach>
		            <c:if test="${amsJinList.size() > 0}">
		            	</div>
		            </c:if>
		            			 	           	
		            	
	            </div>
	          </div>
          
            </div>
          </div>
          
          <div id="tab2" class="f-col" style="display:none;padding-top: 0;padding-bottom: 2rem;">
            <div class="tabContent">
              <div id="subWrap">
                <div class="table">
                  <table class="table-col2 noWrapTable" cellspacing="0" cellpadding="0" width="100%" border="1">
                    <colgroup>
                      <col width="27%" />
                      <col width="73%" />
                    </colgroup>
                    <tr>
                      <th class="textareaTh inputTd">
                        <p>탑승 가능 인원</p>
                      </th>
	                    <td class="left">
	                        <div class="such mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="0"/>
	  	                        <span class="Rdefine">0명</span>
	                          </label>
	                        </div>
	                        <div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="1"/>
	  	                        <span class="Rdefine">1명</span>
	                          </label>
	                        </div>
	                        <div class="such mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="2"/>
	  	                        <span class="Rdefine">2명</span>
	                          </label>
	                        </div>
	                        <div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="3"/>
	  	                        <span class="Rdefine">3명</span>
	                          </label>
	                        </div>
	                        <p><br></p>
	                        <div class="such mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="4" checked="checked"/>
	  	                        <span class="Rdefine">4명</span>
	                          </label>
	                        </div>
	                        <div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="5"/>
	  	                        <span class="Rdefine">5명</span>
	                          </label>
	                        </div>
	                        <div class="such mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="6"/>
	  	                        <span class="Rdefine">6명</span>
	                          </label>
	                        </div>
	                        <div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="7"/>
	  	                        <span class="Rdefine">7명</span>
	                          </label>
	                        </div>
	                        <p><br></p>
	                        <div class="such mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="8"/>
	  	                        <span class="Rdefine">8명</span>
	                          </label>
	                        </div>
	                        <div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="9"/>
	  	                        <span class="Rdefine">9명</span>
	                          </label>
	                        </div>
	                        <div class="trans mr20">
	                        	<label class="radio">
	  	                        <input class="" type="radio" name="activityType1" value="30"/>
	  	                        <span class="Rdefine">30명</span>
	                          </label>
	                        </div>
	                    </td>
                    </tr>
                    <tr>
                      <th class="textareaTh">
                        <p>출발 장소 및 시간</p>
                      </th>
                      <td class="inputTd">
                        <div>
                          <textarea id="strExcjincmt" placeholder="출발 장소 및 시간"></textarea>
                        </div>
                      </td>
                    </tr>
                  </table>

                  <div class="mt54">
                    <button class="longBtn orangeBtn" onclick="fn_ExcJinReg()">차량운행 등록</button>
                  </div>
                </div>
              
              </div>
              
            </div>	
        </div>
	
         <div id="tab3" class="f-col" style="display:none;padding-top: 0;padding-bottom: 2rem;">
           <div class="tabContent">
             <div id="subWrap">
               <div class="table">

                 <table class="table-col2 noWrapTable" cellspacing="0" cellpadding="0" width="100%" border="1">
                   <colgroup>
                     <col width="27%" />
                     <col width="73%" />
                   </colgroup>
                   <tr>
                     <th class="textareaTh inputTd">
                       <p>코멘트</p>
                     </th>
                    <td class="left">
                        <div>
                          <textarea id="strExcjincmt2">감사합니다</textarea>
                          <input type="hidden" id="intCarmbrsq" value="" />
                        </div>
                    </td>
                   </tr>
                 </table>
                                 
				<div class="btn-wrap">
          	  		<div class="buttons">
                		<div id="btn3" class="blueBtn subBtn f-col font26" onclick="cancelReg()">취소</div>
                		<div id="btn" class="orangeBtn subBtn f-col font26" onclick="fn_ExcJinReg2()">탑승하기</div>
              		</div>
            	</div>                  
                 
               </div>
             
             </div>
             
           </div>	
       </div>
	  
	  </div>
	
	</div>
</div>
</body>

<script type="text/javascript">
  function changeTab(el, index) {
    $(".tabSelected").removeClass("tabSelected");
    $(el).addClass("tabSelected");
    if(index == 1) {
      $("#tab2").hide()
      $("#tab1").show()
	  $("#tab3").hide()
    } else if(index == 2) {
      $("#tab1").hide()
      $("#tab2").show()
	  $("#tab3").hide()
    }
  }

	function openReg(){
		$(".tabSelected").removeClass("tabSelected");
		$("#creCar").addClass("tabSelected");
		$("#tab1").hide()
		$("#tab2").show()
	}

	function cancelReg(){
		$(".tabSelected").removeClass("tabSelected");
		$("#infoCar").addClass("tabSelected");
		$("#tab1").show()
		$("#tab2").hide()
		$("#tab3").hide()
	}

	function openReg2(intCarmbrsq){
		$(".tabSelected").removeClass("tabSelected");
		$("#intCarmbrsq").val(intCarmbrsq);
		$("#tab1").hide()
		$("#tab2").hide()
		$("#tab3").show()
  	}

	function fn_ExcJinReg() {

		var intExcjintp = $(':radio[name="activityType1"]:checked').val();
		var intExcjindly = "0";
		
		var intExcsq = "${intExcsq}";
		var strExcjincmt = $('#strExcjincmt').val();
		var strJobtype = "I";
		var strCaryn = 'Y'
		
		var intCarmbrsq = "${loginMbrSq}";

		if (strExcjincmt =="") {
			alert("${label.请输入您的备注信息}.");	
			return;
		}

 		var load = loading();
 		load.show()
		
		 $.ajax({
		 	 		data:{
		 	 			intExcsq : intExcsq
		 	 			,strExcjincmt : strExcjincmt
		 	 			,strJobtype : strJobtype
		 	 			,intExcjintp : intExcjintp
		 	 			,intExcjindly : intExcjindly
		 	 			,intCarmbrsq : intCarmbrsq
		 	 			,strCaryn : strCaryn
		 	 		},
				type : "POST",
				url : "/front/bbc/exc/excJinCarRegSave.htm",
				success : function(data) {
	 				window.location.href="/front/bbc/exc/excJinCar.htm?intExcsq=${intExcsq}";
				},
				error : function(xhr, status, e) {
	 				load.hide()
					alert("Error : " + status);
				}
			});
	}
  

	function delCarMsg(intCarmbrsq) {

		messageBox({
			title : '확인',
			message : '삭제하시겠습니까?',
			type : 'confirm',
			callback : function() {
				fn_ExcJinDel(intCarmbrsq);
			}
		})
	}	
	

	function fn_ExcJinDel(intCarmbrsq) {
		
		var intExcsq = "${intExcsq}";
		var strJobtype = "D";

		<c:if test="${amsExcList.EXC_SQ_ING > 0}">
			alert('${label.已经开始运动}. ${label.不能删除}!');
			return;
		</c:if>

 		var load = loading();
 		load.show()
		
		 $.ajax({
		 	 		data:{
		 	 			intExcsq : intExcsq
		 	 			,strJobtype : strJobtype
		 	 			,intCarmbrsq : intCarmbrsq
		 	 		},
				type : "POST",
				url : "/front/bbc/exc/excJinCarRegSave.htm",
				success : function(data) {
	 				window.location.href="/front/bbc/exc/excJinCar.htm?intExcsq=${intExcsq}";
				},
				error : function(xhr, status, e) {
	 				load.hide()
					alert("Error : " + status);
				}
			});
	}			
			

	function fn_ExcJinReg2() {

		var intExcjintp = "0";
		var intExcjindly = "0";
		
		var intExcsq = "${intExcsq}";
		var strExcjincmt = $('#strExcjincmt2').val();
		var strJobtype = "I";
		var strCaryn = 'N'
		
		var intCarmbrsq = $("#intCarmbrsq").val();
		
		if (strExcjincmt =="") {
			alert("${label.请输入您的备注信息}.");	
			return;
		}

		if (intCarmbrsq == "${loginMbrSq}") {
			alert("운전자는 승객으로 탑승할 수 없습니다.");	
			return;
		}

 		var load = loading();
 		load.show()
		
		 $.ajax({
		 	 		data:{
		 	 			intExcsq : intExcsq
		 	 			,strExcjincmt : strExcjincmt
		 	 			,strJobtype : strJobtype
		 	 			,intExcjintp : intExcjintp
		 	 			,intExcjindly : intExcjindly
		 	 			,intCarmbrsq : intCarmbrsq
		 	 			,strCaryn : strCaryn
		 	 		},
				type : "POST",
				url : "/front/bbc/exc/excJinCarRegSave.htm",
				success : function(data) {
	 				window.location.href="/front/bbc/exc/excJinCar.htm?intExcsq=${intExcsq}";
				},
				error : function(xhr, status, e) {
	 				load.hide()
					alert("Error : " + status);
				}
			});
	}	
	

	function getNoCarMemberData() {

		var para1 = "ATR_EXC_JIN_NO_CAR_SELECT";
		var para2 = "${intExcsq}";

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						if (data.list.length != 0) {

							for (var i = 0; i < data.list.length; i++) {
								$("#noCarMember").append(data.list[i].NO_CAR_NM);

							}
							
						}
						load.hide()
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
			  		    title: '${amsExcList.HME_CLB_NM} ${label.参加活动}', // 分享标题
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcJinCar.htm%253FintExcsq%253D${intExcsq}%2526shopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect', // 分享链接
			  		  link: '${shareInfo.link}',
			  		    		imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/em/car.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${amsExcList.HME_CLB_NM} - ${label.一起去} [배차]', // 分享标题
			  		    desc: '${amsExcList.EXC_TP_NM} ${amsExcList.EXC_TIT} ${amsExcList.EXC_DATE} ${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}', // 分享描述 
			  		  link: '${shareInfo.link}',
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcJinCar.htm%253FintExcsq%253D${intExcsq}%2526shopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/em/car.png', // 分享图标
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
