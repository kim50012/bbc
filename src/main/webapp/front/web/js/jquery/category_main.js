jQuery(function($){

	  	// best-banner

		$(".best-banner ul li p.title").click(function(){
			$(".best-banner ul li p.banner").hide();
			$(this).next().show();
		});

		// 브랜드별 보기

		$(".best-navi ul li a").click(function(){
				$(".best-navi ul li").attr("class" , "");
				$(".best-product ul.single").hide();
				$($(this).attr("href")).show();
				$(this).parent().attr("class" , "selected");
				return false;
		});
   
	/*** 초기 배너 모션 시작 ***/

	var banner = $(".banner-menu ul li a");
		banner
		.everyTime(5000, 'banner', function(i) {
			if(i > 0) {
				idx = i % banner.size();
				banner.eq(idx).click();
			}
		});
		/*** 배너 컨트록 부 mouseover ***/

		banner.mouseout(function(){
			var tagTxt = $(this).attr("href");
			bannerStart(tagTxt);
		
		});
		/*** 배너 정지 ***/
		banner.mouseover(function(){
			banner.stopTime();
			bannerClick($(this));
		});
		/*** 배너정지 ***/
		$("div.banner .view-con span.stop").click(function(){
			banner.stopTime();
			imgReplace($(this));
			
			
		});
		/*** 배너시작 ***/
		$("div.banner .view-con span.play").click(function(){
			bannerpoi = $(".banner-menu ul").find(" li.selected a").attr("href");
			bannerStart(bannerpoi);
			imgReplace($(this));
			
		});
		/*** 배너 시작  ***/
		banner.click(function(){
			bannerClick($(this));
			return false;
		});
		/***  banner click 공통 ***/

		bannerClick = function(obj){
			$(".banner-list ul li").stop().animate({"opacity" : 0} , 400);
			$(".banner-list ul li").css({"z-index" : "0"});
			$(".banner-menu ul li").removeClass("selected");
			obj.parent().addClass("selected");
			$(obj.attr("href")).stop().animate({"opacity" : "1"} , 500);
			$(obj.attr("href")).css({"z-index" : "3"});
			return false;
		};
		/*** 배너 재시작  ***/
		bannerStart = function(obj){
			banner.each(function(x){
				if($(this).attr("href") == obj){
					banner.everyTime(3000, 'banner', function(i) {
						idx = (x + i) % banner.size();
						banner.eq(idx).click();
					});
				}
			});
		};
		
		/* 이미지 교체*/
		
		imgReplace = function(obj){
			$(".banner .view-con span").each(function(){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
		};

});