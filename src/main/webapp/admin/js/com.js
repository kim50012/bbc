//全局的ajax访问，处理ajax清求时sesion超时
 $.ajaxSetup({ 
	 type : "POST", 
     contentType : "application/x-www-form-urlencoded;charset=utf-8", 
     complete : function(xhr,textStatus){ 
    	 
    	 //console.log('=======xhr=============');
    	 //console.log(xhr.status);
    	 //console.log(xhr);
    	 //console.log('=======xhr=============');
    	 
     	var sessionstatus=xhr.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头，sessionstatus，
 		if(sessionstatus=="timeout"){ 
 			//如果超时就处理 ，指定要跳转的页面
 			//alert('系统已经自动退出\n请重新登录');
 			//window.top.location.href = '/admin';
 			window.top.location.href = '/admin/error/timeout.htm';
     	} 
	} 
});