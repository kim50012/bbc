package com.waremec.wpt.admin.domain.dispaly;

public class GoodsDispalyPriceInsert {
	
	private Integer shopId; //店铺ID
	private Integer goodsId; //商品ID
	private Integer displayId; //上架ID
	private Integer priceOptionId; //价格ID   Insert: NULL
	private Integer gcId; //商品分类ID
	private Integer specId1; //规格ID1
	private Integer specValueId1; //规格值1
	private Integer specId2; //规格ID2
	private Integer specValueId2; //规格值2
	private Double priceOrg; //原价
	private Double priceUnitSales;//单价
	private Integer stockIn; // 库存
	private Integer sumPayQty; // 付款人数
	private Integer sumFvortQty; // 收藏人数
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
	public Integer getPriceOptionId() {
		return priceOptionId;
	}
	public void setPriceOptionId(Integer priceOptionId) {
		this.priceOptionId = priceOptionId;
	}
	public Integer getGcId() {
		return gcId;
	}
	public void setGcId(Integer gcId) {
		this.gcId = gcId;
	}
	public Integer getSpecId1() {
		return specId1;
	}
	public void setSpecId1(Integer specId1) {
		this.specId1 = specId1;
	}
	public Integer getSpecValueId1() {
		return specValueId1;
	}
	public void setSpecValueId1(Integer specValueId1) {
		this.specValueId1 = specValueId1;
	}
	public Integer getSpecId2() {
		return specId2;
	}
	public void setSpecId2(Integer specId2) {
		this.specId2 = specId2;
	}
	public Integer getSpecValueId2() {
		return specValueId2;
	}
	public void setSpecValueId2(Integer specValueId2) {
		this.specValueId2 = specValueId2;
	}
	public Double getPriceOrg() {
		return priceOrg;
	}
	public void setPriceOrg(Double priceOrg) {
		this.priceOrg = priceOrg;
	}
	public Double getPriceUnitSales() {
		return priceUnitSales;
	}
	public void setPriceUnitSales(Double priceUnitSales) {
		this.priceUnitSales = priceUnitSales;
	}
	public Integer getStockIn() {
		return stockIn;
	}
	public void setStockIn(Integer stockIn) {
		this.stockIn = stockIn;
	}
	public Integer getSumPayQty() {
		return sumPayQty;
	}
	public void setSumPayQty(Integer sumPayQty) {
		this.sumPayQty = sumPayQty;
	}
	public Integer getSumFvortQty() {
		return sumFvortQty;
	}
	public void setSumFvortQty(Integer sumFvortQty) {
		this.sumFvortQty = sumFvortQty;
	}
	
}
