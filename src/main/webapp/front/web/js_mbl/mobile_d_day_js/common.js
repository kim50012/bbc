$(document).ready(function(){
	// main
	//$('.nav').find('li.active').append('<span class="bg">');
	//$('.tab').find('li.active').append('<span class="bg">');
	
	// tab
	$('.tab > li').click(function(){
		var clickIndex = $('.tab li').index(this);
		$(this).addClass('active');
		$(this).siblings().removeClass('active');
		$('.tabWrap .tab_con').eq(clickIndex).addClass('active').siblings().removeClass('active');
		return false;
	});

	$('.sub_event .tab > li > a').click(function(){
		var showId = $(this).attr('href');
		$(this).parent().addClass('active').siblings().removeClass('active');
		//alert(showId)
		$('.tabWrap').children(showId).addClass('active').siblings().removeClass('active');
		$('.main_swiper').css({
			height: $(this).parents('.swiperInner').height()
		});
		return false;
	});

	$('.sub_brand .tab li').click(function(){
		$('.main_swiper').css({
			height: $(this).parents('.swiperInner').height()
		});
	});

	$('.text_sorting li, .category_sorting li').click(function(){
		$('.main_swiper').css({
			height: $(this).parents('.swiperInner').height()
		});
	});

	$('.sub_event .tab li').click(function(){
		$('.main_swiper').css({
			height: $(this).parents('.swiperInner').height()
		});
	});
	
	//알파벳
	$('.text_sorting').find('a').click(function(){
		$(this).parent().parent().parent().siblings('.sorting_list').show();
	});
	//카테고리
	$('.category_sorting').find('a').click(function(){
		$(this).parent().parent().parent().siblings('.sorting_list').show();
	});

	//리스트정렬
	$('.listArea').addClass('areaView');
	$('.btn_list').click(function(){
		$('.albumArea').addClass('areaView');
		$('.listArea').removeClass('areaView');
		$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off', '_on'));
		$(this).siblings('a').find('img').attr('src', $(this).siblings('a').find('img').attr('src').replace('_on', '_off'));
		$('.main_swiper').css({
			height: $(this).parents('.swiperInner').height()
		});
		return false;
	});
	$('.btn_album').click(function(){
		$('.albumArea').removeClass('areaView');
		$('.listArea').addClass('areaView');
		$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off', '_on'));
		$(this).siblings('a').find('img').attr('src', $(this).siblings('a').find('img').attr('src').replace('_on', '_off'));
		$('.main_swiper').css({
			height: $(this).parents('.swiperInner').height()
		});
		return false;
	});

	$('.korea_list').click(function(){
		$('.listSection').show();
		$('.albumSection').hide();
		$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off', '_on'));
		$(this).siblings('a').find('img').attr('src', $(this).siblings('a').find('img').attr('src').replace('_on', '_off'));
		$('.sub_korea .swiper-wrapper, .sub_korea .swiper-slide').css({
			height: $('.swiperInner').height()
		});
		return false;
	});
	$('.korea_album').click(function(){
		$('.listSection').hide();
		$('.albumSection').show();
		$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off', '_on'));
		$(this).siblings('a').find('img').attr('src', $(this).siblings('a').find('img').attr('src').replace('_on', '_off'));
		$('.sub_korea .swiper-wrapper, .sub_korea .swiper-slide').css({
			height: $('.swiperInner').height()
		});
		return false;
	});
	
	// plus button
	$('.plusArea').find('p > a').click(function(){
		if($('.plusArea ul').is(':visible')){
			$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_on', '_off'));
			$('.plusArea').find('ul').hide();
			$('.plusArea').find('.bg').hide();
		} else{
			$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off', '_on'));
			$('.plusArea').find('ul').show();
			$('.plusArea').find('.bg').show();
		}
	});
	$('.plusArea ul').find('a').click(function(){
		$('.plusArea').find('p').find('img').attr('src', $('.plusArea').find('p').find('img').attr('src').replace('_on', '_off'));
		$('.plusArea').find('ul').hide();
		$('.plusArea').find('.bg').hide();
	});

	// main visual
	var mySwiper = new Swiper('.main_visual',{
		calculateHeight:true,
		loop: true,
		pagination: '.p_visual',
		loop:true,
		grabCursor: true,
		paginationClickable: true,
		paginationElementClass : 'btn_page',
		paginationElement : 'a',
		paginationActiveClass : 'current',
		onSwiperCreated: function(){
			$('.main_swiper').css({
				height: $('.main_swiper .swiper-slide-active .swiperInner').height()
			});
		}
	});
	$('.main_visual').find('.btn_prev').on('click', function(e){
		e.preventDefault();
		mySwiper.swipePrev();
	});
	$('.main_visual').find('.btn_next').on('click', function(e){
		e.preventDefault();
		mySwiper.swipeNext();
	});

	// new_list
	$('.new_list ul').bxSlider({
		minSlides: 3,
		maxSlides: 3,
		slideWidth: 360,
		slideMargin: 4,
		nextSelector: '.newSec .btn_next',
		prevSelector: '.newSec .btn_prev',
	});
	/*var mySwiper2 = new Swiper('.new_list',{
		calculateHeight:true,
		loop: true,
		pagination: '.p_new',
		paginationClickable: true,
		slidesPerView: 3,
		paginationElementClass : 'btn_page',
		paginationElement : 'a',
		paginationActiveClass : 'current'
	});
	$('.new_list').find('.btn_prev').on('click', function(e){
		e.preventDefault();
		mySwiper2.swipePrev();
	});
	$('.new_list').find('.btn_next').on('click', function(e){
		e.preventDefault();
		mySwiper2.swipeNext();
	});*/

	// event
	var eventSwiper = new Swiper('.newEvent',{
		calculateHeight:true,
		loop: true,
		pagination: '.p_event',
		paginationElement : 'a',
		paginationActiveClass : 'current'
	});
	$('.newEvent').find('.btn_prev').on('click', function(e){
		e.preventDefault();
		eventSwiper.swipePrev();
	});
	$('.newEvent').find('.btn_next').on('click', function(e){
		e.preventDefault();
		eventSwiper.swipeNext();
	});

	var koreaSwiper = new Swiper('.sub_korea',{
		calculateHeight:true,
		paginationClickable: true,
		pagination: '.korea_page',
		paginationElement : 'a',
		paginationActiveClass : 'current',
		onSwiperCreated:function(){
			$('.korea_page').css({
				top:$('.swiper-slide-active .visual').height()
			});
		},
		onSlideChangeEnd:function(){
			$('.korea_page').css({
				top:$('.swiper-slide-active .visual').height()
			});
		}
	});

	$(window).bind("orientationchange", function(evt){
		var mySwiper = new Swiper('.main_visual',{
			calculateHeight:true
		});
	});

});

// notice
function tick(){
	$('.notice li:first').slideUp(function(){
		$(this).appendTo($('.notice ul')).slideDown();
	});
}
setInterval(function(){tick()}, 3000);