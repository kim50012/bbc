package com.waremec.wpt.admin.domain;
/**
 * 店铺类型的实体类。
 * @author Administrator
 *
 */
public class AdminShopClass 
{
	//[店铺分类] 店铺分类ID	SC_ID
	private String shopClassId="";
	//[店铺分类] 店铺分类名称	SC_NM
	private String shopClassName="";
	//[店铺分类] 上一个ID	SC_PARENT_ID
	private String shopClassParentId="";
	//[店铺分类] 排列循序号	SORT_NO
	private String sortNo="";
	public String getShopClassId() {
		return shopClassId;
	}
	public void setShopClassId(String shopClassId) {
		this.shopClassId = shopClassId;
	}
	public String getShopClassName() {
		return shopClassName;
	}
	public void setShopClassName(String shopClassName) {
		this.shopClassName = shopClassName;
	}
	public String getShopClassParentId() {
		return shopClassParentId;
	}
	public void setShopClassParentId(String shopClassParentId) {
		this.shopClassParentId = shopClassParentId;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
}
