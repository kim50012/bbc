package com.waremec.wpt.admin.domain;

public class AdminCheckIn {
	//SHOP_ID	[签到] 用户ID	
	private String userId="";
	//SHOP_ID	[签到] 店铺ID	
	private String shopId="";
	//CHECKIN_ID	[签到] 签到ID	
	private String checkInId="";
	//TITLE	[签到] 签到题目	
	private String title="";
	//SHARE_TITLE	[签到] 共享题目	
	private String shareTitle="";
	//DESC	[签到] 签到活动内容	
	private String descs="";
	//SET_CONTINUE_DAYS	[签到] 目标连续签到天数	
	private String setContinueDays="";
	//SET_GIVE_MILEAGE	[签到] 赠送积分数量	
	private String setGiveMileage="";
	//SET_GIVE_VOUCHER	[签到] 赠送代金卷	
	private String setGiveVoucher="";
	//START_DT	[签到] 开始日期	
	private String startDt="";
	//END_DT	[签到] 结束日期	
	private String endDt="";
	//CREATED_DT	[签到] 创建日期	
	private String createdDt="";
	//调用存储过程的类型
	private String jobType="";
	//删除0：使用 1：删除
	private String isDelete="";
	
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getShareTitle() {
		return shareTitle;
	}
	public void setShareTitle(String shareTitle) {
		this.shareTitle = shareTitle;
	}
	
	public String getSetContinueDays() {
		return setContinueDays;
	}
	public void setSetContinueDays(String setContinueDays) {
		this.setContinueDays = setContinueDays;
	}
	public String getSetGiveMileage() {
		return setGiveMileage;
	}
	public void setSetGiveMileage(String setGiveMileage) {
		this.setGiveMileage = setGiveMileage;
	}
	public String getSetGiveVoucher() {
		return setGiveVoucher;
	}
	public void setSetGiveVoucher(String setGiveVoucher) {
		this.setGiveVoucher = setGiveVoucher;
	}
	public String getStartDt() {
		return startDt;
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
