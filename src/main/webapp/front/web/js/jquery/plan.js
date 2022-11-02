jQuery(function($){

	/** selectbox **/

	$(".plan-all").selectbox();
	$(".view-select").selectbox();

	// page on off

			$(".page-view a").mouseover(function(){
				pageViewClick($(this));
				return false;
			}).click(function(){
				pageViewClick($(this));
				return false;
			});
			pageViewClick = function(obj){
				$(".page-view a").each(function(){
					$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
				});
				obj.find("img").attr("src" ,obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
			};

			//view-section mouseover
			
			$(".view-section .photo").mouseover(function(){
				$(this).find("span").show();
				$(this).find("ul").show();
			}).mouseout(function(){
				$(this).find("span").hide();
				$(this).find("ul").hide();
			});
			
});

