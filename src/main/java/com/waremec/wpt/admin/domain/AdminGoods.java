package com.waremec.wpt.admin.domain;

import java.util.ArrayList;
import java.util.List;

public class AdminGoods {

	/*----------商品分组管理----------*/
	/* 店铺Id */
	private int shopId = 0;
	
	/* 店铺Id */
	private String userId;

	/* 店铺商品分类-第一级分类Id */
	private int shopGoodsOneId = 0;

	/* 店铺商品分类-第一级分类名称 */
	private String shopGoodsOneNm = "";

	/* 店铺商品分类-第二级分类Id */
	private int shopGoodsTwoId = 0;

	/* 店铺商品分类-第二级分类名称 */
	private String shopGoodsTwoNm = "";

	/* 区分 */
	private int shopGoodsType = 0;

	/* 区分名称 */
	private String shopGoodsTypeNm = "";

	/* 停用按钮显示与否 */
	private String display = "";

	/* 一二级区分对应 */
	private String shopGoodsParentId = "";

	/* 修改时的原始第一分类Id */
	private int shopGoodsOneOldId = 0;

	/* 修改时的原始第二分类Id */
	private int shopGoodsTwoOldId = 0;

	/* 编辑类型 */
	private String operation = "";

	/* 编辑按钮区分 */
	private String edit = "";

	List<AdminGoods> subList = new ArrayList<AdminGoods>();
	/* 存储subList的长度。 */
	private String listLength = "";
	
	/* 存储subList的长度。 */
	private String option = "";

	/*----------商品登记----------*/
	/* 商品ID */
	private int goodsId;

	/* 商品名称 */
	private String goodsNm;

	/* 商品图片 */
	private String goodsImg;

	/* 商品图片 */
	private int goodsImgId;

	/* 商品图片路径 */
	private String goodsImgUrl;

	/* 商品分类第一级Id */
	private int goodsClassOneId;

	/* 商品分类第一级名称 */
	private String goodsClassOneNm;

	/* 商品分类第二级Id */
	private int goodsClassTwoId;

	/* 商品分类第二级名称 */
	private String goodsClassTwoNm;

	/* 商品分类第三级Id */
	private int goodsClassThreeId;

	/* 商品分类第三级名称 */
	private String goodsClassThreeNm;

	/* 商品分类Id */
	private int goodsClassId;

	/* 商品分类名称 */
	private String goodsClassNm;

	/* 属性名称 */
	private String specNm;

	/* 属性参数*/
	private String specValueNm;

	/* 属性内容 */
	private String unitTxt;

	/* 商品类型 */
	private int isReal;

	/* 商品标签 */
	private String seoTag;

	/* 查询类型 */
	private int searchType;

	/* 查询类型 */
	private String jobType;

	/* 商品重量 */
	private int goodsWeight;

	/* 分页 */
	private int pageCurr = 0;
	private int pageUint = 0;

	private AdminShopFileMst adminShopFileMst = null;
	
	/*总数*/
	private int TOTAL_CNT;

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public int getShopGoodsOneId() {
		return shopGoodsOneId;
	}

	public void setShopGoodsOneId(int shopGoodsOneId) {
		this.shopGoodsOneId = shopGoodsOneId;
	}

	public String getShopGoodsOneNm() {
		return shopGoodsOneNm;
	}

	public void setShopGoodsOneNm(String shopGoodsOneNm) {
		this.shopGoodsOneNm = shopGoodsOneNm;
	}

	public int getShopGoodsTwoId() {
		return shopGoodsTwoId;
	}

	public void setShopGoodsTwoId(int shopGoodsTwoId) {
		this.shopGoodsTwoId = shopGoodsTwoId;
	}

	public String getShopGoodsTwoNm() {
		return shopGoodsTwoNm;
	}

	public void setShopGoodsTwoNm(String shopGoodsTwoNm) {
		this.shopGoodsTwoNm = shopGoodsTwoNm;
	}

	public int getShopGoodsType() {
		return shopGoodsType;
	}

	public void setShopGoodsType(int shopGoodsType) {
		this.shopGoodsType = shopGoodsType;
	}

	public String getShopGoodsTypeNm() {
		return shopGoodsTypeNm;
	}

	public void setShopGoodsTypeNm(String shopGoodsTypeNm) {
		this.shopGoodsTypeNm = shopGoodsTypeNm;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getShopGoodsParentId() {
		return shopGoodsParentId;
	}

	public void setShopGoodsParentId(String shopGoodsParentId) {
		this.shopGoodsParentId = shopGoodsParentId;
	}

	public int getShopGoodsOneOldId() {
		return shopGoodsOneOldId;
	}

	public void setShopGoodsOneOldId(int shopGoodsOneOldId) {
		this.shopGoodsOneOldId = shopGoodsOneOldId;
	}

	public int getShopGoodsTwoOldId() {
		return shopGoodsTwoOldId;
	}

	public void setShopGoodsTwoOldId(int shopGoodsTwoOldId) {
		this.shopGoodsTwoOldId = shopGoodsTwoOldId;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public List<AdminGoods> getSubList() {
		return subList;
	}

	public void setSubList(List<AdminGoods> subList) {
		this.subList = subList;
	}

	public String getListLength() {
		return listLength;
	}

	public void setListLength(String listLength) {
		this.listLength = listLength;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsNm() {
		return goodsNm;
	}

	public void setGoodsNm(String goodsNm) {
		this.goodsNm = goodsNm;
	}

	public String getGoodsImg() {
		return goodsImg;
	}

	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}

	public String getGoodsImgUrl() {
		return goodsImgUrl;
	}

	public void setGoodsImgUrl(String goodsImgUrl) {
		this.goodsImgUrl = goodsImgUrl;
	}

	public int getGoodsClassOneId() {
		return goodsClassOneId;
	}

	public void setGoodsClassOneId(int goodsClassOneId) {
		this.goodsClassOneId = goodsClassOneId;
	}

	public String getGoodsClassOneNm() {
		return goodsClassOneNm;
	}

	public void setGoodsClassOneNm(String goodsClassOneNm) {
		this.goodsClassOneNm = goodsClassOneNm;
	}

	public int getGoodsClassTwoId() {
		return goodsClassTwoId;
	}

	public void setGoodsClassTwoId(int goodsClassTwoId) {
		this.goodsClassTwoId = goodsClassTwoId;
	}

	public String getGoodsClassTwoNm() {
		return goodsClassTwoNm;
	}

	public void setGoodsClassTwoNm(String goodsClassTwoNm) {
		this.goodsClassTwoNm = goodsClassTwoNm;
	}

	public int getGoodsClassThreeId() {
		return goodsClassThreeId;
	}

	public void setGoodsClassThreeId(int goodsClassThreeId) {
		this.goodsClassThreeId = goodsClassThreeId;
	}

	public String getGoodsClassThreeNm() {
		return goodsClassThreeNm;
	}

	public void setGoodsClassThreeNm(String goodsClassThreeNm) {
		this.goodsClassThreeNm = goodsClassThreeNm;
	}

	public int getGoodsClassId() {
		return goodsClassId;
	}

	public void setGoodsClassId(int goodsClassId) {
		this.goodsClassId = goodsClassId;
	}

	public String getGoodsClassNm() {
		return goodsClassNm;
	}

	public void setGoodsClassNm(String goodsClassNm) {
		this.goodsClassNm = goodsClassNm;
	}

	public String getSpecNm() {
		return specNm;
	}

	public void setSpecNm(String specNm) {
		this.specNm = specNm;
	}

	public String getSpecValueNm() {
		return specValueNm;
	}

	public void setSpecValueNm(String specValueNm) {
		this.specValueNm = specValueNm;
	}

	public String getUnitTxt() {
		return unitTxt;
	}

	public void setUnitTxt(String unitTxt) {
		this.unitTxt = unitTxt;
	}

	public int getIsReal() {
		return isReal;
	}

	public void setIsReal(int isReal) {
		this.isReal = isReal;
	}

	public String getSeoTag() {
		return seoTag;
	}

	public void setSeoTag(String seoTag) {
		this.seoTag = seoTag;
	}

	public int getSearchType() {
		return searchType;
	}

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUint() {
		return pageUint;
	}

	public void setPageUint(int pageUint) {
		this.pageUint = pageUint;
	}

	public AdminShopFileMst getAdminShopFileMst() {
		return adminShopFileMst;
	}

	public void setAdminShopFileMst(AdminShopFileMst adminShopFileMst) {
		this.adminShopFileMst = adminShopFileMst;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getGoodsWeight() {
		return goodsWeight;
	}

	public void setGoodsWeight(int goodsWeight) {
		this.goodsWeight = goodsWeight;
	}

	public int getTOTAL_CNT() {
		return TOTAL_CNT;
	}

	public void setTOTAL_CNT(int tOTAL_CNT) {
		TOTAL_CNT = tOTAL_CNT;
	}

	public int getGoodsImgId() {
		return goodsImgId;
	}

	public void setGoodsImgId(int goodsImgId) {
		this.goodsImgId = goodsImgId;
	}
}
