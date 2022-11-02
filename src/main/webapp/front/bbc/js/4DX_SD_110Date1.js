var Class = {
  create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
}
Object.extend = function(destination, source) {
  for(var property in source) {
    destination[property] = source[property];
  }
  return destination;
}
var date = Class.create();
date.prototype = {
  initialize: function(container, options) {
    this.Container = document.getElementById(container);
    this.Days = []; //日期对象列表
    this.SetOptions(options);
    this.Year = this.options.Year;
    this.Month = this.options.Month;
    this.Day = this.options.Day;
    this.pre = 0;
    this.next = 0;
    this.a = this.options.a;
    this.b = this.options.b;
    this.lTipTitle = this.options.lTipTitle,
    this.rTipTitle = this.options.rTipTitle,
    // 这里有4中情况
    this.Draw();
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = { //默认值
      Year: new Date().getFullYear(), //显示年
      Month: ("0" + (new Date().getMonth() + 1)).slice(-2), //显示月
      Day: new Date().getDate(), // 日
      a: options.a,
      b: options.b,
      lTipTitle: options.lTipTitle,
      rTipTitle: options.rTipTitle,
    };
    Object.extend(this.options, options || {});
  },
  //上一个月
  PreMonth: function(options) {
    //先取得上一个月的日期对象
    var d = new Date(this.Year, this.Month - 2, 1);
    //再设置属性
    this.Year = d.getFullYear();
    this.Month = ("0" + (d.getMonth() + 1)).slice(-2);
    this.a = options.a;
    this.b = options.b;
    //重新画日历
    this.Draw();
  },
  //下一个月
  NextMonth: function(options) {
    var d = new Date(this.Year, this.Month, 1);
    this.Year = d.getFullYear();
    this.Month = ("0" + (d.getMonth() + 1)).slice(-2);
    this.a = options.a;
    this.b = options.b;
    this.Draw();
  },
  Draw: function() {
    //日期列表
    var arr = [], preArr = [], nextArr = [];
    // 上月天数
    var PreMonth = new Date(this.Year, this.Month - 1, 1).getDay(); 
    this.pre = PreMonth - 1;
    for(var i = PreMonth;i > 0; i--) {
      var PreDay = new Date(this.Year, this.Month-1, 0).getDate() - i + 1
      preArr.push(PreDay)
      arr.push(PreDay);
    }
    // 当月天数
    var Month = new Date(this.Year, this.Month, 0).getDate()
    for(var i = 1; i <= Month; i++) {
      arr.push(i);
    }
    // 下月天数 最终获取的天数是本页面上包含的所有的上月、本月、下月的天数
    var NextMonth = 42 - arr.length;
    this.next = NextMonth - 1;
    for(var i = 1; i <= NextMonth; i++) {
      nextArr.push(i)
      arr.push(i);
    }
    while(nextArr.length < arr.length) {
      nextArr.unshift('')
    }
    this.Days = [];
    // 这里是头部
//  var dateTitle = '<div class="date-title"><i class="date-lbtn" onclick="'+this.PreMonth+'"> < </i><span>2018年7月</span><i class="date-rbtn"> > </i></div>'
    // 日历头部
    var dateTitle = document.createElement("div");
    dateTitle.className = "date-title";
    var lBtn = document.createElement("div");
    lBtn.className = "date-lbtn";
    var that = this;
    lBtn.onclick = function() {
      that.PreMonth(lBtnClick())
    };
    var con = document.createElement("div");
    con.className = "date-con";
    con.innerHTML = "<span>" + this.Year + "년" + this.Month + "월" + "</span>";
    var rBtn = document.createElement("div");
    rBtn.className = "date-rbtn";
    rBtn.onclick = function() {
      that.NextMonth(rBtnClick())
    };
    dateTitle.appendChild(lBtn);
    dateTitle.appendChild(con);
    dateTitle.appendChild(rBtn);
    // 日历上面的数据
      var dateModel = document.createElement("div");
      dateModel.className = "dateModel";
      var lModel = document.createElement("div");
      lModel.className = "leftModel";
      lModel.innerHTML = this.lTipTitle;
      
      var rModel = document.createElement("div");
      rModel.className = "rightModel";
      rModel.innerHTML = this.rTipTitle;
      dateModel.appendChild(lModel);
      dateModel.appendChild(rModel);
    
    // 日历首行
    var firstRow = document.createElement("div");
    firstRow.className = 'date-head-list';
    var week = ['일','월','화','수','목','목','토']
    for(var i = 1; i <= 7; i++) {
      var cell = document.createElement("div");
      cell.className = 'date-item';
      if(week.length > 0) {
        var d = week.shift();
        cell.innerHTML = "<span>" + d + "</span>";
      }
      firstRow.appendChild(cell);
    }
    var dayWrap = document.createElement("div");
    dayWrap.className = 'day-wrap';
    // 月历上可能会出现两个相同的天数，所以拿开关进行控制，如果已经有一个今天，则后面不会再出现(小日期是用)
    var today = true;
    var l = 0;
    // 记录当前月份
    var m = new Date().getMonth() + 1;
    while(arr.length > 0) {
      //每个星期插入一个tr
      var row = document.createElement("div");
      row.className = 'date-item-list';
      //每个星期有7天
      for(var i = 1; i <= 7; i++) {
        l ++;
        var cell = document.createElement("div");
        cell.className = 'date-item';
        if(arr.length > 0) {
          var d = arr.shift();
          var preD = preArr.shift();
          var nextD = nextArr.shift();
          var num = document.createElement("div")
          num.className = 'date-num';
          var sign = document.createElement("div")
          sign.className = 'date-sign';
          // 这里是判断今天的逻辑，同样有其他的数据，可以用同样的道理去进行判断，只是开关单独使用
          if(this.Day == d && this.Day >= 15 && arr.indexOf(this.Day) <= 0 && m == this.Month) {
            num.innerHTML = "<span class='today'>" + d + "</span>";
          } else if(this.Day == d && this.Day < 15 && today == true && m == this.Month) {
            num.innerHTML = "<span class='today'>" + d + "</span>";
            today = false;
          } else {
            if(d == preD) {
              num.innerHTML = "<span class='pre-day'>" + d + "</span>";
            } else if(d == nextD) {
              num.innerHTML = "<span class='next-day'>" + d + "</span>";
            } else {
              num.innerHTML = "<span>" + d + "</span>";
            }
          }
          num.onclick = function(){
            if(this.children[0].className.indexOf('pre-day') < 0 && this.children[0].className.indexOf('next-day') < 0 ) {
              var selected = document.getElementsByClassName('selected')[0]
              if(selected) {
                selected.classList.remove("selected")
              }
              this.classList.add("selected")
              if(this.nextSibling.children.length) {
                
                $("#tableWrap").hide()
                $("#btnWrap").hide()
                $("#tableWrap1").hide()
                $("#btnWrap1").hide()
                // 这里是获取是否存在圆点
                var selectDay = parseInt(this.children[0].innerText)
                // 蓝色
                for(var s = 0; s < that.a.length; s++) {
                  for(var s1 = 0; s1 < that.a[s].length; s1++ ) {
                    var a1 = parseInt(that.a[s][s1].toString().substr(that.a[s][s1].toString().length-2))
                    if(a1 == selectDay) {
                      $("#tableWrap1").fadeIn()
                      var day;
                      if(this.children[0].innerText.length == 1) {
                        day = '0' + this.children[0].innerText
                      } else {
                        day = this.children[0].innerText
                      }
                      var selectDays = that.lTipTitle + " " + that.Year + "-" + that.Month + "-" + day
                      table(s, selectDays)
                    }
                  }
                }
                // 紫色
                for(var s = 0; s < that.b.length; s++) {
                  for(var s1 = 0; s1 < that.b[s].length; s1++ ) {
                    var a1 = parseInt(that.b[s][s1].toString().substr(that.b[s][s1].toString().length-2))
                   
                    if(a1 == selectDay) {
                      $("#tableWrap").fadeIn()
                      var day;
                      if(this.children[0].innerText.length == 1) {
                        day = '0' + this.children[0].innerText
                      } else {
                        day = this.children[0].innerText
                      }
                      var selectDays = that.lTipTitle + " " + that.Year + "-" + that.Month + "-" + day
                      table1(s, selectDays)
                    }
                  }
                }
              } else {
                $("#tableWrap").fadeOut()
                $("#tableWrap1").fadeOut()
              }
              
            }
        }
          var signB1 = null;// 蓝色
          var signC1 = null;// 紫色
          // 蓝色
          for(var k = 0; k < this.a.length; k++) {
            // 这里拿到的是数组
            var a = this.a[k]
            for(var j = 0; j < a.length; j++ ) {
              var a1 = parseInt(a[j].toString().substr(a[j].toString().length-2)) 
              if(a1 == d && a1 > 15 && arr.indexOf(a1) <= 0 && m == this.Month) {
                signB1 = document.createElement("i")
                if(a1 <= this.Day) {
                  signB1.classList.add("b2");
                } else {
                  signB1.classList.add("b1");
                }
              } else if(a1 == d && a1 < 15 && l < 42 - NextMonth) {
                signB1 = document.createElement("i")
                if(a1 <= this.Day) {
                  signB1.classList.add("b2");
                } else {
                  signB1.classList.add("b1");
                }
              }
            }
          }
          // 紫色
          for(var k = 0; k < this.b.length; k++) {
            // 这里拿到的是数组
            var a = this.b[k]
            for(var j = 0; j < a.length; j++ ) {
              var a1 = parseInt(a[j].toString().substr(a[j].toString().length-2)) 
              if(a1 == d && a1 > 15 && arr.indexOf(a1) <= 0 && m == this.Month) {
                signC1 = document.createElement("i")
                if(a1 <= this.Day) {
                  signC1.classList.add("c2");
                } else {
                  signC1.classList.add("c1");
                }
              } else if(a1 == d && a1 < 15 && l < 42 - NextMonth) {
                signC1 = document.createElement("i")
                if(a1 <= this.Day) {
                  signC1.classList.add("c2");
                } else {
                  signC1.classList.add("c1");
                }
              }
            }
          }
          
          if(signB1 != null) {
            sign.appendChild(signB1);
          }
          if(signC1 != null) {
            sign.appendChild(signC1);
          }
          
          cell.appendChild(num)
          cell.appendChild(sign)
        }
        row.appendChild(cell);
      }
      dayWrap.appendChild(row);
    }
    //先清空内容再插入(ie的table不能用innerHTML)
    while(this.Container.hasChildNodes()) {
      this.Container.removeChild(this.Container.firstChild);
    }
    this.Container.appendChild(dateTitle);
    if(dateModel) {
      this.Container.appendChild(dateModel);
    }
    this.Container.appendChild(firstRow);
    this.Container.appendChild(dayWrap);
    $('.today').parent().click()
  }
}
