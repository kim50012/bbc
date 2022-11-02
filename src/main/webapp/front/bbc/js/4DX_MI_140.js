$(function() {
  var load = new loading();
})
var temp = document.getElementsByTagName("tr");
	
	for(var i = 0; i < temp.length; i++) {
		tagscheck(temp)
	}

	function tagscheck(a) {
		var myChart;	
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
	    $(".activePrevTr").removeClass("activePrevTr")
		  $(".activeTr").removeClass("activeTr")
		  $(a).addClass("activeTr")
		  $(".activeTr").prev().addClass("activePrevTr")
		  load.hide()
	  }
    function drew(data) {
      // 这里首先获取chart的宽度以便设置高度、chart的尺寸
      var cw = $("#chart")[0].clientWidth;
      var fsize = cw / 592 * 20;
      var data = {
        name: ['실적', '예측','경영계획','실행계획'],
        yue: ["1윌","2윌","3윌","4윌","5윌","6윌"],
        bar1: [520, 600, 650, 730, 800, 940],
        bar2: [15, 25, 49, 25, 13, 25],
        line1: [700, 959, 820, 895, 960, 900],
        line2: [605, 620, 620, 700, 780, 640],
      }
      $("#chart").css('height', cw / 592 * 386 + 'px')
      var myChart = echarts.init(document.getElementById('chart'));
      option = {
        title: {
          text: '매출액',
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
          data: data.name,
          itemWidth: 20,
          itemHeight: 12,
          itemGap: 10,
          x: "center",
          y: "top",
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
        // 在这里设置图表的位置
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
          data: data.yue,
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
        // 蓝色柱子
        {
          name: '실적',
          type: 'bar',
//        "stack": 'sum',// 这里是两个柱状相加
          itemStyle: {
            normal: {
              label: {  
                show: true,//是否展示  
                color: "#ccc",
                position: "insideBottom"
              },

              color: new echarts.graphic.LinearGradient(
                0, 1, 0, 0,
                [
                    {offset: 0, color: '#0080c6'},
                    {offset: 1, color: '#004d87'}

                ]
              )
            }
          },
          z: 10,
          data: data.bar1
        },
        // 灰色柱子
//      {
//        name: '예측',
//        type: 'bar',
////        "stack": 'sum',// 这里是两个柱状相加
//        itemStyle: {
//          normal: {
//            color: '#ddd',
//            label: {  
//              show: true,//是否展示  
//              color: "#0080c6",
//              position: "insideTop"
//            },
//          }
//        },
//        silent: true,
//        barGap: '-100%', // 这个是两个柱状叠加
//        data: data.bar2
//        
//      },
        {
          name: '경영계획',
          type:'line',
          symbol:'circle',
//        symbolSize:6,
          itemStyle: {
            normal: {
              color: "#e42e43",
              lineStyle: {
                color: "#e42e43"
              }
            }
          },
          z: 100,
          data: data.line1
        },
        {
          name: '실행계획',
          type:'line',
          symbol:'circle',
//        symbolSize:6,
          itemStyle: {
            normal: {
              color: "#ec8921",
              lineStyle: {
                color: "#ec8921"
              }
            }
          },
          z: 100,
          data: data.line2
        }]
      };
      myChart.setOption(option);
      $("#scrolltop").click(function(){
      	$(".scroll-wrap").animate({scrollTop:"0px"},800)
      })
    }