(function($) {

 var mainbannereffect = function(element, options){
   var settings = $.extend({}, $.fn.mainbannereffect.defaults, options); //초반 셋팅값 가져오기
     var vars = {
            currentSlide: 0,
			oldSlide: 0,
            currentImage: '',
			totaltab: 0,	
			currenttab: 0,
			oldtab: 0,
			arrawidth:0,
			arraheight:0,
            totalSlides: 0,
            randAnim: '',
            running: false,
            paused: false,
            stop: false
        };

       var slider = $(element);		
       slider.append("<ul><li class='imgviewbodx'></li><li class='titlebodx'></li></ul>");
	   var slideroffset = slider.offset(); //메인div위치값 
	    slider.find('.part').each(function() {

           $(".titlebodx", slider).append("<div class='item' tab='" + vars.totaltab + "'  ref='" + vars.totalSlides + "' >" +  $(this).attr("title") + "</div>");
		   $(this).find('img').each(function() {
			    $(".imgviewbodx", slider).append("<a href='" +  $(this).attr("href") + "' target='" + $(this).attr("target") + "'><img src='" + $(this).attr("src") + "' style='display:none' ref='" + vars.totalSlides + "' border=0  tab='" + vars.totaltab + "'></a>");				
            
				vars.totalSlides++;
			});
			vars.totaltab++;
		});    
	        

					
     vars.oldSlide = vars.currentSlide;   
	 vars.oldtab = vars.currenttab;       
	
	   vars.arrawidth = $(".imgviewbodx", slider).find("img").width();
	   vars.arraheight = $(".imgviewbodx", slider).find("img").height();

	if(settings.movetype =="right"){
	 //초기셋팅
    $(".titlebodx", slider).find("img").css({display:'inline'});
	$(".item:first", slider).css({'background-color':settings.bgOverColor,'color':settings.titOverColor});
	$(".imgviewbodx", slider).find("img").css({display:'inline','margin-left':- vars.arrawidth + "px",'z-index':1});
	$(".imgviewbodx", slider).find("img:last").css({display:'inline','margin-left':0,'z-index':1});
    $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30}).animate({'margin-left':0},settings.animSpeed);

	}else if(settings.movetype =="left") {
    //초기셋팅
    $(".titlebodx", slider).find("img").css({display:'inline'});
	$(".item:first", slider).css({'background-color':settings.bgOverColor,'color':settings.titOverColor});
	$(".imgviewbodx", slider).find("img").css({display:'inline','margin-left': vars.arrawidth + "px",'z-index':1});
	$(".imgviewbodx", slider).find("img:last").css({display:'inline','margin-left':0,'z-index':1});
    $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30}).animate({'margin-left':0},settings.animSpeed);
    
	}else if(settings.movetype =="top") {
    //초기셋팅
    $(".titlebodx", slider).find("img").css({display:'inline'});
	$(".item:first", slider).css({'background-color':settings.bgOverColor,'color':settings.titOverColor});
	$(".imgviewbodx", slider).find("img").css({display:'inline','margin-top': -vars.arraheight + "px",'z-index':1});
	$(".imgviewbodx", slider).find("img:last").css({display:'inline','margin-top':0,'z-index':1});
    $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30}).animate({'margin-top':0},settings.animSpeed);

	}else if(settings.movetype =="bottom") {
    //초기셋팅
    $(".titlebodx", slider).find("img").css({display:'inline'});
	$(".item:first", slider).css({'background-color':settings.bgOverColor,'color':settings.titOverColor});
	$(".imgviewbodx", slider).find("img").css({display:'inline','margin-top': vars.arraheight + "px",'z-index':1});
	$(".imgviewbodx", slider).find("img:last").css({display:'inline','margin-top':0,'z-index':1});
    $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30}).animate({'margin-top':0},settings.animSpeed);
    
	}else if(settings.movetype =="fade") {
    //초기셋팅
    $(".titlebodx", slider).find("img").css({display:'inline'});
	$(".item:first", slider).css({'background-color':settings.bgOverColor,'color':settings.titOverColor});
	$(".imgviewbodx", slider).find("img").css({display:'inline','left': 0 + "px",'top': 0 + "px",'z-index':1, opacity: 0});
	$(".imgviewbodx", slider).find("img:last").css({display:'inline','left':0,'top':0,'z-index':1,opacity: 0});
    $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,opacity: 0}).animate({opacity:1},settings.animSpeed);
	}else if(settings.movetype =="none") {
    //초기셋팅
    $(".titlebodx", slider).find("img").css({display:'inline'});
	$(".item:first", slider).css({'background-color':settings.bgOverColor,'color':settings.titOverColor});
	$(".imgviewbodx", slider).find("img").css({display:'inline','left': 0 + "px",'top': 0 + "px",'z-index':1, opacity: 0});
	$(".imgviewbodx", slider).find("img:last").css({display:'inline','left':0,'top':0,'z-index':1,opacity: 0});
    $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,opacity: 1});
	}

	 var timer = 0;
	  timer = setInterval(function(){ imgeffectRun(slider, settings, false); }, settings.pauseTime);




	var imgeffectRun = function(slider, settings, nudge){
       //Trigger the lastSlide callback
	   if(settings.movetype =="right"){
	      $(".imgviewbodx", slider).find("img").css({'z-index':0,'margin-left':-vars.arrawidth});
		  $(".imgviewbodx", slider).find("img").eq(vars.oldSlide).css({'z-index':0,'margin-left':0});
        }else if(settings.movetype =="left") {
		  $(".imgviewbodx", slider).find("img").css({'z-index':0,'margin-left':vars.arrawidth});
		  $(".imgviewbodx", slider).find("img").eq(vars.oldSlide).css({'z-index':0,'margin-left':0});
        }else if(settings.movetype =="top") {
		  $(".imgviewbodx", slider).find("img").css({'z-index':0,'margin-top':-vars.arraheight});
		  $(".imgviewbodx", slider).find("img").eq(vars.oldSlide).css({'z-index':0,'margin-top':0});
		}else if(settings.movetype =="bottom") {
		  $(".imgviewbodx", slider).find("img").css({'z-index':0,'margin-top':vars.arraheight});
		  $(".imgviewbodx", slider).find("img").eq(vars.oldSlide).css({'z-index':0,'margin-top':0});
		}else if(settings.movetype =="fade") {
		  $(".imgviewbodx", slider).find("img").css({'z-index':0,'left':0,'top':0,opacity:0});
		  $(".imgviewbodx", slider).find("img").eq(vars.oldSlide).css({'z-index':0,'left':0,'top':0,opacity:1}).animate({opacity:0},settings.animSpeed);
		}else if(settings.movetype =="none") {
		  $(".imgviewbodx", slider).find("img").css({'z-index':0,'left':0,'top':0,opacity:0});
		  $(".imgviewbodx", slider).find("img").eq(vars.oldSlide).css({'z-index':0,'left':0,'top':0,opacity:0});
		}
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
				
			//돌아온값이 0일때 결정
			if(vars.currentSlide < 0) vars.currentSlide = (vars.totalSlides - 1);
            //그룹이 다른경우
			if(vars.currenttab != $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).attr("tab")){
			  vars.currenttab = $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).attr("tab");

            $(".item", slider).each(function() {           
                $(this).css({'background-color':settings.bgOutColor,'color':settings.titOutColor,'text-align':'center'});
			});
				    //오버스타일추가
				//	alert($(".imgviewbodx", slider).find("img").eq(vars.currentSlide).attr("tab"));
			$(".item", slider).eq($(".imgviewbodx", slider).find("img").eq(vars.currentSlide).attr("tab")).css({'background-color':settings.bgOverColor,'color':settings.titOverColor});
                
			}
          			
           // $(".imgview", slider).animate({'left' : - (settings.imgWidth * vars.currentSlide) + 'px'}, settings.animSpeed)
            if(settings.movetype =="right"){
				   $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,'margin-left': -vars.arrawidth}).animate({'margin-left':0}, settings.animSpeed);
             }else if(settings.movetype =="left") {
				   $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,'margin-left': vars.arrawidth}).animate({'margin-left':0}, settings.animSpeed);
		     }else if(settings.movetype =="top") {
				   $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,'margin-top': -vars.arrawidth}).animate({'margin-top':0}, settings.animSpeed);
		     }else if(settings.movetype =="bottom") {
				   $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,'margin-top': vars.arrawidth}).animate({'margin-top':0}, settings.animSpeed);
		     }else if(settings.movetype =="fade") {
				 
				   $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,'left':0,'top':0, opacity:0}).animate({opacity:1},settings.animSpeed);
		     }else if(settings.movetype =="none") {
				 
				   $(".imgviewbodx", slider).find("img").eq(vars.currentSlide).css({'z-index':30,'left':0,'top':0, opacity:1});
			 }
	 vars.oldSlide = vars.currentSlide;   
	 vars.oldtab = vars.currenttab;   


	}


   //오버설정
     $(".titlebodx", slider).hover(function(){
                vars.paused = true;
                clearInterval(timer);
                timer = '';              

            }, function(){
                vars.paused = false;
				
                //Restart the timer
				if(timer == '' && !settings.manualAdvance){
					timer = setInterval(function(){   imgeffectRun(slider,  settings, false);	}, settings.pauseTime);
				}
            });
	
      
	  //서브아이템 오버
	  
     $(".item", slider).live("click",function(){
		    vars.currentSlide = $(this).attr("ref")-1;
			imgeffectRun(slider, settings, false);
	 });

   settings.afterLoad.call(this);
	return this;
	 };


  
 $.fn.mainbannereffect = function(options) {
    //데이터 로딩셋팅
        return this.each(function(key, value){
            var element = $(this);
			
			 mainbannereffect($(element), options);
        });

	};

//Default settings
	$.fn.mainbannereffect.defaults = {
		animSpeed: 1000, //이벤트 속도		
		pauseTime: 4000, //대기시간
		startSlide: 0,
		titOverColor:"#e71818",   //타이틀가로
		titOutColor:"#fdf9f0",
        bgOverColor:"#e71818",   //타이틀가로
		bgOutColor:"#fdf9f0",
		movetype: "right",		
		pauseOnHover: true,
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){},
        lastSlide: function(){},
        afterLoad: function(){}
	};
	
	$.fn._reverse = [].reverse;

})(jQuery);

