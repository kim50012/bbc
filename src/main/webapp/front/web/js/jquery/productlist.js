jQuery(function($){
    /*** selectbox ***/
    $(".view-select").selectbox();
    $(".color-size").selectbox();
    
    /*** basic-list mouseover  ***/
    $("div.info").mouseenter(function(){
        $(".list-basic > ul > li").each(function(i){
        	$(this).css({"overflow" : "hidden"});
        	$(this).find(".info").removeClass("all-info");
			$(this).css({"overflow" : "visible" , "z-index" : 1});
        });
        $(this).parent().css({"overflow" : "visible" , "z-index" : 4});
        $(this).addClass("all-info");
        $(this).css("background" , "url(//image.ssgdfs.com/images/shop/cn/product/list/bg_list_bottom01.png) no-repeat 0 0");
     
    
    }).mouseleave(function(){
        $(this).css({"background" : "none"});
        $(this).find(".info-wrap").css({"background" : "none"});
        $(this).removeClass("all-info");
    });
   
    $(".link-menu li").mouseover(function(){
        $(".link-menu li").each(function(){
            $(this).removeClass("on");
        });
        $(this).addClass("on");
    });

	$("td.order ul li").mouseover(function(){
		$("td.order ul li").each(function(){
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
		});
		$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
	});
    
    

    /*페이지 뷰 스타일*/
    $(".list-pattern a").click(function(){
        $(".list-pattern a").removeClass("on");
        $(this).addClass("on");
        var listPattern = $(this).attr("href").substring(1);
        $.get('/shop/display/setListPattern?listPattern='+listPattern);
        $(".listing").hide();
        $($(this).attr("href")).show();
        $("input[name='listPattern']").val(listPattern);
        return false;
    });

    var single = null;
	$(".list-basic .photo").mouseenter(function(){
		single = $(this).find("ul").attr("class");
		if(single == "link-menu"){
			$(this).find(".link-menu").show();
		} 
		$(this).find("span").show();
	}).mouseleave(function(){
		if(single == "link-menu"){
			$(this).find(".link-menu").hide();
		} 
		$(this).find("span").hide();
	});
	
	// 미리보기 slectbox
	$(".color-size").selectbox();

	// 미리보기 레이어 위치
	var layerOffect = $("#wrap").offset();

	$("span.prdtPreview").click(function(){
		var topi;
		if($(window).scrollTop() < 170){
			topi = ($(window).scrollTop() + ($(window).height() / 2) - (625/2) + 170);
		}else{
			topi = ($(window).scrollTop() + ($(window).height() / 2) - (625/2));
		}
        var leftpoi = ($(window).width() / 2) - (818/2);
		
		$("div.layer-detail").css({"position": "absolute", "z-index" : "100", "top": topi , "left" : leftpoi });

		var params = "prdtCode="+ $(this).attr("value");
		$(".layer-detail").show();
        $.ajax({
            type: "GET"
            ,url: "/shop/product/productPreview"
            ,data: params
            ,dataType: "html"
            ,success: function(html) {
        		$("div#previewProduct").css({"position": "absolute" , "top": topi , "left" : leftpoi });
            	
            	$("div#previewProduct").html("");
              	$("div#previewProduct").html(html);
              	
            	$(".color-size").selectbox();
            	
            	$('.layer-detail .jqzoom').jqzoom({
            		zoomType: 'reverse',
            		lens:true,
            		xOffset:40,
            		yOffset:0,
            		preloadImages: false,
            		alwaysOn:false 
            	});
            	
            	// 줌 패드 영역 롤링
            	$(".preview-product .pattern-list .view-con span").click(function(){
            		btn = $(this).attr("class");
            		targetList = $("div.pattern-wrap ul");
            		targetLen = $("div.pattern-wrap ul li").width();
            		listView(btn , targetList , targetLen , "h");
            		targetList.width(targetLen* $("div.pattern-wrap ul li").size());
            	});



    			/*** 롤링 공통 ***/
    			var flag = true;
    			listView = function(btn, tagetList, targetlen , type){
    				if(flag){
    					flag = false;
    					poi = tagetList.position();
    					poiX = poi.left;
    					poiY = poi.top;
    					size = (tagetList.find("li").size()-5)*targetLen;
    					
    					if(btn == "prev"){
    						if(type == "h"){
    							if(poiX <= size*-1) {
    								targetList.stop();
    							}else {
    								targetList.stop().animate({"left" : poiX -targetLen} , 500);
    							}
    						}else if(type == "v"){
    							if(poiY <= size*-1) {
    								targetList.stop();
    							}else {
    								targetList.stop().animate({"top" : poiY -targetLen} , 500);
    							}
    						}
    					}else if(btn == "next"){
    						if(type == "h"){
    							if(poiX == 0) {
    								targetList.stop();
    							}else {
    								targetList.stop().animate({"left" : poiX +targetLen} , 500);
    							}
    						}else if(type == "v")  {
    							if(poiY == 0) {
    								targetList.stop();
    							}else {
    								targetList.stop().animate({"top" : poiY +targetLen} , 500);
    							}
    						}
    					}
    					setTimeout(function(){flag = true;}, 500);
    				}
    			};
            }
        });
		
	});

	// 미리보기 레이어 줌
	$('.layer-detail .jqzoom').jqzoom({
		zoomType: 'reverse',
		lens:true,
		xOffset:40,
		yOffset:0,
		preloadImages: false,
		alwaysOn:false 
	});
	
	// 미리보기 레이어 닫기
	$(".layer-detail p.close-layer").click(function(){
		$(this).parent().parent().hide();
	});


});

function fncRegProductReviewPopUp(isLogin, type, prdtCode) {
   	if(isLogin == 'true') {
      	window.open('/shop/product/popProductReview?type='+type+"&prdtCode="+prdtCode, 'prdtReview', 'width=605,height=650,scrollbars=no,resizable=no');
      	return false;
   	} else {
	   	var url = "/shop/login/loginPopupForm?redirectUrl="+escape(location.href);
       	openWindow(url, 490, 480, 'loginPopupForm'); 
       	return false;
   	}
}