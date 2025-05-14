<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
var clbJson = [{
	    name: 'HS Badminton Club',
	    value: '1'
	},
	{
	    name: '15 793 Badminton Club',
	    value: '2'
	},
	{
	    name: '793 Badminton Club',
	    value: '3'
	},
	{
	    name: '하노이 Badminton Club',
	    value: '9'
	},
];
var lvlJson = [
	{name: 'A조',value: 'A'},
	{name: 'B조',value: 'B'},
	{name: 'C조',value: 'C'},
	{name: 'D조',value: 'D'},
	{name: '초심자',value: 'E'},
];
var ageJson = [
	{name: '20대',value: '20'},
	{name: '30대',value: '30'},
	{name: '40대',value: '40'},
	{name: '50대',value: '50'},
];

var systemTest = false;
if ("${para3}" == "11" || "${para3}" == "16" || "${para3}" == "19") {
	systemTest = true;
}

var slideFlag = false;

var helpHtmlTag = "";
var wechatShareMsg = "";

$(function() {
  	$("#tableUpSub").click(function() {
  		if (slideFlag) {
        	$(".category").slideUp();
        	$("#tableUpSub").removeClass("icon-jian");
        	$("#tableUpSub").addClass("icon-jia");
        	slideFlag = false;
  		}
  		else {
        	$(".category").slideDown();
        	$("#tableUpSub").removeClass("icon-jia");
        	$("#tableUpSub").addClass("icon-jian");
        	slideFlag = true;
  		}    
      
    });

  	$('#matchStatus').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page22&para3="+"${para3}";
  	});	
  	$('#courtGameList').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page21&para3="+"${para3}";
  	});	
  	$('#entryDtl').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page5&para3="+"${para3}";
  	});	
  	$('#gamePlan').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page6&para3="+"${para3}";
  	});	
  	$('#gameTable').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page7&para3="+"${para3}";
  	});	
  	$('#gameResult').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page8&para3="+"${para3}";
  	});
  	$('#tonEntryList').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page10&para3="+"${para3}";
  	});	
  	$('#tonTable').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page11&para3="+"${para3}";
  	});	
  	$('#finalGameTime').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page14&para3="+"${para3}";
  	});	
  	$('#finalResult').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page12&para3="+"${para3}";
  	});
  	$('#victoryList').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page13&para3="+"${para3}";
  	});	

	$('#myInfo').click(function(e) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page15&para3="+"${para3}";
	});
});


// A:최고권한
// B:관리자권한
// C:각 클럽 운영진
// D:심판 & 코트 관리자
// if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B")) {
// 	messageBox({
// 		title : '알림',
// 		message : '권한이 없습니다.',
// 		type : 'alert',
// 		callback : function() {}
// 	});	
// 	return;
// }

    function sendMsgCommonFunc(para1, para11, para2, para12, para3, para13, para4, para14, para5, para15, para6, para16, para7, para17, para8, para9, para10) {

    		// T0AFBX8akZiUy4edp21_f-ug2hs71e23r8jkKUrJY9U 대회 신청 통지 (预约申请通知)
    		// first, keyword1, keyword2, keyword3, remark
    		// orfEm0_ytIhHG9DajyYhD500MCtk dikim
    		
    		// gQwgmjXJqDGbOm-isEA2neUZfALMeB-UJC0hkYY8R1I 코트 변경 공지
    		// first, keyword1 服务单号, keyword2 变更项目, keyword3 新预约日期, remark 
    		
    		// ZS6ABGZpdFwNwgvNVXD-YuF3fS8ByNtUufhFSWsbNaU 报名成功通知
    		// first, keyword1 参与者 ,keyword2 活动名称, keyword3 时间, remark
    	
    		if (!systemTest || para9 == "orfEm0_ytIhHG9DajyYhD500MCtk") {
    			$.ajax({
    	 	 		data:{
    	 	 			para1 : para1
    	 	 			,para11 : para11
    	 	 			,para2 : para2
    	 	 			,para12 : para12
    	 	 			,para3 : para3
    	 	 			,para13 : para13
    	 	 			,para4 : para4
    	 	 			,para14 : para14
    	 	 			,para5 : para5
    	 	 			,para15 : para15
    	 	 			,para8 : para8		// templateId
    	 	 			,para9 : para9	// openid
    	 	 			,para10 : para10	// linkUrl
    	 	 		},
    				type : "POST",
    				url : "/front/bbc/badMatch/sendMsgByMap.htm",
    				success : function(data) {},
    				error : function(xhr, status, e) {}
				});
    		}
    		
    	
    }
    function gotoHelp() {
    	$("#helpHtmlTag").html("");
    	$("#helpHtmlTag").append(helpHtmlTag);
    	$('#pop-up-help').show();
    }
    
    function gotoPlayerPage(mbrSq) {
  		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page15&para3=${para3}&para5="+mbrSq;
    }

</script> 
<style>
.matchHelp {
    width: 0.6rem;
    height: 0.6rem;
    display: block;
    position: fixed;
    bottom: 15px;
    right: 0.2rem;;
    z-index: 2050;
    overflow: hidden;
    color: rgba(1,0,0,0);
    background-image: url(/front/bbc/img/btn_help.png);
    background-size: 0.6rem 0.6rem;
    top: 0.12rem;
}
</style>
<style>
   	@media(min-width:720px) {
    	body {
    		width:720px;
    		background-color: #c0c0c0;
    	}
 		.footer {
 			width:720px;
 		}
		.app {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 720px;
		}
   	}
</style>
	<div class="radio-pop" id="pop-up-help" style="display:none;">
		<div class="radio-wrap" style="padding:0;width:6.5rem;">
			
			<div class="radio-content">

				<div class="container mt10">
		      		<div class="title2">
		              <span class="font24 bold">도움말</span>
		          	</div>
		            <div class="scroll-wrap" style="padding-bottom:0.5rem;min-height:5rem;height:5rem;">
		         		<table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" border="1">
		                <tbody>
		                <tr>
		                	<td id="helpHtmlTag"></td>
		                </tr>
						<!-- START Data Loop -->
						
		         		</tbody>
		         		</table>
		         		<br>
		         		<br>
		         		<br>
		        	</div>
          		</div>

			</div>
			<div class="btn-wrap">
          	  <div class="buttons">
                <div class="blueBtn subBtn f-col font26" onclick="$('#pop-up-help').hide();">취소</div>
              </div>
            </div>
		</div>
	</div> 