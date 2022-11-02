package com.waremec.wpt.front.action;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.JsonUtil;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.TmplType;
import com.waremec.wpt.admin.domain.dispaly.GoodsDispalyPriceInsert;
import com.waremec.wpt.admin.domain.dispaly.GoodsDisplayInsert;
import com.waremec.wpt.admin.service.GoodsDisplayServcie;
import com.waremec.wpt.admin.service.GoodsServcie;
import com.waremec.wpt.admin.service.ShopService;
import com.waremec.wpt.front.domain.FrontOrder;
import com.waremec.wpt.front.domain.FrontOrderConfirm;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.FavoritesService;
import com.waremec.wpt.front.service.MainService;
import com.waremec.wpt.front.service.OrderConfirmService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("shopAction")
@Scope(ScopeType.prototype)
public class ShopAction extends WeixinBaseAction {
	private static final long serialVersionUID = 1L;
	 
	private String skinType;
	private String shopId;
	private String isReal;
	private String isUsed;
	private String price;
	private String today;
	private String tempId;
	private String goodsId;
	private String displayId;
	private String orderby;
	private String way;
	private String goodsName;
	private String pageId;
	private String listClassName;
	private int pageCurr;
	private int pageUnit;
	private int shopGradeClassId;
	private int brandId;
	private int totalCount;
	private int pageTotalCount;

	
	private String priceOptionId = "";// [商品价格] 价格ID PRICE_OPTION_ID
	private String custSysId = "";// 存储购买用户的ID
	private String addressId = null;// 存储客户的地址ID
	private String areaLevel = "";// 存储地址等级
	private String areaParentId = "";// 存储父类的ID号。
	private String addressProvinceId = "";// 存储联系人地址省的ID
	private String addressCityId = "";// 存储联系人地址市的ID
	private String addressDistrictId = "";// 存储联系人地址区的ID
	private String addressDetail = "";// 存储地址详细信息
	private String receiptopName = "";// 获取收货人姓名
	private String adrMobile = "";// 获取收货人的手机号
	private String jobType = "";// 存储操作类型 --I 插入一条数据，U修改数据。
	private String addressIdSelected = "";// 存储订单确认页面被选中的收货地址ID
	private String transTypeId = "";// 存储邮寄方式 [运费值] 1快递 2EMS 3平邮TRANS_TYPE_ID
	private String custMsg = "";// [订单] 客户的留言 CUST_MSG NVARCHAR
	private String statusId = "";// [订单] 状态：10(默认):未付款;20:已付款;30:已发货;40:已收货;50:已收款 STATUS_ID TINYINT
	private String orderOutId = "";// [订单] 订单号(外部使用) 日期+店铺ID+序列号 ORDER_OUT_ID NVARCHAR
	private String orderTypeId = "";// [订单] (预备)订单类型 1普通 2团购 等 ORDER_TYPE_ID TINYINT
	private String goodsQty = "";// [订单] (统计)商品总数量 GOODS_QTY SMALLINT
	private String priceSum = "";// [订单] (统计)订单总额(折扣后价+运费) PRICE_SUM MONEY
	private String transFee = "";// [订单] 运费 TRANS_FEE MONEY
	private String priceTTBeforeNego = "";// [订单] (统计)折扣前价格 PRICE_TT_BEFORE_NEGO MONEY
	private String priceTTAfterNego = "";// [订单] 折扣后价格 PRICE_TT_AFTER_NEGO MONEY
	private String goodsQtyOne = "";// --[订单商品] 购买数量 SMALLINT 每样商品的购买数量。
	private String goods_qty_num = "";// 接收商品的数量。
	private String custAddrId = "";
	private String couponId = "";
	private String couponItemId = "";
	
	// review
	private String reviewTitle;
	private String reviewImg1;
	private String reviewImg2;
	private String reviewImg3;
	private String reviewImg4;
	private String reviewImg5;
	private String reviewImg6;
	private String reviewImg7;
	private String reviewImg8;
	private String reviewImg9;

	private String reviewImgUrl1;
	private String reviewImgUrl2;
	private String reviewImgUrl3;
	private String reviewImgUrl4;
	private String reviewImgUrl5;
	private String reviewImgUrl6;
	private String reviewImgUrl7;
	private String reviewImgUrl8;
	private String reviewImgUrl9;

	private String startDt = "";
	private String endDt = "";
	private String stockAreaId = "";
	private String gcId = "";
	private String sgcIdSplit = "";
	private String strPriceOrg = "";
	private String strPrice = "";
	private String strSpecId = "";
	private String strSpecValueId = "";
	private String strStock = "";
	private String strFileUrl = "";
	private String strFileNm = "";
	private String strContent = "";	

	private String itemType = "";
	private String itemUrl = "";

	private String orderIndex = "";
	private String orderId = "";
	
	@Resource
	protected MainService mainService;

	@Resource
	private OrderConfirmService orderConfirmService;
	@Resource
	private GoodsDisplayServcie goodsDisplayService;
	@Resource
	private ShopService shopService;
	@Resource
	private GoodsServcie goodsService;
	@Resource
	private FavoritesService favoritesService;

	//●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
	// shop new dev
	//●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
	
	//======================================
	// 홈페이지
	//======================================
	 public String index() {
		 
		jsSdkSttingNormal();

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
//		if(sessionSkin == null){
//			sessionSkin = mainService.getSessionSkinByShopId(sessionMember.getShopId().toString());
//			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
//		}
				
		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassGrade1List",searchMap);
		request.put("classList", classList);
		//品牌
		List<Map<String, Object>> brandList = commonService.selectList("Main.getBrandList",searchMap);
		request.put("brandList", brandList);

		List<Map<String,Object>> bannerList=commonService.selectList("Main.getShopBannerList",searchMap);
		request.put("bannerList", bannerList);
		


		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", 1);
		goodsMap.put("PAGE_UINT", 3);
		goodsMap.put("ORDERBY", "SALES_QTY_DESC");

		List<Map<String, Object>> goodsListTop=commonService.selectList("Main.getGoodsList",goodsMap);
		
		request.put("goodsListTop", goodsListTop);	


		goodsMap.put("PAGE_CURR", 2);
		goodsMap.put("PAGE_UINT", 3);
		goodsMap.put("ORDERBY", "SALES_QTY_DESC");
		List<Map<String, Object>> goodsListBest=commonService.selectList("Main.getGoodsList",goodsMap);
		
		request.put("goodsListBest", goodsListBest);	
		

		goodsMap.put("PAGE_CURR", 1);
		goodsMap.put("PAGE_UINT", 4);
		goodsMap.put("ORDERBY", null);
		List<Map<String, Object>> goodsListOne=commonService.selectList("Main.getGoodsList",goodsMap);
		request.put("goodsListOne", goodsListOne);

		goodsMap.put("PAGE_CURR", 2);
		goodsMap.put("PAGE_UINT", 4);
		goodsMap.put("ORDERBY", null);
		List<Map<String, Object>> goodsListTwo=commonService.selectList("Main.getGoodsList",goodsMap);
		request.put("goodsListTwo", goodsListTwo);


		goodsMap.put("PAGE_CURR", 3);
		goodsMap.put("PAGE_UINT", 4);
		goodsMap.put("ORDERBY", null);
		List<Map<String, Object>> goodsListThree=commonService.selectList("Main.getGoodsList",goodsMap);
		request.put("goodsListThree", goodsListThree);
		
		return "index";
	}
	 
	//======================================
	// 카테고리 페이지
	//======================================
	public String category() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		
		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassGrade1List",searchMap);
		request.put("classList", classList);
		

		List<Map<String, Object>> classTotalList = commonService.selectList("Main.getShopClassGradeTotalList",searchMap);
		request.put("classTotalList", classTotalList);
		
		
		return "category";
	}

	//======================================
	// 브랜드별 상품 상세 페이지
	//======================================
	public String brand() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		

		SessionSkin sessionSkin = getSessionSkin();
		skinType = sessionSkin.getSkinTypeShop().toString();		
		shopId = sessionSkin.getShopId().toString();
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", shopId);
		
		//分类
		List<Map<String,Object>> classList=commonService.selectList("Main.getShopClassGrade1List",classMap);
		request.put("classList", classList);
		//品牌
		List<Map<String,Object>> brandList=commonService.selectList("Main.getBrandList",classMap);
		request.put("brandList", brandList);

		if(brandId>0){
			classMap.clear();
			classMap.put("SHOP_ID", shopId);
			classMap.put("BRAND_ID", brandId);
			Map<String,Object> brandOne=commonService.select("Main.getBrandList",classMap);
			request.put("brandOne", brandOne);
		}else{
			request.put("brandOne", null);
		}
		
		pageCurr = 1;
		pageUnit = 10;
		
		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("CUST_SYS_ID", intCustSysId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		if(goodsName!=null){
			goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
		}
		goodsMap.put("GOODS_NM", goodsName);
		if(brandId>0){
			goodsMap.put("BRAND_ID", brandId);
		}else{
			goodsMap.put("BRAND_ID", null);
		}
		if(shopGradeClassId>0){
			goodsMap.put("SGC_ID", shopGradeClassId);
		}
		
		List<Map<String, Object>> goodsList=commonService.selectList("Main.getGoodsList",goodsMap);
		
		if(!goodsList.isEmpty()){
			totalCount = (Integer)goodsList.get(0).get("TOTAL_CNT");
			System.out.println("totalCount=" + totalCount);
		}

		request.put("brandId", brandId);
		request.put("shopGradeClassId", shopGradeClassId);
		
		request.put("pageCurr", pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("totalCount", totalCount);
		
		request.put("goodsList", goodsList);
		
		return "brand";
	}

	//======================================
	// 브랜드별 상품 상세 페이지
	//======================================
	public String brandlist() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		skinType = sessionSkin.getSkinTypeShop().toString();		
		shopId = sessionSkin.getShopId().toString();
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", shopId);
		
		//品牌
		List<Map<String,Object>> brandList=commonService.selectList("Main.getBrandList",classMap);
		request.put("brandList", brandList);

		
		return "brandlist";
	}

	//======================================
	// 상품 목록
	//======================================
	public String productlist() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		

		SessionSkin sessionSkin = getSessionSkin();
		skinType = sessionSkin.getSkinTypeShop().toString();		
		shopId = sessionSkin.getShopId().toString();
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", shopId);
		
		//分类
		List<Map<String,Object>> classList=commonService.selectList("Main.getShopClassGrade1List",classMap);
		request.put("classList", classList);
		//品牌
		List<Map<String,Object>> brandList=commonService.selectList("Main.getBrandList",classMap);
		request.put("brandList", brandList);

		if(brandId>0){
			classMap.clear();
			classMap.put("SHOP_ID", shopId);
			classMap.put("BRAND_ID", brandId);
			Map<String,Object> brandOne=commonService.select("Main.getBrandList",classMap);
			request.put("brandOne", brandOne);
		}else{
			request.put("brandOne", null);
		}
		
		pageCurr = 1;
		pageUnit = 10;
		
		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("CUST_SYS_ID", intCustSysId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		if(goodsName!=null && !goodsName.isEmpty()){
			goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
			goodsMap.put("GOODS_NM", goodsName);
		}
		if(brandId>0){
			goodsMap.put("BRAND_ID", brandId);
		}else{
			goodsMap.put("BRAND_ID", null);
		}
		if(shopGradeClassId>0){
			goodsMap.put("SGC_ID", shopGradeClassId);
		}
		
		List<Map<String, Object>> goodsList=commonService.selectList("Main.getGoodsList",goodsMap);
		
		if(!goodsList.isEmpty()){
			totalCount = (Integer)goodsList.get(0).get("TOTAL_CNT");
			System.out.println("totalCount=" + totalCount);
		}

		request.put("brandId", brandId);
		request.put("shopGradeClassId", shopGradeClassId);
		
		request.put("pageCurr", pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("totalCount", totalCount);
		request.put("goodsName", goodsName);
		request.put("goodsList", goodsList);
		
		return "productlist";
	}
	public String productcomment(){

		jsSdkSttingNormal();
		return "productcomment";
	}
	public String productcommentSelect(){

		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", shopId);
		
		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("CUST_SYS_ID", intCustSysId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		if(goodsName!=null){
			try {
				goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
			}
		}
		goodsMap.put("GOODS_NM", goodsName);
		if(brandId>0){
			goodsMap.put("BRAND_ID", brandId);
		}else{
			goodsMap.put("BRAND_ID", null);
		}
		if(shopGradeClassId>0){
			goodsMap.put("SGC_ID", shopGradeClassId);
		}
		
		List<Map<String, Object>> list=commonService.selectList("Main.getGoodsList",goodsMap);
		
		PageData page = new PageData();

		if(!list.isEmpty()){
			totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, list);
		}

		renderJSON(page);

		return NONE;
	}
	public String productcommentInsert(){

		jsSdkSttingNormal();
		SessionMember sessionMember=getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		map.put("SHOP_ID",sessionMember.getShopId());
		map.put("DISPLAY_ID", displayId);
		map.put("GOODS_DISPLAY_GPA", pageCurr);
		map.put("REVIEW_DESC", listClassName);
		map.put("REVIEW_TITLE", reviewTitle);
		map.put("REVIEW_P_ID", goodsId);
		map.put("IMG1", reviewImg1);
		map.put("IMG2", reviewImg2);
		map.put("IMG3", reviewImg3);
		map.put("IMG4", reviewImg4);
		map.put("IMG5", reviewImg5);
		map.put("IMG6", reviewImg6);
		map.put("IMG7", reviewImg7);
		map.put("IMG8", reviewImg8);
		map.put("IMG9", reviewImg9);
		
		Map<String,Object> returnMap=commonService.select("Order.reviewInsert",map);
		String title = (String) returnMap.get("REVIEW_TITLE");
		String openId = (String) returnMap.get("OPENID");
		String mbrName = (String) returnMap.get("MBR_NM");	
		renderJSON(returnMap);

		try{

			String first = "댓글이 달렸습니다.";
			String keyword1 = title;
			String keyword2 = "댓글 알림";
			String keyword3 = mbrName;
			String link = "/front/web/publish/mobile/product/communityListDetail.htm?displayId=1&goodsId="+goodsId;
			String remark  = "클릭하여 확인하세요~";
			
	    	AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());
	    	weixinTemplateMessageService.sendNewReviewMsg(appInfo,openId, first, keyword1, keyword2, keyword3, link, remark);
	    	
		}catch(Exception e){
			logger.info("##### Exception==>" +  e.getMessage());
		}
						
		
		return NONE;
	}
	public String productcommentDelete(){

		jsSdkSttingNormal();
		return "productcommentDelete";
	}
	
	//======================================
	// 상품상세
	//======================================
	public String productview(){

		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();
		
		// 商品详情
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("SHOP_ID", shopId); // shopId
		searchMap.put("DISPLAY_ID", displayId); // displayId
		searchMap.put("CUST_SYS_ID", intCustSysId);
		Map<String, Object> detail = commonService.select("Detail.getGoodsDetail", searchMap);

		int detailPageId = 0;
		if (detail != null && detail.get("PAGE_ID") != null) {
			detailPageId = Integer.valueOf(detail.get("PAGE_ID").toString());
		}
		
		// 商品属性列表
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("DISPLAY_ID", displayId);
		List<Map<String, Object>> specList = commonService.selectList("Detail.getSpecList", searchMap);
		List<Map<String, Object>> attributeList = commonService.selectList("Detail.getGoodsAttrList", searchMap);

		// 图文详情列表
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("PAGE_ID", detailPageId);
		searchMap.put("PAGE_TYPE", 3);
		searchMap.put("SKIN_TYPE", sessionSkin.getSkinTypeShop().toString());
		List<Map<String, Object>> imageList = commonService.selectList("Detail.getGoodsImageList", searchMap);
		
		ListUtil.convertClob2String(imageList );

		request.put("loginFlag", intCustSysId);

		//--------------------------
		//-- initial setting
		//--------------------------
		if (pageCurr == 0) {
			pageCurr = 1;
		}
		
		//-----------------------------------------------------------------------------------
		// 商品评价列表
		//-----------------------------------------------------------------------------------
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("GOODS_ID", goodsId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageCurr);
		searchMap.put("PAGE_UNIT", 15);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Detail.getReviewList", searchMap);

		int totalCount = 0;
		if(!reviewList.isEmpty()){
			totalCount = (Integer)reviewList.get(0).get("TOTAL_CNT");
			request.put("totalRecords", totalCount);
			System.out.println("totalRecords=" + totalCount);
		}

		int pageUnit = 10;
		int totalPage = 0;

		if (totalCount > 0) {
			if (totalCount % pageUnit == 0) {
				totalPage = totalCount / pageUnit;
			} else {
				totalPage = totalCount / pageUnit + 1;
			}
		}
		//-----------------------------------------------------------------------------------
		

		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", 1);
		goodsMap.put("PAGE_UINT", 3);
		goodsMap.put("ORDERBY", "RAND");

		List<Map<String, Object>> goodsListBest=commonService.selectList("Main.getGoodsList",goodsMap);
		request.put("goodsListBest", goodsListBest);	
		
		goodsMap.clear();
		goodsMap.put("SHOP_ID",shopId);
		List<Map<String, Object>> brandList=commonService.selectList("Main.getBrandList",goodsMap);
		request.put("brandList", brandList);	
		
		request.put("totalPage", totalPage);
		request.put("detail", detail);
		request.put("imageList", imageList);
		request.put("specList", specList);
		request.put("reviewList", reviewList);
		
		return "productview";
	}
	public String event(){

		jsSdkSttingNormal();
		return "event";
	}


	public String productReg(){

		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  sessionSkin.getShopId());
		paramsMap.put("GOODS_NM", getRequest().getParameter("goodsNm"));
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 9999);
		paramsMap.put("USER_ID", intCustSysId);
		
		request.put("goodList", commonService.selectList("AdminGoods.GOODS_LIST_SELECT" , paramsMap));
		
		paramsMap.clear();
		paramsMap.put("SHOP_ID", sessionSkin.getShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", intCustSysId);
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));

		String toDay="";  
		String endDay="";   
	    Date dt = new Date();    
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
	    toDay=sdf.format(dt);   		
		
	    Calendar c = Calendar.getInstance(); 
	    c.setTime(dt); 
	    c.add(Calendar.DATE, 365);
	    dt = c.getTime();
	    endDay=sdf.format(dt);   	
	    
		request.put("startDt", toDay);
		request.put("endDt", endDay);
		request.put("shopId", sessionSkin.getShopId());
		
		return "productReg";
	}


	public String getGoods2edClassCombo() {

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  sessionSkin.getShopId());
		paramsMap.put("SGC_PARENT_ID", getRequest().getParameter("sgcId"));
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		return NONE;
	}
	
	public String get1stLevelSpecCombo() {

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  sessionSkin.getShopId());
		paramsMap.put("GC_ID", getRequest().getParameter("gc_id"));
		paramsMap.put("SPEC_ID", null);
		paramsMap.put("SPEC_TYPE", 1);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		
		return NONE;
	}
	public String get2edLevelSpecCombo() {

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  sessionSkin.getShopId());
		paramsMap.put("GC_ID", getRequest().getParameter("gc_id"));
		paramsMap.put("SPEC_ID", getRequest().getParameter("spec_id"));
		paramsMap.put("SPEC_TYPE", 2);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		
		return NONE;
	}	

	/**
	 * 添加商品规格Big
	 * @return
	 * @throws Exception
	 */
	public String addSpecLevelOne() throws Exception{

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", sessionSkin.getShopId());
		paramsMap.put("GC_ID", IntegerUtils.valueOf(getRequest().getParameter("gcId")));
		paramsMap.put("SPEC_NM", getRequest().getParameter("specNm"));
		paramsMap.put("USER_ID", intCustSysId);
		
		Map<String,Object> resultMap = goodsService.addSpecLevelOne(paramsMap);
		
		renderJSON(resultMap);
		
		return NONE;
	}
	/**
	 * 添加商品规格Small
	 * @return
	 * @throws Exception
	 */
	public String addSpecLevelTwo() throws Exception{

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", sessionSkin.getShopId());
		paramsMap.put("GC_ID", IntegerUtils.valueOf(getRequest().getParameter("gcId")));
		paramsMap.put("SPEC_ID", IntegerUtils.valueOf(getRequest().getParameter("specId")));
		paramsMap.put("SPEC_VALUE_NM", getRequest().getParameter("specValueNm"));
		paramsMap.put("USER_ID", intCustSysId);
		
		Map<String,Object> resultMap = goodsService.addSpecLevelTwo(paramsMap);
		
		renderJSON(resultMap);
		return NONE;
	}
	
	public String productSave(){

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		Integer shopId = sessionSkin.getShopId();
		Integer createdId = 1;
		
		GoodsDisplayInsert goodsDisplayInsert = new GoodsDisplayInsert();
		List<GoodsDispalyPriceInsert> priceList = new ArrayList<GoodsDispalyPriceInsert>();

		int intStockAreaId = Integer.parseInt(stockAreaId);
		int intGcId = Integer.parseInt(gcId);
		int intGoodsid = Integer.parseInt(goodsId);
		
		int intReviewImg1 = 0;
		int intReviewImg2 = 0;
		int intReviewImg3 = 0;
		int intReviewImg4 = 0;
		int intReviewImg5 = 0;
		try {
			intReviewImg1 = Integer.parseInt(reviewImg1);
			intReviewImg2 = Integer.parseInt(reviewImg2);
			intReviewImg3 = Integer.parseInt(reviewImg3);
			intReviewImg4 = Integer.parseInt(reviewImg4);
			intReviewImg5 = Integer.parseInt(reviewImg5);
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		int intSpecId = Integer.parseInt(strSpecId);
		int intSpecValueId = Integer.parseInt(strSpecValueId);
		Double intPriceOrg = Double.parseDouble(strPriceOrg);
		Double intPrice = Double.parseDouble(strPrice);
		int intStock = Integer.parseInt(strStock);

		PageHeader pageHeader = new PageHeader();
		PageItem pageItem2 = new PageItem();
		PageDtl pageDtlDesc = new PageDtl();
		
		try {

			// goods display
			goodsDisplayInsert.setShopId(shopId);
			goodsDisplayInsert.setGoodsId(intGoodsid);
			goodsDisplayInsert.setDisplayId(null);
			goodsDisplayInsert.setIsUsed(1);
			goodsDisplayInsert.setReserve(0);
			goodsDisplayInsert.setReserveEndDt(null);
			goodsDisplayInsert.setStockAreaId(intStockAreaId);
			goodsDisplayInsert.setTransSheetId(10036);
			goodsDisplayInsert.setVoucherUse(null);
			goodsDisplayInsert.setDiscountId(null);
			
			goodsDisplayInsert.setStartDt(DateUtil.parseDate(startDt + " 00:00:00"));
			goodsDisplayInsert.setEndDt(DateUtil.parseDate(endDt + " 23:59:59"));
			goodsDisplayInsert.setStartDesc("");
			goodsDisplayInsert.setEventDesc("");
			
			goodsDisplayInsert.setGoodsDtlSlideImg1(intReviewImg1);
			goodsDisplayInsert.setGoodsDtlSlideImg2(intReviewImg2);
//			goodsDisplayInsert.setGoodsDtlSlideImg3(intReviewImg3);
//			goodsDisplayInsert.setGoodsDtlSlideImg4(intReviewImg4);
//			goodsDisplayInsert.setGoodsDtlSlideImg5(intReviewImg5);
		 
			goodsDisplayInsert.setGoodsListImg(intReviewImg1);
			goodsDisplayInsert.setDescTitle(reviewTitle);
			goodsDisplayInsert.setDescDetail(listClassName);
			goodsDisplayInsert.setSgcIdSplit(sgcIdSplit);
			goodsDisplayInsert.setGcId(intGcId);
			goodsDisplayInsert.setTagIdSplit("");
			
			goodsDisplayInsert.setItemType(itemType);
			goodsDisplayInsert.setItemUrl(itemUrl);
			
			// goods display price
			GoodsDispalyPriceInsert goodsDispalyPriceInsert = null;
			goodsDispalyPriceInsert  = new GoodsDispalyPriceInsert();
			
			goodsDispalyPriceInsert.setShopId(shopId);
			goodsDispalyPriceInsert.setGoodsId(intGoodsid);
			goodsDispalyPriceInsert.setDisplayId(null);
			goodsDispalyPriceInsert.setPriceOptionId(null);
			goodsDispalyPriceInsert.setGcId(intGcId);
	
			goodsDispalyPriceInsert.setSpecId1(intSpecId);
			goodsDispalyPriceInsert.setSpecValueId1(intSpecValueId);
			
			goodsDispalyPriceInsert.setPriceOrg(intPriceOrg);
			goodsDispalyPriceInsert.setPriceUnitSales(intPrice);
			goodsDispalyPriceInsert.setStockIn(intStock); 
			
			
			priceList.add(goodsDispalyPriceInsert);
			
			// -------------------------
			pageHeader.setShopId(shopId);
			pageHeader.setCreatedId(createdId);
			pageHeader.setPageType(3);
			pageHeader.setSkinType(1);
			// -------------------------
	
			int a = 0;
			// -------------------------

			if (!reviewImgUrl3.isEmpty()) {

				PageItem pageItem = new PageItem();
		
				pageItem.setShopId(shopId);
				pageItem.setCreatedId(createdId);
				pageItem.setTmplNo("12");
		
				PageDtl pageDtl = new PageDtl();
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal03("");
				
				pageItem.setSort(a++);
				pageDtl.setVal01(reviewImgUrl3);
				pageItem.getDetails().add(pageDtl);	
				pageHeader.getItems().add(pageItem);
			}
			if (!reviewImgUrl4.isEmpty()) {

				PageItem pageItem = new PageItem();
		
				pageItem.setShopId(shopId);
				pageItem.setCreatedId(createdId);
				pageItem.setTmplNo("12");
		
				PageDtl pageDtl = new PageDtl();
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal03("");
								
				pageItem.setSort(a++);
				pageDtl.setVal01(reviewImgUrl4);
				pageItem.getDetails().add(pageDtl);	
				pageHeader.getItems().add(pageItem);
			}
			if (!reviewImgUrl5.isEmpty()) {

				PageItem pageItem = new PageItem();
		
				pageItem.setShopId(shopId);
				pageItem.setCreatedId(createdId);
				pageItem.setTmplNo("12");
		
				PageDtl pageDtl = new PageDtl();
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal03("");
								
				pageItem.setSort(a++);
				pageDtl.setVal01(reviewImgUrl5);
				pageItem.getDetails().add(pageDtl);	
				pageHeader.getItems().add(pageItem);
			}

			// -------------------------
			pageItem2.setShopId(shopId);
			pageItem2.setCreatedId(createdId);
			pageItem2.setSort(a++);
			pageItem2.setTmplNo("99");
			
			pageDtlDesc.setShopId(shopId);
			pageDtlDesc.setCreatedId(createdId);
			pageDtlDesc.setTxt01(strContent);

			pageItem2.getDetails().add(pageDtlDesc);	
			pageHeader.getItems().add(pageItem2);
			// -------------------------
			
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			
			Map<String,Object> pmap = new HashMap<String,Object>();
			pmap.put("goodsDisplayInsert", goodsDisplayInsert);
			pmap.put("priceList", priceList);
			pmap.put("pageHeader", pageHeader);
			//templateServcie.createGoodsDtlTemplate(pageHeader);
			goodsDisplayService.createGoodsDisplay(pmap);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", true);
			renderJSON(map);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", false);
			map.put("err_msg", e.getMessage());
			renderJSON(map);
		}
		
		return NONE;
	}
	
	//======================================
	// 장바구니
	//======================================
	public String mypageshopcart() throws Exception{

		jsSdkSttingNormal();
		System.out.println(getRequest().getRequestURI() + "<>");
		
		SessionMember sessionMember = getSessionMember();
		if (sessionMember == null) {
			return "followpage";
		}		
		
		Map<String,Object> map = new HashMap<String,Object>();
	 
		map.put("SHOP_ID", sessionMember.getShopId() + "");
		map.put("CUST_SYS_ID", sessionMember.getCustSysId() + "");
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999);
		
		List<Map<String,Object>> cartlist = commonService.selectList("Cart.getCart", map);
		
		request.put("cartlist", cartlist);
		
		
		return "mypageshopcart";
	}
	public String mypageshopSelect() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		return "mypageshopSelect";
	}
	public String mypageshopcartInsert() throws Exception{

		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("JOB_TYPE", "I");
		map.put("SHOP_ID", sessionSkin.getShopId());// shopId
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());// session中取值
		map.put("DISPLAY_ID", displayId);// displayId
		map.put("GOODS_QTY", pageCurr);
		map.put("PRICE_UNIT_SALES", price);
		Map<String, Object> cartMap = commonService.select("Detail.addCart", map);
		cartMap.put("OUT_ERR_MSG", cartMap.get("OUT_ERR_MSG").toString());
		renderJSON(cartMap);
		return NONE;
	}
	public String mypageshopcartDelete() throws Exception{
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("JOB_TYPE", "D");
		map.put("SHOP_ID", sessionSkin.getShopId());// shopId
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());// session中取值
		map.put("DISPLAY_ID", displayId);// displayId
		Map<String, Object> cartMap = commonService.select("Detail.addCart", map);
		cartMap.put("OUT_ERR_MSG", cartMap.get("OUT_ERR_MSG").toString());
		renderJSON(cartMap);
		return NONE;
	}

	//======================================
	// 나의 주문보기
	//======================================
	public String mypage() throws Exception{

		jsSdkSttingNormal();
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			Map<String, Object> amsMbr = commonService.select("Bbc.sqlAMS_MBR_SELECT",searchMap);
			
			request.put("amsMbr", amsMbr);		
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "mypage";
	}
	public String mypagetoday() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		return "mypagetoday";
	}

	

	public String orderList(){
		
		SessionMember sessionMember = getSessionMember();
		
		if(StringUtils.isEmpty(orderIndex)){
			orderIndex = "1";
		}
		
		if(orderIndex.equals("2")){
			statusId = "10" ;
		}else if(orderIndex.equals("3")){
			statusId = "20" ;
		}else if(orderIndex.equals("4")){
			statusId = "30" ;
		}else if(orderIndex.equals("5")){
			statusId = "40" ;
		}
		
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());//sessionMember.getCustSysId()
		map.put("SHOP_ID",sessionMember.getShopId() );//sessionMember.getShopId()
		map.put("STATUS_ID", statusId);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999);
		
		List<Map<String,Object>> myOrderList=commonService.selectList("Order.getMyOrderList",map);
		
		request.put("myOrderList", myOrderList);
		
		return "orderList";
	}

	public String orderInformation(){
		SessionMember sessionMember=getSessionMember();
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("STATUS_ID", statusId);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999);
		map.put("ORDER_ID", orderId);
		
		List<Map<String,Object>> orderList=commonService.selectList("Order.getMyOrderList",map);
		
		request.put("orderList", orderList);
		
		return "orderInformation";
	}	
	
	
	//======================================
	// 즐겨찾기
	//======================================
	public String mypageinterest(){

		jsSdkSttingNormal();

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("SHOP_ID", shopId);
		map.put("CUST_SYS_ID", intCustSysId+"");
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999);
		map.put("ORDERBY", "PRICE_DESC");

		List<Map<String, Object>> favoriteslist = favoritesService.selectList("Favorites.getFavorites", map);

		request.put("favoriteslist", favoriteslist);
		
		return "mypageinterest";
	}
	public String mypageinterestInsert(){

		jsSdkSttingNormal();
		return "mypageinterestInsert";
	}
	public String mypageinterestDelete(){

		jsSdkSttingNormal();
		return "mypageinterestDelete";
	}
	
	//======================================
	// 쿠폰존
	//======================================
	public String coupon(){

		jsSdkSttingNormal();
		return "coupon";
	}
	
	public String couponTwo(){

		jsSdkSttingNormal();
		return "couponTwo";
	}
	

	public String communityList() throws Exception{

		jsSdkSttingNormal();

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();

		request.put("loginFlag", intCustSysId);
		request.put("shopId", shopId);

		//--------------------------
		//-- initial setting
		//--------------------------
		if (pageCurr == 0) {
			pageCurr = 1;
		}
		if (pageUnit == 0) {
			pageUnit = 15;
		}
		
		
		//-----------------------------------------------------------------------------------
		// 商品评价列表
		//-----------------------------------------------------------------------------------
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageCurr);
		searchMap.put("PAGE_UNIT", pageUnit);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Detail.getReviewList", searchMap);

		int totalCount = 0;
		if(!reviewList.isEmpty()){
			totalCount = (Integer)reviewList.get(0).get("TOTAL_CNT");
			request.put("totalRecords", totalCount);
			System.out.println("totalRecords=" + totalCount);
		}

		int totalPage = 0;

		if (totalCount > 0) {
			if (totalCount % pageUnit == 0) {
				totalPage = totalCount / pageUnit;
			} else {
				totalPage = totalCount / pageUnit + 1;
			}
		}
		//-----------------------------------------------------------------------------------
		
		

		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", 1);
		goodsMap.put("PAGE_UINT", 3);
		goodsMap.put("ORDERBY", "RAND");

		List<Map<String, Object>> goodsListBest=commonService.selectList("Main.getGoodsList",goodsMap);
		request.put("goodsListBest", goodsListBest);			

		request.put("displayId", displayId);
		request.put("pageCurr", pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("totalPage", totalPage);
		request.put("reviewList", reviewList);
				
		return "communityList";
	}
	

	public String reviewList() throws Exception{

		jsSdkSttingNormal();

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();

		request.put("loginFlag", intCustSysId);
		request.put("shopId", shopId);

		//--------------------------
		//-- initial setting
		//--------------------------
		if (pageCurr == 0) {
			pageCurr = 1;
		}
		if (pageUnit == 0) {
			pageUnit = 10;
		}
		
		
		//-----------------------------------------------------------------------------------
		// 商品评价列表
		//-----------------------------------------------------------------------------------
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageCurr);
		searchMap.put("PAGE_UNIT", pageUnit);
		searchMap.put("ORDERBY", "REVIEW");
		List<Map<String, Object>> reviewList = commonService.selectList("Detail.getReviewList", searchMap);

		int totalCount = 0;
		if(!reviewList.isEmpty()){
			totalCount = (Integer)reviewList.get(0).get("TOTAL_CNT");
			request.put("totalRecords", totalCount);
			System.out.println("totalRecords=" + totalCount);
		}

		int totalPage = 0;

		if (totalCount > 0) {
			if (totalCount % pageUnit == 0) {
				totalPage = totalCount / pageUnit;
			} else {
				totalPage = totalCount / pageUnit + 1;
			}
		}
		//-----------------------------------------------------------------------------------
		

		request.put("displayId", displayId);
		request.put("pageCurr", pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("totalPage", totalPage);
		request.put("reviewList", reviewList);
				
		return "reviewList";
	}
	

	public String reviewGetList() throws Exception{


		int intCustSysId = 0;

		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
//			getRequest().getRequestDispatcher("/fronterror/timeout.htm").forward(getRequest(), getResponse());
//			return NONE;
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();

		request.put("loginFlag", intCustSysId);
		request.put("shopId", shopId);

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageCurr);
		searchMap.put("PAGE_UNIT", pageUnit);
		searchMap.put("ORDERBY", "REVIEW");

		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList("Detail.getReviewList", searchMap);
		
		if(!list.isEmpty()){
			totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
			System.out.println("totalCount=" + totalCount);
		}
		
		renderJSON(page);
		
		return NONE;
		
	}

	public String communityGetList() throws Exception{


		int intCustSysId = 0;

		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
//			getRequest().getRequestDispatcher("/fronterror/timeout.htm").forward(getRequest(), getResponse());
//			return NONE;
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();

		request.put("loginFlag", intCustSysId);
		request.put("shopId", shopId);

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageCurr);
		searchMap.put("PAGE_UNIT", pageUnit);
		searchMap.put("ORDERBY", "REVIEW_ID");

		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList("Detail.getReviewList", searchMap);
		
		if(!list.isEmpty()){
			totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
			System.out.println("totalCount=" + totalCount);
		}
		
		renderJSON(page);
		
		return NONE;
		
	}
	

	public String communityListDetail() throws Exception{

		jsSdkSttingNormal();

		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}

		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId().toString();
		
		request.put("loginFlag", intCustSysId);

		//--------------------------
		//-- initial setting
		//--------------------------
		if (pageCurr == 0) {
			pageCurr = 1;
		}
		if (pageUnit == 0) {
			pageUnit = 15;
		}
		
		
		//-----------------------------------------------------------------------------------
		// 商品评价列表
		//-----------------------------------------------------------------------------------
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageCurr);
		searchMap.put("PAGE_UNIT", pageUnit);
		searchMap.put("GOODS_ID", goodsId);
		searchMap.put("ORDERBY", "REVIEW_ID");
		Map<String, Object> review = commonService.select("Detail.getReviewList", searchMap);	

		//-----------------------------------------------------------------------------------
		

		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageCurr);
		searchMap.put("PAGE_UNIT", 9999999);
		searchMap.put("REVIEW_P_ID", goodsId);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Detail.getReviewList", searchMap);	
		

		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", 1);
		goodsMap.put("PAGE_UINT", 3);
		goodsMap.put("ORDERBY", "RAND");

		List<Map<String, Object>> goodsListBest=commonService.selectList("Main.getGoodsList",goodsMap);
		request.put("goodsListBest", goodsListBest);			

		request.put("displayId", displayId);
		request.put("review", review);
		request.put("reviewList", reviewList);
				
		return "communityListDetail";
	}

	//---------------------------------------------------------------
	// mobile list
	//---------------------------------------------------------------
	public String list() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
//			getRequest().getRequestDispatcher("/fronterror/timeout.htm").forward(getRequest(), getResponse());
//			return NONE;
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		skinType = sessionSkin.getSkinTypeShop().toString();		
		shopId = sessionSkin.getShopId().toString();
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", shopId);
		
		//分类
		List<Map<String,Object>> classList=commonService.selectList("Main.getShopClassGrade1List",classMap);
		request.put("classList", classList);
		//品牌
		List<Map<String,Object>> brandList=commonService.selectList("Main.getBrandList",classMap);
		request.put("brandList", brandList);
		

		//-------------------------------------------------------------------------------------------
		// Return
		//-------------------------------------------------------------------------------------------
		String strReturn = "list";
		int intPageUnit = 99999999;

		if (pageCurr>0) {
			intPageUnit = pageUnit;
		}
		else {
			pageCurr = 1;
			pageUnit = 10;
			intPageUnit = pageUnit;
		}
		
		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "list";
			intPageUnit = 99999999;
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "list2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "list3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "list4";
		}
		else {
			strReturn = "list";
		}		
		//-------------------------------------------------------------------------------------------
		
		
		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("CUST_SYS_ID", intCustSysId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
//		goodsMap.put("PRICE", null);
//		goodsMap.put("TODAY", null);
//		goodsMap.put("TEMP_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", intPageUnit);
		goodsMap.put("ORDERBY", orderby);
		if(goodsName!=null){
			goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
		}
		goodsMap.put("GOODS_NM", goodsName);
		if(brandId>0){
			goodsMap.put("BRAND_ID", brandId);
		}else{
			goodsMap.put("BRAND_ID", null);
		}
		if(shopGradeClassId>0){
			goodsMap.put("SGC_ID", shopGradeClassId);
		}
		
		if(listClassName==null){
			listClassName = "list-search-list list-larger-view";
		}
		
		List<Map<String, Object>> goodsList=commonService.selectList("Main.getGoodsList",goodsMap);
		
		pageTotalCount = 1;
		
		if(!goodsList.isEmpty()){
			totalCount = (Integer)goodsList.get(0).get("TOTAL_CNT");
			System.out.println("totalCount=" + totalCount);
		}
		
		request.put("goodsList", goodsList);
		
		
		//-------------------------------------------------------------------------------------------
		return strReturn;
		//-------------------------------------------------------------------------------------------
		
	}
	
	

	//---------------------------------------------------------------
	// mobile list
	//---------------------------------------------------------------
	public String reserveSalesList() throws Exception{
		jsSdkSttingNormal();
		int intCustSysId = 0;
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
//			getRequest().getRequestDispatcher("/fronterror/timeout.htm").forward(getRequest(), getResponse());
//			return NONE;
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		skinType = sessionSkin.getSkinTypeShop().toString();		
		shopId = sessionSkin.getShopId().toString();
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", shopId);
		
		List<Map<String,Object>> bannerList=commonService.selectList("Main.getShopBannerList",classMap);
		request.put("bannerList", bannerList);
		

		//-------------------------------------------------------------------------------------------
		// Return
		//-------------------------------------------------------------------------------------------
		String strReturn = "list";
		int intPageUnit = 99999999;

		if (pageCurr>0) {
			intPageUnit = pageUnit;
		}
		else {
			pageCurr = 1;
			pageUnit = 10;
			intPageUnit = pageUnit;
		}
		
//		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
//			strReturn = "reserveSalesList";
//			intPageUnit = 99999999;
//		}
//		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
//			strReturn = "reserveSalesList";
//		}
//		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
//			strReturn = "reserveSalesList";
//		}
//		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
//			strReturn = "reserveSalesList";
//		}
//		else {
//			strReturn = "reserveSalesList";
//		}		
		//-------------------------------------------------------------------------------------------
		
		strReturn = "reserveSalesList";
		
		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("CUST_SYS_ID", intCustSysId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
//		goodsMap.put("PRICE", null);
//		goodsMap.put("TODAY", null);
//		goodsMap.put("TEMP_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", intPageUnit);
		goodsMap.put("ORDERBY", orderby);
		if(goodsName!=null){
			goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
		}
		goodsMap.put("GOODS_NM", goodsName);
		if(brandId>0){
			goodsMap.put("BRAND_ID", brandId);
		}else{
			goodsMap.put("BRAND_ID", null);
		}
		if(shopGradeClassId>0){
			goodsMap.put("SGC_ID", shopGradeClassId);
		}
		
		if(listClassName==null){
			listClassName = "list-search-list list-larger-view";
		}
		
		List<Map<String, Object>> goodsList=commonService.selectList("Main.getGoodsListRev",goodsMap);
		
		pageTotalCount = 1;
		
		if(!goodsList.isEmpty()){
			totalCount = (Integer)goodsList.get(0).get("TOTAL_CNT");
			System.out.println("totalCount=" + totalCount);
		}

		ListUtil.convertClob2String(goodsList );
		request.put("goodsList", goodsList);
		

		//-------------------------------------------------------------------------------------------
		return strReturn;
		//-------------------------------------------------------------------------------------------
		
	}	
	
	

	public String getListData() throws Exception{

		int intCustSysId = 0;

		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
//			getRequest().getRequestDispatcher("/fronterror/timeout.htm").forward(getRequest(), getResponse());
//			return NONE;
		}
		else{
			intCustSysId = sessionMember.getCustSysId();
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		skinType = sessionSkin.getSkinTypeShop().toString();		
		shopId = sessionSkin.getShopId().toString();
		

		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", shopId);
		
		//goods list
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("CUST_SYS_ID", intCustSysId);
		goodsMap.put("IS_REAL", Byte.valueOf("1"));
		goodsMap.put("IS_USED", Byte.valueOf("1"));
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		if(goodsName!=null){
			goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
		}
		goodsMap.put("GOODS_NM", goodsName);
		if(brandId==0){
			goodsMap.put("BRAND_ID", null);
		}else{
			goodsMap.put("BRAND_ID", brandId);
		}
		if(shopGradeClassId!=0){
			goodsMap.put("SGC_ID", shopGradeClassId);
		}
		
		PageData page = new PageData();
		List<Map<String, Object>> list=commonService.selectList("Main.getGoodsList",goodsMap);
		
		if(!list.isEmpty()){
			totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
			System.out.println("totalCount=" + totalCount);
		}
		
		renderJSON(page);
		
		return NONE;
	}
	
	/**
	 * @return
	 */
	public String addFavorite() throws Exception{
		SessionSkin sessionSkin = getSessionSkin();
		skinType = sessionSkin.getSkinTypeShop().toString();		
		String strParamShop = sessionSkin.getShopId().toString();
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			strParamShop = "?shopId="+strParamShop;
			getRequest().getRequestDispatcher("/fronterror/follow.htm"+strParamShop).forward(getRequest(), getResponse());
			return NONE;
		}
		
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("shopId", sessionMember.getShopId());
		map.put("custSysId", sessionMember.getCustSysId());
		map.put("goodsId", goodsId);
		map.put("displayId", displayId);
		try {
			commonService.insert("Main.addFavorite", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		return NONE;
	}
	public String removeFavorite(){
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("shopId", sessionMember.getShopId());
		map.put("custSysId", sessionMember.getCustSysId());
		map.put("goodsId", goodsId);
		map.put("displayId", displayId);
		try {
			commonService.update("Main.removeFavorite", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		return NONE;
	}
	
	public String navigationListData(){
		
		SessionSkin sessionSkin = getSessionSkin();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("shopId", sessionSkin.getShopId());
		
		Map<String,Object> remap = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> naviList = commonService.selectList("Main.getNavigationList",map);
			remap.put("status", "S");
			remap.put("naviList", naviList);
			renderJSON(remap);
			
		} catch (Exception e) {
			
			map.put("status", "F");
			map.put("err_msg", e.getMessage());
			renderJSON(remap);
			e.printStackTrace();
		}
		
		return NONE;
	}

	

	

	//======================================
	// 오더 저장 화면
	//======================================
	public String saveOrderConfirm() {
		logger.error("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		SessionMember sessionMember = getSessionMember();
		
		//String ret = "success";
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		jobType = "I";
		statusId = "10";
		orderTypeId = "1";
		
		FrontOrder frontOrder = new FrontOrder();
		
		frontOrder.setAddressCityId(addressCityId);
		frontOrder.setAddressDetail(addressDetail);
		frontOrder.setAddressDistrictId(addressDistrictId);
		frontOrder.setAddressProvinceId(addressProvinceId);
		frontOrder.setAdrMobile(adrMobile);
		frontOrder.setAdrReceiptorName(receiptopName);
		frontOrder.setCustMsg(custMsg);
		frontOrder.setCustSysId(custSysId);
		frontOrder.setPriceOptionId(priceOptionId);
		frontOrder.setGoodsQty(goodsQty);
		frontOrder.setGoodsQtyOne(goodsQtyOne);
		frontOrder.setJobType(jobType);
		frontOrder.setPriceSum(priceSum);
		frontOrder.setTransTypeId(transTypeId);
		frontOrder.setTransFee(transFee);
		frontOrder.setShopId(shopId);
		frontOrder.setStatusId(statusId);
		frontOrder.setPriceTTAfterNego(priceTTAfterNego);
		frontOrder.setPriceTTBeforeNego(priceTTBeforeNego);
		frontOrder.setOrderTypeId(orderTypeId);
		frontOrder.setOrderId(null);
		frontOrder.setStsOrderDate(null);
		frontOrder.setOrderOutId("2015011281");
		frontOrder.setCouponId(couponId);
		frontOrder.setCouponItemId(couponItemId);
		
		try {
			Map<String, Object> resultMap = orderConfirmService.saveOrderConfirm(frontOrder);
			
			Integer orderId = (Integer) resultMap.get("OUT_ORDER_ID");
			Integer totalPrice = IntegerUtils.convert2fen((BigDecimal) resultMap.get("PRICE_TT"));
			String custOrderId = (String) resultMap.get("CUST_ORDER_ID");
			String shopNm = (String) resultMap.get("SHOP_NM");
			
			
			logger.info("============生成临时订单=============");
			logger.info("orderId=============>" + orderId);
			logger.info("totalPrice==========>" + totalPrice);
			logger.info("custOrderId=========>" + custOrderId);
			logger.info("shopNm==============>" + shopNm);
			logger.info("============生成临时订单=============");
			
			frontOrder.setOrderId(orderId + "");
			frontOrder.setTotalFee(totalPrice);
			frontOrder.setCustOrderId(custOrderId);
			frontOrder.setShopNm(shopNm);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", true);
			returnMap.put("data", frontOrder);
			renderJSON(returnMap);
			return NONE;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
			renderJSON(returnMap);
			
			return NONE;
		}
		
	}

	//======================================
	// 재고 확인
	//======================================
	public String checkStock() {
		
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId() + "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("GOODS_ID", goodsId);
		map.put("DISPLAY_ID", displayId);
		// map.put("PRICE_OPTION_ID", priceOptionId);
		
		Map<String, Object> mapId = orderConfirmService.select("OrderConfirm.checkStock", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("STOCK_NOW", mapId.get("STOCK_NOW"));
		renderJSON(returnMap);
		
		return NONE;
	}

	//======================================
	// 오더 confirm 화면
	//======================================
	public String orderConfirm() {

		jsSdkSttingNormal();
		SessionMember sessionMember = getSessionMember();

		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";


		//----------------------------------------------------------------------------
		//aaaaaaaaa
		//----------------------------------------------------------------------------
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CUST_SYS_ID", custSysId);
		if (StringUtils.isEmpty(addressId)) {
			map.put("IS_DEFAULT", "1");
		} else {
			map.put("IS_DEFAULT", null);
		}
		map.put("ADDRESS_ID", addressId);
		Map<String, Object> addressMap = orderConfirmService.select("OrderConfirm.selectCustAddress", map);
		
		try {
			custAddrId = addressMap.get("ADDRESS_ID").toString();
		} catch (Exception e) {
			// TODO: handle exception
			custAddrId = null;
		}
		
		
		request.put("addressMap", addressMap);
		request.put("priceOptionId", priceOptionId);
		//----------------------------------------------------------------------------
		
		

		//----------------------------------------------------------------------------
		//aaaaaa
		//----------------------------------------------------------------------------
		FrontOrderConfirm fontOrderConfirm = new FrontOrderConfirm();

		fontOrderConfirm.setShop_Id(shopId);
		fontOrderConfirm.setPrice_Option_Id(priceOptionId);
		fontOrderConfirm.setGoods_qty_num(goods_qty_num);

		fontOrderConfirm.setCust_Sys_Id(custSysId);
		fontOrderConfirm.setCust_Addr_Id(custAddrId);

		if (StringUtils.isEmpty(transTypeId)) {
			transTypeId = "1";
		} 
		
		fontOrderConfirm.setTrans_Type_Id(transTypeId);
		
		List<FrontOrderConfirm> list = orderConfirmService.selectOrderConfirmList("OrderConfirm.selectOrderConfirmGoods", fontOrderConfirm);

		String shopName = list.get(0).getShop_Nm();

		request.put("shopName", shopName);
		request.put("list", list);
		//----------------------------------------------------------------------------
		
		

		//----------------------------------------------------------------------------
		//aaaaaaaaa
		//----------------------------------------------------------------------------
		map.clear();
		map.put("SHOP_ID", shopId);
		List<Map<String, Object>> mapIdea = orderConfirmService.selectList("OrderConfirm.selectTransport", map);

		request.put("mapIdea", mapIdea);
		request.put("goods_qty_num", goods_qty_num);
		
		
	/*	String returnUrl = SkinUtils.getReturnUrl(getSessionSkin().getSkinTypeShop(), "orderConfirm");
		logger.debug("returnUrl=" + returnUrl);
		return returnUrl;*/
		
		return "orderConfirm";

	}

	//======================================
	// 주소 리스트 화면
	//======================================
	public String goodsReceipt() {
		jsSdkSttingNormal();
		SessionMember sessionMember = getSessionMember();
		
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CUST_SYS_ID", custSysId);
		map.put("IS_DEFAULT", null);
		map.put("ADDRESS_ID", null);
		
		List<Map<String, Object>> addressMap = orderConfirmService.selectList("OrderConfirm.selectCustAddress", map);
		
		request.put("addressMap", addressMap);
		request.put("addressId", addressId);
		request.put("priceOptionId", priceOptionId);
		request.put("goods_qty_num", goods_qty_num);

		/*String returnUrl = SkinUtils.getReturnUrl(getSessionSkin().getSkinTypeShop(), "goodsReceipt");
		logger.debug("returnUrl=" + returnUrl);
		return returnUrl;*/
		return "goodsReceipt";
	}

	//======================================
	// 주소 생성 화면
	//======================================
	public String addressCreate() {
		jsSdkSttingNormal();
		SessionMember sessionMember = getSessionMember();
		
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		
		AdminMap adminMap = new AdminMap();
		adminMap.setAreaLevel("1");
		adminMap.setAreaParentId(null);
		
		List<AdminMap> adminMapList = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap);
		
		request.put("adminMapList", adminMapList);
		request.put("priceOptionId", priceOptionId);
		request.put("addressIdSelected", addressIdSelected);
		request.put("goods_qty_num", goods_qty_num);

		/*String returnUrl = SkinUtils.getReturnUrl(getSessionSkin().getSkinTypeShop(), "addressCreate");
		logger.debug("returnUrl=" + returnUrl);
		return returnUrl;*/
		
		return "addressCreate";
	}

	//======================================
	// 주소 저장
	//======================================
	public String saveAddress() {
		SessionMember sessionMember = getSessionMember();
		
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		jobType = "I";
		
		String ret = "success";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CUST_SYS_ID", custSysId);
		map.put("JOB_TYPE", jobType);
		map.put("ADDRESS_ID", null);
		map.put("RECEIPTOR_NM", receiptopName);
		map.put("ADR_PROVINCE_ID", addressProvinceId);
		map.put("ADR_CITY_ID", addressCityId);
		map.put("ADR_DISTRICT_ID", addressDistrictId);
		map.put("ADR_DETAIL", addressDetail);
		map.put("ADR_ZIP", null);
		map.put("ADR_MOBILE", adrMobile);
		map.put("ADR_TEL", null);
		map.put("IS_DEFAULT", "2");
		
		Map<String, Object> mapId = orderConfirmService.select("OrderConfirm.saveCustAddress", map);
		
		Integer addressId = (Integer) mapId.get("OUT_ADDRESS_ID");
		if (addressId == null) {
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	//======================================
	// 시, 구 조회
	//======================================
	public String getMapTwoList() {
		AdminMap adminMap = new AdminMap();
		adminMap.setAreaParentId(areaParentId);
		adminMap.setAreaLevel(areaLevel);
		renderJSON(shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap));
		return NONE;
	}

	//======================================
	// 기본 주소 저장
	//======================================
	public String updateAddressDefault() {
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		String ret = "success";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CUST_SYS_ID", custSysId);
		map.put("ADDRESS_ID", addressId);
		map.put("IS_DEFAULT", "1");
		try {
			orderConfirmService.updateModifyAddress("OrderConfirm.updateDefaultAddress", map);
			orderConfirmService.updateModifyAddress("OrderConfirm.updateAddressDefault", map);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	//======================================
	// 주소 수정
	//======================================
	public String modifyAddress() {
		SessionMember sessionMember = getSessionMember();
		
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		jobType = "U";
		String ret = "success";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CUST_SYS_ID", custSysId);
		map.put("JOB_TYPE", jobType);
		map.put("ADDRESS_ID", addressId);
		map.put("RECEIPTOR_NM", receiptopName);
		map.put("ADR_PROVINCE_ID", addressProvinceId);
		map.put("ADR_CITY_ID", addressCityId);
		map.put("ADR_DISTRICT_ID", addressDistrictId);
		map.put("ADR_DETAIL", addressDetail);
		map.put("ADR_ZIP", null);
		map.put("ADR_MOBILE", adrMobile);
		map.put("ADR_TEL", null);
		map.put("IS_DEFAULT", "2");
		
		Map<String, Object> mapId = orderConfirmService.select("OrderConfirm.saveCustAddress", map);
		
		Integer addressId = (Integer) mapId.get("OUT_ADDRESS_ID");
		if (addressId == null) {
			ret = "fail";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	//======================================
	// 주소 수정
	//======================================
	public String updateAddress() {
		jsSdkSttingNormal();
		SessionMember sessionMember = getSessionMember();
		
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		
		AdminMap adminMap = new AdminMap();
		adminMap.setAreaLevel("1");
		adminMap.setAreaParentId(null);
		
		List<AdminMap> adminMapList = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap);
		
		request.put("adminMapList", adminMapList);
		request.put("priceOptionId", priceOptionId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CUST_SYS_ID", custSysId);
		map.put("IS_DEFAULT", null);
		map.put("ADDRESS_ID", addressId);
		
		Map<String, Object> addressMap = orderConfirmService.select("OrderConfirm.selectCustAddress", map);
		
		AdminMap adminMap1 = new AdminMap();
		adminMap1.setAreaLevel("2");
		adminMap1.setAreaParentId(addressMap.get("ADR_PROVINCE_ID") + "");
		
		List<AdminMap> adminMapListCity = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap1);
		
		AdminMap adminMap2 = new AdminMap();
		adminMap2.setAreaLevel("3");
		adminMap2.setAreaParentId(addressMap.get("ADR_CITY_ID") + "");
		
		List<AdminMap> adminMapListArea = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap2);
		
		request.put("adminMapListCity", adminMapListCity);
		request.put("adminMapListArea", adminMapListArea);
		request.put("addressMap", addressMap);
		request.put("addressIdSelected", addressIdSelected);
		request.put("goods_qty_num", goods_qty_num);

	/*	String returnUrl = SkinUtils.getReturnUrl(getSessionSkin().getSkinTypeShop(), "updateAddress");
		System.out.println("returnUrl=" + returnUrl);
		return returnUrl;*/
		
		return "updateAddress";

	}

	//======================================
	// 주소 삭제
	//======================================
	public String deleteAddress() {
		SessionMember sessionMember = getSessionMember();
		
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		String ret = "success";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ADDRESS_ID", addressId);
		map.put("CUST_SYS_ID", custSysId);
		
		try {
			orderConfirmService.deleteAddress("OrderConfirm.deleteAddress", map);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	public String getUsebleCouponList() throws Exception{
		SessionMember sessionMember = getSessionMember();
		
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("CUST_ID", custSysId);
		map.put("JOB_TYPE", jobType);
		List<Map<String,Object>> couponAll=commonService.selectList("OrderConfirm.getUsebleCouponList", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", couponAll);
		renderJSON(returnMap);
		return NONE;
	}	
	
	
	
	
	
	public String test(){
		return "test";
	}
	public String list2(){
		return "list2";
	}
	
	public String getSkinType() {
		return skinType;
	}
	
	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getIsReal() {
		return isReal;
	}

	public void setIsReal(String isReal) {
		this.isReal = isReal;
	}

	public String getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getTempId() {
		return tempId;
	}

	public void setTempId(String tempId) {
		this.tempId = tempId;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getDisplayId() {
		return displayId;
	}

	public void setDisplayId(String displayId) {
		this.displayId = displayId;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getShopGradeClassId() {
		return shopGradeClassId;
	}

	public void setShopGradeClassId(int shopGradeClassId) {
		this.shopGradeClassId = shopGradeClassId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getListClassName() {
		return listClassName;
	}

	public void setListClassName(String listClassName) {
		this.listClassName = listClassName;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public String getPriceOptionId() {
		return priceOptionId;
	}

	public void setPriceOptionId(String priceOptionId) {
		this.priceOptionId = priceOptionId;
	}

	public String getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public String getAreaLevel() {
		return areaLevel;
	}

	public void setAreaLevel(String areaLevel) {
		this.areaLevel = areaLevel;
	}

	public String getAreaParentId() {
		return areaParentId;
	}

	public void setAreaParentId(String areaParentId) {
		this.areaParentId = areaParentId;
	}

	public String getAddressProvinceId() {
		return addressProvinceId;
	}

	public void setAddressProvinceId(String addressProvinceId) {
		this.addressProvinceId = addressProvinceId;
	}

	public String getAddressCityId() {
		return addressCityId;
	}

	public void setAddressCityId(String addressCityId) {
		this.addressCityId = addressCityId;
	}

	public String getAddressDistrictId() {
		return addressDistrictId;
	}

	public void setAddressDistrictId(String addressDistrictId) {
		this.addressDistrictId = addressDistrictId;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getReceiptopName() {
		return receiptopName;
	}

	public void setReceiptopName(String receiptopName) {
		this.receiptopName = receiptopName;
	}

	public String getAdrMobile() {
		return adrMobile;
	}

	public void setAdrMobile(String adrMobile) {
		this.adrMobile = adrMobile;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getAddressIdSelected() {
		return addressIdSelected;
	}

	public void setAddressIdSelected(String addressIdSelected) {
		this.addressIdSelected = addressIdSelected;
	}

	public String getTransTypeId() {
		return transTypeId;
	}

	public void setTransTypeId(String transTypeId) {
		this.transTypeId = transTypeId;
	}

	public String getCustMsg() {
		return custMsg;
	}

	public void setCustMsg(String custMsg) {
		this.custMsg = custMsg;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

	public String getOrderOutId() {
		return orderOutId;
	}

	public void setOrderOutId(String orderOutId) {
		this.orderOutId = orderOutId;
	}

	public String getOrderTypeId() {
		return orderTypeId;
	}

	public void setOrderTypeId(String orderTypeId) {
		this.orderTypeId = orderTypeId;
	}

	public String getGoodsQty() {
		return goodsQty;
	}

	public void setGoodsQty(String goodsQty) {
		this.goodsQty = goodsQty;
	}

	public String getPriceSum() {
		return priceSum;
	}

	public void setPriceSum(String priceSum) {
		this.priceSum = priceSum;
	}

	public String getTransFee() {
		return transFee;
	}

	public void setTransFee(String transFee) {
		this.transFee = transFee;
	}

	public String getPriceTTBeforeNego() {
		return priceTTBeforeNego;
	}

	public void setPriceTTBeforeNego(String priceTTBeforeNego) {
		this.priceTTBeforeNego = priceTTBeforeNego;
	}

	public String getPriceTTAfterNego() {
		return priceTTAfterNego;
	}

	public void setPriceTTAfterNego(String priceTTAfterNego) {
		this.priceTTAfterNego = priceTTAfterNego;
	}

	public String getGoodsQtyOne() {
		return goodsQtyOne;
	}

	public void setGoodsQtyOne(String goodsQtyOne) {
		this.goodsQtyOne = goodsQtyOne;
	}

	public String getGoods_qty_num() {
		return goods_qty_num;
	}

	public void setGoods_qty_num(String goods_qty_num) {
		this.goods_qty_num = goods_qty_num;
	}

	public String getCustAddrId() {
		return custAddrId;
	}

	public void setCustAddrId(String custAddrId) {
		this.custAddrId = custAddrId;
	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getCouponItemId() {
		return couponItemId;
	}

	public void setCouponItemId(String couponItemId) {
		this.couponItemId = couponItemId;
	}

	public MainService getMainService() {
		return mainService;
	}

	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewImg1() {
		return reviewImg1;
	}

	public void setReviewImg1(String reviewImg1) {
		this.reviewImg1 = reviewImg1;
	}

	public String getReviewImg2() {
		return reviewImg2;
	}

	public void setReviewImg2(String reviewImg2) {
		this.reviewImg2 = reviewImg2;
	}

	public String getReviewImg3() {
		return reviewImg3;
	}

	public void setReviewImg3(String reviewImg3) {
		this.reviewImg3 = reviewImg3;
	}

	public String getReviewImg4() {
		return reviewImg4;
	}

	public void setReviewImg4(String reviewImg4) {
		this.reviewImg4 = reviewImg4;
	}

	public String getReviewImg5() {
		return reviewImg5;
	}

	public void setReviewImg5(String reviewImg5) {
		this.reviewImg5 = reviewImg5;
	}

	public String getReviewImg6() {
		return reviewImg6;
	}

	public void setReviewImg6(String reviewImg6) {
		this.reviewImg6 = reviewImg6;
	}

	public String getReviewImg7() {
		return reviewImg7;
	}

	public void setReviewImg7(String reviewImg7) {
		this.reviewImg7 = reviewImg7;
	}

	public String getReviewImg8() {
		return reviewImg8;
	}

	public void setReviewImg8(String reviewImg8) {
		this.reviewImg8 = reviewImg8;
	}

	public String getReviewImg9() {
		return reviewImg9;
	}

	public void setReviewImg9(String reviewImg9) {
		this.reviewImg9 = reviewImg9;
	}

	public String getStartDt() {
		return startDt;
	}

	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}

	public String getEndDt() {
		return endDt;
	}

	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}

	public String getStockAreaId() {
		return stockAreaId;
	}

	public void setStockAreaId(String stockAreaId) {
		this.stockAreaId = stockAreaId;
	}

	public String getGcId() {
		return gcId;
	}

	public void setGcId(String gcId) {
		this.gcId = gcId;
	}

	public String getSgcIdSplit() {
		return sgcIdSplit;
	}

	public void setSgcIdSplit(String sgcIdSplit) {
		this.sgcIdSplit = sgcIdSplit;
	}

	public String getStrPriceOrg() {
		return strPriceOrg;
	}

	public void setStrPriceOrg(String strPriceOrg) {
		this.strPriceOrg = strPriceOrg;
	}

	public String getStrPrice() {
		return strPrice;
	}

	public void setStrPrice(String strPrice) {
		this.strPrice = strPrice;
	}

	public String getStrSpecId() {
		return strSpecId;
	}

	public void setStrSpecId(String strSpecId) {
		this.strSpecId = strSpecId;
	}

	public String getStrSpecValueId() {
		return strSpecValueId;
	}

	public void setStrSpecValueId(String strSpecValueId) {
		this.strSpecValueId = strSpecValueId;
	}

	public String getStrStock() {
		return strStock;
	}

	public void setStrStock(String strStock) {
		this.strStock = strStock;
	}

	public String getStrFileUrl() {
		return strFileUrl;
	}

	public void setStrFileUrl(String strFileUrl) {
		this.strFileUrl = strFileUrl;
	}

	public String getStrFileNm() {
		return strFileNm;
	}

	public void setStrFileNm(String strFileNm) {
		this.strFileNm = strFileNm;
	}

	public String getStrContent() {
		return strContent;
	}

	public void setStrContent(String strContent) {
		this.strContent = strContent;
	}

	public OrderConfirmService getOrderConfirmService() {
		return orderConfirmService;
	}

	public void setOrderConfirmService(OrderConfirmService orderConfirmService) {
		this.orderConfirmService = orderConfirmService;
	}

	public GoodsDisplayServcie getGoodsDisplayService() {
		return goodsDisplayService;
	}

	public void setGoodsDisplayService(GoodsDisplayServcie goodsDisplayService) {
		this.goodsDisplayService = goodsDisplayService;
	}

	public ShopService getShopService() {
		return shopService;
	}

	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getItemUrl() {
		return itemUrl;
	}

	public void setItemUrl(String itemUrl) {
		this.itemUrl = itemUrl;
	}

	public String getReviewImgUrl1() {
		return reviewImgUrl1;
	}

	public void setReviewImgUrl1(String reviewImgUrl1) {
		this.reviewImgUrl1 = reviewImgUrl1;
	}

	public String getReviewImgUrl2() {
		return reviewImgUrl2;
	}

	public void setReviewImgUrl2(String reviewImgUrl2) {
		this.reviewImgUrl2 = reviewImgUrl2;
	}

	public String getReviewImgUrl3() {
		return reviewImgUrl3;
	}

	public void setReviewImgUrl3(String reviewImgUrl3) {
		this.reviewImgUrl3 = reviewImgUrl3;
	}

	public String getReviewImgUrl4() {
		return reviewImgUrl4;
	}

	public void setReviewImgUrl4(String reviewImgUrl4) {
		this.reviewImgUrl4 = reviewImgUrl4;
	}

	public String getReviewImgUrl5() {
		return reviewImgUrl5;
	}

	public void setReviewImgUrl5(String reviewImgUrl5) {
		this.reviewImgUrl5 = reviewImgUrl5;
	}

	public String getReviewImgUrl6() {
		return reviewImgUrl6;
	}

	public void setReviewImgUrl6(String reviewImgUrl6) {
		this.reviewImgUrl6 = reviewImgUrl6;
	}

	public String getReviewImgUrl7() {
		return reviewImgUrl7;
	}

	public void setReviewImgUrl7(String reviewImgUrl7) {
		this.reviewImgUrl7 = reviewImgUrl7;
	}

	public String getReviewImgUrl8() {
		return reviewImgUrl8;
	}

	public void setReviewImgUrl8(String reviewImgUrl8) {
		this.reviewImgUrl8 = reviewImgUrl8;
	}

	public String getReviewImgUrl9() {
		return reviewImgUrl9;
	}

	public void setReviewImgUrl9(String reviewImgUrl9) {
		this.reviewImgUrl9 = reviewImgUrl9;
	}

	public String getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(String orderIndex) {
		this.orderIndex = orderIndex;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	
}
