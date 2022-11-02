
	function mapOpenSingle(macid,dayType, begin, end,tmi_inbound){
		mapOpenByGet('S', macid, dayType, begin, end,tmi_inbound);
	}
	
	function mapOpenSingleForCustomer(macid, dayType,begin, end,tmi_inbound){
		mapOpenByGet('W', macid, dayType, begin, end,tmi_inbound);
	}
	
	function mapOpenSingleForCustomer(macid, dayType,begin, end,tmi_inbound){
		mapOpenByGet('S', macid, dayType,  begin, end,tmi_inbound);
	}
	function mapOpenSingleForArea(macid){
		mapOpenByGet('A', macid, '', '', '','');
	}
	function mapOpenMoving(macid, dayType, begin, end,tmi_inbound){
		mapOpenByGet('W', macid, dayType, begin, end,tmi_inbound);
	}
	function mapOpenByGet(mode, macid, dayType, begin, end, tmi_inbound){
		var path = '/map/autoNavi.action' + 
				'?mode=' + mode +
				'&macids=' + macid +
				'&dayType=' + dayType +
				'&begin=' + begin +
				'&end=' + end +
				'&tmi_inbound=' + tmi_inbound;

		var doc = documentSize();
		var width = Math.max(Math.max(doc.width, $(window).innerWidth()), window.screen.width);
		var height = Math.max(Math.max(doc.height, $(window).innerHeight()), window.screen.height);
		window.open(path, "DooTMS_MAP_PAGE",
						"height="+ height + "px,width="+ width + 
						",top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no");
	}
	function mapOpenMulti(macids){
		mapOpenByPost("M", macids);
	}
	function mapOpenMultiForArea(macids){
		mapOpenByPost("A", macids);
	}
	function mapOpenByPost(mode, macids){
		if (macids.length <= 0){
			return;
		}
		var doc = documentSize();
		var width = Math.max(Math.max(doc.width, $(window).innerWidth()), window.screen.width);
		var height = Math.max(Math.max(doc.height, $(window).innerHeight()), window.screen.height);
		window.open("about:blank", "DooTMS_MAP_PAGE",
						"height="+ height + "px,width="+ width + 
						",top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=yes,location=no, status=no");
		
		mapDataSubmit('/map/autoNavi.action', "DooTMS_MAP_PAGE",  mode, macids);
	}
	function mapDataSubmit(path, target, mode, macids){
		var form = document.createElement("form");
		form.id = "formMap";
		form.name = "formMap";
		form.method = "POST";
		form.action = path;
		form.target = target;
		
		var modeInput = document.createElement("input");
		modeInput.id = "mode";
		modeInput.name = "mode";
		modeInput.type = "hidden";
		modeInput.value = mode;
		form.appendChild(modeInput);
				
		for(var i = 0; i < macids.length; i ++){
			var macidInput = document.createElement("input");
			macidInput.id = "macids";
			macidInput.name = "macids";
			macidInput.type = "hidden";
			macidInput.value = macids[i];
			form.appendChild(macidInput);
		}
		document.body.appendChild(form);
		form.normalize();
		form.submit();
	}