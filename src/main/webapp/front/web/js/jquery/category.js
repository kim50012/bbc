jQuery(function($){
 
		//best & new 탭메뉴
		$(".brand-best ul.cate-tab li a").click(function(){
			$("ul.cate-tab li").attr("class" , "");
			tabView($(this));
			return false;
		});
		tabView = function(obj){
			$(".brand-best ul.single").hide();
			$(obj.attr("href")).show();
			obj.parent().attr("class" , "on");
		};

		//2depth-menu 
		$(".depth-menu ul.first-child li a").mouseenter(function(){
			$(".depth-menu ul.first-child li").removeClass("on");
			$(".depth-menu .sub-depth li ul").hide();
			$($(this).attr("ctgrId")).show();
			$($(this).attr("ctgrId")).find("li").removeClass("on");
			$(this).parent().addClass("on");
			return false;
		});
		$(".depth-menu .sub-depth li ul li a").mouseenter(function(){
			$(".depth-menu .sub-depth li ul li").removeClass("on");
			$(this).parent().addClass("on");
			return false;
		});
		
	
    /*** 정렬 ***/
/*		
    $(".list-sort ul li").click(function(){
    	alert("AA");
        $("input[name='sort']").val($(this).attr("sort"));
       $("form").submit(); 
    });
*/    
    
    $(".list-sort ul li ").click(function(){
    	$("form[name=categoryForm] input[name='sort']").val($(this).attr("sort"));
        $("form[name=categoryForm]").method='POST'; 
        $("form[name=categoryForm]").submit(); 
    });    
    
    /*** 카테고리 선택 ***/
    $(".depth-select").change(function(){
    	var listSize = $("[name='listSize']").val();
    	location.href = "/shop/display/productCategoryMain?dispCtgrId="+$(this).val()+"&listSize="+listSize; 
    });
    $(".view-select").change(function(){
    	$("input[name='listSize']").val($(this).val());
    	$("form").submit();
    });
    
});