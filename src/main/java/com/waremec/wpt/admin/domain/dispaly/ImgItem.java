package com.waremec.wpt.admin.domain.dispaly;


public class ImgItem {
	private Integer tempId;
	private Integer id;
	private String title;
	private String attachment_url;
	private String linkUrl;
	
	public Integer getTempId() {
		return tempId;
	}
	public void setTempId(Integer tempId) {
		this.tempId = tempId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAttachment_url() {
		return attachment_url;
	}
	public void setAttachment_url(String attachment_url) {
		this.attachment_url = attachment_url;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	
}
