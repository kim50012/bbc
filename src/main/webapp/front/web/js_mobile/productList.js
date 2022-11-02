	
	//스크롤 했을떄 10개씩 가져옴
	function getScrollCategoryProductList(){

		if($("#changeData").val()=="Y"){
			if($("#crtCtgrId2").val()==""){
				schDispCtgrId = $("#crtCtgrId1").val();
			}else{
				schDispCtgrId = $("#crtCtgrId2").val();
			}
		}

		$(".loading-ajax").show();
		
		var pr = "dispCtgrId="+schDispCtgrId
					+"&sort="+schSort
					+"&page="+page;


		var url = "/mobile/category/getAjaxCategoryProductList?"+pr;
        
		
        $.get(url, function(data){
            $("#ul-item-box").append(data);
            
            //데이터 로딩후 리스트형/바둑판형 체크후 변경
            var data_class = "";
			$('.btn-means').each(function(){
				if($(this).css('display') == 'none'){
					data_class = $(this).attr('data');
					$('[class*=item-box]').attr('class',data_class);
				}
			});
            
			//history thml 남김
			moreViewHtml += data;
			var historyID = 'HIS_ID:001';
	        dhtmlHistory.add(historyID , moreViewHtml);
	        
	        getAjax = true;
	        
	        $("#itemPage").val(page);
			
       });
	}
	
	//검색조건 별 신규 조회(카테고리, 소팅순서)
	function getSearchProductList(type, arg, argNm){
		$("#changeData").val("Y");
		$("#changeDataCnt").val(1);

		if(type == "ctgr" || type == "ctgr2" || type == "ctgrTot" ){
			schDispCtgrId = arg;
			if(type == "ctgr" || type == "ctgrTot"){
				$("#ctgrTitle").html(argNm);
				pSchDispCtgrId = arg;
				categorySelectLoad(schDispCtgrId, type);

				$("#crtCtgrId1").val(arg);
				$("#crtCtgrId2").val("");
				
			}else{

				$("#crtCtgrId2").val(arg);
			}
		}
		else {
			schSort = arg;
			$("#hdSort").val(schSort);
		}
		
		getSearchCategoryProductList(); 
	}
	
	//검색조건 변경 시 상훔 조회
	function getSearchCategoryProductList(){
		
		if($("#crtCtgrId2").val()==""){
			schDispCtgrId = $("#crtCtgrId1").val();
		}else{
			schDispCtgrId = $("#crtCtgrId2").val();
		}
		
		
		getAjax = true;
		page = 1;
		$("#itemPage").val(page);
		moreViewHtml = "";
		
		$(".loading-ajax").show();
		//$("#ul-item-box").html("");
	        
		var pr = "dispCtgrId="+schDispCtgrId
				+"&sort="+schSort
				+"&page="+page;

		
		var url = "/mobile/category/getAjaxCategoryProductList?"+pr;
        
        $.get(url, function(data){
        	
        	//history thml 남김
			moreViewHtml += data;
			var historyID = 'HIS_ID:001';
	        dhtmlHistory.add(historyID , moreViewHtml);
	        
            $("#ul-item-box").empty().append(data);
            $("#listTotCnt").html(setComma($("#listSchCount").val()));
            
            //데이터 로딩후 리스트형/바둑판형 체크후 변경
			$('.btn-means').each(function(){
				if($(this).css('display') == 'none'){
					var data_class = $(this).attr('data');
					$('[class*=item-box]').attr('class',data_class);
				}
			});
	        
	        getAjax = true;
	        
	        //$("#listClass").val(data_class);
	        totalPage = $("#totalPages").val();
	        $("#itemPage").val(page);
			
       });
	}
	
	//////////////////////////////////history back ////////////////////////////////
	function initialize() {
	  // history 저장을 위해 초기화
	  dhtmlHistory.initialize();
	  // 뒤로가기가 실행될때 실행할 이벤트 함수를 지정
	  dhtmlHistory.addListener(historyfunc);
	}
	
	function historyfunc(HistoryName, HistoryValue) {
		
		//var crtPage = $("#itemPage").val();
		changeData = $("#changeData").val();
		var cgcnt = $("#changeDataCnt").val();
		var histHtml = $("#histHtml").val();

		/* if(changeData=="Y"){
			if(cgcnt == 1){
				cgcnt=Number(cgcnt)+1;
				$("#changeDataCnt").val(cgcnt);
				//alert($("#changeDataCnt").val());
				$("#ul-item-box").empty().append(HistoryValue);
			}else{
				$("#ul-item-box").append(HistoryValue);
			}
			
		}else{
			//if(crtPage>1)
				$("#ul-item-box").append(histHtml+HistoryValue);
			//else return;
		}  */
		if(cgcnt == 1){
			cgcnt=Number(cgcnt)+1;
			$("#changeDataCnt").val(cgcnt);
			$("#ul-item-box").append(HistoryValue);
			$("#histHtml").val(HistoryValue);
		}else{
			$("#ul-item-box").append(histHtml+HistoryValue);
			$("#histHtml").val(histHtml+HistoryValue);
		}
		
		/*
		$(this).parent().addClass('on').siblings().removeClass('on');
			$('.search-bg').hide();
			$('.search-result > a').removeClass('on').siblings('div').not('.search-bg').slideUp();
			
			$(this).parents('.search-menu').prev().html($(this).text() + '<i class="arrow"></i>');
			*/
		
		crtCtgrId1 = $("#crtCtgrId1").val();
		crtCtgrId2 = $("#crtCtgrId2").val();
		if(crtCtgrId1!=""){
			$("#ct1"+crtCtgrId1).addClass('on').siblings().removeClass('on');
			$("#ctgrDepth2Title").html($("#ct1"+crtCtgrId1).text() + '<i class="arrow"></i>');
			//getSearchProductList("ctgr2", crtCtgrId1, "");
			if(crtCtgrId1.length != 4){
				categorySelectLoad(crtCtgrId1, "ctgr");
			}
		}
		/* if(crtCtgrId2!="" && $("#changeData").val()=="Y"){
			categorySelectLoad(crtCtgrId1, "ctgr");
		} */ 
		
		var hdSort = $("#hdSort").val();
		if(hdSort!=""){
			$("#sort"+hdSort).addClass('on').siblings().removeClass('on');
			$("#sortTitle").html($("#sort"+hdSort).text() + '<i class="arrow"></i>');
		}
		
		/* if($("#crtCtgrId2").val()!="" && $("#changeData").val()=="Y"){

			crtCtgrId2 = $("#crtCtgrId2").val();
			$("#ct2"+crtCtgrId2).addClass('on').siblings().removeClass('on');
			$("#sel3txt").html($("#ct2"+crtCtgrId2).text() + '<i class="arrow"></i>');
			
		} */
		
		var val = $('#listClass').val();
		$('[data=' + val +']').hide().siblings('.btn-means ').show();
		$('[class*=item-box]').attr('class',val);
		$("#ul-item-box").show(); 
	}
	//////////////////////////////////history back ////////////////////////////////
	
	function getCurrentListClass(){
		var histListClass = "";
		$('.btn-means').each(function(){
			if($(this).css('display') == 'none'){
				var data_class = $(this).attr('data');
				histListClass = data_class;
			}
		});
		return histListClass;
	}
	
	function setListClass(){
		var str = getCurrentListClass();
        $("#listClass").val(str);
	}
	
	function categorySelectLoad(prntCtgrId, type) {

	    var params = "dispCtgrId="+prntCtgrId;
	    
	    $("#sel3txt").html("所有产品<i class='arrow'></i>");

	    if(type == "ctgrTot"){ //depth1
	    	$.ajax({
		        type: "GET"
		        ,url: "/mobile/category/getAjaxCategoryNameCn"
		        ,data: params
		        ,dataType: "json"
		        ,success: function(data) {
		        	if(data.categoryName!=null){
	        	    	$("#sel3txt").addClass("disabled");
	        	    	$("#ctgrTitle").html(data.categoryName);
		        	}
		        }
		    });
	    
	    }else{
	    	//depth2
	    	var html="";
		    $.ajax({
		        type: "GET"
		        ,url: "/mobile/category/getAjaxCategorySelectSubList"
		        ,data: params
		        ,dataType: "json"
		        ,success: function(data) {
		
		        	if(data.categorys!=null){
	        	    	//depth 2
	        	    	if(data.categorys.length <= 1){
		        			$("#sel3txt").addClass("disabled");
		        			$("#sel3txt").html(data.categorys[0].ctgrNameCn+"<i class='arrow'></i>");
		        		}else{
		        			//$("#crtCtgrId2").val()
		        			$("#sel3txt").removeClass("disabled");
		        			var ct2 = $("#crtCtgrId2").val();

		        			if(ct2 == ""){
			        			html += '<ul ><li class="on"><a href="#" onclick="javascript:getSearchProductList(\'ctgr\',\''+pSchDispCtgrId+'\',\'所有产品\')">所有产品</a></li>';
				        		for(var i=0;i<data.categorys.length;i++){
					        		html += '<li id="ct2'+data.categorys[i].ctgrId+'"><a href="#" onclick="javascript:getSearchProductList(\'ctgr2\',\''+data.categorys[i].ctgrId+'\',\''+data.categorys[i].ctgrNameCn+'\')">'+data.categorys[i].ctgrNameCn+'</a></li>';
					        		
					        	}
		        			}else{
		        			
		        				html += '<ul ><li ><a href="#" onclick="javascript:getSearchProductList(\'ctgr\',\''+pSchDispCtgrId+'\',\'所有产品\')">所有产品</a></li>';
				        		for(var i=0;i<data.categorys.length;i++){
				        			if(ct2 == data.categorys[i].ctgrId){
				        				html += '<li id="ct2'+data.categorys[i].ctgrId+'" class="on"><a href="#" onclick="javascript:getSearchProductList(\'ctgr2\',\''+data.categorys[i].ctgrId+'\',\''+data.categorys[i].ctgrNameCn+'\')">'+data.categorys[i].ctgrNameCn+'</a></li>';
					        			$("#sel3txt").html(data.categorys[i].ctgrNameCn+"<i class='arrow'></i>");
				        			}
					        		else 
					        			html += '<li id="ct2'+data.categorys[i].ctgrId+'" ><a href="#" onclick="javascript:getSearchProductList(\'ctgr2\',\''+data.categorys[i].ctgrId+'\',\''+data.categorys[i].ctgrNameCn+'\')">'+data.categorys[i].ctgrNameCn+'</a></li>';
					        		
					        	}
		        			}
		        			
		        		}
		        	}
		        		
		        	html += '</ul>';
		        	
		        	$("#subSelectList").empty().append(html);
		        }
		    });
	    }
	}
	
	/* 좋아요  */
	function btnGoodCount(prdtCode){
		var param = "prdtCode="+prdtCode;

       $.ajax({
            type: "get"
            ,url: "/mobile/product/ajaxGoodCount"
            ,data: param
            ,dataType: "json"
            ,success : function(data){
              $("#"+prdtCode+"goodCnt").empty().append(data.count);
              alert("<ui:message key='message.recommend.complete'/>");
            }
            ,error: function(data) {}
        }); 
	}
	

	function directOrderProduct(prdtCode,ctgrId) {
	//2014.02.10 박정하- 모바일 > 제품상세구매페이지 > 구매수량 제한 추가
	   var tmpgubun="";
	   tmpgubun="quickOrder";
	   checkLimitPrdtCount(tmpgubun,prdtCode,ctgrId);
	   return false;    
	}


	function fncAddCart(prdtCode,ctgrId) {
	//2014.02.10 박정하- 모바일 > 제품상세구매페이지 > 구매수량 제한 추가
	    var tmpgubun="";
	    tmpgubun="addCart";
	    checkLimitPrdtCount(tmpgubun,prdtCode,ctgrId);
	}


	function fncAddWishProduct(prdtCode,ctgrId) {
	//2014.02.10 박정하- 모바일 > 제품상세구매페이지 > 구매수량 제한 추가
	    var tmpgubun="";
	    tmpgubun="addWishProduct";
	    checkLimitPrdtCount(tmpgubun,prdtCode,ctgrId);
	}
	
	function checkLimitPrdtCount(tmpgubun, prdtCode,ctgrId){
		var buyCount = "1";//$("input[name='productBuyCount']").val();
		var successYn = true; 
	    var params = "";
	    var optnDesc = '';
	    
	    if(isEmpty(buyCount)) {
	        Alert("<ui:message key='validate.amount.required'/>");
	        $("input[name='productBuyCount']").focus();
	        successYn = false;
	        return false;
	     }    
	    
	    //리스트에서는 제외함
	    /* $("select[name='selectedOptnDesc']").each(function(index){
	 	   
	        var optnName = $("input[name='optnName']").eq(index).val();
	        optnDesc = $(this).val();
	        
	        if(isEmpty(optnDesc)) {
	            Alert(optnName+"<ui:message key='validate.noSelected.required'/>");
	            successYn = false;
	            return false;
	        }
	        
	    }); */
	    
	    params = "prdtCode="+prdtCode
	            +"&buyCount="+buyCount;
	  if(successYn) {            
	    $.ajax({
	        type : "POST",
	        //url : "/mobile/order/checkLimitPrdtCount",
	        url : "/mobile/order/limitPrdtCount",
	        data : params,
	        dataType : "json",
	        success : function(data) {
	            if (data.success) {
					switch(tmpgubun){
						case 'addCart' :
							addCart(prdtCode,buyCount,optnDesc,ctgrId, "DETAIL");break;
						case 'addWishProduct' :
							addWishProductMbl(prdtCode);break;
						case 'quickOrder' :
							quickOrder(prdtCode, buyCount, optnDesc, ctgrId, "DETAIL");break;
					}

	            } else {
	                Alert(data.errorMessages);
	            }
	        },
	        error : function(data) {
	            Alert("<ui:message key='error.common.system'/>");
//	            location.href = "${serverHost}/mobile/order/cart";
	        }
	    });
	  }
	}
	
	function goBack2(){
		 var crtUrl = document.location.href;
		 var urlStst =  crtUrl.indexOf("#");

		/*  if(urlStst == -1){
			 window.history.go(-1);
			 location
			 
			 ${referURL}
		 }else{
			 window.history.go(-2);
		 } */
		 location.href = "${referURL}";
	 }