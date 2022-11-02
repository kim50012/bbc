(function($) {

 var tablisteffect = function(element, options){
   var settings = $.extend({}, $.fn.tablisteffect.defaults, options); //초반 셋팅값 가져오기
     var vars = {
            currentSlide: 0,
            currentImage: '',
			opleft: [],
			optop: [],
			arrawidth:0,
			arraheight:0,
            totalSlides: 0,
            randAnim: '',
            running: false,
            paused: false,
            stop: false
        };

       var slider = $(element);		
     
	   var slideroffset = slider.offset(); //메인div위치값 
		   slider.find('.tablist_adbody').find(".tabname").each(function() {
			    $(".ssgdfs_tab_menu", slider).find("ul").append("<li  rel='" + vars.totalSlides + "'><span>" + $(this).attr("title") + "</span></li>");				
              	vars.totalSlides++;
			});
		
	
	// $(".itemmainbody", slider).css({'width': vars.totalSlides * settings.titWidth + 'px'});
	 //초기셋팅
    $(".ad:first", slider).css({'z-index':10, opacity:1}).show();
	$(".ssgdfs_tab_menu", slider).find("li:first").addClass("active");
   
     var timer = 0;
 	  timer = setInterval(function(){ imgeffectRun(slider, settings, false); }, settings.pauseTime);




	var imgeffectRun = function(slider, settings, nudge){
       //Trigger the lastSlide callback
	        $(".ad", slider).eq(vars.currentSlide).css({ opacity : 1 ,'z-index':1}).animate({opacity:0}, settings.animSpeed);
            if(vars && (vars.currentSlide == vars.totalSlides - 1)){ 
				settings.lastSlide.call(this);
			}
            if((!vars || vars.stop) && !nudge) return false;
			settings.beforeChange.call(this);
			vars.currentSlide++;
			if(vars.currentSlide == vars.totalSlides){ 
				vars.currentSlide = 0;
				settings.slideshowEnd.call(this);
			}
		    $(".ssgdfs_tab_menu", slider).find("li").removeClass("active");	
			$(".ad", slider).eq(vars.currentSlide).css({ opacity : 0,'z-index':10}).animate({opacity:1}, settings.animSpeed);
       	    $(".ssgdfs_tab_menu", slider).find("li").eq(vars.currentSlide).addClass("active");	
            


	}
   
   slider.hover(function(){
          clearInterval(timer);
   },function(){
        timer = setInterval(function(){ imgeffectRun(slider, settings, false); }, settings.pauseTime);
   });
   $(".ssgdfs_tab_menu", slider).find("li").click(function(){
	        $(".ad", slider).eq(vars.currentSlide).css({ opacity : 1 ,'z-index':1}).animate({opacity:'0.5'}, settings.animSpeed);
            $(".ssgdfs_tab_menu", slider).find("li").removeClass("active");	
			vars.currentSlide = $(this).attr("rel");
			$(".ad", slider).eq(vars.currentSlide).css({ opacity : 0,'z-index':10}).animate({opacity:1}, settings.animSpeed);
       	    $(".ssgdfs_tab_menu", slider).find("li").eq(vars.currentSlide).addClass("active");	
    });
   settings.afterLoad.call(this);
	return this;
	 };


  
 $.fn.tablisteffect = function(options) {
    //데이터 로딩셋팅
        return this.each(function(key, value){
            var element = $(this);
			
			 tablisteffect($(element), options);
        });

	};

//Default settings
	$.fn.tablisteffect.defaults = {
		animSpeed: 500, //이벤트 속도

		pauseTime: 3000, //대기시간
		startSlide: 0,
		imgWidth: 507, //이미지가로
		imgheight: 251, //이미지세로
		titheight:96,   //타이틀세로		
		titcnt:10,
		pauseOnHover: true,
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){},
        lastSlide: function(){},
        afterLoad: function(){}
	};
	
	$.fn._reverse = [].reverse;

})(jQuery);

