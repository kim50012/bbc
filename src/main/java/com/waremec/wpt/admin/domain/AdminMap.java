package com.waremec.wpt.admin.domain;
/**
 * 地址的实体类
 * @author Administrator
 *
 */
public class AdminMap 
{	
	//引入AdminTransportDtl
	private AdminTransportDtl adminTransportDtl;
	//区域ID
	private String areaId="";
	//区域名称
	private String areaName="";
	//上一个区域ID
	private String areaParentId="";
	//Tree Level 省市等级区分
	private String areaLevel="";
	//邮编
	private String postCd="";
	//区域电话号码
	private String telPre="";
	//是否为区 0：not 1：leaf
	private String isLeaf="";
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaParentId() {
		return areaParentId;
	}
	public void setAreaParentId(String areaParentId) {
		this.areaParentId = areaParentId;
	}
	public String getAreaLevel() {
		return areaLevel;
	}
	public void setAreaLevel(String areaLevel) {
		this.areaLevel = areaLevel;
	}
	public String getPostCd() {
		return postCd;
	}
	public void setPostCd(String postCd) {
		this.postCd = postCd;
	}
	public String getTelPre() {
		return telPre;
	}
	public void setTelPre(String telPre) {
		this.telPre = telPre;
	}
	public String getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}
	public AdminTransportDtl getAdminTransportDtl() {
		return adminTransportDtl;
	}
	public void setAdminTransportDtl(AdminTransportDtl adminTransportDtl) {
		this.adminTransportDtl = adminTransportDtl;
	}

}
