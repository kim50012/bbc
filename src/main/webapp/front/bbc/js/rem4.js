//普通写法
window.onload = function() {
  getRem(550, 100)
};
window.onresize = function() {
  getRem(550, 100)
};

function getRem(pwidth, prem) {
  var html = document.getElementsByTagName("html")[0];
  var oWidth = document.body.clientWidth || document.documentElement.clientWidth;
  html.style.fontSize = oWidth / pwidth * prem + "px";
}
// 小米的写法
//! function(n) {
//var e = n.document,
//  t = e.documentElement,
//  i = 720,
//  d = i / 100,
//  o = "orientationchange" in n ? "orientationchange" : "resize",
//  a = function() {
//    var n = t.clientWidth || 320;
//    n > 720 && (n = 720);
//    t.style.fontSize = n / d + "px"
//  };
//e.addEventListener && (n.addEventListener(o, a, !1), e.addEventListener("DOMContentLoaded", a, !1))
//}(window);

(function(doc, win) {
  var docEl = doc.documentElement,
    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
    recalc = function() {
      var clientWidth = docEl.clientWidth;
      if(!clientWidth) return;
      if(clientWidth >= 640) {
        docEl.style.fontSize = '100px';
      } else {
        docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
      }
    };

  if(!doc.addEventListener) return;
  win.addEventListener(resizeEvt, recalc, false);
  doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);