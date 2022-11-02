package com.waremec.wpt.admin.domain;


public class AdminGrade {
	//--[等级] 店铺ID
	private String shopId="";
	//--[等级] 等级 ID
	private String gradeId="";
	//--[等级] 等级名称
	private String gradeName="";
	//--[等级] 基准每成交易(笔)
	private String baseQty="";
	//--[等级] 基准每购买金额(元)
	private String basePrice="";
	//--[等级] 0:停用 1:使用
	private String isUse="";
	//--更新日期
	private String modifiedDt=null;
	//--创建日期				
	private String createdDt=null;
	//--更新ID
	private String modifiedId="";
	//--创建ID
	private String createdId="";
	//调用存储过程的类型
	private String jobType="";
	//评价周期
	private String evCycle="";
	//有效期限
	private String extended="";
	//购买积分
	private String buyPoint="";
	//积分值
	private String sellForCash="";
	
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getBaseQty() {
		return baseQty;
	}
	public void setBaseQty(String baseQty) {
		this.baseQty = baseQty;
	}
	public String getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(String basePrice) {
		this.basePrice = basePrice;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}

	public String getModifiedId() {
		return modifiedId;
	}
	public void setModifiedId(String modifiedId) {
		this.modifiedId = modifiedId;
	}
	public String getCreatedId() {
		return createdId;
	}
	public void setCreatedId(String createdId) {
		this.createdId = createdId;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
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
	public String getEvCycle() {
		return evCycle;
	}
	public void setEvCycle(String evCycle) {
		this.evCycle = evCycle;
	}
	public String getExtended() {
		return extended;
	}
	public void setExtended(String extended) {
		this.extended = extended;
	}
	public String getBuyPoint() {
		return buyPoint;
	}
	public void setBuyPoint(String buyPoint) {
		this.buyPoint = buyPoint;
	}
	public String getSellForCash() {
		return sellForCash;
	}
	public void setSellForCash(String sellForCash) {
		this.sellForCash = sellForCash;
	}
	
	
	
}
