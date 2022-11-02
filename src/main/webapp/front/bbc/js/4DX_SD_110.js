var data = [{
    jc: 'zhangsan', // 剧场
    wz: 'zhangsan', // 网站
    name: 'zhangsan', // 监督人
    address: 'zhangsan', // 地址
    start: '2018-09-01', // 出差期间
    end: '2018-09-05', // 出差期间
    scheduled: 'zhangsan', // 预定日期
    statas: 'Y'
}, {
    jc: 'zhangsan', // 剧场
    wz: 'zhangsan', // 网站
    name: 'zhangsan', // 监督人
    address: 'zhangsan', // 地址
    start: '2018-09-10', // 出差期间
    end: '2018-09-19', // 出差期间
    scheduled: 'zhangsan', // 预定日期
    statas: 'N'
}]
var data1 = [{
    jc: 'zhangsan', // 剧场
    wz: 'zhangsan', // 网站
    name: 'zhangsan', // 监督人
    address: 'zhangsan', // 地址
    start: '2018-09-07', // 出差期间
    end: '2018-09-19', // 出差期间
    scheduled: 'zhangsan', // 预定日期
}, ]
var dates = []
for(var i = 0; i < data.length; i++) {
    var arr = []
    arr.push(data[i].start)
    var start = data[i].start.substring(data[i].start.length-2);
    var end = data[i].end.substring(data[i].end.length-2);
    var str = data[i].start.slice(0, data[i].start.length-2);
    for(var k = 1; k < end - start; k++) {
      var day = parseInt(start) + k
      if(day.toString().length == 1) {
        arr.push(str + '0' + day)
      } else {
        arr.push(str + day)
      }
      
    }
    arr.push(data[i].end)
    dates.push(arr)
}
var dates1 = []
for(var i = 0; i < data1.length; i++) {
    var arr = []
    arr.push(data1[i].start)
    var start = data1[i].start.substring(data1[i].start.length-2);
    var end = data1[i].end.substring(data1[i].end.length-2);
    var str = data1[i].start.slice(0, data1[i].start.length-2);
    for(var k = 1; k < end - start; k++) {
      var day = parseInt(start) + k
      if(day.toString().length == 1) {
        arr.push(str + '0' + day)
      } else {
        arr.push(str + day)
      }
      
    }
    arr.push(data1[i].end)
    dates1.push(arr)
}
$(function() {
  datePick("idCalendar", {
    lTipTitle: '설치일정',
    rTipTitle: '정기점검',
    install: dates,// 紫色
    inspect: dates1, // 蓝色
  })
//var day = new date("idCalendar", {
//  lTipTitle: '설치일정',
//  rTipTitle: '정기점검',
//  a: dates,
//  b: dates1,
//});
})
function slideUpBtn(el) {
  $(el).parents(".container1").slideUp()
}
// 紫色
function table(index, day) {
  // 这里的index是获取的data的index
  console.log(day)
  $("#purpleTitle").html(day);
}
// 蓝色
function table1(index, day) {
  // 这里的index是获取的data的index
  console.log(index)
  if(data1[index].statas == 'Y') {
    $("#blueBtn").text('查看')
    $("#blueBtn").click(function() {
      window.location.href = '4DX_SD_114-3.html'
    })
  } else {
    $("#blueBtn").text('提交')
    $("#blueBtn").click(function() {
      window.location.href = '4DX_SD_114-1.html'
    })
  }

  $("#blueTitle").html(day);
}

