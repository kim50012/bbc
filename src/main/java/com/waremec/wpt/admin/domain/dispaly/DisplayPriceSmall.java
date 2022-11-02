package com.waremec.wpt.admin.domain.dispaly;

public class DisplayPriceSmall {

	private Integer code; //规格1：BigCode
	private String value; //规格1：BigCode name
	private Double priceOrg; //原价
	private Double priceUnitSales;//单价
	private Integer stockIn; // 库存
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
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
}
