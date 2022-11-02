package com.waremec.wpt.admin.domain;

import java.sql.Timestamp;

public class AdminCustShop {
	//[客户_店铺] System Customer ID
	private int cust_sys_id=0;
	//[客户_店铺] 店铺ID
	private int shopId=0;
	//[客户_店铺] 创建日期
	private Timestamp created_dt=null;
	//[客户_店铺] 客户等级
	private String gradeId="";
	//[客户_店铺] 客户积分
	private String custPoint="";
	//[客户_店铺] 调用存储类型
	private String jobType="";
		
	public int getCust_sys_id() {
		return cust_sys_id;
	}
	public void setCust_sys_id(int cust_sys_id) {
		this.cust_sys_id = cust_sys_id;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public Timestamp getCreated_dt() {
		return created_dt;
	}
	public void setCreated_dt(Timestamp created_dt) {
		this.created_dt = created_dt;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getCustPoint() {
		return custPoint;
	}
	public void setCustPoint(String custPoint) {
		this.custPoint = custPoint;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	
}
