package com.waremec.wpt.admin.domain;
/**
 * 商品分类实体类
 * @author Administrator
 *
 */
public class AdminGoodsClass 
{
	//[商品分类] 商品分类ID	GC_ID
	private String goodsClassId="";
	//[商品分类] 商品分类名称	GC_NM
	private String goodsClassName="";
	//[商品分类] 上一个分类ID	GC_PARENT_ID
	private String goodsClassParentId="";
	//[商品分类] Tree Level	GC_LEVL
	private String goodsClassLevel="";
	//[商品分类] 0:NOT 1:LEAF	IS_LEAF
	private String is_leaf="";
	//[商品分类] 排序	SORT_NO
	private String sortNo="";
	public String getGoodsClassId() {
		return goodsClassId;
	}
	public void setGoodsClassId(String goodsClassId) {
		this.goodsClassId = goodsClassId;
	}
	public String getGoodsClassName() {
		return goodsClassName;
	}
	public void setGoodsClassName(String goodsClassName) {
		this.goodsClassName = goodsClassName;
	}
	public String getGoodsClassParentId() {
		return goodsClassParentId;
	}
	public void setGoodsClassParentId(String goodsClassParentId) {
		this.goodsClassParentId = goodsClassParentId;
	}
	public String getGoodsClassLevel() {
		return goodsClassLevel;
	}
	public void setGoodsClassLevel(String goodsClassLevel) {
		this.goodsClassLevel = goodsClassLevel;
	}
	public String getIs_leaf() {
		return is_leaf;
	}
	public void setIs_leaf(String is_leaf) {
		this.is_leaf = is_leaf;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
	
}
