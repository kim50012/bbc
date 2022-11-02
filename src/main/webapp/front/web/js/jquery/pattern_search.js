jQuery(function($){

		/*** range-resize 상세 검색 ***/

		var basic = $(".pattern-search").height()-100;
		$(".range-price").height(basic); 
		 $("div.distribution").height($(".basic").height());
			$(".pattern-search p.btn span").click(function(){
			if($("tr.option").css("display") == "none"){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_detail.gif" , "_short.gif"));
				$(".pattern-search tr.option").show();
				$(".range-search").attr("rowspan" , "5");
				$(".ui-slider-handle").css("left" , 0);
				$(".range-price").height($(".pattern-search").height()-100);
				$(".distribution").height($(".range-price").height());
				$(".price-slider" ).slider("option" , "orientation" ,"vertical");
				$("div.range-price").removeClass("price-hori");
				//분포도 세로보기
				$("#chart ul").hide();
				$("#chart ul:eq(1)").show();
				//보여주고
				$(".brandList").show();
				//동적으로 크기조정
				var dynamicHeight = $(".pattern-search").height();
				$(".range-price").height(dynamicHeight);
				$("#chart").height(dynamicHeight);
			}else {
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_short.gif" , "_detail.gif"));
				$(".range-search").attr("rowspan" , "3");
				$(".pattern-search tr.option").hide();
				$(".range-price").height(30);
				$(".distribution").height("auto");
				$(".price-slider" ).slider("option" , "orientation" ,"horizontal");
				$("div.range-price").addClass("price-hori");
				$("#chart ul").hide();
				$("#chart ul:eq(0)").show();
				$(".brandList").hide();
			}
			
		});	

		
		/*** range-slider ***/

		$(".price-slider").slider({
			range: true,
			min: 0,
			max: 1600,
			orientation: "horizontal",
			value: 100,
			values: [ 0, 1600 ],
			slide: function( event, ui ) {
				 $(".ui-slider-handle" ).eq(0).find("span.range-text span").text( + ui.values[ 0 ]);
				 $(".ui-slider-handle" ).eq(1).find("span.range-text span").text( + ui.values[ 1 ]);
				 $(".max").val("$"+ui.values[ 1 ]);
				 $(".min").val("$"+ui.values[ 0 ]);
			}
		});		
		$(".ui-slider-handle" ).eq(0).find("span.range-text span").text($(".price-slider" ).slider( "values", 0 ));
		$(".ui-slider-handle" ).eq(1).find("span.range-text span").text( $(".price-slider" ).slider( "values", 1 ));
		$(".max").val($(".price-slider" ).slider( "values", 1 ));
		$(".min").val($(".price-slider" ).slider( "values", 0 ));
		
});