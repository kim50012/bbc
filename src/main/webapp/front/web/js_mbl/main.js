$(document).ready(function() {
    //everyday hot sale
    $("#main_everyday").load("/shop/getAjaxDisplayData");
    
	var eventSwiper, newSwiper, specialSwiper;
	var eventPerView, eventPerGroup, eventCentered, eventInitial;
	var newPerView, newPerGroup, newCentered, newInitial;
	var specialPerView, specialPerGroup, specialCentered, specialInitial;

	$(window).load(function(){
		checkW();
		eventInit();
		newInit();
		specialInit();
	});
	$(window).resize(function(){
		checkW();
		eventReInit();
		newReInit();
		specialReInit();
		//location.reload();
	});

	function checkW() {
		var w = $(window).width();
		//alert("height : " + w);
		//$('#searchTerm').val(w);
		if (w>900){
			eventPerView = 3; eventPerGroup = 3; eventCentered = true; eventInitial = 0;			
			newPerView = 6; newPerGroup = 6; newCentered = false; newInitial = 0;			
			specialPerView = 5; specialPerGroup = 5; specialCentered = false; specialInitial = 0;		
		} else if (w<=900 && w>700) {
			eventPerView = 2; eventPerGroup = 2; eventCentered = false; eventInitial = 0;			
			newPerView = 5; newPerGroup = 5; newCentered = false; newInitial = 0;		
			specialPerView = 4; specialPerGroup = 3; specialCentered = true; specialInitial = 0;	
		} else if (w<=700 && w>500) {
			eventPerView = 2; eventPerGroup = 2; eventCentered = false; eventInitial = 0;		
			newPerView = 4; newPerGroup = 4; newCentered = false; newInitial = 0;		
			specialPerView = 3; specialPerGroup = 3; specialCentered = true; specialInitial = 0;	
		} else if (w<=500 && w>=320) {
			eventPerView = 1; eventPerGroup = 1; eventCentered = true; eventInitial = 0;	
			newPerView = 3; newPerGroup = 3; newCentered = true; newInitial = 0;
			specialPerView = 2; specialPerGroup = 1; specialCentered = true; specialInitial = 0;
		} else {
			eventPerView = 1; eventPerGroup = 1; eventCentered = true; eventInitial = 0;	
			newPerView = 3; newPerGroup = 3; newCentered = false; newInitial = 0;
			specialPerView = 1; specialPerGroup = 1; specialCentered = true; specialInitial = 0;
		}
	}
	// for event
	function eventInit(){
		eventSwiper = new Swiper('#event_list',{
			loop:true,
			grabCursor: true,
			paginationClickable: true,
			slidesPerView: eventPerView,
			slidesPerGroup: eventPerGroup,
			centeredSlides: eventCentered,
			autoResize : true,
			resizeReInit : true,
			initialSlide : eventInitial,
			wrapperClass : 'slideset',
			slideClass : 'slide',
			pagination: '#event_list .go',
			paginationElementClass: 'dot',
			paginationVisibleClass : 'v',
			paginationActiveClass : 'on',
		})
	}
	$('#event_list .prev').on('click', function(e){
		e.preventDefault()
		eventSwiper.swipePrev();
	})
	$('#event_list .next').on('click', function(e){
		e.preventDefault()
		eventSwiper.swipeNext();
	})
	function eventReInit() {
		//alert("reinit");
		eventSwiper.params.initialSlide=eventInitial;
		eventSwiper.params.slidesPerView=eventPerView;
		eventSwiper.params.slidesPerGroup=eventPerGroup;
		eventSwiper.params.centeredSlides=eventCentered;
		eventSwiper.reInit();
	}
	
	// for best
	var bestSwiper = new Swiper('#best_list',{
		loop:true,
		grabCursor: true,
		paginationClickable: true,
		slidesPerView: 1,
		slidesPerGroup: 1,
		centeredSlides: true,
		autoResize : true,
		resizeReInit : true,
		initialSlide : 0,
		wrapperClass : 'slideset',
		slideClass : 'slide',
		pagination: '#best_list .go',
		paginationElementClass: 'dot',
		paginationVisibleClass : 'v',
		paginationActiveClass : 'on',
	})
	
	// for new
	function newInit(){
		newSwiper = new Swiper('#newest_list',{
			loop:true,
			grabCursor: true,
			paginationClickable: true,
			slidesPerView: newPerView,
			slidesPerGroup: newPerGroup,
			centeredSlides: newCentered,
			autoResize : true,
			resizeReInit : true,
			initialSlide : newInitial,
			wrapperClass : 'slideset',
			slideClass : 'slide',
			pagination: '#newest_list .go',
			paginationElementClass: 'dot',
			paginationVisibleClass : 'v',
			paginationActiveClass : 'on',
		})
	}
	function newReInit() {
		newSwiper.params.initialSlide=newInitial;
		newSwiper.params.slidesPerView=newPerView;
		newSwiper.params.slidesPerGroup=newPerGroup;
		newSwiper.params.centeredSlides=newCentered;
		newSwiper.reInit();
	}
	
	// for special
	function specialInit(){
		specialSwiper = new Swiper('#special_list',{
			loop:true,
			grabCursor: true,
			paginationClickable: true,
			slidesPerView: specialPerView,
			slidesPerGroup: specialPerGroup,
			centeredSlides: specialCentered,
			autoResize : true,
			resizeReInit : true,
			initialSlide : specialInitial,
			wrapperClass : 'slideset',
			slideClass : 'slide',
			pagination: '#special_list .go',
			paginationElementClass: 'dot',
			paginationVisibleClass : 'v',
			paginationActiveClass : 'on',
		})
	}
	$('#special_list .prev').on('click', function(e){
		e.preventDefault()
		specialSwiper.swipePrev();
	})
	$('#special_list .next').on('click', function(e){
		e.preventDefault()
		specialSwiper.swipeNext();
	})
	function specialReInit() {
		specialSwiper.params.initialSlide=specialInitial;
		specialSwiper.params.slidesPerView=specialPerView;
		specialSwiper.params.slidesPerGroup=specialPerGroup;
		specialSwiper.params.centeredSlides=specialCentered;
		specialSwiper.reInit();
	}

	// slide init
	var tSwiper = new Swiper('#main_quick',{
		mode : 'horizontal',
		scrollContainer: true,
		grabCursor: true,
		paginationClickable: true,
		autoResize : true,
		resizeReInit : true,
		wrapperClass : 'slideset',
		slideClass : 'slide',
	})

});