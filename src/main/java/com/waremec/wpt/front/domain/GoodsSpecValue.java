package com.waremec.wpt.front.domain;

public class GoodsSpecValue {

	
	private Integer specValueId;
	private String specValueNm;
	private Integer specIdParent;
	private Integer specValueIdParent;
	private String priceOrg;
	private String priceUnitSales;
	private Integer priceOptionId;
	private Integer stockIn;
	private Integer stockNow;
	
	public Integer getSpecValueId() {
		return specValueId;
	}
	public void setSpecValueId(Integer specValueId) {
		this.specValueId = specValueId;
	}
	public String getSpecValueNm() {
		return specValueNm;
	}
	public void setSpecValueNm(String specValueNm) {
		this.specValueNm = specValueNm;
	}
	public String getPriceOrg() {
		return priceOrg;
	}
	public void setPriceOrg(String priceOrg) {
		this.priceOrg = priceOrg;
	}
	public String getPriceUnitSales() {
		return priceUnitSales;
	}
	public void setPriceUnitSales(String priceUnitSales) {
		this.priceUnitSales = priceUnitSales;
	}
	public Integer getPriceOptionId() {
		return priceOptionId;
	}
	public void setPriceOptionId(Integer priceOptionId) {
		this.priceOptionId = priceOptionId;
	}
	public Integer getStockIn() {
		return stockIn;
	}
	public void setStockIn(Integer stockIn) {
		this.stockIn = stockIn;
	}
	public Integer getStockNow() {
		return stockNow;
	}
	public void setStockNow(Integer stockNow) {
		this.stockNow = stockNow;
	}
	 
	public Integer getSpecIdParent() {
		return specIdParent;
	}
	public void setSpecIdParent(Integer specIdParent) {
		this.specIdParent = specIdParent;
	}
	public Integer getSpecValueIdParent() {
		return specValueIdParent;
	}
	public void setSpecValueIdParent(Integer specValueIdParent) {
		this.specValueIdParent = specValueIdParent;
	}
	@Override
	public String toString() {
		return "GoodsSpecValue [specValueId=" + specValueId + ", specValueNm=" + specValueNm + ", specIdParent=" + specIdParent
				+ ", specValueIdParent=" + specValueIdParent + ", priceOrg=" + priceOrg + ", priceUnitSales=" + priceUnitSales
				+ ", priceOptionId=" + priceOptionId + ", stockIn=" + stockIn + ", stockNow=" + stockNow + "]";
	}
 

}
