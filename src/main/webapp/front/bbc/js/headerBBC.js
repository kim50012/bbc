$(function() {
//  if($("body > div").attr("id") === 'app') {
    // 这里是生成header
//    var htm = '<header class="app-header"><div class="logo"><image src="../img/btn_home.png"></image></div><div class="menu"><div class="set-up" onclick="goSetUp()"><i class="fourDPlex icon-shezhi"></i></div><div class="news" onclick="goNews()"><i class="fourDPlex icon-bell"></i><img class="dian" src="../image/Ellipse3.png" alt="" /></div><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
//    $("#app").prepend(htm)
//  }
  
})

function goMenuList() {
  // 这是菜单
  menuPop()
  $("#menuPage").addClass('popShow')
  $("#menuPage").removeClass('popHide')
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
    $.getJSON("../js/menuBBC.js", function (data){
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
          var urls = data.menuLv1[i].menuLv2[j].url + "&intClbsq=" + intClbSq;
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
