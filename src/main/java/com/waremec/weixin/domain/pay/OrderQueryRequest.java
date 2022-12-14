package com.waremec.weixin.domain.pay;

import com.waremec.framework.utilities.RandomUtils;
import com.waremec.weixin.annotation.SignFieldMeta;

public class OrderQueryRequest {

	@SignFieldMeta()
	private String appid;
	@SignFieldMeta()
	private String mch_id;
	@SignFieldMeta(isRequired=false)
	private String transaction_id;
	@SignFieldMeta(isRequired=false)
	private String out_trade_no;
	@SignFieldMeta()
	private String nonce_str = RandomUtils.generateRandomString();
	
	private String sign;
	
	
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	
}
