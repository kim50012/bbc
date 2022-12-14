package com.waremec.weixin.domain.pay;

/**
 * 红包发放
 * http://pay.weixin.qq.com/wiki/doc/api/cash_coupon.php?chapter=13_5
 * @author taebem
 *
 */
public class SendRedPackResponse {

	private String return_code ; 		//返回状态码
	private String return_msg; // 返回信息
	//以下字段在return_code为SUCCESS的时候有返回
	private String sign; // 签名
	private String result_code; // 业务结果
	private String err_code; // 错误代码
	private String err_code_des; // 错误代码描述
	//以下字段在return_code 和result_code都为SUCCESS的时候有返回
	private String mch_billno; // 商户订单号
	private String mch_id; // 商户号
	private String wxappid; // 公众账号appid
	private String re_openid; // 用户openid
	private Integer total_amount; // 付款金额
	private String send_listid;
	private String send_time;
	
	
	public String getReturn_code() {
		return return_code;
	}
	public void setReturn_code(String return_code) {
		this.return_code = return_code;
	}
	public String getReturn_msg() {
		return return_msg;
	}
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getResult_code() {
		return result_code;
	}
	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}
	public String getErr_code() {
		return err_code;
	}
	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}
	public String getErr_code_des() {
		return err_code_des;
	}
	public void setErr_code_des(String err_code_des) {
		this.err_code_des = err_code_des;
	}
	public String getMch_billno() {
		return mch_billno;
	}
	public void setMch_billno(String mch_billno) {
		this.mch_billno = mch_billno;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getWxappid() {
		return wxappid;
	}
	public void setWxappid(String wxappid) {
		this.wxappid = wxappid;
	}
	public String getRe_openid() {
		return re_openid;
	}
	public void setRe_openid(String re_openid) {
		this.re_openid = re_openid;
	}
	public Integer getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(Integer total_amount) {
		this.total_amount = total_amount;
	}
	public String getSend_listid() {
		return send_listid;
	}
	public void setSend_listid(String send_listid) {
		this.send_listid = send_listid;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	@Override
	public String toString() {
		return "SendRedPackResponse [return_code=" + return_code + ", return_msg=" + return_msg + ", sign=" + sign + ", result_code=" + result_code
				+ ", err_code=" + err_code + ", err_code_des=" + err_code_des + ", mch_billno=" + mch_billno + ", mch_id=" + mch_id + ", wxappid=" + wxappid
				+ ", re_openid=" + re_openid + ", total_amount=" + total_amount + ", send_listid=" + send_listid + ", send_time=" + send_time + "]";
	}
	
	
	
 
}