$(function() {
	var mypageW = 280;
	var gomypage = $("#gomypage");
	var gomypage2 = $("#gomypage2");
	var mypage = $("#mypage");
	var wrap = $("#wrap");
	var back = $("#back .back");
	var con_back = $("#con_back .confirm");
	$(window).bind("load",checkWH).bind("resize",checkWH);
	gomypage.on("click", showMypage);
	gomypage2.on("click", showMypage);
	back.on("click", goback);
	con_back.on("click", goback);

function goback(){
	history.back();
}
function checkWH(){
	mypage.css("height", wrap.height());
}

function showMypage(){
	checkWH();
	gomypage.find("p").text('마이페이지  닫기');
	wrap.addClass('myon');
	gomypage.off("click", showMypage);
	wrap.off("click", hideMypage);
	mypage.show().animate({"right":"0"}, {
		 duration: 200
	});
	/*wrap.animate({"right":""+mypageW+"px"}, {
		duration: 200,
		complete: function(){
			$("#wrap").on("click", hideMypage);
		}
	});*/
	return false;
}

function hideMypage(){
	gomypage.find("p").text('마이페이지');
	wrap.removeClass('myon');
	gomypage.removeClass("on");
	gomypage.on("click", showMypage);
	wrap.off("click", hideMypage);
	mypage.animate({"right":"-"+mypageW+"px"}, {
		 duration: 200
	}).hide();
	/*wrap.animate({"right":"0"}, {
		 duration: 200
	});*/
	return false;
}

});
