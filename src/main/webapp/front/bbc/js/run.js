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
var run = Class.create();
run.prototype = {
  initialize: function(container, dom, options) {
    this.Container = document.getElementById(container);
    this.scTop = document.getElementById(dom.scTop);
    this.Container.style.height = this.Container.getBoundingClientRect().width / 622 * 324 + "px";

    this.Table = document.getElementById(dom.table);
    this.lBtn = document.getElementById(dom.lBtn);
    this.rBtn = document.getElementById(dom.rBtn);
    this.el = this.Container.getElementsByTagName('canvas')[0];
    this.el.width = this.Container.clientWidth*4; // 510px
    this.el.height = this.Container.getBoundingClientRect().width / 622 * 324 *4; // 276px
    this.center_x = this.el.width / 2; // 圆心x坐标
    this.center_y = this.center_x / 622 * 500; // 圆心y坐标
    this.long_x = this.el.width; // 长方形的x轴最大坐标
    this.long_y = this.el.height; // 长方形的y轴最大坐标
    this.rw = 54 / 622 * this.el.width; // 圆弧宽度
    this.sl = 16 /622 * this.el.width; // 三角形的边长
    this.xw = 2 / 622 * this.el.width;
    this.radius = this.center_y - this.rw/2; // 半径 半径计算：外圆减去1/2弧宽
    this.rad = Math.PI * 2 / 100; // 百分比角度：比如百分之n则*n
    this.speed = 0;// 设置初始速度值
    this.speed1 = 0;// 设置初始速度值
    this.titleFontSize = 36 / 622 * this.el.width; // 标题字号
    this.contentFontSize = 70 / 622 * this.el.width; // 中间大数字的字号
    this.smallFontSize = 24 / 622 * this.el.width; // 小子字号
    this.longFontSize = 30 / 622 * this.el.width; // 长条字号
    this.bol = true;
    this.context = this.el.getContext("2d");
    this.SetOptions(options);
    this.Month = this.options.Month;
    if(this.options.title) {
      this.title = this.options.title;
      this.titleNotes = this.Month + "월";
    } else {
      this.title = this.Month + "월";
    }
    this.Ra = this.options.Ra;
    this.Rb = this.options.Rb;
    this.Rc = this.options.Rc;
    this.Ba = this.options.Ba;
    this.BaTitle = this.options.BaTitle;
    this.Bb = this.options.Bb;
    this.BbTitle = this.options.BbTitle;
    this.Bc = this.options.Bc;
    this.percent1 = this.Ra/this.Rb*100; 
    this.percent2 = this.Ba/this.Bb*100;    
    this.Draw();
    this.Click();
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = {
      title: options.title,
      Month: new Date().getMonth() + 1, //显示月
      Ra: options.Ra,
      Rb: options.Rb,
      percent1: options.Ra / options.Rb*100,
      percent2: options.Ba / options.Bb*100,
      BaTitle: options.BaTitle,
      BbTitle: options.BbTitle,
      Bc: options.Bc,
    };
    Object.extend(this.options, options || {});
  },
  //上一个月
  PreMonth: function(options) {
    this.rBtn.style.display = 'block'
    this.speed = 0;// 设置初始速度值
    this.speed1 = 0;// 设置初始速度值
    this.bol = true;
    var a = new Date().getMonth() + 1
    if(this.Month > a-2) {
      this.Month -= 1;
      if(this.Month == a-2) {
        this.lBtn.style.display = 'none'
      }
    } else {
      return
    }
    if(this.options.title) {
      this.title = this.options.title;
      this.titleNotes = this.Month + "월";
    } else {
      this.title = this.Month + "월";
    }
    this.Ra = options.Ra;
    this.Rb = options.Rb;
    this.Rc = options.Rc;
    this.Ba = options.Ba;
    this.BaTitle = options.BaTitle;
    this.Bb = options.Bb;
    this.BbTitle = options.BbTitle;
    this.Bc = options.Bc;
    this.percent1 = this.Ra/this.Rb*100; 
    this.percent2 = this.Ba/this.Bb*100; 
    //重新画日历
    this.Draw();
  },
  //下一个月
  NextMonth: function(options) {
    this.lBtn.style.display = 'block'
    this.speed = 0;// 设置初始速度值
    this.speed1 = 0;// 设置初始速度值
    this.bol = true;
    var a = new Date().getMonth() + 1
    if(this.Month < a) {
      this.Month += 1;
      if(this.Month == a) {
        this.rBtn.style.display = 'none'
      }
    } else {
      
      return
    }
    
    if(this.options.title) {
      this.title = this.options.title;
      this.titleNotes = this.Month + "월";
    } else {
      this.title = this.Month + "월";
    }
    this.Ra = options.Ra;
    this.Rb = options.Rb;
    this.Rc = options.Rc;
    this.Ba = options.Ba;
    this.BaTitle = options.BaTitle;
    this.Bb = options.Bb;
    this.BbTitle = options.BbTitle;
    this.Bc = options.Bc;
    this.percent1 = this.Ra/this.Rb*100; 
    this.percent2 = this.Ba/this.Bb*100; 
    this.Draw();
  },
  Draw: function() {
    var that = this // 该赋值一定要放在所有的函数前面，否则会使用的时候回事undefind
    // 绘制背景圆圈
    function backgroundCircle() {
      that.context.save();
      that.context.beginPath();
      that.context.lineWidth = that.rw; //设置线宽
//    that.context.lineCap = "round"; // 这个是否圆弧--顶点
      that.context.strokeStyle = "#dddddd";
      that.context.arc(that.center_x, that.center_y, that.radius, Math.PI, Math.PI * 2, false);
      that.context.stroke();
      that.context.closePath();
      that.context.restore();
    };
    // 绘制标题
    function titleFont() {
      var title = "";
      var l = 0;
      if(that.title) {
        title = that.title;
        l = title.length
      };
      if(that.titleNotes) {
        title = that.titleNotes + "(" + title + ")";
        l = title.length - 1
      };
      that.context.save(); //save和restore可以保证样式属性只运用于该段canvas元素
      that.context.fillStyle = "#555555";
      that.context.font = "bold " + that.titleFontSize + "px Helvetica";
      that.context.fillText(title, that.center_x - that.titleFontSize * l / 2, 240/420*that.center_y);//这里的y坐标暂时有问题
      that.context.restore();
    }
    // 绘制小文字
    function smallFont() {
      that.context.save(); //save和restore可以保证样式属性只运用于该段canvas元素
      that.context.fillStyle = "#3bbaff";
      that.context.font = "bold " + that.smallFontSize + "px Helvetica";
      that.context.fillText("("+that.Ra+"/"+that.Rb+")", that.center_x + that.contentFontSize*1.3, that.center_y);//这里的y坐标暂时有问题
      that.context.restore();
    }
    // 绘制数字
    function contentNum(n) {
      var l = (2*n).toString().length;
      var w = 0;
      if(l == 1) {
        w = that.contentFontSize * 3 / 8
      }
      if(l == 2) {
        w = that.contentFontSize * 5 / 8
      }
      if(l == 3) {
        w = that.contentFontSize
      }
      that.context.save(); //save和restore可以保证样式属性只运用于该段canvas元素
      that.context.fillStyle = "#0080c6";
      that.context.font = "bold " + that.contentFontSize + "px Helvetica";
      that.context.fillText(2*n.toFixed(0), that.center_x - w, that.center_y);//这里的y坐标暂时有问题
      that.context.restore();
    }
    
    // 绘制百分号
    function percent(n) {
      var l = (2*n).toString().length;
      var w = 0;
      if(l == 1) {
        w = that.contentFontSize / 4
      }
      if(l == 2) {
        w = that.contentFontSize / 2
      }
      if(l == 3) {
        w = that.contentFontSize * 11 / 16
      }
      that.context.save(); //save和restore可以保证样式属性只运用于该段canvas元素
      that.context.fillStyle = "#0080c6";
      
      that.context.font = "bold " + that.smallFontSize + "px Helvetica";
      that.context.fillText(" %", that.center_x + w, that.center_y);//这里的y坐标暂时有问题
      that.context.restore();
    }
    // 绘制圆弧虚线
    function arcScreen() {
      // 角度 1.8 * Rc 这是半径radius
      var nr = that.center_y - that.rw;// 半圆的内半径
      var ax = that.center_x + Math.cos((180 + 1.8 * that.Rc) * 2*Math.PI / 360) * that.center_y;
      var ay = that.center_y + Math.sin((180 + 1.8 * that.Rc) * 2*Math.PI / 360) * that.center_y;
      var bx = that.center_x + Math.cos((180 + 1.8 * that.Rc) * 2*Math.PI / 360) * nr;
      var by = that.center_y + Math.sin((180 + 1.8 * that.Rc) * 2*Math.PI / 360) * nr;
      that.context.save();
      that.context.setLineDash([that.xw,that.xw*1.5]); 
      that.context.lineWidth = that.xw; 
      that.context.strokeStyle = '#959595';
      that.context.beginPath(); 
      that.context.moveTo(ax, ay);
      that.context.lineTo(bx, by); 
      that.context.stroke();
      that.context.restore();
    }
    //绘制运动圆环
    function foregroundCircle(n) {
      that.context.save();
      var gradient = that.context.createLinearGradient(that.center_x, 0, 0, that.center_x);
      gradient.addColorStop(0, '#004780'); 
      gradient.addColorStop(1, '#0080c6'); 
      that.context.fillStyle = gradient;
      that.context.strokeStyle = gradient;
      that.context.lineWidth = that.rw;
      that.context.beginPath();
      //用于绘制圆弧context.arc(x坐标(圆心坐标)，y坐标(圆心坐标)，半径(这里要加上环形宽度的一般才是整个的半径)，起始角度，终止角度，顺时针/逆时针)
  
      that.context.arc(that.center_x, that.center_y, that.radius, Math.PI, Math.PI + n * that.rad, false); 
      that.context.stroke();
      that.context.closePath();
      that.context.restore();
    }
    // 绘制指针
    function arrowPoint(n) {
      // n 0~50
      // 转过角度为3.6*n
      // 假设一个圆的圆心坐标是(a,b)(center_x,center_x)，半径为r，
      // 则圆上每个点的X坐标=a + Math.cos(2*Math.PI / 360 * 角度) * r ；
      // Y坐标=b + Math.sin(2*Math.PI / 360 * 角度) * r ；
      
      var rotate = 3.6*n;
      var h = Math.sqrt(that.sl * that.sl - (that.sl / 2) * (that.sl / 2))
      // 内半径 三角形顶点
      var wr = that.center_y * 160 / 210;
      // 小圆半径 三角形另外两点
      var nr = Math.sqrt((that.sl / 2) * (that.sl / 2) + (wr - h) * (wr - h))
      var angle = Math.atan((that.sl / 2)/(nr - h))*180/Math.PI
      var ax = that.center_x + Math.cos((180 + rotate) * 2*Math.PI / 360) * wr;
      var ay = that.center_y + Math.sin((180 + rotate) * 2*Math.PI / 360) * wr;
      var bx = that.center_x + Math.cos((180 + rotate - angle) * 2*Math.PI / 360) * nr;
      var by = that.center_y + Math.sin((180 + rotate - angle) * 2*Math.PI / 360) * nr;
      var cx = that.center_x + Math.cos((180 + rotate + angle) * 2*Math.PI / 360) * nr;
      var cy = that.center_y + Math.sin((180 + rotate + angle) * 2*Math.PI / 360) * nr;
      that.context.beginPath();
      that.context.moveTo(ax,ay);
      that.context.lineTo(bx,by);
      that.context.lineTo(cx,cy);
      that.context.fillStyle= "#00437c"; //颜色填充
      that.context.fill();
    }
    // 绘制长方形
    function backgroundLong() {
      that.context.save();
      that.context.beginPath();
      that.context.lineWidth = that.rw; //设置线宽
//    that.context.lineCap = "round"; // 这个是否圆弧--顶点
      that.context.strokeStyle = "#dddddd";
      that.context.fillStyle="#dddddd";
      that.context.lineWidth=3;
      that.context.rect(0,that.long_y - that.rw,that.long_x,that.long_y);
      that.context.fill();
      that.context.closePath();
      that.context.restore();
    };
    // 绘制运动长方形
    function foregroundLong(n) {
      var l = n * that.long_x / 50;
      that.context.save();
      var gradient = that.context.createLinearGradient(that.long_x, 0, 0, that.long_x);
      gradient.addColorStop(0, '#004780'); 
      gradient.addColorStop(1, '#0080c6'); 
      that.context.beginPath();
      that.context.lineWidth = that.rw; //设置线宽
//    that.context.lineCap = "round"; // 这个是否圆弧--顶点
      that.context.strokeStyle = gradient;
      that.context.fillStyle = gradient;
      that.context.lineWidth=3;
      that.context.rect(0,that.long_y - that.rw,l,that.long_y);
      that.context.fill();
      that.context.closePath();
      that.context.restore();
    };
    
    // 绘制左侧标题
    function leftTitleFont() {
      that.context.save(); //save和restore可以保证样式属性只运用于该段canvas元素
      that.context.fillStyle = "#ffffff";
      that.context.font = "bold " + that.longFontSize + "px Helvetica";
      that.context.fillText(that.BaTitle, that.long_x * 20 / 510, that.long_y * 262 / 276);//这里的y坐标暂时有问题
      that.context.restore();
    }
    
    // 绘制右侧标题
    function rightTitleFont() {
      var l = that.BbTitle.length;
      that.context.save(); //save和restore可以保证样式属性只运用于该段canvas元素
      that.context.fillStyle = "#959595";
      that.context.font = "bold " + that.longFontSize + "px Helvetica";
      that.context.fillText(that.BbTitle, that.long_x - (l - 1) * that.longFontSize / 2 - that.longFontSize - that.long_x * 20 / 510, that.long_y * 262 / 276);//这里的y坐标暂时有问题
      that.context.restore();
    }
    // 绘制长方形虚线
    function longScreen() {
      // that.long_x * percent2 这是长方形的长
      var ax = that.long_x * that.Bc/100;
      var ay = that.long_y - that.rw;
      var bx = that.long_x * that.Bc/100;
      var by = that.long_y;
      that.context.save();
      that.context.setLineDash([that.xw,that.xw*1.5]); 
      that.context.lineWidth = that.xw; 
      that.context.strokeStyle = '#959595';
      that.context.beginPath(); 
      that.context.moveTo(ax, ay);
      that.context.lineTo(bx, by); 
      that.context.stroke();
      that.context.restore();
    }
    // 下面是执行
    function drawFrame() {
      var timmer = setInterval(function() {
        if(that.bol) {
          that.speed += 1;
          that.speed1 += 1;
          if(that.speed >= 50) {
            that.bol = false
          }
        } else if(!that.bol) {
          that.speed -= 1;
          that.speed1 -= 1;
          if(that.speed <= that.percent1 /2 ) {
            that.speed = that.percent1 /2;
          }
          if(that.speed1 <= that.percent2 /2 ) {
            that.speed1 = that.percent2 /2;
          }
          if(that.speed <= that.percent1 /2 && that.speed1 <= that.percent2 /2) {
            clearInterval(timmer)
          }  
        };
        that.context.clearRect(0, 0, that.el.width, that.el.height); // 绘制前先清除，重绘
        backgroundCircle(); // 背景半圆
        titleFont(); // 标题
        smallFont(); // 小字
        percent(that.speed); // 百分号
        contentNum(that.speed); // 数字
        arrowPoint(that.speed); // 三角形箭头
        foregroundCircle(that.speed); // 运动圆环
        arcScreen(); // 圆弧虚线 要最后在调用，否则会被挡住
        backgroundLong(); // 长方形背景
        foregroundLong(that.speed1); // 运动长方形
        leftTitleFont(); // 左侧字体
        rightTitleFont(); // 右侧字体
        longScreen(); // 长方形虚线
      },10);
    };
    // 绘图调用
    drawFrame()
  },
  Click: function() {
    var that = this;
    this.el.onclick=function(e){//给canvas添加点击事件
      e=e||event;//获取事件对象
      // 这里根据百分比计算点击的x、y是在那个区域
      // 获取点击点到圆点的x轴长
      var x = 0,y = 0,a = 0;
      var angle1 = 1.8 * that.percent1;// 这里计算的是进度的角度
      var angle2 = 0;
      var ofX = e.offsetX*4
      var ofY = e.offsetY*4
      // 这里需要获取canvas的top值
      if(that.center_y >= ofY) { // 这里用y轴做判断；只有点击到小于圆半径的区域才可能是点到半圆
        y = that.center_y - ofY;
        if(ofX < that.center_x) { // 假如点击的x小于圆心的x坐标
          x = that.center_x - ofX
          angle2 = Math.atan(y/x)*180/Math.PI;
        } else {
          x = ofX - that.center_x
          angle2 = 180 - Math.atan(y/x)*180/Math.PI;
        }
        a = Math.sqrt(x*x+y*y);
        if(a>that.center_y || a < that.center_y - that.rw) {
//        alert("点到外面了")
        } else {
          if(angle1 < angle2) {
            that.runClick('right')
          } else{
            that.runClick('left')
          }
        }
      }
      if(ofY >= that.el.height - that.rw) {
        if(ofX < that.percent2*that.el.width/100) {
          that.longClick('左边')
        } else {
          that.longClick('右边')
        }
      }
    }
  },
  runClick: function (e) {
    //这里根据e判断
    this.aa()
  },
  longClick: function (e) {
    //这里根据e判断
    this.aa()
  },
  aa() {
    $(this.Table).slideToggle()
    $(".scroll-wrap").animate({scrollTop: $(this.scTop)[0].offsetTop + 'px'}, 800)
  }
}
