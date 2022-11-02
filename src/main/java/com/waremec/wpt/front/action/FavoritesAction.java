package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.service.FavoritesService;

@Controller("favoritesAction")
@Scope(ScopeType.prototype)
public class FavoritesAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Resource
	private FavoritesService favoritesService;
	// 店铺id
	private String shopId = "";
	// 消费者id
	private String custSysId = "";
	// 商品id
	private String goodsId = "";
	// 上架id
	private String displayId = "";
	// 价格id
	private String priceOptionId = "";
	// 商品数量
	private String goodsQty = "";
	// 商品价格
	private String priceSum = "";

	/**
	 * 获取购物车里的信息并跳转到购物车列表页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String favorites() throws Exception {

		System.out.println(getRequest().getRequestURI() + "<>");

		SessionMember sessionMember = getSessionMember();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("SHOP_ID", sessionMember.getShopId() + "");
		map.put("CUST_SYS_ID", sessionMember.getCustSysId() + "");
		/*map.put("GOODS_ID", null);
		map.put("DISPLAY_ID", null);
		map.put("PRICE_OPTION_ID", null);*/
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999);
		map.put("ORDERBY", "PRICE_DESC");

		List<Map<String, Object>> favoriteslist = favoritesService.selectList("Favorites.getFavorites", map);

		request.put("favoriteslist", favoriteslist);

		/*
		 * String returnUrl =
		 * SkinUtils.getReturnUrl(getSessionSkin().getSkinTypeShop(), "cart");
		 * System.out.println("returnUrl=" + returnUrl); return returnUrl;
		 */
		return "favorites";
	}

	public String update() {
		
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId().toString();
		custSysId = sessionMember.getCustSysId().toString();
		
		Map<String, Object> saveIn = new HashMap<String, Object>();
		saveIn.put("priceOptionId", priceOptionId);
		saveIn.put("goodsQty", goodsQty);
		
		System.out.println(goodsQty);
		try {
			favoritesService.update("Favorites.num", saveIn);
			saveIn.put("status", "S");
			renderJSON(saveIn);
		} catch (Exception e) {
			saveIn.put("status", "F");
			renderJSON(saveIn);
			e.printStackTrace();
		}
		return NONE;

	}

	public String delete() {
		
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId().toString();
		custSysId = sessionMember.getCustSysId().toString();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("custSysId", custSysId);
		map.put("displayId", displayId);
		map.put("goodsId", goodsId);
		map.put("shopId", shopId);
		map.put("priceOptionId", priceOptionId);
		
		try {
			favoritesService.delete("Favorites.delete", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		return NONE;

	}

	public FavoritesService getFavoritesService() {
		return favoritesService;
	}

	public void setFavoritesService(FavoritesService favoritesService) {
		this.favoritesService = favoritesService;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
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

	public String getPriceOptionId() {
		return priceOptionId;
	}

	public void setPriceOptionId(String priceOptionId) {
		this.priceOptionId = priceOptionId;
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
}