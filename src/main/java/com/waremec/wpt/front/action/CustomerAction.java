package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.service.ShopService;
import com.waremec.wpt.front.service.OrderConfirmService;

@Controller("customerAction")
@Scope(ScopeType.prototype)
public class CustomerAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	 
	private String shopId;
	private String customerId;
	private String custName;
	private String custMobilePhone;
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

	
	@Resource
	private OrderConfirmService orderConfirmService;
	@Resource
	private ShopService shopService;
	/**
	 * 打开点赞页面
	 * @return
	 */
	public String likeList(){
		pageUnit=6;
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("customerId", sessionMember.getCustSysId());
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		try {
			List<Map<String,Object>> list=commonService.selectList("Customer.selectBlogLikeList", map);
			ListUtil.convertClob2String(list);
//			ListUtil.printListMap(newsList);
			request.put("newsList", list);
			int pageCountTotal=0;
			if(!list.isEmpty()){
				int countTotal=(Integer) list.get(0).get("TOTAL_CNT");
				pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
			}
			request.put("pageCount", pageCountTotal);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return "likeList";
	}
	/**
	 * 加载下一页的点赞数据
	 * @return
	 */
	public String getNextLikeList(){
		pageUnit=6;
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("customerId", sessionMember.getCustSysId());
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> list=commonService.selectList("Customer.selectBlogLikeList", map);
			ListUtil.convertClob2String(list);
//			ListUtil.printListMap(newsList);
			returnMap.put("list", list);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		renderJSON(returnMap);
		return NONE;
	}
	/**
	 * 打开评论列表页面
	 * @return
	 */
	public String preViewList(){
		pageUnit=6;
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("customerId", sessionMember.getCustSysId());
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		try {
			List<Map<String,Object>> list=commonService.selectList("Customer.selectBlogPreviewList", map);
			ListUtil.convertClob2String(list);
//			ListUtil.printListMap(newsList);
			request.put("newsList", list);
			int pageCountTotal=0;
			if(!list.isEmpty()){
				int countTotal=(Integer) list.get(0).get("TOTAL_CNT");
				pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
			}
			request.put("pageCount", pageCountTotal);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return "preViewList";
	}
	/**
	 * 加载下一页的评论数据
	 * @return
	 */
	public String getNextPreviewList(){
		pageUnit=6;
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("customerId", sessionMember.getCustSysId());
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			List<Map<String,Object>> list=commonService.selectList("Customer.selectBlogPreviewList", map);
			ListUtil.convertClob2String(list);
//			ListUtil.printListMap(newsList);
			returnMap.put("list", list);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		renderJSON(returnMap);
		return NONE;
	}
	public String myPage(){
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		Map<String,Object> customer=commonService.select("Customer.getCustomerInf",map);
		request.put("customer", customer);
		return "myPage";
	}
	
	public String myInformation(){
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		Map<String,Object> customer=commonService.select("Customer.getCustomerInf",map);
		request.put("customer", customer);
		return "myInformation";
	}
	public String myInformationUpdate(){
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		Map<String,Object> customer=commonService.select("Customer.getCustomerInf",map);
		request.put("customer", customer);
		return "myInformationUpdate";
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
		request.put("addressIdSelected", addressIdSelected);

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
	//客户信息修改的Action
	public String modifyCustMessage(){
		String ret="success";
		try {
			//custName=new String(custName.getBytes("ISO-8859-1"),"UTF-8");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("custName",custName);
			map.put("custMobilePhone", custMobilePhone);
			map.put("customerId",customerId);
			Map<String,Object> mapResult=commonService.select("Customer.modifyCustMessage",map);
			Integer custId=(Integer) mapResult.get("OUT_CUST_SYS_ID");
			if(custId==0 || custId==null){
				ret="fail";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustMobilePhone() {
		return custMobilePhone;
	}

	public void setCustMobilePhone(String custMobilePhone) {
		this.custMobilePhone = custMobilePhone;
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

}
