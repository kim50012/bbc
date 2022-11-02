//主菜单
function selectMsgSprog(obj,id){
	var $this=$(obj);
	var item = Number(id);
	$(".example").each(function(){
		$(this).removeClass("on").addClass("close_example");
		$(this).find("img").hide();
		$(this).find("span").css("color","black");
		$(this).next().hide();
	});
	$this.find("img").show();
	$this.find("span").css("color","#a4a4a4");
	$this.next().show();
	$this.removeClass("close_example").addClass("on");
	if(id==1){
		$(".exampleBody").css("background-color","#f3f3f3");
		$(".exampleAllDiv").css("width","80%");
		$(".img"+id).css("width","90%");
		$(".img"+id).css("margin-left","5%");
		$(".exampleAllDiv").css("width","80%");
		$(".exampleBodyDiv").css("margin-top","0px");
		$(".exampleBodyDiv").css("width","100%");
		$(".exampleBodyDiv").hide();
		$(".exampleBodyDiv.div"+id).show();
	}else if(id==2||id==3||id==4||id==5||id==6){
		$(".exampleBody").css("background-color","#ffffff");
		$(".exampleContainer").css("background-color","#f3f3f3");
		$(".exampleAllDiv").css("width","100%");
		$(".img"+id).css("width","70%");
		$(".img"+id).css("margin-left","15%");
		$(".exampleBodyDiv.div"+id).css("background-color","#f3f3f3");
		$(".exampleBodyDiv").css("margin-top","30px");
		$(".exampleBodyDiv").hide();
		$(".exampleBodyDiv.div"+id).show();
	}
}
//子菜单
function checkSub(obj,id,num){
	var $this=$(obj);
	var item = Number(id);
	$(".exampleSub"+num).each(function(){
		$(this).css("color","black");
		$(this).css("border-bottom","0px");
	});
	$this.css("color","red");
	$this.css("border-bottom","1px solid red");
	if(num==1){
		$(".img"+num).attr("src","/images/portal/design_0"+id+".png");
	}else if(num==2){
		$(".img"+num).attr("src","/images/portal/cust"+id+".jpg");
		if(id==1){
			$(".path.text"+num).text("该画面系统路径：客户管理>客户筛选");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>可根据基本筛选条件查询客户</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>可以给一个客户设等级、给积分，并查看聊天记录</span></p>"
									+"<p><img alt='' src='/images/portal/ico_3.png' class='ico'><span>可以同时给多个客户设等级、给积分、群发信息</span></p>"
									);
		}else if(id==2){
			$(".path.text"+num).text("该画面系统路径：客户管理>等级管理");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>客户等级制度的创建、编辑</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>客户等级制度的启用和停用</span></p>"
									);
		}else if(id==3){
			$(".path.text"+num).text("该画面系统路径：客户管理>积分管理");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>积分规则的创建、编辑、删除</span></p>");
		}
	}else if(num==3){
		$(".img"+num).attr("src","/images/portal/shopSet"+id+".jpg");
		if(id==1){
			$(".path.text"+num).text("该画面系统路径：店铺管理>设定店铺皮肤");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==2){
			$(".path.text"+num).text("该画面系统路径：店铺管理>店铺主页");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>");
		}else if(id==3){
			$(".path.text"+num).text("该画面系统路径：店铺管理>微信自定义菜单");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>");
		}else if(id==4){
			$(".path.text"+num).text("该画面系统路径：店铺管理>微杂志页面");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>");
		}
	}else if(num==4){
		$(".img"+num).attr("src","/images/portal/shop"+id+".jpg");
		if(id==1){
			$(".path.text"+num).text("该画面系统路径：店铺运营>订单管理>所有订单");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==2){
			$(".path.text"+num).text("该画面系统路径：店铺运营>商品发布>商品分类");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>点击上下按钮可调整分类类别、商品的优先顺序</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>点击只显示一级分类按钮，可显示第一级分类的内容</span></p>"
									+"<p><img alt='' src='/images/portal/ico_3.png' class='ico'><span>分类停用及启用的功能</span></p>"
									+"<p><img alt='' src='/images/portal/ico_4.png' class='ico'><span>创建及重新编辑的功能</span></p>"
									);
		}else if(id==3){
			$(".path.text"+num).text("该画面系统路径：店铺运营>商品发布>商品发布");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==4){
			$(".path.text"+num).text("该画面系统路径：店铺运营>商品发布>商品上架");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==5){
			$(".path.text"+num).text("该画面系统路径：店铺运营>商品管理>出售中商品");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==6){
			$(".path.text"+num).text("该画面系统路径：店铺运营>物流管理>运费标准管理");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>运费模板的新建、编辑、删除功能</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>输入或者选择运费模板进行查询的功能</span></p>"
									);
		}else if(id==7){
			$(".path.text"+num).text("该画面系统路径：店铺运营>收入/提现>收支明细");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}
	}else if(num==5){
		$(".img"+num).attr("src","/images/portal/data"+id+".jpg");
		if(id==1){
			$(".path.text"+num).text("该画面系统路径：数据统计>数据概况");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==2){
			$(".path.text"+num).text("该画面系统路径：数据统计>订单概况统计");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==3){
			$(".path.text"+num).text("该画面系统路径：数据统计>客户现状");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==4){
			$(".path.text"+num).text("该画面系统路径：数据统计>消息概况");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}
	}else if(num==6){
		$(".img"+num).attr("src","/images/portal/wx"+id+".jpg");
		if(id==1){
			$(".path.text"+num).text("该画面系统路径：微信管理>群发消息");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==2){
			$(".path.text"+num).text("该画面系统路径：微信管理>自动回复");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}else if(id==3){
			$(".path.text"+num).text("该画面系统路径：微信管理>素材管理");
			$(".abilityRight.text"+num).html("<p><img alt='' src='/images/portal/ico_1.png' class='ico'><span>功能一</span></p>"
									+"<p><img alt='' src='/images/portal/ico_2.png' class='ico'><span>功能二</span></p>"
									);
		}
	}
		
}
//点击切换模板
var id =1;
function changeImg(num)
{
	id++;
    if (id>= 4)
    {
    	id=1;
    }
    $(".img"+num).attr("src","/images/portal/design_0"+id+".png");
    $(".exampleSub"+num).css("color","black");
    $(".exampleSub"+num).css("border-bottom","0px");
    $(".exampleSub1.sub"+id).css("color","red");
    $(".exampleSub1.sub"+id).css("border-bottom","1px solid red");
}
function addColorSprog(obj){
	$(obj).attr("style","background-color:#fcfcfc;");
}
function removeColorSprog(obj){
	$(obj).attr("style","background-color:#ffffff;");
}