    var Data = {
        startX: 0,
        currentX: 0,
        locked: false //是否设值完成, 用于完美控制不同浏览器事件解析差异
    };
    var flag=true;
    function addListener(){
    	$(".aboutUs-HS").mousedown(doMouseOver).mousemove(doMouseMove).mouseup(doMouseUp);
    }    
    function doMouseOver(e){
    	if(flag){
	        Data.startX = e.pageX - Data.currentX;
	        Data.locked = true; 
    	}
    	flag=true;
    }
    function doMouseMove(e){
    	if(flag){
    		if(Data.locked != true){return false;}
    	    Data.currentX = (e.pageX - Data.startX);
    	    if(Data.currentX<0&&Data.currentX>-3080){
    	    	if(Data.currentX<0&&Data.currentX>-120){
    	    		Data.currentX=0;
    	    	} 
    	    	if(Data.currentX<-2980&&Data.currentX>-3080){
    	    		Data.currentX=-3080;
    	    	}
    	    	$(".aboutUs-HS").css({"background-position": Data.currentX + "px "});
    	    	$(".button-last").attr("src","/images/portal/LAST_02.png");
    	    	$(".button-next").attr("src","/images/portal/NEXT_02.png");
    	    }else{
    	    	if(Data.currentX>=0){
    	    		Data.currentX=0;
    	    		$(".button-last").attr("src","/images/portal/LAST_01.png");
    	    	}else{
    	    		Data.currentX=-3080;
    	    		$(".button-next").attr("src","/images/portal/NEXT_01.png");
    	    	}
    	    }
    	}
    }
	function doMouseUp(e){
		flag=false;
	}
	function moveLeft(){
		if(Data.currentX>=0){
			$(".button-last").attr("src","/images/portal/LAST_01.png");
			return;
		}else{
			$(".button-last").attr("src","/images/portal/LAST_02.png");
			$(".button-next").attr("src","/images/portal/NEXT_02.png");
			if(Data.currentX>-300&&Data.currentX<0){
				Data.currentX=-300;
			}
			Data.currentX +=300;
		    $(".aboutUs-HS").css({"background-position":  Data.currentX + "px "});
		}
	}
	function moveRight(){
		if(Data.currentX<=-3080){
			$(".button-next").attr("src","/images/portal/NEXT_01.png");
			return;
		}else{
			$(".button-next").attr("src","/images/portal/NEXT_02.png");
			$(".button-last").attr("src","/images/portal/LAST_02.png");
			if(Data.currentX<-2780&&Data.currentX>-3080){
				Data.currentX=-2780;
			}
			Data.currentX -=300; 
		    $(".aboutUs-HS").css({"background-position": Data.currentX + "px "});
		}
	}