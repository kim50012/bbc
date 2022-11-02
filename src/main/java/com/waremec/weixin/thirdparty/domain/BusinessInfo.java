/**   
* @Title: BusinessInfo.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author naRan
* @date 2017年4月6日 上午9:37:09
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName BusinessInfo
 * @Description  授权方公众号类型
 * @author naRan 
 * @date 2017年4月6日 上午9:37:09
 *  
 */
public class BusinessInfo {

	// 用以了解以下功能的开通状况（0代表未开通，1代表已开通）：
	/**
	 * open_store:是否开通微信门店功能
	 */
	private Integer open_store;
	
	/**
	 * open_scan:是否开通微信扫商品功能
	 */
	private Integer open_scan;
	
	/**
	 * open_pay:是否开通微信支付功能
	 */
	private Integer open_pay;
	
	/**
	 * open_card:是否开通微信卡券功能
	 */
	private Integer open_card;
	
	/**
	 * open_shake:是否开通微信摇一摇功能
	 */
	private Integer open_shake;

	public Integer getOpen_store() {
		return open_store;
	}

	public void setOpen_store(Integer open_store) {
		this.open_store = open_store;
	}

	public Integer getOpen_scan() {
		return open_scan;
	}

	public void setOpen_scan(Integer open_scan) {
		this.open_scan = open_scan;
	}

	public Integer getOpen_pay() {
		return open_pay;
	}

	public void setOpen_pay(Integer open_pay) {
		this.open_pay = open_pay;
	}

	public Integer getOpen_card() {
		return open_card;
	}

	public void setOpen_card(Integer open_card) {
		this.open_card = open_card;
	}

	public Integer getOpen_shake() {
		return open_shake;
	}

	public void setOpen_shake(Integer open_shake) {
		this.open_shake = open_shake;
	}

}