$(document).ready(function(){
	//visual_top_banner
	var slider = $('.s_rollingBn_slider').bxSlider({
	  auto: true,
	  autoControls: false,
	  pause: 4000,
	  slideMargin: 0,
	  width:198,
	  height:184,
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: 'Onward →',
	  prevText: '← Go back'
	  
	});

	$('.bx-pager a').hover(function(){
	  var index = $(this).attr('data-slide-index');
	  slider.goToSlide(index);
	}, function(){
	  // mouseout actions
	});
	
		
	//핫세일_롤링_배너
	$('.newNop_hotSale_slider').bxSlider({
	  auto: false,
	  autoControls: false,
	  pause: 3000,
	  slideMargin: 0,
	  width:198,
	  height:318,
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: 'Onward →',
	  prevText: '← Go back'
	});
	
	//위로_3개배너
	$('.bxslidervertical1').bxSlider({
		  mode: 'vertical',
		  auto: true,
		  autoControls: false,
		  speed:600,
		  pause: 3000,
		  width:330,
		  height:140
		  
		  
		});
	
	$('.bxslidervertical2').bxSlider({
		mode: 'vertical',
		auto: true,
		autoControls: false,
		speed:600,
		pause: 3000,
		width:330,
		height:140
		
	});
	
	$('.bxslidervertical3').bxSlider({
		mode: 'vertical',
		auto: true,
		autoControls: false,
		speed:600,
		pause: 3000,
		width:330,
		height:140

	});
	
	//MD추천제품
	$('.newNop_md_slider').bxSlider({
	  auto: true,
	  autoControls: false,
	  speed:10,
	  pause: 3000,
	  slideMargin: 0,
	  width:1000,
	  height:300,
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: 'Onward →',
	  prevText: '← Go back'
	});

	//브랜드_프로모션_멀티배너3
	$('#bp_slider1').bxSlider({
	  auto: true,
	  autoControls: false,
	  pause: 3000,
	  slideMargin: 0,
	  width:500,
	  height:329,
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: 'Onward →',
	  prevText: '← Go back'
	});

	$('#bp_slider2').bxSlider({
	  auto: true,
	  autoControls: false,
	  pause: 3000,
	  slideMargin: 0,
	  width:500,
	  height:329,
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: 'Onward →',
	  prevText: '← Go back'
	});

	$('#bp_slider3').bxSlider({
	  auto: true,
	  autoControls: false,
	  pause: 3000,
	  slideMargin: 0,
	  width:500,
	  height:329,
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: 'Onward →',
	  prevText: '← Go back'
	});

	//footer_sm_banner
	$('.s_rollingBn_sliderFt').bxSlider({
	  auto: false,
	  autoControls: false,
	  pause: 3000,
	  slideMargin: 0,
	  width:190,
	  height:220,
	  nextSelector: '#slider-next',
	  prevSelector: '#slider-prev',
	  nextText: 'Onward →',
	  prevText: '← Go back'
	});
	
	$('.newNop_leftWingBn1').bxSlider({
		auto: true,
		speed:500,
		pause: 3000,
		width:110,
		nextSelector: '#slider-next',
		prevSelector: '#slider-prev',
		nextText: 'Onward →',
		prevText: '← Go back'
	});
	
	$('.newNop_leftWingBn2').bxSlider({
		auto: true,
		speed:500,
		pause: 3000,
		width:110,
		nextSelector: '#slider-next',
		prevSelector: '#slider-prev',
		nextText: 'Onward →',
		prevText: '← Go back'
	});
	
	$('.newNop_leftWingBn3').bxSlider({
		auto: true,
		speed:500,
		pause: 3000,
		width:110,
		nextSelector: '#slider-next',
		prevSelector: '#slider-prev',
		nextText: 'Onward →',
		prevText: '← Go back'
	});
	
	$('.newNop_leftWingBn4').bxSlider({
		auto: true,
		speed:500,
		pause: 3000,
		width:110,
		nextSelector: '#slider-next',
		prevSelector: '#slider-prev',
		nextText: 'Onward →',
		prevText: '← Go back'
	});
	
	$('.newNop_leftWingBn5').bxSlider({
		auto: true,
		speed:500,
		pause: 3000,
		width:110,
		nextSelector: '#slider-next',
		prevSelector: '#slider-prev',
		nextText: 'Onward →',
		prevText: '← Go back'
	});
	
});