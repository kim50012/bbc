package com.waremec.wpt.admin.domain;

import java.util.ArrayList;
import java.util.List;

public class AdminHuman {

	/* 店铺ID */
	private Integer SHOP_ID;

	/* 用戶ID */
	private String USER_ID;
	
	/* 演讲ID */
	private Integer LECT_ID;

	/* 生成日期 */
	private String CREATE_DT;

	/* 生成ID */
	private String CREATE_ID;

	/* 更新日期 */
	private String MODIFY_DT;

	/* 更新ID */
	private String MODIFY_ID;

	/* 主讲人名称 */
	private String LECTURER_NM;

	/* 主讲人头像图片id */
	private Integer LECTURER_PICID;

	/* 主讲人头像图片url */
	private String LECTURER_PIC_URL;

	/* 主讲人介绍 */
	private String LECTURER_DESC;

	/* 演讲题目 */
	private String LECT_NM;

	/* 演讲日期 */
	private String LECT_DT;

	/* 演讲时间 */
	private String LECT_TM;

	/* 演讲介绍 */
	private String LECT_DESC;
	
	/* 演讲地址 */
	private String LECT_ADDR;

	/* 删除与否 */
	private String IS_DELETE;
	
	/* 演讲视频id */
	private Integer LECT_MOV_ID;
	
	/* 演讲视频名称 */
	private String LECT_MOV_NM;
	
	/* 演讲视频url */
	private String LECT_MOV_URL;

	/* 演讲图id */
	private Integer BANNER_ID;

	/* 演讲图url */
	private String BANNER_URL;

	/* 演讲图id */
	private Integer LECT_PIC_ID;

	/* 演讲图id */
	private String LECT_PIC_ID_S;

	/* 演讲图url */
	private String LECT_PIC_URL;

	/* 演讲图url */
	private String FILE_URL;

	/* 状态 */
	private Integer STATUS;

	/* 状态名称 */
	private String STATUS_NM;
	
	/*总数*/
	private Integer TOTAL_CNT;
	
	private Integer pageCurr;
	
	private Integer pageUnit;

	/* 状态名称 */
	private String CHECK_ING;
	
	private Integer SPONSOR_ID;
	private String  SPONSOR_URL;
	
	private Integer LECT_DESC_PIC_ID;
	private String  LECT_DESC_PIC_URL;

	public Integer getSHOP_ID() {
		return SHOP_ID;
	}

	public void setSHOP_ID(Integer sHOP_ID) {
		SHOP_ID = sHOP_ID;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public Integer getLECT_ID() {
		return LECT_ID;
	}

	public void setLECT_ID(Integer lECT_ID) {
		LECT_ID = lECT_ID;
	}

	public String getCREATE_DT() {
		return CREATE_DT;
	}

	public void setCREATE_DT(String cREATE_DT) {
		CREATE_DT = cREATE_DT;
	}

	public String getCREATE_ID() {
		return CREATE_ID;
	}

	public void setCREATE_ID(String cREATE_ID) {
		CREATE_ID = cREATE_ID;
	}

	public String getMODIFY_DT() {
		return MODIFY_DT;
	}

	public void setMODIFY_DT(String mODIFY_DT) {
		MODIFY_DT = mODIFY_DT;
	}

	public String getMODIFY_ID() {
		return MODIFY_ID;
	}

	public void setMODIFY_ID(String mODIFY_ID) {
		MODIFY_ID = mODIFY_ID;
	}

	public String getLECTURER_NM() {
		return LECTURER_NM;
	}

	public void setLECTURER_NM(String lECTURER_NM) {
		LECTURER_NM = lECTURER_NM;
	}

	public Integer getLECTURER_PICID() {
		return LECTURER_PICID;
	}

	public void setLECTURER_PICID(Integer lECTURER_PICID) {
		LECTURER_PICID = lECTURER_PICID;
	}

	public String getLECTURER_PIC_URL() {
		return LECTURER_PIC_URL;
	}

	public void setLECTURER_PIC_URL(String lECTURER_PIC_URL) {
		LECTURER_PIC_URL = lECTURER_PIC_URL;
	}

	public String getLECTURER_DESC() {
		return LECTURER_DESC;
	}

	public void setLECTURER_DESC(String lECTURER_DESC) {
		LECTURER_DESC = lECTURER_DESC;
	}

	public String getLECT_NM() {
		return LECT_NM;
	}

	public void setLECT_NM(String lECT_NM) {
		LECT_NM = lECT_NM;
	}

	public String getLECT_DT() {
		return LECT_DT;
	}

	public void setLECT_DT(String lECT_DT) {
		LECT_DT = lECT_DT;
	}

	public String getLECT_TM() {
		return LECT_TM;
	}

	public void setLECT_TM(String lECT_TM) {
		LECT_TM = lECT_TM;
	}

	public String getLECT_DESC() {
		return LECT_DESC;
	}

	public void setLECT_DESC(String lECT_DESC) {
		LECT_DESC = lECT_DESC;
	}

	public String getLECT_ADDR() {
		return LECT_ADDR;
	}

	public void setLECT_ADDR(String lECT_ADDR) {
		LECT_ADDR = lECT_ADDR;
	}

	public String getIS_DELETE() {
		return IS_DELETE;
	}

	public void setIS_DELETE(String iS_DELETE) {
		IS_DELETE = iS_DELETE;
	}

	public Integer getLECT_MOV_ID() {
		return LECT_MOV_ID;
	}

	public void setLECT_MOV_ID(Integer lECT_MOV_ID) {
		LECT_MOV_ID = lECT_MOV_ID;
	}

	public String getLECT_MOV_URL() {
		return LECT_MOV_URL;
	}

	public void setLECT_MOV_URL(String lECT_MOV_URL) {
		LECT_MOV_URL = lECT_MOV_URL;
	}

	public Integer getBANNER_ID() {
		return BANNER_ID;
	}

	public void setBANNER_ID(Integer bANNER_ID) {
		BANNER_ID = bANNER_ID;
	}

	public String getBANNER_URL() {
		return BANNER_URL;
	}

	public void setBANNER_URL(String bANNER_URL) {
		BANNER_URL = bANNER_URL;
	}

	public Integer getLECT_PIC_ID() {
		return LECT_PIC_ID;
	}

	public void setLECT_PIC_ID(Integer lECT_PIC_ID) {
		LECT_PIC_ID = lECT_PIC_ID;
	}

	public String getLECT_PIC_URL() {
		return LECT_PIC_URL;
	}

	public void setLECT_PIC_URL(String lECT_PIC_URL) {
		LECT_PIC_URL = lECT_PIC_URL;
	}

	public Integer getTOTAL_CNT() {
		return TOTAL_CNT;
	}

	public void setTOTAL_CNT(Integer tOTAL_CNT) {
		TOTAL_CNT = tOTAL_CNT;
	}

	public Integer getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(Integer pageCurr) {
		this.pageCurr = pageCurr;
	}

	public Integer getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(Integer pageUnit) {
		this.pageUnit = pageUnit;
	}

	public String getLECT_PIC_ID_S() {
		return LECT_PIC_ID_S;
	}

	public void setLECT_PIC_ID_S(String lECT_PIC_ID_S) {
		LECT_PIC_ID_S = lECT_PIC_ID_S;
	}

	public String getFILE_URL() {
		return FILE_URL;
	}

	public void setFILE_URL(String fILE_URL) {
		FILE_URL = fILE_URL;
	}

	public String getLECT_MOV_NM() {
		return LECT_MOV_NM;
	}

	public void setLECT_MOV_NM(String lECT_MOV_NM) {
		LECT_MOV_NM = lECT_MOV_NM;
	}

	public Integer getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(Integer sTATUS) {
		STATUS = sTATUS;
	}

	public String getSTATUS_NM() {
		return STATUS_NM;
	}

	public void setSTATUS_NM(String sTATUS_NM) {
		STATUS_NM = sTATUS_NM;
	}

	public String getCHECK_ING() {
		return CHECK_ING;
	}

	public void setCHECK_ING(String cHECK_ING) {
		CHECK_ING = cHECK_ING;
	}

	public Integer getSPONSOR_ID() {
		return SPONSOR_ID;
	}

	public void setSPONSOR_ID(Integer sPONSOR_ID) {
		SPONSOR_ID = sPONSOR_ID;
	}

	public String getSPONSOR_URL() {
		return SPONSOR_URL;
	}

	public void setSPONSOR_URL(String sPONSOR_URL) {
		SPONSOR_URL = sPONSOR_URL;
	}

	public Integer getLECT_DESC_PIC_ID() {
		return LECT_DESC_PIC_ID;
	}

	public void setLECT_DESC_PIC_ID(Integer lECT_DESC_PIC_ID) {
		LECT_DESC_PIC_ID = lECT_DESC_PIC_ID;
	}

	public String getLECT_DESC_PIC_URL() {
		return LECT_DESC_PIC_URL;
	}

	public void setLECT_DESC_PIC_URL(String lECT_DESC_PIC_URL) {
		LECT_DESC_PIC_URL = lECT_DESC_PIC_URL;
	}
}
