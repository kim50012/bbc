/**   
 * @Title: AdminShopAction.java 
 * @Package com.waremec.wpt.admin.action 
 * @Description:  
 * @author taebem
 * @date 2015年7月2日 下午3:34:05 
 * @version V1.0   
 */
package com.waremec.wpt.hzm.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.wpt.admin.domain.AdminGoodsClass;
import com.waremec.wpt.admin.domain.AdminGroupCorp;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminShop;
import com.waremec.wpt.admin.domain.AdminShopClass;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.service.ShopService;

/**
 * @Package com.waremec.wpt.admin.action
 * @FileName AdminShopAction
 * @Description 跟店铺有关的Controller
 * @author taebem
 * @date 2015年7月2日 下午3:34:05
 * 
 */
@Controller("hzmShopAction")
@Scope(ScopeType.prototype)
public class Hzm_ShopAction extends BaseAction implements ServletContextAware {
	private static final long serialVersionUID = 1L;
	// 存储用户ID
	private String userId = "";
	// 存储店铺ID
	private String shopId = "";
	// 存储地址等级
	private String areaLevel = "";
	// 存储父类的ID号。
	private String areaParentId = "";
	// 存储店铺名称
	private String shopName = "";
	// 存储主营产品
	private String mainGoods = "";
	// 存储公司名称
	private String groupCorpName = "";
	// 存储公司营业执照号码
	private String corpLicenseNo = "";
	// 存储管理者（法人）姓名
	private String legalPersonName = "";
	// 存储管理者（法人）身份证号
	private String legalPersonIdCard = "";
	// 存储联系人姓名
	private String contactName = "";
	// 存储联系人手机号
	private String contactMobileNo = "";
	// 存储联系人邮箱
	private String contactEmail = "";
	// 存储联系人qq
	private String contactQQ = "";
	// 存储联系人地址省的ID
	private String addressProvinceId = "";
	// 存储联系人地址市的ID
	private String addressCityId = "";
	// 存储联系人地址区的ID
	private String addressDistrictId = "";
	// 存储地址详细信息
	private String addressDetail = "";
	// 存储店铺LOGO图片
	private String imgLogoPicture = "";
	// 存储店铺简介
	private String descIntroduction = "";
	// 存储公司ID
	private String groupCorpId = "";
	// 存储过程的操作状态 I 插入 U 修改 D 删除
	private String jobType = "";
	// 存储店铺类型ID
	private String shopClassId = "";
	// 存储店铺标志图片文件
	private File logo_input = null;
	// 存储店铺标志图片的名字
	private String logoFileName = "";
	// 存储ServletContext
	private ServletContext context = null;
	// 存储店铺验证信息图片的文件
	private File file_id1;
	// 存储店铺验证信息图片的文件
	private File file_id2;
	// 存储店铺验证信息图片的文件
	private File file_id3;
	// 存储店铺验证信息图片名字
	private String file_idName;
	// [店铺] 证件扫描图片1 AUTH_IMG_CERT_1
	private String authImgCert1 = "";
	// [店铺] 证件扫描图片2 AUTH_IMG_CERT_2
	private String authImgCert2 = "";
	// [店铺] 证件扫描图片3 AUTH_IMG_CERT_3
	private String authImgCert3 = "";

	// 存储主页的skinID
	private String skinId = "";
	// 存储当前主页的ID
	private String pageId = "";
	private String QrCodeImageName = "";
	private File QrCodeImage = null;

	@Resource
	private ShopService shopService;

	/**
	 * 打开创建店铺页面
	 * 
	 * @return 页面所需要的信息
	 */
	public String shopCreate() {
		userId = getBackSessionUserId();
		Map<String, Object> groupCorp = new HashMap<String, Object>();
		groupCorp.put("userId", userId);
		List<AdminGroupCorp> groupCorpList = (List<AdminGroupCorp>) shopService.selectShopCreateClass("Shop.groupCorpGet", groupCorp);
		request.put("groupCorpList", groupCorpList);
		AdminUser adminUser = new AdminUser();
		adminUser.setUserId(userId);
		AdminUser adminUserObject = (AdminUser) shopService.selectAdminUserByUserId("Shop.getAdminUserByUserId", adminUser);
		request.put("adminUserObject", adminUserObject);
		AdminMap adminMap = new AdminMap();
		adminMap.setAreaLevel("1");
		adminMap.setAreaParentId(null);
		List<AdminMap> adminMapList = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap);
		request.put("adminMapList", adminMapList);
		AdminGoodsClass adminGoodsClass = new AdminGoodsClass();
		List<AdminGoodsClass> adminGoodsClasseList = shopService.selectAdminGoodsClass("Shop.selectAdminGoodsClass", adminGoodsClass);
		request.put("adminGoodsClassList", adminGoodsClasseList);
		List<AdminShopClass> shopClassList = shopService.selectAdminShopClass("Shop.selectAdminShopClass");
		request.put("adminShopClassList", shopClassList);
		request.put("shopId", shopId);
		request.put("groupCorpId", groupCorpId);
		return "shopCreate";
	}

	/**
	 * 打开修改店铺页面
	 * 
	 * @return 页面所需要的信息
	 */
	public String hzm_ShopUpdate() {
		userId = getBackSessionUserId();
		// shopId = session.get(SessionUtils.SHOP_ID_SESSION).toString();
		Map<String, Object> groupCorp = new HashMap<String, Object>();
		groupCorp.put("userId", userId);
		List<AdminGroupCorp> groupCorpList = (List<AdminGroupCorp>) shopService.selectShopCreateClass("Shop.groupCorpGet", groupCorp);
		request.put("groupCorpList", groupCorpList);
		AdminUser adminUser = new AdminUser();
		adminUser.setUserId(userId);
		AdminUser adminUserObject = (AdminUser) shopService.selectAdminUserByUserId("Shop.getAdminUserByUserId", adminUser);
		request.put("adminUserObject", adminUserObject);
		AdminMap adminMap = new AdminMap();
		adminMap.setAreaLevel("1");
		adminMap.setAreaParentId(null);
		List<AdminMap> adminMapList = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap);
		request.put("adminMapList", adminMapList);
		AdminGoodsClass adminGoodsClass = new AdminGoodsClass();
		List<AdminGoodsClass> adminGoodsClasseList = shopService.selectAdminGoodsClass("Shop.selectAdminGoodsClass", adminGoodsClass);
		request.put("adminGoodsClassList", adminGoodsClasseList);
		List<AdminShopClass> shopClassList = shopService.selectAdminShopClass("Shop.selectAdminShopClass");
		request.put("adminShopClassList", shopClassList);
		AdminShop adminShop = new AdminShop();
		adminShop.setShopId(shopId);
		adminShop = shopService.selectAdminShop("Shop.selectAdminShop", adminShop);
		request.put("adminShopEntity", adminShop);
		AdminShopFileMst adminShopFileMst = new AdminShopFileMst();
		adminShopFileMst.setFileId(adminShop.getImgLogoPicture());
		adminShopFileMst.setShopId(shopId);
		adminShopFileMst.setIsUseNum("1");
		adminShopFileMst = shopService.selectAdminShopFileMst("Shop.selectAdminShopFileMst", adminShopFileMst);
		request.put("adminShopFileMst", adminShopFileMst);
		AdminMap adminMap1 = new AdminMap();
		adminMap1.setAreaLevel("2");
		adminMap1.setAreaParentId(adminShop.getAddressProvinceId());
		List<AdminMap> adminMapListCity = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap1);
		AdminMap adminMap2 = new AdminMap();
		adminMap2.setAreaLevel("3");
		adminMap2.setAreaParentId(adminShop.getAddressCityId());
		List<AdminMap> adminMapListArea = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap2);
		request.put("adminMapListCity", adminMapListCity);
		request.put("adminMapListArea", adminMapListArea);
		return "hzm_ShopUpdate";
	}

	/**
	 * 删除店铺的操作
	 * 
	 * @return 操作结果状态
	 */
	public String deleteShop() {
		String ret = "success";
		AdminShop adminShop = new AdminShop();
		adminShop.setShopId(shopId);
		adminShop.setStatusId("2");
		try {
			shopService.deleteShop("Shop.deleteShop", adminShop);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		returnMap.put("result", "删除成功");
		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * 存储修改后店铺的信息
	 * 
	 * @return
	 */
	public String hzm_UpdateShopBaseMessage() {
		userId = getBackSessionUserId();
		// shopId = session.get(SessionUtils.SHOP_ID_SESSION).toString();
		// 判断信息，判断操作是否成功。
		String ret = "SUCCESS";
		JSONObject jo = new JSONObject();
		try {
			AdminShopFileMst adminShopFileMst = new AdminShopFileMst();
			// 判断标志图片是否更改，若没更改，则不操作图片信息的修改
			if (logo_input != null) {

				UploadResult result = UploadFileUtil.upload(getRequest(), logo_input, logoFileName, UploadFileUtil.UPLOAD_LOGO);
				// /
				adminShopFileMst.setFileName(result.getOriginalFilename());
				adminShopFileMst.setFileSize(result.getFileSize() + "");
				adminShopFileMst.setFileSysname(result.getDestinationFilename());
				adminShopFileMst.setFileType("1");
				adminShopFileMst.setIsUseNum("1");
				adminShopFileMst.setFullURL(result.getFileUrl());
				adminShopFileMst.setCreatedUserId(userId);
				adminShopFileMst.setShopId(shopId);
				adminShopFileMst.setModifiedUserId(userId);
				adminShopFileMst.setJobType("U");
				adminShopFileMst.setFileId(imgLogoPicture);

				String fileId = "";
				fileId = shopService.saveShopFileMst("Shop.saveShopFileMst", adminShopFileMst);
				if (fileId == null) {
					jo.put("result", "FAIL");
					jo.put("resultLogoImg", "存储图片出现错误，请重新操作");
					renderHtml(jo.toJSONString());
					return NONE;
				}
			}
			jobType = "U";
			AdminShop adminShop = new AdminShop();
			adminShop.setCreatedUserId(userId);
			adminShop.setAdminShopFileMst(adminShopFileMst);
			adminShop.setShopName(shopName);
			adminShop.setMainGoodsClassId(mainGoods);
			adminShop.setGroupCorpName(groupCorpName);
			adminShop.setGroupCorpId(groupCorpId);
			adminShop.setCorpLicenseNo(corpLicenseNo);
			adminShop.setLegalPersonIdCard(legalPersonIdCard);
			adminShop.setLegalPersonName(legalPersonName);
			adminShop.setContactName(contactName);
			adminShop.setContactQQ(StringUtil.emptyToNull(contactQQ));
			adminShop.setContactEmail(StringUtil.emptyToNull(contactEmail));
			adminShop.setContactMobileNo(contactMobileNo);
			adminShop.setAddressProvinceId(StringUtil.emptyToNull(addressProvinceId));
			adminShop.setAddressDistrictId(StringUtil.emptyToNull(addressDistrictId));
			adminShop.setAddressCityId(StringUtil.emptyToNull(addressCityId));
			adminShop.setAddressDetail(StringUtil.emptyToNull(addressDetail));
			adminShop.setDescIntroduction(descIntroduction);
			adminShop.setShopClassId(shopClassId);
			adminShop.setJobType(jobType);
			adminShop.setMarketIsMainShop("0");
			adminShop.setStatusId("0");
			adminShop.setSumSalesCnt("0");
			adminShop.setSumSalesQty("0");
			adminShop.setSumSalesAmt("0");
			adminShop.setSumCollectedQty("0");
			adminShop.setAvgPraiseRate("0");
			adminShop.setAvgGoodsDescScore("0");
			adminShop.setAvgDeliveryDate("0");
			adminShop.setAvgServiceScore("0");
			adminShop.setShopId(shopId);
			shopId = shopService.saveShopCreate("Shop.shopSave", adminShop);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "FAIL";
			jo.put("resultLogoImg", "保存出错，请重新操作");
		}
		if (shopId.equals("0") || shopId.equals("")) {
			ret = "FAIL";
			jo.put("resultLogoImg", "保存出错，请重新操作");
		}
		jo.put("result", ret);
		jo.put("shopId", shopId);
		renderHtml(jo.toJSONString());
		return NONE;
	}

	/**
	 * 店铺验证存储验证图片
	 * 
	 * @return 存储是否成功
	 * @throws IOException
	 */
	public String saveImagesShop() throws IOException {
		userId = getBackSessionUserId();
		// shopId = session.get(SessionUtils.SHOP_ID_SESSION).toString();
		File file_id = null;
		if (file_id1 != null) {
			file_id = file_id1;
		} else if (file_id2 != null) {
			file_id = file_id2;
		} else if (file_id3 != null) {
			file_id = file_id3;
		}

		UploadResult result = UploadFileUtil.upload(getRequest(), file_id, file_idName, UploadFileUtil.UPLOAD_AUTH);

		AdminShopFileMst adminShopFileMst = new AdminShopFileMst();
		adminShopFileMst.setJobType("I");
		adminShopFileMst.setFileName(result.getOriginalFilename());
		adminShopFileMst.setFileSize(result.getFileSize() + "");
		adminShopFileMst.setFileSysname(result.getDestinationFilename());
		adminShopFileMst.setFileType("1");
		adminShopFileMst.setIsUseNum("1");
		adminShopFileMst.setFullURL(result.getFileUrl());
		adminShopFileMst.setCreatedUserId(userId);
		adminShopFileMst.setModifiedUserId(userId);
		adminShopFileMst.setShopId(shopId);
		try {
			String fileId = shopService.saveShopFileMst("Shop.saveShopFileMst", adminShopFileMst);
			JSONObject jo = new JSONObject();
			jo.put("fileId", fileId);
			jo.put("resultLogoImg", "success");
			renderHtml(jo.toJSONString());
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			JSONObject jo = new JSONObject();
			jo.put("resultLogoImg", "验证出现错误，请重新操作！");
			renderHtml(jo.toJSONString());
			return NONE;
		}
	}

	/**
	 * 验证店铺
	 * 
	 * @return 操作是否成功的信息
	 */
	public String updateShopMessage() {
		userId = getBackSessionUserId();
		// shopId = session.get(SessionUtils.SHOP_ID_SESSION).toString();
		String ret = "success";
		AdminShop adminShop = new AdminShop();
		adminShop.setAuthImgCert1(authImgCert1);
		adminShop.setAuthImgCert2(authImgCert2);
		adminShop.setAuthImgCert3(authImgCert3);
		adminShop.setShopId(shopId);
		adminShop.setStatusId("1");
		adminShop.setAuthIsSuccess("2");
		try {
			shopService.updateShopMessage("Shop.updateShop", adminShop);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		returnMap.put("result", "验证成功");
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
	 * 保存店铺的信息，即注册店铺
	 * 
	 * @return 是否成功，和其自己的shopId号
	 */
	public String saveShop() {
		userId = getBackSessionUserId();
		String ret = "SUCCESS";
		// 判断信息，判断操作是否成功。
		if (logo_input == null) {
			JSONObject jo = new JSONObject();
			jo.put("resultLogoImg", "请选择店铺Logo图片");
			renderHtml(jo.toJSONString());
			return NONE;
		}
		try {

			UploadResult result = UploadFileUtil.upload(getRequest(), logo_input, logoFileName, UploadFileUtil.UPLOAD_LOGO);

			AdminShopFileMst adminShopFileMst = new AdminShopFileMst();
			adminShopFileMst.setFileName(result.getOriginalFilename());
			adminShopFileMst.setFileSize(result.getFileSize() + "");
			adminShopFileMst.setFileSysname(result.getDestinationFilename());
			adminShopFileMst.setFileType("1");
			adminShopFileMst.setIsUseNum("1");
			adminShopFileMst.setFullURL(result.getFileUrl());
			adminShopFileMst.setCreatedUserId(userId);
			adminShopFileMst.setModifiedUserId(userId);

			jobType = "I";

			AdminShop adminShop = new AdminShop();
			adminShop.setCreatedUserId(userId);
			adminShop.setAdminShopFileMst(adminShopFileMst);
			adminShop.setShopName(shopName);
			adminShop.setMainGoodsClassId(mainGoods);
			adminShop.setGroupCorpName(groupCorpName);
			adminShop.setGroupCorpId(groupCorpId);
			adminShop.setCorpLicenseNo(corpLicenseNo);
			adminShop.setLegalPersonIdCard(legalPersonIdCard);
			adminShop.setLegalPersonName(legalPersonName);
			adminShop.setContactName(contactName);
			adminShop.setContactQQ(StringUtil.emptyToNull(contactQQ));
			adminShop.setContactEmail(StringUtil.emptyToNull(contactEmail));
			adminShop.setContactMobileNo(contactMobileNo);
			adminShop.setAddressProvinceId(StringUtil.emptyToNull(addressProvinceId));
			adminShop.setAddressDistrictId(StringUtil.emptyToNull(addressDistrictId));
			adminShop.setAddressCityId(StringUtil.emptyToNull(addressCityId));
			adminShop.setAddressDetail(StringUtil.emptyToNull(addressDetail));
			adminShop.setDescIntroduction(descIntroduction);
			adminShop.setShopClassId(shopClassId);
			adminShop.setJobType(jobType);
			adminShop.setMarketIsMainShop("0");
			adminShop.setStatusId("0");
			adminShop.setSumSalesCnt("0");
			adminShop.setSumSalesQty("0");
			adminShop.setSumSalesAmt("0");
			adminShop.setSumCollectedQty("0");
			adminShop.setAvgPraiseRate("0");
			adminShop.setAvgGoodsDescScore("0");
			adminShop.setAvgDeliveryDate("0");
			adminShop.setAvgServiceScore("0");
			adminShop.setShopId(null);
			shopId = shopService.saveShopCreate("Shop.shopSave", adminShop);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "FAIL";
		}
		if (shopId.equals("")) {
			ret = "FAIL";
		}
		JSONObject jo = new JSONObject();
		jo.put("result", ret);
		jo.put("shopId", shopId);
		renderHtml(jo.toJSONString());
		return NONE;
	}

	// 跳转店铺主页页面
	public String shopMainPage() {
		shopId = getBackSessionShopId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		Map<String, Object> resultMap = commonService.select("ShopMainPage.selectShopPage", map);
		request.put("resultMap", resultMap);
		return "shopMainPage";
	}

	// 修改店铺主页
	public String hzm_UpdateShopPage() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("skinId", skinId);
		map.put("pageId", pageId);
		map.put("userId", userId);
		String ret = "success";
		if (QrCodeImage != null) {
			UploadResult result = UploadFileUtil.upload(getRequest(), QrCodeImage, QrCodeImageName, UploadFileUtil.UPLOAD_LOGO);
			map.put("fileId", null);
			map.put("fileName", result.getOriginalFilename());
			map.put("fileSysName", result.getDestinationFilename());
			map.put("fileType", 1);
			map.put("fileSize", result.getFileSize());
			map.put("fileUrl", result.getFileUrl());
			map.put("isUse", "1");
			map.put("modifiedId", null);
			map.put("createdId", userId);
			Map<String, Object> resultMap = commonService.select("ShopMainPage.updateShop", map);
			Integer fileId = (Integer) resultMap.get("OUT_FILE_ID");
			if (fileId == 0 || fileId == null) {
				ret = "fail";
			}
		}

		// by dikim 2015 02 09
		// commonService.update("ShopMainPage.updateShopPage", map);
		if (ret == "success") {
			commonService.select("ShopMainPage.updateShopPage2", map);
		}
		JSONObject jo = new JSONObject();
		jo.put("result", ret);
		renderHtml(jo.toJSONString());
		return NONE;
	}

	public String getGroupCorpId() {
		return groupCorpId;
	}

	public void setGroupCorpId(String groupCorpId) {
		this.groupCorpId = groupCorpId;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getMainGoods() {
		return mainGoods;
	}

	public void setMainGoods(String mainGoods) {
		this.mainGoods = mainGoods;
	}

	public String getGroupCorpName() {
		return groupCorpName;
	}

	public void setGroupCorpName(String groupCorpName) {
		this.groupCorpName = groupCorpName;
	}

	public String getCorpLicenseNo() {
		return corpLicenseNo;
	}

	public void setCorpLicenseNo(String corpLicenseNo) {
		this.corpLicenseNo = corpLicenseNo;
	}

	public String getLegalPersonName() {
		return legalPersonName;
	}

	public void setLegalPersonName(String legalPersonName) {
		this.legalPersonName = legalPersonName;
	}

	public String getLegalPersonIdCard() {
		return legalPersonIdCard;
	}

	public void setLegalPersonIdCard(String legalPersonIdCard) {
		this.legalPersonIdCard = legalPersonIdCard;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactMobileNo() {
		return contactMobileNo;
	}

	public void setContactMobileNo(String contactMobileNo) {
		this.contactMobileNo = contactMobileNo;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactQQ() {
		return contactQQ;
	}

	public void setContactQQ(String contactQQ) {
		this.contactQQ = contactQQ;
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

	public String getImgLogoPicture() {
		return imgLogoPicture;
	}

	public void setImgLogoPicture(String imgLogoPicture) {
		this.imgLogoPicture = imgLogoPicture;
	}

	public String getDescIntroduction() {
		return descIntroduction;
	}

	public void setDescIntroduction(String descIntroduction) {
		this.descIntroduction = descIntroduction;
	}

	public String getShopClassId() {
		return shopClassId;
	}

	public void setShopClassId(String shopClassId) {
		this.shopClassId = shopClassId;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public File getLogo_input() {
		return logo_input;
	}

	public void setLogo_input(File logo_input) {
		this.logo_input = logo_input;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.context = context;
	}

	public String getAuthImgCert1() {
		return authImgCert1;
	}

	public void setAuthImgCert1(String authImgCert1) {
		this.authImgCert1 = authImgCert1;
	}

	public String getAuthImgCert2() {
		return authImgCert2;
	}

	public void setAuthImgCert2(String authImgCert2) {
		this.authImgCert2 = authImgCert2;
	}

	public String getAuthImgCert3() {
		return authImgCert3;
	}

	public void setAuthImgCert3(String authImgCert3) {
		this.authImgCert3 = authImgCert3;
	}

	public String getFile_idName() {
		return file_idName;
	}

	public void setFile_idName(String file_idName) {
		this.file_idName = file_idName;
	}

	public File getFile_id1() {
		return file_id1;
	}

	public void setFile_id1(File file_id1) {
		this.file_id1 = file_id1;
	}

	public File getFile_id2() {
		return file_id2;
	}

	public void setFile_id2(File file_id2) {
		this.file_id2 = file_id2;
	}

	public File getFile_id3() {
		return file_id3;
	}

	public void setFile_id3(File file_id3) {
		this.file_id3 = file_id3;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getSkinId() {
		return skinId;
	}

	public void setSkinId(String skinId) {
		this.skinId = skinId;
	}

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public String getQrCodeImageName() {
		return QrCodeImageName;
	}

	public void setQrCodeImageName(String qrCodeImageName) {
		QrCodeImageName = qrCodeImageName;
	}

	public File getQrCodeImage() {
		return QrCodeImage;
	}

	public void setQrCodeImage(File qrCodeImage) {
		QrCodeImage = qrCodeImage;
	}

}
