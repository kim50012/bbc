package com.waremec.wpt.admin.domain;
/**
 * 存储店铺商品的分类
 * @author Administrator
 *
 */
public class AdminGoodsDisplayClass 
{
	//存储操作的类型(I : 保存, U : 更新, D : 删除)
	private String jobType="";
	//[商品上架分类] 店铺ID	SHOP_ID
	private String shopId="";
	//[商品上架分类] 商品ID	GOODS_ID
	private String goodsId="";
	//[商品上架分类] 上架ID	DISPLAY_ID
	private String displayId="";
	//[商品上架分类] 店铺商品分类ID (展示位置)	SGC_ID
	private String sgcId="";
	//[商品上架分类] 创建日期	CREATED_DT
	private String createdDate="";
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
	public String getSgcId() {
		return sgcId;
	}
	public void setSgcId(String sgcId) {
		this.sgcId = sgcId;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	
}
