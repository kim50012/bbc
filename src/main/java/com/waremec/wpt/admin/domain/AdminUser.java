package com.waremec.wpt.admin.domain;

public class AdminUser implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String userId = "";
	private String userNickNm = "";
	private String userRealNm = "";
	private String wxOpenU = "";
	private String wxIdU = "";
	private String email = "";
	private String mobileNo = "";
	private String qqId = "";
	private String pwd = "";
	private String compId="";
	private String shopId="";
	private String activeSts = "";
	private String headImage="";
	private String imgUrl="";
	private String singNm="";
	private String sex="";
	private String imgSysNm="";
	private String imgNm="";
	private String imgSize="";
	private String user_shop_cnt="";
	private String user_shop_id="";
	private String userAuth ;
	public String getHeadImage() {
		return headImage;
	}
	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNickNm() {
		return userNickNm;
	}
	public void setUserNickNm(String userNickNm) {
		this.userNickNm = userNickNm;
	}
	public String getUserRealNm() {
		return userRealNm;
	}
	public void setUserRealNm(String userRealNm) {
		this.userRealNm = userRealNm;
	}
	public String getWxOpenU() {
		return wxOpenU;
	}
	public void setWxOpenU(String wxOpenU) {
		this.wxOpenU = wxOpenU;
	}
	public String getWxIdU() {
		return wxIdU;
	}
	public void setWxIdU(String wxIdU) {
		this.wxIdU = wxIdU;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getQqId() {
		return qqId;
	}
	public void setQqId(String qqId) {
		this.qqId = qqId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getActiveSts() {
		return activeSts;
	}
	public void setActiveSts(String activeSts) {
		this.activeSts = activeSts;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getSingNm() {
		return singNm;
	}
	public void setSingNm(String singNm) {
		this.singNm = singNm;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getImgSysNm() {
		return imgSysNm;
	}
	public void setImgSysNm(String imgSysNm) {
		this.imgSysNm = imgSysNm;
	}
	public String getImgNm() {
		return imgNm;
	}
	public void setImgNm(String imgNm) {
		this.imgNm = imgNm;
	}
	public String getImgSize() {
		return imgSize;
	}
	public void setImgSize(String imgSize) {
		this.imgSize = imgSize;
	}
	public String getUser_shop_cnt() {
		return user_shop_cnt;
	}
	public void setUser_shop_cnt(String user_shop_cnt) {
		this.user_shop_cnt = user_shop_cnt;
	}
	public String getUser_shop_id() {
		return user_shop_id;
	}
	public void setUser_shop_id(String user_shop_id) {
		this.user_shop_id = user_shop_id;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	@Override
	public String toString() {
		return "AdminUser [userId=" + userId + ", userNickNm=" + userNickNm + ", userRealNm=" + userRealNm + ", wxOpenU=" + wxOpenU + ", wxIdU=" + wxIdU
				+ ", email=" + email + ", mobileNo=" + mobileNo + ", qqId=" + qqId + ", pwd=" + pwd + ", compId=" + compId + ", shopId=" + shopId
				+ ", activeSts=" + activeSts + ", headImage=" + headImage + ", imgUrl=" + imgUrl + ", singNm=" + singNm + ", sex=" + sex + ", imgSysNm="
				+ imgSysNm + ", imgNm=" + imgNm + ", imgSize=" + imgSize + ", user_shop_cnt=" + user_shop_cnt + ", user_shop_id=" + user_shop_id
				+ ", userAuth=" + userAuth + "]";
	}
	 
	

}
