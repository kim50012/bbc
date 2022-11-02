/**   
 * @Title: AdminGoodsManageAction.java 
 * @Package com.waremec.wpt.admin.goods.action 
 * @Description:  
 * @author taebem
 * @date 2015年9月1日 下午3:11:51 
 * @version V1.0   
 */
package com.waremec.wpt.admin.goods.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.wpt.admin.domain.AdminGoodsDisplay;
import com.waremec.wpt.admin.domain.AdminGoodsDisplayClass;
import com.waremec.wpt.admin.domain.ShopGoodsClass;
import com.waremec.wpt.admin.service.GoodsSellService;

/**
 * @Package com.waremec.wpt.admin.goods.action
 * @FileName AdminGoodsManageAction
 * @Description
 * @author taebem
 * @date 2015年9月1日 下午3:11:51
 * 
 */
@Controller("adminGoodsManageAction")
@Scope(ScopeType.prototype)
public class AdminGoodsManageAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	private String userId;
	private Integer shopId;

	// 用于存储店铺商品的上架ID
	private String displayId;
	// 用于存储商品的Id
	private String goodsId;
	// 用于存储商品分类的ID
	private String sgcId = "";
	// 存储下架备注信息
	private String endDesc;
	// 用于存储商品发布结束时间
	private String endDate;
	// 用于存储上架备注信息
	private String startDesc;

	// 用于查询出商品信息后商品的排序方式
	private String orderby;

	@Resource
	private GoodsSellService goodsSellService;

	/**
	 * 出售中商品列表
	 * 
	 * @return
	 */
	public String sellList() {

		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		ShopGoodsClass shopGoodsClass = new ShopGoodsClass();
		shopGoodsClass.setShopId(shopId);
		List<ShopGoodsClass> shopGoodsClassList = goodsSellService.selectShopGoodsClass("GoodsSell.selectShopGoodsClass", shopGoodsClass);
		request.put("shopGoodsClass", shopGoodsClassList);
		Date date = new Date();
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);// Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", date);
		goodsMap.put("TEMP_ID", "01");
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		List<Map<String, Object>> goodsList = goodsSellService.selectList("GoodsSell.getGoodsSellList", goodsMap);

		PageData page = new PageData();
		if (!goodsList.isEmpty()) {
			int totalCount = (int) goodsList.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, goodsList);
		}
		request.put("page", page);

		return "sellList";
	}

	public String sellListFragment() {

		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		ShopGoodsClass shopGoodsClass = new ShopGoodsClass();
		shopGoodsClass.setShopId(shopId);
		List<ShopGoodsClass> shopGoodsClassList = goodsSellService.selectShopGoodsClass("GoodsSell.selectShopGoodsClass", shopGoodsClass);
		request.put("shopGoodsClass", shopGoodsClassList);
		Date date = new Date();
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);// Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", date);
		goodsMap.put("TEMP_ID", "01");
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		List<Map<String, Object>> goodsList = goodsSellService.selectList("GoodsSell.getGoodsSellList", goodsMap);

		PageData page = new PageData();
		if (!goodsList.isEmpty()) {
			int totalCount = (int) goodsList.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, goodsList);
		}
		request.put("page", page);

		return "sellListFragment";
	}

	/**
	 * 已售罄商品列表
	 * 
	 * @return
	 */
	public String selloutList() {

		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		ShopGoodsClass shopGoodsClass = new ShopGoodsClass();
		shopGoodsClass.setShopId(shopId);
		List<ShopGoodsClass> shopGoodsClassList = goodsSellService.selectShopGoodsClass("GoodsSell.selectShopGoodsClass", shopGoodsClass);
		request.put("shopGoodsClass", shopGoodsClassList);
		Date date = new Date();
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);// Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", date);
		goodsMap.put("TEMP_ID", "02");
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		List<Map<String, Object>> goodsList = goodsSellService.selectList("GoodsSell.getGoodsSellList", goodsMap);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		for (Map<String, Object> mapGoods : goodsList) {
			Date endDate = null;
			try {
				endDate = sdf.parse((String) mapGoods.get("END_DT"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date date1 = new Date();
			if (date1.before(endDate)) {
				mapGoods.put("isDisplay", "1");
			} else {
				mapGoods.put("isDisplay", "0");
			}
		}

		PageData page = new PageData();
		if (!goodsList.isEmpty()) {
			int totalCount = (int) goodsList.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, goodsList);
		}
		request.put("page", page);

		return "selloutList";
	}

	public String selloutListFragment() {

		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		ShopGoodsClass shopGoodsClass = new ShopGoodsClass();
		shopGoodsClass.setShopId(shopId);
		List<ShopGoodsClass> shopGoodsClassList = goodsSellService.selectShopGoodsClass("GoodsSell.selectShopGoodsClass", shopGoodsClass);
		request.put("shopGoodsClass", shopGoodsClassList);
		Date date = new Date();
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);// Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", date);
		goodsMap.put("TEMP_ID", "02");
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		List<Map<String, Object>> goodsList = goodsSellService.selectList("GoodsSell.getGoodsSellList", goodsMap);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		for (Map<String, Object> mapGoods : goodsList) {
			Date endDate = null;
			try {
				endDate = sdf.parse((String) mapGoods.get("END_DT"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date date1 = new Date();
			if (date1.before(endDate)) {
				mapGoods.put("isDisplay", "1");
			} else {
				mapGoods.put("isDisplay", "0");
			}
		}

		PageData page = new PageData();
		if (!goodsList.isEmpty()) {
			int totalCount = (int) goodsList.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, goodsList);
		}
		request.put("page", page);

		return "selloutListFragment";
	}

	/**
	 * 仓库中商品商品列表
	 * 
	 * @return
	 */
	public String storeList() {

		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		ShopGoodsClass shopGoodsClass = new ShopGoodsClass();
		shopGoodsClass.setShopId(shopId);
		List<ShopGoodsClass> shopGoodsClassList = goodsSellService.selectShopGoodsClass("GoodsSell.selectShopGoodsClass", shopGoodsClass);
		request.put("shopGoodsClass", shopGoodsClassList);
		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);// Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", null);
		goodsMap.put("TEMP_ID", "03");
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);
		List<Map<String, Object>> goodsList = goodsSellService.selectList("GoodsSell.getGoodsSellList", goodsMap);

		PageData page = new PageData();
		if (!goodsList.isEmpty()) {
			int totalCount = (int) goodsList.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, goodsList);
		}
		request.put("page", page);

		return "storeList";
	}

	public String storeListFragment() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();

		ShopGoodsClass shopGoodsClass = new ShopGoodsClass();
		shopGoodsClass.setShopId(shopId);

		List<ShopGoodsClass> shopGoodsClassList = goodsSellService.selectShopGoodsClass("GoodsSell.selectShopGoodsClass", shopGoodsClass);

		request.put("shopGoodsClass", shopGoodsClassList);

		Map<String, Object> goodsMap = new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);// Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", null);
		goodsMap.put("TEMP_ID", "03");
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", orderby);

		List<Map<String, Object>> goodsList = goodsSellService.selectList("GoodsSell.getGoodsSellList", goodsMap);

		PageData page = new PageData();
		if (!goodsList.isEmpty()) {
			int totalCount = (int) goodsList.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, goodsList);
		}
		request.put("page", page);

		return "storeListFragment";
	}

	// 商品下架操作
	public String updateDisplayGoods() {
		String ret = "success";

		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();

		AdminGoodsDisplay adminGoodsDisplay = new AdminGoodsDisplay();
		adminGoodsDisplay.setJobType("U");
		adminGoodsDisplay.setShopId(shopId + "");
		adminGoodsDisplay.setDisplayId(displayId);
		adminGoodsDisplay.setGoodsId(goodsId);
		adminGoodsDisplay.setEndDesc(endDesc);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		adminGoodsDisplay.setEndDate(sdf.format(date));

		Integer shopIdOut = goodsSellService.updateDisplayGoods("GoodsSell.publishGoods", adminGoodsDisplay);
		if (shopIdOut == 0 || shopIdOut == null) {
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	// 修改商品分组的操作。
	public String updateGoodsGroup() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		// 标志字段，用于判断修改是否成功。
		String ret = "success";
		displayId = displayId.substring(1);
		goodsId = goodsId.substring(1);
		AdminGoodsDisplayClass adminGoodsDisplayClass = new AdminGoodsDisplayClass();
		adminGoodsDisplayClass.setDisplayId(displayId);
		adminGoodsDisplayClass.setSgcId(sgcId);
		adminGoodsDisplayClass.setShopId(shopId + "");
		adminGoodsDisplayClass.setGoodsId(goodsId);
		adminGoodsDisplayClass.setJobType("U");
		Map<String, Object> map = goodsSellService.updateGoodsGroup("GoodsSell.updateGoodsGroup", adminGoodsDisplayClass);
		int id = (Integer) map.get("OUT_GOODS_DISPLAY_CLASS_ID");
		String flag = (String) map.get("OUT_ERR_MSG");
		if (id != 0 && "S".equals(flag)) {
			ret = "success";
		} else {
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * 上架商品
	 * 
	 * @return
	 */
	public String publishGoods() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String ret = "success";
		try {
			Date dateEnd = sdf.parse(endDate);
			int flag = dateEnd.compareTo(date);
			System.out.println(flag);
			if (flag <= 0) {
				ret = "failDate";
				Map<String, Object> returnMap = new HashMap<String, Object>();
				returnMap.put("result", ret);
				renderJSON(returnMap);
				return NONE;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret = "fail";
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("result", ret);
			renderJSON(returnMap);
			return NONE;
		}
		AdminGoodsDisplay adminGoodsDisplay = new AdminGoodsDisplay();
		adminGoodsDisplay.setJobType("P");
		adminGoodsDisplay.setShopId(shopId + "");
		adminGoodsDisplay.setDisplayId(displayId);
		adminGoodsDisplay.setGoodsId(goodsId);
		adminGoodsDisplay.setStartDesc(startDesc);
		adminGoodsDisplay.setEndDate(endDate);
		Integer shopIdOut = goodsSellService.updateDisplayGoods("GoodsSell.publishGoods", adminGoodsDisplay);
		if (shopIdOut == 0 || shopIdOut == null) {
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	// 删除商品
	public String deleteGoods() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		String ret = "success";
		AdminGoodsDisplay adminGoodsDisplay = new AdminGoodsDisplay();
		adminGoodsDisplay.setJobType("D");
		adminGoodsDisplay.setShopId(shopId + "");
		adminGoodsDisplay.setDisplayId(displayId);
		adminGoodsDisplay.setGoodsId(goodsId);
		adminGoodsDisplay.setIsDelete("1");
		Integer shopIdOut = goodsSellService.updateDisplayGoods("GoodsSell.publishGoods", adminGoodsDisplay);
		if (shopIdOut == 0 || shopIdOut == null) {
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getDisplayId() {
		return displayId;
	}

	public void setDisplayId(String displayId) {
		this.displayId = displayId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getEndDesc() {
		return endDesc;
	}

	public void setEndDesc(String endDesc) {
		this.endDesc = endDesc;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getSgcId() {
		return sgcId;
	}

	public void setSgcId(String sgcId) {
		this.sgcId = sgcId;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartDesc() {
		return startDesc;
	}

	public void setStartDesc(String startDesc) {
		this.startDesc = startDesc;
	}

}
