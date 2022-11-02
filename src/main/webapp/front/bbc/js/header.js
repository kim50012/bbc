$(function() {
  if($("body > div").attr("id") === 'app') {
    // 这里是生成header
    var htm = '<header class="app-header"><div class="logo"><image src="../img/btn_home.png"></image></div><div class="menu"><div class="set-up" onclick="goSetUp()"><i class="fourDPlex icon-shezhi"></i></div><div class="news" onclick="goNews()"><i class="fourDPlex icon-bell"></i><img class="dian" src="../image/Ellipse3.png" alt="" /></div><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
    $("#app").prepend(htm)
  }
  
})

function goMenuList() {
  // 这是菜单
  menuPop()
  $("#menuPage").addClass('popShow')
  $("#menuPage").removeClass('popHide')
}

function goNews() {
  // 这是消息
  newsPop()
  $("#newsPage").addClass('popShow')
  $("#newsPage").removeClass('popHide')
}

function goSetUp() {
  // 这是设置
  setUpPop()
  $("#setupPage").addClass('popShow')
  $("#setupPage").removeClass('popHide')
}

function closeSetUp() {
  $("#setupPage").addClass('popHide')
  $("#setupPage").removeClass('popShow')
}
// 这里是生成setUp弹窗
function setUpPop() {
  if($("#setupPage").length == 0) {
    var setUpHtm = '<div class="popUp setupPage" id="setupPage">'
    setUpHtm += '<header class="page-head">';
    setUpHtm += '<div class="page-name">';
    setUpHtm += '<div class="set-up"><i class="fourDPlex icon-shezhi"></i></div>';
    setUpHtm += '<span>설정</span>';
    setUpHtm += '</div><i class="fourDPlex icon-close" onclick="closeSetUp()"></i></header>';
    setUpHtm += '<div class="wrap-gray">';
    setUpHtm += '<div class="left-text">';
    setUpHtm += '<span>정다은 </span>';
    setUpHtm += '<span>(ddaong)</span>';
    setUpHtm += '</div><div class="right-text">';
    setUpHtm += '<span>CJ 4DPlex</span>';
    setUpHtm += '<span>정보전략팀</span></div></div>';
    setUpHtm += '<div class="content1"><ul class="list-wrap">';
    setUpHtm += '<li class="list f-row">';
    setUpHtm += '<div class="f-col bold">푸쉬 알림</div>';
    setUpHtm += '<label class="switch"><input type="checkbox" name="" id="notice" value="" />';
    setUpHtm += '<i class="switch-btn"></i></label></li>';
    setUpHtm += '<li class="list f-row" id="language">';
    setUpHtm += '<div class="f-col bold">언어</div>';
    setUpHtm += '<span class="language">한국어</span><i class="fourDPlex icon-right_arrow"></i></li>';
    setUpHtm += '';
    setUpHtm += '<li class="list f-row">';
    setUpHtm += '<div class="f-col bold">APP 버전 정보</div>';
    setUpHtm += '<p class="version">V 2.10</p>';
    setUpHtm += '</li></ul></div>';
    setUpHtm += '<div class="logout"><button onclick="logOut()">退出</button></div></div>'
    $("#app").append(setUpHtm)
    $("#language").click(function() {
      radioPop({
        callback: function(e) {
          if(e == 'zh') {
            alert('中文')
          } else {
            alert('韩文')
          }
        },
        option: [
          {
            name: '中文',
            value: 'zh'
          },
          {
            name: '韩文',
            value: 'kr'
          },
        ]
      })
    })
    $('#notice').change(function() {
      if($(this).prop('checked') == true) {
        alert(1)
      } else {
        alert(2)
      }
    })
  } else {
    $("#setupPage").removeClass('popHide')
    $("#setupPage").addClass('popShow')
  }
  
}
function logOut() {
  alert("退出登录")
}
function closeMenuPop() {
  $("#menuPage").addClass('popHide')
  $("#menuPage").removeClass('popShow')
}

function showMenuList(e) {
  console.log($(e))
  if($(e).attr('class').indexOf('openTitle') > -1) {
    $(e).removeClass('openTitle')
    $(e).addClass('closeTitle')
    $(e).find('.listOpen').removeClass('icon-listClose')
    $(e).find('.listOpen').addClass('icon-listOpen')
    $(e).parents('li').find('.openList').slideUp()
  } else {
    $(e).addClass('openTitle')
    $(e).removeClass('closeTitle')
    $(e).find('.listOpen').removeClass('icon-listOpen')
    $(e).find('.listOpen').addClass('icon-listClose')
    $(e).parents('li').find('.openList').slideDown()
  }
  
}
// 这个变量必须是全局的，用来设置展开的菜单
var index;
// 这里是生成menu弹窗
function menuPop() {
  var titleText = $(document).attr("title")
  if($("#menuPage").length == 0) {
    var menuHtm = '<div class="popUp menuPage" id="menuPage"><div class="mask-popUp"><header class="page-head"><div class="page-name">';
    menuHtm += '<div class="menu-list"><i class="fourDPlex icon-liebiao"></i></div><span>메뉴</span></div>';
    menuHtm += '<i class="fourDPlex icon-close" onclick="closeMenuPop()"></i></header>';
    menuHtm += '<div class="content"><div class="scroll-wrap" id="menuContent"></div></div></div>';
    $("#app").append(menuHtm)
    $.getJSON("../js/menu.js", function (data){
      var menuUl = document.createElement("ul");
      menuUl.className = 'list-wrap';
      for(var i = 0; i < data.menuLv1.length; i++) {
        var menuLi = document.createElement("li");
        // 标题
        var titleHtm = '<div class="title1" onclick="showMenuList(this)"><span class="fontBlack bold f-row">'+data.menuLv1[i].name+'</span>'
        titleHtm += '<i class="fourDPlex icon-listOpen listOpen"></i>'
        var menuList = document.createElement("div");
        menuList.className = 'openList';
        for(var j = 0; j < data.menuLv1[i].menuLv2.length; j++) {
          var urls = data.menuLv1[i].menuLv2[j].url;
          var menuLinkWrap = document.createElement("div");
          menuLinkWrap.setAttribute("url", urls);
          if(titleText == data.menuLv1[i].menuLv2[j].name) {
            menuLinkWrap.className = 'list active';
            menuLinkWrap.onclick = function() {
              var that = this
              goNextPage(that, 'active')
            }
            index = i
          } else {
            menuLinkWrap.className = 'list';
            menuLinkWrap.onclick = function() {
              var that = this
              goNextPage(that, 'list')
            }
          }
          var menuLink = '<span class="f-col f-row row-start bold f-col"><span class="yuandian">·</span>';
          menuLink += '<span class="menu-link">'+data.menuLv1[i].menuLv2[j].name+'</span>';
          menuLink += '</span><span class="icon-wrap">';
          if(titleText == data.menuLv1[i].menuLv2[j].name) {
            menuLink += '<img src="../image/selected.png"></div>';
          } else {
            menuLink += '<i class="fourDPlex icon-right_arrow"></i></div>';
          }
          menuLinkWrap.innerHTML = menuLink  
          menuList.appendChild(menuLinkWrap);   
        }
        menuLi.innerHTML += titleHtm;
        menuLi.appendChild(menuList);
        menuUl.appendChild(menuLi)
      }
      $("#menuContent").append(menuUl)
      $("#menuContent").find('li').eq(index).find('.listOpen').addClass('icon-listClose')
      $("#menuContent").find('li').eq(index).find('.listOpen').removeClass('icon-listOpen')
      $("#menuContent").find('li').eq(index).find('.openList').show()
      $("#menuContent").find('li').eq(index).find('.title1').addClass('openTitle')
    })
    reload($("#menuPage").find(".refresh-wrap")[0])
  } else {
    $("#menuPage").removeClass('popHide')
    $("#menuPage").addClass('popShow')
    $("#menuContent").find('.openList').hide()
    $("#menuContent").find('.listOpen').addClass('icon-listOpen')
    $("#menuContent").find('.listOpen').removeClass('icon-listClose')
    $("#menuContent").find('li').eq(index).find('.listOpen').addClass('icon-listClose')
    $("#menuContent").find('li').eq(index).find('.listOpen').removeClass('icon-listOpen')
    $("#menuContent").find('li').eq(index).find('.openList').show()
  }
  $('.scroll-wrap').scroll(function() {
    if($(this).scrollTop() > 200) {
      if(!$(this).find(".scrolltop").length) {
        var scrollWrap = document.createElement("div");
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
// 这里是路由跳转的逻辑,本页面打开的菜单不跳转,state=='active'是本页面
function goNextPage(e,state) {
  if(state != 'active') {
    console.log(e.getAttribute('url'))
    if(e.getAttribute('url')) {
      window.location.href=e.getAttribute('url');
    } else {
      alert('无链接')
    }
  }
}

function newsPop() {
  if($("#newsPage").length == 0) {
    var newsHtm = '<div class="popUp newsPage" id="newsPage"><header class="page-head"><div class="page-name">';
    newsHtm += '<div class="news"><i class="fourDPlex icon-bell"></i></div><span>알림</span></div>';
    newsHtm += '<i class="fourDPlex icon-close" onclick="closeNewsPop()"></i></header>';
    newsHtm += '<div class="content"><div class="scroll-wrap refresh-wrap" id="newsContent"></div></div>';
    $("#app").append(newsHtm)
    $.getJSON("../js/new.js", function (data){
      var newsUl = document.createElement("ul");
      newsUl.className = 'list-wrap';
      for(var i = 0; i < data.newsList.length; i++) {
        var newLi = '';
        if(data.newsList[i].state == 0) {
          newLi = '<li class="list1">';
        } else {
          newLi = '<li class="list1 read">';
        }
        newLi += '<span class="new newBg-'+data.newsList[i].type+'">'+data.newsList[i].typeStr+'</span>';
        newLi += '<div><h4><span>['+data.newsList[i].typeStr+']</span>';
        newLi += '<span>'+data.newsList[i].title+'</span></h4><p>';
        newLi += '<span>'+data.newsList[i].date+'</span>';
        if(data.newsList[i].state == 0) {
          newLi += '<span>(읽지 않음)</span>';
        }
        newLi += '</p></div><i class="fourDPlex icon-right_arrow"></i></li>'
        newsUl.innerHTML += newLi
        $("#newsContent").append(newsUl)
      }
    })
    reload($("#newsPage").find(".refresh-wrap")[0])
  } else {
    $("#newsPage").removeClass('popHide')
    $("#newsPage").addClass('popShow')
  }
  $('.scroll-wrap').scroll(function() {
    if($(this).scrollTop() > 200) {
      if(!$(this).find(".scrolltop").length) {
        var scrollWrap = document.createElement("div");
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
function closeNewsPop() {
  $("#newsPage").addClass('popHide')
  $("#newsPage").removeClass('popShow')
}
