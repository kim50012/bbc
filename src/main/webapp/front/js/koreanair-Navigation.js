
var btnCnt1 = 1;
var btnCnt2 = 1;
var btnCnt3 = 1;

function openMenu(mu,shopId) {
	
	var windowWidth = $(window).width();

	if (mu == 0) {
		
		location.href = "/front/koreanair/index.htm?shopId=" + shopId;
		
	} else if (mu == 1) {
		
		/*var n = (windowWidth/8)*3-82;
		$(".fixedMenu1").css("left", n+"px");
		if(btnCnt1 == 1){
			$(".fixedMenu1").fadeIn();
			btnCnt1 = 0;
		}else{	
			$(".fixedMenu1").fadeOut();
			btnCnt1 = 1;
		}
		$(".fixedMenu2").fadeOut();btnCnt2 = 1;
		$(".fixedMenu3").fadeOut();btnCnt3 = 1;*/
		
		location.href = "/front/newsFeed/list.htm?shopId=" + shopId;
		
	} else if (mu == 2) {
		
		var n = (windowWidth/8)*5-120;
		
		$(".fixedMenu"+mu).css("left", n+"px");
		
		if (btnCnt2 == 1) {
			
			$(".fixedMenu2").fadeIn();btnCnt2 = 0;
		} else {	
			
			$(".fixedMenu2").fadeOut();btnCnt2 = 1;
		}
		
		$(".fixedMenu1").fadeOut();btnCnt1 = 1;
		$(".fixedMenu3").fadeOut();btnCnt3 = 1;
		
	} else if (mu == 3) {
		
		var n = (windowWidth/8)*5-110;
		
		$(".fixedMenu"+mu).css("left", n+"px");
		
		if (btnCnt3 == 1) {
			
			$(".fixedMenu3").fadeIn();btnCnt3 = 0;
		} else {
			
			$(".fixedMenu3").fadeOut();btnCnt3 = 1;
		}
		
		$(".fixedMenu1").fadeOut();btnCnt1 = 1;
		$(".fixedMenu2").fadeOut();btnCnt2 = 1;
		
	} else {
		location.href = "/front/koreanair/indexDream.htm?shopId=" + shopId;
//		location.href = "/front/koreanair/indexDream.htm?shopId=" + shopId;
	}	
}

function goPage(page, shopId) {
	 
	$('[class^=fixedMenu] td').css("background-color", "");
	$(".fixedMenu"+page).css("background-color", "#33A2B3");
	
	if(page == "1_2"){
		
		$('.fixedMenu1').toggleClass('changed');
	} else if (page == "2_3") {
		
		$('.fixedMenu2').toggleClass('changed');
	} else if (page == "3_3") {
		
		$('.fixedMenu3').toggleClass('changed');
	}

	// page link
	if (page == "1_1") {
		
		location.href = "/front/newsFeed/list.htm?shopId=" + shopId;
	}
	if (page == "1_2") {
		
		location.href = "/front/newsFeed/list.htm?shopId=" + shopId;
	}
	
	if (page == "2_1") {
		
		location.href = "/front/koreanair/transferInfo.htm?shopId=" + shopId;
	}
	if (page == "2_2") {
		
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/schedule-flight-search.html#schedule-search";
	}
	if (page == "2_3") {
		
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/schedule-flight-search.html#flight-search";
	}

	if (page == "3_1") {
		
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/ibe/bookingGate.html?isDomestic=false";
	}
	if (page == "3_2") {
		
		location.href = "https://www.koreanair.com/mobile/global/ko.html";
// 		judgeApk();
	}
	if (page == "3_3") {
		
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/booking/check-in.html#search";
	}
	if (page == "main5") {
		
		location.href = "https://www.koreanair.com/mobile/global/zh_cn/ibe/bookingGate.html?isDomestic=false";
	}
	if (page == "main6") {
		
		location.href = "https://www.koreanair.com/mobile/global/ko.html";
// 		judgeApk();
	}
	
	$(".fixedMenu1").fadeOut();btnCnt1 = 1;
	$(".fixedMenu2").fadeOut();btnCnt2 = 1;
	$(".fixedMenu3").fadeOut();btnCnt3 = 1;	
}

function judgeApk() {
	
	if (browser.versions.android) {//安卓手机
		
		if (confirm("确认下载大韩航空APP?")){
			
		}
	} else if (browser.versions.ios) {//苹果手机
		
		$('#share').show();
	}
}