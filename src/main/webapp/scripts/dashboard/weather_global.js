/* 
* weather repost global script (v1.0)
* Created: Nov 1th, 2013. This notice must stay intact for usage 
* Author: chen
*/


$(document).ready(function() {
	var sUserAgent = navigator.userAgent.toLowerCase();
	var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
	var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
	var sUserAgent = navigator.userAgent.toLowerCase();
	if ((bIsIpad || bIsIphoneOs)) {
		//$("#map").css({ position: "absolute", top: $("#includetable").height() * 0.22 });
		$("#includetable").css({ position: "absolute", top: $("#includetable").height() * 0.1 });
	} else {
		//$("#map").css({ position: "absolute", top: $("#includetable").height() * 0.11 });
		$("#includetable").css({ position: "absolute", top: 0 });
	}
});

$(window).resize(function() {
	var sUserAgent = navigator.userAgent.toLowerCase();
	var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
	var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
	var sUserAgent = navigator.userAgent.toLowerCase();
	if ((bIsIpad || bIsIphoneOs)) {
		//$("#map").css({ position: "absolute", top: $("#includetable").height() * 0.22 });
		$("#includetable").css({ position: "absolute", top: $("#includetable").height() * 0.1 });
	} else {
		//$("#map").css({ position: "absolute", top: $("#includetable").height() * 0.11 });
		$("#includetable").css({ position: "absolute", top: 0 });
	}
});

/**
 * 下面是一些基础函数,解决mouseover与mouserout事件不停切换的问题(问题不是由冒泡产生的)
 */
function checkHover(e, target) {
    if (getEvent(e).type == "mouseover") {
        return !contains(target, getEvent(e).relatedTarget
                || getEvent(e).fromElement)
                && !((getEvent(e).relatedTarget || getEvent(e).fromElement) === target);
    } else {
        return !contains(target, getEvent(e).relatedTarget
                || getEvent(e).toElement)
                && !((getEvent(e).relatedTarget || getEvent(e).toElement) === target);
    }
}

function contains(parentNode, childNode) {
    if (parentNode.contains) {
        return parentNode != childNode && parentNode.contains(childNode);
    } else {
        return !!(parentNode.compareDocumentPosition(childNode) & 16);
    }
}

/**
 * 取得浮动窗口的ID
 */ 
function subStrId(sid) {
	if (sid === "" || sid.length === 0 || typeof(sid) === "undefined") {
    	alert("画面脚本加载异常,请与管理员联系.");
		return;
	}
	return '#' + sid.substr(1, sid.length);
}

/**
 * 取得浮动窗口的原始ID
 */  
function getOriginId(sid) {
	if (sid === "" || sid.length === 0 || typeof(sid) === "undefined") {
    	alert("画面脚本加载异常,请与管理员联系.");
		return;
	}
	return sid.substr(1, sid.length);
}

/**
 * 取得雷雨天气浮动窗口的ID
 */
function getThunderstormId(sid) {
	if (sid === "" || sid.length === 0 || typeof(sid) === "undefined") {
		alert("画面脚本加载异常,请与管理员联系.");
		return;
	}
	return "T" + sid.substr(1, sid.length);
}

/**
 * 取得当前window对象的事件
 */
function getEvent(e) {
    return e || window.event;
}

/**
 * 预警分类[小时]或[天],设置参数的判定
 */
function HourOrDayPramjudge() {
    var time = new Date().getTime();
    var flushmenutime = $('#flushmenutime').val();
    
    if((time - flushmenutime) > 1800000) {
    	if($('#p_kpi_cd').val() === 'R5_K2') {
    		$('#p_kpi_cd').val('R5_K6');
    	} else {
    		$('#p_kpi_cd').val('R5_K2');
    	}
    	// 保存当前时间
    	$('#flushmenutime').val(time);
    	return true;
    }
    return false;
}

/**
 * 读取并设置[代理商]或[办事处]信息
 * @param p_grp_cd
 * @param p_svc_type
 * @param p_kpi_cd
 * @param agentsid
 * @return
 */
function getAndSetAgentsInfo(p_grp_cd, p_svc_type, p_kpi_cd, agentsid) {
	$.ajax({
 		type: "POST",
		dataType: "JSON",
		url: "/enhancement/weather_getAgentsInfo.action" + 
			 "?p_grp_cd=" + p_grp_cd + 
			 "&p_svc_type=" +  p_svc_type + 
			 "&p_kpi_cd=" + p_kpi_cd + 
			 "&agentsid=" + agentsid 
		,
		success: function(data) {
			setAgentsInfo(data);
			judgeInitSuceess('baseinfo2');
		}
	});
}

/**
 * 设置[代理商]或[办事处]信息
 * @param data
 * @return
 */
function setAgentsInfo(data) {
	
	// 代理商信息
	var agentsinfo = '';
	// 所有代理商信息
	var agentsinfos = '';
	// 处于雷雨天气的代理商信息
	var agentsinfosThunderstorm = '';
	// 处于雷雨天气的代理商的dId
	var items = [], j = 0;
	
	for (var i = 0; i < data.length; i++) {

		// 代理商ID
		var aId = data[i].orgCd;
		
		agentsinfo = '<div id="' + aId + '" class="show_msg_div">' + 
				 	 	'<div>' + 
			   				data[i].d3Val + '% / ' + data[i].d2Val +
				 	 	'</div>' + 
				 	 	'<div class="hr_div"></div>' + 
				 	 	'<div>' + 
				 	 		data[i].orgNm + 
				 	 	'</div>' + 
				 	 '</div>';
		
		agentsinfos += agentsinfo;
		
		if(data[i].d4Val == '1') {
			var tId = '';
			tId = 'T' + aId;
			agentsinfosThunderstorm += '<div id="' + tId + '" class="show_msg_div">' + 
									   		'<div>' + 
									   			data[i].d3Val + '% / ' + data[i].d2Val +
									   		'</div>' + 
									   		'<div class="hr_div"></div>' + 
									   		'<div>' + 
									   			data[i].orgNm + 
								 	 		'</div>' + 
								 	   '</div>';
			items[j] = 'D' + aId;
			j++;
		}
		
		// 天气图片对应ID
		var dId = 'D';
		dId += aId;
		
		$('#' + dId).attr("src", getWeatherImgPath(data[i].d4Val));
	}

	// 创建鼠标事件的js脚本
	if($('#mouseEventFlg').val() === '') {
		createJsFuntionForMouseEvent(data);
	}
	
	// 代理商DIV信息加载
	$('#mystickytooltip').html(agentsinfos);
	// 雷雨天气的代理商DIV信息加载
	$('#mystickytooltip1').html(agentsinfosThunderstorm);
	
	// 重置定时器
	var weatherInterval = document.getElementById("isInterval").value;
	clearTimeout(weatherInterval);
	
	// 显示雷雨天气代理商信息
	stickytooltip.showboxbyid("*[data-tooltip]", "mystickytooltip1", items);
}

/**
 * 取得天气图片的路径
 * @param weatherId
 * 				天气ID
 * @return
 */
function getWeatherImgPath(weatherId) {
	
	var weatherImgPath = '';
	if(weatherId === '4') {
		weatherImgPath = '/images/dashboard/R5/51.png';
	} else if(weatherId === '3') {
		weatherImgPath = '/images/dashboard/R5/52.png';
	} else if(weatherId === '2') {
		weatherImgPath = '/images/dashboard/R5/53.png';
	} else {
		weatherImgPath = '/images/dashboard/R5/54.png';
	}
	
	return weatherImgPath;
}

/**
 * 清除正在显示的雷雨天气div
 */
function clearDisplayStus() {
	
	var divs = $('#mystickytooltip1').find('div.show_msg_div');
	
	for(var i = 0; i < divs.length; i++) {
		divs[i].style.display = 'none';
	}
}

/**
 * 清除正在显示的天气div
 */
function clearDisplayWeatherStus() {
	
	var divs = $('#mystickytooltip').find('div.show_msg_div');
	
	for(var i = 0; i < divs.length; i++) {
		divs[i].style.display = 'none';
	}
}

/**
 * 打开目标地区报表画面
 * @param agentsid
 * 				代理商ID
 * @return
 */
function openTargetAreaReport(agentsid) {
	var url = '/enhancement/weather_initMenu.action'
			+ '?agentsid=' + agentsid; 
	// 定义弹出窗口的参数
	var params = "left=0,screenX=0,top=0,screenY=0,scrollbars=1"; 
	if(window.screen) {
		var ah = '768px';
		var aw = screen.availWidth - 10;
		params += ",height=" + ah;
		params += ",innerHeight=" + ah;
		params += ",width=" + aw;
		params += ",innerWidth=" + aw;
		params += ",resizable";
	} else {
		params += ",resizable"; // 对于不支持screen属性的浏览器,可以手工进行最大化.
	}
	window.open(url, '', params); 
}

/**
 * 打开[满意度相关指标]画面
 * @return
 */
function openSatisfactionKpiMain() {
	var url = '/enhancement/satisfactionKpiMain_getResult.action';
	// 定义弹出窗口的参数
	var params = "left=0,screenX=0,top=0,screenY=0,scrollbars=1"; 
	if(window.screen) {
		var ah = '768px';
		var aw = screen.availWidth - 10;
		params += ",height=" + ah;
		params += ",innerHeight=" + ah;
		params += ",width=" + aw;
		params += ",innerWidth=" + aw;
		params += ",resizable";
	} else {
		params += ",resizable"; // 对于不支持screen属性的浏览器,可以手工进行最大化.
	}
	window.open(url, '', params); 
}

/**
 * 取得并设置[天气基础信息],与定时器取得的信息共用.
 * @param p_grp_cd
 * @param p_svc_type
 * @param p_kpi_cd
 * @param agentsid
 * @param judgeFlg
 * @return
 */
function getAndsetWeatherBaseInfo(p_grp_cd, p_svc_type, p_kpi_cd, agentsid, judgeFlg, top_left, top_right) {
	$.ajax({
		type: "POST", 
		dataType: "JSON", 
		url: "/enhancement/weather_getWeatherBaseInfo.action" + 
			 "?p_grp_cd=" + p_grp_cd + 
			 "&p_svc_type=" +  p_svc_type + 
			 "&p_kpi_cd=" + p_kpi_cd + 
			 "&agentsid=" + agentsid 
		,
		success: function(data) {
			setWeatherBaseInfo(data, judgeFlg, top_left, top_right);
			judgeInitSuceess('baseinfo1');
		},
		failured: function(data) {
			alert("基础数据加载出错,请与管理员联系.");
			return;
		}
	});
}

/**
 * 设置[天气基础信息]
 * @param data
 * 				数据源
 * @param judgeFlg
 * 				是否读取全局数据flg
 * @param top_left
 * 				预警左上图片(白色图字还原用)
 * @param top_right
 * 				预警右上图片(白色图字还原用)
 * @return
 */
function setWeatherBaseInfo(data, judgeFlg, top_left, top_right) {
	
	// 读取全局数据
	if(judgeFlg === 'all') {
		
		/* ------------------------- 读取月份和目标信息 ------------------------- */
		// 读取[月份]图片信息
		var month = data[0].createTime.substring(5, 7);
		for(var i = 1; i <= 12; i++) {
			if(month == i) {
				var img = '<img src="/images/dashboard/R5/13-' + i + '.png" style="margin-left: 3px;" />';
				$("#month").html(img);
				break;
			}
		}
		
		// 读取[月份维修比例]图片信息
		var mRepairPropor = data[0].d1Val;
		var mRepairProporImgs = "";
		for(var i = 0; i < mRepairPropor.length; i++) {
			var mRepairProporSplit = mRepairPropor.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(mRepairProporSplit == (j.toString())) {
					mRepairProporImgs += '<img src="/images/dashboard/R5/31-' + j + '.png" />';
					break;
				}
			}
		}
		mRepairProporImgs += '<img src="/images/dashboard/R5/16.png" />';
		$("#mRepairProportion").html(mRepairProporImgs);
		
		// 读取[目标维修比例]图片信息
		var tRepairPropor = data[0].d2Val;
		var tRepairProporImgs = "";
		for(var i = 0; i < tRepairPropor.length; i++) {
			var tRepairProporSplit = tRepairPropor.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(tRepairProporSplit == (j.toString())) {
					tRepairProporImgs += '<img src="/images/dashboard/R5/32-' + j + '.png" />';
					break;
				}
			}
		}
		tRepairProporImgs += '<img src="/images/dashboard/R5/17.png" />';
		$("#tRepairProportion").html(tRepairProporImgs);
		
		
		/* ------------------------- 读取定时图片信息 ------------------------- */
		// 读取[定时top]图片信息
		var hTop = data[0].d3Nm;
		var imgDayOrHour;
		if(hTop.indexOf('hr') === 1) {
			imgDayOrHour = '<img src="/images/dashboard/R5/43.png" />';
			hTop = hTop.replace('hr↑', '');
		} else {
			imgDayOrHour = '<img src="/images/dashboard/R5/43.png" />';
			hTop = hTop.replace('天↑', '');
		}
		var hTopImgs = "";
		var topMarginLeft = "0px";
		if (hTop.length == 2)
			topMarginLeft = "6px";
		else if (hTop.length == 1)
			topMarginLeft = "17px";
		
		for(var i = 0; i < hTop.length; i++) {
			var hTopSplit = hTop.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(hTopSplit == (j.toString())) {
					hTopImgs += '<img src="/images/dashboard/R5/45-' + j + '.png" style="margin-left:' + topMarginLeft + '" />';
					top_left[i] = '/images/dashboard/R5/41-' + j + '.png';
					if (j == 0) {
						++i;
						hTopImgs += '<img src="/images/dashboard/R5/47.png" />';
						top_left[i] = '/images/dashboard/R5/42.png';
					}
					topMarginLeft = "0px";
					break;
				}
			}
		}
		$("#top_left").html(hTopImgs);
		$("#top_left_b").html(imgDayOrHour);
		$("#center_left_b").html(imgDayOrHour);
		$("#bottom_left_b").html(imgDayOrHour);
		
		// 读取[定时top维修数]图片信息
		var hTopRepairCount = data[0].d3Val;
		var hTopReprContImgs = "";
		for(var i = 0; i < hTopRepairCount.length; i++) {
			var hTopReprContSplit = hTopRepairCount.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(hTopReprContSplit == (j.toString())) {
					hTopReprContImgs += '<img src="/images/dashboard/R5/46-' + j + '.png" />';
					top_right[i] = '/images/dashboard/R5/44-' + j + '.png';
					break;
				}
			}
		}
		$("#top_right").html(hTopReprContImgs);
		
		
		// 读取[定时center]图片信息
		var hCenter = data[0].d4Nm;
		if(hCenter.indexOf('hr') === 1) {
			hCenter = hCenter.replace('hr↑', '');
		} else {
			hCenter = hCenter.replace('天↑', '');
		}
		var hCenterImgs = "";
		var centerMarginLeft = "17px";
		if (hCenter.length == 2)
			centerMarginLeft = "6px";
		else if (hCenter.length == 3)
			centerMarginLeft = "0px";
		for(var i = 0; i < hCenter.length; i++) {
			var hCenterSplit = hCenter.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(hCenterSplit == (j.toString())) {
					hCenterImgs += '<img src="/images/dashboard/R5/41-' + j + '.png" style="margin-left:' + centerMarginLeft + '" />';
					if (j == 0) {
						++i;
						hCenterImgs += '<img src="/images/dashboard/R5/42.png" />';
					}
					centerMarginLeft = "0px";
					break;
				}
			}
		}
		$("#center_left").html(hCenterImgs);
		
		// 读取[定时center维修数]图片信息
		var hCenterRepairCount = data[0].d4Val;
		var hCenterReprContImgs = "";
		for(var i = 0; i < hCenterRepairCount.length; i++) {
			var hCenterReprContSplit = hCenterRepairCount.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(hCenterReprContSplit == (j.toString())) {
					hCenterReprContImgs += '<img src="/images/dashboard/R5/44-' + j + '.png" />';
					break;
				}
			}
		}
		$("#center_right").html(hCenterReprContImgs);
		
		
		// 读取[定时bottom]图片信息
		var hBottom = data[0].d5Nm;
		if(hBottom.indexOf('hr') === 1) {
			hBottom = hBottom.replace('hr↑', '');
		} else {
			hBottom = hBottom.replace('天↑', '');
		}
		var hBottomImgs = "";
		var bottomMarginLeft = "17px";
		if (hBottom.length == 2)
			bottomMarginLeft = "5px";
		else if (hBottom.length == 3)
			bottomMarginLeft = "0px";
		for(var i = 0; i < hBottom.length; i++) {
			var hBottomSplit = hBottom.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(hBottomSplit == (j.toString())) {
					hBottomImgs += '<img src="/images/dashboard/R5/41-' + j + '.png" style="margin-left:' + bottomMarginLeft + '" />';
					if (j == 0) {
						++i;
						hBottomImgs += '<img src="/images/dashboard/R5/42.png" />';
					}
					bottomMarginLeft = "0px";
					break;
				}
			}
		}
		$("#bottom_left").html(hBottomImgs);
		
		// 读取[定时bottom维修数]图片信息
		var hBottomRepairCount = data[0].d5Val;
		var hBottomReprContImgs = "";
		for(var i = 0; i < hBottomRepairCount.length; i++) {
			var hBottomReprContSplit = hBottomRepairCount.substring(i, i + 1);
			for(var j = 0; j <= 9; j++) {
				if(hBottomReprContSplit == (j.toString())) {
					hBottomReprContImgs += '<img src="/images/dashboard/R5/44-' + j + '.png" />';
					break;
				}
			}
		}
		$("#bottom_right").html(hBottomReprContImgs);
	}
	
	// 最后更新时间
	$("#lastupdtime").html(data[0].createTime);
	
	// 读取[全国天气平均状况]图片信息
	var avgweather = data[0].d8Val;
	var avgweatherImgs = "";
	for(var i = 1; i < 5; i++) {
		if(avgweather == (i.toString())) {
			avgweatherImgs += '<img src="/images/dashboard/R5/9' + i + '.png" />';
			break;
		}
	}
	$("#avgweather").html(avgweatherImgs);

	// 总维修件数
	var repairTotal = data[0].d6Val;
	repairTotal = repairTotal + data[0].d6Unit;
	$("#repairTotal").html(repairTotal);
}

/**
 * 读取并设置[危机度]信息
 * @param p_grp_cd
 * @param p_svc_type
 * @param p_kpi_cd
 * @param agentsid
 * @return
 */
function getAndsetCrisisInfo(p_grp_cd, p_svc_type, p_kpi_cd, agentsid) {

	$.ajax({
 		type: "POST",
		dataType: "JSON",
		url: "/enhancement/weather_getCrisisInfo.action"+ 
			 "?p_grp_cd=" + p_grp_cd + 
			 "&p_svc_type=" +  p_svc_type + 
			 "&p_kpi_cd=" + p_kpi_cd + 
			 "&agentsid=" + agentsid 
		,
		success: function(data) {
		
			var weather_imgs = "";
			for(var i = 0; i < data.length; i++) {
				var val_1 = data[i].d2Val;
				for(var j = 0; j < val_1.length; j++) {
					var val_1_Split = val_1.substring(j, j + 1);
					for(var k = 0; k < 10; k++) {
						if(val_1_Split === k.toString()) {
							weather_imgs += '<img src="/images/dashboard/R5/81-' + k + '.png" />';
							break;
						}
					}
				}
				weather_imgs += '<img src="/images/dashboard/R5/17.png" /> ~ ';
				
				var val_2 = data[i].d3Val;
				for(var l = 0; l < val_2.length; l++) {
					var val_2_Split = val_2.substring(l, l + 1);
					for(var m = 0; m < 10; m++) {
						if(val_2_Split === m.toString()) {
							weather_imgs += '<img src="/images/dashboard/R5/81-' + m + '.png" />';
							break;
						}
					}
				}
				weather_imgs += '<img src="/images/dashboard/R5/17.png" />';
				var weather_id = '#weather_' + (i + 1);
				$(weather_id).html(weather_imgs);
				weather_imgs = "";
			}
			judgeInitSuceess('baseinfo3');
		}
	});
	
}

/**
 * 创建鼠标事件
 * @param data
 * @return
 */
function createJsFuntionForMouseEvent(data) {
	
	var lr = '\r';
	var script = '$(function() {' + lr;
	script += 'var e = window.event;' + lr;
	
	var scriptMouseOver = '';
	var scriptMouseOut = '';
	var scriptMouseClick = '';
	var scriptOnTouchStart = '';
	
	for(var i = 0; i < data.length; i++) {

		// 取得代理商信息用ID
		var dId = 'D' + data[i].orgCd;
		
		scriptMouseOver += '$(document).on(\"mouseover\", \"#' + dId + '\", function(e) {' + lr;
		scriptMouseOver += '	if(checkHover(e,this)){' + lr;
		scriptMouseOver += '		if (this.id === \"' + dId + '\") {' + lr;
		scriptMouseOver += '			$(subStrId(this.id)).css(\"display\","block\");' + lr;
		scriptMouseOver += '		}' + lr;
		scriptMouseOver += '	}' + lr;
		scriptMouseOver += '});' + lr;
		
		scriptMouseOut += '$(document).on(\"mouseout", \"\#' + dId + '\", function(e) {' + lr;
		scriptMouseOut += '		if(checkHover(e,this)) {' + lr;
		scriptMouseOut += 			'if (this.id === \"' + dId + '\") {' + lr;
		scriptMouseOut += '				$(subStrId(this.id)).css(\"display\","none\");' + lr;
		scriptMouseOut += '			}' + lr;
		scriptMouseOut += '		}' + lr;
		scriptMouseOut += '});' + lr;
		
		scriptMouseClick += '$(document).on(\"click", \"\#' + dId + '\", function(e) {' + lr;
		scriptMouseClick += '	if(checkHover(e,this)) {' + lr;
		scriptMouseClick += 		'openTargetAreaReport(' + data[i].orgCd + ');' + lr;
		scriptMouseClick += '	}' + lr;
		scriptMouseClick += '});' + lr;
		
		scriptOnTouchStart += '$(document).on(\"touchstart1", \"\#' + dId + '\", function(e) {' + lr;
		scriptOnTouchStart += '	if(checkHover(e,this)) {' + lr;
		scriptOnTouchStart += 		'openTargetAreaReport(' + data[i].orgCd + ');' + lr;
		scriptOnTouchStart += '	}' + lr;
		scriptOnTouchStart += '});' + lr;
		
		// 创建[代理商信息]属性
		$('#' + dId).addClass('onhand');
		$('#' + dId).attr({'data-tooltip': data[i].orgCd});
	}
	
	script += scriptMouseOver;
	script += scriptMouseOut;
	script += scriptMouseClick;
	script += scriptOnTouchStart;
	script += '});' + lr;

	eval(script);
	
	stickytooltip.init("*[data-tooltip]", "mystickytooltip");
	
	$('#mouseEventFlg').val('1');
}

/**
 * 设置预警图片(上)
 * @param top_left
 * 				预警左上图片(白色图字还原用)
 * @param top_right
 * 				预警右上图片(白色图字还原用)
 * @param bottom_left
 * 				预警左下图片(白色图字还原用)
 * @param bottom_right
 * 				预警右下图片(白色图字还原用)
 * @return
 */
function setWarningImgsTop(top_left, top_right, bottom_left, bottom_right) {

	// ---------------------- 图片文字信息设置 ----------------------
	var imgs_left = $("#top_left").find("img");
	for(var i = 0; i < imgs_left.length; i++) {
		var subImg = $(imgs_left[i]).attr("src");
		var imgName = subImg.split("/"), imgPath = "";
		for(var j = 0; j < 10; j++) {
			if (imgName[4].substring(3,4) === (j.toString())) {
				imgPath = "/images/dashboard/R5/45-" + j + ".png";
				top_left[i] = $(imgs_left[i]).attr("src");
				$(imgs_left[i]).attr("src", imgPath);
				if (j == 0) {
					var k = ++i;
					top_left[k] = $(imgs_left[k]).attr("src");
					$(imgs_left[k]).attr("src", "/images/dashboard/R5/47.png");
				}
			}
		}
	}// end for 
	
	var imgs_right = $("#top_right").find("img");
	for(var i = 0; i < imgs_right.length; i++) {
		var subImg = $(imgs_right[i]).attr("src");
		var imgName = subImg.split("/"), imgPath;
		for(var j = 0; j < 10; j++) {
			if (imgName[4].substring(3,4) === (j.toString())) {
				imgPath = "/images/dashboard/R5/46-" + j + ".png";
				top_right[i] = $(imgs_right[i]).attr("src");
				$(imgs_right[i]).attr("src", imgPath);
			}
		}
	}// end for
	
	
	// bottom文字还原
	var b_left_target = $("#bottom_left").find("img");
	for(var i = 0; i < bottom_left.length; i++) {
		$(b_left_target[i]).attr("src", bottom_left[i]);
	}// end for
	var b_right_target = $("#bottom_right").find("img");
	for(var i = 0; i < bottom_right.length; i++) {
		$(b_right_target[i]).attr("src", bottom_right[i]);
	}// end for
	// ---------------------- 图片文字信息设置 ----------------------
}

/**
 * 设置预警图片(下)
 * @param top_left
 * 				预警左上图片(白色图字还原用)
 * @param top_right
 * 				预警右上图片(白色图字还原用)
 * @param bottom_left
 * 				预警左下图片(白色图字还原用)
 * @param bottom_right
 * 				预警右下图片(白色图字还原用)
 * @return
 */
function setWarningImgsBottom(top_left, top_right, bottom_left, bottom_right) {
	// ---------------------- 图片文字信息设置 ----------------------
	var imgs_left = $("#bottom_left").find("img");
	for(var i = 0; i < imgs_left.length; i++) {
		var subImg = $(imgs_left[i]).attr("src");
		var imgName = subImg.split("/"), imgPath = "";
		for(var j = 0; j < 10; j++) {
			if (imgName[4].substring(3,4) === (j.toString())) {
				bottom_left[i] = subImg;
				imgPath = "/images/dashboard/R5/45-" + j + ".png";
				$(imgs_left[i]).attr("src", imgPath);
				if (j == 0) {
					var k = ++i;
					bottom_left[k] = $(imgs_left[k]).attr("src");
					$(imgs_left[k]).attr("src", "/images/dashboard/R5/47.png");
				}
			}
		}
	}// end for
	var imgs_right = $("#bottom_right").find("img");
	for(var i = 0; i < imgs_right.length; i++) {
		var subImg = $(imgs_right[i]).attr("src");
		var imgName = subImg.split("/"), imgPath;
		for(var j = 0; j < 10; j++) {
			if (imgName[4].substring(3,4) === (j.toString())) {
				imgPath = "/images/dashboard/R5/46-" + j + ".png";
				bottom_right[i] = subImg;
				$(imgs_right[i]).attr("src", imgPath);
			}
		}
	}// end for
	
	
	// top文字还原
	var t_left_target = $("#top_left").find("img");
	for(var i = 0; i < top_left.length; i++) {
		$(t_left_target[i]).attr("src", top_left[i]);
	}// end for
	var t_right_target = $("#top_right").find("img");
	for(var i = 0; i < top_right.length; i++) {
		$(t_right_target[i]).attr("src", top_right[i]);
	}// end for
	// ---------------------- 图片文字信息设置 ----------------------
}

/**
 * 画面初始化
 * @return
 */
function initMenu() {
	// 打开等待画面
	doOpen();
	
	var interval, index = 3;
	var top_left = [], top_right = [], bottom_left = [], bottom_right = [];
	// 保存加载画面时的时间
	$('#flushmenutime').val(new Date().getTime());
	
	// 取得并设置[天气基础信息]
	getAndsetWeatherBaseInfo("R5_G1", "1", $('#p_kpi_cd').val(), $('#agentsid').val(), "all", top_left, top_right);
	
	// 读取并设置[代理商]或[办事处]信息
	getAndSetAgentsInfo("R5_G2", "1", $('#p_kpi_cd').val(), $('#agentsid').val());
	
	// 读取并设置[危机度]信息
	getAndsetCrisisInfo("R5_G3", "1", $('#p_kpi_cd').val(), $('#agentsid').val());
	// 加载页面时启动定时器  
	run();
	
	function run() {
		interval = setInterval(function(){loopTiming();}, "100000");
	}
	
	function loopTiming() {
		
		// 预警分类[小时]或[天],设置参数的判定
		var flg = HourOrDayPramjudge();
		
		if (index == 1) {

			if(flg === true) {
				// 取得并设置[天气基础信息]
				getAndsetWeatherBaseInfo("R5_G1", "1", $('#p_kpi_cd').val(), "", "all", top_left, top_right);
				// 设置画面title图片
				setTitleImgs();
			}
			
			// 读取并设置[代理商]或[办事处]信息
			getAndSetAgentsInfo("R5_G2", "1", $('#p_kpi_cd').val(), $('#agentsid').val());
			
			// 读取并设置[危机度]信息
			getAndsetCrisisInfo("R5_G3", "1", $('#p_kpi_cd').val(), $('#agentsid').val());

			// 设置预警图片(上)
			setWarningImgsTop(top_left, top_right, bottom_left, bottom_right);
			
			index = 3;
		} else {
			
			if(flg === true) {
				// 取得并设置[天气基础信息]
				getAndsetWeatherBaseInfo("R5_G1", "3", $('#p_kpi_cd').val(), "", "all", top_left, top_right);
				// 设置画面title图片
				setTitleImgs();
			} 

			// 读取并设置[代理商]或[办事处]信息
			getAndSetAgentsInfo("R5_G2", "3", $('#p_kpi_cd').val(), $('#agentsid').val());
			
			// 读取并设置[危机度]信息
			getAndsetCrisisInfo("R5_G3", "3", $('#p_kpi_cd').val(), $('#agentsid').val());

			// 设置预警图片(下)
			setWarningImgsBottom(top_left, top_right, bottom_left, bottom_right);
			
			index = 1;
		}// end if
	}
}

/**
 * 设置[title图片]
 * @return
 */
function setTitleImgs() {
	var reserve = '/images/dashboard/R5/title - r5_p1.png';
	var respect = '/images/dashboard/R5/title - r5_p5.png';
	var titleImg = $('#pageTitle').attr("src");
	if(titleImg === reserve) {
		var titleImg = $('#pageTitle').attr("src", respect);
	} else {
		var titleImg = $('#pageTitle').attr("src", reserve);
	}
}

/**
 * 打开初始化画面
 * @return
 */
function doOpen() {
	$("#fill_div").css({'z-index' : '10301'});
	$("#fill_div").fadeIn(800);
}

/**
 * 关闭初始化画面
 * @return
 */
function doClose() {
	$("#fill_div").fadeOut(800);
	$("#maxdiv").css({"display" : "block"});
}

/**
 * 初始化完成判定
 * @param judgeCondition
 * 				判定条件
 * @return true, false
 */
function judgeInitSuceess(judgeCondition) {
	if(judgeCondition === 'baseinfo1') {
		$('#baseinfo1').val('1');
	} else if(judgeCondition === 'baseinfo2') {
		$('#baseinfo2').val('1');
	} else if(judgeCondition === 'baseinfo3') {
		$('#baseinfo3').val('1');
	}
	var judge1 = $('#baseinfo1').val();
	var judge2 = $('#baseinfo2').val();
	var judge3 = $('#baseinfo3').val();
	if (judge1 === '1' && judge2 === '1' && judge2 === '1') {
		doClose();
		resetMapPosition();
		return true;
	}
	return false;
}

/**
 * 重置地图位置
 * @return
 */
function resetMapPosition() {
	var sUserAgent = navigator.userAgent.toLowerCase();
	var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
	var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
	var sUserAgent = navigator.userAgent.toLowerCase();
	if ((bIsIpad || bIsIphoneOs)) {
		//$("#map").css({ position: "absolute", top: $("#includetable").height() * 0.22 });
	$("#includetable").css({ position: "absolute", top: $("#includetable").height() * 0.1 });
	} else {
		//$("#map").css({ position: "absolute", top: $("#includetable").height() * 0.11 });
	$("#includetable").css({ position: "absolute", top: 0 });
	}
}

/**
 * toolbar打开
 * @return
 */
function f_hdOption_OnOff() {					
	// 页面箭头缩进判断
	if ($('#hdOption').val() == "ON") {
		$('#imgOnOff').removeClass("toolbar");
		$('#imgOn').removeClass("toolbar");
		// 箭头出来时候隐藏域值变
		$('#hdOption').val("OFF");
		// 记录slide_on按钮是亮时候
		if($('#imgOtion').val()=="UP") {
	    	$('#imgOn').attr("src", "../../images/report/r4_slide_on_02.png");
		} else {
			$('#imgOn').attr("src","../../images/report/r4_slide_off_02.png")					
		}
	} else {
		$('#hdOption').val("ON");
		$('#imgOnOff').addClass("toolbar");
		$('#imgOn').addClass("toolbar");
		$('#imgOn').attr("src", "../../images/report/search_line.png");
	}
}

/**
 * toolbar关闭
 * @return
 */
function slideOff() {
	// 按钮按下时候变成暗或者亮时候
	if ($('#hdOption').val() == "OFF") {  // 变暗
		if($('#imgOne').val()=="ONE"){
		     $('#imgOtion').val("DOWN");
		     $('#imgOnOff').attr("src", "../../images/report/r4_slide_off_01.png");
		     $('#imgOn').attr("src", "../../images/report/r4_slide_off_02.png");
		     $('#imgOne').val("TWO");				   	   
		} else {
			// 变亮
			$('#imgOtion').val("UP");
			$('#imgOnOff').attr("src", "../../images/report/r4_slide_on_01.png");
			$('#imgOn').attr("src", "../../images/report/r4_slide_on_02.png");			
			$('#imgOne').val("ONE");
			$('#onO').val("O");
		}
	}	
}