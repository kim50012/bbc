package com.waremec.alipay.domain;

/**
 * 支付宝退款状态
 * @author taebem
 *
 */
public class RefundStatus {
	 
	/**
	 * 退款成功：  <br>
	 * 全额退款情况：trade_status=TRADE_CLOSED，而 refund_status=REFUND_SUCCESS <br>
	 * 非全额退款情况：trade_status=TRADE_SUCCESS， 而 refund_status=REFUND_SUCCESS 
	 */
	public static final String REFUND_SUCCESS = "REFUND_SUCCESS"  ; 
	/**
	 * 退款关闭 
	 */
	public static final String REFUND_CLOSED = "REFUND_CLOSED"; 
}
