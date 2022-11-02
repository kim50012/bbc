// zoom view img seting
function zoomView(){
	$(".imgZoom img").each(function(){
		var height = $(this).height();
		$(this).css({"margin-top":-height/2+"px"})
	});
	$(".product .thumb img, .bestProduct .thumb img").error(function(){
		$(this).attr("src","/resources/commerce/img/common/no_image01.png");
	});
	$(".productImg li img").error(function(){
		$(this).attr("src","/resources/commerce/img/common/no_image02.png");
	});
	$(".imgZoom li img").error(function(){
		$(this).attr("src","/resources/commerce/img/common/no_image03.png");
	});
	$(".eventList li img").error(function(){
		$(this).attr("src","/resources/commerce/img/common/no_image04.png");
	});
}

// slider reset
function sliderSet($this){
	var $slider = $this.find(".sliderList");
	$slider.each(function(){
		slider($(this));
	});
}

function autoOpen(){
	$(".autoComplete").show();
	if ($(".navBtn").hasClass("on")){
			$(".navBtn").trigger("click");
		}
	$("#container").addClass("top");
	$("header").addClass("top");
	$(window).scrollTop(0);
}

function autoColse(){
	$("#container").removeClass("top");
	$("header").removeClass("top");
	$(".autoComplete").hide();
}


// slider set
function slider($slider){
	var viewLength = typeof $slider.attr("data-slider") !== "undefined" ? $slider.attr("data-slider") : 1;
	var viewPage = typeof $slider.attr("data-page") !== "undefined" ? $slider.attr("data-page") : 1;
	var $paging = $slider.next(".sliderpage");
	if (viewLength < $("li", $slider).length){
		$slider.touchSlider({
			flexible : true,
			transition : true,
			view : viewLength,
			initComplete : function (e) {
				$paging.html("");
				var num = 1;
				$("li", $slider).each(function (i, el) {
					if((i+1) % e._view == 0) {
						$paging.append('<button type="button" class="btnPage">page' + (num++) + '</button>');
					}
				});
				$(".btnPage", $paging).bind("click", function (e) {
					var i = $(this).index();
					$slider.get(0).go_page(i);
				});
			},
			counter : function (e) {
				$(".btnPage", $paging).removeClass("on").eq(e.current-1).addClass("on");
			}
		});
	}
}

function tabSlider($slider){
	var viewLength = typeof $slider.attr("data-slider") !== "undefined" ? $slider.attr("data-slider") : 1;
	var viewPage = '';
	if(page == ''){
		viewPage = typeof $slider.attr("data-page") !== "undefined" ? $slider.attr("data-page") : 1;
	}else{
		viewPage = page;
	}
	var mathPage = Math.floor((viewPage-1)/viewLength)*viewLength+1;
	$slider.find("li:nth-child("+viewPage+")").addClass("on").siblings().removeClass("on")
	$slider.touchSlider({
		flexible : true,
		roll : false,
		transition : true,
		view : viewLength,
		page : mathPage,
		btn_prev : $slider.siblings(".prev"),
		btn_next : $slider.siblings(".next"),
		counter : function (e) {
			$slider.siblings(".prev, .next").removeClass("off");
			if(e.current == 1){
				$slider.siblings(".prev").addClass("off");
			} else if (e.current == e.total) {
				$slider.siblings(".next").addClass("off");
			}
		}
	});

	/*
	var viewLength = typeof $slider.attr("data-slider") !== "undefined" ? $slider.attr("data-slider") : 1;
	var viewPage = typeof $slider.attr("data-page") !== "undefined" ? $slider.attr("data-page") : 1;
	var mathPage = Math.floor((viewPage-1)/viewLength)*viewLength+1;
	$slider.find("li:nth-child("+viewPage+")").addClass("on").siblings().removeClass("on")
	console.log(mathPage)
	$slider.touchSlider({
		flexible : true,
		roll : false,
		transition : true,
		view : viewLength,
		page : mathPage,
		btn_prev : $slider.siblings(".prev"),
		btn_next : $slider.siblings(".next"),
		counter : function (e) {
			$slider.siblings(".prev, .next").removeClass("off");
			if(e.current == 1){
				$slider.siblings(".prev").addClass("off");
			} else if (e.current == e.total) {
				$slider.siblings(".next").addClass("off");
			}
		}
	});
	*/
}

$(function(){
	$(".fixedBtn").each(function(){
		var height = $(this).outerHeight();
		$("#container").css({"padding-bottom":height+"px"});
		$(".topBtn").css({"bottom":"10px"});
	});

	ios6 = false;
	var agent = window.navigator.userAgent.toLowerCase();
	var start = agent.indexOf( 'os ' );
	if ( /iphone|ipod|ipad/.test( agent ) && start > -1 ) {
		iosVersion= window.Number( agent.substr( start + 3, 3 ).replace( '_', '.' ) );
		if(iosVersion< 6.0){
			ios6 = true;
		}
	}

	if (ios6){
		$(".quickLink, .layerArea, #container").css({"-webkit-overflow-scrolling":"auto !important"});
	}

	function layout(){
		var hHeight = $("header").outerHeight();
		$("#container").css({"-webkit-overflow-scrolling":"touch"});
		$(".quickLink, #container").css({"padding-top":hHeight+"px"});
	}

	var winScrollTop;
	var nav = false;
	function winScrollDisable(winScroll, nav){
		if (winScroll){
			$("#container").removeClass("on");
			$(window).scrollTop(winScrollTop);
			if (!nav){
				$("#container").removeClass("layerZindex");
			}
		} else {
			winScrollTop = $(window).scrollTop();
			$("#container").addClass("on").scrollTop(winScrollTop);
			winScrollTop = $("#container").scrollTop();
			if (!nav){
				$("#container").addClass("layerZindex");
			}
		}
	}

	var navON = false;
	$(".navBtn").click(function(){
		if (!navON){
			navON = true;
			if ($(this).hasClass("on")){
				winScrollDisable(true, true);
				$(this).removeClass("on");
				$(".quickLink").css({"-webkit-transform":"translateY(-100%)"});
				setTimeout(function(){
					$(".quickLink").hide();
					navON = false;
				}, 500);
				$(".dim").removeClass("on");
			} else {
				$(this).addClass("on");
				$("header").removeClass("top");
				$(".quickLink").show(10, function(){
					$(".quickLink").css({"-webkit-transform":"translateY(0)"});
				});
				$("#container").removeClass("top");
				$("header").removeClass("top");
				$(".autoComplete").hide();
				setTimeout(function(){
					navON = false;
				}, 500);
				$(".dim").addClass("on");
				winScrollDisable(false, true);
			}
		}
		return false;
	});

	$("input, textarea").focusin(function(){
		$("header").addClass("top2");
		$(".topBtn").addClass("off");
	}).focusout(function(){
		$("header").removeClass("top2");
		$(".topBtn").removeClass("off");
	});

	$("header .search input[type=text]").keydown(function(){
		$(".autoComplete").show();
	}).focusout(function(){
		if ( $(this).val() == "" ){
			$("#container").removeClass("top");
			$("header").removeClass("top");
			$(".autoComplete").hide();
		}
	}).focusin(function(){
		if ( $(".navBtn").hasClass("on") ){
			$(".navBtn").trigger("click");
		}
		$("#container").addClass("top");
		$("header").addClass("top");
		$(window).scrollTop(0);
	});

	$(".layerBtn").click(function(){
		var href = $(this).attr("href");
		winScrollDisable(false);
		$(href).show();
		sliderSet($(href));
		zoomView();
	});

	// layer close
	$(".layerArea .pageClose").click(function(){
		$(this).closest(".layerArea").hide();
		winScrollDisable(true);
		return false;
	});
	
	// layer close
	$(".layerArea .pagePrev").click(function(){
		$(this).closest(".layerArea").hide();
		winScrollDisable(true);
		return false;
	});

	// tab
	$(".tab a").click(function(){
		var href = $(this).attr("href");
		var siblings = $(href).attr("class");
		$(href).show().siblings("."+siblings).hide();
		$(this).closest("li").addClass("on").siblings("li").removeClass("on");
		sliderSet($(href));
		return false;
	}).each(function(){
		if (!$(this).parent("li").hasClass("on")) {
			var href = $(this).attr("href");
			$(href).hide();
		}
	});;

	$(".pGuideList a").click(function(){
		$(this).toggleClass("on").next("div").stop().slideToggle();
		return false;
	});

	$(".cartWrap .select").each(function(){
		var $select = $("select", this);
		var $num = $("span", this);
		$num.html($select.val());
		$select.change(function(){
			$num.html($(this).val())
		});
	});

	$(".topBrandList .dropBtn").click(function(){
		var $topBrandList = $(this).closest(".topBrandList");
		var $box = $(".topBrandList .inner");
		if ($(this).hasClass("on")){
			$(this).removeClass("on");
			$(this).siblings(".dropBox").slideUp(300)
		} else {
			$(this).addClass("on");
			$(this).siblings(".dropBox").slideDown(300)
		}
		return false;
	});

	$(".sliderTab .slider").each(function(){
		tabSlider($(this));
	});

	$(".sliderList").each(function(){
		slider($(this));
	});

	$(".cartWrap .cart").on("touchstart mousedown", function(){
		$(this).addClass("on");
	}).on("touchmove mouseup touchend", function(){
		$(this).removeClass("on");
	});

	// check : radio
	$("input[type=checkbox], input[type=radio]").each(function(){
		if (!ios6){
			var thisId = $(this).attr('id');
			$(this).addClass("iptBlind");
			if ( $(this).attr("type") == "radio"){
				$("label[for="+ thisId +"]").addClass("labelR");
			} else {
				$("label[for="+ thisId +"]").addClass("labelC");
			};
			if ( $(this).is(":checked") == true ){
				$("label[for="+ thisId +"]").addClass("chk");
				if ( $(this).is(":disabled") == true ){
					$("label[for="+ thisId +"]").addClass("disabled");
				}
			} else {
				if ( $(this).is(":disabled") == true ){
					$("label[for="+ thisId +"]").addClass("disabled");
				}
			}
		}
	});
	$("input[type=checkbox], input[type=radio]").on("change", function(){
		if (!ios6){
			var thisId = $(this).attr('id');
			if ( $(this).attr("type")=="radio" ){ // radio
				var name = $(this).attr("name");
				$("input[name="+ name +"]").each(function(){
					var raId = $(this).attr("id");
					$('label[for='+ raId +']').removeClass("chk");
				});
			}
			$('label[for='+ thisId +']').toggleClass("chk")
		}
	});

	layout();
	zoomView();
	$(window).on("load resize", function(){
		layout();
		zoomView();
	});

	if (!ios6){
		var headerHeight = $("header").outerHeight();
		$("header").headroom({
			offset : headerHeight,
			tolerance : 0
		});
		/*$(".topBtn").headroom({
			offset : headerHeight,
			tolerance : 100
		});*/
	}
	
	$(".dateIpt .from").on("change", function(){
		$(this).siblings(".dateIpt .to").attr("min", $(this).val());
	});
	$(".dateIpt .to").on("change", function(){
		$(this).siblings(".dateIpt .from").attr("max", $(this).val());
	});

	$(".sToggle .sToggleTit:not('.disabled')").click(function(){
		if ($(this).hasClass("on")){
			$(this).removeClass("on");
			$(this).next(".sToggleCont").stop(true, true).slideUp(300);
		} else {
			$(this).addClass("on");
			$(this).next(".sToggleCont").stop(true, true).slideDown(300);
		}
		return false;
	})
});
