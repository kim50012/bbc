$(function() {
	$("html").width(document.body.offsetWidth)
  // 这是设置所有的input输入框
  $('input').on('input',function() {
    if($(this).val()) {
      $(this).css('background-color','#FFFFFF')
    } else {
      $(this).css('background-color','none')
    }
  })
  
  
  //下拉刷新调用
  reload();
  // loading
  var load = loading();
  // 这里是调用load的方法
  load.show()
  load.hide()
  scroll()
})
// 这是下拉刷新的方法
function reload(el) {
  if(el) {
    el.addEventListener('touchstart', touchstart, false);
    el.addEventListener('touchmove', touchmove, false);
    el.addEventListener('touchend', touchend, false);
  } else if($(".refresh-wrap").length) {
    $(".refresh-wrap")[0].addEventListener('touchstart', touchstart, false);
    $(".refresh-wrap")[0].addEventListener('touchmove', touchmove, false);
    $(".refresh-wrap")[0].addEventListener('touchend', touchend, false);
  }
  var startX, moveY, endY, bol = false, refreshBol = false;
  var refresh = document.createElement('div')
  refresh.className = 'refresh';
  function touchstart(event) {
    var event = event || window.event;
    startX = event.changedTouches[0].clientY;
    if($(this).attr("class").indexOf("scroll-wrap") > -1) {
      if($(this)[0].scrollTop == 0) {
        bol = true
      } else {
        bol = false
      }
    } else {
      if($(".scroll-wrap")[0].scrollTop == 0) {
        bol = true
      } else {
        bol = false
      }
    }
  }
  function touchmove(event) {
    if($(".scroll-wrap").css('display') == "none") {
      return
    }
    var event = event || window.event;
    moveY = event.changedTouches[0].clientY;
    if(bol) {
      var h = moveY - startX;
      if(h > 10) {
        $(this).parent().prepend(refresh)
      }
      if(h > 80 && !refreshBol) {
        refresh.innerHTML = '<span>Refresh</span>';
        refreshBol = true;
      }
      if(h > 120) {
        h = 120
      }
      refresh.style.height = h + 'px'
    }
    
  }
  function touchend(event) {
    var event = event || window.event;
    endY = event.changedTouches[0].clientY;
    if(bol) {
      var h = refresh.offsetHeight;
      var op = 1;
      var timer = setInterval(function() {
        h -= 2;  
        op -= 0.1
        $(refresh).find('span').css('opacity', op)
        refresh.style.height = h + 'px';
        if(h <= 0) {
          $(refresh).remove()
          refreshBol = false;
          $(refresh).find('span').remove()
          clearInterval(timer)
        }
      },1)
    }
    if(refreshBol) {
      // 这里调用公用的页面初始化方法
//      console.log('刷新了')
      window.location.reload();
    }
  }
}
// 返回顶部按钮
function scroll() {
  // 如果存在滚动外框则会生成返回顶部按钮
  if($('.scroll-wrap').length > 0) {
    $('.scroll-wrap').scroll(function() {
      if($(this).scrollTop() > 200) {
        var scrollWrap;
        if(!$(this).find(".scrolltop").length) {
          scrollWrap = document.createElement("div");
          scrollWrap.className = 'scrolltop';
          scrollWrap.innerHTML = '<span></span>'
          var $_that = $(this)
          $(scrollWrap).click(function() {
            $_that.animate({scrollTop: '0px'}, 800)
          })
          $(this).append(scrollWrap)
        } else {
          $(this).find(".scrolltop").fadeIn()
        }
      } else {
        $(this).find(".scrolltop").fadeOut()
      }
    })
  }  
}
// 点击跳转页面
function goAppPage(el) {
  window.location.href = $(el).attr('url')
}

// 消息弹窗
var callback, title, message, type;
function messageBox(param) {
  title = param.title || '알림';
  message = param.message;
  type = param.type || 'alert';
  callback = param.callback || function() {};

  var messagePop = document.createElement('div');
  messagePop.className = 'message-pop';
  var messageContent = document.createElement('div');
  messageContent.className = 'message-content';

  var html = '<div class="message-header">' + title + '</div>'
  html += '<div class="message">' + message + '</div>'
  if(type == 'alert') {
    html += '<div class="message-button"><div class="confirm" onclick="popRemove();callback()">확인</div></div>'
  } else if(type == 'confirm') {
    html += '<div class="message-button"><div class="cancel" onclick="popRemove()">취소</div><div class="confirm" onclick="popRemove();callback()">확인</div></div>'
  }
  messageContent.innerHTML = html
  messagePop.append(messageContent)
  $('body').append(messagePop)
}
// 移除消息弹窗
function popRemove() {
  $(".message-pop").addClass("popHide");
  setTimeout(function() {
    $(".message-pop").remove()
  },0)
}
// loading
function loading() {
  var load = new Object()
  load = {
    Container: document.getElementsByTagName("body")[0],
    loading: false,
    //显示loading
    show: function() {
      this.loading = true;
      this.loads();
    },
    //删除loading
    hide: function() {
      this.loading = false;
      this.loads();
    },
    loads: function() {
      if(this.loading) {
        var loadingWrap = document.createElement("div");
        loadingWrap.className = "loading-wrap";
        loadingWrap.id = "loading";
        load.Container.appendChild(loadingWrap)
        
      } else {
        var that = this
        var op = 1
        var timer = setInterval(function() {
          op -= 0.1
          $("#loading").css('opacity', op)
          if(op <= 0) {
              clearInterval(timer)
              $("#loading").remove()
          }
        },50)
      }
    }
  }
  return load

}
// 下拉 单选
function radioPop(param) {
  var obj = new Object;
  obj.radioName = param.radioName || 'custom-radio';
  obj.callback = param.callback;
  obj.val = param.val || param.option[0].value;
  obj.option = param.option;
  var wrap = document.getElementsByTagName("body")[0];
  var radioPop = document.createElement('div');
  radioPop.className = 'radio-pop';
  var radioWrap = document.createElement('div');
  radioWrap.className = 'radio-wrap';
  var radioListWrap = document.createElement('div');
  radioListWrap.className = 'radio-content';
  var radioList = '';
  obj.creatRadio = function(radioName,val,option) {
    for(var i = 0; i < option.length; i++) {
      if(val == option[i].value) {
        radioList += '<div class="radio-list"><label>'
        radioList += '<input type="radio" name="'+radioName+'" checked="checked" value="'+option[i].value+'"/>'
        radioList += '<div><i class="radioIcon"></i><span>'+option[i].name+'</span></div></label></div>'
      } else {
        radioList += '<div class="radio-list"><label>'
        radioList += '<input type="radio" name="'+radioName+'" value="'+option[i].value+'"/>'
        radioList += '<div><i class="radioIcon"></i><span>'+option[i].name+'</span></div></label></div>'
      }
    }
    var radiobutton = '<div class="radio-button"><div onclick="removeRadio(this)">확인</div></div>'
    radioListWrap.innerHTML = radioList;
    radioWrap.innerHTML = radiobutton;
    radioWrap.prepend(radioListWrap);
    radioPop.appendChild(radioWrap);
    wrap.appendChild(radioPop);
  }
  removeRadio = function(el) {
    var val = $(el).parent().prev().find("input[name='"+obj.radioName+"']:checked").val();
    var name = $(el).parent().prev().find("input[name='"+obj.radioName+"']:checked").next().find('span').html();
    $(radioPop).addClass('popHide');
    setTimeout(function() {
      radioPop.remove();
    },300);
    obj.callback(name,val);
  }
  obj.creatRadio(obj.radioName,obj.val,obj.option);
}
// 加载更多  
function loadMore(param) {
  var bol = true;
  var num = param.num;
  var size = param.size || 20;
  var callback = param.callback;
  if(!$('.scroll-wrap').find('#loadMore').length) {
    bol = true;
  } else {
    bol = false;
  }
  $('#loadMore').remove()
  if(bol && num == size) {
    var html = '<div class="load-more" id="loadMore"><span onclick="loadMoreData()">加载更多</span></div>'
    $('.scroll-wrap').append(html)
  } else if(!bol) {
    if(num == size) {
      var html = '<div class="load-more" id="loadMore"><span onclick="loadMoreData()">加载更多</span></div>'
      $('.scroll-wrap').append(html)
    } else {
      var html = '<div class="load-more" id="loadMore"><p>没有更多数据了</p></div>'
      $('.scroll-wrap').append(html)
    }
  }
  loadMoreData = function() {
    callback()
  }
}

  



// 下拉 单选
function popSelect(param) {
  var obj = new Object;
  obj.callback = param.callback;
  obj.option = param.option;
  var wrap = document.getElementsByTagName("body")[0];
  var selectPop = document.createElement('div');
  selectPop.className = 'selectPop';
  var selectWrap = document.createElement('div');
  selectWrap.className = 'selectWrap';
  var selectList = '';
  for(var i = 0; i < obj.option.length; i++) {
    selectList += "<p val='"+obj.option[i].value+"' onclick='removesSelect(this)'>"+obj.option[i].name+"</p>"
  }

  selectWrap.innerHTML = selectList;

  selectPop.appendChild(selectWrap);
  wrap.appendChild(selectPop);

  removesSelect = function(el) {

    var name = $(el).html(),val=$(el).attr("val")
    $(selectPop).addClass('selectHide')
    setTimeout(function() {
      selectPop.remove()
    },290)
    obj.callback(name,val)
  }

}



//
//$(function() {
//    var a = 30;
//    var bol = false;
//    function abc() {
//      a = a-1
//      var b = 0;
//      if(a > 20) {
//        b = 20
//      } else {
//        b = a
//      }
//      console.log(b)
//      loadMore({
//        num: b,
//        size: 20,
//        callback: function() {
//          console.log(a)
//          abc()
//        }
//      })
//    }
//    abc()
//  })