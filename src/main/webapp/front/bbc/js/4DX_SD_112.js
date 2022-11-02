$(function(){
  $(".tabList").click(function(){
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var $target = $(this.hash);
      $('.scroll-wrap').animate({scrollTop: $target[0].offsetTop - $(".tabPointer")[0].offsetHeight - $(".app-header")[0].offsetHeight + 'px'},800);
      return false;
    }
  });
})