package com.waremec.weixin.domain.pay;

/** 
* @Package com.waremec.weixin.domain.pay 
* @FileName OrderPayInsert
* @Description  
* @author taebem 
* @date 2015年5月7日 下午5:11:21 
*  
*/
public class OrderPayInsert {
	
	private Integer custSysId;
	private Integer orderId;
	private Integer shopId;
	private PaymentNotify payment;
	public Integer getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(Integer custSysId) {
		this.custSysId = custSysId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public PaymentNotify getPayment() {
		return payment;
	}
	public void setPayment(PaymentNotify payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "OrderPayInsert [custSysId=" + custSysId + ", orderId=" + orderId + ", shopId=" + shopId + ", payment=" + payment + "]";
	}
	
	
}
