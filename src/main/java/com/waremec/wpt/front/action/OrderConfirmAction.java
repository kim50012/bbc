package com.waremec.wpt.front.action;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.service.ShopService;
import com.waremec.wpt.front.domain.FrontOrder;
import com.waremec.wpt.front.domain.FrontOrderConfirm;
import com.waremec.wpt.front.service.OrderConfirmService;

@Controller("orderConfirmAction")
@Scope(ScopeType.prototype)
public class OrderConfirmAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	
	private String shopId = "";// [商品价格] 店铺ID SHOP_ID
	private String goodsId = "";// [商品价格] 商品ID GOODS_ID
	private String displayId = "";// [商品价格] 上架ID DISPLAY_ID
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

	
	@Resource
	private OrderConfirmService orderConfirmService;
	@Resource
	private ShopService shopService;
	
	/**
	 * 保存订单的页面。
	 */
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

	/**
	 * 保存用户创建的新地址
	 */
	public String checkStock() {
		
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId() + "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("GOODS_ID", goodsId);
		map.put("DISPLAY_ID", displayId);
		map.put("PRICE_OPTION_ID", priceOptionId);
		
		Map<String, Object> mapId = orderConfirmService.select("OrderConfirm.checkStock", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("STOCK_NOW", mapId.get("STOCK_NOW"));
		renderJSON(returnMap);
		
		return NONE;
	}

	/**
	 * 打开订单确认页面 并将相应信息传入页面
	 */
	public String orderConfirm() {

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

	/**
	 * 打开收货地址列表页面，显示该用户的所有 的收货地址信息
	 */
	public String goodsReceipt() {
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

	/**
	 * 打开收货人地址信息创建页面，并将省，市，区等信息传入页面
	 * 
	 * @return
	 */
	public String addressCreate() {
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

	/**
	 * 保存用户创建的新地址
	 */
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

	/**
	 * 地址的二（市）三（区）级联查
	 * 
	 * @return
	 */
	public String getMapTwoList() {
		AdminMap adminMap = new AdminMap();
		adminMap.setAreaParentId(areaParentId);
		adminMap.setAreaLevel(areaLevel);
		renderJSON(shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap));
		return NONE;
	}

	/**
	 * 修改客户的默认收货地址，并返回是否成功的信息。
	 */
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

	/**
	 * 转到客户修改收货地址信息的页面，并将该地址信息传入页面
	 */
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

	/**
	 * 保存修改后的客户收货地址信息，并返回是否成功的信息。
	 */
	public String updateAddress() {
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

	/**
	 * 进行客户收货地址的删除操作。并返回是否成功的信息。
	 */
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
	

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
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

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
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

	
}
