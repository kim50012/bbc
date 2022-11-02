
/* **** 나만의 컬러 추천 **** */

/*jQuery(function($){
	$("ul.recommend-list li").click(function(){
		$("ul.recommend-list li").attr("class" , "");
		$(this).attr("class" , "on");
		$("ul.recommend-list li").each(function(){
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
		});
		$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));	
		return false;
	});
});
*/


/* **** 컬러선택 박스 **** */


jQuery(function($){
	$(".color-box ul li span").hide();
	$(".color-box ul li").click(function(){
		var check = false;
		$(".color-box ul li span").each(function(){
	        if($(this).css("display") == "block"){
	        	check = true;
	        }
	    });
		if(!check){
			$(this).find("span").show();
		}
		return false;
	});
});