$(function() {
  var load = new loading();
})
var temp = document.getElementsByTagName("tr");

for(var i = 0; i < temp.length; i++) {
	tagscheck(temp)
}

function tagscheck(a) {
	var myChart;
	var load = new loading();  
    load.show();	
	  $("#relevant").slideDown();
    if(!myChart) {
      drew({
        legend:['예측','실적','경영계획','실행계획'],
        xAxis: ["1주", "2주", "3주", "4주", "5주", "6주"],
        yAxis: {
          data1: [60, 30, 50, 60, 80, 40],
          data2: [45, 28, 13, 25, 30, 50],
          data3: [45, 28, 13, 25, 30, 50],
          data4: [22, 28, 13, 23, 40, 60],
        }
      })
    } else {
      var option = myChart.getOption();
      option.series[0].data = [60, 30, 50, 60, 80, 40];  
      option.series[1].data = [60, 30, 50, 60, 80, 40];  
      option.series[2].data = [60, 30, 50, 60, 80, 40];  
      option.series[3].data = [60, 30, 50, 60, 80, 40];   
      myChart.setOption(option);  
    }
    $(".activeTr").prev().removeClass("activePrevTr")
	  $(".activeTr").removeClass("activeTr")
	  $(a).addClass("activeTr")
	  $(".activeTr").prev().addClass("activePrevTr")
	  load.hide()
  }
  function drew(data) {
    // 这里首先获取chart的宽度以便设置高度、chart的尺寸
      var cw = $("#chart")[0].clientWidth;
      var fsize = cw / 592 * 16;
      $("#chart").css('height', cw / 592 * 386 + 'px')
      myChart = echarts.init(document.getElementById('chart'));
      option = {
        title: {
          text: '관객수',
          // 这是设置title的位置top、left、bottom、right
          top:30,
          textStyle:{
            //文字颜色
            color:'#555555',
            //字体风格,'normal','italic','oblique'
            fontStyle:'normal',
            //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
            fontWeight:'bold',
            //字体系列
            fontFamily:'sans-serif',
            //字体大小
      　　　　    fontSize:fsize
          }
        },
        legend: {
          top:0,
          data:data.legend,
          itemWidth: 12,
          itemHeight: 10,
          itemGap: 10,
          textStyle:{
            //文字颜色
            color:'#555555',
            //字体风格,'normal','italic','oblique'
            fontStyle:'normal',
            //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
            fontWeight:'bold',
            //字体系列
            fontFamily:'sans-serif',
            //字体大小
      　　　　    fontSize:fsize
          }
        },
        grid:{
            x:35,
            y:60,
            x2:0,
            y2:30,
            borderWidth:1
        },
        xAxis: {
          axisLine:{
            lineStyle: {
              color: "#ededed",
              width: 2
            },
          },
          axisLabel :{//决定是否显示数据
            show:true,
            textStyle: { color: '#959595' }
          },
          data: data.xAxis,
        },
        yAxis: {
          axisLine:false,
          axisLabel :{//决定是否显示数据
            show:true,
            textStyle: { color: '#555555' }
          },
          splitNumber: 1,
        },
        animationDurationUpdate: 1200,
        series: [
        //这是蓝色的柱状
        {
          name: '실적',
          type: 'bar',
          "stack": 'sum',// 这里是两个柱状相加
          itemStyle: {
            normal: {
              color: new echarts.graphic.LinearGradient(
                0, 1, 0, 0,
                [
                    {offset: 0, color: '#0080c6'},
                    {offset: 1, color: '#004d87'}
                ]
              )
            }
          },
          barWidth: 40,
          z: 10,
          data: data.yAxis.data2
        },
        // 这是灰色的柱状
        {
          name: '예측',
          type: 'bar',
          "stack": 'sum',// 这里是两个柱状相加
          itemStyle: {
            normal: {
              color: '#ddd'
            }
          },
          silent: true,
          barWidth: 40,
          // barGap: '-100%', // 这个是两个柱状叠加
          data: data.yAxis.data1
          
        },
        {
          name: '경영계획',
          type:'line',
          symbol:'circle',
          symbolSize:6,
          itemStyle: {
            normal: {
              color: "#e42e43",
              lineStyle: {
                color: "#e42e43"
              }
            }
          },
          z: 100,
          data: data.yAxis.data3
        },
        {
          name: '실행계획',
          type:'line',
          symbol:'circle',
          symbolSize:6,
          itemStyle: {
            normal: {
              color: "#ec8921",
              lineStyle: {
                color: "#ec8921"
              }
            }
          },
          z: 100,
          data: data.yAxis.data4
        }]
      };
      myChart.setOption(option);
  }