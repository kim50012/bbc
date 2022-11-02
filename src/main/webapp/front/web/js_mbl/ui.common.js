String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
}; 
String.prototype.replaceAll = function(searchChar, replaceChar) {
	var temp_str = "";
   if (this != "" && searchChar != replaceChar) {
      temp_str = this;
      while (temp_str.indexOf(searchChar) > -1) {
         temp_str = temp_str.replace(searchChar, replaceChar);
      }
   }
   return temp_str;
}
function checkboxToggle(frm, name, value) {
    if(frm == undefined) return;
    
    for(var i=0;i<frm.elements.length;i++) {
        if(frm.elements[i].name == name && frm.elements[i].disabled!=true) {
             frm.elements[i].checked = value;
        }
    }  
}
String.prototype.getByte = function() {
	var tcount = 0;
    var tmpStr = this;
    for ( k=0; k<tmpStr.length; k++ ) {
        if (escape(tmpStr.charAt(k)).length > 4) {
            tcount += 3;
        } else {
            tcount += 1;
        }
    }
    return tcount;
}

function setComma(num) 
{
    var num = num.toString();
    var rtn = "";
    var val = "";
    var j = 0;
    x = num.length;

    for(i=x; i>0; i--)
    {
        if(num.substring(i,i-1) != ",") 
            val = num.substring(i, i-1) + val;
    }
    x = val.length;
    for(i=x; i>0; i--) 
    {
        if(j%3 == 0 && j!=0) 
            rtn = val.substring(i,i-1)+","+rtn; 
        else 
            rtn = val.substring(i,i-1)+rtn;

        j++;
    }

    return rtn;
}
//모두 숫자인지 체크
String.prototype.isNumber = function() {
	var str = this;
	if (str.length == 0)
        return false;

    for (var i=0; i < str.length; i++) {
        if(!('0' <= str.charAt(i) && str.charAt(i) <= '9'))
            return false;
    }
    return true;
}

//숫자만 가능 (onKeyDown="onlyNumber()")
function onlyNumber()
{
    if((event.keyCode != 9 && event.keyCode != 8 && event.keyCode != 46) && (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105))
    {
        event.returnValue=false;
    }
}

//알파벳 여부 체크
function isAlphabet(obj) {
    var str = obj.value.trim();

    if(str.length == 0)
        return false;

    str = str.toUpperCase();
    for(var i=0; i < str.length; i++) {
        if(!(('A' <= str.charAt(i) && str.charAt(i) <= 'Z') || ('a' <= str.charAt(i) && str.charAt(i) <= 'z')))
            return false;
    }
    return true;
}


function openwindow(mypage, myname, w, h, scroll) {
    var winl = (screen.width - w) / 2;
    var wint = (screen.height - h) / 2;
    winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable=no'
    win = window.open(mypage, myname, winprops)
    if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
	return win;
}

function openwindowTo(mypage, myname, w, h, l, t, scroll) {
    winprops = 'height='+h+',width='+w+',top='+t+',left='+l+',scrollbars='+scroll+',resizable=no'
    win = window.open(mypage, myname, winprops)
    if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
	return win;
}

var UI={
  _browser : null
};
// 글자수 입력제한
UI.limitInputLength = function(obj, limitbyte) {
	if(obj.value.getByte() > limitbyte) {
	   alert('입력폼에 글자제한은 '+limitbyte+'Byte까지 입니다.');
	   obj.value = UI.length(obj.value, limitbyte);	
	}
}
//이미지 사이즈 축서
UI.imageResize = function(obj, width) {
	if(obj == undefined) return;
	if(obj.tagName != "IMG") return;
	this.obj = obj;
	this.width = width;
	
	this.resize();
}
UI.imageResize.prototype = {
	resize : function() {
		if(this.obj.readyState != "complete") {
			var self = this;
		    window.setTimeout(function(){self.resize()}, 50);
		}
		if(this.obj.width > this.width) {
		  this.obj.width = this.width;
		}
	}
}
Object.extend=function(a, b){
  for (var property in b){a[property] = b[property];}
  return a;
};
UI.$=function(s) { return document.getElementById(s) };
UI.toogle=function(id) { UI.$(id).style.display=(UI.getStyle(UI.$(id),'display')=='none') ? 'block':'none' };
UI.toggle=function(idprefix, options) {
	try {
		this.idprefix = idprefix;
		this.options = {
		   init_value : 'none'
		};
		Object.extend(this.options, options);
		
		var obj = UI.$("btn_" + idprefix);
		var self = this;
		UI.addEvent(obj, "click", function(){self.on()});
		
		if(UI.getStyle(UI.$("div_"+this.idprefix ), 'display') != this.options.init_value) {
			this.on();
		}
	} catch(e){}
}
UI.toggle.prototype = {
	on : function() {
		try {
			if(UI.getStyle(UI.$("div_"+this.idprefix),'display') == 'none') {
	            UI.$("btn_" + this.idprefix).src = UI.$("btn_" + this.idprefix).src.replace("_on.", "_off.");	
				UI.$("div_"+this.idprefix).style.display = 'block';
			} else {
				UI.$("btn_" + this.idprefix).src = UI.$("btn_" + this.idprefix).src.replace("_off.", "_on.");  
	            UI.$("div_"+this.idprefix).style.display = 'none';
			} 
		} catch(e){}
	}
}
UI.addEvent=function(object, type, listener) {  
  try{
    if(object.addEventListener) { object.addEventListener(type, listener, false); }
    else { object.attachEvent("on"+type, listener); }
  }catch(e){}
};
UI.delEvent=function(object, type, listener){
  if (object.removeEventListener) object.removeEventListener(type, listener, false);
  else object.detachEvent('on'+type, listener);
};
UI.stopEvent=function(event) {
  var e=event || window.event;
  if(e.preventDefault) {e.preventDefault(); e.stopPropagation(); }
  else {e.returnValue = false; e.cancelBubble = true;}
};
UI.getBrowser=function(){
  var ua=navigator.userAgent.toLowerCase();
  var opera=/opera/.test(ua)
  UI._browser={
    ie:!opera && /msie/.test(ua),
    ie_ver: parseFloat(((ua.split('; '))[1].split(' '))[1]),
    opera:opera,
    ff:/firefox/.test(ua),
    gecko:/gecko/.test(ua)    
  };
  return UI._browser;
};
UI.resizeIframe=function(iframe_id) {
  var h = (self.innerHeight) ? document.documentElement.offsetHeight : document.body.scrollHeight;
  try{parent.document.getElementById(iframe_id).style.height = h+"px";}catch(e){}
};
UI.rollOver=function(s) {
  var img=(typeof(s)=="string") ? img=UI.$(s):s;
  img.onmouseover=function(){
    var src=img.src;
    if(src.indexOf("_over.")>-1) return;  
    img.src=src.substring(0,src.lastIndexOf("."))+"_over."+src.substring(src.lastIndexOf(".")+1);
  };
  img.onmouseout=function(){
    var src=img.src;
    if(src.indexOf("_over.")==-1) return;
    img.src=src.replace("_over.",".");
  };
};
UI.popUp=function(url,name,w,h,scroll,resize,status,center){
  if(!scroll) scroll=0;
  if(!resize) resize=0;
  if(!status) status=1;
  if(center)  
  {
    var x = (screen.width - w) / 2;
    var y = (screen.height - h) / 2;
    center = ",top="+y+",left="+x;
  }
  return window.open(url,name,"width="+w+",height="+h+",status="+status+",resizable="+resize+",scrollbars="+scroll+center);
};
UI.setCookie=function(name,value,expires){
  var d = new Date(); var day="";
  if(expires)
  {
    d.setDate(d.getDate()+expires);
    day = "expires="+d.toGMTString()+";";
  }
  document.cookie = name+"="+escape(value)+"; path=/;"+day;
};
UI.getCookie=function(name){
  name += "=";
  cookie = document.cookie + ";";
  start = cookie.indexOf(name);
  if (start != -1)
  {
    end = cookie.indexOf(";",start);
    return unescape(cookie.substring(start + name.length, end));
  }
  return "";
};
UI.flash_wf = function(flash_name,flash_width,flash_height,flash_id,wmd){
    document.write(" \
        <Object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0' WIDTH='"+flash_width+"' HEIGHT='"+flash_height+"' id='"+flash_id+"' ALIGN=''> \
        <PARAM NAME=allowScriptAccess value=always> \
        <PARAM NAME=movie VALUE='"+flash_name+"'> \
        <PARAM NAME=quality VALUE=high> \
    ");
    if( wmd == '1' ){
        document.write(" \
            <PARAM NAME=wmode VALUE=transparent> \
        ");
    }
    if( wmd == '1' ){
        document.write(" \
            <EMBED src='"+flash_name+"' allowScriptAccess='always' wmode='transparent' quality=high  WIDTH='"+flash_width+"' HEIGHT='"+flash_height+"' NAME='"+flash_id+"' ALIGN='' TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/go/getflashplayer'> \
        ");
    }else{
        document.write(" \
            <EMBED src='"+flash_name+"' allowScriptAccess='always' wmode='transparent' quality=high  WIDTH='"+flash_width+"' HEIGHT='"+flash_height+"' NAME='"+flash_id+"' ALIGN='' TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/go/getflashplayer'> \
        ");
    }
    document.write(" \
        </EMBED> \
        </OBJECT> \
    ");
};

UI.flash_wf2 = function(flash_name,flash_width,flash_height,flash_id,wmd){
    document.write(" \
        <Object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0' WIDTH='"+flash_width+"' HEIGHT='"+flash_height+"' id='"+flash_id+"' ALIGN=''> \
        <PARAM NAME=allowScriptAccess value=always> \
        <PARAM NAME=movie VALUE='"+flash_name+"'> \
        <PARAM NAME=quality VALUE=high> \
    ");
    if( wmd == '1' ){
        document.write(" \
            <PARAM NAME=wmode VALUE=transparent> \
        ");
    }
    if( wmd == '1' ){
        document.write(" \
            <EMBED src='"+flash_name+"' allowScriptAccess='always' wmode='transparent' quality=high  WIDTH='"+flash_width+"' HEIGHT='"+flash_height+"' NAME='"+flash_id+"' ALIGN='' TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/go/getflashplayer'> \
        ");
    }else{
        document.write(" \
            <EMBED src='"+flash_name+"' allowScriptAccess='always' wmode='transparent' quality=high  WIDTH='"+flash_width+"' HEIGHT='"+flash_height+"' NAME='"+flash_id+"' ALIGN='' TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/go/getflashplayer'> \
        ");
    }
    document.write(" \
        </EMBED> \
        </OBJECT> \
    ");
};

UI.embedSWF=function(f,w,h,id,param){
  if(!id) id="UIswf_"+Math.round(Math.random()*1000);
  id='id="'+id+'" name="'+id+'"';
  var p="",e="",s="";
  if(!param) param = {quality:'high',wmode:'transparent',bgcolor:'#ffffff',allowScriptAccess:'always'}
  for(i in param) 
  {
    p+='<param name="'+i+'" value="'+param[i]+'">\n';
    e+=i+'="'+param[i]+'" ';
  }
  s='<object '+id+' width="'+w+'" height="'+h+'" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">';
  s+='<param name="movie" value="'+f+'">'+ p; 
  s='<embed '+id+' src="'+f+'" width="'+w+'" height="'+h+'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" '+e+'/>';
  s+='</object>';
  document.write(s);
};
UI.embedWMP=function(f,w,h,id,param){
  if(!id) id="UIwmp_"+Math.round(Math.random()*1000);
  id='id="'+id+'" name="'+id+'"';
  var p="",e="";
  if(!param) param = {autostart:'1',showstatusbar:'-1',transparentatstart:'1',uimode:'full',displaybackcolor:'0'}
  for(i in param) 
  {
    p+='<param name="'+i+'" value="'+param[i]+'">\n';
    e+=i+'="'+param[i]+'" ';
  }
  var s='<object '+id+' width="'+w+'" height="'+h+'" classid="CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701" standby="Loading Microsoft Windows Media Player components..." type="application/x-oleobject" style="filter:gray();">';
  s+='<param name="filename" value="'+f+'">'+ p;
  s+='<embed '+id+' src="'+f+'" width="'+w+'" height="'+h+'" type="application/x-mplayer2" pluginspage="http://www.microsoft.com/windows/mediaplayer/" '+e+' />';
  s+='</object>';
  document.write(s);
};

UI.toolTip=function(event, options) {

  var e=event || window.event;
  var el= e.target || e.srcElement;

  el.options={
    className:'UItoolTip',
    mousemove:UI.toolTip.mousemove
  };

  Object.extend(el.options, options);
  
  if(!el.UItoolTip) 
  {
    el.stitle = el.alt || el.title || el.stitle;
    el.title = el.alt = "";
    if(!el.stitle) return;
    
    var d = document.createElement("DIV");    
    d.className = el.options.className;
    d.style.position="absolute";  
    UI.$('JESToolTip').appendChild(d);
    
    el.UItoolTip=d;
    el.UItoolTip.innerHTML=el.stitle;
  }
  var scroll = UI.getScroll();
  var x = (e.clientX+scroll.left+10) + "px";
  var y = (e.clientY+scroll.top+10) + "px";
  el.UItoolTip.style.left = x;
  el.UItoolTip.style.top =  y;
  el.UItoolTip.style.visibility="visible";

  UI.addEvent(el,'mouseout',UI.toolTip.mouseout);
  if(el.options.mousemove) UI.addEvent(document, "mousemove", el.options.mousemove);
}

document.write('<div id="JESToolTip"></div>');
UI.toolTip.seq = 1;
UI.toolTip.mousemove=function(event){
  var e=event || window.event; var el= e.target || e.srcElement;
  var scroll = UI.getScroll();
  el.UItoolTip.style.left=(e.clientX+scroll.left)+"px";
  el.UItoolTip.style.top=(e.clientY+scroll.top+20)+"px";
};
UI.toolTip.mouseout=function(event){
  var e=event || window.event; var el= e.target || e.srcElement;
  if(!el.UItoolTip) return;
  el.UItoolTip.style.visibility="hidden";
  if(el.options.mousemove) UI.delEvent(document, "mousemove",  el.options.mousemove); 
};


UI.getScroll=function () {
  if(document.all && typeof document.body.scrollTop != "undefined")
  {
    var cont=document.compatMode!="CSS1Compat"?document.body:document.documentElement;
    return {left:cont.scrollLeft, top:cont.scrollTop, width:cont.clientWidth, height:cont.clientHeight}
  }
  else 
  {
    return {left:window.pageXOffset, top:window.pageYOffset, width:window.innerWidth, height:window.innerHeight}
  }
};
UI.findPosXY=function(obj){
    var cx=0;
    var cy=0;
    if(obj.offsetParent){
        while(obj.offsetParent){
            cx += obj.offsetLeft;
            cy += obj.offsetTop;
            obj = obj.offsetParent;
        }
    }
    else{
        cx = obj.offsetLeft;
        cy = obj.offsetTop;
    }
    return {"left" : cx, "top": cy};
}
UI.submit=function(f) { 
  var f=document.forms[f];
  if(f.onsubmit && !f.onsubmit()) return;
  f.submit();
};
UI.focus=function(n) { 
  var s=null;
  s = UI.$(n)||document.getElementsByName(n)[0];
  s.focus();
};
UI.$F=function(n) {
  var s=null;
  s = UI.$(n)||document.getElementsByName(n)[0];
  if(s==undefined) return "";
  if(s.type=="checkbox")
  {
    var c=[];
    var r=document.getElementsByName(n);
    for(var i=0;i<r.length; i++) if(r[i].checked) c.push(r[i].value);
    return (c.length>0)?c:"";
  }
  else if(s.type=="radio")
  {
    var r=document.getElementsByName(n);
    for(var i=0;i<r.length; i++) if(r[i].checked) return r[i].value;
    return "";
  }
  return s.value;
};

UI.$FV=function(obj) {
  if(obj==undefined) return "";
  var c=[];
  if(obj.length == undefined) {
      if(obj.checked) c.push(obj.value);
      return (c.length>0)?c:""; 
  } else {
  	  for(var i=0;i<obj.length;i++) if(obj[i].checked) c.push(obj[i].value);
  	  return (c.length>0)?c:"";
  }
  return "";
};

UI.length=function(str,len,tail){
  if(!tail) tail="";
  //str=UI.html2str(str);
  var l=0, c=0, l2=0, u="", s="";
  if(len>0) l2=len; 
  for(var i=0;u=str.charCodeAt(i);i++)
  {
    if (u>127) l+=3;
    else l++;
    if(l2) {
      s+=str.charAt(i); 
      if(l>=l2)
      {
        if(l>l2) s=s.slice(0,-1);
        return s+tail;
      }
    }   
  }
  return l2 ? s:l;
};
UI.html2str=function(s,m){
  var s1=["&amp;","&#39;","&quot;","&lt;","&gt;"];
  var s2=["&","'","\"","<",">"];
  var s3=[];
  if(m) {s3=s1;s1=s2;s2=s3;}
  for(var i in s1) s=s.replace(new RegExp(s1[i],"g"), s2[i]);
  return s;
};
UI.filter=function(str){
  str=str.replace(/&#39;/g,"'"); // '
  str=str.replace(/&quot;/g,"\""); // "
  str=str.replace(/&amp;/g,"&"); // "
  return str;
};
UI.copyText=function(text,msg){
  if(window.clipboardData&&window.clipboardData.setData("Text",text)) 
  {if(msg)alert(msg); return true;}
  return false;
};
UI.getStyle=function(el, style) {
  //prototype.js 
  var value = el.style[style];
  if(!value)
  {
    if(document.defaultView && document.defaultView.getComputedStyle) 
    {
      var css = document.defaultView.getComputedStyle(el, null);
      value = css ? css[style] : null;
    } 
    else if (el.currentStyle) value = el.currentStyle[style];
  }
  return value == 'auto' ? null : value;
};
UI.random=function(min, max){ return Math.floor(Math.random() * (max - min + 1) + min) };

//---
UI.yScrolling=function(cid, millisec1,millisec2, speed, height)
{
  this.cid= cid;
  this.millisec1 = millisec1; //처음시작 텀
  this.millisec2 = millisec2; //실행 텀
  this.speed = speed;     //한번에 이동할 px
  this.height = height;
  
  this.h =0;
  this.div = UI.$(this.cid);
  this.htmltxt = this.div.innerHTML;
  this.div.innerHTML = this.htmltxt+this.htmltxt;
  this.div.isover=false;
  this.div.onmouseover=function(){ this.isover=true; }
  this.div.onmouseout=function(){ this.isover=false; }
  var self =this;
  window.setTimeout(function(){self.play()}, this.millisec1);
}
UI.yScrolling.prototype={
  play : function(){
    var self =this;
    if(!this.div.isover)
    { 
      this.div.scrollTop += this.speed;
      if(this.div.scrollTop >= this.div.scrollHeight/2) 
      {
        this.div.scrollTop=0;
        //this.h=0;
      }
      else(this.height)
      {
        this.h += this.speed;
        if(this.h>=this.height)
        {
          if(this.h>this.height)
          {
            this.div.scrollTop -= this.h % this.height;
            //window.status = this.div.scrollTop +" : "+this.h % this.height;
          }
          this.h=0;
          window.setTimeout(function(){self.play()}, this.millisec1);         
          return;
        }
      }
    }   
    window.setTimeout(function(){self.play()}, this.millisec2);
  }
};
UI.xScrolling=function(cid, perwidth, cnt, millisec1,millisec2, speed)
{
  this.cid= cid;
  this.millisec1 = millisec1; //처음시작 텀
  this.millisec2 = millisec2; //실행 텀
  this.speed = speed;     //한번에 이동할 px
  
  this.div = UI.$(this.cid);
  this.htmltxt = this.div.innerHTML;
  this.div.innerHTML = this.htmltxt + this.htmltxt;
  this.div.style.width = 2 * cnt * perwidth + "px";
  
  
  
  //this.div.innerHTML = '<div style="white-space:nowrap">'+this.htmltxt+this.htmltxt+'<\/div>';
  this.div.isover=false;
  this.div.onmouseover=function(){ this.isover=true; }
  this.div.onmouseout=function(){ this.isover=false; }
  var self =this;
  window.setTimeout(function(){self.play()}, this.millisec1);
}
UI.xScrolling.prototype={
  play : function(){
    if(!this.div.isover)
    { 
      this.div.style.left = eval(this.div.offsetLeft - this.speed) + "px";
      if(-(this.div.offsetLeft) > this.div.offsetWidth/2) {
          this.div.style.left = 0 + "px";
      }     
    }
    var self =this;
    window.setTimeout(function(){self.play()}, this.millisec2);
  }
};
//param : 공통아이디,전체갯수,텀,처음활성화
UI.Rolling=function(cid,count,interval,n) {
  this.cid = cid;
  this.count = count; 
  this.n = (n)?n:"1";
  this.onchange = null;

  for(var k=1; k<=this.count; k++) UI.$(this.cid+"_"+k).style.display="none";
  UI.$(this.cid+"_"+this.n).style.display="block";

  this.div = UI.$(this.cid);//전체div
  this.div.onmouseover=function(){this.isover=true; }
  this.div.onmouseout=function() {this.isover=false;}
  this.btn_next = UI.$("btn_"+this.cid+"_next");
  this.btn_prev = UI.$("btn_"+this.cid+"_prev");

  var self=this;
  if(this.btn_next) this.btn_next.onclick=function(){self.next() }
  if(this.btn_prev) this.btn_prev.onclick=function(){self.prev() }
  if(interval>0) setInterval(function(){self.play()}, interval);
}
UI.Rolling.prototype = {
  play : function() {
    if(this.div.isover) return;
    this.next();
  },
  change :function(){
    if(this.onchange) this.onchange();
  },
  prev :function(){
    UI.$(this.cid+"_"+this.n).style.display="none";
    this.n=(this.n==1)?this.count:--this.n;
    UI.$(this.cid+"_"+this.n).style.display="block";
    this.change();
  },
  next :function(){
    UI.$(this.cid+"_"+this.n).style.display="none";
    this.n=(this.n==this.count)? 1:++this.n;
    UI.$(this.cid+"_"+this.n).style.display="block";
    this.change();
  },
  random : function() {
    var rn=Math.round((this.count-1)*Math.random());
    for(var i=0;i<rn;i++) this.next();
  }
};

UI.RollingX = function(preId, speed, totalcnt, viewcnt) {
	this.frame   = UI.$(preId + "Frame");
    this.obj     = UI.$(preId + "List");
    this.obj.style.width = Math.ceil(totalcnt/viewcnt) * viewcnt * speed + "px";
    
    this.actFalg = false;
    
    this.btn_prev = UI.$("btn_" + preId + "_prev");
    this.btn_next = UI.$("btn_" + preId + "_next");
    
    var self = this;
    var initspeed = speed * viewcnt;
    if(this.btn_prev) this.btn_prev.onclick = function(){self.play("left", initspeed);}
    if(this.btn_next) this.btn_next.onclick = function(){self.play("right", initspeed);}
} 
UI.RollingX.prototype = {
    play : function(dir, speed) {
        if(!this.actFlag) {
            if(dir == "left") {
                this.prev(speed);
            } else if(dir == "right") {
                this.next(speed);
            }
        }    
    },
    
    prev : function(speed) {
        if(this.obj.offsetLeft < 0 && speed > 0) {
            this.actFlag = true;
            var len = Math.ceil(speed/3);
            var nextspeed = speed-len;
            this.obj.style.left = eval(this.obj.offsetLeft + len) + "px";
            
            var self = this;
            window.setTimeout(function(){self.prev(nextspeed)}, 50);
        } else {
            this.actFlag = false;
        }
    },
    
    next : function(speed) {
        if((this.obj.offsetLeft+this.obj.offsetWidth) > this.frame.offsetWidth && speed > 0) {
            this.actFlag = true;
            var len = Math.ceil(speed/3);
            var nextspeed = speed-len;
            this.obj.style.left = eval(this.obj.offsetLeft - len) + "px";
            
            var self = this;
            window.setTimeout(function(){self.next(nextspeed)}, 50);
        } else {
            this.actFlag = false;
        }
    }
};

UI.RollingX2 = function(preId, speed, totalcnt, viewcnt) {
    this.frame   = UI.$(preId + "Frame");
    this.obj     = UI.$(preId + "List");
    this.obj.style.width = Math.ceil(totalcnt/viewcnt) * speed + "px";
    this.actFalg = false;
    
    this.btn_prev = UI.$("btn_" + preId + "_prev");
    this.btn_next = UI.$("btn_" + preId + "_next");
    
    var self = this;
    var initspeed = speed ;
    if(this.btn_prev) this.btn_prev.onclick = function(){self.play("left", initspeed);}
    if(this.btn_next) this.btn_next.onclick = function(){self.play("right", initspeed);}
} 
UI.RollingX2.prototype = {
    play : function(dir, speed) {
        if(!this.actFlag) {
            if(dir == "left") {
                this.prev(speed);
            } else if(dir == "right") {
                this.next(speed);
            }
        }    
    },
    
    prev : function(speed) {
        if(this.obj.offsetLeft < 0 && speed > 0) {
            this.actFlag = true;
            var len = Math.ceil(speed/3);
            var nextspeed = speed-len;
            this.obj.style.left = eval(this.obj.offsetLeft + len) + "px";
            
            var self = this;
            window.setTimeout(function(){self.prev(nextspeed)}, 50);
        } else {
            this.actFlag = false;
        }
    },
    
    next : function(speed) {
        if((this.obj.offsetLeft+this.obj.offsetWidth) > this.frame.offsetWidth && speed > 0) {
            this.actFlag = true;
            var len = Math.ceil(speed/3);
            var nextspeed = speed-len;
            this.obj.style.left = eval(this.obj.offsetLeft - len) + "px";
            
            var self = this;
            window.setTimeout(function(){self.next(nextspeed)}, 50);
        } else {
            this.actFlag = false;
        }
    }
};

UI.RollingY = function(preId, speed, totalcnt, viewcnt) {
    this.frame     = UI.$(preId + "Frame");
    this.obj       = UI.$(preId + "List");
    this.obj.style.height = Math.ceil(totalcnt/viewcnt) * viewcnt * speed + "px";
    this.actFalg   = false;
    
    this.btn_up = UI.$("btn_" + preId + "_up");
    this.btn_down = UI.$("btn_" + preId + "_down");
    
    var self = this;
    var initspeed = speed * viewcnt;
    if(this.btn_up) this.btn_up.onclick = function(){self.play("up", initspeed);}
    if(this.btn_down) this.btn_down.onclick = function(){self.play("down",initspeed);}
} 
UI.RollingY.prototype = {
    play : function(dir, speed) {
    	if(!this.actFlag) {
            if(dir == "up") {
                this.up(speed);
            } else if(dir == "down") {
                this.down(speed);
            }
        }    
    },
    
    up : function(speed) {
        if(this.obj.offsetTop < 0 && speed > 0) {
            this.actFlag = true;
            var len = Math.ceil(speed/3);
            var nextspeed = speed-len;
            this.obj.style.top = eval(this.obj.offsetTop + len) + "px";
            
            var self = this;
            window.setTimeout(function(){self.up(nextspeed)}, 50);
        } else {
            this.actFlag = false;
        }
    },
    
    down : function(speed) {
    	if((this.obj.offsetTop+this.obj.offsetHeight) > this.frame.offsetHeight && speed > 0) {
            this.actFlag = true;
            var len = Math.ceil(speed/3);
            var nextspeed = speed-len;
            this.obj.style.top = eval(this.obj.offsetTop - len) + "px";
            
            var self = this;
            window.setTimeout(function(){self.down(nextspeed)}, 50);
        } else {
            this.actFlag = false;
        }
    }
};


UI.Tab=function(cid,count,start,click){
  this.cid=cid;
  this.count=count;
  this.n=start; 
  //mouseover 이벤트 추가
  var img=null;
  for(var i=1; i<=count; i++)
  {
    var img=UI.$("img_"+cid+"_"+i);
    img.n=i;
    img.style.cursor = "pointer";
    var self=this;
    if(!click) img.onmouseover=function(){ self.on(this.n) }
    else img.onclick=function(){ self.on(this.n) }
  }
  this.on(this.n);//초기화
}
UI.Tab.prototype = {
  on : function(n){
    for(var k=1; k<=this.count; k++)
    {
      try
      {
        UI.$("div_"+this.cid+"_"+k).style.display="none";
      }catch(e) {}
      UI.$("img_"+this.cid+"_"+k).src=UI.$("img_"+this.cid+"_"+k).src.replace("_on.","_off.");
    }
    try
    {    
       UI.$("div_"+this.cid+"_"+n).style.display="block";
    }catch(e) {}        
    UI.$("img_"+this.cid+"_"+n).src=UI.$("img_"+this.cid+"_"+n).src.replace("_off.","_on.");
  }
};
//2007-10-29
UI.Tab2=function(cid,count,options){
  this.options={
    snum:1,         //시작번호
    event_type:'mouseover', //mouseover,click
    menu_type:'img',    //img,css
    class_over:'on',   //over 시 css
    onChange:null     //변경될때 이벤트
  }
  Object.extend(this.options, options);
  this.cid=cid;
  this.count=count;
  var menu;
  for(var i=1; i<=count; i++)
  {
    menu=UI.$("menu_"+cid+"_"+i);
    menu.n=i;
    menu.css=menu.className;
    var self=this;
    menu['on'+this.options.event_type]=function(){ self.on(this.n) }
  }
  this.on(this.options.snum);
}
UI.Tab2.prototype = {
  on : function(n){
    this.n=n;
    var type=this.options.menu_type;
    for(var k=1; k<=this.count; k++)
    {
      UI.$("div_"+this.cid+"_"+k).style.display="none";
      if(type=='img') UI.$("menu_"+this.cid+"_"+k).src=UI.$("menu_"+this.cid+"_"+k).src.replace("_on.","_off.");
      else UI.$("menu_"+this.cid+"_"+k).className=UI.$("menu_"+this.cid+"_"+k).css;
      
    }
    UI.$("div_"+this.cid+"_"+n).style.display="block";
    if(type=='img') UI.$("menu_"+this.cid+"_"+n).src=UI.$("menu_"+this.cid+"_"+n).src.replace("_off.","_on.");
    else UI.$("menu_"+this.cid+"_"+n).className= this.options.class_over;
    if(this.options.onChange) this.options.onChange.call(this);
  }
};

// 앞뒤 이미지 변경 
UI.Tab3=function(cid,count,options){
  this.options={
    snum:1,         //시작번호
    event_type:'click', //mouseover,click
    onChange:null     //변경될때 이벤트
  }
  Object.extend(this.options, options);
  this.cid=cid;
  this.count=count;
  var img = null;
  for(var i=1; i<=count; i++)
  {
  	img=UI.$("img_"+cid+"_"+i);
    img.n=i;
    img.style.cursor = "pointer";
    var self=this;
    if(this.options.event_type != "click") img.onmouseover=function(){ self.on(this.n) }
    else img.onclick=function(){ self.on(this.n) }
  }
  this.on(this.options.snum);
}
UI.Tab3.prototype = {
  on : function(n){
  	this.n=n;
    var type=this.options.menu_type;
    var reg = /_off\d+./i;
    for(var k=1; k<=this.count; k++)
    {
      UI.$("div_"+this.cid+"_"+k).style.display="none";
      UI.$("img_"+this.cid+"_"+k).src=UI.$("img_"+this.cid+"_"+k).src.replace(reg,"_off.");
      UI.$("img_"+this.cid+"_"+k).src=UI.$("img_"+this.cid+"_"+k).src.replace("_on.","_off.");
    }
    UI.$("div_"+this.cid+"_"+n).style.display="block";
    if(n > 1) {
    	UI.$("img_"+this.cid+"_"+(n-1)).src=UI.$("img_"+this.cid+"_"+(n-1)).src.replace("_off.","_off"+n+".");
    } 
    UI.$("img_"+this.cid+"_"+n).src=UI.$("img_"+this.cid+"_"+n).src.replace("_off.","_on.");
    if(n < this.count) {
    	UI.$("img_"+this.cid+"_"+(n+1)).src=UI.$("img_"+this.cid+"_"+(n+1)).src.replace("_off.","_off"+n+".");
    }
    if(this.options.onChange) this.options.onChange.call(this);
  }
};

// 이벤트 메인 탭 이미지 변경 : 2012.02.22
UI.Tab4=function(cid,count,options){
  this.options={
    snum:1,         //시작번호
    event_type:'click', //mouseover,click
    onChange:null     //변경될때 이벤트
  }
  Object.extend(this.options, options);
  this.cid=cid;
  this.count=count;
  var img = null;
  for(var i=1; i<=count; i++)
  {
  	img=UI.$("img_"+cid+"_"+i);
    img.n=i;
    img.style.cursor = "pointer";
    var self=this;
    if(this.options.event_type != "click") img.onmouseover=function(){ self.on(this.n) }
    else img.onclick=function(){ self.on(this.n) }
  }
  this.on(this.options.snum);
}
UI.Tab4.prototype = {
  on : function(n){
  	this.n=n;
    var type=this.options.menu_type;
    var reg = /_off\d+./i;
    for(var k=1; k<=this.count; k++)
    {
      UI.$("div_"+this.cid+"_"+k).style.display="none";
      UI.$("img_"+this.cid+"_"+k).src=UI.$("img_"+this.cid+"_"+k).src.replace(reg,"_off.");
      UI.$("img_"+this.cid+"_"+k).src=UI.$("img_"+this.cid+"_"+k).src.replace("_on.","_off.");
    }
    UI.$("div_"+this.cid+"_"+n).style.display="block";
    if(n > 1) {
    	UI.$("img_"+this.cid+"_"+(n-1)).src=UI.$("img_"+this.cid+"_"+(n-1)).src.replace("_off.","_off.");
    } 
    UI.$("img_"+this.cid+"_"+n).src=UI.$("img_"+this.cid+"_"+n).src.replace("_off.","_on.");
    if(n < this.count) {
    	UI.$("img_"+this.cid+"_"+(n+1)).src=UI.$("img_"+this.cid+"_"+(n+1)).src.replace("_off.","_off.");
    } 
    if(this.options.onChange) this.options.onChange.call(this);
  }
};

UI.ListTab = function(preId, maxlength, options) {
    this.preId = preId;
    this.maxlength = maxlength;
    this.options={
        start:1,
        onchange:null
    }    
    Object.extend(this.options, options);
    for(var i=1;i<=maxlength;i++) {
        var img=UI.$("img_"+preId+"_"+i);
        img.n=i;
        img.style.cursor = "pointer";
        var self=this;
        
        img.onclick=function(){ self.on(this.n); }        
    }
    this.on(this.options.start, false);    
}

UI.ListTab.prototype={
    on : function(n, submit) {
        submit = (submit==undefined) ? true : false;
        for(var k=1; k<=this.maxlength; k++)
        {
          UI.$("img_"+this.preId+"_"+k).src=UI.$("img_"+this.preId+"_"+k).src.replace("_on.","_off.");
          if(submit) {
	          var img=UI.$("img_"+this.preId+"_"+k);
	          img.n=k;
	          img.onclick=function(){ return;}
          }  
        }
        
        var img = UI.$("img_"+this.preId+"_"+n);
        img.src=UI.$("img_"+this.preId+"_"+n).src.replace("_off.","_on.");
        
        var option = "";
        if(option == "") {
            option = (img.getAttribute("categoryId")==undefined) ? "" : img.getAttribute("categoryId");
        }
        if(submit){
            if(this.options.onchange)this.options.onchange(n, option);
        }
    }
}

//----------------------------------------------
//2007-07-24 추가
UI.Move=function(id) {
  this.id=id;
  this.div=UI.$(id);
  this.x= parseInt(UI.getStyle(this.div,'left'))||0;
  this.y= parseInt(UI.getStyle(this.div,'top'))||0;
};
UI.Move.prototype={
  slide : function(pos) {
    this.pos = pos;
    this.pos_n = 0;
    this.speed=0.3;
    this.inteval = 20;
    this.setPos();
    this.playing =true;
    var self=this;
    this.tid=setInterval(function(){self.play()}, this.inteval);
  },
  play : function() {
    this.x += (this.x2-this.x)*this.speed;    
    this.y += (this.y2-this.y)*this.speed;
    this.set(this.x,this.y);
    if(Math.round(this.x)==this.x2 && Math.round(this.y)==this.y2)
    {
      this.x=Math.round(this.x);
      this.y=Math.round(this.y);
      this.set(this.x,this.y);

      if(this.pos_n>=this.pos.length) {this.playing=false; clearInterval(this.tid)}
      else this.setPos();
    }
  },
  setPos:function(){
    var arr=this.pos[this.pos_n].split(",");
    this.x2 = arr[0];
    this.y2 = arr[1];
    this.pos_n++;
  },
  set:function(x,y){
    this.div.style.left = x+"px";
    this.div.style.top = y+"px";
  }
};

//----------------------------------------------
UI.Drag=function(drag, param){

  var el=UI.$(drag);
  el.isdrag=true;
  el.width=0;el.height=0;
  el.area_width=0;el.area_height=0;
  el.handle=null;
  el.move_mode=0; //1:horizontal 2,vertical
  el.limit_top=-1,el.limit_bottom=-1,el.limit_left=-1,el.limit_right=-1;
  
  UI.Drag.setXY(el);

  if(typeof param=="object")
  {
    if(param.handle)
    {
      el.handle=UI.$(param.handle);
      el.isdrag=false;
      el.handle.isdrag=true;
      el.handle.target=el;
    }
    if(param.container)
    {
      UI.$(param.container).style.position="relative";
      el.width=parseInt(UI.getStyle(el,"width")) || el.offsetWidth;
      el.height=parseInt(UI.getStyle(el,"height")) || el.offsetHeight;
      el.area_width=parseInt(UI.getStyle(UI.$(param.container),"width")) || UI.$(param.container).offsetWidth;
      el.area_height=parseInt(UI.getStyle(UI.$(param.container),"height")) || UI.$(param.container).offsetHeight; 
    }

    if(param.move_mode) el.move_mode=param.move_mode;
    if(param.limit_top>-1) el.limit_top=param.limit_top;
    if(param.limit_bottom>-1) el.limit_bottom=param.limit_bottom;
    if(param.limit_left>-1) el.limit_left=param.limit_left;
    if(param.limit_right>-1) el.limit_right=param.limit_right;

    if(typeof param.onStart=="function") el.onStart=param.onStart;
    if(typeof param.onStop=="function") el.onStop=param.onStop;
    if(typeof param.onDrag=="function") el.onDrag=param.onDrag;
  }
  this.obj=el;
};
UI.Drag.setXY=function(el){
  var pos=UI.getPosition(el);
  el.x=parseInt(UI.getStyle(el,"left"));
  el.y=parseInt(UI.getStyle(el,"top"));
  if(isNaN(el.x)) el.x=pos.x;
  if(isNaN(el.y)) el.y=pos.y;
};
UI.Drag.start=function(event){
  var e=event || window.event; var el=e.target || e.srcElement;
  if(!el.isdrag) return;
  if(el.target) el=el.target;
  
  _uiDrag.obj=el;
  UI.Drag.setXY(el);

  _uiDrag.gx = e.clientX;
  _uiDrag.gy = e.clientY;

  if(el.onStart) el.onStart.call(el);
  if(el.onStop) _uiDrag.onStop=el.onStop;
  if(el.onDrag) _uiDrag.onDrag=el.onDrag;
};
UI.Drag.move=function(event){
  var e=event || window.event; var el=e.target || e.srcElement;

  var drag=_uiDrag.obj;
  if(drag)
  {
    var top =drag.y + e.clientY - _uiDrag.gy;
    var left=drag.x + e.clientX - _uiDrag.gx;

    if(drag.area_width && drag.area_height)
    {
      if(top<=0) top=0;
      else if(top >= drag.area_height-drag.height) top=drag.area_height-drag.height; 
      if(left<=0) left=0;
      else if(left >= drag.area_width-drag.width) left=drag.area_width-drag.width; 
    }
    if(drag.limit_top>-1 && top<drag.limit_top) top=drag.limit_top;
    if(drag.limit_bottom>-1 && top>drag.limit_bottom) top=drag.limit_bottom;
    if(drag.limit_left>-1 && left<drag.limit_left) left=drag.limit_left;
    if(drag.limit_right>-1 && left>drag.limit_right) left=drag.limit_right;
    
    if(!drag.move_mode || drag.move_mode==2) drag.style.top = top+"px";
    if(!drag.move_mode || drag.move_mode==1) drag.style.left = left+"px"; 
  }
  if(_uiDrag.onDrag) _uiDrag.onDrag.call(drag);
};
UI.Drag.end=function(event){
  if(_uiDrag.onStop) _uiDrag.onStop.call(_uiDrag.obj);
  _uiDrag.obj=null; 
  _uiDrag.onStop=null;
  _uiDrag.onDrag=null;
};

//전역변수
var _uiDrag={};
//UI.addEvent(document, "mousedown", UI.Drag.start );
//UI.addEvent(document, "mousemove", UI.Drag.move );
//UI.addEvent(document, "mouseup", UI.Drag.end );





//2007-08-02
UI.setClip=function(s,m){
  try{
    var swf=null;
    if(navigator.appName.indexOf("Microsoft")!=-1) swf=window['UIclipSwf'];
    else swf=document['UIclipSwf'];
    swf.setClip(s);alert(m);
  }catch(e){
    alert("해당 브라우저에서는 지원하지 않습니다.");
  }
}
UI.setClip.url='/static/clip.swf';
UI.setClip.print=function()
{
  document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="1" height="1" id="UIclipSwf"><param name="allowScriptAccess" value="always" /><param name="movie" value="'+UI.setClip.url+'" /><embed src="'+UI.setClip.url+'" width="1" height="1" name="UIclipSwf" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>');
}


UI.setOpacity=function(el,value){
  el.style.filter="alpha(opacity="+value+")";
  el.style.opacity=(value/100);
  el.style.MozOpacity=(value/100);
  el.style.KhtmlOpacity=(value/100);
};

UI.getPosition=function(el)
{
  var left=0,top=0;
  while(el)
  {
    left+=el.offsetLeft || 0;
    top+=el.offsetTop || 0;
    el=el.offsetParent;
  }
  return {'x': left, 'y': top};
}


UI.indexOf=function(arr,s){
  for(var i=0;i<arr.length; i++) if(arr[i]==s) return i;
  return -1;
};

/* */
UI.Ajax = function(url, params, method, oncomplete , onerror) {
  this.url = url;
  this.params = params;
  this.oncomplete = oncomplete;
  this.onerror = onerror;
  this.method = method;
  this.send();
};
UI.Ajax.prototype={

  getHttpRequest:function(){
    var req=null;
    try { req = new XMLHttpRequest(); }
    catch(e)
    {
      try { req = new ActiveXObject("Msxml2.XMLHTTP"); }
      catch(e)
      {
        try { req = new ActiveXObject("Microsoft.XMLHTTP"); }
        catch(e) { }
      }
    }
    return req;
  },
  send:function(){
    this.req = this.getHttpRequest();
    var httpMethod = this.method ? this.method: 'GET';
    if (httpMethod != 'GET' && httpMethod != 'POST') httpMethod = 'GET';
    var httpParams = (this.params == null || this.params == '') ? null: this.params;
    var httpUrl = this.url;
    if (httpMethod == 'GET' && httpMethod != null) httpUrl = httpUrl+"?"+httpParams;
    this.req.open(httpMethod, httpUrl, true);
    this.req.setRequestHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8');
    var self = this;
    this.req.onreadystatechange = function() {
      self.onStateChange.call(self);
    }
    this.req.send(httpMethod == 'POST' ? httpParams: null);
  },
  onStateChange: function() {
    if(this.req.readyState==4)
    {
      if(this.req.status=="200") {
      	if(this.oncomplete != null) this.oncomplete(this.req); 
      }
      else
      {
        if(this.onerror) this.onerror(this.req);
        else alert("서버에러입니다! 잠시후에 다시 시도하세요!");
      }       
    }
  }
};

UI.StringBuffer=function(){this.buffer=new Array()}
UI.StringBuffer.prototype={append:function(s){this.buffer.push(s)},toString:function(){return this.buffer.join("")}};


// 메일 도메인 선택 
UI.MailDomain = function() {}
UI.MailDomain.prototype = {
	domains : new Array(),
	addDomain : function(domain) {
        this.domains.push({domain:domain});
    }
}

UI.MailDomainSelect = function(domains){
	this.domains = domains;
}
UI.MailDomainSelect.prototype = {
	domains : null,
    display : function(options) {
		this.options={
			objname        : 'mail_addr',  
			objid          : 'mailDomainSelect',
			objselectboxid : 'mail_senderaddr',
			value          : '',
			style          : ''
		}
		Object.extend(this.options, options);
        if(this.domains.length <= 0) return;
        this.objname = this.options.objname;
        var sf = new UI.StringBuffer();
        sf.append("<select id='"+this.options.objselectboxid+"' onchange='"+this.options.objid+".change(this.value)'>");
        sf.append("<option value=''>선택</option>");
        for(var i=0;i<this.domains.length;i++) {
           sf.append("<option value='"+this.domains[i].domain+"'>"+this.domains[i].domain+"</option>");
        }
        sf.append("</select>");
        sf.append(" <input type='text' name='"+this.options.objname+"' class='text' style='display:none;"+this.options.style+"'>");
        document.write(sf.toString());
        this.init(this.options.value);
    },
    init : function(v) {
        var obj = UI.$(this.options.objselectboxid);
    	for(var i=0;i<obj.length;i++) {
    		if(obj[i].value == v) {
    			
    			obj[i].selected = true;
    			break;
    		}
    	}
    	this.change(v);
   },
    change : function(v) {
        if(v == "") {
            UI.$(this.options.objname).value = "";
            UI.$(this.options.objname).style.display = "none";
        } else if(v == "직접입력") {
            UI.$(this.options.objname).value = "";
            UI.$(this.options.objname).readOnly = false;
            UI.$(this.options.objname).style.display = "";
            UI.focus(this.options.objname);
        } else {
            UI.$(this.options.objname).value = v;
            UI.$(this.options.objname).style.display = "none";
            UI.$(this.options.objname).readOnly = true;
        }
    }
}


function _jsRegularExp(chk,frm,msg){
  var strValue =  frm.value;
  var bitExp = false;
   
  switch (chk){
    case "id" :
      if (frm.value.match(/[A-Za-z0-9_\-]{4,15}\w*/g)!=strValue){break;}
      bitExp = true;
    case "password" :
      if (frm.value.length < 4 || frm.value.length > 12){
        msg = "비밀번호는 4-12자리만 가능합니다.";
      }
      if (frm.value.match(/[A-Za-z0-9]{4,12}\w*/g)!=strValue){break;}
      bitExp = true;
    case "name" :
      if (frm.value.match(/[가-힝]{1,20}\w*/g)!=strValue){break;}
      bitExp = true;
    case "enname" :
      if (frm.value.match(/[A-Z\s]{1,20}\w*/g)!=strValue){break;}
      bitExp = true;
    case "passportno" :
      if (frm.value.match(/[A-Z0-9]{4,16}\w*/g)!=strValue){break;}
      bitExp = true;
    case "wholecardno" :
      if (frm.value.match(/[0-9]{4,4}\w*/g)!=strValue){break;}
      bitExp = true;
    case "airnm" :
      if (frm.value.match(/[A-Z0-9]{5,8}\w*/g)!=strValue){break;}
      bitExp = true;
    case "email" :
      if (frm.value.match(/[\w\-|\.]+\@[\w\-]+(\.[\w\-]+)+/g)!=strValue){break;}
      bitExp = true;
    case "number" :
      if (frm.value.match(/\d+/g)!=strValue){ break;}
      bitExp = true;
    case "phone" :
      if (frm.value.match(/[0-9]{2,3}\-[0-9]{3,4}\-[0-9]{4}/g)!=strValue){break;}
      bitExp = true;
    case "mphone" :
      if (frm.value.match(/01[016789]\-[0-9]{3,4}\-[0-9]{4}/g)!=strValue){ break;}
      bitExp = true;
    case "date" :
      if (frm.value.match(/[0-9]{4}\-[0-9]{2}\-[0-9]{2}/g)!=strValue){break;}
      bitExp = true;
    case "homepage" :
      if (frm.value.match(/\w+:\/\/[^#]*/g)!=strValue){    break;}
      bitExp = true;
    case "checked" :
      if (typeof(frm)=="object"){
        if (typeof(frm.length)=="undefined"){
          if (frm.checked) { bitExp = true; }
        }
        else{
          for (i = 0 ; i < frm.length; i++){
            if (frm[i].checked){  bitExp = true;    }
          }
        }
      }
      break;
    case "selected" :
      if ((frm.value=="")||(frm.value=="*")){ break ;}
      bitExp = true;
    case "none" :
      if (frm.value==""){ break ;}
      bitExp = true;
    case "idn1" :
      if (frm.value.match(/[0-9]{6}/g)!=strValue){ break; }
      bitExp = true;
    case "idn2" :
      if (frm.value.match(/[0-9]{7}/g)!=strValue){break; }
      bitExp = true;
    case "frn" :  //  foreigner registration number
      if (frm.value.match(/[0-9]{13}/g)!=strValue){break; }
      bitExp = true;
    case "company" :
      if (frm.value.match(/[0-9]{3}\-[0-9]{2}\-[0-9]{5}/g)!=strValue){break;}
      bitExp = true;  
    case "javascript" :
      if (frm.value.match(/(javascript)/i)!=null){break;}
      bitExp = true;
    case "script" :
      if (frm.value.match(/(script)/i)!=null){break;}
      bitExp = true;
    default : //공백체크
      if (frm.value.match(/\S/)==null){break;}
      bitExp = true;
  }
  if (!bitExp){ if (msg) alert(msg);if ((chk!="checked")&&(chk!="selected")&&(chk!="email")){frm.focus();};  return false;  }
  else{return true;}
}

datez = new Date();

function _jsGetDateYear(obj,data){
  try{
    var old_data = data.substr(0,4);
    var sY = parseInt(datez.getYear());
    var inum = 1;
    for (y=sY-15 ;  y <= sY+15  ; y++){
      var option1 = new Option(""+y,""+ y);
      obj.options[inum] = option1;
      if (y==Math.ceil(old_data)){
        obj.options[inum].selected = true;
      }
      inum++;
    }
  }
  catch (e) { }
}

function _jsGetDateMonth(obj) {
  try{
    var inum = 1;
    for (m=1 ; m <= 12 ; m++){

      mm = String(m);

      if (mm.length==1){
        mm = "0"+mm;
      }

      var option1 = new Option(""+mm,""+ mm);
      obj.options[inum] = option1;
      inum++;
    }
    obj.fireEvent('onchange');
  }
  catch (e) { }
}

function _jsGetDateDay(objYear, objMonth, objTrg){
  try{
    days = 31;
    var _curDate = new Date();
    var _curYear = _curDate.getFullYear();
    try { _curYear = parseInt(objYear.options[objYear.selectedIndex].value); } catch(e) {};
    var nowmonth = objMonth.options[objMonth.selectedIndex].value;
    if (nowmonth == "02") {
      days = 28;
      if ( _curYear % 4 == 0 ) {
        if ( _curYear % 100 == 0 ) {
          if ( _curYear % 400 == 0 ) days = 29;
        } else
          days = 29;
      }
    } else if ( "04,06,09,11".indexOf( nowmonth ) > -1 ) {
      days = 30;
    }
    var inum = 1;

    for (i=objTrg.length; i>=1; i--){
      objTrg.options[i] = null;
    }

    for (d=1 ; d <= days ; d++){

      dd = String(d);
      if (dd.length==1){
        dd = "0"+d;
      }

      var option1 = new Option(""+dd,""+ dd);
      objTrg.options[inum] = option1;
      inum++;
    }
  }
  catch (e) { 
    objTrg.options[0].selected = true;
  }
}
/**
 * 객체의 문자를 대문자로 치환한다
 * 
 * @param obj 치환할 객체
 */
function _toUpperCase( obj ) {
  var tmpObj = obj;

  if ( tmpObj == undefined )
    tmpObj = event.srcElement;

  if ( typeof tmpObj == 'object' && tmpObj.value != undefined ) 
    tmpObj.value = tmpObj.value.toUpperCase();
}



//  텍스트 필드 디폴트 메세지 사라지게
function clearText(thefield){
    if (thefield.defaultValue==thefield.value)
        thefield.value = "";
}

function defaultText(thefield, msg){
    if (thefield.value.trim() == "")
        thefield.value = msg;
}  

//  빠른쇼핑
//function showQuickFast() {

//}	
function closeFastShopping(){
	parent.document.getElementById('fastShopping').style.display='none'
}

//  브랜드맵 바로보기
/*
function showQuickBrand() {
	if(document.getElementById('fastBrand').style.display == "block")
		document.getElementById('fastBrand').style.display='none';
	else
		document.getElementById('fastBrand').style.display='block';
		document.getElementById('fastShopping').style.display='none';
}
*/

/*
*	브랜드맵 열고 닫기
*/
var brandMap_iframeID = "brandMapIframe";
var brandMap_layerID = "brandMapLayer";
var brandMap_flashID = "brandMap";


//	브랜드 맵 swf 객체 얻기
function getBrandMapSWF(movieName) 
{
	if (navigator.appName.indexOf("Microsoft") != -1) //explore
	{
		return window.frames[brandMap_iframeID].document[movieName];
	} 
	else //netscape
	{
		return document.getElementById(brandMap_iframeID).contentDocument[movieName];
	}
}

//GNB에서 브랜드맵 버튼 클릭(열기,닫기)할때 호출되는 함수
function showQuickBrand()
{	
	var layer = document.getElementById(brandMap_layerID);
	var iframe = document.getElementById(brandMap_iframeID);
	//layer.style.filter = "Alpha(Opacity=100)";
	iframe.src = X2UrlBS + "/BrandMapLNB-View";

	iframe.width = 800;	//iframe 사이즈 조절
	layer.style.width = 800;	//레이어 사이즈 조절

	//alert(getBrandMapSWF(brandMap_flashID));
	//getBrandMapSWF(brandMap_flashID).externalOpen();	//플래시 열기 요청
}


//닫기
function hiddenQuickBrand()
{
	getBrandMapSWF(brandMap_flashID).externalClose();	// 플래시 닫기 요청
}

// 브랜드맵의 닫기모션 끝에서 호출되는 함수
function closeMotionFinished()
{
	window.parent["navi"].externalClose();//메인 혹은 서브 네비에 ioOpen = false 설정해준다

	var layer =  window.parent[brandMap_layerID];
	var iframe = window.parent.document.getElementById(brandMap_iframeID);
	
	layer.style.width = 1;	// 레이어 높이 설정
	iframe.width = 1;	//iframe 사이즈 조절
}


/*
*	빠른쇼핑 열고 닫기
*/
var fast_iframeID = "fastIframe";
var fast_layerID = "fastShoppingLayer";
var fast_flashID = "fastShopping";
var fast_bool = false;

//	빠른 쇼핑 swf 객체 얻기
function getFastSWF(movieName) 
{
	if (navigator.appName.indexOf("Microsoft") != -1) //explore
	{
		return window.frames[fast_iframeID].document[movieName];
	} 
	else //netscape
	{
		return document.getElementById(fast_iframeID).contentDocument[movieName];
	}
}

function showQuickFast()
{
	//var layer = document.getElementById(fast_layerID);
	//alert(fast_bool)	
	if(fast_bool){
		 hiddenQuickFast();
		 fast_bool = false;
		 return;
	}
	 //else{
	
	//if(layer.style.display == "none" || layer.style.display == ""){
		//layer.style.display = "block";
		//document.getElementById(fast_layerID).style.width = 740;		
		//document.getElementById(fast_iframeID).width = 740;	//iframe 사이즈 조절			
		if(document.getElementById("brandMapLayer")){
			if(document.getElementById("brandMapLayer").style.width == "800px"){
				document.getElementById("brandMapLayer").style.zIndex = "5";
				document.getElementById(fast_layerID).style.zIndex = "10";
			}
			else{
				document.getElementById("brandMapLayer").style.zIndex = "5";
				document.getElementById(fast_layerID).style.zIndex = "5";
			}
		}
		else{
			document.getElementById("brandMapLayer").style.zIndex = "5";
			document.getElementById(fast_layerID).style.zIndex = "5";
		}		
		
		document.getElementById(fast_layerID).style.height = 800;		
		document.getElementById(fast_iframeID).height = 800;	//iframe 사이즈 조절	 
		
		document.getElementById(fast_iframeID).src = "/handler/FastMap-View?tracking=DFS_MAIN_QUIKSHOP";	
		fast_bool = true;	
		
		
	//}	
		//getFastSWF(fast_flashID).externalOpen();	//플래시 열기		
	//}else{
	//	layer.style.display = "none";
	//}
}

/*
*	빠른 쇼핑 닫기
*/
function hiddenQuickFast()
{	
	//document.getElementById(fast_iframeID).height = 1 + "px";	//iframe 사이즈 조절		
	getFastSWF(fast_flashID).externalClose();	// 플래시에 닫기 요청
	//document.getElementById(fast_iframeID).src = "";	
}

/*
*	빠른쇼핑의 닫기모션 끝에서 플래시에서 호출하는 함수
*	iframe에서 사용된다. 즉 fastShopping.html은 상위 객체
*/ 
function fastCloseMotionFinished()
{
	window.parent.fast_bool = false;	//상위 fast_bool 닫기(false)로 설정

	var layer =  window.parent[fast_layerID];
	var iframe = window.parent.document.getElementById(fast_iframeID);
	
	//layer.style.width = 1;	// 레이어 넓이 설정
	//iframe.width = 0;
	layer.style.height = 1;	// 레이어 높이 설정
	iframe.height = 0;
}

function checkByte(input, limit){
	var limitbyte  = limit;
	var totalbyte  = 0;
	var bytestr    = input.value;
	for(var i=0; i<bytestr.length; i++){
		var currbyte  = bytestr.charCodeAt(i);
		if(currbyte > 128) totalbyte += 3;
		else totalbyte++;
	}
	if(totalbyte > limitbyte){
		alert("입력 제한 글자 수를 초과하였습니다.");
		input.value   = UI.length(bytestr,limitbyte);
		input.focus();
		return false;
	}
	return true;
}

/*
 * 페이지 내 input text 박스 및 textarea 값의 태그 제거
 */
function removeTagsFromPage(){
    var inputTxt = document.getElementsByTagName("input");
    var areaTxt = document.getElementsByTagName("textarea");
    if(inputTxt.length!=undefined){
        for(var i=0; i<inputTxt.length; i++){
            if(inputTxt[i].type=="text"){
                inputTxt[i].value = removeTags(inputTxt[i].value);
            }
        }
    }
    if(areaTxt.length!=undefined){
        for(var i=0; i<areaTxt.length; i++){
            areaTxt[i].value = removeTags(areaTxt[i].value);
        }
    }
}
/*
 * 입력 폼 값 태그 제거
 */
function removeTags(str) { 
    return str.replace(/<[^>]+>/g, "");  
}


// QUICK LINK 스크립트 
var scroll_pixel,div_pixel,gtpos,gbpos,loop,moving_spd;
var top_margin = 128;         /// 창의 맨위와의 여백 내려올때
var top_margin2 = 128;      /// 창의 맨위와의 여백 올라올때
var speed = 15;            /// 점차 줄어드는 속도를 위한 설정
var speed2 = 15;           /// setTimeout을 위한 속도 설정
var moving_stat = 0;      /// 메뉴의 스크롤을 로딩시 on/off설정 1=움직임 0은 멈춤
 
function check_scrollmove()
{
	
  		scroll_pixel = document.documentElement.scrollTop;
        gtpos = document.documentElement.scrollTop+top_margin;
       
        gbpos = document.documentElement.scrollTop+top_margin2;
        
  		if(document.getElementById("Quick_id").style.pixelTop < gtpos)
        {
         moving_spd = (gbpos-document.getElementById("Quick_id").style.pixelTop)/speed;
         document.getElementById("Quick_id").style.pixelTop += moving_spd;
        }
        if(document.getElementById("Quick_id").style.pixelTop > gtpos)
        {
         moving_spd = (document.getElementById("Quick_id").style.pixelTop-gtpos)/speed;
         document.getElementById("Quick_id").style.pixelTop -= moving_spd;
        }
        
        if(document.getElementById("Quick_id").style.pixelTop == gtpos){
        	clearTimeout(loop);
        }
        loop = setTimeout("check_scrollmove()",speed2);
}
function moving_control() 
{
  if(!moving_stat){ check_scrollmove(); moving_stat = 1;}
        else{ clearTimeout(loop); moving_stat = 0; document.getElementById("Quick_id").style.pixelTop = top_margin;}
}
// QUICK LINK 스크립트  End


function timeresult(){
	if(document.getElementById('orderTime').style.display == 'block'){
		document.getElementById('iframe_orderTime').src = "about:blank";
		document.getElementById('orderTime').style.display='none';    	
	}
	else{
		document.getElementById('iframe_orderTime').src = "/handler/TimeResult";
		document.getElementById('orderTime').style.display='block';    	
	}
}

// IE6 PNG 포멧 이미지 처리 함수
function setPng24(obj) { 
    if ((navigator.userAgent.toUpperCase().indexOf('MSIE 7')>-1) || (navigator.userAgent.toUpperCase().indexOf('MSIE 8')>-1)) { return; }
	obj.width=obj.height=1; 
    obj.className=obj.className.replace(/\bpng24\b/i,''); 
    obj.style.filter = 
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');" 
    obj.src='';  
    return ''; 
} 