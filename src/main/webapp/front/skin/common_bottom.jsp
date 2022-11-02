<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="shopNavigation">
	<section class="shopNavigationMenu">
		<h2>Quick Menu</h2>
		<ul id="j-NavigationList-Target">

		</ul>
	</section>
</div>
<div class="shopNavigationWait">
	<img class="waitImg" alt="" src="/front/skin/main/img/menu/loading.gif" />
</div>		
<script id="tpl_list-search-result" type="text/html">
	{{each naviList}} 
		<li>
			<a id="menu_{{$value.NAVIGATION_ID}}" href="{{$value.URL}}">{{$value.NAME}}</a>
			 <style scoped="scoped" type="text/css">
				#menu_{{$value.NAVIGATION_ID}}:after{background:url('{{$value.IMG_URL}}') no-repeat; background-size: 20px auto; background-position: center;}
			</style>
		</li>
	{{/each}}
</script>

<script type="text/javascript">

	$(function(){
		
		$.ajax({
				//data : {},
				type : "POST",
				url : "/front/main/navigationListData.htm",
				success : function(res) {
					
					if(res.status == "S"){
						
						var list = res.naviList;
						var listCount = list.length;
						var eWidth = Number(100/listCount);

						$('#j-NavigationList-Target').append(template('tpl_list-search-result', res));
						//console.error(template('tpl_list-search-result', res));

						$(".shopNavigationMenu ul li").width(eWidth+"%");
						if (list[0].WORD_COLOR != "") {
							$(".shopNavigationMenu ul li a").css({"background-color":"#"+list[0].BACK_COLOR,"color":"#"+list[0].WORD_COLOR});
						}
						
						$(".shopNavigationWait").fadeOut(1000);
					}else{
						//alert(res.err_msg);
						$(".shopNavigationWait").fadeOut(1000);
					}
					
				},
				error : function(xhr, status, e) {
					//alert("Error : " + status);
					$(".shopNavigationWait").fadeOut(1000);
				}
		});
	});
</script>
 