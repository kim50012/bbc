package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

@Controller("mainAction")
@Scope(ScopeType.prototype)
public class MainAction extends WeixinBaseAction {
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
	


	@Resource
	protected MainService mainService;
	

	 public String main() {
		 
		jsSdkStting();

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
		

		skinType = sessionSkin.getSkinTypeShop().toString();

		String pageIdShopMain = sessionSkin.getPageIdShopMain().toString();
		
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId().toString());
		searchMap.put("PAGE_ID", pageIdShopMain);
		searchMap.put("PAGE_TYPE", "1");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> temp01 = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("temp01", temp01);
		
//		ListUtil.printListMap(classList);
//		ListUtil.printListMap(brandList);
//		ListUtil.printListMap(temp01);
		
		String strReturn = "main";

		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "main";
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "main2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "main3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "main4";
		}
		else {
			strReturn = "main";
		}
		
		return strReturn;
	}

	 public String home() {
			
		 jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		//if(sessionSkin == null){
//			sessionSkin = mainService.getSessionSkinByShopId(sessionMember.getShopId().toString());
//			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		//}
		 
		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassGrade1List",searchMap);
		request.put("classList", classList);
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", sessionSkin.getShopId());
		
		List<Map<String,Object>> bannerList=commonService.selectList("Main.getShopBannerList",classMap);
		request.put("bannerList", bannerList);		

		skinType = sessionSkin.getSkinTypeShop().toString();
		
		
		String pageIdShopHome = sessionSkin.getPageIdShopHome().toString();
		
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId().toString());
		searchMap.put("PAGE_ID", pageIdShopHome);
		searchMap.put("PAGE_TYPE", "1");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> temp01 = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("temp01", temp01);	
//		ListUtil.printListMap(classList);
//		ListUtil.printListMap(brandList);
//		ListUtil.printListMap(temp01);
		
		String strReturn = "home";
		
		
		return strReturn;
	}
	


	 public String hzmHome() {
			
		 jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);

		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassGrade1List",searchMap);
		request.put("classList", classList);
		
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", sessionSkin.getShopId());
		
		List<Map<String,Object>> bannerList=commonService.selectList("Main.getShopBannerList",classMap);
		request.put("bannerList", bannerList);		

		skinType = sessionSkin.getSkinTypeShop().toString();
		
		
		String pageIdShopHome = sessionSkin.getPageIdShopHome().toString();
		
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId().toString());
		searchMap.put("PAGE_ID", pageIdShopHome);
		searchMap.put("PAGE_TYPE", "1");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> temp01 = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("temp01", temp01);	
//		ListUtil.printListMap(classList);
//		ListUtil.printListMap(brandList);
//		ListUtil.printListMap(temp01);
		
		String strReturn = "home";
		
		
		return strReturn;
	}	 
	 
	/**
	 * @return
	 */
	public String main2(){
		jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		
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
		


		skinType = sessionSkin.getSkinTypeShop().toString();

		String pageIdShopMain = sessionSkin.getPageIdShopMain().toString();
		
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId().toString());
		searchMap.put("PAGE_ID", pageIdShopMain);
		searchMap.put("PAGE_TYPE", "1");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> temp01 = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("temp01", temp01);
		
//		ListUtil.printListMap(classList);
//		ListUtil.printListMap(brandList);
//		ListUtil.printListMap(temp01);
 	
		String strReturn = "main";

		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "main";
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "main2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "main3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "main4";
		}
		else {
			strReturn = "main";
		}
		
		return strReturn;
	}

	
	//---------------------------------------------------------------
	// mian sub
	//---------------------------------------------------------------
	 public String mainSub() {

			jsSdkStting();

			SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
//			if(sessionSkin == null){
			sessionSkin = mainService.getSessionSkinByShopId(sessionSkin.getShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
//			}
					
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
			

			skinType = sessionSkin.getSkinTypeShop().toString();

			String pageIdShopMain = sessionSkin.getPageIdShopMain().toString();
			
			searchMap.clear();
			searchMap.put("SHOP_ID", sessionSkin.getShopId().toString());
			searchMap.put("PAGE_ID", pageId);
			searchMap.put("PAGE_TYPE", "1");
			searchMap.put("SKIN_TYPE", skinType);
			searchMap.put("TMPL_NO", null);
			List<Map<String, Object>> temp01 = commonService.selectList("Main.getTemplate01List", searchMap);
			request.put("temp01", temp01);
			
//			ListUtil.printListMap(classList);
//			ListUtil.printListMap(brandList);
//			ListUtil.printListMap(temp01);
			
			String strReturn = "main";
			System.out.println("------------------"+skinType);
			if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
				strReturn = "main";
			}
			else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
				strReturn = "main2";
			}
			else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
				strReturn = "main3";
			}
			else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
				strReturn = "main4";
			}
			else {
				strReturn = "main";
			}
			
			return strReturn;
	}

	 
	//---------------------------------------------------------------
	// not used
	//---------------------------------------------------------------
	public String detail(){
		
		return "detail";
	}



	 public String category() {
		 jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		 
		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassTreeList",searchMap);
		request.put("classList", classList);
		//品牌
		
		skinType = sessionSkin.getSkinTypeShop().toString();

		return "category";
	}
	
		 
	//---------------------------------------------------------------
	// intro		do not used (by dikim 2015.04.02) intro --> home changed
	//---------------------------------------------------------------
	public String intro(){
		jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		 
		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());

		skinType = sessionSkin.getSkinTypeShop().toString();

		String pageIdShopHome = sessionSkin.getPageIdShopHome().toString();
		
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId().toString());
		searchMap.put("PAGE_ID", pageIdShopHome);
		searchMap.put("PAGE_TYPE", "1");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> temp01 = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("temp01", temp01);
		
		return "intro";
	}


	//---------------------------------------------------------------
	// mobile list
	//---------------------------------------------------------------
	public String list() throws Exception{
		jsSdkStting();
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
		jsSdkStting();
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

	
}
