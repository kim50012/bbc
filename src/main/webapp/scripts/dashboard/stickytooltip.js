/* Sticky Tooltip script (v1.0)
* Created: Nov 25th, 2009. This notice must stay intact for usage 
* Author: Dynamic Drive at http://www.dynamicdrive.com/
* Visit http://www.dynamicdrive.com/ for full source code
*/


var stickytooltip={
	tooltipoffsets: [20, -25], //additional x and y offset from mouse cursor for tooltips
	fadeinspeed: 1000, //duration of fade effect in milliseconds
	rightclickstick: true, //sticky tooltip when user right clicks over the triggering element (apart from pressing "s" key) ?
	stickybordercolors: ["#ffa500", "darkred"], //border color of tooltip depending on sticky state
	stickynotice1: ["Press \"s\"", "or right click", "to sticky box"], //customize tooltip status message
	stickynotice2: "Click outside this box to hide it", //customize tooltip status message

	//***** NO NEED TO EDIT BEYOND HERE

	isdocked: false,

	positiontooltip:function($, $tooltip, e){
		var x=e.pageX+this.tooltipoffsets[0], y=e.pageY+this.tooltipoffsets[1]
			//alert("e.pageY:" + e.pageY + "===" + e.pageX)
		var tipw=$tooltip.outerWidth(), tiph=$tooltip.outerHeight(), 
		x=(x+tipw>$(document).scrollLeft()+$(window).width())? x-tipw-(stickytooltip.tooltipoffsets[0]*2) : x
		y=(y+tiph>$(document).scrollTop()+$(window).height())? $(document).scrollTop()+$(window).height()-tiph-10 : y
		//alert("e.pageY:" + x + "===" + y)
		$tooltip.css({left:x, top:y})
	},
	
	showbox:function($, $tooltip, e){
		$tooltip.fadeIn(this.fadeinspeed)
		this.positiontooltip($, $tooltip, e)
	},

	hidebox:function($, $tooltip){
		if (!this.isdocked){
			$tooltip.stop(false, true).hide()
			$tooltip.css({borderColor:'#000079'}).find('.stickystatus:eq(0)').css({background:this.stickybordercolors[0]}).html(this.stickynotice1)
		}
	},

	docktooltip:function($, $tooltip, e){
		this.isdocked=true
		$tooltip.css({borderColor:'darkred'}).find('.stickystatus:eq(0)').css({background:this.stickybordercolors[1]}).html(this.stickynotice2)
	},


	init:function(targetselector, tipid){
		jQuery(document).ready(function($){
			var $targets=$(targetselector)
			var $tooltip=$('#'+tipid).appendTo(document.body)
			if ($targets.length==0)
				return
			var $alltips=$tooltip.find('div.atip')
			if (!stickytooltip.rightclickstick)
				stickytooltip.stickynotice1[1]=''
			stickytooltip.stickynotice1=stickytooltip.stickynotice1.join(' ')
			stickytooltip.hidebox($, $tooltip)
			$targets.bind('mouseenter', function(e){
				$alltips.hide().filter('#'+$(this).attr('data-tooltip')).show()
				stickytooltip.showbox($, $tooltip, e)
			})
			$targets.bind('mouseleave', function(e){
				stickytooltip.hidebox($, $tooltip)
			})
			$targets.bind('mousemove', function(e){
				if (!stickytooltip.isdocked){
					stickytooltip.positiontooltip($, $tooltip, e)
				}
			})
			$tooltip.bind("mouseenter", function(){
				stickytooltip.hidebox($, $tooltip)
			})
			$(this).bind("click", function(e){
				stickytooltip.hidebox($, $tooltip)
				clearDisplayWeatherStus()
			})
			$(this).bind("contextmenu", function(e){
				if (stickytooltip.rightclickstick && $(e.target).parents().andSelf().filter(targetselector).length==1){ //if oncontextmenu over a target element
					//stickytooltip.docktooltip($, $tooltip, e)
					return false
				}
			})
		}) //end dom ready
	},
	
showboxbyid: function(targetselector, tipid, eids) {
		
		var $targets=$(targetselector)
		var $tooltip=$('#'+tipid).appendTo(document.body)
		var $alltips=$tooltip.find('div.atip')
		var index = 0, previousEid = "", items = eids

		// 初始化前,隐藏正在执行的box
		stickytooltip.hidebox($, $tooltip)
		
		// 清除正在显示的雷雨信息
		clearDisplayStus()
		
		// 先执行一次显示图片的函数
		chat()
		
		// 启动定时器  
		runTimer()
		
		function runTimer() {
			document.getElementById("isInterval").value = setInterval(function(){chat();}, "5000")
		}
		
		function chat() {

			// 如果画面数据加载不成功,则返回.
			if(judgeInitSuceess("") === false) 
				return
				
			if (items.length === 0) {
				// 关闭定时器
				clearTimeout(document.getElementById("isInterval").value)
				return
			}
			
			var eid = items[index];
			
			// 取得代理商天气图标的ID
			var item = document.getElementById(eid)
			var oRect = item.getBoundingClientRect()
			
			// 取得控件的坐标
			var itemX = oRect.left
			var itemY = oRect.top
			
			// 取得代理商信息的ID
			var ThunderstormId = document.getElementById(getThunderstormId(eid))
			
			stickytooltip.hidebox($, $tooltip)
			$alltips.hide().filter('#'+$(this).attr('data-tooltip')).show()
			$tooltip.fadeIn(this.fadeinspeed)
			
			if (previousEid != "")
				previousEid.style.display = "none"
			
			var addedWidth = $(window).width() / 36
			var addedHeight = $(window).height() / 255
			
			$tooltip.css({left:itemX+addedWidth, top:itemY-addedHeight})
			ThunderstormId.style.display = "block"
			
			index++
			
			if (index >= items.length)
				index = 0
			
			// 显示下一个单位前,保存当前的代理商ID,下次显示时,隐藏用.
			previousEid = ThunderstormId
		}
			
	}
}

//stickytooltip.init("*[data-tooltip]", "mystickytooltip")