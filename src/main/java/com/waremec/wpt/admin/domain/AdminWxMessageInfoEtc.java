package com.waremec.wpt.admin.domain;

public class AdminWxMessageInfoEtc {
	//ID	
	private String id="";
	//MARK 0 ：不加星  1：加星
	private String mark="";
	//COMMENT 备注
	private String comment="";
	//调用存储的类型
	private String jobType="";
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	
}
