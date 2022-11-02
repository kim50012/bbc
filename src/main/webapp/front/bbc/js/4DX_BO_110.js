//$(function() {
//    // 这里首先获取chart的宽度以便设置高度、chart的尺寸
//    var cw = $("#chart")[0].clientWidth;
//    var fsize = cw / 592 * 16;
//    $("#chart").css('height', cw / 592 * 386 + 'px')
//    var myChart = echarts.init(document.getElementById('chart'));
//    option = { 
//      title: {
//        text: '관객수',
//        // 这是设置title的位置top、left、bottom、right
//        top:30,
//        textStyle:{
//          //文字颜色
//          color:'#555555',
//          //字体风格,'normal','italic','oblique'
//          fontStyle:'normal',
//          //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
//          fontWeight:'bold',
//          //字体系列
//          fontFamily:'sans-serif',
//          //字体大小
//    　　　　    fontSize:fsize
//        }
//      },
//      legend: {
//        top:0,
//        data:['실적', '예측','경영계획','실행계획'],
//        itemWidth: 20,
//        itemHeight: 12,
//        itemGap: 10,
//        x: "center",
//        y: "top",
//        textStyle:{
//          //文字颜色
//          color:'#555555',
//          //字体风格,'normal','italic','oblique'
//          fontStyle:'normal',
//          //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
//          fontWeight:'bold',
//          //字体系列
//          fontFamily:'sans-serif',
//          //字体大小
//    　　　　    fontSize:fsize
//        }
//      },
//      grid:{
//          x:35,
//          y:60,
//          x2:0,
//          y2:30,
//          borderWidth:1
//      },
//      xAxis: {
//        axisLine:{
//          lineStyle: {
//            color: "#ededed",
//            width: 2
//          },
//        },
//        axisLabel :{//决定是否显示数据
//          show:true,
//          textStyle: { color: '#959595' }
//        },
//        data: ['1월', '2월', '3월', '4월', '5월', '6월'],
//      },
//      yAxis: {
//        axisLine:false,
//        axisLabel :{//决定是否显示数据
//          show:true,
//          textStyle: { color: '#555555' }
//        },
//        splitNumber: 1,
//      },
//      animationDurationUpdate: 1200,
//      series: [
//      {
//        name: '실적',
//        type: 'bar',
//        "stack": 'sum',
//        itemStyle: {
//          normal: {
//              label: {  
//              show: true,//是否展示  
//              color: "#ccc",
//              position: "insideBottom"
//            },
//
//            color: new echarts.graphic.LinearGradient(
//              0, 1, 0, 0,
//              [
//                  {offset: 0, color: '#0080c6'},
//                  {offset: 1, color: '#004d87'}
//
//              ]
//            )
//          }
//        },
//        barWidth: 40,
//        z: 10,
//        data: [45, 28, 13, 25, 13, 25]
//      },
//      {
//        name: '예측',
//        type: 'bar',
//        "stack": 'sum',
//        itemStyle: {
//          normal: {
//            color: '#ddd'
//          }
//        },
//        silent: true,
//        barWidth: 40,
//        // barGap: '-100%', // Make series be overlap
//        data: [60, 30, 50, 60, 50, 60]
//        
//      },
//      {
//        name: '실행계획',
//        type:'line',
//        symbol:'circle',
//        symbolSize:6,
//        itemStyle: {
//          normal: {
//            color: "#e42e43",
//            lineStyle: {
//              color: "#e42e43"
//            }
//          }
//        },
//        z: 100,
//        data: [45, 28, 13, 25, 13, 25]
//      },
//      {
//        name: '경영계획',
//        type:'line',
//        symbol:'circle',
//        symbolSize:6,
//        itemStyle: {
//          normal: {
//            color: "#ec8921",
//            lineStyle: {
//              color: "#ec8921"
//            }
//          }
//          
//        },
//        z: 100,
//        data: [22, 28, 13, 23, 13, 23]
//      }]
//    };
//    myChart.setOption(option);
//    $("#scrolltop").click(function(){
//    	$(".scroll-wrap").animate({scrollTop:"0px"},800)
//    })
//  })