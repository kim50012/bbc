/*
	http://www.blueb.co.kr
	date : 2010-12-26
*/

$(function(){

$.event.special.mousewheel = {
	setup: function() {
		var handler = $.event.special.mousewheel.handler;
		
		if ( $.browser.mozilla )
			$(this).bind('mousemove.mousewheel', function(event) {
				$.data(this, 'mwcursorposdata', {
					pageX: event.pageX,
					pageY: event.pageY,
					clientX: event.clientX,
					clientY: event.clientY
				});
			});
	
		if ( this.addEventListener )
			this.addEventListener( ($.browser.mozilla ? 'DOMMouseScroll' : 'mousewheel'), handler, false);
		else
			this.onmousewheel = handler;
	},
	
	teardown: function() {
		var handler = $.event.special.mousewheel.handler;
		
		$(this).unbind('mousemove.mousewheel');
		
		if ( this.removeEventListener )
			this.removeEventListener( ($.browser.mozilla ? 'DOMMouseScroll' : 'mousewheel'), handler, false);
		else
			this.onmousewheel = function(){};
		
		$.removeData(this, 'mwcursorposdata');
	},
	
	handler: function(event) {
		var args = Array.prototype.slice.call( arguments, 1 );
		
		event = $.event.fix(event || window.event);
		$.extend( event, $.data(this, 'mwcursorposdata') || {} );
		var delta = 0, returnValue = true;
		
		if ( event.wheelDelta ) delta = event.wheelDelta/120;
		if ( event.detail     ) delta = -event.detail/3;
		
		event.data  = event.data || {};
		event.type  = "mousewheel";
		
		args.unshift(delta);
		args.unshift(event);

		return $.event.handle.apply(this, args);
	}
};

$.fn.extend({
	mousewheel: function(fn) {
		return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
	},
	
	unmousewheel: function(fn) {
		return this.unbind("mousewheel", fn);
	}
});


init = function() {
  $selected_contents = $('.acc_contents:first');  
  show_barmenu($selected_contents, true);
  $selected_contents.width(contents_width); 
  $selected_contents.find('.thumb').show();
  
  setRollingTimer();
}

show_mainbox_with_effect = function() {
  
  var factor = efactors[delta];

  var width1 = $selected_contents.width() - factor < barmenu_width ? barmenu_width : $selected_contents.width() - factor;
  var width2 = $contents.width() + factor > barmenu_width + mainbox_width ? contents_width : $contents.width() + factor;
  
  $selected_contents.width(width1);
  $selected_contents.find('.mainbox').width(width1 - barmenu_width);
  $contents.width(width2);

  if (width2 == contents_width) {
	$contents.find('.thumb').show('drop', {distance:90}, 300, function(){
	  bAnimating = false;
	  $selected_contents = $contents;
	  delta = 0;
	  setRollingTimer();
	});
	
  } else {
	delta += 1;
	window.setTimeout("show_mainbox_with_effect()", 90);
  }
}

show_barmenu = function($el, bShow) {
  if (bShow) {
	$el.find('.barmenu .off').hide();
	// $el.find('.barmenu .on').show();
  } else {
	// $el.find('.barmenu .on').hide();
	$el.find('.barmenu .off').show();        
  }
}

show_contents = function() {
  
  bAnimating = true;

  show_barmenu($selected_contents, false);
  show_barmenu($contents, true);
  show_mainbox_with_effect();
  $selected_contents.find('.thumb').hide();

}

rolling = function() {
  
  if (bAnimating) return false;
  
  $contents = $selected_contents.next('.acc_contents');
  if ($contents.length <= 0)
	$contents = $('.acc_contents:first');
  
  show_contents();
}

setRollingTimer = function() {
  if (timer) {
	window.clearTimeout(timer);
	timer = null;
  }

  timer = window.setTimeout("rolling()", 2000);  //·Ñ¸µ ½Ã°£ 3000=3ÃÊ
}

var $selected_contents = null;
var $contents = null;
var barmenu_width = 94;     //´ÝÇûÀ»¶§ °¡·Î Æø
var mainbox_width = 269;    //ÄÜÅÙÃ÷·Î ÆîÃÄÁú ÀÌ¹ÌÁö °¡·Î Æø
var contents_width = barmenu_width + mainbox_width;
var delta = 0;
var bAnimating = false;

var efactors = [70, 70, 70, 70, 70, 70, 70, 70, 70, 35, 27, 18, 10, 3, 3, 2, 2, 2, 2, 2];

var timer = null;
var bForwordRolling = true;

init();
$('.acc_contents .barmenu .off').click(function() {
  
  if (bAnimating) return false;
  $contents = $(this).parents('.acc_contents');
  show_contents();
  
});

//ÀÌÀü ¹öÆ°
$('.nav_prev').click(function() {
  
  if (bAnimating) return false;
  
  var $prev_contents = $selected_contents.prev('.acc_contents');
  if ($prev_contents.length <= 0)
	$prev_contents = $('.acc_contents:last');
  
  $contents = $prev_contents; 
  
  show_contents();
  
});

//´ÙÀ½ ¹öÆ°
$('.nav_next').click(function() {
  
  if (bAnimating) return false;
  
  var $next_contents = $selected_contents.next('.acc_contents');
  if ($next_contents.length <= 0) 
	$next_contents = $('.acc_contents:first');
  
  $contents = $next_contents; 
  show_contents();
		
});


//¸¶¿ì½º ÈÙ
$('.acc_contents_wrap').bind('mousewheel',this,function(event,delta) {
	if(delta > 0) {
		$('.nav_prev').click()
	}
	else if(delta < 0) {
		$('.nav_next').click()
	}
	return false;
});
});