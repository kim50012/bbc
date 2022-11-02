$(function() {
  // 这里首先获取chart的宽度以便设置高度、chart的尺寸
  var cw = $("#chart")[0].clientWidth;
  var fsize = cw / 592 * 20;
  $("#chart").css('height', cw / 592 * 430 + 'px')
  var myChart = echarts.init(document.getElementById('chart'));
  var bol = true;
  // 下面是获取数据;网络请求数据
  $.getJSON("../js/4DX_SO112_Data.js", function(res) {
    var titleData = []
    var barData = []
    for(var i = 0; i < res.data.length; i++) {
      var obj = {
        value: res.data[i].total,
        name: res.data[i].region
      }
      titleData.push(res.data[i].region)
      barData.push(obj)
      console.log(titleData)
      console.log(barData)
      var tr = document.createElement("tr")
      tr.className = "moreDataTr";
      var first
      console.log(tr)
      $("#table1").append()
    }
    
    option = {
      legend: {
        selectedMode: true,
        data: titleData,
        left: 'center'
      },
      color:['red', 'green','yellow','blueviolet'],// 这里是设置颜色的，需要把所有的颜色全部罗列
      series: [{
        name: '',
        type: 'pie',
        label: {
          legendHoverLink: false,
          normal: {
            formatter: '{b|{b}} \n  {per|{d}%}',
            rich: {
              b: {
                lineHeight: 18,
                align: 'center',
                color: '#333333',
              },
              per: {
                align: 'center',
                fontWeight: "bolder",
              }
            },
          },
        },
        legendHoverLink: true,
        clickable: false,
        center: ['50%', '55%'],
        radius: ['40%', '69%'],
        selectedMode: 'single',
        selectedOffset: 0,
        clockwise: true,
        avoidLabelOverlap: false,
        labelLine: {
          length: 10,
          length2: 10,
        },
        data: barData
      }]
    };
    myChart.setOption(option);

  })

    function eConsole(param) {
      bol = false
      if(typeof param.seriesIndex != 'undefined') {
        if(param.type == 'click') {
          var peiLenght = option.legend.data.length;
          for(var i = 0; i < peiLenght; i++) {
            if(param.seriesIndex == 0 && param.dataIndex == i) {
              var html = '<p>총' + param.data.value + '건</p>'
              $(".chartTitle .chartTitleInfo").html(html)
              $(".chartTitle .goDetails").attr('src', 'abcd') // 这里给src赋值路径
              if($(".chartTitle .chartTitleInfo").html()) {
                $(".chartTitle").show()
              } else {
                $(".chartTitle").hide()
              }
            }
          }
        }
      }
    }
    myChart.on("click", eConsole);
    $("#chart").on("click", function() {
      if(bol) {
        $(".chartTitle .chartTitleInfo").html('')
        $(".chartTitle").hide()
        return
      }
      bol = true
    })
})


