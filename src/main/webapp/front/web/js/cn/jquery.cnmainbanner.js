jQuery(function($){

	/** selectbox **/

	$(".plan-all").selectbox();
	$(".view-select").selectbox();

	/*** 기획전 대표 상품 가격노출 ***/

		$(".price-info").hide();
		$(".infomation .product-info").mouseenter(function(){
			$(this).hide();
			$(this).next().show();
		});

	/**** list-view-con ****/
		$("#small").hide();
		$(".list-pattern a").click(function(){
			$(".listing").hide();
			$($(this).attr("href")).show();
			return false;
		});
	
	

	/*** datepicker ***/

	$( ".term").datepicker({
		prevText: "이전",
		nextText: "다음",
		yearSuffix: "년",
		showMonthAfterYear: true,
		dateFormat: "yy/mm/dd",
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		showOn: "button",
		buttonImage: "//image.ssgdfs.com/images/shop/common/datepicker.gif",
		buttonImageOnly: true 
	});
	var banner = $(".plan-menu ul li a");
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
		$(".main-plan .view-con span.stop").click(function(){
			banner.stopTime();
			imgReplace($(this));
			
			
		});
		/*** 배너시작 ***/
		$(".main-plan .view-con span.play").click(function(){
			bannerpoi = $(".plan-menu ul").find(" li.selected a").attr("href");
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
			$(".plan-list ul li").stop().animate({"opacity" : 0} , 400);
			$(".plan-menu ul li").attr("class" , "");
			obj.parent().attr("class" , "selected");
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
			$(".main-plan .view-con span").each(function(){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
		}
		

		/*** 상단 마우스 오버 plan-navi ***/
		/*
		//$(".plan-navi ul li").mouseover(function(){
			//$(".plan-navi ul li").each(function(){
				$(this).removeClass("selected");
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			$(this).addClass("selected");
			$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
		});
		*/

		/*** 가격정보 뷰 ***/
		
		$(".price-info").mouseout(function(){
			$(this).hide();
			$(this).prev().show();
		});

		/*** 상품리스트 ***/

		/**** list-view-con ****/
		$("#small").hide();
		$(".list-pattern a").click(function(){
			$(".listing").hide();
			$($(this).attr("href")).show();
			return false;
		});
	
			
	/*** 리스트 정렬 
	$(".selling-event").masonry({
		// options
		itemSelector : '.item', 
		columnWidth : 0
	}); 
	***/
	
			
		/*** basic-list mouseover ***/
		$("div.info").mouseover(function(){
			$(".list-basic > ul > li").each(function(i){
				$(this).css({"overflow" : "hidden"});
				$(this).find(".info").removeClass("all-info");
				});
				$(this).parent().css({"overflow" : "visible"});
				$(this).addClass("all-info");
			}).mouseout(function(){
				$(this).parent().css({"overflow" : "hidden"});
				$(this).removeClass("all-info");
			});
		
			$(".link-menu li").mouseover(function(){
				$(".link-menu li").each(function(){
					$(this).removeClass("on");
				});
				$(this).addClass("on");
			});
			
			/**** list-view-con ****/
			$("#small").hide();
			$(".list-pattern a").click(function(){
				$(".list-container").hide();
				$($(this).attr("href")).show();
				return false;
			});
			
				$(".list-basic .photo").mouseover(function(){
				single = $(this).find("ul").attr("class");
				if(single == "link-menu"){
					$(this).find(".link-menu").show();
				} 
				$(this).find("span").show();
			}).mouseout(function(){
				if(single == "link-menu"){
					$(this).find(".link-menu").hide();
				} 
				$(this).find("span").hide();
			});		
			
			
			
			$(".imgType").click(function(){
			$(".imgType").each(function() {
				var src = $(this).find("img").attr("src");
				var tmpA = src.indexOf("_on"); 
				if(tmpA > 0){ 
					src = src.replace("_on",''); 
				}else {
					src = src.slice(0,-4) + "_on.gif";
				}
				$(this).find("img").attr("src", src); 
								
				});
			});
			/*
			$(".plan-list-view").hide();
			$("#banner-view").show();
			$(".link-right a").click(function(){
				$(".link-right a").each(function(){
					$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
				});
				$(".plan-list-view").hide();
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
				$($(this).attr("href")).show();
				return false;
			});
			*/
			
			
			
			
			//$(".popular-plan ul li p.banner-box").hide();
			var popular = $(".popular-plan ul li p.b-tit a");
			popular
			.everyTime(5000, 'popular', function(i) {
				if(i > 0) {
					idx = i % popular.size();
					popular.eq(idx).click();
				}
			});		
			//list-view
			
			$(".popular-plan ul li p.b-tit a").click(function(){
				popularClick($(this));
				return false;
			});
			$(".popular-plan ul li p.b-tit a").mouseover(function(){
				popular.stopTime();
			}).mouseout(function(){
				popPos = $(this).parent().parent().index();
				popularRestart(popPos);
				
			});
			
			popularClick = function (obj){
				$(".popular-plan ul li").removeClass("on");
				obj.parent().parent().addClass("on");
				$(".popular-plan ul li p.banner-box").hide();
				obj.parent().next().show();
			}
			
			popularRestart = function(obj){
				popular.each(function(x){
					if($(this).parent().parent().index() == obj){
						popular.everyTime(3000, 'popular', function(i) {
							idx = (x + i) % popular.size();
							popular.eq(idx).click();
						});
					}
				});
			};
});

