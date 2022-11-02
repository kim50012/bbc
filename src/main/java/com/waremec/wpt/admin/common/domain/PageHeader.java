package com.waremec.wpt.admin.common.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PageHeader {

	private Integer shopId;
	private Integer pageId;
	private Integer displayId;
	private Integer pageType;
	private Integer skinType;
	private Integer isDelete;
	private Integer createdId;
	private Integer modifiedId;
	private Date createdDt;
	private Date modifyDt;
	private String pageNm;
	
	private List<PageItem> items = new ArrayList<PageItem>();

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getPageId() {
		return pageId;
	}

	public void setPageId(Integer pageId) {
		this.pageId = pageId;
	}

	public Integer getDisplayId() {
		return displayId;
	}

	public void setDisplayId(Integer displayId) {
		this.displayId = displayId;
	}

	public Integer getPageType() {
		return pageType;
	}

	public void setPageType(Integer pageType) {
		this.pageType = pageType;
	}

	public Integer getSkinType() {
		return skinType;
	}

	public void setSkinType(Integer skinType) {
		this.skinType = skinType;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Integer getCreatedId() {
		return createdId;
	}

	public void setCreatedId(Integer createdId) {
		this.createdId = createdId;
	}

	public Integer getModifiedId() {
		return modifiedId;
	}

	public void setModifiedId(Integer modifiedId) {
		this.modifiedId = modifiedId;
	}

	public Date getCreatedDt() {
		return createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public Date getModifyDt() {
		return modifyDt;
	}

	public void setModifyDt(Date modifyDt) {
		this.modifyDt = modifyDt;
	}

	public List<PageItem> getItems() {
		return items;
	}

	public void setItems(List<PageItem> items) {
		this.items = items;
	}

	public String getPageNm() {
		return pageNm;
	}

	public void setPageNm(String pageNm) {
		this.pageNm = pageNm;
	}

	 
	
	
}
