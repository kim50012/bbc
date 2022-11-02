jQuery(function($){

	/* 주문가능 시간조회 */ 
	$("#starting").selectbox(); 	
	$("#daparture-hour").selectbox();
	$("#daparture-min").selectbox(); 
	
	$(".order-search .pop-box").hide(); 	
	/* 
	$(".order-search p.btn1 a").click(function(){
    	$('.order-search .pop-box').show();
    }); 
	$(".order-search p.btn3 a").click(function(){
    	$('.order-search .pop-box').show();
    });
	*/
    $(".order-search p.close a").click(function(){
    	$('.order-search .pop-box').hide(); 
    }); 
	
	
	/* event 검색 */ 
	$("#event-search").selectbox(); 
 
	
	 
		
}); 