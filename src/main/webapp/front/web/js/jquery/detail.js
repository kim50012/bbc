jQuery(function(){

				/**** 장바구니 베스트 레이어 노출****/

				$(".best-basket .tab-menu ul li a").click(function(){
					Root = $(this).parent().parent().parent().parent().parent();
					tab =  $(this).parent().parent().parent();
					rootPoi = Root.position().left;

					$(".best-basket .tab-menu ul li a").each(function(){
						$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
					});
					$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));

					$(".best-basket .tab-menu ul li").attr("class" , "");
					$(this).parent().attr("class" , "selected");
					$(".best-basket-info").hide();
					$($(this).attr("href")).show();
					if(rootPoi > 940) {
						$(this).parent().attr("class" , "selected");
						tab.css({
							"padding-top" : 0 ,
							"padding-bottom" : 0 ,
							"width" : "29px" ,
							"left" : "2px",
							"height" : "600px"
						});
						
						tab.find("ul li").css({"width" : "28px" , "border" : 0, "height" : "auto" });
						tab.find("a").css({"width" : "26px" , "height" : "48px", "margin" : "0"});
						Root.find(".best-basket-info").css({"border" : "1px solid #49393a"});
						tab.find("ul li a").css({"border" : "1px solid #49393a"});
						tab.find("ul li").css({"overflow" : "visible"});
						Root.stop().animate({
							"right": "0px",
							"top" : "-1px"
						});
				
					}
			
					return false;
					
				});
			

				/*** 장바구니 베스트 레이어 닫기 ***/

				$(".info-head p.close").click(function(){
					$(".best-basket .tab-menu ul li").attr("class" , "");
					Root.find(".best-basket-info").css({"border" : "0"});
					tab.css({
							"left"           : "-40px",
							"width"          : "30px",
							"height"         : "138px",
							"background"     : "url(/images/shop/product/detail/bg_disable.png) no-repeat 0 0",
							"padding-right"    : "4px",
							"padding-bottom" : "6px"
						});
						tab.find("ul li a").css({"border" : "0" , "height" : "4px" , "margin-top" : "2px"});
						tab.find("ul li").css({"overflow" : "hidden" , "height": "66px"});
					Root.stop().animate({
							"right": "-240px",
							"top"  : "-2px"
						},0);
					$(".best-basket .tab-menu ul li a").each(function(){
						$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
					});
					
				});

			/*** 적립금 레이어 ***/

			$(".save-rate a").click(function(){
				$(".layer-modal").hide();
				$($(this).attr("href")).show();
				return false;
			});

			/*** 위시리스트 장바구니 모달레이어 ***/
			$(".button-group a").click(function(){
				$(".layer-modal").hide();
				$($(this).attr("href")).show();
				return false;
			});


			/*** 모달레이어 닫기 ***/

			$(".layer-modal p.close").click(function(){
				$(this).parent().parent().hide();
			});

			/** 베스트 상품 뷰 mouseover **/

			$(".list-head .view-con a").click(function(){
				listHeadView($(this));
				return false;
			});
			$(".list-head .view-con a").mouseover(function(){
				listHeadView($(this));
			});

			listHeadView = function(obj){
				$(".best-product .view-con a").attr("class" , "");
				obj.parent().parent().parent().find("ul.brand-category").hide();
				obj.attr("class" , "selected");
				$(obj.attr("href")).show();
				
			};




			/*** 줌 패드 ***/
				$('.jqzoom').jqzoom({
						zoomType: 'reverse',
						lens:true,
						xOffset:57,
						yOffset:0,
						preloadImages: false,
						alwaysOn:false 
					});
				
				
				/*** select box ***/




				$(".color-size").selectbox();

				/*** 게시판 뷰 ***/
				$("td.board-txtbox").hide();
				$("td.tit-align a").click(function(){
					
					tagTxt = $(this).text();
					answer = $(this).parent().parent().next().find("td.board-txtbox");
					
					if($(this).text() == tagTxt) {
						answer.toggle();	
					}else {
						answer.show();
					}
					
					return false;
				});

				/*** 상세이미지 줌 ****/

					btnPosi =50;
					thisPos = 0;
					$("#slider").slider({
						range: "max",
						min: 0,
						max: 100,
						value: 50,
						animate: true,
						orientation: "vertical",
						slide: function( event, ui ) {
							thisPos = (50 - ui.value)*-0.01+1;
							if((100 -ui.value) <= 50) {
								$(".test").animate({transform: 'scale('+thisPos+')'}, 10);
							}else {
								thisPos = 1-((50 - (ui.value%50))*0.01);
								$(".test").animate({transform: 'scale('+thisPos+')'}, 10);
							}
						},
						 stop: function( event, ui ) {
							btnPosi = ui.value;
						}
					});
				
				plus = 0;
				minus = 0;
				scaleNum = 0;

				$(".zoom-con span").click(function(){
					plus ++;
					btn = $(this).attr("class");			
					if(btn == "expand"){
						if(btnPosi == 100) {
							$(".ui-slider-handle").css("bottom"  , 100 +"%");
							plus = 0;
						}else {
							scaleNum =(btnPosi+plus-50)*0.01+1;
							$(".ui-slider-handle").css("bottom"  , (btnPosi + plus) +"%");
							$(".test").animate({
									transform: 'scale('+scaleNum+')'
							}, 10);
						}
					}else if(btn == "reduction"){
						minus++;
					if(btnPosi > 0){
						scaleNum =(50-btnPosi+plus)*-0.01+1;
						$(".ui-slider-handle").css("bottom"  , (btnPosi - minus) +"%");
							$(".test").animate({
									transform: 'scale('+scaleNum+')'
							}, 10);
						}
					}else{
						$(".ui-slider-handle").css("bottom"  , 0 +"%");
						minus = 0;
					}
				});

				$( ".test img" ).draggable({revert: true});


		


				$("div.occasion div.list").hide();
				$("#relation01").show();

			/*** 연관 상품 tab-menu ***/

			$("div.relation-tab ul li a").click(function(){
				$("div.list").hide();
				$("div.relation-tab ul li").attr("class" , "");
				$(this).parent().attr("class" , "selected");
				$($(this).attr("href")).show();
				return false;
			});

			/*** 연관상품 롤링 ***/
			$("div.relation-list div.view-con span").click(function(){
				btn = $(this).attr("class");
				targetList = $("div.relation-list div.list:visible ul");
				targetLen = $("div.relation-list div.list:visible ul li").width();
				listView(btn , targetList , targetLen , "h");
				targetList.width(targetLen* $("div.relation-list div.list:visible ul li").size());
			});

			/*** 줌 패드 영역 롤링 ***/

			$(".pattern-list .view-con span").click(function(){
				btn = $(this).attr("class");
				targetList = $("div.pattern-wrap ul");
				targetLen = $("div.pattern-wrap ul li").width();
				listView(btn , targetList , targetLen , "h");
				targetList.width(targetLen* $("div.pattern-wrap ul li").size());
			});


			/*** 상세 이미지 롤링 ***/

			$("div.pattern-menu div.view-con span").click(function(){
				btn = $(this).attr("class");
				targetList = $("div.pattern-menu div.list ul");
				targetLen = $("div.pattern-menu div.list ul li").height();
				listView(btn , targetList , targetLen , "v");
				targetList.height(targetLen* $("div.list:visible ul li").size());
			});

			$("div.info-body div.view-con span").click(function(){
				btn = $(this).attr("class");
				targetList = $(this).parent().parent().find("ul");
				targetLen = $(this).parent().parent().find("ul li").height();
				listView(btn , targetList , targetLen , "v");
				targetList.height(targetLen* $(this).parent().parent().find("ul li").size());
			});

			/*** 롤링 공통 ***/

			var flag = true;
			listView = function(btn, tagetList, targetlen , type){
				if(flag){
					flag = false;
					poi = tagetList.position();
					poiX = poi.left;
					poiY = poi.top;
					size = (tagetList.find("li").size()-5)*targetLen;
					
					if(btn == "prev"){
						if(type == "h"){
							if(poiX <= size*-1) {
								targetList.stop();
							}else {
								targetList.stop().animate({"left" : poiX -targetLen} , 500);
							}
						}else if(type == "v"){
							if(poiY <= size*-1) {
								targetList.stop();
							}else {
								targetList.stop().animate({"top" : poiY -targetLen} , 500);
							}
						}
					}else if(btn == "next"){
						if(type == "h"){
							if(poiX == 0) {
								targetList.stop();
							}else {
								targetList.stop().animate({"left" : poiX +targetLen} , 500);
							}
						}else if(type == "v")  {
							if(poiY == 0) {
								targetList.stop();
							}else {
								targetList.stop().animate({"top" : poiY +targetLen} , 500);
							}
						}
					}
					setTimeout(function(){flag = true;}, 500);
				}
			};		
			
			/*** 넘버 색상 ***/
			
			$("td.num ul li").click(function(){
				$("td.num ul li").attr("class" , "");
				$(this).attr("class" , "selected");
				
			});

			/** 베스트 리스트  **/

			$(".list-head .view-con a").click(function(){
				listHeadView($(this));
				return false;
			});
			$(".list-head .view-con a").mouseover(function(){
				listHeadView($(this));
			});

			listHeadView = function(obj){
				obj.parent().parent().find(".view-con a").attr("class" , "");
				obj.parent().parent().parent().find("ul.brand-category").hide();
				obj.attr("class" , "selected");
				$(obj.attr("href")).show();
				
			};
			
			
			/*** 인도장안내 ***/
			$(".airlist-con a").click(function(event){  
				event.preventDefault();
			}); 
		 
			var newTab = function() {
				var args = arguments[0];
				var _this = this;
				this.id = args.id;
				this.tab = args.tab;
				this.random = (args.random) ? args.random : false;
				this.idx = (this.random) ? Math.floor(Math.random()*this.tab.length) : 0;
				this.evt = (args.evt!='') ? args.evt : 'click';
				this.show = function() {
					var idx = $(this).parent().index();
					$(_this.id).children('.on').removeClass('on');
					_this.tab.eq(idx).parent().addClass('on');
				};
				this.evtBind = function() {
					if(this.evt == 'mouseover') _this.tab.mouseover(_this.show).focus(_this.show);
					else _this.tab.click(_this.show);
				};
				this.tab.eq(this.idx).parent().addClass('on');
				this.evtBind();
			}; 
			var tab1 = new newTab ({
				id : '#airlist-con',
				tab : $('#airlist-con').find('.tit'),
				random : false,
				evt : 'click'
			}); 
			
			
			// 우측 best div 이벤트 시작
			

				
			
			var bannerCnt = 0;

			$("div.best .view-con span").click(function(){
				bannerMotion($(this));
			});

						
			// 좌우 이동
			bannerMotion = function(obj){
				bannerCnt--;
				if(bannerCnt < 0)
				bannerCnt = obj.parent().parent().find("div.best-box ul li").size() - 1;
				bannerCnt = bannerCnt % (obj.parent().parent().find("div.best-box ul li").size());
				obj.parent().parent().find("div.best-box ul li").hide();
				obj.parent().parent().find("div.best-box ul li:eq("+ bannerCnt +")").show();
			};


});