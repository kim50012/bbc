package com.waremec.wpt.admin.domain;

import java.sql.Timestamp;

public class AdminUserShop {
	//用户id
	private String userId="";
	//店铺id
	private int shopId=0;
	//职位
	private int authType=0;
	//更新日期
	private Timestamp modified_dt=null;
	//创建日期
	private Timestamp create_dt=null;
	//保存类型
	private String jobType="";
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Timestamp getModified_dt() {
		return modified_dt;
	}
	public void setModified_dt(Timestamp modified_dt) {
		this.modified_dt = modified_dt;
	}
	public Timestamp getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(Timestamp create_dt) {
		this.create_dt = create_dt;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public int getAuthType() {
		return authType;
	}
	public void setAuthType(int authType) {
		this.authType = authType;
	}
	
	
}
