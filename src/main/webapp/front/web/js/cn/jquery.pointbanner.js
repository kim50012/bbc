(function($) {

 var pointlisteFfect = function(element, options){
   var settings = $.extend({}, $.fn.pointlisteFfect.defaults, options); //초반 셋팅값 가져오기
     var vars = {
            currentSlide: 0,
			oldSlide: 0,
			startSlide: 0,
			countImage: 0,
            currentImage: '',
			totaltab: 0,	
			currenttab: 0,	
			arrawidth:0,
			arraheight:0,
			arrawidth2:0,
            totalSlides: 0,
            randAnim: '',
            running: false,
            paused: false,
            stop: false
        };

       var slider = $(element);		
	    //이미지사이즈
		 vars.countImage = $(".point_wrapper-li", slider).length;
		vars.arrawidth = $(".point_wrapper-li", slider).find("img").width();
	    vars.arraheight = $(".point_wrapper-li", slider).find("img").height();
 	    slider.find('.point_wrapper-li').each(function() {
					$(this).css({'z-index': vars.countImage});
			    if(settings.tailType =="number"){ $(".wrapper-Num", slider).append("<span id='tailbtn' class='num' rel='" + vars.totalSlides + "'>" + ( vars.totalSlides + 1 ) + "</span>"); }
				else{ $(".wrapper-Num" , slider).append("<span  id='tailbtn' class='numimg' rel='" + vars.totalSlides + "' ><img src='" + $(this).attr("out") + "' out='" + $(this).attr("out") + "' over='" + $(this).attr("over") + "' border=0></span>"); }
		        //else{ $(".wrapper-Num").append("<span  id='tailbtn' class='numimg' rel='" + vars.totalSlides + "' style='background-image:url(" + $(this).attr("out") + ")' out='" + $(this).attr("out") + "' over='" + $(this).attr("over") + "'>" + vars.totalSlides + "</span>"); }
			
			vars.countImage--;
			vars.totalSlides++;
		});    
	        
    vars.currentSlide = Math.floor(Math.random() * vars.totalSlides);
    vars.oldSlide = vars.currentSlide;
    
	  if(settings.moveType =="top"){
          $('.point_wrapper-li', slider).css({top: vars.arraheight + 'px'});     
	      $('.point_wrapper-li', slider).eq(vars.currentSlide).css({top: 0 + 'px'});
	  }else  if(settings.moveType =="bottom"){
          $('.point_wrapper-li', slider).css({top: - vars.arraheight + 'px'});     
	      $('.point_wrapper-li', slider).eq(vars.currentSlide).css({top: 0 + 'px'});
   	  }else if(settings.moveType =="left"){
          $('.point_wrapper-li', slider).css({left: vars.arrawidth + 'px'});     
	      $('.point_wrapper-li', slider).eq(vars.currentSlide).css({left: 0 + 'px'});
	  }else if(settings.moveType =="fade"){
          $('.point_wrapper-li', slider).css({opacity: 0});     
	      $('.point_wrapper-li', slider).eq(vars.currentSlide).css({opacity: 1});
	  }else{
          $('.point_wrapper-li', slider).css({left: - vars.arrawidth + 'px'});     
	      $('.point_wrapper-li', slider).eq(vars.currentSlide).css({left: 0 + 'px'});

	  }        
   
    

    if(settings.tailType =="number"){	$(".num", slider).eq(vars.currentSlide).addClass("active");  }
	else{ $(".numimg", slider).eq(vars.currentSlide).find("img").attr("src", $(".numimg", slider).eq(vars.currentSlide).find("img").attr("over"))  }

	 var timer = 0;
	timer = setInterval(function(){ imgeffectRun(slider, settings, false); }, settings.pauseTime);




	var imgeffectRun = function(slider, settings, nudge){
       //Trigger the lastSlide callback
	     
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
			if(settings.tailType =="number"){
                $(".num", slider).removeClass("active");
				$(".num", slider).eq(vars.currentSlide).addClass("active");
			}else{
				slider.find('.numimg').each(function() {
                 $(this).find("img").attr("src",$(this).find("img").attr("out"));			
				});

                $(".numimg", slider).eq(vars.currentSlide).find("img").attr("src",$(".numimg", slider).eq(vars.currentSlide).find("img").attr("over"));
			}
            
			if(settings.moveType == "top"){  //위쪽이동
				       $('.point_wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({top: - vars.arraheight + 'px'}, settings.animSpeed, '',function(){ 
					    $(this).css({top : vars.arraheight + 'px'})
					   
					   });
                       $('.point_wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({top: 0 + 'px'}, settings.animSpeed);					  
				

			}else if(settings.moveType == "bottom"){  //아래이동
                  
			    $('.point_wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({top:  vars.arraheight + 'px'}, settings.animSpeed, '',function(){ 
					    $(this).css({top :  - vars.arraheight + 'px'});					   
					   });
                       $('.point_wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({top: 0 + 'px'}, settings.animSpeed);				
			}else if(settings.moveType == "left"){  //왼쪽이동
				       $('.point_wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({left: - vars.arrawidth + 'px'}, settings.animSpeed, '',function(){     $(this).css({left : vars.arrawidth + 'px'});		   });
                       $('.point_wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({left: 0 + 'px'}, settings.animSpeed);					  
				
            }else if(settings.moveType == "fade"){  //왼쪽이동
				       $('.point_wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({opacity: 0}, settings.animSpeed, '',function(){  	   });
                       $('.point_wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({opacity: 1}, settings.animSpeed);					  
				
			}else{
                  
			    $('.point_wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({left:  vars.arrawidth + 'px'}, settings.animSpeed, '',function(){   $(this).css({left :  - vars.arrawidth + 'px'});	 });
                       $('.point_wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({left: 0 + 'px'}, settings.animSpeed);				


			}  

          vars.oldSlide = vars.currentSlide;
	}
   
   $("#tailbtn", slider).click(function(){
	      vars.currentSlide = $(this).index() -1;
		imgeffectRun(slider,  settings, false);
           
   });

   //오버설정
    slider.hover(function(){
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
	
      

   settings.afterLoad.call(this);
	return this;
	 };


  
 $.fn.pointlisteFfect = function(options) {
    //데이터 로딩셋팅
        return this.each(function(key, value){
            var element = $(this);
			
			 pointlisteFfect($(element), options);
        });

	};

//Default settings
	$.fn.pointlisteFfect.defaults = {
		animSpeed: 1500, //이벤트 속도
		pauseTime: 6000, //대기시간
		moveType: "top", //이동방향
		tailType: "number", //버튼타입
		pauseOnHover: true,
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){},
        lastSlide: function(){},
        afterLoad: function(){}
	};
	
	$.fn._reverse = [].reverse;

})(jQuery);

