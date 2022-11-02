package com.waremec.wpt.front.domain;
/**
 * 存储订单的实体类
 * @author wangbin
 *
 */
public class FrontOrder {
	//存储操作类型的字段
	private String jobType="";
	//[订单] System Customer ID	CUST_SYS_ID	INT
	private String custSysId="";
	//[订单] 订单ID	ORDER_ID	INT
	private String orderId="";
	//[订单] 订单号(外部使用) 日期+店铺ID+序列号	ORDER_OUT_ID	NVARCHAR
	private String orderOutId="";
	//[订单] (预备)订单类型 1普通 2团购 等	ORDER_TYPE_ID	TINYINT
	private String orderTypeId="";
	//[订单] (统计)商品总数量	GOODS_QTY	SMALLINT
	private String goodsQty="";
	//[订单] (统计)订单总额(折扣后价+运费)	PRICE_SUM	MONEY
	private String priceSum="";
	//[订单] 运费	TRANS_FEE	MONEY
	private String transFee="";
	//[订单] (统计)折扣前价格	PRICE_TT_BEFORE_NEGO	MONEY
	private String priceTTBeforeNego="";
	//[订单] 折扣后价格	PRICE_TT_AFTER_NEGO	MONEY
	private String priceTTAfterNego="";
	//[订单] 1拍错了 2订单信息有误 3不想要了	CANCEL_REASON_TYPE	TINYINT
	private String cancelReasonType="";
	//[订单] 收件人姓名	ADR_RECEIPTOR_NM	NVARCHAR
	private String adrReceiptorName="";
	//[订单] 地址_省份	ADR_PROVINCE_ID	INT
	private String addressProvinceId="";
	//[订单] 地址_城市	ADR_CITY_ID	INT
	private String addressCityId="";
	//[订单] 地址_区域	ADR_DISTRICT_ID	INT
	private String addressDistrictId="";
	//[订单] 详细	ADR_DETAIL	NVARCHAR
	private String addressDetail="";
	//[订单] 邮编	ADR_ZIP	NVARCHAR
	private String addressZip="";
	//[订单] 手机号	ADR_MOBILE	NVARCHAR
	private String adrMobile="";
	//[订单] 固定电话号	ADR_TEL	NVARCHAR
	private String adrTel="";
	//[订单] 发票信息	INVOICE_DESC	NVARCHAR
	private String invoiceDesc="";
	//[订单] 客户的留言	CUST_MSG	NVARCHAR
	private String custMsg="";
	//[订单] 状态：10(默认):未付款;20:已付款;30:已发货;40:已收货;50:已收款	STATUS_ID	TINYINT
	private String statusId="";
	//[订单] 状态-下单日期	STS_ORDER_DT	SMALLDATETIME
	private String stsOrderDate="";
	//[订单] 状态-取消	STS_CANCEL_DT	SMALLDATETIME
	private String stsCancelDate="";
	//[订单] 状态-付款日期	STS_PAYMENT_DT	SMALLDATETIME
	private String stsPayMentDate="";
	//[订单] 状态-发货日期	STS_DELIVERY_DT	SMALLDATETIME
	private String stsDeliveryDate="";
	//[订单] 状态-到货日期	STS_ARRIVAL_DT	SMALLDATETIME
	private String stsArrivalDate="";
	//[订单] 状态-收款日期	STS_COLLECT_DT	SMALLDATETIME
	private String stsCollectDate="";
	//[订单] (统计)有无退货 0:无 1:有	IS_EXCHANGE	TINYINT
	private String isExchange="";
	//[订单] (统计)退货数量	EXCHANGE_NUM	TINYINT
	private String exchangeNum="";
	//[订单] (统计)有无退款 0:无 1:有	IS_REFUND	TINYINT
	private String isRefund="";
	//[订单] (统计)退款额	REFUND_GOODS_AMT	TINYINT
	private String refundGoodsAmt="";
	//[订单] 评价日期	EVAL_DT	SMALLDATETIME
	private String evalDate="";
	//[订单] 评价分数（1~5）	EVAL_POINT	TINYINT
	private String evalPoint="";
	
	/* 关联数据 */
	//--[订单商品] 店铺ID	INT
	private String shopId="";
	//--[订单商品] 价格ID	INT
	private String priceOptionId="";
	//--[订单商品] 购买数量	SMALLINT  每样商品的购买数量。
	private String goodsQtyOne="";
	//--[订单-店铺] 运输方式	INT
	private String transTypeId="";
	
	
	Integer totalFee;
	String custOrderId;
	String shopNm ;
	
	private String couponId = "";
	private String couponItemId="";
	
	
	public String getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderOutId() {
		return orderOutId;
	}
	public void setOrderOutId(String orderOutId) {
		this.orderOutId = orderOutId;
	}
	public String getOrderTypeId() {
		return orderTypeId;
	}
	public void setOrderTypeId(String orderTypeId) {
		this.orderTypeId = orderTypeId;
	}
	public String getGoodsQty() {
		return goodsQty;
	}
	public void setGoodsQty(String goodsQty) {
		this.goodsQty = goodsQty;
	}
	public String getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(String priceSum) {
		this.priceSum = priceSum;
	}
	public String getTransFee() {
		return transFee;
	}
	public void setTransFee(String transFee) {
		this.transFee = transFee;
	}
	public String getPriceTTBeforeNego() {
		return priceTTBeforeNego;
	}
	public void setPriceTTBeforeNego(String priceTTBeforeNego) {
		this.priceTTBeforeNego = priceTTBeforeNego;
	}
	public String getPriceTTAfterNego() {
		return priceTTAfterNego;
	}
	public void setPriceTTAfterNego(String priceTTAfterNego) {
		this.priceTTAfterNego = priceTTAfterNego;
	}
	public String getCancelReasonType() {
		return cancelReasonType;
	}
	public void setCancelReasonType(String cancelReasonType) {
		this.cancelReasonType = cancelReasonType;
	}
	public String getAdrReceiptorName() {
		return adrReceiptorName;
	}
	public void setAdrReceiptorName(String adrReceiptorName) {
		this.adrReceiptorName = adrReceiptorName;
	}
	public String getAddressProvinceId() {
		return addressProvinceId;
	}
	public void setAddressProvinceId(String addressProvinceId) {
		this.addressProvinceId = addressProvinceId;
	}
	public String getAddressCityId() {
		return addressCityId;
	}
	public void setAddressCityId(String addressCityId) {
		this.addressCityId = addressCityId;
	}
	public String getAddressDistrictId() {
		return addressDistrictId;
	}
	public void setAddressDistrictId(String addressDistrictId) {
		this.addressDistrictId = addressDistrictId;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getAddressZip() {
		return addressZip;
	}
	public void setAddressZip(String addressZip) {
		this.addressZip = addressZip;
	}
	public String getAdrMobile() {
		return adrMobile;
	}
	public void setAdrMobile(String adrMobile) {
		this.adrMobile = adrMobile;
	}
	public String getAdrTel() {
		return adrTel;
	}
	public void setAdrTel(String adrTel) {
		this.adrTel = adrTel;
	}
	public String getInvoiceDesc() {
		return invoiceDesc;
	}
	public void setInvoiceDesc(String invoiceDesc) {
		this.invoiceDesc = invoiceDesc;
	}
	public String getCustMsg() {
		return custMsg;
	}
	public void setCustMsg(String custMsg) {
		this.custMsg = custMsg;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getStsOrderDate() {
		return stsOrderDate;
	}
	public void setStsOrderDate(String stsOrderDate) {
		this.stsOrderDate = stsOrderDate;
	}
	public String getStsCancelDate() {
		return stsCancelDate;
	}
	public void setStsCancelDate(String stsCancelDate) {
		this.stsCancelDate = stsCancelDate;
	}
	public String getStsPayMentDate() {
		return stsPayMentDate;
	}
	public void setStsPayMentDate(String stsPayMentDate) {
		this.stsPayMentDate = stsPayMentDate;
	}
	public String getStsDeliveryDate() {
		return stsDeliveryDate;
	}
	public void setStsDeliveryDate(String stsDeliveryDate) {
		this.stsDeliveryDate = stsDeliveryDate;
	}
	public String getStsArrivalDate() {
		return stsArrivalDate;
	}
	public void setStsArrivalDate(String stsArrivalDate) {
		this.stsArrivalDate = stsArrivalDate;
	}
	public String getStsCollectDate() {
		return stsCollectDate;
	}
	public void setStsCollectDate(String stsCollectDate) {
		this.stsCollectDate = stsCollectDate;
	}
	public String getIsExchange() {
		return isExchange;
	}
	public void setIsExchange(String isExchange) {
		this.isExchange = isExchange;
	}
	public String getExchangeNum() {
		return exchangeNum;
	}
	public void setExchangeNum(String exchangeNum) {
		this.exchangeNum = exchangeNum;
	}
	public String getIsRefund() {
		return isRefund;
	}
	public void setIsRefund(String isRefund) {
		this.isRefund = isRefund;
	}
	public String getRefundGoodsAmt() {
		return refundGoodsAmt;
	}
	public void setRefundGoodsAmt(String refundGoodsAmt) {
		this.refundGoodsAmt = refundGoodsAmt;
	}
	public String getEvalDate() {
		return evalDate;
	}
	public void setEvalDate(String evalDate) {
		this.evalDate = evalDate;
	}
	public String getEvalPoint() {
		return evalPoint;
	}
	public void setEvalPoint(String evalPoint) {
		this.evalPoint = evalPoint;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getPriceOptionId() {
		return priceOptionId;
	}
	public void setPriceOptionId(String priceOptionId) {
		this.priceOptionId = priceOptionId;
	}
	public String getGoodsQtyOne() {
		return goodsQtyOne;
	}
	public void setGoodsQtyOne(String goodsQtyOne) {
		this.goodsQtyOne = goodsQtyOne;
	}
	public String getTransTypeId() {
		return transTypeId;
	}
	public void setTransTypeId(String transTypeId) {
		this.transTypeId = transTypeId;
	}
	public Integer getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(Integer totalFee) {
		this.totalFee = totalFee;
	}
	public String getCustOrderId() {
		return custOrderId;
	}
	public void setCustOrderId(String custOrderId) {
		this.custOrderId = custOrderId;
	}
	public String getShopNm() {
		return shopNm;
	}
	public void setShopNm(String shopNm) {
		this.shopNm = shopNm;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCouponItemId() {
		return couponItemId;
	}
	public void setCouponItemId(String couponItemId) {
		this.couponItemId = couponItemId;
	}
	
}
