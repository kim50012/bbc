(function($) {

 var brdbannereFfect = function(element, options){
   var settings = $.extend({}, $.fn.brdbannereFfect.defaults, options); //초반 셋팅값 가져오기
     var vars = {
            currentSlide: 0,
			oldSlide: 0,
			startSlide: 0,
			countImage: 0,
            currentImage: '',
			totalpage: 0,	
			currenttab: 0,	
			arraheight:0,
			arrawidth:0,
			totalSlides:0,
            oldpage: 0,
			currentpage: 0,
            randAnim: '',
            running: false,
            paused: false,
            stop: false
        };

       var slider = $(element);		
	    //이미지사이즈
	    vars.arraheight = $(".wrapper-li", slider).find("img").height();
		 vars.arrawidth = $(".wrapper-li", slider).find("img").width();
		 vars.countImage = $(".wrapper-li", slider).length;
		$(".wrapper-html" , slider).append("<div class='wrapper-body'></div>");
 	    slider.find('.wrapper-li').each(function() {
			$(this).css({'z-index': vars.countImage});

		 $(".wrapper-body" , slider).append("<span  id='tailbtn' class='numimg' rel='" + vars.totalSlides + "' page='" + parseInt( vars.totalSlides / settings.pagecut ) + "'><img src='" + $(this).attr("out") + "' out='" + $(this).attr("out") + "' over='" + $(this).attr("over") + "' border=0></span>"); 
			vars.totalpage =parseInt( vars.totalSlides / settings.pagecut ) ;
		   vars.countImage--;
			vars.totalSlides++;
		});    
	/* 초기셋팅 */        
   // vars.currentSlide = Math.floor(Math.random() * vars.totalSlides);  //
   
    vars.oldSlide = vars.currentSlide;
	vars.currentpage = $('#tailbtn', slider).eq(vars.currentSlide).attr('page');
	vars.oldpage = vars.currentpage ;

	$("#tailbtn", slider).eq(vars.currentSlide).find("img").attr("src",$("#tailbtn", slider).eq(vars.currentSlide).find("img").attr("over"));      
   
/* 초기셋팅 */  
  
	  if(settings.moveType =="top"){
          $('.wrapper-li', slider).css({top: vars.arraheight + 'px'});      
	      $('.wrapper-li', slider).eq(vars.currentSlide).css({top: 0 + 'px'});
	  }
      else if(settings.moveType =="fade"){
          $('.wrapper-li', slider).css({opacity:0});     
	      $('.wrapper-li', slider).eq(vars.currentSlide).css({opacity: 1});
	  }   	  
	  else if(settings.moveType =="bottom"){
          $('.wrapper-li', slider).css({top: - vars.arraheight + 'px'});     
	      $('.wrapper-li', slider).eq(vars.currentSlide).css({top: 0 + 'px'});

	  }   
	  else if(settings.moveType =="right"){
          $('.wrapper-li', slider).css({left: - vars.arrawidth + 'px'});     
	      $('.wrapper-li', slider).eq(vars.currentSlide).css({left: 0 + 'px'});

	  } else if(settings.moveType =="left"){
          $('.wrapper-li', slider).css({left:  vars.arrawidth + 'px'});     
	      $('.wrapper-li', slider).eq(vars.currentSlide).css({left: 0 + 'px'});

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
			vars.currentpage = $('#tailbtn', slider).eq(vars.currentSlide).attr('page');
			
			 $("#tailbtn", slider).each(function() {  $(this).find("img").attr("src",$(this).find("img").attr("out"));   });
			 $("#tailbtn", slider).eq(vars.currentSlide).find("img").attr("src",$("#tailbtn", slider).eq(vars.currentSlide).find("img").attr("over"));      
            
				if(vars.currentpage != vars.oldpage ){              //하단이동
				
			  var wd = ($("#tailbtn[rel='1']", slider).width() * settings.pagecut ) * vars.currentpage;
			 
              $(".wrapper-body", slider).animate({left: -wd + 'px'}, settings.animSpeed);			
			
              vars.oldpage = vars.currentpage;
			}
            
			if(settings.moveType == "top"){  //위쪽이동
				       $('.wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({top: - vars.arraheight + 'px'}, settings.animSpeed, '',function(){ 
					    $(this).css({top : vars.arraheight + 'px'})
					   
					   });
                       $('.wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({top: 0 + 'px'}, settings.animSpeed);					  
				

			}else if(settings.moveType == "fade"){  //
				
				       $('.wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({opacity:0}, settings.animSpeed, '',function(){   });
                       $('.wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({opacity:1}, settings.animSpeed);					  

			}else if(settings.moveType == "bottom"){
                  
			    $('.wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({top:  vars.arraheight + 'px'}, settings.animSpeed, '',function(){ 
					    $(this).css({top :  - vars.arraheight + 'px'})
					   
					   });
                       $('.wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({top: 0 + 'px'}, settings.animSpeed);				


			}else if(settings.moveType == "right"){
                  
			    $('.wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({left:  vars.arrawidth + 'px'}, settings.animSpeed, '',function(){ 
					    $(this).css({left :  - vars.arrawidth + 'px'})
					   
					   });
                       $('.wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({left: 0 + 'px'}, settings.animSpeed);				


			}else if(settings.moveType == "left"){
                  
			    $('.wrapper-li', slider).eq(vars.oldSlide).css({'z-index':1}).animate({left: - vars.arrawidth + 'px'}, settings.animSpeed, '',function(){ 
					    $(this).css({left :   vars.arrawidth + 'px'})
					   
					   });
                       $('.wrapper-li', slider).eq(vars.currentSlide).css({'z-index':10}).animate({left: 0 + 'px'}, settings.animSpeed);				


			}    
          
         
          vars.oldSlide = vars.currentSlide;
	}
   
   $("#tailbtn", slider).click(function(){
	      vars.currentSlide = $(this).index() -1;
		
		imgeffectRun(slider,  settings, false);
           
   });
   $(".wrapper-left", slider).click(function(){
		if(vars.currentpage > 0){
           vars.currentSlide =  $('.numimg[page="' + (vars.currentpage - 1) + '"]:first', slider).attr("rel")  -1;
           	imgeffectRun(slider,  settings, false);
		}
		 
   });
   $(".wrapper-right", slider).click(function(){
		if(vars.currentpage != vars.totalpage){
           vars.currentSlide =  $('.numimg[page="' + (vars.currentpage ) + '"]:last', slider).attr("rel");
           	imgeffectRun(slider,  settings, false);
		}
		 
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


  
 $.fn.brdbannereFfect = function(options) {
    //데이터 로딩셋팅
        return this.each(function(key, value){
            var element = $(this);
			
			 brdbannereFfect($(element), options);
        });

	};

//Default settings
	$.fn.brdbannereFfect.defaults = {
		animSpeed: 1500, //이벤트 속도
		pauseTime: 6000, //대기시간
		moveType: "top", //이동방향
		pagecut: 6,
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

