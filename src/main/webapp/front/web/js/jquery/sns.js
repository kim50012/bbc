
//sns이벤트 시작

function snsEvent(type,eventTitle,eventImg){
	if(type == "T"){
		goEventTwitter(eventTitle);
	}else if(type == "F"){
		goEventFaceBook(eventTitle,eventImg);
	}
}


//<%-- Twitter --%>
function goEventTwitter(eventTitle){
	var localUrl     = location.href;
	
	if (localUrl.indexOf("local.m.ssgdfs.com") != -1 ) {
		localUrl = localUrl.split("local.m.ssgdfs.com:8080").join("www.ssgdfs.com");
	}else if (localUrl.indexOf("dev-m.ssgdfs.com") != -1 ) {
		localUrl = localUrl.split("dev-m.ssgdfs.com").join("www.ssgdfs.com");
	}else if (localUrl.indexOf("m.ssgdfs.com") != -1 ) {
		localUrl = localUrl.split("m.ssgdfs.com").join("www.ssgdfs.com");
	}
	
	var eventUrl  = encodeURIComponent(localUrl);
	var eventName = encodeURIComponent("[" + eventTitle + "]");
   
	var url      = "http://twitter.com/intent/tweet?text="+eventName+"&url="+eventUrl;
   var result = window.open(url, 'twitter', 'width=466, height=356');
   if (result) {
       result.focus();
   }
   return false;
}
 
//<%-- facebook --%>
function goEventFaceBook(name, image){
   var url     = location.href;
	if (url.indexOf("local.m.ssgdfs.com") != -1 ) {
		url = url.split("local.m.ssgdfs.com:8080").join("www.ssgdfs.com");
	}else if (url.indexOf("dev-m.ssgdfs.com") != -1 ) {
		url = url.split("dev-m.ssgdfs.com").join("www.ssgdfs.com");
	}else if (url.indexOf("m.ssgdfs.com") != -1 ) {
		url = url.split("m.ssgdfs.com").join("www.ssgdfs.com");
	}    
   var title   = "[SHINSEGAE DUTY FREE]" + name;
   var summary = "[SHINSEGAE DUTY FREE]";
   var url     = "http://www.facebook.com/sharer.php?s=100&p[url]=" + url + "&p[images][0]=" + image + "&p[title]=" + title + "&p[summary]=" + summary;
   url = url.split("#").join("%23");
   url = encodeURI(url);
   window.open(url);
   return false;
}

//sns이벤트 끝