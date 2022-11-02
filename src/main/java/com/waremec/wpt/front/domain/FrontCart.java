package com.waremec.wpt.front.domain;

public class FrontCart {
	//	[购物车] 店铺ID	SHOP_ID	
	private String shopId="";
	//	[购物车] System Customer ID	CUST_SYS_ID	
	private String custSystemId="";
	//	[购物车] 商品ID	GOODS_ID	
	private String goodsId="";
	//	[购物车] 上架ID	DISPLAY_ID	
	private String displayId="";
	//	[购物车] 价格ID	PRICE_OPTION_ID	
	private String priceOptionId="";
	//	[购物车] 购物车ID	CART_ID	
	private String cartId="";
	//	[购物车] 加入日期	CART_IN_DT		
	private String cartInDt="";
	//	[购物车] 删除日期	CART_OUT_DT	
	private String cartOutDt="";			
	//	[购物车] 1购买 2直接删除	CART_OUT_TYPE	
	private String cartOutType="";
	//	[购物车] 加入数量	GOODS_QTY	
	private String goodsQty="";
	//	[购物车] 单价	PRICE_UNIT_SALES	
	private String priceUnitSales="";
	//	[购物车] 总价	PRICE_SUM	
	private String priceSum;
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getCustSystemId() {
		return custSystemId;
	}
	public void setCustSystemId(String custSystemId) {
		this.custSystemId = custSystemId;
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
	public String getPriceOptionId() {
		return priceOptionId;
	}
	public void setPriceOptionId(String priceOptionId) {
		this.priceOptionId = priceOptionId;
	}
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	public String getCartInDt() {
		return cartInDt;
	}
	public void setCartInDt(String cartInDt) {
		this.cartInDt = cartInDt;
	}
	public String getCartOutDt() {
		return cartOutDt;
	}
	public void setCartOutDt(String cartOutDt) {
		this.cartOutDt = cartOutDt;
	}
	public String getCartOutType() {
		return cartOutType;
	}
	public void setCartOutType(String cartOutType) {
		this.cartOutType = cartOutType;
	}
	public String getGoodsQty() {
		return goodsQty;
	}
	public void setGoodsQty(String goodsQty) {
		this.goodsQty = goodsQty;
	}
	public String getPriceUnitSales() {
		return priceUnitSales;
	}
	public void setPriceUnitSales(String priceUnitSales) {
		this.priceUnitSales = priceUnitSales;
	}
	public String getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(String priceSum) {
		this.priceSum = priceSum;
	}
	
}
