
$(function() {
  $(".select-btn").click(function() {
    $(this).toggleClass('active');
  })
  $(".menu").click(function() {
	    $(".menu.active").removeClass('active');
	    $(this).addClass('active');
  })
  var chart1 = new run('chart1' ,{
	    table: 'tablewrap1',
	    scTop: 'chartBackTop1',
	    lBtn: 'lbtn1',
	    rBtn: 'rbtn1',
  } ,{
	    title: '당월',
	    titleNotes: '6월',
	    Ra:2,
	    Rb:4,
	    Rc: 50,
	    Ba: 1,
	    BaTitle: "6건(누적)",
	    Bb: 20,
	    BbTitle: "20건",
	    Bc: 50,
  })
  $("#lbtn1").click(function() {
    chart1.PreMonth({
//    title: '당월',
//    titleNotes: '6월',
		  Ra:2,
		  Rb:4,
		  Rc: 50,
		  Ba: 1,
		  BaTitle: "6건(누적)",
		  Bb: 20,
		  BbTitle: "20건",
		  Bc: 50,
    })
  })
  $("#rbtn1").click(function() {
    chart1.NextMonth({
//    title: '당월',
//    titleNotes: '6월',
      Ra:2,
      Rb:4,
      Rc: 50,
      Ba: 1,
      BaTitle: "6건(누적)",
      Bb: 20,
      BbTitle: "20건",
      Bc: 50,
    })
  })
  var chart2 = new run('chart2',{
    table: 'tablewrap2',
    scTop: 'chartBackTop2',
    lBtn: 'lbtn2',
    rBtn: 'rbtn2',
  } ,{
    Ra:3,
    Rb:10,
    Rc: 60,
    Ba: 1,
    BaTitle: "64건(누적)",
    Bb: 20,
    BbTitle: "250건",
    Bc: 50,
  })
  $("#lbtn2").click(function() {
    chart2.PreMonth({
      Ra:3,
      Rb:10,
      Rc: 60,
      Ba: 1,
      BaTitle: "64건(누적)",
      Bb: 20,
      BbTitle: "250건",
      Bc: 50,
    })
  })
  $("#rbtn2").click(function() {
    chart2.NextMonth({
      Ra:3,
      Rb:10,
      Rc: 60,
      Ba: 1,
      BaTitle: "64건(누적)",
      Bb: 20,
      BbTitle: "250건",
      Bc: 50,
    })
  })
  var chart3 = new run('chart3',{
    table: 'tablewrap3',
    scTop: 'chartBackTop3',
    lBtn: 'lbtn3',
    rBtn: 'rbtn3',
  },{
    Ra:12,
    Rb:20,
    Rc: 60,
    Ba: 1,
    BaTitle: "64건(누적)",
    Bb: 20,
    BbTitle: "250건",
    Bc: 50,
  })
  $("#lbtn3").click(function() {
    chart3.PreMonth({
      Ra:12,
      Rb:20,
      Rc: 60,
      Ba: 1,
      BaTitle: "64건(누적)",
      Bb: 20,
      BbTitle: "250건",
      Bc: 50,
    })
  })
  $("#rbtn3").click(function() {
    chart3.NextMonth({
      Ra:12,
      Rb:20,
      Rc: 60,
      Ba: 1,
      BaTitle: "64건(누적)",
      Bb: 20,
      BbTitle: "250건",
      Bc: 50,
    })
  })
  $("#scrolltop").click(function() {
    $(".scroll-wrap").animate({scrollTop: '0px'}, 800)
   });
	$("#packUp1").click(function(){
	    $(".tablewrap1").slideToggle("slow");
	 });
	$("#packUp2").click(function(){
	    $(".tablewrap2").slideToggle("slow");
	 });
	$("#packUp3").click(function(){
	    $(".tablewrap3").slideToggle("slow");
	 });
	 
  $("#select1").click(function() {
    // 下拉选择默认选中第一项
    // 如果需要默认其它选项，则val为必传，且变量a1需要先赋值
    var a1;
    radioPop({
      val: a1,// 默认第一项，可以不用传参数
      callback: function(e) {
        a1 = e
        alert(a1)
      },
      option: [
        {
          name: '본사',
          value: 'a'
        },
        {
          name: '중국',
          value: '2'
        },
        {
          name: '미국',
          value: '3'
        },
      ],
      },
    )
  })
  $("#select2").click(function() {
    var a2;
    radioPop({
      val: a2,
      callback: function(e) {
        a2 = e
        alert(a2)
      },
      option: [
        {
          name: '4DX',
          value: '1'
        },
        {
          name: 'Screen X',
          value: '2'
        },
      ],
    })
  })
})

