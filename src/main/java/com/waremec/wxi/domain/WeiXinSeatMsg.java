package com.waremec.wxi.domain;
/** 
* @Package com.waremec.weixin.domain 
* @Description  多客服客服信息
* @author wangbin 
* @date 2015年12月25日 上午9:43:57 
*  
*/
public class WeiXinSeatMsg {
	private String kf_account="";
	private String kf_headimgurl = "";
	private String kf_id = "";
	private String kf_nick = "";
	public String getKf_account() {
		return kf_account;
	}
	public void setKf_account(String kf_account) {
		this.kf_account = kf_account;
	}
	public String getKf_headimgurl() {
		return kf_headimgurl;
	}
	public void setKf_headimgurl(String kf_headimgurl) {
		this.kf_headimgurl = kf_headimgurl;
	}
	public String getKf_id() {
		return kf_id;
	}
	public void setKf_id(String kf_id) {
		this.kf_id = kf_id;
	}
	public String getKf_nick() {
		return kf_nick;
	}
	public void setKf_nick(String kf_nick) {
		this.kf_nick = kf_nick;
	}
	
}
