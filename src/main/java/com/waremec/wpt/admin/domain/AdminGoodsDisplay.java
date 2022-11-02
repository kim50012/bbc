package com.waremec.wpt.admin.domain;
/**
 * 存储商品上架表的信息。
 * @author Administrator
 *
 */
public class AdminGoodsDisplay {
	//操作标志字段@JOB_TYPE	CHAR(1)					-- (P: 上架,U：下架, D : 删除)
	private String jobType="";
	//[商品上架] 店铺ID	SHOP_ID	INT
	private String shopId="";
	//[商品上架] 商品ID	GOODS_ID	INT
	private String goodsId="";
	//[商品上架] 上架ID	DISPLAY_ID	INT
	private String displayId="";
	//[商品上架] 新旧区分 1为全新 2为二手	IS_USED	TINYINT
	private String isUsed="";
	//[商品上架] 商品所在地ID	STOCK_AREA_ID	INT
	private String stockAreaId="";
	//[商品上架] 运费模板ID，不使用值为0	TRANS_SHEET_ID	INT
	private String transSheetId="";
	//[商品上架] 价格范围_低	PRICE_RANGE_LOW	MONEY
	private String priceRangeLow="";
	//[商品上架] 价格范围_高	PRICE_RANGE_HIGH	MONEY
	private String priceRangeHigh="";
	//[商品上架] 赠送积分数量	OFFER_MILEAGE_POINT	SMALLINT
	private String offerMileagePoint="";
	//[商品上架] 支付积分限制金额	PAY_MILEAGE_LIMIT_AMT	MONEY
	private String payMileageLimitAmt="";
	//[商品上架] 支付代金卷限制金额	PAY_VOUCHER_LIMIT_AMT	MONEY
	private String payVoucherLimitAmt="";
	//[商品上架] 发布开始时间(预约)	START_DT	SMALLDATETIME
	private String startDate="";
	//[商品上架] 发布结束时间(预约)	END_DT	SMALLDATETIME
	private String endDate="";
	//[商品上架] 上架备注	START_DESC	NVARCHAR
	private String startDesc="";
	//[商品上架] 活动内容	EVENT_DESC	NVARCHAR
	private String eventDesc="";
	//[商品上架] 下架备注	END_DESC	NVARCHAR
	private String endDesc="";
	//[商品上架] 更新日期	MODIFIED_DT	SMALLDATETIME
	private String modifiedDate="";
	//[商品上架] 创建日期	CREATED_DT	SMALLDATETIME
	private String createdDate="";
	//[商品上架] Slide图片ID	GOODS_DTL_SLIDE_IMG1	INT
	private String goodsDtlSlideImg1="";
	//[商品上架] Slide图片ID	GOODS_DTL_SLIDE_IMG2	INT
	private String goodsDtlSlideImg2="";
	//[商品上架] Slide图片ID	GOODS_DTL_SLIDE_IMG3	INT
	private String goodsDtlSlideImg3="";
	//[商品上架] Slide图片ID	GOODS_DTL_SLIDE_IMG4	INT
	private String goodsDtlSlideImg4="";
	//[商品上架] Slide图片ID	GOODS_DTL_SLIDE_IMG5	INT
	private String goodsDtlSlideImg5="";
	//[商品上架] List图片ID	GOODS_LIST_IMG	INT
	private String goodsListImg="";
	//NULL	LAST_SALES_DT	SMALLDATETIME
	private String lastSalesDate="";
	//判断商品是否被删除 1被删除 0 未被删除。
	private String isDelete="";
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getDisplayId() {
		return displayId;
	}
	public void setDisplayId(String displayId) {
		this.displayId = displayId;
	}
	public String getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}
	public String getStockAreaId() {
		return stockAreaId;
	}
	public void setStockAreaId(String stockAreaId) {
		this.stockAreaId = stockAreaId;
	}
	public String getTransSheetId() {
		return transSheetId;
	}
	public void setTransSheetId(String transSheetId) {
		this.transSheetId = transSheetId;
	}
	public String getPriceRangeLow() {
		return priceRangeLow;
	}
	public void setPriceRangeLow(String priceRangeLow) {
		this.priceRangeLow = priceRangeLow;
	}
	public String getPriceRangeHigh() {
		return priceRangeHigh;
	}
	public void setPriceRangeHigh(String priceRangeHigh) {
		this.priceRangeHigh = priceRangeHigh;
	}
	public String getOfferMileagePoint() {
		return offerMileagePoint;
	}
	public void setOfferMileagePoint(String offerMileagePoint) {
		this.offerMileagePoint = offerMileagePoint;
	}
	public String getPayMileageLimitAmt() {
		return payMileageLimitAmt;
	}
	public void setPayMileageLimitAmt(String payMileageLimitAmt) {
		this.payMileageLimitAmt = payMileageLimitAmt;
	}
	public String getPayVoucherLimitAmt() {
		return payVoucherLimitAmt;
	}
	public void setPayVoucherLimitAmt(String payVoucherLimitAmt) {
		this.payVoucherLimitAmt = payVoucherLimitAmt;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartDesc() {
		return startDesc;
	}
	public void setStartDesc(String startDesc) {
		this.startDesc = startDesc;
	}
	public String getEventDesc() {
		return eventDesc;
	}
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}
	public String getEndDesc() {
		return endDesc;
	}
	public void setEndDesc(String endDesc) {
		this.endDesc = endDesc;
	}
	public String getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getGoodsDtlSlideImg1() {
		return goodsDtlSlideImg1;
	}
	public void setGoodsDtlSlideImg1(String goodsDtlSlideImg1) {
		this.goodsDtlSlideImg1 = goodsDtlSlideImg1;
	}
	public String getGoodsDtlSlideImg2() {
		return goodsDtlSlideImg2;
	}
	public void setGoodsDtlSlideImg2(String goodsDtlSlideImg2) {
		this.goodsDtlSlideImg2 = goodsDtlSlideImg2;
	}
	public String getGoodsDtlSlideImg3() {
		return goodsDtlSlideImg3;
	}
	public void setGoodsDtlSlideImg3(String goodsDtlSlideImg3) {
		this.goodsDtlSlideImg3 = goodsDtlSlideImg3;
	}
	public String getGoodsDtlSlideImg4() {
		return goodsDtlSlideImg4;
	}
	public void setGoodsDtlSlideImg4(String goodsDtlSlideImg4) {
		this.goodsDtlSlideImg4 = goodsDtlSlideImg4;
	}
	public String getGoodsDtlSlideImg5() {
		return goodsDtlSlideImg5;
	}
	public void setGoodsDtlSlideImg5(String goodsDtlSlideImg5) {
		this.goodsDtlSlideImg5 = goodsDtlSlideImg5;
	}
	public String getGoodsListImg() {
		return goodsListImg;
	}
	public void setGoodsListImg(String goodsListImg) {
		this.goodsListImg = goodsListImg;
	}
	public String getLastSalesDate() {
		return lastSalesDate;
	}
	public void setLastSalesDate(String lastSalesDate) {
		this.lastSalesDate = lastSalesDate;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
}
