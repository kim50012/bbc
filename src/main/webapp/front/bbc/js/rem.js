//普通写法
window.onload = function() {
   getRem(750, 100)
};
window.onresize = function() {
   getRem(750, 100)
};

function getRem(pwidth, prem) {

	var isPC = navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/Windows Phone/i) ? false : true;

	if (isPC) {
		pwidth = document.body.clientWidth;
		prem = 60;
		console.log(pwidth);
		
		var html = document.getElementsByTagName("html")[0];
		var oWidth = document.body.clientWidth || document.documentElement.clientWidth;
		html.style.fontSize = oWidth / pwidth * prem + "px";
	}
	else {
		//1.首次加载的时候 调用动态设置rem的api
		setRemSize();
		//2.当用户企图更改浏览器宽度 自动获取屏幕宽度 在计算rem赋值给根元素里面的font-size
		window.addEventListener("resize", setRemSize, false);
	
	}
}


function setRemSize() {
	//1.在任何尺寸中都可以获得rem值
	//线用1px 不用rem
	//获得屏幕的宽度----获取到了rem值    rem=屏幕宽度/7.5+"px"
	var windowWidth;
	var currentWidth = document.documentElement.clientWidth;

	if (currentWidth > 1024) {
	  windowWidth = 1024;
	} else {
	  windowWidth = currentWidth;
	}
	
	if (currentWidth >= 640) {
		var _clientWidth = windowWidth / 6.4 + "px";
		document.documentElement.style.fontSize = _clientWidth;
	}
	else {
		var _clientWidth = windowWidth / 7.4 + "px";
		document.documentElement.style.fontSize = _clientWidth;
	}
}