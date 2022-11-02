package com.waremec.wpt.front.domain;

public class FrontCheckInHist {
	//用户Id
	private String userId="";
	//[签到履历] 店铺ID	
	private String shopId;
	//[签到履历] 签到ID	
	private String checkInId;
	//[签到履历] System Customer ID	
	private String custSysId;
	//[签到履历] 1进行 2成功 3失败
	private String checkInSts;
	//[签到履历] 创建日期	
	private String createdDt;
	//[签到履历] 创建日期	
	private String checkInDt;
	//调用存储类型
	private String jobType;
	
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getCheckInId() {
		return checkInId;
	}
	public void setCheckInId(String checkInId) {
		this.checkInId = checkInId;
	}
	public String getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}
	public String getCheckInSts() {
		return checkInSts;
	}
	public void setCheckInSts(String checkInSts) {
		this.checkInSts = checkInSts;
	}

	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getCheckInDt() {
		return checkInDt;
	}
	public void setCheckInDt(String checkInDt) {
		this.checkInDt = checkInDt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
