package com.waremec.wpt.admin.domain;
/**
 * 店铺的实体类用于存放店铺的信息
 * @author Administrator
 *
 */
public class AdminShop {
	//存储店铺中图片的信息
	private AdminShopFileMst adminShopFileMst=null;
	//判断存储过程的操作状态   I 插入  U 修改  D 删除
	private String jobType="";
	//[店铺] 店铺ID	SHOP_ID
	private String shopId="";
	//[店铺] 店铺名称	SHOP_NM
	private String shopName="";
	//[店铺] 公司ID	G_CORP_ID
	private String groupCorpId="";
	//[店铺] 商城ID	MKT_ID
	private String marketId="";
	//[店铺] 商城的门户店铺 0否 1是	MKT_IS_MAINSHOP
	private String marketIsMainShop="";
	//[店铺] (唯一)开放平台帐号	WX_OPENID_S
	private String wxOpenIds="";
	//[店铺] (唯一)公众账号	WX_ID_S
	private String wxIds="";
	//[店铺] (唯一)公众账号昵称	WX_NICK_NAME
	private String wxNickName="";
	//[店铺] 1服务 2订阅 3企业	WX_TYPE
	private String wxType="";
	//[店铺] 公众账号 AppId	WX_APP_ID
	private String wxAppId="";
	//[店铺] 公众账号 AppSecret	WX_APP_SECRET
	private String wxAppSecret="";
	//[店铺] 公众账号 API URL	WX_API_URL
	private String wxApiUrl="";
	//[店铺] 公众账号 API TOKEN	WX_API_TOKEN
	private String wxApiToken="";
	//[店铺] 是否使用快速关注功能	WX_IS_USE_QUIK_FOLLOW
	private String wxIsUserQuickFollow="";
	//[店铺] (后台输入)运营公司名称	CORP_NM
	private String groupCorpName="";
	//[店铺] (后台输入)运营公司营业执照号	CORP_LICENSE_NO
	private String corpLicenseNo="";
	//[店铺] 管理者(法人)_姓名	LEGAL_PERSON_NM
	private String legalPersonName="";
	//[店铺] (后台)管理者(法人)_身份证号	LEGAL_PERSON_IDCARD
	private String legalPersonIdCard="";
	//[店铺] 联系人_介绍	LEGAL_PERSON_INRTODUCE
	private String legalPersonInrtoduce="";
	//[店铺] 联系人_姓名	CONTACT_NM
	private String contactName="";
	//[店铺] 联系人_手机号	CONTACT_MOBILE_NO
	private String contactMobileNo="";
	//[店铺] 联系人_EMAIL	CONTACT_EMAIL
	private String contactEmail="";
	//[店铺] 联系人_QQ	CONTACT_QQ
	private String contactQQ="";
	//[店铺] 联系人_头像	CONTACT_HEADIMG
	private String contactHeadImg="";
	//[店铺] 地址_省份	ADR_PROVINCE_ID
	private String addressProvinceId="";
	//[店铺] 地址_城市	ADR_CITY_ID
	private String addressCityId="";
	//[店铺] 地址_区域	ADR_DISTRICT_ID
	private String addressDistrictId="";
	//[店铺] 详细	ADR_DETAIL
	private String addressDetail="";
	//[店铺] 详细	ADR_ZIP
	private String addressZip="";
	//[店铺] 详细	ADR_TEL
	private String addressTel="";
	//[店铺] 店铺分类ID	SC_ID
	private String shopClassId="";
	//[店铺] 主营商品ID	MAIN_GC_ID
	private String mainGoodsClassId="";
	//[店铺] 店铺等级(预备)	SG_ID
	private String shopLevelId="";
	//[店铺] 店铺状态：0审核中 1开启 2关闭	STS_ID
	private String statusId="";
	//[店铺] 店铺状态说明	STS_DESC
	private String statusDesc="";
	//[店铺] 店铺开业日期	OPENED_DT
	private String openDate="";
	//[店铺] 店铺关闭日期	CLOSED_DT
	private String closeDate="";
	//[店铺] 认证类型 1企业 2个人	AUTH_TYPE_ID
	private String authTypeID="";
	//[店铺] 是否认证成功 0未认证 2认证	AUTH_IS_SUCC
	private String authIsSuccess="";
	//[店铺] 证件扫描图片1	AUTH_IMG_CERT_1
	private String authImgCert1="";
	//[店铺] 证件扫描图片2	AUTH_IMG_CERT_2
	private String authImgCert2="";
	//[店铺] 证件扫描图片3	AUTH_IMG_CERT_3
	private String authImgCert3="";
	//[店铺] 证件扫描图片4	AUTH_IMG_CERT_4
	private String authImgCert4="";
	//[店铺] 证件扫描图片5	AUTH_IMG_CERT_5
	private String authImgCert5="";
	//[店铺] 店铺标志图片	IMG_LOGO_PIC
	private String imgLogoPicture="";
	//[店铺] 店铺名称图片	IMG_LOGO_LABEL
	private String imgLogoLabel="";
	//[店铺] 店铺横幅图片	IMG_BANNER
	//[店铺] 店铺印章图片	IMG_WATERMARK
	//[店铺] 店铺二维码图片	IMG_2D_BARCODE
	//[店铺] 页面标题	DESC_PAGE_CAPTION
	//[店铺] 店铺简介	DESC_INTRODUCTION
	private String descIntroduction="";
	//[店铺] 售前客服说明	DESC_BEFORE_SALES
	//[店铺] 售后客服说明	DESC_AFTER_SALES
	//[店铺] 工作时间说明	DESC_WORKINGTIME
	//[店铺] 查询关键词	SEO_TAG
	//[店铺] (统计)总销售次数	SUM_SALES_CNT
	private String sumSalesCnt="";
	//[店铺] (统计)总销量	SUM_SALES_QTY
	private String sumSalesQty="";
	//[店铺] (统计)总销额	SUM_SALES_AMT
	private String sumSalesAmt="";
	//[店铺] (统计)店铺收藏数量	SUM_COLLECTED_QTY
	private String sumCollectedQty="";
	//[店铺] (统计)好评率	AVG_PRAISE_RATE
	private String avgPraiseRate="";
	//[店铺] (统计)描述相符度平均	AVG_GOODS_DESC_SCORE
	private String avgGoodsDescScore="";
	//[店铺] (统计)服务态度平均	AVG_SERVICE_SCORE
	private String avgServiceScore="";
	//[店铺] (统计)发货速度平均	AVG_DELIVERY_RATE
	private String avgDeliveryDate="";
	//[店铺] 创建用户ID	CREATED_USER_ID
	private String createdUserId="";
	//存储判断标志。
	private String outShopId="";
	//判断操作是否成功
	private String outErrorMsg="";
	//存储创建时间
	private String createDate="";
	//职位
	private String job_type="";
	
	
	//
	private String file_url="";
		
	
	
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getDescIntroduction() {
		return descIntroduction;
	}
	public void setDescIntroduction(String descIntroduction) {
		this.descIntroduction = descIntroduction;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getGroupCorpId() {
		return groupCorpId;
	}
	public void setGroupCorpId(String groupCorpId) {
		this.groupCorpId = groupCorpId;
	}
	public String getMarketId() {
		return marketId;
	}
	public void setMarketId(String marketId) {
		this.marketId = marketId;
	}
	public String getMarketIsMainShop() {
		return marketIsMainShop;
	}
	public void setMarketIsMainShop(String marketIsMainShop) {
		this.marketIsMainShop = marketIsMainShop;
	}
	public String getWxOpenIds() {
		return wxOpenIds;
	}
	public void setWxOpenIds(String wxOpenIds) {
		this.wxOpenIds = wxOpenIds;
	}
	public String getWxIds() {
		return wxIds;
	}
	public void setWxIds(String wxIds) {
		this.wxIds = wxIds;
	}
	public String getWxNickName() {
		return wxNickName;
	}
	public void setWxNickName(String wxNickName) {
		this.wxNickName = wxNickName;
	}
	public String getWxType() {
		return wxType;
	}
	public void setWxType(String wxType) {
		this.wxType = wxType;
	}
	public String getWxAppId() {
		return wxAppId;
	}
	public void setWxAppId(String wxAppId) {
		this.wxAppId = wxAppId;
	}
	public String getWxAppSecret() {
		return wxAppSecret;
	}
	public void setWxAppSecret(String wxAppSecret) {
		this.wxAppSecret = wxAppSecret;
	}
	public String getWxApiUrl() {
		return wxApiUrl;
	}
	public void setWxApiUrl(String wxApiUrl) {
		this.wxApiUrl = wxApiUrl;
	}
	public String getWxApiToken() {
		return wxApiToken;
	}
	public void setWxApiToken(String wxApiToken) {
		this.wxApiToken = wxApiToken;
	}
	public String getWxIsUserQuickFollow() {
		return wxIsUserQuickFollow;
	}
	public void setWxIsUserQuickFollow(String wxIsUserQuickFollow) {
		this.wxIsUserQuickFollow = wxIsUserQuickFollow;
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
	public String getLegalPersonInrtoduce() {
		return legalPersonInrtoduce;
	}
	public void setLegalPersonInrtoduce(String legalPersonInrtoduce) {
		this.legalPersonInrtoduce = legalPersonInrtoduce;
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
	public String getContactHeadImg() {
		return contactHeadImg;
	}
	public void setContactHeadImg(String contactHeadImg) {
		this.contactHeadImg = contactHeadImg;
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
	public String getAddressZip() {
		return addressZip;
	}
	public void setAddressZip(String addressZip) {
		this.addressZip = addressZip;
	}
	public String getAddressTel() {
		return addressTel;
	}
	public void setAddressTel(String addressTel) {
		this.addressTel = addressTel;
	}
	public String getShopClassId() {
		return shopClassId;
	}
	public void setShopClassId(String shopClassId) {
		this.shopClassId = shopClassId;
	}
	public String getMainGoodsClassId() {
		return mainGoodsClassId;
	}
	public void setMainGoodsClassId(String mainGoodsClassId) {
		this.mainGoodsClassId = mainGoodsClassId;
	}
	public String getShopLevelId() {
		return shopLevelId;
	}
	public void setShopLevelId(String shopLevelId) {
		this.shopLevelId = shopLevelId;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getAuthTypeID() {
		return authTypeID;
	}
	public void setAuthTypeID(String authTypeID) {
		this.authTypeID = authTypeID;
	}
	public String getAuthIsSuccess() {
		return authIsSuccess;
	}
	public void setAuthIsSuccess(String authIsSuccess) {
		this.authIsSuccess = authIsSuccess;
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
	public String getAuthImgCert4() {
		return authImgCert4;
	}
	public void setAuthImgCert4(String authImgCert4) {
		this.authImgCert4 = authImgCert4;
	}
	public String getAuthImgCert5() {
		return authImgCert5;
	}
	public void setAuthImgCert5(String authImgCert5) {
		this.authImgCert5 = authImgCert5;
	}
	public String getImgLogoPicture() {
		return imgLogoPicture;
	}
	public void setImgLogoPicture(String imgLogoPicture) {
		this.imgLogoPicture = imgLogoPicture;
	}
	public String getImgLogoLabel() {
		return imgLogoLabel;
	}
	public void setImgLogoLabel(String imgLogoLabel) {
		this.imgLogoLabel = imgLogoLabel;
	}
	public String getSumSalesCnt() {
		return sumSalesCnt;
	}
	public void setSumSalesCnt(String sumSalesCnt) {
		this.sumSalesCnt = sumSalesCnt;
	}
	public String getSumSalesQty() {
		return sumSalesQty;
	}
	public void setSumSalesQty(String sumSalesQty) {
		this.sumSalesQty = sumSalesQty;
	}
	public String getSumSalesAmt() {
		return sumSalesAmt;
	}
	public void setSumSalesAmt(String sumSalesAmt) {
		this.sumSalesAmt = sumSalesAmt;
	}
	public String getSumCollectedQty() {
		return sumCollectedQty;
	}
	public void setSumCollectedQty(String sumCollectedQty) {
		this.sumCollectedQty = sumCollectedQty;
	}
	public String getAvgPraiseRate() {
		return avgPraiseRate;
	}
	public void setAvgPraiseRate(String avgPraiseRate) {
		this.avgPraiseRate = avgPraiseRate;
	}
	public String getAvgGoodsDescScore() {
		return avgGoodsDescScore;
	}
	public void setAvgGoodsDescScore(String avgGoodsDescScore) {
		this.avgGoodsDescScore = avgGoodsDescScore;
	}
	public String getAvgServiceScore() {
		return avgServiceScore;
	}
	public void setAvgServiceScore(String avgServiceScore) {
		this.avgServiceScore = avgServiceScore;
	}
	public String getAvgDeliveryDate() {
		return avgDeliveryDate;
	}
	public void setAvgDeliveryDate(String avgDeliveryDate) {
		this.avgDeliveryDate = avgDeliveryDate;
	}
	public String getCreatedUserId() {
		return createdUserId;
	}
	public void setCreatedUserId(String createdUserId) {
		this.createdUserId = createdUserId;
	}
	public String getOutShopId() {
		return outShopId;
	}
	public void setOutShopId(String outShopId) {
		this.outShopId = outShopId;
	}
	public String getOutErrorMsg() {
		return outErrorMsg;
	}
	public void setOutErrorMsg(String outErrorMsg) {
		this.outErrorMsg = outErrorMsg;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public AdminShopFileMst getAdminShopFileMst() {
		return adminShopFileMst;
	}
	public void setAdminShopFileMst(AdminShopFileMst adminShopFileMst) {
		this.adminShopFileMst = adminShopFileMst;
	}
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	
	
	
}
