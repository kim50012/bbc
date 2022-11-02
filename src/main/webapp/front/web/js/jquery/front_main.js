jQuery(function($){
    $("#gnbCommon").load("/shop/viewMainGnb");
// 메인배너 --%>
    /*** 메인 기획전 배너 ***/
    var banner = $(".banner-menu ul li a");
    var bannerEvent = $(".banner-menu ul");
    /*** 초기 배너 모션 시작 ***/
    bannerEvent.everyTime(5000, 'banner-menu', function(i) {
        if(i > 0) {
            if(bannerEvent.children("li").size() != 0){
                 idx = i % bannerEvent.children("li").size();
                 banner.eq(idx).click();
             } 
        }
    }); 
    /*** 배너 재시작 ***/
    everyReTime = function(tagTxt){
        bannerEvent.stopTime();
        bannerEvent.everyTime(5000, 'banner-menu', function(i) {
            idx = (tagTxt++) % banner.size();
            banner.eq(idx).click();
        });
    };
    banner.mouseout(function(){
        var tagTxt = $(this).attr("href").substr(8);
        everyReTime(tagTxt);
    });
    /*** 배너 정지 ***/
    banner.mouseover(function(){
        bannerEvent.stopTime();
        bannerClick($(this));
    });
    /*** 배너 시작  ***/
    banner.click(function(){
        bannerClick($(this));
    });
    /*** 배너정지 ***/
    $(".main-banner .play-con span.stop").click(function(){
        $(this).prev().find("img").attr("src" ,$(this).prev().find("img").attr("src").replace("_on.gif" , "_off.gif"));
        $(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
        bannerEvent.stopTime();
    });
    /*** 배너시작 ***/
    $(".main-banner .play-con span.play").click(function(){
        $(this).next().find("img").attr("src" ,$(this).next().find("img").attr("src").replace("_on.gif" , "_off.gif"));
        $(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
        var tagTxt = $(".view-con ul").find(" li.selected a").attr("href").substr(8);
        everyReTime(tagTxt);
        
    });
    /***  banner click 공통 ***/
    bannerClick = function(obj){
        $(".banner-list ul li").stop().animate({opacity : 0, zIndex:0} , 400);
        $(".banner-menu ul li").removeClass("on");
        obj.parent().addClass("on");
        $(obj.attr("href")).stop().animate({opacity : 1, zIndex:1} , 500);
        return false;
    };
// end 메인배너 --%>

// brandPromotion 5종 --%>
    //productBanner
    var saleBanner = $("div.banner-promotion");
    //autoChange(saleBanner, 'saleBanner', 5000);
    //productBanner prev
    saleBanner.find(".prev").click(function(){
        var index;
        saleBanner.stopTime("saleBanner");
        saleBanner.find("div.autoRolling ul li").each(function(){
            if($(this).css("display") == "list-item" || $(this).css("display") == "block" ){
                index = $(saleBanner.find("div.autoRolling ul li")).index(this);
            }
        }); 
        saleBanner.find("div.autoRolling ul li").hide();
        saleBanner.find("div.autoRolling ul li:eq("+(index-1)+")").show();
        
        autoChange(saleBanner, 'saleBanner', 5000, index-1);
    });
    //productBanner next
    saleBanner.find(".next").click(function(){
        var index;
        saleBanner.stopTime("saleBanner");
        var index = findIndex(saleBanner);
        saleBanner.find("div.autoRolling ul li").hide();
        var size = saleBanner.find("div.autoRolling ul li").size();
        saleBanner.find("div.autoRolling ul li:eq("+((index+1)%size)+")").show();
        autoChange(saleBanner, 'saleBanner', 5000, (index+1)%size);
    });
// end brandPromotion --%>

// 한국관 --%>
    $(".nation-product .tab-menu ul li a").click(function(){
        $(".product-nation > ul > li").hide();
        $(".nation-product .tab-menu ul li").removeClass("on");
        $(this).parent().addClass("on");
        $($(this).attr("href")).show();
        return false;
    });

// 테마상품 --%>
    $(".theme-product p.title").click(function(){
        $(".theme-product ul li").attr("class" , "");
        $(this).parent().attr("class" , "on");
    });

// 뉴브랜드 --%>
    //new-brand 
    $(".new-brand .view-con a").click(function(){
        itemBanner($(this));
        return false;
    }).mouseover(function(){
        itemBanner($(this));
        newBrand.stopTime();
    }).mouseleave(function(){
        autoChange_forNewBrand(newBrand, 'newBrand', 5000);
    });
    
    itemBanner = function(obj){
        $(".brand-banner ul li").hide();
        $(".new-brand .view-con a").each(function(){
            $(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.png" , "_off.png"));
        });
        obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.png" , "_on.png"));
        $(obj.attr("href")).show();
    };
    
// 베스트셀러 --%>
    $(".best .tab ul li a").click(function(){
        $(".best .tab ul li a").each(function(){
            $(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif") );
        });
        $(".set-list").hide();
        $(".best .tab ul li").attr("class" , "");
        $(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif") );
        $(this).parent().attr("class" , "on");
        $($(this).attr("href")).show();
        return false;
    });
    
// 신상품 --%>
    var newArrival = $(".nerw-arrival");
    var imageChange = $(".nerw-arrival .view-con span");
    autoChange(newArrival, 'newArrival', 5000);
    //productBanner prev
    newArrival.find(".prev").click(function(){
        imageChange.each(function(){
            $(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
        });
        $(this).find("img").attr("src", $(this).find("img").attr("src").replace("_off.gif", "_on.gif"));
        var index;
        newArrival.stopTime("newArrival");
        newArrival.find("div.autoRolling > ul > li").each(function(){
            if($(this).css("display") == "list-item" || $(this).css("display") == "block" ){
                index = $(newArrival.find("div.autoRolling > ul > li")).index(this);
            }
        }); 
        newArrival.find("div.autoRolling > ul > li").hide();
        newArrival.find("div.autoRolling > ul > li:eq("+(index-1)+")").show();
        
        autoChange(newArrival, 'newArrival', 5000, index-1);
    });
    //productBanner next
    newArrival.find(".next").click(function(){
    	imageChange.each(function(){
            $(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
        });
        $(this).find("img").attr("src", $(this).find("img").attr("src").replace("_off.gif", "_on.gif"));
        var index;
        newArrival.stopTime("newArrival");
        var index = findIndex(newArrival);
        newArrival.find("div.autoRolling > ul > li").hide();
        var size = newArrival.find("div.autoRolling > ul > li").size();
        newArrival.find("div.autoRolling > ul > li:eq("+((index+1)%size)+")").show();
        autoChange(newArrival, 'newArrival', 5000, (index+1)%size);
    });
    
// 인기검색어 --%>
//popular 
    $(".popular .navi ul li").mouseenter(function(){
        popularCon($(this));
        return false;
    });
    popularCon = function(obj){
        $(".popular .navi ul li").attr("class" , "");
        obj.attr("class" , "on");
        $(".popular .list-popular ul").hide();
        $(obj.find("a").attr("href")).show();
    };
    
// 세일브랜드 --%>
    var saleBrand = $(".sale-brand-list .sale-section .brand-wrap ul");
    var saleBrandTarget = $(".sale-brand-list .sale-section .brand-wrap .list-wrap ul li");
    var saleBrandSize = saleBrandTarget.size();
    $(".sale-brand-list .sale-section .list-wrap").width($(".sale-brand-list .sale-section .list-wrap").width()*2);
    //배너클릭
    saleBrandTarget.click(function(){
    	saleBrandTarget.removeClass("on");
        $(".sale-brand-list .sale-section .sale-listing ul").hide();
        $(this).addClass("on");
        $($(this).find("a").attr("href")).show();
        var thisIndex =  findIndex2(saleBrandTarget);
        if(5 < thisIndex){
        	saleBrandTarget.hide();
            saleBrand.find("li:gt("+(thisIndex-6)+")").show();
        }else{
        	saleBrandTarget.show();
        }
        
    });
    
    //마우스 엔터
    saleBrand.find("li").mouseenter(function(){
        saleBrand.stopTime();
        $(this).trigger("click");
    }).mouseleave(function(){
        var thisIndex =  findIndex2(saleBrandTarget);
        autoChange2(saleBrand, 'saleBrand', 5000, thisIndex);
    });
    
    //오토롤링
    saleBrand.everyTime(5000, 'saleBrand', function(i) {
        if(saleBrandSize != 0){
            var bannerCnt = i % saleBrandSize;
            saleBrand.find("li:eq("+ bannerCnt +")").trigger("click");
        }
    });
    
    $(".sale-brand-list .sale-section .brand-wrap .view-con .prev").click(function(){
        saleBrand.stopTime();
        var thisIndex =  findIndex2(saleBrandTarget);
        saleBrand.find("li:eq("+(thisIndex-1)+")").trigger("click");
        autoChange2(saleBrand, 'saleBrand', 5000, thisIndex-1);
    });
    $(".sale-brand-list .sale-section .brand-wrap .view-con .next").click(function(){
        saleBrand.stopTime();
        var thisIndex =  findIndex2(saleBrandTarget);
        var bannerCnt = (thisIndex+1)%saleBrandSize;
        saleBrand.find("li:eq("+bannerCnt+")").trigger("click");
        autoChange2(saleBrand, 'saleBrand', 5000, bannerCnt);
    });
//everyDay Hot Sale..
    $("#todayProduct").load('/shop/getAjaxDisplayData');
    
    var newBrand = $(".sale-brand .new-brand")

    autoChange_forNewBrand(newBrand, 'newBrand', 5000);
});

function autoChange(obj, title, time, startNum){
    obj.everyTime(time, title, function(i) {
        bannerSize = obj.find("div.autoRolling > ul > li").size();
        bannerCnt = ((startNum == null || startNum == '' || startNum == undefined ? 0 : startNum) +i) % bannerSize;
        obj.find("div.autoRolling > ul > li").hide();
        obj.find("div.autoRolling > ul > li:eq("+ bannerCnt +")").show();
    });
};
function autoChange2(obj, title, time, startNum){
    obj.everyTime(time, title, function(i) {
        bannerSize = obj.find("li").size();
        bannerCnt = ((startNum == null || startNum == '' || startNum == undefined ? 0 : startNum) +i) % bannerSize;
        obj.find("li").hide();
        obj.find("li:eq("+ bannerCnt +")").trigger("click");
    });
};

function findIndex(obj){
    var thisIndex;
    obj.find("div.autoRolling > ul > li").each(function(){
        if($(this).css("display") == "list-item" || $(this).css("display") == "block"){
            thisIndex = $(obj.find("div.autoRolling > ul > li")).index(this);
        }
    }); 
    return thisIndex;
};
function findIndex2(obj){
    var thisIndex;
    obj.each(function(){
    	if($(this).hasClass("on")){
            thisIndex = obj.index(this);
        }
    }); 
    return thisIndex;
};

function autoChange_forNewBrand(obj, title, time, startNum){
    obj.everyTime(time, title, function(i) {
    	bannerSize = obj.find("div.view-con > a").size();
        bannerCnt = ((startNum == null || startNum == '' || startNum == undefined ? 0 : startNum) +i) % bannerSize;
        cont = obj.find(".view-con > a:eq("+bannerCnt+")");
        cont.trigger("click");
    });
};