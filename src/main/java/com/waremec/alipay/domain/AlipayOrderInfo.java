package com.waremec.alipay.domain;


public class AlipayOrderInfo {

	private Integer orderId; //订单号
	private String custOrderId; //客户可见订单号
	private String out_trade_no;//支付宝合作商户网站唯一 订单号
	private String subject;//商品名称
	private String total_fee;//总金额 该笔订单的资金总额，单位 为 RMB-Yuan。取值范围为 [0.01，100000000.00]，精 确到小数点后两位。 
	private String shopNm; //店铺名称
	private String batch_no; //批次号  必填，格式：当天日期[8位]+序列号[3至24位]，如：201008010000001
	private String batch_num; //退款笔数 必填，参数detail_data的值中，“#”字符出现的数量加1，最大支持1000笔（即“#”字符出现的数量999个）
	private String trade_no; //原付款支付宝交易号
	private String refund_fee; //退款总金额
	private String refund_reason; //退款理由
	
//	单笔数据集参数说明 
//	 	单笔数据集格式为：
//	 	第一笔交易退款数据集#第二笔交易退款数据集#第三笔 交易退款数据集…#第 N 笔交易退款数据集； 
//	 	交易退款数据集的格式为：原付款支付宝交易号^退款总金额^退款理由； 
//	 	不支持退分润功能。 
	private Integer statusId; //我们系统的订单状态
	private Integer isRefundReq; //我们系统的字段
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getCustOrderId() {
		return custOrderId;
	}
	public void setCustOrderId(String custOrderId) {
		this.custOrderId = custOrderId;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}
	public String getShopNm() {
		return shopNm;
	}
	public void setShopNm(String shopNm) {
		this.shopNm = shopNm;
	}
	public String getBatch_no() {
		return batch_no;
	}
	public void setBatch_no(String batch_no) {
		this.batch_no = batch_no;
	}
	public String getBatch_num() {
		return batch_num;
	}
	public void setBatch_num(String batch_num) {
		this.batch_num = batch_num;
	}
	public String getTrade_no() {
		return trade_no;
	}
	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
	}
	public String getRefund_fee() {
		return refund_fee;
	}
	public void setRefund_fee(String refund_fee) {
		this.refund_fee = refund_fee;
	}
	public String getRefund_reason() {
		return refund_reason;
	}
	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getIsRefundReq() {
		return isRefundReq;
	}
	public void setIsRefundReq(Integer isRefundReq) {
		this.isRefundReq = isRefundReq;
	}
	@Override
	public String toString() {
		return "AlipayOrderInfo [orderId=" + orderId + ", custOrderId=" + custOrderId + ", out_trade_no=" + out_trade_no + ", subject=" + subject
				+ ", total_fee=" + total_fee + ", shopNm=" + shopNm + ", batch_no=" + batch_no + ", batch_num=" + batch_num + ", trade_no=" + trade_no
				+ ", refund_fee=" + refund_fee + ", refund_reason=" + refund_reason + ", statusId=" + statusId + ", isRefundReq=" + isRefundReq + "]";
	}
	 
	
	
	
	
	
	
}
