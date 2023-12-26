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
	}
	var html = document.getElementsByTagName("html")[0];
	var oWidth = document.body.clientWidth || document.documentElement.clientWidth;
	html.style.fontSize = oWidth / pwidth * prem + "px";
}