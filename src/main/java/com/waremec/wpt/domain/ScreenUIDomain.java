package com.waremec.wpt.domain;

public class ScreenUIDomain {
	public ScreenUIDomain(){
		index = "0";
		screenID = "";
		screenName = "";
		itemID = "";
		chineseName = "";
		koreanName = "";
		englishName = "";
	}
	private String index;
	private String screenID;
	private String screenName;
	private String itemID;
	private String chineseName;
	private String koreanName;
	private String englishName;
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getScreenID() {
		return screenID;
	}
	public void setScreenID(String screenID) {
		this.screenID = screenID;
	}
	public String getItemID() {
		return itemID;
	}
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	public String getChineseName() {
		return chineseName;
	}
	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	public String getKoreanName() {
		return koreanName;
	}
	public void setKoreanName(String koreanName) {
		this.koreanName = koreanName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getScreenName() {
		return screenName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	
	
}
