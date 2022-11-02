package com.waremec.wpt.admin.common.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PageItem {

	private Integer shopId;
	private Integer pageId;
	private Integer itemId;
	private Integer sort;
	private String tmplNo;
	private String isDelete;
	private Integer createdId;
	private Integer modifiedId;
	private Date createdDt;
	private Date modifyDt;
	
	private String showJson;
	
	private List<PageDtl> details= new ArrayList<PageDtl>();

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

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getTmplNo() {
		return tmplNo;
	}

	public void setTmplNo(String tmplNo) {
		this.tmplNo = tmplNo;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
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

	public List<PageDtl> getDetails() {
		return details;
	}

	public void setDetails(List<PageDtl> details) {
		this.details = details;
	}

	public String getShowJson() {
		return showJson;
	}

	public void setShowJson(String showJson) {
		this.showJson = showJson;
	}

}
