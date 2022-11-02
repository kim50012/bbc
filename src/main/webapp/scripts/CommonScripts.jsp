<%@page import="com.waremec.wpt.domain.EnumerateDomain"%>
<%-- <%@page import="com.common.utilities.RequestUtils"%>
<%@page import="com.common.utilities.StringUtils"%>
<%@page import="com.common.utilities.CultureUtils"%>
<%@page import="com.common.utilities.FileUtils"%>
<%@page import="com.common.utilities.SessionUtils"%>
<%@page import="com.login.domains.AccountDomain"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* String _currentUICulture = CultureUtils.getCurrentUICulture();
	if (StringUtils.IsNullOrEmpty(_currentUICulture)){
		_currentUICulture = "zh-CN";
	} */
%>
<script type="text/javascript" src="/scripts/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/scripts/jquery/jquery.ui.all.min.js"></script>
<%-- <script type="text/javascript" src="/scripts/jquery/jquery.ui.datepicker.<%=_currentUICulture %>.js"></script> --%>
<script type="text/javascript" src="/scripts/jquery/jquery.bpopup.min.js"></script>
<script type="text/javascript" src="/scripts/jquery/jquery.dropdownlist.min.js"></script>
<script type="text/javascript" src="/scripts/KendoUI/kendo.all.min.js"></script>
<%-- <script type="text/javascript" src="/scripts/KendoUI/culture/kendo.culture.<%=_currentUICulture %>.min.js"></script>
<script type="text/javascript" src="/scripts/KendoUI/messages/kendo.messages.<%=_currentUICulture %>.min.js"></script> --%>
<script type="text/javascript" src="/scripts/maps/maps.js"></script>
<script type="text/javascript">
/////Google Analytics/////////////////////////////////////////////////////////////////
//   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
//   (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
//   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
//   })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

//   ga('create', 'UA-50117138-1', 'dootms.com');
//   ga('send', 'pageview');
/////Google Analytics/////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
var browser = {
		versions: function(){
			var u = navigator.userAgent; 
			return {
				trident: u.indexOf('Trident') > -1,  //IE内核
				presto: u.indexOf('Presto') > -1,  //opera内核
				webKit: u.indexOf('AppleWebKit') > -1,  //苹果、谷歌内核
				gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,  //火狐内核
				mobile: !!u.match(/AppleWebKit.*Mobile.*/),  //是否为移动终端
				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),  //ios终端
				android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1,  //android终端或者uc浏览器
				iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1,  //是否为iPhone或者QQHD浏览器
				iPad: u.indexOf('iPad') > -1,  //是否iPad
				webApp: u.indexOf('Safari') == -1  //是否web应该程序，没有头部与底部
			};
		}
};
	
	$(function() {
		$.ajaxSetup({
			cache : false
		});
		if (IsProccessing()){
			HideProcessingLayer();
		}
		window.focus();
	});
	function getUnicodeString(value){
		return encodeURIComponent(encodeURIComponent(value));
	}
	function documentSize(){
		var doc = new Object();
		var body = (document.compatMode && document.compatMode.toLowerCase() == "css1compat") ? document.documentElement
				: document.body;
		if (isNaN($(window).innerHeight()) || isNaN($(window).innerWidth())){
			doc.height = body.clientHeight;
			doc.width = body.clientWidth;
			doc.mode = "document";
		} else {
			doc.height = $(window).innerHeight();
			doc.width = $(window).innerWidth();
			doc.mode = "window";
		}
		return doc;
	}
    function ShowProcessingLayer() {
        if ($("input#hidProcessingLayer").val() == "Y") {
            $("input#hidProcessingLayer").val("N");
        }
        $("input#hidProcessingLayer").val("P");
        $("img#imgProcessingLayer").show();
        $("div#divProcessingLayer").bPopup({
            modalClose: false,
            opacity: 0.3,
            modalColor: "#fefefe",
            onClose: function () {
                $("input#hidProcessingLayer").val("N");
                $("img#imgProcessingLayer").hide();
                //try { PageResize(); }
                //catch (err) { }
            },
            onOpen: function () {
                $("input#hidProcessingLayer").val("Y");
            }
        });
    }
    function HideProcessingLayer() {
        //$("input#hidProcessingLayer").val("N");
        $("div#divProcessingLayer").bPopup().close();
    }
    function IsProccessing() {
        if ($.trim($("input#hidProcessingLayer").val()) == "N") {
            return false;
        }
        else {
            return true;
        }
    }
	
    <%-- var pageMessages = {
    		display: '<%=CultureUtils.GetResource("{0} - {1} of {2} items", request)%>',
    		page: '<%=CultureUtils.GetResource("Page", request)%>',
    		of: '<%=CultureUtils.GetResource("of {0}", request)%>',
    		empty: '<%=CultureUtils.GetResource("No items to display", request)%>',
    		itemsPerPage: '<%=CultureUtils.GetResource("items per page", request)%>'
		}; --%>

	function windowOpenFullScreen(path, name){
		var doc = documentSize();
		var width = Math.max(Math.max(doc.width, $(window).innerWidth()), window.screen.width);
		var height = Math.max(Math.max(doc.height, $(window).innerHeight()), window.screen.height);
		windowOpen(path, name, width, height, 0, 0);
	}
	
	function windowOpenCenter(path, name, width, height){
		var doc = documentSize();
		var windowWidth = Math.max(Math.max(doc.width, $(window).innerWidth()), window.screen.width);
		var windowHeight = Math.max(Math.max(doc.height, $(window).innerHeight()), window.screen.height);
		var top = (windowHeight - height) / 2 - 20;
		var left = (windowWidth - width) / 2;
		windowOpen(path, name, width, height, top, left);
	}
	
	function windowOpenFullScreenHideTitle(path, name){
		window.open(path,name,'fullscreen=yes,directories=no,status=no,toolbar=no,scroll=no,help=no,width=800px,height=600px');
	}
	
	function windowOpen(path, name, width, height, top, left){
		window.open(path, name,
						'height='+ height + 'px,width='+ width + 'px,top=' + top + ',left=' + left + 
						',toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
	}
	function createFormInput(id, value){
		var input = document.createElement("input");
		input.id = id;
		input.name = id;
		input.type = "hidden";
		input.value = value;
		return input;
	}

	function windowClose(){
		var closeWinFunc = window.close; 
		window.close = function(){
			window.open("","_self"); 
			closeWinFunc();
		};
 		window.close();
	}

	function openManual(){
		windowOpenCenter("/portal/manual.action", "DooTMS_Manual", 850, 600);
	}
	
	function ConverToSort(sort, type) { 
        var strSort = "";  
        if (sort) {
        	for (var i = 0; i < sort.length; i++) {
            	if(type=="dir"){
    				strSort = sort[i].dir;  
    	        }else{
    		    	strSort = sort[i].field;  
    	        }
             }
		}
        
    	return strSort;  
    } 
	
	Date.prototype.format = function(f) {    
        if (!this.valueOf()) return " ";     
        
        var weekName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];    
        var d = this;         
        
        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {        
            switch ($1) {            
               case "yyyy": return d.getFullYear();            
               case "yy": return (d.getFullYear() % 1000).zf(2);            
               case "MM": return (d.getMonth() + 1).zf(2);            
               case "dd": return d.getDate().zf(2);            
               case "E": return weekName[d.getDay()];            
               case "HH": return d.getHours().zf(2);            
               case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);            
               case "mm": return d.getMinutes().zf(2);            
               case "ss": return d.getSeconds().zf(2);            
               case "a/p": return d.getHours() < 12 ? "오전" : "오후";            
               default: return $1;        
             }    
        });}; 

    String.prototype.string = function(len){
        var s = '', i = 0; 
        while (i++ < len) { s += this; } 
        return s;
    }; 
    String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
    Number.prototype.zf = function(len){return this.toString().zf(len);};
    
    function setComma(n) { 
		return (!n||n==Infinity||n=='NaN')?0:String(n).replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,'); 
	} 
	
<%--	禁止右键功能,单击右键将无任何反应 --%>
	//document.oncontextmenu = new Function("event.returnValue=false;"); 
<%--	禁止先择,也就是无法复制 --%>
	//document.onselectstart = new Function("event.returnValue=false;");
</script>

    <div id="divProcessingLayer" style="display: none; text-align: center; width: 100%;" align="center">
        <img id="imgProcessingLayer" src="/images/platform/loading.gif" alt="" align="absmiddle" />
    </div>
    <div style="display: none;">
        <input type="text" id="hidProcessingLayer" value="N" />
    </div>
	<script type="text/javascript">
		if (!IsProccessing()){
			ShowProcessingLayer();
		}
	</script>
	
	
<%-- 根据用户所属的代理商信息，选中相应的下拉列表框--%>
<%
/* 	AccountDomain _globalAccount = (AccountDomain) session.getAttribute(SessionUtils.SESSION_ACCOUNT_NAME);
	if (_globalAccount == null){
		_globalAccount = new AccountDomain();
		_globalAccount.setUserType(new EnumerateDomain());
	} */
%>

<script type="text/javascript">
var _globalAreaValue = 0;
var _globalGroupValue = 0;
var _globalAgentValue = 0;

//权限处理 권한처리
<%-- var _globalAuthority = '<%=StringUtils.convertNullToEmpty(_globalAccount.getUserType().getCode())%>';
var _globalBranchId = "<%=_globalAccount.getBranchID()%>";
var _globalDealerGroup = "<%=_globalAccount.getDealerGroup()%>";
var _globalDealerID = "<%=_globalAccount.getDealerID()%>"; --%>

function dropdown_reset(o, isCoA, firstValue) { //isCoA: is contain the option for ALL
	if ($(o).data('dd')) { $(o).data('dd').destroy(); }
	$(o).empty();
	if (isCoA == true) {
		<%-- $(o).append('<option value = "' + firstValue + '"><%=CultureUtils.GetResource("全部", request) %></option>'); --%>
	}
}
/*
initializeDealers({
	branch: { id: "#branch", value: "" },
	group: { id: "#group", value: "" },
	dealer: { id: "#dealer", value: "" },
	firstValue: ""
});
 */
function initializeDealers(options) { // 可绑定默认值，也可以按登陆用户权限自动加载
	if (!options.firstValue) {
	options.firstValue = "";
	}

	if (!options.branch.value || options.branch.value == "") {
		options.branch.value = options.firstValue;
	} else if (options.branch.value != options.firstValue) {
		_globalBranchId = options.branch.value;
		_globalDealerGroup ="";
		_globalDealerID ="";
	}
	
	if (!options.group.value || options.group.value == "") {
		options.group.value = options.firstValue;
	} else if (options.group.value != options.firstValue) {
		_globalBranchId = "";
		_globalDealerGroup = options.group.value;
		_globalDealerID ="";
	}
		
	if (!options.dealer.value || options.dealer.value == "") {
		options.dealer.value = options.firstValue;
	} else if (options.dealer.value != options.firstValue) {
		_globalDealerID = options.dealer.value;
	}
	initializeOrganizations(
			options.branch.id, 
			options.group.id, 
			options.dealer.id, 
			options.firstValue);
}
function initializeOrganizations(branch, group, dealer, firstValue){ // 仅可以按登陆用户权限自动加载
	if(_globalBranchId != 0){
		$(branch).val(_globalBranchId);
	}
	if(_globalDealerGroup != 0){
		$(group).val(_globalDealerGroup);
	}
	switch(_globalAuthority){
	case "1": 
		//大区用户
		$(branch).attr("disabled", "disabled");
		break;
	case "2": 
		//集团代理商
		$(group).attr("disabled", "disabled");
		break;
	case "3": 
		//代理商
		$(branch).attr("disabled", "disabled");
		$(group).attr("disabled", "disabled");
		break;
	default:
		_globalBranchId  = firstValue;
		_globalDealerGroup  = firstValue;
		break;
	}

	$(branch).msDropdown({
		mainCSS: "white", 
		on: {
			change: function(data, ui){
				$(group).msDropdown().data("dd").set("value", firstValue);
				$(dealer).msDropdown().data("dd").set("value", firstValue);
				loadDealers(branch, group, dealer, firstValue);
				try {
					organizationsChangeEvents();
				} catch(e) {}
			}
		}
	});	
	$(group).msDropdown({
		mainCSS: "white", 
		on: {
			change: function(data, ui){
				$(branch).msDropdown().data("dd").set("value", firstValue);
				$(dealer).msDropdown().data("dd").set("value", firstValue);
				loadDealers(branch, group, dealer, firstValue);
				try {
					organizationsChangeEvents();
				} catch(e) {}
			}
		}
	});	
	dropdown_reset(dealer, true, firstValue);
	$(dealer).attr('disabled', 'disabled');
	$(dealer).msDropdown({mainCSS: "white"});
	loadDealers(branch, group, dealer, firstValue);
}
function loadDealers(branch, group, dealer, firstValue) {
	if (firstValue == $(branch).val() && firstValue == $(group).val()) {
		dropdown_reset(dealer, true, firstValue);
		$(dealer).attr('disabled', 'disabled');
		$(dealer).msDropdown({mainCSS: "white"});
		return;
	}
	var params = {
			order: 3,
			parentIndex : $(branch).val(),
			leaderIndex : $(group).val()
	};
	
	$.ajax({ type : "POST", cache : false, dataType : "json",
		url : '/organize/searchOrganize.action',
		data : params,
		success : function(data) {
			dropdown_reset(dealer, true, firstValue);
			if (data != null && data.length > 0){
				for(var i = 0; i < data.length; i++){
					$(dealer).append('<option value = "' + data[i].index + '">' + data[i].shortName + '</option>');
				}
				$(dealer).removeAttr('disabled');
				$(dealer).val(_globalDealerID);
				
				if(_globalAuthority == "3") {
					$(dealer).attr('disabled', 'disabled');
				} else {
					_globalDealerID = firstValue;
				}
			} else {
				$(dealer).attr('disabled', 'disabled');
			}
			$(dealer).msDropdown({
				mainCSS: "white", 
				on: {
					change: function(data, ui){
						try {
							organizationsChangeEvents();
						} catch(e) {}
					}
				}
			});
		},
		error : function(xhr, msg, e) {
			dropdown_reset(dealer, true, firstValue);
			$(dealer).attr('disabled', 'disabled');
			$(dealer).msDropdown({mainCSS: "white"});
		}
	});
}

/*
initializeModels({
	category: { id: "#category", value: "" },
	model: { id: "#model", value: "" },
	firstValue: ""
});
 */
function initializeModels(options){
	if (!options.firstValue) {
		options.firstValue = "";
	}
	if (!options.category.value) {
		options.category.value = options.firstValue;
	}
	if(options.model) {
		if (!options.model.value) {
			options.model.value = options.firstValue;
		}
	}
	$(options.category.id).val(options.category.value);
	options.category.value = options.firstValue;
	$(options.category.id).msDropdown({
		mainCSS: "white", 
		on: {
			change: function(data, ui){
				if(options.model) {
					loadModels(options);
				}
			}
		}
	});	
	if(options.model) {
		dropdown_reset(options.model.id, true, options.firstValue);
		$(options.model.id).attr('disabled', 'disabled');
		$(options.model.id).msDropdown({mainCSS: "white"});
		loadModels(options);
	}
}
function loadModels(options){
	if (options.firstValue == $(options.category.id).val()) {
		dropdown_reset(options.model.id, true, options.firstValue);
		$(options.model.id).attr('disabled', 'disabled');
		$(options.model.id).msDropdown({mainCSS: "white"});
		return;
	}
	var params = { group: $(options.category.id).val() };

	$.ajax({ type : "POST", cache : false, dataType : "json",
		url: '/enumerate/searchModel.action',
		data : params,
		success : function(data) {
			dropdown_reset(options.model.id, true, options.firstValue);
			if (data != null && data.length > 0){
				for(var i = 0; i < data.length; i++){
					$(options.model.id).append('<option value = "' + data[i].code + '">' + data[i].name + '</option>');
				}
				$(options.model.id).val(options.model.value);	
				options.model.value = options.firstValue;
				$(options.model.id).removeAttr('disabled');
			} else {
				$(options.model.id).attr('disabled', 'disabled');
			}
			$(options.model.id).msDropdown({mainCSS: "white"});
		},
		error : function(xhr, msg, e) {
			dropdown_reset(options.model.id, true, options.firstValue);
			$(options.model.id).attr('disabled', 'disabled');
			$(options.model.id).msDropdown({mainCSS: "white"});
		}
	});
}

/*
initializeAddress({
	region: { id: "#region", value: "" },
	address1: { id: "#address1", value: "" },
	address2: { id: "#address2", value: "" },
	address3: { id: "#address3", value: "" },
	firstValue: ""
});
 */
function initializeAddress(options){
	if (!options.firstValue) {
		options.firstValue = "";
	}
	if(options.region) {
		if (!options.region.value) {
			options.region.value = options.firstValue;
		}
	} else if(options.address1) {
		if (!options.address1.value) {
			options.address1.value = options.firstValue;
		}
	} else {
		return;
	}
	if(options.address2) {
		if (!options.address2.value) {
			options.address2.value = options.firstValue;
		}
	}
	if(options.address3) {
		if (!options.address3.value) {
			options.address3.value = options.firstValue;
		}
	}

	if(options.region) {
		$(options.region.id).val(options.region.value);
		options.region.value = options.firstValue;
		$(options.region.id).msDropdown({
			mainCSS: "white", 
			on: {
				change: function(data, ui){
					if (options.address1) {
						loadAddress1(options);
					}
				}
			}
		});
	} else if(options.address1) {
		$(options.address1.id).val(options.address1.value);
		options.address1.value = options.firstValue;
		$(options.address1.id).msDropdown({
			mainCSS: "white", 
			on: {
				change: function(data, ui){
					if (options.address2) {
						loadAddress2(options);
					}
				}
			}
		});
	} else {
		return;
	}
	
	if (options.address3) {
		dropdown_reset(options.address3.id, true, options.firstValue);
		$(options.address3.id).attr('disabled', 'disabled');
		$(options.address3.id).msDropdown({mainCSS: "white"});
	}
	if (options.address2) {
		dropdown_reset(options.address2.id, true, options.firstValue);
		$(options.address2.id).attr('disabled', 'disabled');
		$(options.address2.id).msDropdown({mainCSS: "white"});
		loadAddress2(options);
	}
	
	if(options.region) {
		if (options.address1) {
			dropdown_reset(options.address1.id, true, options.firstValue);
			$(options.address1.id).attr('disabled', 'disabled');
			$(options.address1.id).msDropdown({mainCSS: "white"});
			loadAddress1(options);
		}
	}
}

function loadAddress1(options){
	if (options.firstValue == $(options.region.id).val()) {
		dropdown_reset(options.address1.id, true, options.firstValue);
		$(options.address1.id).attr('disabled', 'disabled');
		$(options.address1.id).msDropdown({mainCSS: "white"});
		if (options.address2) {
			dropdown_reset(options.address2.id, true, options.firstValue);
			$(options.address2.id).attr('disabled', 'disabled');
			$(options.address2.id).msDropdown({mainCSS: "white"});
			loadAddress2(options);
		}
		if (options.address3) {
			dropdown_reset(options.address3.id, true, options.firstValue);
			$(options.address3.id).attr('disabled', 'disabled');
			$(options.address3.id).msDropdown({mainCSS: "white"});
		}
		return;
	}
	var params = { rid : $(options.region.id).val(), type : 'S' };
 	$.ajax({ type : "POST", cache : false, dataType : "json",
		url: '/region/searchAddressList.action',
		data : params,
		success : function(data) {
			dropdown_reset(options.address1.id, true, options.firstValue);
			if (data != null && data.length > 0){
				for(var i = 0; i < data.length; i++){
					$(options.address1.id).append('<option value = "' + data[i].code + '">' + data[i].name + '</option>');
				}
				$(options.address1.id).val(options.address1.value);	
				options.address1.value = options.firstValue;
				$(options.address1.id).removeAttr('disabled');
			} else {
				$(options.address1.id).attr('disabled', 'disabled');
			}
			$(options.address1.id).msDropdown({
				mainCSS: "white", 
				on: {
					change: function(data, ui){
						if (options.address2) {
							loadAddress2(options);
						}
					}
				}
			});
			if (options.address2) {
				dropdown_reset(options.address2.id, true, options.firstValue);
				$(options.address2.id).attr('disabled', 'disabled');
				$(options.address2.id).msDropdown({mainCSS: "white"});
				loadAddress2(options);
			}
			if (options.address3) {
				dropdown_reset(options.address3.id, true, options.firstValue);
				$(options.address3.id).attr('disabled', 'disabled');
				$(options.address3.id).msDropdown({mainCSS: "white"});
			}
		},
		error : function(xhr, msg, e) {
			dropdown_reset(options.address2.id, true, options.firstValue);
			$(options.address2.id).attr('disabled', 'disabled');
			$(options.address2.id).msDropdown({mainCSS: "white"});
			if (options.address3) {
				dropdown_reset(options.address3.id, true, options.firstValue);
				$(options.address3.id).attr('disabled', 'disabled');
				$(options.address3.id).msDropdown({mainCSS: "white"});
			}
		}
	});
}
function loadAddress2(options){
	if (options.firstValue == $(options.address1.id).val()) {
		dropdown_reset(options.address2.id, true, options.firstValue);
		$(options.address2.id).attr('disabled', 'disabled');
		$(options.address2.id).msDropdown({mainCSS: "white"});
		if (options.address3) {
			dropdown_reset(options.address3.id, true, options.firstValue);
			$(options.address3.id).attr('disabled', 'disabled');
			$(options.address3.id).msDropdown({mainCSS: "white"});
		}
		return;
	}
	var params = { sid : $(options.address1.id).val(), type : 'C' };

	$.ajax({ type : "POST", cache : false, dataType : "json",
		url: '/region/searchAddressList.action',
		data : params,
		success : function(data) {
			dropdown_reset(options.address2.id, true, options.firstValue);
			if (data != null && data.length > 0){
				for(var i = 0; i < data.length; i++){
					$(options.address2.id).append('<option value = "' + data[i].code + '">' + data[i].name + '</option>');
				}
				$(options.address2.id).val(options.address2.value);	
				options.address2.value = options.firstValue;
				$(options.address2.id).removeAttr('disabled');
			} else {
				$(options.address2.id).attr('disabled', 'disabled');
			}
			$(options.address2.id).msDropdown({
				mainCSS: "white", 
				on: {
					change: function(data, ui){
						if (options.address3) {
							loadAddress3(options);
						}
					}
				}
			});
			if (options.address3) {
				dropdown_reset(options.address3.id, true, options.firstValue);
				$(options.address3.id).attr('disabled', 'disabled');
				$(options.address3.id).msDropdown({mainCSS: "white"});
				loadAddress3(options);
			}
		},
		error : function(xhr, msg, e) {
			dropdown_reset(options.address2.id, true, options.firstValue);
			$(options.address2.id).attr('disabled', 'disabled');
			$(options.address2.id).msDropdown({mainCSS: "white"});
			if (options.address3) {
				dropdown_reset(options.address3.id, true, options.firstValue);
				$(options.address3.id).attr('disabled', 'disabled');
				$(options.address3.id).msDropdown({mainCSS: "white"});
			}
		}
	});
}
function loadAddress3(options){
	if (options.firstValue == $(options.address1.id).val() || 
			options.firstValue == $(options.address2.id).val()) {
		dropdown_reset(options.address3.id, true, options.firstValue);
		$(options.address3.id).attr('disabled', 'disabled');
		$(options.address3.id).msDropdown({mainCSS: "white"});
		return;
	}
	var params = { sid : $(options.address1.id).val(), cid: $(options.address2.id).val(), type : 'G' };

	$.ajax({ type : "POST", cache : false, dataType : "json",
		url: '/region/searchAddressList.action',
		data : params,
		success : function(data) {
			dropdown_reset(options.address3.id, true, options.firstValue);
			if (data != null && data.length > 0){
				for(var i = 0; i < data.length; i++){
					$(options.address3.id).append('<option value = "' + data[i].code + '">' + data[i].name + '</option>');
				}
				$(options.address3.id).val(options.address3.value);	
				options.address3.value = options.firstValue;
				$(options.address3.id).removeAttr('disabled');
			} else {
				$(options.address3.id).attr('disabled', 'disabled');
			}
			$(options.address3.id).msDropdown({mainCSS: "white"});
		},
		error : function(xhr, msg, e) {
			dropdown_reset(options.address3.id, true, options.firstValue);
			$(options.address3.id).attr('disabled', 'disabled');
			$(options.address3.id).msDropdown({mainCSS: "white"});
		}
	});
}
///*********************************************************************************************************************************************************************
/// 旧版，即将废弃。
///*********************************************************************************************************************************************************************
	//选中下拉列表的第一项，参数后一个为第一项的值,可能为空，也可能是-1
	function chooseFirstOption(dropDownObj, firstValue){
		dropDownObj.msDropdown().data("dd").set("value", firstValue);
	}
	
	/*
	* 下拉列表关系初始化
	* @param areaObj 大区下拉列表对象
	* @param groupObj 集团代理商对象
	* @param agentObj 代理商对象
	*/
	function dropRelevanceInit(areaObj, groupObj, agentObj){
 		//如果当前用户是大区、IDCC用户，则
		if("1" != _globalAuthority && "0" != _globalAuthority){
			//大区的设定
			if(_globalBranchId != 0){
				areaObj.val(_globalBranchId);
			}
			//设定当前集团代理商为用户所在的
			
			if(_globalDealerGroup != 0){
				groupObj.val(_globalDealerGroup);
			}
		}
		
		switch(_globalAuthority){
		case "0": 
			//DICC
 			if(("" == areaObj.val() || "-1" == areaObj.val())
					&& ("" == groupObj.val() || "-1" == groupObj.val())){
				
				agentObj.append('<option value="">全部</option>');
				agentObj.attr('disabled', 'disabled');
				agentObj.msDropdown({mainCSS: "white"});
			}
			break;
		case "1": 
			//大区用户
			if(null != agentObj){
				areaAgentSelect(areaObj, agentObj);
			}
			areaObj.attr("disabled", "disabled");
			groupObj.attr("disabled", "disabled");
			break;
		case "2": 
			//集团代理商
			if(null != agentObj){
				groupAgentSelect(groupObj, agentObj); 
			}
			areaObj.attr("disabled", "disabled");
			groupObj.attr("disabled", "disabled");
			break;
		case "3": 
			//代理商
			if(null != agentObj){
				if(areaObj.val() != "" && areaObj.val() != -1) areaAgentSelect(areaObj, agentObj);
				if(groupObj.val() != "" && groupObj.val() != -1) groupAgentSelect(groupObj, agentObj);
				agentObj.attr("disabled", "disabled");
			}
			areaObj.attr("disabled", "disabled");
			groupObj.attr("disabled", "disabled");
			break;
		}
	}
	
	//填写代理商
	function areaAgentSelect(areaObj, agentObj){
		var val = "";
		//权限处理 권한처리
		if(_globalAuthority==3 || _globalAuthority==1){
			val = _globalBranchId;
		}else{
			val = areaObj.val();
		}
		var params = {
				parentIdx : val
		};
		
		$.ajax({
			type : "POST",
			cache : false,
			url : '/libraries/searchAgentsByOrder.action',
 			async: false,
			dataType : "json",
			data : params,
			success : function(data) {
				if (data != null && data.length > 0){
					for(var i = 0; i < data.length; i++){
						agentObj.append('<option value = "' + data[i].index + '">' + data[i].fullName + '</option>');
						//权限处理 권한처리
						<%-- if(data[i].index == "<%=_globalAccount.getDealerID()%>"){
							agentObj.val(data[i].index);
						} --%>
					}
					//权限处理 권한처리
					if(_globalAuthority==3){
						agentObj.attr('disabled', 'disabled');
					}else{
						agentObj.removeAttr('disabled');
					}
				} else {
					agentObj.attr('disabled', 'disabled');
				}
				<%-- agentObj.val("<%=_globalAccount.getDealerID()%>"); --%>
				agentObj.msDropdown({mainCSS: "white"});
			},
			error : function(xhr, msg, e) {
			}
		});
	}
	
	//根据集团代理商填写代理商
	function groupAgentSelect(groupObj, agentObj){
		var val = "";
		
		//权限处理 권한처리
		if(_globalAuthority==3 || _globalAuthority==2){
			val = _globalDealerGroup;
		}else{
			val = groupObj.val();
		}

		var params = {
				groupIdx : val
		};
		$.ajax({
			type : "POST",
			cache : false,
			url : '/libraries/searchAgentsByParentIdx.action',
			dataType : "json",
 			async: false,
			data : params,
			success : function(data) {
				if (data != null && data.length > 0){
					for(var i = 0; i < data.length; i++){
						agentObj.append('<option value = "' + data[i].index + '">' + data[i].fullName + '</option>');
						//权限处理 권한처리
						<%-- if(data[i].index == "<%=_globalAccount.getDealerID()%>"){
							agentObj.val(data[i].index);
						} --%>
					}
					//权限处理 권한처리
					if(_globalAuthority==3){
						agentObj.attr('disabled', 'disabled');
					}else{
						agentObj.removeAttr('disabled');
					}
				} else {
					agentObj.attr('disabled', 'disabled');
				}
				<%-- agentObj.val("<%=_globalAccount.getDealerID()%>"); --%>
				agentObj.msDropdown({mainCSS: "white"});
			},
			error : function(xhr, msg, e) {
			}
		});
	} 
	
	
 	function romDisable(areaObj, groupObj, agentObj){
		
		if(areaObj.attr("disabled") == "disabled"){
			_globalAreaValue = 1;
			 areaObj.removeAttr("disabled");
		}
		if(groupObj.attr("disabled") == "disabled"){
			_globalGroupValue = 1;
			 groupObj.removeAttr("disabled");
		}
		if(agentObj.attr("disabled") == "disabled"){
			_globalAgentValue = 1;
			 agentObj.removeAttr("disabled");
		}
 	}
	
	function addDisable(areaObj, groupObj, agentObj){
		if( _globalAreaValue = 1){
			areaObj.attr("disabled","disabled");	
		}
		if( _globalGroupValue = 1){
			groupObj.attr("disabled","disabled");	
		}
		if( _globalAgentValue = 1){
			agentObj.attr("disabled","disabled");	
		}
	}
	///*********************************************************************************************************************************************************************
	/// 旧版，即将废弃。
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
</script>