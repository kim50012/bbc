$(function(){
	var moveS = 0; 
	var moveE = 0;
	$(document).on('touchstart mousedown','.item-box',function(e){ 
		$(this).addClass('mouseDown');
		if(e.pageX){
			var event = e.pageX;
			moveS = event;
			return false;
		}else{
			var event = e.originalEvent;
			moveS = event.touches[0].pageX;
		}
	});
	
	$(document).on('touchmove mousemove','.item-box',function(e){
		if($(this).hasClass('mouseDown')){
			$(this).addClass('touchmove');
			if(e.pageX){
				var event = e.pageX;
				moveE = event;
			}else{
				var event = e.originalEvent;
				moveE = event.touches[0].pageX;	
			}
			var move = -55 + (parseInt(moveS - moveE)/4);
			//var right = -parseInt($(window).outerWidth()*0.55);
			//var move = right + (parseInt(moveS - moveE));
			
			if(move > 0){ move = 0};
			$('.detail-item',this).show().find('.detail-text').css({'right':move})
		}
	});
	
	$(document).on('touchend mouseup','.item-box', function(e) {
		$(this).removeClass('mouseDown');
		if($(this).hasClass('touchmove')){
			$(this).removeClass('touchmove');
			if(moveS - moveE  > 200){
				$(this).find('.detail-item').show().find('.detail-text').animate({'right':'0%'});
			}else{
				$(this).find('.detail-item').delay(200).fadeOut().find('.detail-text').animate({'right':'-55%'});
			};
		}
	});
});