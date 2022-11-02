jQuery(function($){
    //everyday hot sale
    $("#main_everyday").load("/shop/getAjaxDisplayData");
    
    //메인베너
    var eventList = $("#event_list");
    var eventNav = $("#event_nav");
    var eventSlide = eventList.touchSlider({
        flexible : true,
        speed : 300,
        paging : eventNav.find(".page u"),
        btn_prev : eventNav.find(".prev"),
        btn_next : eventNav.find(".next"),
        counter : function (e) {
            var u = eventNav.find(".page u");
            var n = e.current-1;
            u.removeClass("on");
            u.eq(n).addClass("on");
        }
    });

    //best of best
    var bestList = $("#best_list");
    var bestNav = $("#best_nav");
    var bestSlide = bestList.touchSlider({
        flexible : true,
        speed : 300,
        paging : bestNav.find(".page u"),
        btn_prev : bestNav.find(".prev"),
        btn_next : bestNav.find(".next"),
        counter : function (e) {
            var u = bestNav.find(".page u");
            var n = e.current-1;
            u.removeClass("on");
            u.eq(n).addClass("on");
        }
    });

    //new arrival
    var swiperLoop = $('#main_newest .box').swiper({
        speed : 200, //speed fix
        slidesPerSlide : 3,
        loop: true,
        //pagination : false,
        initialSlide: 0,
        useCSS3Transforms : true,
        //Namespace
        slideElement : 'div',
        slideClass : 's',
        slideActiveClass : 'on',
        wrapperClass : 'list',
        //paginationClass: 'main_newest_page' ,
        //paginationActiveClass: 'on',
    });

    //인기 event 10
    var swiperLoop = $('#shocking_list').swiper({
        slidesPerSlide : 3,
        loop: true,
        initialSlide : 0,
        paginationClass: 'swiper-pagination-switch' ,
        paginationActiveClass : 'swiper-active-switch' 
        //paginationActiveClass: 'active',
    });

    //#main_newest
    /*$(function(){
        var bestList = $("#newest_list");
        var bestNav = $("#newest_nav");
        var bestSlide = bestList.touchSlider({
            flexible : true,
            speed : 300,
            paging : bestNav.find(".page u"),
            btn_prev : bestNav.find(".prev"),
            btn_next : bestNav.find(".next"),
            counter : function (e) {
                var u = bestNav.find(".page u");
                var n = e.current-1;
                u.removeClass("on");
                u.eq(n).addClass("on");
            }
        });
    });*/

});