jQuery(function($){
	 var bannerSize = $(".event-menu ul li").size();
    var itemWidth = $(".event-menu ul li").width();
    var bannerLen = (bannerSize*itemWidth)+bannerSize;
    var viewSize = itemWidth*1+3;
    
    var banner = $(".event-menu ul li a");
    var bannerEvent = $(".event-menu ul");
    
    /*** 초기 배너 모션 시작 ***/
    function startEvent(where){
        bannerEvent.everyTime(5000, 'banner', function(i) {
            if(where != null && where != undefined && where != ""){
                i = where++;
            }
            idx = i % bannerEvent.children("li").size();
            banner.eq(idx).click();
        });
    }
    
    /*** 시작 ***/
    startEvent();
    
    /*** 배너 mouseout ***/
    banner.mouseout(function(){
        var tagTxt = $(this).attr("href").substr(7);
        startEvent(tagTxt);
    });
    /*** 배너 mouseover ***/
    banner.mouseover(function(){
        bannerEvent.stopTime();
        $(".event-menu ul li").attr("class" , "");
        $(this).click();
    });
    /*** 배너정지 버튼***/
    $(".event-banner .play-con span.stop").click(function(){
        bannerEvent.stopTime();
        imgReplace($(this));
    });
    /*** 배너시작 버튼***/
    $(".event-banner .play-con span.play").click(function(){
        bannerpoi = $(".event-menu ul").find(" li.selected a").attr("href").substr(7);
        startEvent(bannerpoi);
        imgReplace($(this));
    });
    imgReplace = function(obj01){
		$(".event-banner .play-con span").each(function(){
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
		});
		obj01.find("img").attr("src" , obj01.find("img").attr("src").replace("_off.gif" , "_on.gif"));
	};
    
    /*** 배너타이틀 롤링  ***/
    banner.click(function(){
        bannerClick($(this));
        imgReplace($(this));
    });
    /***  banner click 공통 ***/
    bannerClick = function(obj){
        $(".event-menu ul").width(bannerLen);//전체 ul크기
            var text = obj.attr("href").substr(7);//현제 넘버
            
            $(".event-list ul li").stop().animate({"opacity" : 0, "z-index" : 0} , 400);
            $(".event-menu ul li").attr("class" , "");
            obj.parent().attr("class" , "selected");
            $(obj.attr("href")).stop().animate({"opacity" : "1", "z-index" : 1} , 500);
            
            if(text == 1) {//1일때 초기화
                $(".event-menu ul").animate({"left" : 0} ,500);
            }else if((text)%3 == 1) {//4,7 일대 체인지
                $(".event-menu ul").animate({"left" : "-"+ (viewSize * ((text-1)/3))} ,500);
            }
            
            return false;
    };
    
    /***  다음버튼 클릭 ***/
    $(".event-menu-wrap .next").click(function(){
        var target = $(".event-menu ul").find("li[class='selected']").index()+1;
        bannerEvent.stopTime();
        if(target < 4){//123
            target = 4;
        }else if(target < 7 && 6 < bannerSize){//456
            target = 7;
        }else{//789
            target = 1;
        }
        banner.eq(target-1).click();
        startEvent(target);
    });
    
    /***  이전버튼 클릭 ***/
    $(".event-menu-wrap .prev").click(function(){
        var target = $(".event-menu ul").find("li[class='selected']").index()+1;
        bannerEvent.stopTime();
        if(target < 4 && 6 < bannerSize){//123
            target = 7;
        }else if(target < 7){
            target = 1;//456
        }else{//789
            target = 4;
        }
        banner.eq(target-1).click();
        startEvent(target);
    });
    
  
});