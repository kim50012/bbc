package com.waremec.wpt.admin.domain;


public enum MenuLinkType {
   //*************************************/
	LINK_01_01_01("/admin/portal/main",1,1,1,"主页","店铺目录"),
	LINK_01_01_02("/xxxxxxxxxxxxxxxxx",1,1,2,"主页","创建新公司"),
	LINK_01_01_03("/admin/shop/shopCreate",1,1,3,"主页","创建新店铺"),
	//*************************************/
	LINK_02_01_01("/admin/custCurrent/list",2,1,1,"客户管理","客户现况"),
	LINK_02_01_02("/admin/cust/cust",2,1,2,"客户管理","客户筛选"),
	LINK_02_01_03("/admin/grade/list",2,1,3,"客户管理","等级管理"),
	LINK_02_01_04("/admin/pointMst/pointMst",2,1,4,"客户管理","积分管理"),
	LINK_02_01_05("/admin/msgManage/msgManage",2,1,5,"客户管理","消息管理"),
	LINK_02_01_06("/admin/custRatio/custRatio",2,1,6,"客户管理","客户占比分析"),
	//*************************************/
	LINK_03_01_01("/admin/goodsCurrent/list",3,1,1,"店铺管理","微店铺概况"),
	LINK_03_01_02("/admin/wxCustMenu/wxCustMenu",3,1,2,"店铺管理","微信自定义菜单"),
	LINK_03_01_03("/xxxxxxxxxxxxxxxxx",3,1,3,"店铺管理","网站导航"),
	LINK_03_01_04("/admin/shop/shopMainPage",3,1,4,"店铺管理","设定店铺皮肤"),
	LINK_03_01_05("/admin/shopManage/shopMainPageList",3,1,5,"店铺管理","店铺主页"),
	LINK_03_01_12("/admin/shopManage/addCustomPageEditor",3,1,5,"店铺管理","店铺主页"),
	LINK_03_01_13("/admin/shopManage/modifyCustomPageEditor",3,1,5,"店铺管理","店铺主页"),
	LINK_03_01_14("/admin/shopManage/shopNavigation",3,1,11,"店铺管理","店铺导航"),
	LINK_03_01_06("/admin/shopManage/webzineList",3,1,6,"店铺管理","微杂志/页面"),
	LINK_03_01_07("/admin/shopManage/publicControlSet",3,1,7,"店铺管理","公共广告设置"),
	LINK_03_01_08("/admin/shopManage/addUserDefinePageEditor",3,1,8,"店铺管理","自定义页面模块"),
	LINK_03_01_10("/admin/shopManage/modifyUserDefinePageEditor",3,1,8,"店铺管理","自定义页面模块"),
	LINK_03_01_11("/admin/shopManage/userDefinePageList",3,1,8,"店铺管理","自定义页面模块"),
	LINK_03_01_09("/admin/myFile/myFile",3,1,9,"店铺管理","我的文件"),
	LINK_03_01_15("/admin/shopManage/linkList",3,1,15,"店铺管理","链接清单"),
	LINK_03_01_10_01("/admin/shopManage/blogControl",3,1,10,"店铺管理","Blog管理"),
	LINK_03_01_10_02("/admin/blog/preBlogCreate",3,1,10,"店铺管理","Blog添加"),
	LINK_03_01_10_03("/admin/blog/preBlogModify",3,1,10,"店铺管理","Blog修改"),
	//*************************************/
	LINK_04_01_01("/admin/goodsClass/list",4,1,1,"店铺运营","商品发布=>商品分类"),
	LINK_04_01_02_01("/admin/goods/list",4,1,2,"店铺运营","商品发布=>商品登记"),
	LINK_04_01_02_02("/admin/goods/goodsCreate",4,1,2,"店铺运营","商品发布=>商品登记"),
	LINK_04_01_02_03("/admin/goods/goodsModify",4,1,2,"店铺运营","商品发布=>商品登记"),
	LINK_04_01_03_01("/admin/goodsDisplay/goodsDisplay",4,1,3,"店铺运营","商品发布=>普通商品发布"),
	LINK_04_01_03_02("/admin/goods/demo",4,1,3,"店铺运营","商品发布=>普通商品发布"),
	LINK_04_01_03_03("/admin/goods/bpopup",4,1,3,"店铺运营","商品发布=>商品发布"),
	LINK_04_01_03_04("/admin/goods/list",4,1,3,"店铺运营","商品发布=>商品发布"),
	LINK_04_01_03_05("/admin/goods/ueditor",4,1,3,"店铺运营","商品发布=>商品发布"),
	LINK_04_01_03_06("/admin/goods/preDisplayCreate",4,1,3,"店铺运营","商品发布=>商品发布"),
	LINK_04_01_03_07("/admin/goods/preDispalyModify",4,1,3,"店铺运营","商品发布=>商品发布"),
	LINK_04_01_03_09("/admin/goods/preDispalyCopy",4,1,3,"店铺运营","商品发布=>商品发布"),
	LINK_04_01_03_08("/admin/goods/goodsEditor",4,1,3,"店铺运营","商品发布=>商品发布"),
	LINK_04_01_04("/admin/beforeDisplay/beforeDisplay",4,1,4,"店铺运营","商品发布=>预售商品发布"),
	
	LINK_04_02_01("/admin/goodsSell/goodsSell",4,2,1,"店铺运营","商品管理=>出售中商品"),
	LINK_04_02_02("/admin/sellOutGoods/sellOutGoods",4,2,2,"店铺运营","商品管理=>已售罄商品"),
	LINK_04_02_03("/admin/depotGoods/depotGoods",4,2,3,"店铺运营","商品管理=>仓库中商品"),
	
	LINK_04_03_01("/admin/orderBaseCount/orderBaseCount",4,3,1,"店铺运营","订单管理=>订单概况统计"),
	LINK_04_03_02_01("/admin/orders/ordersAll",4,3,2,"店铺运营","订单管理=>所有订单"),
	LINK_04_03_02_02("/admin/orders/ordersAllDlt",4,3,2,"店铺运营","订单管理=>所有订单"),
	LINK_04_03_03("/xxxxxxxxxxxxxxxxx",4,3,3,"店铺运营","订单管理=>维权订单"),
	
	LINK_04_04_01("/admin/transportSheet/transportSheet",4,4,1,"店铺运营","物流管理=>运费标准管理"),
	LINK_04_04_01_01("/admin/transportSheet/transportSheetCreate",4,4,1,"店铺运营","物流管理=>运费标准管理"),
	LINK_04_04_02("/admin/transNotice/transNotice",4,4,2,"店铺运营","物流管理=>交易物流通知"),
	
	LINK_04_05_01("/admin/myIncome/myIncome",4,5,1,"店铺运营","收入/提现=>我的收入"),
	LINK_04_05_02("/admin/incomeDetail/incomeDetail",4,5,2,"店铺运营","收入/提现=>收支明细"),
	
	LINK_04_06_01("/xxxxxxxxxxxxxxxxx",4,6,1,"店铺运营","应用/营销=>优惠奖品设置"),
	LINK_04_06_02_01("/admin/promotion/promotionList",4,6,2,"店铺运营","应用/营销=>促销管理"),
	LINK_04_06_02_02("/admin/promotion/promotionMessList",4,6,2,"店铺运营","应用/营销=>促销留言"),
	LINK_04_06_02_03("/admin/promotion/promotionPublish",4,6,2,"店铺运营","应用/营销=>编辑活动详情"),
	LINK_04_06_03("/admin/checkIn/checkIn",4,6,3,"店铺运营","应用/营销=>签到管理"),
	LINK_04_06_04_01("/admin/vote/voteList.htm",4,6,4,"店铺运营","应用/营销=>投票调查"),
	LINK_04_06_04_02("/admin/vote/voteProblems.htm",4,6,4,"店铺运营","应用/营销=>投票调查"),
	LINK_04_06_05_01("/admin/rouletteActivity/rouletteActivity",4,6,5,"店铺运营","应用/营销=>摇奖活动"),
	LINK_04_06_05_02("/admin/rouletteActivity/updateRouletteActivity",4,6,5,"店铺运营","应用/营销=>摇奖活动"),
	LINK_04_06_05_03("/admin/rouletteActivity/addRouletteActivity",4,6,5,"店铺运营","应用/营销=>摇奖活动"),
	LINK_04_06_06("/admin/voucher/voucher",4,6,6,"店铺运营","应用/营销=>优惠券管理"),
	LINK_04_06_07("/admin/bbsManage/bbsManage",4,6,7,"店铺运营","应用/营销=>BBS申请管理"),
	LINK_04_06_08("/admin/shimEventManage/list.htm",4,6,8,"店铺运营","应用/营销=>活动管理"),
	/*LINK_04_06_09("/admin/buyApplyManage/buyApplyManage",4,6,9,"店铺运营","应用/营销=>购买申请管理"),*/
	//*************************************/
	LINK_05_01_01("/admin/datasCurrent/list",5,1,1,"数据统计","数据概况"),
	LINK_05_01_04("/admin/clientStatus/clientStatus",5,1,4,"数据统计","微店铺概况"),
	LINK_05_01_02("/admin/CopycustCurrent/list",5,1,2,"数据统计","客户现况"),
	LINK_05_01_03("/admin/CopycustRatio/custRatio",5,1,3,"数据统计","客户占比分析"),
	//LINK_05_01_02("/xxxxxxxxxxxxxxxxx",5,1,2,"数据统计","粉丝增减趋势"),
	//LINK_05_01_03("/xxxxxxxxxxxxxxxxx",5,1,3,"数据统计","粉丝层次统计"),
	//LINK_05_01_04("/xxxxxxxxxxxxxxxxx",5,1,4,"数据统计","粉丝基本信息"),
	/*LINK_05_01_04("/admin/clientStatus/clientStatus",5,1,4,"数据统计","微店铺概况"),*/
	LINK_05_01_05("/admin/GoodsStatistics/GoodsStatistics",5,1,5,"数据统计","商品统计"),
	LINK_05_01_06("/admin/CopyorderBaseCount/orderBaseCount",5,1,6,"数据统计","订单概况统计"),
	LINK_05_01_07("/admin/Copyorders/ordersAll",5,1,7,"数据统计","所有订单"),
	LINK_05_01_07_01("/admin/Copyorders/ordersAllDlt",5,1,7,"数据统计","所有订单"),
	LINK_05_01_09("/xxxxxxxxxxxxxxxxx",5,1,9,"数据统计","维权订单"),
	LINK_05_01_10("/admin/imgTextSituationCopy/imgTextSituation",5,1,10,"数据统计","图文群发现况"),
	//*************************************/
	/*LINK_06_01_01("/admin/microCurrent/list",6,1,1,"微信管理","消息概况"),*/
	LINK_05_01_08("/admin/imgTextSituation/imgTextSituation",6,1,8,"微信管理","图文群发现况"),
	//LINK_06_01_01("/admin/custRatio/custRatio",6,1,1,"微信管理","客户占比分析"),
	LINK_06_01_02("/admin/sendMsgAll/sendMsgAll",6,1,2,"微信管理","群发功能"),
	LINK_06_01_02_02("/admin/materialManage/addNewsMaterial",6,1,2,"微信管理","多图文素材管理"),
	LINK_06_01_02_03("/admin/materialManage/modifyNewsMaterial",6,1,2,"微信管理","多图文素材管理"),
	LINK_06_01_03("/admin/autoReply/autoReply",6,1,3,"微信管理","自动回复"),
	LINK_06_01_04("/admin/timeToSend/timeToSend",6,1,4,"微信管理","定时发送任务"),
	LINK_06_01_05("/admin/materialManage/materialManage",6,1,5,"微信管理","图片库"),
	LINK_06_01_06("/admin/msgControl/msgControl",6,1,6,"微信管理","图文消息"),
	LINK_06_01_07("/admin/focusReply/focusReply",6,1,7,"微信管理","关注回复"),
	LINK_06_01_10("/admin/newsInterfaceList/newsInterfaceList",6,1,10,"微信管理","图文信息接口列表"),
	LINK_06_01_09("/admin/materialManage/newMaterialManage",6,1,9,"微信管理","素材管理"),
	//*************************************/
	LINK_07_01_01("/admin/hzmMarke/list",7,1,1,"韩之盟营销网","主页"),
	LINK_07_01_02("/xxxxxxxxxxxxxxxxx",7,1,2,"韩之盟营销网","案例"),
	LINK_07_01_03("/xxxxxxxxxxxxxxxxx",7,1,3,"韩之盟营销网","服务"),
	LINK_07_01_04("/xxxxxxxxxxxxxxxxx",7,1,4,"韩之盟营销网","入驻"),
	LINK_07_01_05("/xxxxxxxxxxxxxxxxx",7,1,5,"韩之盟营销网","关于我们"),
	LINK_07_01_06("/xxxxxxxxxxxxxxxxx",7,1,6,"韩之盟营销网","新手必读"),
	LINK_07_01_07("/xxxxxxxxxxxxxxxxx",7,1,7,"韩之盟营销网","最新活动"),
	LINK_07_01_08("/xxxxxxxxxxxxxxxxx",7,1,8,"韩之盟营销网","微信支付教程");
	//*************************************/
	private String url;
	private int topMenuType;
	private int leftMenuLelel1;
	private int leftMenuLelel2;
	private String leftMenuLelel1Name;
	private String leftMenuLelel2Name;
 
	private MenuLinkType(String url, int topMenuType, int leftMenuLelel1, int leftMenuLelel2, String leftMenuLelel1Name,
			String leftMenuLelel2Name) {
		this.url = url;
		this.topMenuType = topMenuType;
		this.leftMenuLelel1 = leftMenuLelel1;
		this.leftMenuLelel2 = leftMenuLelel2;
		this.leftMenuLelel1Name = leftMenuLelel1Name;
		this.leftMenuLelel2Name = leftMenuLelel2Name;
	}



	public static boolean hasUrl(String url) {
		for (MenuLinkType item : MenuLinkType.values()) {
			 if(url.contains(item.url)){
				 return true;
			 }
		}
		return false;
	}
	
	
	public static int getTopMenuType(String url) {
		for (MenuLinkType item : MenuLinkType.values()) {
			if(url.contains(item.url)){
				return item.topMenuType;
			 }
		}
		return -1;
	}

	public static int getLeftMenuLelel1(String url) {
		for (MenuLinkType item : MenuLinkType.values()) {
			if(url.contains(item.url)){
				return item.leftMenuLelel1;
			 }
		}
		return -1;
	}


	public static int getLeftMenuLelel2(String url) {
		for (MenuLinkType item : MenuLinkType.values()) {
			if(url.contains(item.url)){
				return item.leftMenuLelel2;
			 }
		}
		return -1;
	}




	 

	
}
