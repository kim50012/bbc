

	var banNow = banOld = 0, banTime, total;

	(function($){
		$(document).ready(function(){
			$('.top100-main-box div.bubble-box:first').css({
				"top" : "0",
				"opacity" : "1"
			});
			banTime = setInterval("rollingBan()", 5000);
	 
			$('.top100-main-box div.bubble-box').hover(
				function() {
					if(banTime) {
						clearInterval(banTime);
					}
				},
				function() {
					if(banTime) {
						clearInterval(banTime);
					}
	 
				banTime = setInterval("rollingBan()", 5000);
				}
			);
		});
	})(window.jQuery);
	
	function rollingBan()
	{
		total = $('.top100-main-box div.bubble-box').length;
		banNow = (banOld + 1) % total;
	 
		$('.top100-main-box div.bubble-box:eq(' + banOld + ')').animate({
			top: "-300px",
			opacity: 0
		}, 800 );
		$('.top100-main-box div.bubble-box:eq(' + banNow + ')').animate({
			top: "0",
			opacity: 1
		}, 800 );
	 
		banOld = banNow;
	}
	