$(function(){
	$("input[type='radio']").change(function(){
		
		 if ($("input[type='radio']").is(':checked')) {
		 		$(this).parents(".radio-box").siblings().removeClass("checked");
            	$(this).parents(".radio-box").addClass("checked");
            } 
	})
})
