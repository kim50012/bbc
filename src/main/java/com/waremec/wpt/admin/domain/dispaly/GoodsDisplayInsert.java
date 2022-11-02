package com.waremec.wpt.admin.domain.dispaly;

import java.util.Date;

public class GoodsDisplayInsert {
	
	private Integer shopId; 			// 店铺ID
	private Integer goodsId; 			// 商品ID
	private Integer displayId; 			// 上架ID
	private Integer reserve; 			// 预约销售与否
	private Date reserveEndDt; 			// 预约销售截止日期
	private Integer isUsed; 			// 新旧区分 1为全新 2为二手
	private Integer stockAreaId; 		// 商品所在地ID
	private Integer voucherUse; 		// 是否使用优惠券
	private Integer discountId; 		// 折扣政策
	private Integer transSheetId; 		// 运费模板ID，不使用值为0
	private Date startDt; 				// 发布开始时间(预约)
	private Date endDt; 				// 发布结束时间(预约)
	private String startDesc; 			// 上架备注
	private String eventDesc; 			// 活动内容
	private Integer goodsDtlSlideImg1;	// Slide图片ID
	private Integer goodsDtlSlideImg2;	// Slide图片ID
	private Integer goodsDtlSlideImg3;	// Slide图片ID
	private Integer goodsDtlSlideImg4;	// Slide图片ID
	private Integer goodsDtlSlideImg5;	// Slide图片ID
	private String goodsDtlSlideImgUrl1;	// Slide图片ID
	private String goodsDtlSlideImgUrl2;	// Slide图片ID
	private String goodsDtlSlideImgUrl3;	// Slide图片ID
	private String goodsDtlSlideImgUrl4;	// Slide图片ID
	private String goodsDtlSlideImgUrl5;	// Slide图片ID
	private Integer goodsListImg;		// List图片ID
	private Integer pageId;				// Dynamic Page ID
	private String descTitle;			// 商品标题
	private String descDetail;			// 商品内容 --NTEXT
	private String sgcIdSplit;			// 店铺商品分类 (ex:10119,10115)
	private Integer gcId;				// 标准商品分类 (ex:10044)
	private String tagIdSplit;			// 商品Tag (ex:圃美多,冷面)
	private String itemType;
	private String itemUrl;

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getDisplayId() {
		return displayId;
	}

	public void setDisplayId(Integer displayId) {
		this.displayId = displayId;
	}

	public Integer getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(Integer isUsed) {
		this.isUsed = isUsed;
	}

	public Integer getStockAreaId() {
		return stockAreaId;
	}

	public void setStockAreaId(Integer stockAreaId) {
		this.stockAreaId = stockAreaId;
	}

	public Integer getTransSheetId() {
		return transSheetId;
	}

	public void setTransSheetId(Integer transSheetId) {
		this.transSheetId = transSheetId;
	}

	public Date getStartDt() {
		return startDt;
	}

	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}

	public Date getEndDt() {
		return endDt;
	}

	public void setEndDt(Date endDt) {
		this.endDt = endDt;
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

	public Integer getGoodsDtlSlideImg1() {
		return goodsDtlSlideImg1;
	}

	public void setGoodsDtlSlideImg1(Integer goodsDtlSlideImg1) {
		this.goodsDtlSlideImg1 = goodsDtlSlideImg1;
	}

	public Integer getGoodsDtlSlideImg2() {
		return goodsDtlSlideImg2;
	}

	public void setGoodsDtlSlideImg2(Integer goodsDtlSlideImg2) {
		this.goodsDtlSlideImg2 = goodsDtlSlideImg2;
	}

	public Integer getGoodsDtlSlideImg3() {
		return goodsDtlSlideImg3;
	}

	public void setGoodsDtlSlideImg3(Integer goodsDtlSlideImg3) {
		this.goodsDtlSlideImg3 = goodsDtlSlideImg3;
	}

	public Integer getGoodsDtlSlideImg4() {
		return goodsDtlSlideImg4;
	}

	public void setGoodsDtlSlideImg4(Integer goodsDtlSlideImg4) {
		this.goodsDtlSlideImg4 = goodsDtlSlideImg4;
	}

	public Integer getGoodsDtlSlideImg5() {
		return goodsDtlSlideImg5;
	}

	public void setGoodsDtlSlideImg5(Integer goodsDtlSlideImg5) {
		this.goodsDtlSlideImg5 = goodsDtlSlideImg5;
	}

	public Integer getGoodsListImg() {
		return goodsListImg;
	}

	public void setGoodsListImg(Integer goodsListImg) {
		this.goodsListImg = goodsListImg;
	}

	public Integer getPageId() {
		return pageId;
	}

	public void setPageId(Integer pageId) {
		this.pageId = pageId;
	}

	public String getDescTitle() {
		return descTitle;
	}

	public void setDescTitle(String descTitle) {
		this.descTitle = descTitle;
	}

	public String getDescDetail() {
		return descDetail;
	}

	public void setDescDetail(String descDetail) {
		this.descDetail = descDetail;
	}

	public String getSgcIdSplit() {
		return sgcIdSplit;
	}

	public void setSgcIdSplit(String sgcIdSplit) {
		this.sgcIdSplit = sgcIdSplit;
	}

	public Integer getGcId() {
		return gcId;
	}

	public void setGcId(Integer gcId) {
		this.gcId = gcId;
	}

	public String getTagIdSplit() {
		return tagIdSplit;
	}

	public void setTagIdSplit(String tagIdSplit) {
		this.tagIdSplit = tagIdSplit;
	}

	public Integer getVoucherUse() {
		return voucherUse;
	}

	public void setVoucherUse(Integer voucherUse) {
		this.voucherUse = voucherUse;
	}

	public Integer getDiscountId() {
		return discountId;
	}

	public void setDiscountId(Integer discountId) {
		this.discountId = discountId;
	}

	public String getGoodsDtlSlideImgUrl1() {
		return goodsDtlSlideImgUrl1;
	}

	public void setGoodsDtlSlideImgUrl1(String goodsDtlSlideImgUrl1) {
		this.goodsDtlSlideImgUrl1 = goodsDtlSlideImgUrl1;
	}

	public String getGoodsDtlSlideImgUrl2() {
		return goodsDtlSlideImgUrl2;
	}

	public void setGoodsDtlSlideImgUrl2(String goodsDtlSlideImgUrl2) {
		this.goodsDtlSlideImgUrl2 = goodsDtlSlideImgUrl2;
	}

	public String getGoodsDtlSlideImgUrl3() {
		return goodsDtlSlideImgUrl3;
	}

	public void setGoodsDtlSlideImgUrl3(String goodsDtlSlideImgUrl3) {
		this.goodsDtlSlideImgUrl3 = goodsDtlSlideImgUrl3;
	}

	public String getGoodsDtlSlideImgUrl4() {
		return goodsDtlSlideImgUrl4;
	}

	public void setGoodsDtlSlideImgUrl4(String goodsDtlSlideImgUrl4) {
		this.goodsDtlSlideImgUrl4 = goodsDtlSlideImgUrl4;
	}

	public String getGoodsDtlSlideImgUrl5() {
		return goodsDtlSlideImgUrl5;
	}

	public void setGoodsDtlSlideImgUrl5(String goodsDtlSlideImgUrl5) {
		this.goodsDtlSlideImgUrl5 = goodsDtlSlideImgUrl5;
	}

	public Integer getReserve() {
		return reserve;
	}

	public void setReserve(Integer reserve) {
		this.reserve = reserve;
	}

	public Date getReserveEndDt() {
		return reserveEndDt;
	}

	public void setReserveEndDt(Date reserveEndDt) {
		this.reserveEndDt = reserveEndDt;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getItemUrl() {
		return itemUrl;
	}

	public void setItemUrl(String itemUrl) {
		this.itemUrl = itemUrl;
	}

}
