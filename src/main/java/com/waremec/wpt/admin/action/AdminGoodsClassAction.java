package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.wpt.admin.domain.AdminGoods;
import com.waremec.wpt.admin.service.GoodsServcie;

@Controller("adminGoodsClassAction")
@Scope(ScopeType.prototype)
public class AdminGoodsClassAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String shopId = "";
	private String shopGoodsOneId = "";
	private String shopGoodsOneNm = "";
	private String shopGoodsTwoId = "";
	private String shopGoodsTwoNm = "";
	private String shopGoodsType = "";
	private String shopGoodsOneOldId = "";
	private String shopGoodsTwoOldId = "";
	private String operation = "";
	private String edit = "";
	private String userId = "";
	private String option = "";
	// 用于存储实际每页多少条数据
	private String pageEntity = "";
	// 查询类型：A:ALL O:第一级分类
	private String searchType = "A";

	@Resource
	private GoodsServcie goodsService;

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一页面加载
	 */
	public String list() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setPageCurr(pageCurr);
		shopGoodsIn.setPageUint(pageUnit);
		List<AdminGoods> oneList = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.oneList", shopGoodsIn);

		if (searchType.equals("A")) {
			for (AdminGoods s : oneList) {
				shopGoodsIn.setShopGoodsOneId(s.getShopGoodsOneId());
				List<AdminGoods> list = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.twoList", shopGoodsIn);
				s.setSubList(list);
				s.setListLength(list.size() + "");
			}
		}

		PageData page = new PageData();
		if(!oneList.isEmpty()){
			int totalCount = goodsService.selectCount("AdminGoods.oneListCount", shopGoodsIn);
			page = new PageData(pageCurr,pageUnit, totalCount , oneList);
		 
		}

		request.put("page", page);
		request.put("oneList", oneList);
		request.put("searchType", searchType);

		return "list";
	}
	
	public String listFragment() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setPageCurr(pageCurr);
		shopGoodsIn.setPageUint(pageUnit);
		List<AdminGoods> oneList = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.oneList", shopGoodsIn);

		if (searchType.equals("A")) {
			for (AdminGoods s : oneList) {
				shopGoodsIn.setShopGoodsOneId(s.getShopGoodsOneId());
				List<AdminGoods> list = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.twoList", shopGoodsIn);
				s.setSubList(list);
				s.setListLength(list.size() + "");
			}
		}

		PageData page = new PageData();
		if(!oneList.isEmpty()){
			int totalCount = goodsService.selectCount("AdminGoods.oneListCount", shopGoodsIn);
			page = new PageData(pageCurr,pageUnit, totalCount , oneList);
		 
		}

		request.put("page", page);
		request.put("oneList", oneList);
		request.put("searchType", searchType);

		return "listFragment";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一新建分类页面加载
	 */
	public String listNewPopup() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));

		List<AdminGoods> oneSelectList = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.oneSelectList", shopGoodsIn);

		request.put("oneSelectList", oneSelectList);

		return "listNewPopup";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一修改弹出页面加载
	 */
	public String listModifyPopup() {

		shopId = getBackSessionShopId().toString();

		if (shopGoodsOneId.equals("")) {
			shopGoodsOneId = "0";
		}
		if (shopGoodsTwoId.equals("")) {
			shopGoodsTwoId = "0";
		}

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setShopGoodsOneId(Integer.parseInt(shopGoodsOneId));
		shopGoodsIn.setShopGoodsTwoId(Integer.parseInt(shopGoodsTwoId));

		AdminGoods shopGoodsIn2 = new AdminGoods();
		shopGoodsIn2.setShopId(Integer.parseInt(shopId));
		shopGoodsIn2.setShopGoodsOneId(Integer.parseInt("0"));

		List<AdminGoods> oneSelectList = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.oneSelectList",
				shopGoodsIn2);
		if (!shopGoodsOneId.equals("0")) {
			List<AdminGoods> twoSelectList = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.twoSelectList",shopGoodsIn);
			request.put("twoSelectList", twoSelectList);
		}

		request.put("oneSelectList", oneSelectList);
		request.put("oneId", shopGoodsOneId);
		request.put("twoId", shopGoodsTwoId);
		request.put("typeId", shopGoodsType);

		return "listModifyPopup";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一第二级分类下拉查询
	 */
	public String twoSelectList() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setShopGoodsOneId(Integer.parseInt(shopGoodsOneId));

		List<AdminGoods> twoSelectList = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.twoSelectList", shopGoodsIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("twoSelectList", twoSelectList);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一第一级分类保存验证
	 */
	public String oneSelectCheck() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setShopGoodsOneNm(shopGoodsOneNm);

		List<AdminGoods> oneSelectCheck = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.oneSelectCheck",shopGoodsIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("oneSelectCheck", oneSelectCheck);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一第二级分类保存验证
	 */
	public String twoSelectCheckOne() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setShopGoodsOneNm(shopGoodsOneNm);

		List<AdminGoods> twoSelectCheckOne = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.twoSelectCheckOne",shopGoodsIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("twoSelectCheckOne", twoSelectCheckOne);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一第二级分类保存验证2
	 */
	public String twoSelectCheckTwo() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setShopGoodsTwoNm(shopGoodsTwoNm);

		List<AdminGoods> twoSelectCheckTwo = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.twoSelectCheckTwo",shopGoodsIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("twoSelectCheckTwo", twoSelectCheckTwo);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一修改页面第一级分类保存验证
	 */
	public String oneSelectModifyCheck() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setShopGoodsOneId(Integer.parseInt(shopGoodsOneId));
		shopGoodsIn.setShopGoodsOneNm(shopGoodsOneNm);

		List<AdminGoods> oneSelectModifyCheck = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.oneSelectModifyCheck", shopGoodsIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("oneSelectModifyCheck", oneSelectModifyCheck);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一修改页面第一级分类保存验证
	 */
	public String oneSelectModifyCheck2() {

		shopId = getBackSessionShopId().toString();

		AdminGoods shopGoodsIn = new AdminGoods();
		shopGoodsIn.setShopId(Integer.parseInt(shopId));
		shopGoodsIn.setShopGoodsTwoId(Integer.parseInt(shopGoodsTwoId));
		shopGoodsIn.setShopGoodsTwoNm(shopGoodsTwoNm);

		List<AdminGoods> oneSelectModifyCheck2 = (List<AdminGoods>) goodsService.selectshopGoodsClassDomain("AdminGoods.oneSelectModifyCheck2", shopGoodsIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("oneSelectModifyCheck2", oneSelectModifyCheck2);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一保存
	 */
	public String save() {

		shopId = getBackSessionShopId().toString();
		String ret = "SUCCESS";

		try {

			if (shopGoodsOneId.equals("")) {
				shopGoodsOneId = "0";
			}
			if (shopGoodsTwoId.equals("")) {
				shopGoodsTwoId = "0";
			}

			AdminGoods saveIn = new AdminGoods();
			saveIn.setShopId(Integer.parseInt(shopId));
			saveIn.setShopGoodsOneId(Integer.parseInt(shopGoodsOneId));
			saveIn.setShopGoodsOneNm(shopGoodsOneNm);
			saveIn.setShopGoodsTwoId(Integer.parseInt(shopGoodsTwoId));
			if(shopGoodsTwoNm.equals("")||shopGoodsTwoNm==""){
				saveIn.setShopGoodsTwoNm(null);
			}else{
				saveIn.setShopGoodsTwoNm(shopGoodsTwoNm);
			}
			saveIn.setShopGoodsType(Integer.parseInt(shopGoodsType));

			goodsService.saveGoodsClass(saveIn);
			

		} catch (Exception e) {
			System.out.println(e);
			ret = "FAIL";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 商品分类一修改
	 */
	public String modify() {

		shopId = getBackSessionShopId().toString();
		String ret = "SUCCESS";

		if (shopGoodsOneOldId.equals("")) {
			shopGoodsOneOldId = "0";
		}
		if (shopGoodsTwoOldId.equals("")) {
			shopGoodsTwoOldId = "0";
		}
		if (shopGoodsTwoId.equals("")) {
			shopGoodsTwoId = "0";
		}
		if (shopGoodsType.equals("")) {
			shopGoodsType = "0";
		}

		try {

			AdminGoods saveIn = new AdminGoods();
			saveIn.setShopId(Integer.parseInt(shopId));
			saveIn.setShopGoodsOneOldId(Integer.parseInt(shopGoodsOneOldId));
			saveIn.setShopGoodsTwoOldId(Integer.parseInt(shopGoodsTwoOldId));
			saveIn.setShopGoodsOneId(Integer.parseInt(shopGoodsOneId));
			saveIn.setShopGoodsOneNm(shopGoodsOneNm);
			saveIn.setShopGoodsTwoId(Integer.parseInt(shopGoodsTwoId));
			saveIn.setShopGoodsTwoNm(shopGoodsTwoNm);
			saveIn.setShopGoodsType(Integer.parseInt(shopGoodsType));
			saveIn.setOperation(operation);
			saveIn.setEdit(edit);

			goodsService.insertDomain("AdminGoods.modify", saveIn);

		} catch (Exception e) {
			ret = "FAIL";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一删除
	 */
	public String ajaxGcDelete() {	

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String ret = "SUCCESS";

		try {
						
			AdminGoods saveIn = new AdminGoods();
			saveIn.setShopId(Integer.parseInt(shopId));
			saveIn.setUserId(userId);
			saveIn.setShopGoodsOneId(Integer.parseInt(shopGoodsOneId));
			if (!shopGoodsTwoId.equals("")) {
				saveIn.setShopGoodsTwoId(Integer.parseInt(shopGoodsTwoId));
			} else {
				saveIn.setShopGoodsTwoId(Integer.parseInt("0"));
			}
			
			goodsService.insertDomain("AdminGoods.gcDelete", saveIn);
			
		}catch(Exception e) {
			ret = "FAIL";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		
		renderJSON(returnMap);
  		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一菜单排序
	 */
	public String ajaxMenuSort() {	

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String ret = "SUCCESS";

		try {
						
			AdminGoods saveIn = new AdminGoods();
			saveIn.setShopId(Integer.parseInt(shopId));
			saveIn.setUserId(userId);
			saveIn.setShopGoodsOneId(Integer.parseInt(shopGoodsOneId));
			if (!shopGoodsTwoId.equals("")) {
				saveIn.setShopGoodsTwoId(Integer.parseInt(shopGoodsTwoId));
			} else {
				saveIn.setShopGoodsTwoId(Integer.parseInt("0"));
			}
			saveIn.setOption(option);
			
			goodsService.insertDomain("AdminGoods.menuSort", saveIn);
			
		}catch(Exception e) {
			ret = "FAIL";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		
		renderJSON(returnMap);
  		
		return NONE;
	}

	
	/**
	 * 添加商品规格Big
	 * @return
	 * @throws Exception
	 */
	public String addSpecLevelOne() throws Exception{
		
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("GC_ID", IntegerUtils.valueOf(getRequest().getParameter("gcId")));
		paramsMap.put("SPEC_NM", getRequest().getParameter("specNm"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		Map<String,Object> resultMap = goodsService.addSpecLevelOne(paramsMap);
		
//		MapUtil.printMap(resultMap);
		
		renderJSON(resultMap);
		
		return NONE;
	}
	/**
	 * 添加商品规格Small
	 * @return
	 * @throws Exception
	 */
	public String addSpecLevelTwo() throws Exception{
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("GC_ID", IntegerUtils.valueOf(getRequest().getParameter("gcId")));
		paramsMap.put("SPEC_ID", IntegerUtils.valueOf(getRequest().getParameter("specId")));
		paramsMap.put("SPEC_VALUE_NM", getRequest().getParameter("specValueNm"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		Map<String,Object> resultMap = goodsService.addSpecLevelTwo(paramsMap);
		
//		MapUtil.printMap(resultMap);
		
		renderJSON(resultMap);
		return NONE;
	}
	
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getShopGoodsOneId() {
		return shopGoodsOneId;
	}

	public void setShopGoodsOneId(String shopGoodsOneId) {
		this.shopGoodsOneId = shopGoodsOneId;
	}

	public String getShopGoodsOneNm() {
		return shopGoodsOneNm;
	}

	public void setShopGoodsOneNm(String shopGoodsOneNm) {
		this.shopGoodsOneNm = shopGoodsOneNm;
	}

	public String getShopGoodsTwoId() {
		return shopGoodsTwoId;
	}

	public void setShopGoodsTwoId(String shopGoodsTwoId) {
		this.shopGoodsTwoId = shopGoodsTwoId;
	}

	public String getShopGoodsTwoNm() {
		return shopGoodsTwoNm;
	}

	public void setShopGoodsTwoNm(String shopGoodsTwoNm) {
		this.shopGoodsTwoNm = shopGoodsTwoNm;
	}

	public String getShopGoodsType() {
		return shopGoodsType;
	}

	public void setShopGoodsType(String shopGoodsType) {
		this.shopGoodsType = shopGoodsType;
	}

	public String getShopGoodsOneOldId() {
		return shopGoodsOneOldId;
	}

	public void setShopGoodsOneOldId(String shopGoodsOneOldId) {
		this.shopGoodsOneOldId = shopGoodsOneOldId;
	}

	public String getShopGoodsTwoOldId() {
		return shopGoodsTwoOldId;
	}

	public void setShopGoodsTwoOldId(String shopGoodsTwoOldId) {
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

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
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
}
