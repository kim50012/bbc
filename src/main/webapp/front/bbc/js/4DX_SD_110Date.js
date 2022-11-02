function datePick(el, param) {
  var Container = document.getElementById(el);
  // date的格式：YYYY-MM
  var Year = new Date().getFullYear();
  var Month = new Date().getMonth() + 1;
  var Today = new Date().getDate();
  drow()

  function drow() {
    //日期列表
    var thisArr = [],
      preArr = [],
      nextArr = [];
    var PreMonth = new Date(Year, Month - 1, 1).getDay();
    var pre = PreMonth - 1;
    for(var i = PreMonth; i > 0; i--) {
      var PreDay = new Date(Year, Month - 1, 0).getDate() - i + 1
      preArr.push(PreDay)
      thisArr.push(PreDay);
    }
    // 当月天数
    var thisMonth = new Date(Year, Month, 0).getDate()
    for(var i = 1; i <= thisMonth; i++) {
      thisArr.push(i);
    }
    // 下月天数 最终获取的天数是本页面上包含的所有的上月、本月、下月的天数
    var NextMonth = 42 - thisArr.length;
    this.next = NextMonth - 1;
    for(var i = 1; i <= NextMonth; i++) {
      nextArr.push(i)
      thisArr.push(i);
    }
    var fullArr = thisArr;
    while(nextArr.length < thisArr.length) {
      nextArr.unshift('')
    }
    this.Days = [];
    // 日历头部
    var dateTitle = document.createElement("div");
    dateTitle.className = "date-title";
    var lBtn = document.createElement("div");
    lBtn.className = "date-lbtn";
    lBtn.onclick = function() {
      var d = new Date(Year, Month - 2, 1);
      //再设置属性
      Year = d.getFullYear();
      Month = ("0" + (d.getMonth() + 1)).slice(-2);
      console.log(Year + '-' + Month)
      drow()
    };
    var con = document.createElement("div");
    con.className = "date-con";
    con.innerHTML = "<span>" + Year + "년" + Month + "월" + "</span>";
    var rBtn = document.createElement("div");
    rBtn.className = "date-rbtn";
    rBtn.onclick = function() {
      var d = new Date(Year, Month, 1);
      Year = d.getFullYear();
      Month = ("0" + (d.getMonth() + 1)).slice(-2);
      console.log(Year + '-' + Month)
      drow()
    };
    dateTitle.appendChild(lBtn);
    dateTitle.appendChild(con);
    dateTitle.appendChild(rBtn);
    // 日历上面的数据
    var dateModel = document.createElement("div");
    dateModel.className = "dateModel";
    var lModel = document.createElement("div");
    lModel.className = "leftModel";
    lModel.innerHTML = param.lTipTitle;

    var rModel = document.createElement("div");
    rModel.className = "rightModel";
    rModel.innerHTML = param.rTipTitle;
    dateModel.appendChild(lModel);
    dateModel.appendChild(rModel);
    //  // 日历首行
    var firstRow = document.createElement("div");
    firstRow.className = 'date-head-list';
    var week = ['일', '월', '화', '수', '목', '목', '토']
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
    var TodayBol = true;
    var l = 0;
    // 记录当前月份
    var m = new Date().getMonth() + 1;
    while(thisArr.length > 0) {
      //每个星期插入一个tr
      var row = document.createElement("div");
      row.className = 'date-item-list';
      //每个星期有7天
      for(var i = 1; i <= 7; i++) {
        l++;
        var cell = document.createElement("div");
        cell.className = 'date-item';
        if(thisArr.length > 0) {
          var d = thisArr.shift();
          var preD = preArr.shift();
          var nextD = nextArr.shift();
          var num = document.createElement("div")
          num.className = 'date-num';
          var sign = document.createElement("div")
          sign.className = 'date-sign';
          // 这里是判断今天的逻辑，同样有其他的数据，可以用同样的道理去进行判断，只是开关单独使用
          // m 为当前月;Month为获取的月份
          if(Today == d && Today >= 15 && thisArr.indexOf(Today) <= 0 && m == Month) {
            num.innerHTML = "<span class='Today'>" + d + "</span>";
          } else if(Today == d && Today < 15 && TodayBol == true && m == Month) {
            num.innerHTML = "<span class='Today'>" + d + "</span>";
            TodayBol = false;
          } else {
            if(d == preD) {
              num.innerHTML = "<span class='pre-day'>" + d + "</span>";
            } else if(d == nextD) {
              num.innerHTML = "<span class='next-day'>" + d + "</span>";
            } else {
              num.innerHTML = "<span>" + d + "</span>";
            }
          }
          num.onclick = function() {
            if(this.children[0].className.indexOf('pre-day') < 0 && this.children[0].className.indexOf('next-day') < 0) {
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
                for(var s = 0; s < param.install.length; s++) {
                  for(var s1 = 0; s1 < param.install[s].length; s1++) {
                    var a1 = parseInt(param.install[s][s1].toString().substr(param.install[s][s1].toString().length - 2))
                    if(a1 == selectDay) {
                      $("#tableWrap").fadeIn()
                      var day;
                      if(this.children[0].innerText.length == 1) {
                        day = '0' + this.children[0].innerText
                      } else {
                        day = this.children[0].innerText
                      }
                      var selectDays = param.lTipTitle + " " + Year + "-" + Month + "-" + day;
                      
                      table(s, selectDays)
                    }
                  }
                }
                // 紫色
                for(var s = 0; s < param.inspect.length; s++) {
                  for(var s1 = 0; s1 < param.inspect[s].length; s1++) {
                    var a1 = parseInt(param.inspect[s][s1].toString().substr(param.inspect[s][s1].toString().length - 2))

                    if(a1 == selectDay) {
                      $("#tableWrap1").fadeIn()
                      var day;
                      if(this.children[0].innerText.length == 1) {
                        day = '0' + this.children[0].innerText
                      } else {
                        day = this.children[0].innerText
                      }
                      var selectDays = param.lTipTitle + " " + Year + "-" + Month + "-" + day
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
          var signB1 = null; // 蓝色
          var signC1 = null; // 紫色
          // 蓝色
          for(var k = 0; k < param.inspect.length; k++) {
            // 这里拿到的是数组
            var a = param.inspect[k]
            for(var j = 0; j < a.length; j++) {
              var a1 = parseInt(a[j].toString().substr(a[j].toString().length - 2))

              if(a1 == d && a1 >= 15 && fullArr.indexOf(a1) <= 0 && m == Month) {
                signB1 = document.createElement("i")
                if(a1 <= Today) {
                  signB1.classList.add("b2");
                } else {
                  signB1.classList.add("b1");
                }
              } else if(a1 == d && a1 < 15 && l < 42 - NextMonth) {
                signB1 = document.createElement("i")
                if(a1 <= Today) {
                  signB1.classList.add("b2");
                } else {
                  signB1.classList.add("b1");
                }
              }
            }
          }
          // 紫色
          for(var k = 0; k < param.install.length; k++) {
            // 这里拿到的是数组
            var a = param.install[k]
            for(var j = 0; j < a.length; j++) {
              var a1 = parseInt(a[j].toString().substr(a[j].toString().length - 2))
              if(a1 == d && a1 >= 15 && fullArr.indexOf(a1) <= 0 && m == Month) {
                signC1 = document.createElement("i")
                if(a1 <= Today) {
                  signC1.classList.add("c2");
                } else {
                  signC1.classList.add("c1");
                }
              } else if(a1 == d && a1 < 15 && l < 42 - NextMonth) {
                signC1 = document.createElement("i")
                if(a1 <= Today) {
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
    while(Container.hasChildNodes()) {
      Container.removeChild(Container.firstChild);
    }
    Container.appendChild(dateTitle);
    if(dateModel) {
      Container.appendChild(dateModel);
    }
    Container.appendChild(firstRow);
    Container.appendChild(dayWrap);
    $('.Today').parent().click()
  }
}