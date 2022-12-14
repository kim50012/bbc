<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- ▼ Main footer -->
 <style scoped="scoped">
<!--
/*returnTop*/
p#back-to-top{
    position:fixed;
    display:none;
    bottom:40px;
    right:30px;
}
p#back-to-top a{
    text-align:center;
    text-decoration:none;
    color:#d1d1d1;
    display:block;
    width:37px;
    /*使用CSS3中的transition属性给跳转链接中的文字添加渐变效果*/
    -moz-transition:color 1s;
    -webkit-transition:color 1s;
    -o-transition:color 1s;
}
p#back-to-top a:hover{
    color:#979797;
}
p#back-to-top a span{
    background:transparent url(/admin/images/icon/to-top.png) no-repeat  ;
    border-radius:0;
    display:block;
    height:37px;
    width:37px;
    margin-bottom:0;
    /*使用CSS3中的transition属性给<span>标签背景颜色添加渐变效果*/
    -moz-transition:background 1s;
    -webkit-transition:background 1s;
    -o-transition:background 1s;
}
#back-to-top a:hover span{
    background:transparent url(/admin/images/icon/to-top.png) no-repeat  ;
}

-->
</style>
<script>
$(function(){
        //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
        $(function () {
            $(window).scroll(function(){
                if ($(window).scrollTop()>100){
                    $("#back-to-top").fadeIn(1500);
                }
                else
                {
                    $("#back-to-top").fadeOut(1500);
                }
            });

            //当点击跳转链接后，回到页面顶部位置

            $("#back-to-top").click(function(){
                $('body,html').animate({scrollTop:0},1000);
                return false;
            });
        });
    });
</script>
<p id="back-to-top"><a href="#top"><span></span><!-- 返回顶部 --></a></p>  
 <footer class="ui-footer"> 
	<div class="ui-footer-inner clearfix">
		<%
		   String companyName = "HANZHIMENG";
			if(request.getServerName().equals("wechat.waremec.com")){
				companyName = "WareMec";
			} 
			 %>
			 
	
		<span style="font-family:arial; font-weight:bold; color:#696969;">Copyright 2015 <span style="color:#ce102c;"><%=companyName %></span> Co,.Ltd All Right Reserved</span>
	</div>
</footer>
<!-- ▲  Main footer -->