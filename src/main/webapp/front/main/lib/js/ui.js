var depth1;
var depth2;
var screenWidth = $(window).width();
$(document).ready(function(){
    $('.menu').on('click',function(e){
        $('.navi-wrap').fadeIn(200);
        $("html, body, #wrap").css({'height':'100%','overflow':'hidden'});
    });
    $('.btn-close').on('click',function(e){
        $('.navi-wrap').fadeOut(200);
        $("html, body, #wrap").css({'height':'','overflow':''});
    });
});
