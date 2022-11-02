package com.waremec.wpt.admin.domain;

import java.util.ArrayList;
import java.util.List;

public class AdminGroup {
	//用户id
	private String userId="";
	//公司ID
	private String g_corp_id="";
	//公司名称
	private String g_corp_nm ="";
	//联系人姓名
	private String contact_nm="";
	//联系人手机号
	private String contact_mobile_no="";
	//联系人邮箱
	private String contact_email="";
	//联系人QQ
	private String contact_qq="";
	//管理用户ID
	private String admin_user_id="";
	//创建用户ID
	private String created_user_id="";
	//排列顺序号
	private int sort_no=0;
	//更新日期
	private String modified_dt=null;
	//创建日期
	private String created_dt=null;
	List<AdminShop> subList = new ArrayList<AdminShop>();
	/* 存储subList的长度。*/
	private String listLength="";
	//保存类型
	private String jobType="";
	private String out_corp_id="";
	private String out_err_msg="";
	
	public String getG_corp_id() {
		return g_corp_id;
	}
	
	public String getG_corp_nm() {
		return g_corp_nm;
	}
	public void setG_corp_nm(String g_corp_nm) {
		this.g_corp_nm = g_corp_nm;
	}
	public String getContact_nm() {
		return contact_nm;
	}
	public void setContact_nm(String contact_nm) {
		this.contact_nm = contact_nm;
	}
	public String getContact_mobile_no() {
		return contact_mobile_no;
	}
	public void setContact_mobile_no(String contact_mobile_no) {
		this.contact_mobile_no = contact_mobile_no;
	}
	public String getContact_email() {
		return contact_email;
	}
	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}
	public String getContact_qq() {
		return contact_qq;
	}
	public void setContact_qq(String contact_qq) {
		this.contact_qq = contact_qq;
	}
	public String getAdmin_user_id() {
		return admin_user_id;
	}
	public void setAdmin_user_id(String admin_user_id) {
		this.admin_user_id = admin_user_id;
	}
	public String getCreated_user_id() {
		return created_user_id;
	}
	public void setCreated_user_id(String created_user_id) {
		this.created_user_id = created_user_id;
	}
	public int getSort_no() {
		return sort_no;
	}
	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}
	

	public void setG_corp_id(String g_corp_id) {
		this.g_corp_id = g_corp_id;
	}

	public String getOut_corp_id() {
		return out_corp_id;
	}

	public void setOut_corp_id(String out_corp_id) {
		this.out_corp_id = out_corp_id;
	}

	public String getOut_err_msg() {
		return out_err_msg;
	}

	public void setOut_err_msg(String out_err_msg) {
		this.out_err_msg = out_err_msg;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getListLength() {
		return listLength;
	}

	public void setListLength(String listLength) {
		this.listLength = listLength;
	}

	public List<AdminShop> getSubList() {
		return subList;
	}

	public void setSubList(List<AdminShop> subList) {
		this.subList = subList;
	}

	public String getModified_dt() {
		return modified_dt;
	}

	public void setModified_dt(String modified_dt) {
		this.modified_dt = modified_dt;
	}

	public String getCreated_dt() {
		return created_dt;
	}

	public void setCreated_dt(String created_dt) {
		this.created_dt = created_dt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
