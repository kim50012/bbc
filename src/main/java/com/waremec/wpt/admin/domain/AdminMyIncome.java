package com.waremec.wpt.admin.domain;

public class AdminMyIncome {

	/*----------我的收入in----------*/
	/* 店铺Id */
	private int SHOP_ID_IN;
	
	/* 支付方式ID */
	private int PAY_TYPE_ID_IN;
	
	/* 支付方式ID */
	private String OP_TYPE_IN;

	/* User */
	private String USER_ID_IN;

	/*----------我的收入out----------*/
	/* 店铺Id */
	private String SHOP_ID;

	/* 店铺名称 */
	private String SHOP_NM;

	/* 店铺图片 */
	private String FULL_URL;

	/* 公司名称 */
	private String COMP_NM;

	/* 支付方式ID */
	private String PAY_TYPE_ID;

	/* 支付方式名称 */
	private String PAY_NAME;

	/* 支付方式图片 */
	private String LOGO_URL;

	/* 优惠描述 */
	private String PAY_PRE_DESC;

	/* 优惠日期 */
	private String PAY_PRE_DT;

	/* 优惠信息 */
	private String PAY_PRE_INFO;

	/* 使用与否 */
	private String IS_USE;

	/* 按钮控制 */
	private String IS_AVAILABLE;

	/* 本月收入 */
	private String THE_MONTH;

	/* 上月收入 */
	private String LAST_MONTH;

	/* 对比百分比*/
	private String MONTH_PER;

	/* 上升/下降 */
	private String MONTH_UP_YN;

	/* 本周收入 */
	private String THE_WEEK;

	/* 上周收入 */
	private String LAST_WEEK;

	/* 对比百分比 */
	private String WEEK_PER;

	/* 上升/下降 */
	private String WEEK_UP_YN;
	
	private int pageUnit;
	
	private int pageCurr;
	
	private String orderBy;
	
	private int TOTAL_COUNT;
	

	public int getSHOP_ID_IN() {
		return SHOP_ID_IN;
	}

	public void setSHOP_ID_IN(int sHOP_ID_IN) {
		SHOP_ID_IN = sHOP_ID_IN;
	}

	public int getPAY_TYPE_ID_IN() {
		return PAY_TYPE_ID_IN;
	}

	public void setPAY_TYPE_ID_IN(int pAY_TYPE_ID_IN) {
		PAY_TYPE_ID_IN = pAY_TYPE_ID_IN;
	}

	public String getOP_TYPE_IN() {
		return OP_TYPE_IN;
	}

	public void setOP_TYPE_IN(String oP_TYPE_IN) {
		OP_TYPE_IN = oP_TYPE_IN;
	}

	public String getUSER_ID_IN() {
		return USER_ID_IN;
	}

	public void setUSER_ID_IN(String uSER_ID_IN) {
		USER_ID_IN = uSER_ID_IN;
	}

	public String getSHOP_ID() {
		return SHOP_ID;
	}

	public void setSHOP_ID(String sHOP_ID) {
		SHOP_ID = sHOP_ID;
	}

	public String getSHOP_NM() {
		return SHOP_NM;
	}

	public void setSHOP_NM(String sHOP_NM) {
		SHOP_NM = sHOP_NM;
	}

	public String getFULL_URL() {
		return FULL_URL;
	}

	public void setFULL_URL(String fULL_URL) {
		FULL_URL = fULL_URL;
	}

	public String getCOMP_NM() {
		return COMP_NM;
	}

	public void setCOMP_NM(String cOMP_NM) {
		COMP_NM = cOMP_NM;
	}

	public String getPAY_TYPE_ID() {
		return PAY_TYPE_ID;
	}

	public void setPAY_TYPE_ID(String pAY_TYPE_ID) {
		PAY_TYPE_ID = pAY_TYPE_ID;
	}

	public String getPAY_NAME() {
		return PAY_NAME;
	}

	public void setPAY_NAME(String pAY_NAME) {
		PAY_NAME = pAY_NAME;
	}

	public String getLOGO_URL() {
		return LOGO_URL;
	}

	public void setLOGO_URL(String lOGO_URL) {
		LOGO_URL = lOGO_URL;
	}

	public String getPAY_PRE_DESC() {
		return PAY_PRE_DESC;
	}

	public void setPAY_PRE_DESC(String pAY_PRE_DESC) {
		PAY_PRE_DESC = pAY_PRE_DESC;
	}

	public String getPAY_PRE_DT() {
		return PAY_PRE_DT;
	}

	public void setPAY_PRE_DT(String pAY_PRE_DT) {
		PAY_PRE_DT = pAY_PRE_DT;
	}

	public String getPAY_PRE_INFO() {
		return PAY_PRE_INFO;
	}

	public void setPAY_PRE_INFO(String pAY_PRE_INFO) {
		PAY_PRE_INFO = pAY_PRE_INFO;
	}

	public String getIS_USE() {
		return IS_USE;
	}

	public void setIS_USE(String iS_USE) {
		IS_USE = iS_USE;
	}

	public String getIS_AVAILABLE() {
		return IS_AVAILABLE;
	}

	public void setIS_AVAILABLE(String iS_AVAILABLE) {
		IS_AVAILABLE = iS_AVAILABLE;
	}

	public String getTHE_MONTH() {
		return THE_MONTH;
	}

	public void setTHE_MONTH(String tHE_MONTH) {
		THE_MONTH = tHE_MONTH;
	}

	public String getLAST_MONTH() {
		return LAST_MONTH;
	}

	public void setLAST_MONTH(String lAST_MONTH) {
		LAST_MONTH = lAST_MONTH;
	}

	public String getMONTH_PER() {
		return MONTH_PER;
	}

	public void setMONTH_PER(String mONTH_PER) {
		MONTH_PER = mONTH_PER;
	}

	public String getMONTH_UP_YN() {
		return MONTH_UP_YN;
	}

	public void setMONTH_UP_YN(String mONTH_UP_YN) {
		MONTH_UP_YN = mONTH_UP_YN;
	}

	public String getTHE_WEEK() {
		return THE_WEEK;
	}

	public void setTHE_WEEK(String tHE_WEEK) {
		THE_WEEK = tHE_WEEK;
	}

	public String getLAST_WEEK() {
		return LAST_WEEK;
	}

	public void setLAST_WEEK(String lAST_WEEK) {
		LAST_WEEK = lAST_WEEK;
	}

	public String getWEEK_PER() {
		return WEEK_PER;
	}

	public void setWEEK_PER(String wEEK_PER) {
		WEEK_PER = wEEK_PER;
	}

	public String getWEEK_UP_YN() {
		return WEEK_UP_YN;
	}

	public void setWEEK_UP_YN(String wEEK_UP_YN) {
		WEEK_UP_YN = wEEK_UP_YN;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public int getTOTAL_COUNT() {
		return TOTAL_COUNT;
	}

	public void setTOTAL_COUNT(int tOTAL_COUNT) {
		TOTAL_COUNT = tOTAL_COUNT;
	}
}
