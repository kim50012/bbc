package com.waremec.wpt.admin.domain;

public class AdminOrderShop {
	//[订单-店铺] 订单ID
	private int orderId=0;
	//[订单-店铺] 主店铺ID (ORDER_DTL中金额最大店铺的ID)
	private int shopId=0;
	//[订单-店铺] (统计)商品总数量
	private int goods_qty=0;
	//[订单-店铺] (统计)订单总额(店长统一折扣后价+运费)
	private double price_sum=0;
	//[订单-店铺] 运费
	private double trans_fee=0;
	//[订单-店铺] 运费模板ID
	private int trans_sheet_id=0;
	//[订单-店铺] 运输方式
	private int trans_type_id=0;
	//[订单-店铺] 运输公司
	private int trans_corp_id=0;
	//[订单-店铺] 运单号
	private String tranc_doc_no="";
	//[订单-店铺] 折扣前价格 (PRICE_SUM+TRANS_FEE)
	private double price_tt_before_nego=0;
	//[订单-店铺] 折扣后价格 (页面上“店铺合计”字段显示的价格)
	private double price_tt_after_nego=0;
	
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	public double getPrice_sum() {
		return price_sum;
	}
	public void setPrice_sum(double price_sum) {
		this.price_sum = price_sum;
	}
	public double getTrans_fee() {
		return trans_fee;
	}
	public void setTrans_fee(double trans_fee) {
		this.trans_fee = trans_fee;
	}
	public int getTrans_sheet_id() {
		return trans_sheet_id;
	}
	public void setTrans_sheet_id(int trans_sheet_id) {
		this.trans_sheet_id = trans_sheet_id;
	}
	public int getTrans_type_id() {
		return trans_type_id;
	}
	public void setTrans_type_id(int trans_type_id) {
		this.trans_type_id = trans_type_id;
	}
	public int getTrans_corp_id() {
		return trans_corp_id;
	}
	public void setTrans_corp_id(int trans_corp_id) {
		this.trans_corp_id = trans_corp_id;
	}
	public String getTranc_doc_no() {
		return tranc_doc_no;
	}
	public void setTranc_doc_no(String tranc_doc_no) {
		this.tranc_doc_no = tranc_doc_no;
	}
	public double getPrice_tt_before_nego() {
		return price_tt_before_nego;
	}
	public void setPrice_tt_before_nego(double price_tt_before_nego) {
		this.price_tt_before_nego = price_tt_before_nego;
	}
	public double getPrice_tt_after_nego() {
		return price_tt_after_nego;
	}
	public void setPrice_tt_after_nego(double price_tt_after_nego) {
		this.price_tt_after_nego = price_tt_after_nego;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	

}
