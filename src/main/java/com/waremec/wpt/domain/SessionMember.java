package com.waremec.wpt.domain;

/**
 * @author jong
 * 
 */
public class SessionMember implements java.io.Serializable {
	/**  
	* 
	*/
	private static final long serialVersionUID = 1L;
	private Integer custSysId;
	private String custLoginId;
	private String openid;
	private String sysId;
	private Integer shopId;
	private String custImgUrl;
	private String nickname;
	private String clbNickname;
	private String lang;
	private String userType;
	private Integer clubSeq;
	private String accessToken;

	public Integer getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(Integer custSysId) {
		this.custSysId = custSysId;
	}

	public String getCustLoginId() {
		return custLoginId;
	}

	public void setCustLoginId(String custLoginId) {
		this.custLoginId = custLoginId;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getSysId() {
		return sysId;
	}

	public void setSysId(String sysId) {
		this.sysId = sysId;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getCustImgUrl() {
		return custImgUrl;
	}

	public void setCustImgUrl(String custImgUrl) {
		this.custImgUrl = custImgUrl;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getClbNickname() {
		return clbNickname;
	}

	public void setClbNickname(String clbNickname) {
		this.clbNickname = clbNickname;
	}
	
	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Integer getClubSeq() {
		return clubSeq;
	}

	public void setClubSeq(Integer clubSeq) {
		this.clubSeq = clubSeq;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	@Override
	public String toString() {
		return "SessionMember [custSysId=" + custSysId + ", custLoginId=" + custLoginId + ", openid=" + openid + ", sysId=" + sysId + ", shopId=" + shopId
				+ ", custImgUrl=" + custImgUrl + ", nickname=" + nickname + ", clbNickname=" + clbNickname 
				+ ", lang=" + lang + ", userType=" + userType + ", clubSeq=" + clubSeq + ", accessToken=" + accessToken + "]";
	}

}
