$(function(){
	$('.clause-box > h1').click(function(){
		$('.clause-box > h1').not($(this)).removeClass('on');
		$(this).toggleClass('on').parent().next().slideToggle();
		return false;
	});
	
	$(':checkbox,:radio').each(function(){
		if($(this).is(":checked")){
			$(this).parent().addClass('check');
		};
	}); 
	
	$('.input-checkbox :checkbox').change(function(){
		if($(this).is(":checked")){
			$(this).parent().addClass('check');
		}else{
			$(this).parent().removeClass('check');
		};
	});
	
	$(':radio').change(function(){
		var name = $(this).attr('name');
		$('[name=' + name + ']').parent().removeClass('check');
		$(this).parent().addClass('check');
	});
	
	$('.input-agree input.check-all').change(function(){
		if($(this).is(":checked")){
			$(this).parent().addClass('check');
			$('.all').find('tr').each(function(){
				$(this).find(':radio').eq(0).prop('checked', true).parent().addClass('check')
				.siblings().removeClass('check');
			});
		}else{
			$(this).parent().removeClass('check');
		};
		return false;
	});
	
	$('.all :radio').change(function(){
		if($(this).parent().index() == 1){
			$('.check-all').prop('checked', false).parent().removeClass('check');
		}
	});
	
	if($('[id*=datepicker]').size() != 0){
	    $( "#datepicker" ).datepicker({
	    	dateFormat: "yy.mm.dd"
	        , showButtonPanel: true
	        , showMonthAfterYear: true
	        , changeYear: true
	        , changeMonth : true
	        , monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
	        , dayNamesMin: ['日','一','二','三','四','五','六']
	        , prevText:""
	        , nextText:""
	    });
	    
	    $( "#datepicker2" ).datepicker({
	    	dateFormat: "yy.mm.dd"
	        , showButtonPanel: true
	        , showMonthAfterYear: true
	        , changeYear: true
	        , changeMonth : true
	        , monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
	        , dayNamesMin: ['日','一','二','三','四','五','六']
	        , prevText:""
	        , nextText:""
	    });
	}
    
    $('.btn-popup').click(function(){
		var target = $(this).attr('href');
		$(target).fadeIn();
		var height = $(target).find('.popup-box').outerHeight();
		$(target).find('.popup-box').css('margin-top',-height/2);
		$('html').addClass('scrollNone');
		$(target).parents('#body').css('z-index','1000000');
		return false;
	});
	
	$('.popup-layout .btn-close,.popup-layout .bg').click(function(){
		$(this).parents('.popup-layout').fadeOut(function(){
			$(this).parents('#body').css('z-index','10');
		});
		$('html').removeClass('scrollNone');
		return false;
	});
	
	if($('[class*=swiper]').size() != 0){
		var swiper3 = new Swiper('.swiper-banner', {
			loop:true,
			pagination: '.swiper-pagination3',
			calculateHeight:true,
	        slidesPerView: 1,
	        paginationClickable: true,
	        spaceBetween: 30,
	        paginationElement : 'a'
		});
	}
});