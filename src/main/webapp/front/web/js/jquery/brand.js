


jQuery(function($){

	/**** 전체 리스트 뷰 ***/

	$("p.open span").click(function(){
		$(".brand-all-view").show();
	});
	$(".brand-all-view p.close").click(function(){
		$(".brand-all-view").hide();
	});

	/*** 철자 브랜드 검색 ***/
	/*$("ul.result").hide();*/
	$("#alpa01").show();

	$(".char-menu ul li a").click(function(){
		$("ul.result").hide();
		$(".char-menu ul li").attr("class" , "");
		$(this).parent().attr("class" , "selected");
		$($(this).attr("href")).show();
		return false;
	});


	/*** main-banner ****/

	var banner = $(".banner-menu a");
	
		/*** 초기 배너 모션 시작 ***/
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
		$(".main-banner .view-con span.stop").click(function(){
			banner.stopTime();
		});
		/*** 배너시작 ***/
		$(".main-banner .view-con span.play").click(function(){
			bannerpoi = $(".plan-menu ul").find(" li.selected a").attr("href");
			bannerStart(bannerpoi);
			
		});
		/*** 배너 시작  ***/
		banner.click(function(){
			bannerClick($(this));
			return false;
		});
		/***  banner click 공통 ***/
		
		bannerClick = function(obj){
			$(".banner-list ul li").stop().animate({"opacity" : 0} , 400);;
			$(".banner-menu a").attr("class" , "");
			obj.attr("class" , "selected");
			$(obj.attr("href")).stop().animate({"opacity" : "1"} , 500);
			$(".banner-menu a").each(function(i){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
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

		/*** 인기상품 ***/
		var itemEvent = $(".item-menu ul li a");
		itemEvent
		.everyTime(8000, 'itemEvent', function(i) {
			if(i > 0) {
				idx = i % itemEvent.size();
				itemEvent.eq(idx).click();
			}
		});
		itemEvent.click(function(){
			itemClick($(this));	
			return false;
		});

		itemClick = function(obj){
			$(".item-menu ul li").attr("class" , "");
			$(".brand-product-wrap .main > li").hide();
			$(obj.attr("href")).show();
			obj.parent().attr("class" , "selected");
		};

		/*** layer-view ***/

		$(".result-list .result li span span").mouseover(function(){
			$(".result-list .result li").attr("class" , "");
			brandLayer($(this));	
		});
		$(".listing-all ul li span a").mouseover(function(){
			$(".listing-all ul li").attr("class" , "");
			brandLayer($(this));
		});

		$(".brand-product-wrap ul li ul li").mouseover(function(){
			$(".product-info-layer").hide();
			$(this).find(".product-info-layer").show();
		});

		brandLayer = function(obj){
			$(".brand-info").hide();
			$(".result-list .result li span span").each(function(){
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			obj.parent().parent().find(".brand-info").show().css("z-index" , "100");
			obj.parent().parent().css("z-index" , "10");
			obj.parent().parent().attr("class" , "selected");
			//obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
		};
		$(".brand-info").mouseleave(function(){
			$(this).hide();
		});
		$(".product-info-layer").mouseleave(function(){
			$(this).hide();
		});

		/*** listing-all ***/
		$(".list-view a").click(function(){
			listView($(this));
		});

		listView = function(obj){
			$(".list-view a").each(function(){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			$(".listing-all").find("ul.main").hide();
			$(obj.attr("href")).show();
			obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
			return false;
		};
});