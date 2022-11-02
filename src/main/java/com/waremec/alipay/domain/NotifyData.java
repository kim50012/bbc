package com.waremec.alipay.domain;

/**
 * 
 * 服务器异步通知参数
 * @author taebem
 *
 */
public class NotifyData {

	
	 

	@Override
	public String toString() {
		return "NotifyData [payment_type=" + payment_type + ", subject=" + subject + ", trade_no=" + trade_no + ", buyer_email=" + buyer_email
				+ ", gmt_create=" + gmt_create + ", notify_type=" + notify_type + ", quantity=" + quantity + ", out_trade_no=" + out_trade_no
				+ ", notify_time=" + notify_time + ", seller_id=" + seller_id + ", trade_status=" + trade_status + ", is_total_fee_adjust="
				+ is_total_fee_adjust + ", total_fee=" + total_fee + ", gmt_payment=" + gmt_payment + ", seller_email=" + seller_email + ", gmt_close="
				+ gmt_close + ", price=" + price + ", buyer_id=" + buyer_id + ", notify_id=" + notify_id + ", use_coupon=" + use_coupon + ", refund_status="
				+ refund_status + ", gmt_refund=" + gmt_refund + ", notify_data=" + notify_data + ", refund_error_code=" + refund_error_code + "]";
	}

	/**
	 * 支付方式 1：商品购买； 4：捐赠。
	 */
	private String payment_type;

	/**
	 * 商品名称 商品的标题/交易标题/订单 标题/订单关键字等。 它在支付宝的交易明细中 排在第一列，对于财务对账 尤为重要。 是请求时对应的
	 * 参数，原样通知回来。
	 */
	private String subject;

	/**
	 * 支付宝交易号 该交易在支付宝系统中的 交易流水号。最长 64 位。
	 */
	private String trade_no;

	/**
	 * 买家支 宝账号 买家支付宝账号，可以是 email或手机号码。
	 */
	private String buyer_email;

	/**
	 * 交易创建时间 格式为 yyyy-MM-dd HH:mm:ss
	 */
	private String gmt_create;

	/**
	 * 通知类型 固定值 trade_status_sync
	 */
	private String notify_type;

	/**
	 * 购买数量
	 */
	private String quantity;

	/**
	 * 商户网站唯一订单号 对应商户网站的订单系统中的唯一订单号，非支付宝交易号。 需保证在商户网站中的唯 一性。是请求时对应的参 数，原样返回。
	 */
	private String out_trade_no;

	/**
	 * 通知时间 格式为 yyyy-MM-dd HH:mm:ss
	 */
	private String notify_time;
	/**
	 * 卖家支付宝用户号 卖家支付宝账号对应的支付宝唯一用户号。 以 2088 开头的纯 16 位数 字。
	 */
	private String seller_id;

	/**
	 * 交易状态
	 */
	private String trade_status;
	/**
	 * 是否调整总价 该交易是否调整过价格。 本接口创建的交易不会被 修改总价，固定值为 N。 
	 */
	private String is_total_fee_adjust;
	/**
	 * 交易金额 该笔订单的总金额。 请求时对应的参数，原样通 知回来。
	 */
	private String total_fee;

	/**
	 * 交易付款时间 该笔交易的买家付款时间。 格式为 yyyy-MM-dd HH:mm:ss。 如果交易未付款，则不返回 该参数。
	 */
	private String gmt_payment;

	/**
	 * 卖家支付宝账号 卖家支付宝账号，可以是 email 和手机号码
	 */
	private String seller_email;

	/**
	 * 交易关闭时间 格式为 yyyy-MM-dd HH:mm:ss
	 */
	private String gmt_close;
	/**
	 * 商品单价 目前和 total_fee值相同。 单位：元。 不应低于 0.01 元。
	 */
	private String price;
	/**
	 * 买家支付 宝用户号 买家支付宝账号对应的支 付宝唯一用户号。 以 2088 开头的纯 16 位数 字。
	 */
	private String buyer_id;
	/**
	 * 通知校验ID 通知校验 ID。唯一识别通知内容。重发相同内容的通知时，该值不变。
	 */
	private String notify_id;
	/**
	 * 是否使用红包买家 是否在交易过程中使用了红包。
	 */
	private String use_coupon;

	/**
	 * 退款状态
	 */
	private String refund_status;
	/**
	 * 退款时间 卖家退款的时间，退款通知时会发送。 格式为 yyyy-MM-dd HH:mm:ss。
	 */
	private String gmt_refund;

	/**
	 * 通知业务参数 xml 用于logging
	 */
	private String notify_data;
	
	
	//yongyu refund notify
	private String refund_error_code;

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTrade_no() {
		return trade_no;
	}

	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getGmt_create() {
		return gmt_create;
	}

	public void setGmt_create(String gmt_create) {
		this.gmt_create = gmt_create;
	}

	public String getNotify_type() {
		return notify_type;
	}

	public void setNotify_type(String notify_type) {
		this.notify_type = notify_type;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getOut_trade_no() {
		return out_trade_no;
	}

	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

	public String getNotify_time() {
		return notify_time;
	}

	public void setNotify_time(String notify_time) {
		this.notify_time = notify_time;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getTrade_status() {
		return trade_status;
	}

	public void setTrade_status(String trade_status) {
		this.trade_status = trade_status;
	}

	public String getIs_total_fee_adjust() {
		return is_total_fee_adjust;
	}

	public void setIs_total_fee_adjust(String is_total_fee_adjust) {
		this.is_total_fee_adjust = is_total_fee_adjust;
	}

	public String getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}

	public String getGmt_payment() {
		return gmt_payment;
	}

	public void setGmt_payment(String gmt_payment) {
		this.gmt_payment = gmt_payment;
	}

	public String getSeller_email() {
		return seller_email;
	}

	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}

	public String getGmt_close() {
		return gmt_close;
	}

	public void setGmt_close(String gmt_close) {
		this.gmt_close = gmt_close;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getNotify_id() {
		return notify_id;
	}

	public void setNotify_id(String notify_id) {
		this.notify_id = notify_id;
	}

	public String getUse_coupon() {
		return use_coupon;
	}

	public void setUse_coupon(String use_coupon) {
		this.use_coupon = use_coupon;
	}

	public String getRefund_status() {
		return refund_status;
	}

	public void setRefund_status(String refund_status) {
		this.refund_status = refund_status;
	}

	public String getGmt_refund() {
		return gmt_refund;
	}

	public void setGmt_refund(String gmt_refund) {
		this.gmt_refund = gmt_refund;
	}

	public String getNotify_data() {
		return notify_data;
	}

	public void setNotify_data(String notify_data) {
		this.notify_data = notify_data;
	}

	public String getRefund_error_code() {
		return refund_error_code;
	}

	public void setRefund_error_code(String refund_error_code) {
		this.refund_error_code = refund_error_code;
	}
	
	

}
