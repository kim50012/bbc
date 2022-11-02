package com.waremec.wpt.admin.domain;

import java.util.ArrayList;
import java.util.List;


public class AdminTransportSheet {
	//引入运费值表
	private AdminTransportDtl adminTransportDtl;
	//[运费模板] 店铺ID	SHOP_ID
	private String shopId;
	//[运费模板] 运费模板ID	TRANS_SHEET_ID
	private String transSheetId;
	//[运费模板] 运费模板名称	TRANS_SHEET_NM
	private String transSheetName;
	//[运费模板] 出发地点ID	FROM_AREA_ID
	private String fromAreaId;
	//[运费模板] 更新日期	MODIFIED_DT
	private String modifiedDt;
	//[运费模板] 创建日期	CREATED_DT
	private String createdDt;
	//[运费值]0:使用   1:删除
	private String  isDelete;
	//指定区域	AREA
	private String area;
	//调用存储过程的类型
	private String jobType="";
	//当前页
	private int pageUnit=0;
	//当前页的条数
	private int pageCurr=0;
	List<AdminMap> subList = new ArrayList<AdminMap>();
	/* 存储subList的长度。*/
	private String listLength="";
	//得到条数
	private String num="";
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getTransSheetId() {
		return transSheetId;
	}
	public void setTransSheetId(String transSheetId) {
		this.transSheetId = transSheetId;
	}
	public String getTransSheetName() {
		return transSheetName;
	}
	public void setTransSheetName(String transSheetName) {
		this.transSheetName = transSheetName;
	}
	public String getFromAreaId() {
		return fromAreaId;
	}
	public void setFromAreaId(String fromAreaId) {
		this.fromAreaId = fromAreaId;
	}
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public AdminTransportDtl getAdminTransportDtl() {
		return adminTransportDtl;
	}
	public void setAdminTransportDtl(AdminTransportDtl adminTransportDtl) {
		this.adminTransportDtl = adminTransportDtl;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
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
	public String getModifiedDt() {
		return modifiedDt;
	}
	public void setModifiedDt(String modifiedDt) {
		this.modifiedDt = modifiedDt;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public List<AdminMap> getSubList() {
		return subList;
	}
	public void setSubList(List<AdminMap> subList) {
		this.subList = subList;
	}
	public String getListLength() {
		return listLength;
	}
	public void setListLength(String listLength) {
		this.listLength = listLength;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
}
