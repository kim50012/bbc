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
  initialize: function(container, table, options) {
    this.Container = document.getElementById(container);
    this.tables = document.getElementById(table);
    this.Days = []; //日期对象列表
    this.SetOptions(options);
    this.Year = this.options.Year;
    this.Month = this.options.Month;
    this.Day = this.options.Day;
    this.pre = 0;
    this.next = 0;
    this.a1 = this.options.a1;
    this.a2 = this.options.a2;
    this.b1 = this.options.b1;
    this.b2 = this.options.b2;
    this.c1 = this.options.c1;
    this.c2 = this.options.c2;
    this.d1 = this.options.d1;
    this.d2 = this.options.d2;
    
    this.lModelTitle = this.options.lModelTitle,
    this.lMTno1 = this.options.lMTno1,
    this.lMTno2 = this.options.lMTno2,
    this.rModelTitle = this.options.rModelTitle,
    this.rMTno1 = this.options.rMTno1,
    this.rMTno2 = this.options.rMTno2,
    // 这里有4中情况
    this.Draw();
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = { //默认值
      Year: new Date().getFullYear(), //显示年
      Month: ("0" + (new Date().getMonth() + 1)).slice(-2), //显示月
      Day: new Date().getDate(), // 日
      a1: options.a1,
      a2: options.a2,
      b1: options.b1,
      b2: options.b2,
      c1: options.c1,
      c2: options.c2,
      d1: options.d1,
      d2: options.d2,
      lModelTitle: options.lModelTitle,
      lMTno1: options.lMTno1,
      lMTno2: options.lMTno2,
      rModelTitle: options.rModelTitle,
      rMTno1: options.rMTno1,
      rMTno2: options.rMTno2,
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
    this.a1 = options.a1;
    this.a2 = options.a2;
    this.b1 = options.b1;
    this.b2 = options.b2;
    this.c1 = options.c1;
    this.c2 = options.c2;
    this.d1 = options.d1;
    this.d2 = options.d2;
    this.lModelTitle = options.lModelTitle,
    this.lMTno1 = options.lMTno1,
    this.lMTno2 = options.lMTno2,
    this.rModelTitle = options.rModelTitle,
    this.rMTno1 = options.rMTno1,
    this.rMTno2 = options.rMTno2,
    //重新画日历
    this.Draw();
  },
  //下一个月
  NextMonth: function(options) {
    var d = new Date(this.Year, this.Month, 1);
    this.Year = d.getFullYear();
    this.Month = ("0" + (d.getMonth() + 1)).slice(-2);
    this.a1 = options.a1;
    this.a2 = options.a2;
    this.b1 = options.b1;
    this.b2 = options.b2;
    this.c1 = options.c1;
    this.c2 = options.c2;
    this.d1 = options.d1;
    this.d2 = options.d2;
    this.lModelTitle = options.lModelTitle,
    this.lMTno1 = options.lMTno1,
    this.lMTno2 = options.lMTno2,
    this.rModelTitle = options.rModelTitle,
    this.rMTno1 = options.rMTno1,
    this.rMTno2 = options.rMTno2,
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
    if(this.lModelTitle) {
      var dateModel = document.createElement("div");
      dateModel.className = "date-model";
      var lModel = document.createElement("div");
      lModel.className = "left-model";
      lModel.innerHTML = "<p>"+this.lModelTitle+"</p><h4><span>"+this.lMTno1+"</span>/<span>"+this.lMTno2+"</span></h4>"
      
      var rModel = document.createElement("div");
      rModel.className = "right-model";
      rModel.innerHTML = "<p>"+this.rModelTitle+"</p><h4><span>"+this.rMTno1+"</span>/<span>"+this.rMTno2+"</span></h4>"
      dateModel.appendChild(lModel);
      dateModel.appendChild(rModel);
    }
    
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
            num.classList.add("selected")
          } else if(this.Day == d && this.Day < 15 && today == true && m == this.Month) {
            num.innerHTML = "<span class='today'>" + d + "</span>";
            num.classList.add("selected")
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
          num.onclick=function(){
            if(this.children[0].className.indexOf('pre-day') < 0 && this.children[0].className.indexOf('next-day') < 0 ) {
              var selected = document.getElementsByClassName('selected')[0]
              if(selected) {
                selected.classList.remove("selected")
              }
              this.classList.add("selected")
              $(that.tables).slideDown()
            }
          }
          var signA1 = null;
          var signA2 = null;
          var signB1 = null;
          var signB2 = null;
          var signC1 = null;
          var signC2 = null;
          var signD1 = null;
          var signD2 = null;
          for(var k = 0; k < this.a1.length; k++) {
            var a1 = this.a1[k]
            if(a1 == d && a1 > 15 && arr.indexOf(a1) <= 0 && m == this.Month){
              signA1 = document.createElement("i")
              signA1.classList.add("a1");
            } else if(a1 == d && a1 < 15 && l < 42 - NextMonth) {
              signA1 = document.createElement("i")
              signA1.classList.add("a1");
            }
          }
          for(var k = 0; k < this.a2.length; k++) {
            var a2 = this.a2[k]
            if(a2 == d && a2 > 15 && arr.indexOf(a2) <= 0 && m == this.Month) {
              signA2 = document.createElement("i")
              signA2.classList.add("a2");
            } else if(a2 == d && a2 < 15 && l < 42 - NextMonth) {
              signA2 = document.createElement("i")
              signA2.classList.add("a2");
            }
          }
          for(var k = 0; k < this.b1.length; k++) {
            var b1 = this.b1[k]
            if(b1 == d && b1 > 15 && arr.indexOf(b1) <= 0 && m == this.Month) {
              signB1 = document.createElement("i")
              signB1.classList.add("b1");
            } else if(b1 == d && b1 < 15 && l < 42 - NextMonth) {
              signB1 = document.createElement("i")
              signB1.classList.add("b1");
            }
          }
          for(var k = 0; k < this.b2.length; k++) {
            var b2 = this.b2[k]
            if(b2 == d && b2 > 15 && arr.indexOf(b2) <= 0 && m == this.Month) {
              signB2 = document.createElement("i")
              signB2.classList.add("b2");
            } else if(b2 == d && b2 < 15 && l < 42 - NextMonth) {
              signB2 = document.createElement("i")
              signB2.classList.add("b2");
            }
          }
//        for(var k = 0; k < this.c1.length; k++) {
//          var c1 = this.c1[k]
//          if(c1 == d && c1 > 15 && arr.indexOf(c1) <= 0 && m == this.Month){
//            signC1 = document.createElement("i")
//            signC1.classList.add("c1");
//          } else if(c1 == d && c1 < 15 && l < 42 - NextMonth) {
//            signC1 = document.createElement("i")
//            signC1.classList.add("c1");
//          }
//        }
//        for(var k = 0; k < this.c2.length; k++) {
//          var c2 = this.c2[k]
//          if(c2 == d && c2 > 15 && arr.indexOf(c2) <= 0 && m == this.Month) {
//            signC2 = document.createElement("i")
//            signC2.classList.add("c2");
//          } else if(c2 == d && c2 < 15 && l < 42 - NextMonth) {
//            signC2 = document.createElement("i")
//            signC2.classList.add("c2");
//          }
//        }
//        for(var k = 0; k < this.d1.length; k++) {
//          var d1 = this.d1[k]
//          if(d1 == d && d1 > 15 && arr.indexOf(d1) <= 0 && m == this.Month) {
//            signD1 = document.createElement("i")
//            signD1.classList.add("d1");
//          } else if(d1 == d && d1 < 15 && l < 42 - NextMonth) {
//            signD1 = document.createElement("i")
//            signD1.classList.add("d1");
//          }
//        }
//        for(var k = 0; k < this.d2.length; k++) {
//          var d2 = this.d2[k]
//          if(d2 == d &&d2 > 15 && arr.indexOf(d2) <= 0 && m == this.Month) {
//            signD2 = document.createElement("i")
//            signD2.classList.add("d2");
//          } else if(d2 == d && d2 < 15 && l < 42 - NextMonth) {
//            signD2 = document.createElement("i")
//            signD2.classList.add("d2");
//          }
//        }
          if(signA1 != null) {
            sign.appendChild(signA1);
          }
          if(signA2 != null) {
            sign.appendChild(signA2);
          }
          if(signB1 != null) {
            sign.appendChild(signB1);
          }
          if(signB2 != null) {
            sign.appendChild(signB2);
          }
//        if(signC1 != null) {
//          sign.appendChild(signC1);
//        }
//        if(signC2 != null) {
//          sign.appendChild(signC2);
//        }
//        if(signD1 != null) {
//          sign.appendChild(signD1);
//        }
//        if(signD2 != null) {
//          sign.appendChild(signD2);
//        }
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
  }
}

  
