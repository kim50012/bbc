package com.waremec.wpt.admin.domain;

import java.sql.Timestamp;

public class AdminTransportDtl {
	//[运费值] 店铺ID	
	private String shopId;
	//[运费值] 运费模板ID	
	private String transSheetId;
	//[运费值] 1快递 2EMS 3平邮
	public String transTypeId;
	//[运费值] 到达地点ID (市/县)
	private String toAreaId;
	//[运费值] 上一个地点ID (省/直辖市)
	private String toAreaParentId;
	//[运费值] 到达地点ID (市/县)名称
	private String areaName;
	//[运费值] 上一个地点ID (省/直辖市)名称
	private String areaPName;
	//[运费值] 是否默认运费1是2否
	private String isDefault;	
	//[运费值] 首件运费
	private String transFee;
	//[运费值] 续件运费
	private String transFeeAdd;
	//[运费值] 更新日期
	private Timestamp modifiedDt;
	//[运费值] 创建日期	SMALLDATETIME
	private Timestamp createdDt;
	//[运费值]0:使用   1:删除
	private String  isDelete;
	
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
	public String getTransTypeId() {
		return transTypeId;
	}
	public void setTransTypeId(String transTypeId) {
		this.transTypeId = transTypeId;
	}

	public String getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}
	public String getTransFee() {
		return transFee;
	}
	public void setTransFee(String transFee) {
		this.transFee = transFee;
	}
	public String getTransFeeAdd() {
		return transFeeAdd;
	}
	public void setTransFeeAdd(String transFeeAdd) {
		this.transFeeAdd = transFeeAdd;
	}
	public Timestamp getModifiedDt() {
		return modifiedDt;
	}
	public void setModifiedDt(Timestamp modifiedDt) {
		this.modifiedDt = modifiedDt;
	}
	public Timestamp getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(Timestamp createdDt) {
		this.createdDt = createdDt;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaPName() {
		return areaPName;
	}
	public void setAreaPName(String areaPName) {
		this.areaPName = areaPName;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getToAreaId() {
		return toAreaId;
	}
	public void setToAreaId(String toAreaId) {
		this.toAreaId = toAreaId;
	}
	public String getToAreaParentId() {
		return toAreaParentId;
	}
	public void setToAreaParentId(String toAreaParentId) {
		this.toAreaParentId = toAreaParentId;
	}

}
