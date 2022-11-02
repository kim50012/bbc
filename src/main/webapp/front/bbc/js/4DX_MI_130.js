$(function() {
  // 这里首先获取chart的宽度以便设置高度、chart的尺寸
  var cw = $("#chart")[0].clientWidth;
  var fsize = cw / 592 * 20;
  var data = [{
      value: 100,
      name: '추가 RO',
    },
    {
      value: 50,
      name: '신규',
    },
    {
      value: 200,
      name: '기계약 RO',
    },
  ]
  $("#chart").css('height', cw / 592 * 430 + 'px')
  var myChart = echarts.init(document.getElementById('chart'));
  option = {
    legend: {
      selectedMode: true,
      itemWidth: 12,
      itemHeight: 10,
      itemGap: 10,
      data: ['기계약 RO', '추가 RO', '신규'],
      left: 'center'
    },

    series: [{
      name: '',
      type: 'pie',
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
      data: [{
          value: data[0].value,
          name: data[0].name,
          legendHoverLink: false,
          clickable: false,
          itemStyle: {
            normal: {
              color: '#ea8b00'
            }
          },
          label: {
            legendHoverLink: false,
            normal: {
              formatter: '{b|{b}} \n  {per|{d}%}',
              rich: {
                b: {
                  fontSize: fsize,
                  lineHeight: 18,
                  align: 'center',
                  color: '#333333'
                },
                per: {
                  align: 'center',
                  fontWeight: "bolder"
                }
              },
            },
          },
        },
        {
          value: data[1].value,
          name: data[1].name,
          itemStyle: {
            normal: {
              color: '#e33143'
            }
          },
          label: {
            legendHoverLink: false,
            normal: {
              formatter: '{b|{b}} \n  {per|{d}%}',
              rich: {
                b: {
                  fontSize: 12,
                  lineHeight: 18,
                  align: 'center',
                  color: '#333333'
                },
                per: {
                  align: 'center',
                  fontWeight: "bolder"
                }
              },
            },
          },
        },
        {
          value: data[2].value,
          name: data[2].name,
          itemStyle: {
            normal: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                  offset: 0,
                  color: '#0080c6'
                },
                {
                  offset: 1,
                  color: '#00427a'
                }
              ], false)
            }
          },
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
                  color: "#3c92cd",
                  fontWeight: "bolder",
                }
              },
            },
          },

        },
      ]
    }]
  };
  myChart.setOption(option);
  var bol = true;

  function eConsole(param) {
    bol = false
    if(typeof param.seriesIndex != 'undefined') {
      if(param.type == 'click') {
        var peiLenght = option.legend.data.length;
        for(var i = 0; i < peiLenght; i++) {
          if(param.seriesIndex == 0 && param.dataIndex == i) {
            var html = '<p>총' + param.data.value + '건</p>'
            $(".chartTitle .chartTitleInfo").html(html)
            $(".chartTitle .goDetails").attr('params','abcd')// 这里给params赋值打开详情的时候传参用
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

function showMoreData(e) {
  console.log($(e).attr('class'))
  if($(e).attr('class').indexOf('hideMore') > -1) {
    $(e).addClass('showMore')
    $(e).removeClass('hideMore')
  } else {
    $(e).addClass('hideMore')
    $(e).removeClass('showMore')
  }
  $(e).parents('tr').find('.more-td').slideToggle()
}
function goBarDetails(e) {
  console.log($(e).attr('params'))
  window.location.href = '4DX_MI_131.html'
}
