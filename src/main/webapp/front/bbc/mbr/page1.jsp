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
<title>클럽 회원 조사</title>
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
.headerTitle {
	width: 5.2rem;
	overflow: initial;
	padding-left: 0.2rem;
	font-size: 0.3rem;
	line-height: 1;
	font-weight: bold;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image><p class="headerTitle">${amsClb.CLB_NM}</p></div><div class="font24 bold"></div></header>'
		$("#appPage2").prepend(htm)
		$(".app-header").click(
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
	          <div class="container" style="height: 100%;">
	            <h4 class="title">클럽 회원 조사 목록</h4>
	            <c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B'}">
	            <div class="btn-white" onclick="window.location.href='/front/bbc/mbr/getPage.htm?pageName=page3&intClbsq=${amsClb.CLB_SQ}';" style="position: absolute;top: 1rem;right: 0.4rem;">+신규생성</div>
	            </c:if>
	            <div class="tab-header">
	              <div onclick="tab(this, 1)"><p>전체</p></div>
	              <div onclick="tab(this, 2)"><p>진행</p></div>
	              <div onclick="tab(this, 3)"><p>완료</p></div>
	            </div>
	            
	            <div class="pb22" id="tab1">
	              <ul class="list-group" id="list-group1">
	              </ul>
	            </div>
	            
	            <div class="pb22" id="tab2">
	              <ul class="list-group" id="list-group2">
	              </ul>
	            </div>
	            
	            <div class="pb22" id="tab3">
	              <ul class="list-group" id="list-group3">
	              </ul>
	            </div>
	            
	          </div>
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
		getData('TOTAL', 1);
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

	$(function() {
		getData('TOTAL', 1);
	});

	function getData(para4, idx) {

		var para1 = "MSG_LIST";
		var para2 = "${intClbsq }";
		var para3 = "1003";

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {
						
						$("#list-group"+idx).html("");
						
						if (data.list.length != 0) {

							for (var i = 0; i < data.list.length; i++) {
								var htm = '';
								
								htm = ''
									+ '<li onclick="window.location.href=\'/front/bbc/mbr/getPage.htm?pageName=page2&para1=MSG_LIST&para2=${amsClb.CLB_SQ}&para3=1003&para4=TOTAL&para5='+data.list[i].EXC_SQ+'&intClbsq=${amsClb.CLB_SQ}\';">'
									+ '  <div class="f-row scroll-title">'
									+ '    <p class="font24 bold fontColor5">'+data.list[i].EXC_TIT+'</p>'
									+ '  </div>'
									+ '  <div class="f-row-x-s mt12 mb20">'
									+ '    <div class="f-row">'
									+ '      <p class="template">'+data.list[i].CLB_GD_NM+'</p>'
									+ '      <p class="fullname">'+data.list[i].CLB_NIK_NM+'</p>'
									+ '    </div>'
									+ '    <p class="font20">'+data.list[i].REG_DT+'</p>'
									+ '  </div>'
									+ '  <div class="f-row-x-s mt12">'
									+ '    <div class="f-row">'
									+ '      <p class="font24 bold '+data.list[i].STSTAG+' mr6">['+data.list[i].STS+'] </p>'
									+ '    </div>'
									+ '    <div>'
									+ '      <i class="fourDPlex icon-duihua fontColor5"></i>'
									+ '      <span style="font-size: 0.3rem;">&nbsp;'+data.list[i].CNT+'</span>'
									+ '    </div>'
									+ '  </div>'
									+ '</li>'							
								
								$("#list-group"+idx).append(htm);

							}
						} else {
							//$("#mbrList").html('');
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
		  		    title: '클럽 회원 조사', // 分享标题
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
		  		    desc: '클럽 회원 조사', // 分享描述
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
