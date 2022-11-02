package com.waremec.alipay.domain;

/**
 * 
 * 支付宝-交易状态
 * @author taebem
 *
 */
public class TradeStatus {

	//交易状态 
	public static final String WAIT_BUYER_PAY = "WAIT_BUYER_PAY"; //交易创建，等待买家付款。 
	public static final String TRADE_CLOSED  = "TRADE_CLOSED"; // 在指定时间段内未支付时关闭的交易； z 在交易完成全额退款成功时关闭的交易。 
				 	//在交易完成全额退款成功时关闭的交易。  
	public static final String TRADE_SUCCESS = "TRADE_SUCCESS" ; //交易成功，且可对该交易做操作，如：多级分润、退款等。
	public static final String TRADE_PENDING = "TRADE_PENDING";//等待卖家收款（买家付款后，如果卖家账号被冻结）。 
	public static final String TRADE_FINISHED  = "TRADE_FINISHED"; //交易成功且结束，即不可再做任何操作 

}
