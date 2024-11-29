window.onload = function() {
		//1.首次加载的时候 调用动态设置rem的api
		setRemSize();
		//2.当用户企图更改浏览器宽度 自动获取屏幕宽度 在计算rem赋值给根元素里面的font-size
		window.addEventListener("resize", setRemSize, false);

		function setRemSize() {
			//1.在任何尺寸中都可以获得rem值
			//线用1px 不用rem
			//获得屏幕的宽度----获取到了rem值    rem=屏幕宽度/7.5+"px"
			var clientWightMax = document.documentElement.clientWidth;
			if (clientWightMax >= 540) {
				clientWightMax = 540;
			}
			var _clientWidth = clientWightMax / 6.4 + "px";
			//console.log(_clientWidth);
			//将得到的rem值赋值给根元素的font-size
			document.documentElement.style.fontSize = _clientWidth;
		}
}