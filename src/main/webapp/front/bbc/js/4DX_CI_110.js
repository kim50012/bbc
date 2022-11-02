function selectGo(el){
	var $_that = $(el).find('span')
  radioPop({
    val: '2', // 默认第一项，可以不用传参数
    callback: function(name, value) {
      $_that.html(name)
      if(value == 1) {
        $("#confirmBtn").attr('class', 'confirmBtn')
      } else if(value == 2 || value == 3) {
        $("#confirmBtn").attr('class', 'confirmBtn orangeBtn')
      }
    },
    option: [{
        name: '진행중',
        value: '1'
      },
      {
        name: '완료건',
        value: '2'
      },
    ]
  })
}
$(function() {
  scroll()
  $(".tab").click(function() {
    $(".tab.active").removeClass('active')
    $(this).addClass('active')
    var top = $(this)[0].offsetTop;
    var swh = $(this).parents('.tabs')[0].offsetHeight;
    var st = $(".tabs")[0].scrollTop;
    $(".tabs").animate({scrollTop: top - swh / 2 + "px"},300)
  })
})
