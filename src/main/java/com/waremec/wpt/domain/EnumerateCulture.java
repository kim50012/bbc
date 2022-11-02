package com.waremec.wpt.domain;

public class EnumerateCulture extends EnumerateDomain {
	private String chineseName = "";
	private String chineseShortName = "";
	private String koreanName = "";
	private String koreanShortName = "";
	private String englishName = "";
	private String englishShortName = "";
	public EnumerateCulture(){
		this.chineseName = "";
		this.chineseShortName = "";
		this.koreanName = "";
		this.koreanShortName = "";
		this.englishName = "";
		this.englishShortName = "";
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
	public String getChineseShortName() {
		return chineseShortName;
	}
	public void setChineseShortName(String chineseShortName) {
		this.chineseShortName = chineseShortName;
	}
	public String getKoreanShortName() {
		return koreanShortName;
	}
	public void setKoreanShortName(String koreanShortName) {
		this.koreanShortName = koreanShortName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getEnglishShortName() {
		return englishShortName;
	}
	public void setEnglishShortName(String englishShortName) {
		this.englishShortName = englishShortName;
	}
	
}
