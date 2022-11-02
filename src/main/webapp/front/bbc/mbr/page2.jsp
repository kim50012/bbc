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
</head>

  <body>
    <div class="app issuePage pop-page">
      <div class="pages">
        <header class="page-head">
          <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick="history.back(-1);"/>
            <span>클럽 회원 조사-상세 내용</span>
          </div>
        </header>
        <!--内容区域-->
        <div class="content">
          <div class="scroll-wrap refresh-wrap">
            <div class="container pt20">
              <div class="modelOnly">
                <div class="title news borderBt">
                  <div class="date-wrap">
                    <span>${pageData[0].EXC_TIT }</span>
                    <div class="imgTab">
<!--                       <img src="../image/cgvSmall.svg" /> -->
<!--                       <img src="../image/flag1.svg" /> -->
                    </div>
                  </div>
                  <div>
                    <div>
                      <span class="bold fontBlue font20">${pageData[0].CLB_NIK_NM }</span>
                      <span class="font20 fontColor5">&nbsp;|&nbsp;</span>
                      <span class="font20 fontColor5">${pageData[0].REG_DT }</span>
                    </div>
                    <span class="fontOrange font20">${pageData[0].STS }</span>
                  </div>
                </div>
                <div class="fontColor5 font20 mt20 lineH24"><pre style="white-space: pre-wrap;line-height: 1.4;">${pageData[0].EXC_DCT }</pre></div>
              </div>
              <div class="modelChild">
              
              
                <div class="childOne" id="childOne">
                

                </div>

              </div>
            </div>
          </div>
        </div>
        
        <div class="proposal-wrap" style="border-top: solid 1px #c0c0c0;">
		    <div class="bold blueBtn comBtn f-col font26" onclick="$('#popupMsg').show();">의견 등록</div>
        </div>

        <div class="proposal-wrap" id="popupMsg" style="display:none;position: absolute;z-index: 999;height: 100%;background: rgb(0 0 0 / 37%);">
        	<div style="background: #fffafa;padding: 0.2rem;margin-top: 50%;">
		          <div>
		            <label class="checkBox">
		                  <input type="checkbox" checked="checked" id="hiddenNickName" name="hiddenNickName" value="1"/>
		                  <span>닉네임 표시</span>
		              </label>
		            <div class="text-wrap mt10">
		              <textarea id="proposalText" style="height:4rem;"></textarea>
		              <div id="subBtn" onclick="sendSave();">의견 등록</div>
		            </div>
		          </div>
		          <div class="bold blueBtn comBtn f-col font26 mt24" style="background-color: #999999;" onclick="$('#popupMsg').hide();">닫기</div>
		          <div class="bold blueBtn comBtn f-col font26 mt24" onclick="solveRisk()">목록으로 가기</div>
		          <c:if test="${(pageData[0].REG_MBR_SQ == loginMbrSq)}">
		          <div class="bold blueBtn comBtn f-col font26 mt24" onclick="msgUpdData()">안건종료하기</div>
		          </c:if>
        	</div>
        </div>
        
      </div>
    </div>
  </body>
<script>
$(function() {
    $('#subBtn1').click(function() {
    	
    	sendSave();
    	return;
    	
        if($("#proposalText").val()) {
            var date = new Date();
            var division = '의견';
            var val = $("#proposalText").val();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            // 这里可以添加提交数据的而方法
            var today = year + '-' + month + '-' + strDate;
            var html = '<div class="modelOnly oneModel"><div class="title news borderBt">'
            html += '<div><div class="f-row"><span class="font20 fontBlue">'+division+'</span>'
            html += '<div class="delBtn" onclick=del(this)>삭제</div></div>';
            html += '<div class="f-row"><span class="bold font20 fontColor5">'+today+'</span></div></div></div>'
            html += '<div class="fontColor5 font20 mt20 lineH24">'+val+'</div></div>'
            $("#childOne").append(html)
            $("#proposalText").val('')
            $("#proposalText").focus()
            $(".scroll-wrap").animate({scrollTop: 20 + $(".container ")[0].offsetHeight - $(".scroll-wrap ")[0].offsetHeight + 'px'}, 100)
        }
    })
    scroll()
})
function del(id) {
  messageBox({
    title: '의견 삭제',
    message: '정말 삭제 하시겠습니까?',
    type: 'confirm',
    callback: function() {
    	delData(id);
    }
  })
}

function delData(id) {

	var para1 = "MSG_JIN_DELETE";
	var para2 = "${intClbsq }";
	var para3 = "1003";
	var para4 = id;
	var para5 = "${para5 }";
	var para6 = "${loginMbrSq }";

	var load = loading();
	load.show()

	$
			.ajax({
				data : {
					para1 : para1,
					para2 : para2,
					para3 : para3,
					para4 : para4,
					para5 : para5,
					para6 : para6
				},
				type : "POST",
				url : "/front/bbc/clb/getData.htm",
				success : function(data) {
					window.location.reload();
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
}

function msgUpdData() {
  messageBox({
    title: '안건 종료',
    message: '종료 하시겠습니까?',
    type: 'confirm',
    callback: function() {
    	updData();
    }
  })
}

function updData() {

	var para1 = "MSG_STS_UPDATE";
	var para2 = "${intClbsq }";
	var para3 = "1003";
	var para4 = "${para5 }";

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
					window.location.reload();
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
}


function solveRisk() {
	window.location.href='/front/bbc/mbr/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}';
}

$(function() {
	getData('TOTAL', 1);
});

function getData(para4, idx) {

	var para1 = "MSG_JIN_LIST";
	var para2 = "${intClbsq }";
	var para3 = "1003";
	var para5 = "${para5 }";

	var load = loading();
	load.show()

	$
			.ajax({
				data : {
					para1 : para1,
					para2 : para2,
					para3 : para3,
					para4 : para4,
					para5 : para5
				},
				type : "POST",
				url : "/front/bbc/clb/getData.htm",
				success : function(data) {
					
					$("#childOne").html("");
					
					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {
							var htm = '';
							var j = i+1;
							var deleteBtn = "";
							if (data.list[i].MBR_SQ == "${loginMbrSq}") {
								deleteBtn = '        <div class="delBtn" onclick="del('+data.list[i].MSG_SQ+')">삭제</div>';
							}
							htm = ''
								+ '<div class="modelOnly oneModel">'
								+ '  <div class="title borderBt">'
								+ '    <div>'
								+ '      <div class="f-row">'
								+ '        <span class="bold font20 fontBlue">['+j+'] '+data.list[i].CLB_NIK_NM+'</span>'
								+ deleteBtn
								+ '      </div>'
								+ '      <div class="f-row">'
								+ '        <span class="bold font20 fontColor5">'+data.list[i].REG_DT+'</span>'
								+ '      </div>'
								+ '    </div>'
								+ '  </div>'
								+ '  <div class="fontColor5 font20 mt20 lineH24"><pre style="white-space: pre-wrap;line-height: 1.4;">'+data.list[i].EXC_JIN_CMT+'</pre></div>'
								+ '</div>'
							$("#childOne").append(htm);

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



function sendSave() {
	
	messageBox({
		title : '확인',
		message : '저장하시겠습니까?',
		type : 'confirm',
		callback : function() {
			saveData();
		}
	})
}


function saveData() {

	var intExcjintp = '1';
	var intExcjindly = $(':checkbox[name="hiddenNickName"]:checked').val();

	if (intExcjindly != "1") {
		intExcjindly = "0";
	}
	
	var intExcsq = "${para5 }";
	var strExcjincmt = $('#proposalText').val();
	var strJobtype = "I";
	var intMbrsq = "${loginMbrSq }";

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
	 	 			,intMbrsq : intMbrsq
	 	 		},
			type : "POST",
			url : "/front/bbc/exc/msgJinRegSave.htm",
			success : function(data) {
				window.location.reload();
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
		  		    title: '${pageData[0].EXC_TIT }', // 分享标题
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
		  		    desc: '${pageData[0].EXC_TIT }', // 分享描述
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
