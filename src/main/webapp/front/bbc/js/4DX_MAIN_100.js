$(function() {
  var countD1 = new CountUp('countD1', 365, 189, 0, 2);
  var countD2 = new CountUp('countD2', 800, 140, 0, 2);
  var countU2 = new CountUp('countU2', 0, 660, 0, 2);
  countD1.start();
  countD2.start();
  countU2.start();
})

function selectOne(el) {
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

function selectTwo(el) {
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