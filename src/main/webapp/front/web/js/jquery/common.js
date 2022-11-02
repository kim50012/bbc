	jQuery(function($){
		
		
		$(document).ready(function() {

			bannerScrollAction();
			
			$("#quickbar,.wing-banner").css("display","");
			$("#main_quickbar,.main_wing-banner").css("display","");
//			$(".wing-banner").css("display","");
			document.oncontextmenu = function(){
				if(event.srcElement.type!="text" && event.srcElement.type!="textarea"){
					return false;
				}
			}			
		});
		
		
/**  최근 본 상품  **/
		if(2 < $("#quickbar div.view-area ul li").size()){
			$("#quickbar div.view-area ul").rotate({
				'duration' : '0',
	            'interval' : 0,
				'prevButton' : '#quickbar div.view-con a.prev',
				'nextButton' : '#quickbar div.view-con a.next',
				'movement'  : 'top',
	            'autoStart' : false,
	            'scroll': 1
			});
		}	
		
		if(2 < $("#main_quickbar div.view-area ul li").size()){
			$("#main_quickbar div.view-area ul").rotate({
				'duration' : '0',
	            'interval' : 0,
				'prevButton' : '#main_quickbar div.view-con a.prev',
				'nextButton' : '#main_quickbar div.view-con a.next',
				'movement'  : 'top',
	            'autoStart' : false,
	            'scroll': 1
			});
		}	
		bannerScrollAction = function() {
			var headerHeight = $("#head").height();
			var l = (1000 / 2)+9 + "px";  
			var lp = "-620px"; 
			var l2 = lp.left;  
			if($(document).scrollTop() <= (headerHeight+22) ) {
				$("#quickbar").css("position", "absolute").css('top' , "175px").css("left", "50%").css("margin-left", l);
				$(".wing-banner").css("position", "absolute").css('top' , "175px").css("left", "50%").css("margin-left", lp);
				$("#main_quickbar").css("position", "absolute").css('top' , "22px").css("left", "50%").css("margin-left", l);
				$(".main_wing-banner").css("position", "absolute").css('top' , "22px").css("left", "50%").css("margin-left", lp);
			} else {
				$("#quickbar").css("position", "fixed").css('top', "22px").css("left", "50%").css("margin-left", l);
				$(".wing-banner").css("position", "fixed").css('top', "22px").css("left", "50%").css("margin-left", lp);
				$("#main_quickbar").css("position", "fixed").css('top', "22px").css("left", "50%").css("margin-left", l);
				$(".main_wing-banner").css("position", "fixed").css('top', "22px").css("left", "50%").css("margin-left", lp);
			}
		};
		
		
/*		$("#quickbar").css("position", "fixed").css('right', "10px").css("left", "50%").css("margin-left", (1000 / 2)+9 + "px");
		 $(window).scroll(function(){
			var headerHeight = $("#head").height();
			var l = (1000 / 2)+9 + "px";   
			if($(document).scrollTop() <= (headerHeight+22) ) {
				$("#quickbar").css("position", "absolute").css('top' , "174px").css("left", "50%").css("margin-left", l);
			} else {
				$("#quickbar").css("position", "fixed").css('top', "10px").css("left", "50%").css("margin-left", l);
			}
		});*/
		 
//		$("#quickbar").css("position", "fixed").css('right', "10px").css("left", "50%").css("margin-left", (1000 / 2)+9 + "px");
//		$(".wing-banner").css("position", "fixed").css('right', "10px").css("left", "42%").css("margin-left", (1000 / 2)+9 + "px");
		
//		$("#quickbar").css("position", "fixed").css('top', "10px").css("left", "50%").css("margin-left", l);
//		$(".wing-banner").css("position", "fixed").css('top', "10px").css("left", "150px").css("margin-left", 0);
		
		$(window).scroll(function(){
			bannerScrollAction();
			});
		 
	
/** page-location **/
		$(".location p span").click(function(){
			$(this).parent().parent().find("ul").slideToggle();
		});
		$(".location ul li ul li span").click(function(){
			text = $(this).text();
			$(this).parent().parent().parent().find("p a").text(text);
			$(this).parent().parent().hide();
		});	

		$("p.go-top").hide();
		$(window).scroll(function(){
			temp = $(window).scrollTop();
			if(temp = $(window).scrollTop()) {  
				$("p.go-top").show();
			}else {
				$("p.go-top").hide();
			}
			$("p.go-top").css({"position" : "fixed" , "top" :  $(window).height()-80});
		});

/** 검색레이어 스크롤바 **/ 		
		//$('.auto-complete dd').jScrollPane({showArrows: true});
		var gnb = $(".gnb-navi ul.main li > span.cate");
		gnb.mouseenter(function(){
			gnb.each(function(){
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
			$("div.depth").hide();
			$(this).parent().find("div.depth .depth-menu ul li").eq(0).attr("class" , "on");
			$(this).parent().find("div.depth").show();
		});

		$("ul.gnb-menu li").eq(0).find("a").click(function(){
			$($(this).attr("href")).toggle();
			return false;
		});
		

		// 자동완성 마우스 오버 
		$(".auto-complete ul li").mouseover(function(){
			$(".auto-complete ul li").attr("class" , "");
			$(this).attr("class" , "selected");
		});

		// 검색 레이어 노출
		$(".search-layer").hide();

		$(".total-search input").focus(function(){
			$(".search-layer").show();
		});

		$("body").off("click", "#closeShoppingData");
		$("body").on("click", "#closeShoppingData", function(){
			$("#head .layer-info").hide();
		});

/** 상품 비교 layer **/
		$(".compare-head span").click(function(){
			$(this).parent().find(".layer-compare").toggle();
		});
		$(".layer-compare .close").click(function(){
			$(this).parent().parent().hide();
		});
		
/** 쇼핑정보 가져오기 **/
		$(".member-info p a").click(function(){
			$($(this).attr("href")).toggle();
			return false;
		});
		var loadShoppingData = true;
		
		$("#shoppingData .namming").click(function(){
			if(loadShoppingData){
				$("#info-member").load("/shop/display/getShoppingData");
				loadShoppingData = false;
			}
		});
		
		/* selectbox z-index */
		$("div.sbHolder").css("z-index" ,"1");
		$("div.sbHolder").click(function(){
			$(this).css("z-index" ,"10");
			$(this).find("ul").css("z-index" ,"15");
			$(this).find("li").css("z-index" ,"20");			
		});
		$("div.sbHolder ul").focus(function(){
			$(this).css("z-index" ,"10");
		});
		$("div.sbHolder ul").focusout(function(){
			$(this).css("z-index" ,"1");
		});
		
/**카테고리전시영역 가져오기**/
		var loadCategoryDisplay = true;
		$("#categorySubDisplay").click(function(){
			$("#gnb-view").toggle();
			if(loadCategoryDisplay){
				$("#gnb-view").load("/shop/viewSubGnb", function(){
		            $("#categoryMain li:eq(0) > span.gnb-cate").trigger("mouseenter");
				});
				loadCategoryDisplay = false;
			}
		});
		
	});