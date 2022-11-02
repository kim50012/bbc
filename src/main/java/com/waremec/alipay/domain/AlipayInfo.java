package com.waremec.alipay.domain;

/**
 * @author taebem
 *
 */
public class AlipayInfo {

	private String sysId;// 系统ID
	private String partnerId;// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	private String sellerEmail;// 收款支付宝帐户
	private String key;// 交易安全检验码，由数字和字母组成的32位字符串
	private String privateKey;// 商户的私钥
	private String aliPublicKey;// 支付宝的公钥
	private String signType;// 签名方式，选择项：0001(RSA)、MD5
	private String inputCharset = "utf-8";//  
	
	public String getInputCharset() {
		return inputCharset;
	}

	public String getSysId() {
		return sysId;
	}

	public void setSysId(String sysId) {
		this.sysId = sysId;
	}

	public String getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}

	public String getSellerEmail() {
		return sellerEmail;
	}

	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getPrivateKey() {
		return privateKey;
	}

	public void setPrivateKey(String privateKey) {
		this.privateKey = privateKey;
	}

	public String getAliPublicKey() {
		return aliPublicKey;
	}

	public void setAliPublicKey(String aliPublicKey) {
		this.aliPublicKey = aliPublicKey;
	}

	public String getSignType() {
		return signType;
	}

	public void setSignType(String signType) {
		this.signType = signType;
	}

	@Override
	public String toString() {
		return "AlipayInfo [sysId=" + sysId + ", partnerId=" + partnerId + ", sellerEmail=" + sellerEmail + ", key=" + key + ", privateKey=" + privateKey
				+ ", aliPublicKey=" + aliPublicKey + ", signType=" + signType + "]";
	}
	

}
