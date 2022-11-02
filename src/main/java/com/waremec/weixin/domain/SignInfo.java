package com.waremec.weixin.domain;

/** 
* @Package com.waremec.weixin.domain 
* @FileName SignInfo
* @Description  JS-SDK签名算法封装类
* @author taebem 
* @date 2015年5月25日 下午1:38:16 
*  
*/
public class SignInfo {

	private String url;
	private String jsapi_ticket;
	private String nonceStr;
	private String timestamp;
	private String signature;
	
	
	
	@Override
	public String toString() {
		return "SignInfo [url=" + url + ", jsapi_ticket=" + jsapi_ticket + ", nonceStr=" + nonceStr + ", timestamp=" + timestamp
				+ ", signature=" + signature + "]";
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getJsapi_ticket() {
		return jsapi_ticket;
	}
	public void setJsapi_ticket(String jsapi_ticket) {
		this.jsapi_ticket = jsapi_ticket;
	}
	public String getNonceStr() {
		return nonceStr;
	}
	public void setNonceStr(String nonceStr) {
		this.nonceStr = nonceStr;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	
	
	
}
