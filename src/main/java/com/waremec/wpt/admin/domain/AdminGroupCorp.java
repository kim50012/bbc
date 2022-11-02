package com.waremec.wpt.admin.domain;

/**
 * 公司的实体类
 * @author Administrator
 *
 */
public class AdminGroupCorp
{
	// 公司ID
	private String	groupCorpId="";	
	//公司名称
	private String groupCorpName="";
	//公司联系人姓名
	private String contactName="";
	//联系人手机号
	private String contactMoBilePhone="";
	//联系人EMAIL
	private String contactEmail="";
	//联系人QQ
	private String contactQQ="";
	//管理用户ID
	private String adminUserId="";
	//创建用户ID
	private String createUserId="";
	//排列循序号
	private String sortNo="";
	public String getGroupCorpId() {
		return groupCorpId;
	}
	public void setGroupCorpId(String groupCorpId) {
		this.groupCorpId = groupCorpId;
	}
	public String getGroupCorpName() {
		return groupCorpName;
	}
	public void setGroupCorpName(String groupCorpName) {
		this.groupCorpName = groupCorpName;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactMoBilePhone() {
		return contactMoBilePhone;
	}
	public void setContactMoBilePhone(String contactMoBilePhone) {
		this.contactMoBilePhone = contactMoBilePhone;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactQQ() {
		return contactQQ;
	}
	public void setContactQQ(String contactQQ) {
		this.contactQQ = contactQQ;
	}
	public String getAdminUserId() {
		return adminUserId;
	}
	public void setAdminUserId(String adminUserId) {
		this.adminUserId = adminUserId;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
	
}
