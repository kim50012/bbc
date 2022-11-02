package com.waremec.wpt.admin.domain;

public class AdminPromotion {

	/*----------活动信息IN----------*/
	/* 店铺Id */
	private int shopId_IN;

	/* 用户Id */
	private String userId_IN;

	/* 活动标题 */
	private String proTitle_IN;

	/* 活动详情摘要 */
	private String proAbs_IN;

	/* 活动详情 */
	private String proDesc_IN;

	/* 活动开始时间 */
	private String proStartDt_IN;

	/* 活动结束时间 */
	private String proEndDt_IN;

	/* 活动图片名称*/
	private String proPicNm_IN;

	/* 活动图片系统名称 */
	private String proPicSysNm_IN;

	/* 活动图片大小 */
	private int proPicSize_IN;

	/* 活动图片地址 */
	private String proPicUrl_IN;

	/* 活动详细页面图片名称*/
	private String proDltPicNm_IN;

	/* 活动详细页面图片系统名称 */
	private String proDltPicSysNm_IN;

	/* 活动详细页面图片大小 */
	private int proDltPicSize_IN;

	/* 活动详细页面图片地址 */
	private String proDltPicUrl_IN;

	/* 活动主页图片ID */
	private int proPicIdF_IN;

	/* 活动子页图片ID */
	private int proPicIdS_IN;
	
	private int pageCurr = 0;

	private int pageUint = 0;

	/* 状态 */
	private String proType_IN;

	/* 状态 */
	private Integer proId_IN;

	/* 状态 */
	private int mesId_IN;

	/* 状态 */
	private String mesType_IN;

	/* 状态 */
	private String winType_IN;

	/* 状态 */
	private String custSysId_IN;

	/* 操作 */
	private String optionId_IN;

	/*----------活动信息OUT----------*/
	/* 店铺Id */
	private String PRO_ID;
	
	/* 店铺Id */
	private String PRO_TITLE;
	
	/* 店铺Id */
	private String PRO_START_DT;
	
	/* 店铺Id */
	private String PRO_END_DT;
	
	/* 店铺Id */
	private String PRO_START_DT_PC;
	
	/* 店铺Id */
	private String PRO_END_DT_PC;
	
	/* 店铺Id */
	private String PRO_TYPE;
	
	/* 店铺Id */
	private String PRO_TYPE_NM;
	
	/* 店铺Id */
	private String PRO_ABSTRACT;
	
	/* 店铺Id */
	private String PRO_DESC;
	
	/* 店铺Id */
	private String PRO_COM;
	
	/* 店铺Id */
	private String PRO_PIC_URL;
	
	/* 店铺Id */
	private String PRO_PIC_DLT_URL;
	
	/* 店铺Id */
	private String PRO_WIN_TYPE;
	
	/* 店铺Id */
	private String PRO_WIN_TYPE_NM;
	
	/* 店铺Id */
	private String RUN_OPTION;
	
	/* 店铺Id */
	private String MES_ID;
	
	/* 店铺Id */
	private String MES_NM;
	
	/* 店铺Id */
	private String MES_DT;
	
	/* 店铺Id */
	private String MES_DT_PC;
	
	/* 店铺Id */
	private String WIN_TYPE;
	
	/* 店铺Id */
	private String MES_CONTENT;
	
	/* 店铺Id */
	private String WIN_TYPE_NM;
	

	private int COUNT_TOTAL;
	
	public int getShopId_IN() {
		return shopId_IN;
	}

	public void setShopId_IN(int shopId_IN) {
		this.shopId_IN = shopId_IN;
	}

	public String getUserId_IN() {
		return userId_IN;
	}

	public void setUserId_IN(String userId_IN) {
		this.userId_IN = userId_IN;
	}

	public String getProTitle_IN() {
		return proTitle_IN;
	}

	public void setProTitle_IN(String proTitle_IN) {
		this.proTitle_IN = proTitle_IN;
	}

	public String getProDesc_IN() {
		return proDesc_IN;
	}

	public void setProDesc_IN(String proDesc_IN) {
		this.proDesc_IN = proDesc_IN;
	}

	public String getProStartDt_IN() {
		return proStartDt_IN;
	}

	public void setProStartDt_IN(String proStartDt_IN) {
		this.proStartDt_IN = proStartDt_IN;
	}

	public String getProEndDt_IN() {
		return proEndDt_IN;
	}

	public void setProEndDt_IN(String proEndDt_IN) {
		this.proEndDt_IN = proEndDt_IN;
	}

	public String getProPicNm_IN() {
		return proPicNm_IN;
	}

	public void setProPicNm_IN(String proPicNm_IN) {
		this.proPicNm_IN = proPicNm_IN;
	}

	public String getProPicSysNm_IN() {
		return proPicSysNm_IN;
	}

	public void setProPicSysNm_IN(String proPicSysNm_IN) {
		this.proPicSysNm_IN = proPicSysNm_IN;
	}

	public int getProPicSize_IN() {
		return proPicSize_IN;
	}

	public void setProPicSize_IN(int proPicSize_IN) {
		this.proPicSize_IN = proPicSize_IN;
	}

	public String getProPicUrl_IN() {
		return proPicUrl_IN;
	}

	public void setProPicUrl_IN(String proPicUrl_IN) {
		this.proPicUrl_IN = proPicUrl_IN;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUint() {
		return pageUint;
	}

	public void setPageUint(int pageUint) {
		this.pageUint = pageUint;
	}

	public String getPRO_ID() {
		return PRO_ID;
	}

	public void setPRO_ID(String pRO_ID) {
		PRO_ID = pRO_ID;
	}

	public String getPRO_TITLE() {
		return PRO_TITLE;
	}

	public void setPRO_TITLE(String pRO_TITLE) {
		PRO_TITLE = pRO_TITLE;
	}

	public String getPRO_START_DT() {
		return PRO_START_DT;
	}

	public void setPRO_START_DT(String pRO_START_DT) {
		PRO_START_DT = pRO_START_DT;
	}

	public String getPRO_END_DT() {
		return PRO_END_DT;
	}

	public void setPRO_END_DT(String pRO_END_DT) {
		PRO_END_DT = pRO_END_DT;
	}

	public String getPRO_TYPE() {
		return PRO_TYPE;
	}

	public void setPRO_TYPE(String pRO_TYPE) {
		PRO_TYPE = pRO_TYPE;
	}

	public String getPRO_TYPE_NM() {
		return PRO_TYPE_NM;
	}

	public void setPRO_TYPE_NM(String pRO_TYPE_NM) {
		PRO_TYPE_NM = pRO_TYPE_NM;
	}

	public String getPRO_DESC() {
		return PRO_DESC;
	}

	public void setPRO_DESC(String pRO_DESC) {
		PRO_DESC = pRO_DESC;
	}

	public String getPRO_COM() {
		return PRO_COM;
	}

	public void setPRO_COM(String pRO_COM) {
		PRO_COM = pRO_COM;
	}

	public String getPRO_PIC_URL() {
		return PRO_PIC_URL;
	}

	public void setPRO_PIC_URL(String pRO_PIC_URL) {
		PRO_PIC_URL = pRO_PIC_URL;
	}

	public String getPRO_WIN_TYPE() {
		return PRO_WIN_TYPE;
	}

	public void setPRO_WIN_TYPE(String pRO_WIN_TYPE) {
		PRO_WIN_TYPE = pRO_WIN_TYPE;
	}

	public String getPRO_WIN_TYPE_NM() {
		return PRO_WIN_TYPE_NM;
	}

	public void setPRO_WIN_TYPE_NM(String pRO_WIN_TYPE_NM) {
		PRO_WIN_TYPE_NM = pRO_WIN_TYPE_NM;
	}

	public String getRUN_OPTION() {
		return RUN_OPTION;
	}

	public void setRUN_OPTION(String rUN_OPTION) {
		RUN_OPTION = rUN_OPTION;
	}

	public String getPRO_START_DT_PC() {
		return PRO_START_DT_PC;
	}

	public void setPRO_START_DT_PC(String pRO_START_DT_PC) {
		PRO_START_DT_PC = pRO_START_DT_PC;
	}

	public String getPRO_END_DT_PC() {
		return PRO_END_DT_PC;
	}

	public void setPRO_END_DT_PC(String pRO_END_DT_PC) {
		PRO_END_DT_PC = pRO_END_DT_PC;
	}

	public String getProType_IN() {
		return proType_IN;
	}

	public void setProType_IN(String proType_IN) {
		this.proType_IN = proType_IN;
	}

	public Integer getProId_IN() {
		return proId_IN;
	}

	public void setProId_IN(Integer proId_IN) {
		this.proId_IN = proId_IN;
	}

	public String getMesType_IN() {
		return mesType_IN;
	}

	public void setMesType_IN(String mesType_IN) {
		this.mesType_IN = mesType_IN;
	}

	public String getWinType_IN() {
		return winType_IN;
	}

	public void setWinType_IN(String winType_IN) {
		this.winType_IN = winType_IN;
	}

	public String getCustSysId_IN() {
		return custSysId_IN;
	}

	public void setCustSysId_IN(String custSysId_IN) {
		this.custSysId_IN = custSysId_IN;
	}

	public String getMES_ID() {
		return MES_ID;
	}

	public void setMES_ID(String mES_ID) {
		MES_ID = mES_ID;
	}

	public String getMES_NM() {
		return MES_NM;
	}

	public void setMES_NM(String mES_NM) {
		MES_NM = mES_NM;
	}

	public String getMES_DT() {
		return MES_DT;
	}

	public void setMES_DT(String mES_DT) {
		MES_DT = mES_DT;
	}

	public String getWIN_TYPE() {
		return WIN_TYPE;
	}

	public void setWIN_TYPE(String wIN_TYPE) {
		WIN_TYPE = wIN_TYPE;
	}

	public String getMES_CONTENT() {
		return MES_CONTENT;
	}

	public void setMES_CONTENT(String mES_CONTENT) {
		MES_CONTENT = mES_CONTENT;
	}

	public String getWIN_TYPE_NM() {
		return WIN_TYPE_NM;
	}

	public void setWIN_TYPE_NM(String wIN_TYPE_NM) {
		WIN_TYPE_NM = wIN_TYPE_NM;
	}

	public String getMES_DT_PC() {
		return MES_DT_PC;
	}

	public void setMES_DT_PC(String mES_DT_PC) {
		MES_DT_PC = mES_DT_PC;
	}

	public int getMesId_IN() {
		return mesId_IN;
	}

	public void setMesId_IN(int mesId_IN) {
		this.mesId_IN = mesId_IN;
	}

	public String getOptionId_IN() {
		return optionId_IN;
	}

	public void setOptionId_IN(String optionId_IN) {
		this.optionId_IN = optionId_IN;
	}

	public String getProDltPicNm_IN() {
		return proDltPicNm_IN;
	}

	public void setProDltPicNm_IN(String proDltPicNm_IN) {
		this.proDltPicNm_IN = proDltPicNm_IN;
	}

	public String getProDltPicSysNm_IN() {
		return proDltPicSysNm_IN;
	}

	public void setProDltPicSysNm_IN(String proDltPicSysNm_IN) {
		this.proDltPicSysNm_IN = proDltPicSysNm_IN;
	}

	public int getProDltPicSize_IN() {
		return proDltPicSize_IN;
	}

	public void setProDltPicSize_IN(int proDltPicSize_IN) {
		this.proDltPicSize_IN = proDltPicSize_IN;
	}

	public String getProDltPicUrl_IN() {
		return proDltPicUrl_IN;
	}

	public void setProDltPicUrl_IN(String proDltPicUrl_IN) {
		this.proDltPicUrl_IN = proDltPicUrl_IN;
	}

	public String getPRO_PIC_DLT_URL() {
		return PRO_PIC_DLT_URL;
	}

	public void setPRO_PIC_DLT_URL(String pRO_PIC_DLT_URL) {
		PRO_PIC_DLT_URL = pRO_PIC_DLT_URL;
	}

	public int getProPicIdF_IN() {
		return proPicIdF_IN;
	}

	public void setProPicIdF_IN(int proPicIdF_IN) {
		this.proPicIdF_IN = proPicIdF_IN;
	}

	public int getProPicIdS_IN() {
		return proPicIdS_IN;
	}

	public void setProPicIdS_IN(int proPicIdS_IN) {
		this.proPicIdS_IN = proPicIdS_IN;
	}

	public String getProAbs_IN() {
		return proAbs_IN;
	}

	public void setProAbs_IN(String proAbs_IN) {
		this.proAbs_IN = proAbs_IN;
	}

	public String getPRO_ABSTRACT() {
		return PRO_ABSTRACT;
	}

	public void setPRO_ABSTRACT(String pRO_ABSTRACT) {
		PRO_ABSTRACT = pRO_ABSTRACT;
	}

	public int getCOUNT_TOTAL() {
		return COUNT_TOTAL;
	}

	public void setCOUNT_TOTAL(int cOUNT_TOTAL) {
		COUNT_TOTAL = cOUNT_TOTAL;
	}

}
