$(function(){
      var pie1 = new rotateCircle({
        name: 'svg1',
        pointer: 'pointer1',
        angle: 10,
      })
      var table1 = new dragTable('table1');
      $("#scrolltop").click(function(){
      	$(".scroll-wrap").animate({scrollTop: '0px'}, 800)
      })
    })