$(function(){
	
	common(); //공통 적용
	search_select(); //검색 영역 클릭
	product_list(); //상품 리스트
	product_view(); //상품 상세
	join_form(); //회원가입
	popup(); //팝업설정 
	brand(); // 브랜드 & 카테고리
	mypage(); //마이페이지
	event(); //기획전
	coupon(); //쿠폰

	$("#searchTitle").keyup(function(e){ 
	    var code = e.which; // recommended to use e.which, it's normalized across browsers
	    if(code==13)e.preventDefault();
	    if(code==13){
	    	searchProd()
	    }
	});
	
	if($('[class*=swiper]').size() != 0){
		
		if($('.swiper-container .swiper-slide').size() > 1){
			var swiper = new Swiper('.swiper-container', {
				loop:true,
				pagination: '.swiper-pagination',
				calculateHeight:true,
		        slidesPerView: 1,
		        paginationClickable: true,
		        spaceBetween: 30,
		        paginationElement : 'a',
		        autoplay: 2500,
	       		autoplayDisableOnInteraction: false
			});
		}
		
		if($('.swiper-container2 .swiper-slide').size() > 1){
			var swiper2 = new Swiper('.swiper-container2', {
				loop:true,
				pagination: '.swiper-pagination2',
				calculateHeight:true,
		        slidesPerView: 1,
		        paginationClickable: true,
		        spaceBetween: 30,
		        paginationElement : 'a'
			});
		}
		
		if($('.swiper-banner .swiper-slide').size() > 1){
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
		
		$(window).resize(function(){
			var width = $('.swiper-container2 .mask').find('img').outerWidth();
			$('.swiper-container2 .mask').css({'height':width});
		});
		$('.swiper-container2 .mask').each(function(){
			var width = $(this).find('img').outerWidth();
			$(this).css({'height':width});
		});
		
	};
	
	function item_kind(){
		$('.item-kind').each(function(){
			var $this = $(this);
			var h = $this.prev().innerHeight();
			var title = $this.find('.title').outerHeight();
			$this.css('height',h+1).find('.kind-list').css('height',h+3 - title);
			$this.prev().find('img').load(function(){
				var h = $this.prev().innerHeight();
				$this.css('height',h+1).find('.kind-list').css('height',h+3 - title);
			});
		});
		
//		$('.item-kind .kind-list li').click(function(){
//			itemIdx = $(this).index() + 1;
//			$('.item-kind').find('li').eq(itemIdx-1).addClass('on').siblings().removeClass('on');
//			$('.item-kind').siblings('[class*=kind-list0]').hide();
//			$('.item-kind').siblings('.kind-list0' + itemIdx).show();
//			return false;
//		});
	};
	
	function common(){	
		$(document).on('click','#header .gnb-box > a',function(){
			if($(this).index() == 0){
				var target = ['#gnb-menu','100%'];
			}else{
				var target = ['#new-menu','-100%'];
			}
			$('html,body').css('overflow','hidden');
			$('#wrap').animate({'left':target[1]});
			$(target[0]).animate({'left':'0'});
			return false;
		});
		
		$(document).on('click','#gnb-menu .btn-close',function(){
			$('html,body').css('overflow','inherit');
			$('#wrap').animate({'left':'0%'});
			$('#gnb-menu').animate({'left':'-100%'});
			return false;
		});
		
		$(document).on('click','#new-menu .btn-close',function(){
			$('html,body').css('overflow','inherit');
			$('#wrap').animate({'left':'0%'});
			$('#new-menu').animate({'left':'100%'});
			return false;
		});
		commonScroll();
		$(window).scroll(function(){
			commonScroll();
		});
		
		$(document).on('click','#btn-top',function(){
			$('html,body').animate({'scrollTop':'0'});
			return false;
		});
		
		
	};
	
	var brandFixed = 0;
	function commonScroll(){
		var header_h = $('#header').outerHeight();
		var scrollT = $(window).scrollTop();
		if(scrollT > 40){
			$('#btn-top').show();
		}else{
			$('#btn-top').hide();
		};
		
		if(scrollT > header_h){
			$('#container').addClass('fixed');
		}else{
			$('#container').removeClass('fixed');
		};
		if($('.brand-layout').size() != 0){
			if(brandFixed == 0){
				brandFixed = $('.brand-layout .search-result').offset().top;
			}
			if(scrollT + 43 > brandFixed){
				$('#container').addClass('brand-fixed');
			}else{
				$('#container').removeClass('brand-fixed');
			};
		};
	};
	
	
	function search_select(){
		
		$(document).on('click','.search-result > a',function(){
			if(!$(this).hasClass('disabled')){
				var height = $(window).outerHeight();
				$('.search-result > a').not($(this)).removeClass('on');
				$(this).toggleClass('on').next().slideToggle().siblings('div').not('.search-bg').slideUp();
				
				if($('.search-result > a').hasClass('on')){
					$('.search-bg').fadeIn();
				}else{
					$('.search-bg').fadeOut();
				}
				if($(this).hasClass('on')){
					$('html').addClass('scrollNone');
				}else{
					$('html').removeClass('scrollNone');
				}
			}
			return false;
		});
		
		$(document).on('click touchend','.search-bg',function(){
			$('html').removeClass('scrollNone');
			$('.search-bg').fadeOut();
			$('.search-result > a').removeClass('on').siblings('div').not('.search-bg').slideUp();
			$('#container').removeClass('fixed');
			commonScroll();
		});
		
		$(document).on('click','.search-menu a',function(){
			$(this).parent().addClass('on').siblings().removeClass('on');
			$('.search-bg').hide();
			$('.search-result > a').removeClass('on').siblings('div').not('.search-bg').slideUp();
			
			$(this).parents('.search-menu').prev().html($(this).text() + '<i class="arrow"></i>');
			$('html').removeClass('scrollNone');
			$('#container').removeClass('fixed');	
		});
	}
	
	function product_list(){
		
		/* 가로형 */
		$(document).on('click','.product-list .item-box .btn-more',function(){
			$(this).parent().next('.detail-item').show().find('.detail-text').animate({'right':'0%'});
			return false;
		});
		
		$(document).on('click touchend','.item-box .detail-text .btn-close,.item-box .detail-item .bg',function(){
		//$('.item-box .detail-text .btn-close,.item-box .detail-item .bg').click(function(){
 			$(this).parents('.detail-item').delay(200).fadeOut().find('.detail-text').animate({'right':'-55%'});
			return false;
		});
		
		/* 세로형 */
		$(document).on('click','.product-list .item-box-v .btn-more',function(){
			$(this).parent().next('.detail-item').show().find('.detail-text').animate({'bottom':'0%'});
			return false;
		});
		
		$(document).on('click touchend','.item-box-v .detail-text .btn-close,.item-box-v .detail-item .bg',function(){
		//$('.item-box-v .detail-text .btn-close,.item-box-v .detail-item .bg').click(function(){
			$(this).parents('.detail-item').delay(200).fadeOut().find('.detail-text').animate({'bottom':'-175px'});
			return false;
		});
		
		
		/* 가로형, 세로형 변환 */
		$(document).on('click','.btn-means',function(){
			$(this).hide().siblings('.btn-means').css('display','block');
			var data_class = $(this).attr('data');
			$('[class*=item-box]').attr('class',data_class);
			$('.detail-item').hide().find('.detail-text').attr('style','');
			return false;
		});
		
		
		item_kind();
		var itemIdx = 1;
		$('.item-kind').siblings('[class*=kind-list0]').hide()
		$('.item-kind').siblings('.kind-list0' + itemIdx).show();
		
		$('.item-kind').find('li').eq(itemIdx-1).addClass('on');
		$(window).resize(function(){
			item_kind();
		});
		
		/* 상품이 없을때 */
		$(document).on('click','.sold-out',function(){
			return false;
		});
	}
	
	function join_form(){
		$(':checkbox,:radio').each(function(){
			if($(this).is(":checked")){
				$(this).parent().addClass('check');
			};
		});
		if($('.join-box .step01').size() != 0){ //회원가입
			$('.input-agree input.check-all').change(function(){
				if($(this).is(":checked")){
					$(this).parent().addClass('check');
					$(this).parents('.all').find('tr').each(function(){
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
		};
		
		$(':radio').change(function(){
			var name = $(this).attr('name');
			$('[name=' + name + ']').parent().removeClass('check');
			$(this).parent().addClass('check');
		});
		
		$('.input-checkbox :checkbox').change(function(){
			if($(this).is(":checked")){
				$(this).parent().addClass('check');
			}else{
				$(this).parent().removeClass('check');
			};
		});
	}
	
	function popup(){
		$('.popup-open').each(function(){
			$(this).show();
			var height = $(this).find('.popup-box').outerHeight();
			$(this).find('.popup-box').css('margin-top',-height/2);
		});
		
		$(document).on('click','.btn-popup',function(){
			var target = $(this).attr('href');
			$(target).fadeIn();
			var height = $(target).find('.popup-box').outerHeight();
			$(target).find('.popup-box').css('margin-top',-height/2);
			$('html').addClass('scrollNone');
			return false;
		});
		
		$(document).on('click touchend','.popup-layout .btn-close,.popup-layout .bg',function(){
			$(this).parents('.popup-layout').fadeOut();
			$('html').removeClass('scrollNone');
			return false;
		});
	};
	
	function product_view(){
		if($('#product-view').size() != 0){
			$('.btn-share').click(function(){
				$('.share-wrap').fadeIn().children('.share-box').animate({'bottom':'0px'});				
				$('html').addClass('scrollNone');
				return false;
			});
			$('.share-box .btn-group .btn-black, .share-wrap .bg').click(function(){
				$(this).parents('.share-wrap').fadeOut().children('.share-box').animate({'bottom':'-243px'});
				$('html').removeClass('scrollNone');
				return false;
			});
			
			$(document).on('click','.product-tap > ul > li > a, .product-tap-menu > ul > li > a',function(){
				//$(this).parent().siblings('script').appendTo($(this).parents('ul'));
				//var idx = $(this).parent().index();
				var target= $(this).parent().parent().children('li');
				var idx = target.index($(this).parent());
				$('.product-tap > ul > li').eq(idx).addClass('on').siblings().removeClass('on');
				$('.product-tap-menu > ul > li').eq(idx).addClass('on').siblings().removeClass('on');
				var tapT = parseInt($('.product-tap').offset().top) -40;
				$('html,body').animate({'scrollTop':tapT},'fast');
				return false;
			});
			
			$(document).on('click','.comment-box',function(){
				var $this = $(this);
				$('.comment-detail').not($(this).next()).slideUp();
				$(this).next().slideToggle(function(){
					var top = $this.offset().top - 81;
					$('html,body').animate({'scrollTop':top},'fast');
				});
				return false;
			});
			
			$(document).on('click','.map-info h3.title',function(){
				var $this = $(this);
				$(this).toggleClass('on').siblings('.title').removeClass('on');
				$(this).next().slideToggle(function(){
					var top = $this.offset().top - 81;
					$('html,body').animate({'scrollTop':top},'fast');
				}).siblings('.view-box').slideUp();
				return false;
			});
			
			$(document).on('click','#product-view .btn-menu',function(){
				$(this).next().slideToggle('fast');
				return false;
			});
			
			var scrollT = 0;
			product_tap();
			$(window).scroll(function(){
				product_tap();
			});
		};
		
		/* 걍 노출 */
		function product_tap(){
			var tapT = parseInt($('.product-tap').offset().top);
			var scrollT = $(window).scrollTop();
			
			if(tapT-40 <= scrollT){
				//$('.product-tap').addClass('fixed');
				$('.product-tap-menu').show();
			}else{
				//$('.product-tap').removeClass('fixed');
				$('.product-tap-menu').hide();
			}
		}
		
		/* 스크롤에 따라 숨김 나옴
		function product_tap(){
			var tapT = parseInt($('.product-tap').offset().top);
			$('#product-view .location').stop().animate({'top':scrollT > $(window).scrollTop() ? '0px' : '-42px'},'fast');
			$('.product-tap.fixed > ul > li > a').stop().animate({'top':scrollT > $(window).scrollTop() ? '42px' : '0px'},'fast');
			scrollT = $(window).scrollTop();
			
			if(scrollT == 0){
				$('#product-view .location').stop().animate({'top':'0px'},'fast');
			}
			
			if(tapT <= scrollT){
				$('.product-tap').addClass('fixed');
			}else{
				$('.product-tap > ul > li > a').stop().css('top','0');
				$('.product-tap').removeClass('fixed');
			}
		}
		*/
	};
	
	/* 댓글 팝업 
	$('.assessment-box button').click(function(){
		var idx = $(this).index();
		$(this).attr('class','').siblings().attr('class','');
		$(this).parent().children(':gt('+idx+')').attr('class','off');
	});
	*/
	
	function brand(){
		if($('#brand').size() != 0){
			brandH();
			$(window).resize(function(){
				brandH();
			});
			
			$(document).on('click','#brand .tap > li > a',function(){
				$(this).parent().addClass('on').siblings().removeClass('on');
				if($(this).parent().index() == 2){
					threeSetup();
				};
			});
			
			$(document).on('click','.brand-two .left a',function(){
				var idx = $(this).parent().index();
				$(this).parent().addClass('on').siblings().removeClass('on');
				$(this).parents('.left').stop().animate({'scrollTop':(idx - 1)*72});
				
//				$('.brand-two .right > *').eq(idx).show().siblings().hide();
				return false;
			});
			
			var three_idx = 0;
			var three, three_top, three_scroll;
			/* 초기화 */
			if($('.brand-three .right').size() != 0){
				threeSetup();
			}
			
			var threeScrollT = 0;
			$('.brand-three .right').scroll(function(){
				if(threeScrollT < $(this).scrollTop()){
					threeScrollT = $(this).scrollTop();
					if(threeScrollT >= three[three_idx + 1]){
						three_idx++;
						threeM();
					}
				}else{
					threeScrollT = $(this).scrollTop();
					if(threeScrollT < three[three_idx]){
						three_idx--;
						threeM();
					};
				};
			});
			
			$(document).on('click','.brand-three .left li',function(){
				if(!three.length){
					threeSetup();
				};
				three_idx = $(this).index();
				$('.brand-three .right').animate({'scrollTop':three[three_idx]});
				threeM();
				return false;
			});
		};
		
		function threeSetup(){
			three = [];
			three_top = $('.brand-three .right').offset().top;
			three_scroll = $('.brand-three .right').scrollTop();
			$('.brand-three .right').animate({'scrollTop':0},'fast');
			$('.brand-three .right h3').each(function(){
				three.push($(this).offset().top - three_top + three_scroll);
			});
		}
		
		function threeM(){
			$('.brand-three .left li').eq(three_idx).addClass('on').siblings().removeClass('on');
			$('.brand-three .left').stop().animate({'scrollTop':(three_idx - 1)*42});
		}
		
		function brandH(){
			var height = $(window).outerHeight();
			var topH = $('#brand .top-menu').outerHeight();
			var tapH = $('#brand .tap .brand-two > a').outerHeight();
			$('#brand .tap').css('height',height - topH);
			$('#brand .view').css('height',height - topH - tapH);
		}
	};
	
	function mypage(){
		$(document).on('click','.mypage .btn-menu',function(){
			$(this).next().slideToggle('fast');
			return false;
		});
		
//		$('#aside-menu .input-mypage input').change(function(){
//			if($(this).is(":checked")){
//				$('.product-list').find(':checkbox').prop('checked', true)
//				.parent().addClass('check');
//			}else{
//				$('.product-list').find(':checkbox').prop('checked', false)
//				.parent().removeClass('check');
//			};
//			return false;
//		});
		
		$('.product-list .input-mypage :checkbox').change(function(){
			if(!$(this).is(":checked")){
				$('#aside-menu .input-mypage input').prop('checked', false)
				.parent().removeClass('check');
			};
			return false;
		});
	}
	
	function event(){
		$(document).on('click','.event-tap li',function(){
			var idx = $(this).index();
			$(this).addClass('on').siblings().removeClass('on');
			$('.event-box').eq(idx).show().siblings('.event-box').hide();
			return false;
		});
	}
	
	
	function coupon(){
		$('.coupon-all h2').click(function(){
			$(this).toggleClass('on').next().slideToggle();
			return false;
		});
		
		$('.coupon-list [class*=bg-use]').click(function(){
			return false;
		});
	};
	
});


function addFavorite(goodsId, displayId, obj) {

	if(obj.hasClass("on")) {
		removeFavorite(goodsId, displayId, obj);
		return;
	}	
	
	$.ajax({
 			data:{
 				goodsId : goodsId
 	 			,displayId : displayId
 	 		},
		type : "POST",
		url : "/front/web/publish/mobile/brand/addFavorite.htm",
		success : function(data) {
			if (data.status == "S") {
//				alert("즐겨찾기에 추가되었습니다.");
				obj.removeClass("on");
				obj.addClass("on");
			}
			else {
				alert("오류가 발생 하였습니다.");	
			}
		},
		error : function(xhr, status, e) {
			alert("오류가 발생 하였습니다.");	
		}
	});
	
}




function removeFavorite(goodsId, displayId, obj) {

	if(!obj.hasClass("on")) {
		addFavorite(goodsId, displayId, obj);
		return;
	}	
	
	$.ajax({
 			data:{
 				goodsId : goodsId
 	 			,displayId : displayId
 	 		},
		type : "POST",
		url : "/front/web/publish/mobile/brand/removeFavorite.htm",
		success : function(data) {
			if (data.status == "S") {
//				alert("즐겨찾기가 삭제되었습니다.");
				obj.removeClass("on");
			}
			else {
				alert("오류가 발생 하였습니다.");	
			}
		},
		error : function(xhr, status, e) {
			alert("오류가 발생 하였습니다.");	
		}
	});
	
}

function addCart(displayId, cnt, price, itemType) {
	
	if (itemType == "2") {
		alert("해당 상품은 상세 화면에서 구매가 가능합니다.");
		return;
	}
	
	$.ajax({
 			data:{
 				displayId : displayId
 	 			,pageCurr : cnt
 	 			,price : price
 	 		},
		type : "POST",
		url : "/front/web/publish/mobile/brand/mypageshopcartInsert.htm",
		success : function(data) {
			alert("장바구니에 등록 되었습니다.");	
		},
		error : function(xhr, status, e) {
			alert("장바구니 등록 시 오류가 발생 하였습니다.");
		}
	});
	
}		

function searchProd() {
	
	var goodsName = $("#searchTitle").val();
	if (goodsName == "") {
		alert("검색어를 입력하세요.");
		return;
	}
	window.location.href = '/front/web/publish/mobile/product/productlist.htm?goodsName='+goodsName;
	
}		


