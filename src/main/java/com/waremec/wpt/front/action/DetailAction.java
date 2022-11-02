package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.GoodsSpec;
import com.waremec.wpt.front.domain.GoodsSpecValue;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("detailAction")
@Scope(ScopeType.prototype)
public class DetailAction extends WeixinBaseAction {
	private static final long serialVersionUID = 1L;

	private int shopId;
	private int displayId;
	private int pageId;
	private int pageType;
	private int skinType;
	private int goodsId;
	private int priceOptionId;
	private int goodsQty;
	private int totalPage;
	private int totalRecords;
	private int pageNO;
	private float priceUnitSales;
	private int loginFlag;

	public String detail() {
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		// 商品详情
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId()); // shopId
		searchMap.put("DISPLAY_ID", displayId); // displayId
		searchMap.put("CUST_SYS_ID", intCustSysId);
		Map<String, Object> detail = commonService.select("Detail.getGoodsDetail", searchMap);

		// 商品属性列表
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("DISPLAY_ID", displayId);
		List<Map<String, Object>> specList = commonService.selectList("Detail.getSpecList", searchMap);
		List<Map<String, Object>> attributeList = commonService.selectList("Detail.getGoodsAttrList", searchMap);

		// 图文详情列表

		int pageId = 0;
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("GOODS_ID", goodsId);
		searchMap.put("DISPLAY_ID", displayId);
		Map<String, Object> goodsDisplayMap = commonService.select("Detail.getGoodsDisplayDetail", searchMap);
		if (goodsDisplayMap != null && goodsDisplayMap.get("PAGE_ID") != null) {
			pageId = Integer.valueOf(goodsDisplayMap.get("PAGE_ID").toString());
		}

		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("PAGE_ID", pageId);
		searchMap.put("PAGE_TYPE", 3);
		searchMap.put("SKIN_TYPE", sessionSkin.getSkinTypeShop().toString());
		List<Map<String, Object>> imageList = commonService.selectList("Detail.getGoodsImageList", searchMap);
		
		ListUtil.convertClob2String(imageList );

		
		Integer specCount = 0;
		Set<Integer> specSet = new HashSet<Integer>();
		GoodsSpec goodsSpec = new GoodsSpec();
		GoodsSpec goodsSpec2 = new GoodsSpec();
		///////////
		for (int i = 0; i < specList.size(); i++) {
			specSet.add((Integer)specList.get(i).get("SPEC_TYPE"));
		}
		specCount = specSet.size();
		
		if(specCount == 1){
			for (int i = 0; i < specList.size(); i++) {
				Map<String,Object> item = specList.get(i);
				if(i == 0){
					goodsSpec.setSpecId((Integer) item.get("SPEC_ID"));
					goodsSpec.setSpecNm((String) item.get("SPEC_NM"));
//					 	SPEC_ID	SPEC_NM	SPEC_VALUE_ID		SPEC_ID_PARENT	SPEC_VALUE_ID_PARENT					
				}
				
				GoodsSpecValue specValue = new GoodsSpecValue();
				
				specValue.setSpecValueId((Integer) item.get("SPEC_VALUE_ID"));
				specValue.setSpecValueNm((String) item.get("SPEC_VALUE_NM"));
				specValue.setPriceOrg((String)item.get("PRICE_ORG"));
				specValue.setPriceUnitSales((String)item.get("PRICE_UNIT_SALES"));
				specValue.setPriceOptionId((Integer)item.get("PRICE_OPTION_ID"));
				specValue.setStockIn((Integer)item.get("STOCK_IN"));
				specValue.setStockNow((Integer)item.get("STOCK_NOW"));
				
				goodsSpec.getSpecValues().add(specValue);
			}
			
		}else{
			
			for (int i = 0; i < specList.size(); i++) {
				Map<String, Object> item = specList.get(i);
					String priveOrg = (String)item.get("PRICE_ORG");
					
					if(StringUtils.isEmpty(priveOrg)){
						goodsSpec.setSpecId((Integer) item.get("SPEC_ID"));
						goodsSpec.setSpecNm((String) item.get("SPEC_NM"));
						
						GoodsSpecValue specValue = new GoodsSpecValue();
						
						specValue.setSpecValueId((Integer) item.get("SPEC_VALUE_ID"));
						specValue.setSpecValueNm((String) item.get("SPEC_VALUE_NM"));
						
						goodsSpec.getSpecValues().add(specValue);
					}else{
						goodsSpec2.setSpecId((Integer) item.get("SPEC_ID"));
						goodsSpec2.setSpecNm((String) item.get("SPEC_NM"));
						
						GoodsSpecValue specValue = new GoodsSpecValue();
						
						specValue.setSpecValueId((Integer) item.get("SPEC_VALUE_ID"));
						specValue.setSpecValueNm((String) item.get("SPEC_VALUE_NM"));
						specValue.setSpecIdParent((Integer) item.get("SPEC_ID_PARENT"));
						specValue.setSpecValueIdParent((Integer) item.get("SPEC_VALUE_ID_PARENT"));
						specValue.setPriceOrg((String)item.get("PRICE_ORG"));
						specValue.setPriceUnitSales((String)item.get("PRICE_UNIT_SALES"));
						specValue.setPriceOptionId((Integer)item.get("PRICE_OPTION_ID"));
						specValue.setStockIn((Integer)item.get("STOCK_IN"));
						specValue.setStockNow((Integer)item.get("STOCK_NOW"));
						
						goodsSpec2.getSpecValues().add(specValue);
					}
					
					
				 
			}
			
			
			
		}
		
//		System.out.println(goodsSpec.toString());
//		System.out.println(goodsSpec2.toString());
		

		request.put("loginFlag", loginFlag);
		request.put("specCount", specCount);
		request.put("goodsSpec", goodsSpec);
		request.put("goodsSpec2", goodsSpec2);
		 
		//--------------------------
		//-- initial setting
		//--------------------------
		if (pageNO == 0) {
			pageNO = 1;
		}
		
		//-----------------------------------------------------------------------------------
		// 商品评价列表
		//-----------------------------------------------------------------------------------
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("GOODS_ID", goodsId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageNO);
		searchMap.put("PAGE_UNIT", 10);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Detail.getReviewList", searchMap);

		int totalCount = 0;
		if(!reviewList.isEmpty()){
			totalCount = (Integer)reviewList.get(0).get("TOTAL_CNT");
			request.put("totalRecords", totalCount);
			System.out.println("totalRecords=" + totalCount);
		}

		int pageUnit = 10;

		if (totalCount > 0) {
			if (totalCount % pageUnit == 0) {
				totalPage = totalCount / pageUnit;
			} else {
				totalPage = totalCount / pageUnit + 1;
			}
		}
		//-----------------------------------------------------------------------------------
		
		
		request.put("detail", detail);
		request.put("imageList", imageList);
		request.put("specList", specList);
		request.put("reviewList", reviewList);
		request.put("attributeList", attributeList); 
		

		String skinTypeSTR = sessionSkin.getSkinTypeShop().toString();
		

		String strReturn = "detail";

		if ((skinTypeSTR.equals("1")) || (skinTypeSTR.equals("2"))) {		//skin type 1 or 2
			strReturn = "detail";
		}
		else if ((skinTypeSTR.equals("3")) || (skinTypeSTR.equals("4"))) {		//skin type 3 or 4
			strReturn = "detail2";
		}
		else if ((skinTypeSTR.equals("5")) || (skinTypeSTR.equals("6"))) {		//skin type 5 or 6
			strReturn = "detail3";
		}
		else if ((skinTypeSTR.equals("7")) || (skinTypeSTR.equals("8"))) {		//skin type 7 or 8
			strReturn = "detail4";
		}
		else {
			strReturn = "detail";
		}
		
		return strReturn;
		
	}


	public String reserveSalesDetail() {
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
		
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}		
		
		// 商品详情
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId()); // shopId
		searchMap.put("DISPLAY_ID", displayId); // displayId
		searchMap.put("CUST_SYS_ID", intCustSysId);
		Map<String, Object> detail = commonService.select("Detail.getGoodsDetail", searchMap);

		// 商品属性列表
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("DISPLAY_ID", displayId);
		List<Map<String, Object>> specList = commonService.selectList("Detail.getSpecList", searchMap);
		List<Map<String, Object>> attributeList = commonService.selectList("Detail.getGoodsAttrList", searchMap);

		// 图文详情列表

		int pageId = 0;
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("GOODS_ID", goodsId);
		searchMap.put("DISPLAY_ID", displayId);
		Map<String, Object> goodsDisplayMap = commonService.select("Detail.getGoodsDisplayDetail", searchMap);
		if (goodsDisplayMap != null && goodsDisplayMap.get("PAGE_ID") != null) {
			pageId = Integer.valueOf(goodsDisplayMap.get("PAGE_ID").toString());
		}

		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("PAGE_ID", pageId);
		searchMap.put("PAGE_TYPE", 3);
		searchMap.put("SKIN_TYPE", sessionSkin.getSkinTypeShop().toString());
		List<Map<String, Object>> imageList = commonService.selectList("Detail.getGoodsImageList", searchMap);
		
		ListUtil.convertClob2String(imageList );

		
		Integer specCount = 0;
		Set<Integer> specSet = new HashSet<Integer>();
		GoodsSpec goodsSpec = new GoodsSpec();
		GoodsSpec goodsSpec2 = new GoodsSpec();
		///////////
		for (int i = 0; i < specList.size(); i++) {
			specSet.add((Integer)specList.get(i).get("SPEC_TYPE"));
		}
		specCount = specSet.size();
		
		if(specCount == 1){
			for (int i = 0; i < specList.size(); i++) {
				Map<String,Object> item = specList.get(i);
				if(i == 0){
					goodsSpec.setSpecId((Integer) item.get("SPEC_ID"));
					goodsSpec.setSpecNm((String) item.get("SPEC_NM"));
//					 	SPEC_ID	SPEC_NM	SPEC_VALUE_ID		SPEC_ID_PARENT	SPEC_VALUE_ID_PARENT					
				}
				
				GoodsSpecValue specValue = new GoodsSpecValue();
				
				specValue.setSpecValueId((Integer) item.get("SPEC_VALUE_ID"));
				specValue.setSpecValueNm((String) item.get("SPEC_VALUE_NM"));
				specValue.setPriceOrg((String)item.get("PRICE_ORG"));
				specValue.setPriceUnitSales((String)item.get("PRICE_UNIT_SALES"));
				specValue.setPriceOptionId((Integer)item.get("PRICE_OPTION_ID"));
				specValue.setStockIn((Integer)item.get("STOCK_IN"));
				specValue.setStockNow((Integer)item.get("STOCK_NOW"));
				
				goodsSpec.getSpecValues().add(specValue);
			}
			
		}else{
			
			for (int i = 0; i < specList.size(); i++) {
				Map<String, Object> item = specList.get(i);
					String priveOrg = (String)item.get("PRICE_ORG");
					
					if(StringUtils.isEmpty(priveOrg)){
						goodsSpec.setSpecId((Integer) item.get("SPEC_ID"));
						goodsSpec.setSpecNm((String) item.get("SPEC_NM"));
						
						GoodsSpecValue specValue = new GoodsSpecValue();
						
						specValue.setSpecValueId((Integer) item.get("SPEC_VALUE_ID"));
						specValue.setSpecValueNm((String) item.get("SPEC_VALUE_NM"));
						
						goodsSpec.getSpecValues().add(specValue);
					}else{
						goodsSpec2.setSpecId((Integer) item.get("SPEC_ID"));
						goodsSpec2.setSpecNm((String) item.get("SPEC_NM"));
						
						GoodsSpecValue specValue = new GoodsSpecValue();
						
						specValue.setSpecValueId((Integer) item.get("SPEC_VALUE_ID"));
						specValue.setSpecValueNm((String) item.get("SPEC_VALUE_NM"));
						specValue.setSpecIdParent((Integer) item.get("SPEC_ID_PARENT"));
						specValue.setSpecValueIdParent((Integer) item.get("SPEC_VALUE_ID_PARENT"));
						specValue.setPriceOrg((String)item.get("PRICE_ORG"));
						specValue.setPriceUnitSales((String)item.get("PRICE_UNIT_SALES"));
						specValue.setPriceOptionId((Integer)item.get("PRICE_OPTION_ID"));
						specValue.setStockIn((Integer)item.get("STOCK_IN"));
						specValue.setStockNow((Integer)item.get("STOCK_NOW"));
						
						goodsSpec2.getSpecValues().add(specValue);
					}
					
					
				 
			}
			
			
			
		}
		
//		System.out.println(goodsSpec.toString());
//		System.out.println(goodsSpec2.toString());
		
		request.put("loginFlag", loginFlag);
		request.put("specCount", specCount);
		request.put("goodsSpec", goodsSpec);
		request.put("goodsSpec2", goodsSpec2);
		 
		//--------------------------
		//-- initial setting
		//--------------------------
		if (pageNO == 0) {
			pageNO = 1;
		}
		
		//-----------------------------------------------------------------------------------
		// 商品评价列表
		//-----------------------------------------------------------------------------------
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("GOODS_ID", goodsId);
		searchMap.put("DISPLAY_ID", displayId);
		searchMap.put("PAGE_CURR", pageNO);
		searchMap.put("PAGE_UNIT", 10);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Detail.getReviewList", searchMap);

		int totalCount = 0;
		if(!reviewList.isEmpty()){
			totalCount = (Integer)reviewList.get(0).get("TOTAL_CNT");
			request.put("totalRecords", totalCount);
			System.out.println("totalRecords=" + totalCount);
		}

		int pageUnit = 10;

		if (totalCount > 0) {
			if (totalCount % pageUnit == 0) {
				totalPage = totalCount / pageUnit;
			} else {
				totalPage = totalCount / pageUnit + 1;
			}
		}
		//-----------------------------------------------------------------------------------
		
		
		request.put("detail", detail);
		request.put("imageList", imageList);
		request.put("specList", specList);
		request.put("reviewList", reviewList);
		request.put("attributeList", attributeList); 
		

		String skinTypeSTR = sessionSkin.getSkinTypeShop().toString();
		

		String strReturn = "detail";

//		if ((skinTypeSTR.equals("1")) || (skinTypeSTR.equals("2"))) {		//skin type 1 or 2
//			strReturn = "reserveSalesDetail";
//		}
//		else if ((skinTypeSTR.equals("3")) || (skinTypeSTR.equals("4"))) {		//skin type 3 or 4
//			strReturn = "reserveSalesDetail";
//		}
//		else if ((skinTypeSTR.equals("5")) || (skinTypeSTR.equals("6"))) {		//skin type 5 or 6
//			strReturn = "reserveSalesDetail";
//		}
//		else if ((skinTypeSTR.equals("7")) || (skinTypeSTR.equals("8"))) {		//skin type 7 or 8
//			strReturn = "reserveSalesDetail";
//		}
//		else {
//			strReturn = "reserveSalesDetail";
//		}
		
		strReturn = "reserveSalesDetail";
		
		return strReturn;
		
	}	
	
	public String addCart() {
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("JOB_TYPE", "I");
		map.put("SHOP_ID", sessionSkin.getShopId());// shopId
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());// session中取值
		map.put("GOODS_ID", goodsId);// goodsId
		map.put("DISPLAY_ID", displayId);// displayId
		map.put("PRICE_OPTION_ID", priceOptionId);// priceOptionId
		map.put("GOODS_QTY", goodsQty);
		map.put("PRICE_UNIT_SALES", String.valueOf(priceUnitSales));
		map.put("PRICE_SUM", String.valueOf(goodsQty * priceUnitSales));
		Map<String, Object> cartMap = commonService.select("Detail.addCart", map);
		cartMap.put("OUT_ERR_MSG", cartMap.get("OUT_ERR_MSG").toString());
		cartMap.put("OUT_ERR_MSG", cartMap.get("OUT_ERR_MSG").toString());
		renderJSON(cartMap);
		return NONE;
	}

	public String test() {
		return "test";
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public int getDisplayId() {
		return displayId;
	}

	public void setDisplayId(int displayId) {
		this.displayId = displayId;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public int getPageType() {
		return pageType;
	}

	public void setPageType(int pageType) {
		this.pageType = pageType;
	}

	public int getSkinType() {
		return skinType;
	}

	public void setSkinType(int skinType) {
		this.skinType = skinType;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getPriceOptionId() {
		return priceOptionId;
	}

	public void setPriceOptionId(int priceOptionId) {
		this.priceOptionId = priceOptionId;
	}

	public float getPriceUnitSales() {
		return priceUnitSales;
	}

	public void setPriceUnitSales(float priceUnitSales) {
		this.priceUnitSales = priceUnitSales;
	}

	public int getGoodsQty() {
		return goodsQty;
	}

	public void setGoodsQty(int goodsQty) {
		this.goodsQty = goodsQty;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getPageNO() {
		return pageNO;
	}

	public void setPageNO(int pageNO) {
		this.pageNO = pageNO;
	}
	public int getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}
	
}
