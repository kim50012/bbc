package com.waremec.wpt.hzm.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.JsonUtil;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;
import com.waremec.wpt.admin.common.service.TemplateServcie;
import com.waremec.wpt.admin.domain.AdminGoods;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.domain.TmplType;
import com.waremec.wpt.admin.domain.dispaly.GoodsDispalyPriceInsert;
import com.waremec.wpt.admin.domain.dispaly.GoodsDisplayInsert;
import com.waremec.wpt.admin.domain.dispaly.ImgItem;
import com.waremec.wpt.admin.service.AdminUserService;
import com.waremec.wpt.admin.service.GoodsDisplayServcie;
import com.waremec.wpt.admin.service.GoodsServcie;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

@Controller("hzmGoodsAction")
@Scope(ScopeType.prototype)
public class Hzm_GoodsAction extends BaseAction implements ServletContextAware {

	private static final long serialVersionUID = 1L;
	
	private String shopId ="";

    private String goodsId = "";
	private String goodsNm ="";
	private String goodsClassId ="";
	private String goodsClassTwoId = "";
	private String goodsClassThreeId = "";
	private String specNm = "";
	private String unitTxt = "";
	private String isReal = "";
	private String seoTag = "";
	private String goodsWeight = "";
	private String goodsImgId = "";
	
	private File logo_input = null;
    private String logoFileName = "";
    private ServletContext context = null;
    private String userId = "";
	
	/*=====分页start=====*/
	//用于存储实际每页多少条数据
	private String pageEntity = "";
	/*=====分页end=====*/
	
	private String jsonStr = "";

	@Resource
	private AdminUserService adminUserService;

	@Resource
	private TemplateServcie templateServcie;
	
	@Resource
	private GoodsDisplayServcie goodsDisplayService;
	
	@Resource
	private GoodsServcie goodsService;

	@Resource
	protected MainService mainService;
	
	
	
	public String showLinkTypeWindow(){
		pageUnit = 50 ;
		
		Integer type 		= IntegerUtils.valueOf(getRequest().getParameter("type"));
		Integer linkType 	= IntegerUtils.valueOf(getRequest().getParameter("linkType"),2);
		String title  = getRequest().getParameter("title");
		 
		logger.info("type========" + type);
		logger.info("linkType====" + linkType);
		logger.info("title=======" + title);
		logger.info("pageCurr====" + pageCurr);
		logger.info("pageUnit====" + pageUnit);
		
		request.put("type", type);
		request.put("linkType", linkType);
		request.put("title", title); 
		
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", linkType);
		parmsMap.put("PAGE_NM", title);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		 
		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
			System.out.println("totalCount=" + totalCount);
		}
		
		request.put("page", page);
		
		return "showLinkTypeWindow";
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一list页面查询
	 */
	public String hzm_List() {
		
		AdminGoods goods = new AdminGoods();
		goods.setShopId(getBackSessionShopId());
		goods.setPageCurr(pageCurr);
		goods.setPageUint(pageUnit);
		
		List<AdminGoods> reList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassList", goods);
		
		PageData page = new PageData();
		if (!reList.isEmpty()) {
			
			int totalCount = reList.get(0).getTOTAL_CNT();
			page = new PageData(pageCurr,pageUnit, totalCount , reList);
		}
		
		request.put("reList", reList);
		request.put("page", page);

		return "hzm_List";
	}
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一list分页
	 */
	public String hzm_ListFragment() {
		
		AdminGoods goods = new AdminGoods();
		goods.setShopId(getBackSessionShopId());		
		if (!goodsNm.equals("")) {
			goods.setGoodsNm(goodsNm);
		}
		goods.setPageCurr(pageCurr);
		goods.setPageUint(pageUnit);
		
		List<AdminGoods> reList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassList", goods);
		
		PageData page = new PageData();
		if (!reList.isEmpty()) {
			
			int totalCount = reList.get(0).getTOTAL_CNT();
			page = new PageData(pageCurr,pageUnit, totalCount , reList);
			//System.out.println("totalCount=" + totalCount);
		}
		
		request.put("reList", reList);
		request.put("page", page);
		
		return "hzm_ListFragment";
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一新建查询
	 */
	public String hzm_GoodsCreate() {

		AdminGoods goods = new AdminGoods();
		if (goodsClassId.equals("")) {
			goodsClassId = "0";
		}
		goods.setGoodsClassId(Integer.parseInt(goodsClassId));
		List<AdminGoods> reList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassSelect", goods);
		request.put("oneSelectList", reList);
		
		return "hzm_GoodsCreate";
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一修改查询
	 */
	public String hzm_GoodsModify() {

		AdminGoods goods = new AdminGoods();
		goods.setShopId(getBackSessionShopId());
		goods.setGoodsId(Integer.parseInt(goodsId));
		
		List<AdminGoods> goodsList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsSelect", goods);
		AdminGoods goodsListOneRow = goodsList.get(0);
		
		goods.setSearchType(Integer.parseInt("1"));
		List<AdminGoods> goodsClassOneList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassListModify", goods);
		List<AdminGoods> goodsClassOne = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassSelectModify", goods);
		
		goods.setSearchType(Integer.parseInt("2"));
		List<AdminGoods> goodsClassTwoList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassListModify", goods);
		List<AdminGoods> goodsClassTwo = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassSelectModify", goods);
		
		goods.setSearchType(Integer.parseInt("3"));
		List<AdminGoods> goodsClassThreeList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassListModify", goods);
		List<AdminGoods> goodsClassThree = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassSelectModify", goods);
		
		request.put("oneSelectList", goodsClassOneList);
		request.put("oneSelectId", goodsClassOne.get(0).getGoodsClassId());
		request.put("oneSelectNm", goodsClassOne.get(0).getGoodsClassNm());
		
		request.put("twoSelectList", goodsClassTwoList);
		request.put("twoSelectId", goodsClassTwo.get(0).getGoodsClassId());
		request.put("twoSelectNm", goodsClassTwo.get(0).getGoodsClassNm());
		
		request.put("threeSelectList", goodsClassThreeList);
		request.put("threeSelectId", goodsClassThree.get(0).getGoodsClassId());
		request.put("threeSelectNm", goodsClassThree.get(0).getGoodsClassNm());

		request.put("goodsNm", goodsListOneRow.getGoodsNm());
		request.put("goodsId", goodsListOneRow.getGoodsId());
		request.put("goodsImg", goodsListOneRow.getGoodsImg());
		request.put("goodsImgUrl", goodsListOneRow.getGoodsImgUrl());
		request.put("isReal", goodsListOneRow.getIsReal());
		request.put("seoTag", goodsListOneRow.getSeoTag());
		request.put("goodsWeight", goodsListOneRow.getGoodsWeight());
		
		return "hzm_GoodsModify";
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一修改页面-属性查询
	 */
	public String goodsModifyOnload() {

		AdminGoods goods = new AdminGoods();
		goods.setShopId(getBackSessionShopId());
		goods.setGoodsId(Integer.parseInt(goodsId));		

		List<AdminGoods> goodsList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsSelect", goods);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("goodsList", goodsList);
		
		renderJSON(returnMap);
		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一修改页面-属性选择弹出页面-分类查询
	 */
	public String ajaxSelectTwoClassList() {
		
		AdminGoods GoodsClassIn = new AdminGoods();
		GoodsClassIn.setGoodsClassOneId(Integer.parseInt(goodsClassId));
		
		List<AdminGoods> reList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassSelect", GoodsClassIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("selectList", reList);
		
		renderJSON(returnMap);
		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一一修改页面-属性选择弹出页面-商品查询
	 */
	public String ajaxSelectGoodsList() {

		shopId = getBackSessionShopId().toString();
		
		AdminGoods GoodsClassIn = new AdminGoods();
		GoodsClassIn.setShopId(Integer.parseInt(shopId));
		GoodsClassIn.setGoodsClassTwoId(Integer.parseInt(goodsClassTwoId));
		
		List<AdminGoods> reGoodsList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsSelectSpec", GoodsClassIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("selectList", reGoodsList);
		
		renderJSON(returnMap);
		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一弹出页面查询
	 */
	public String goodsSpec() {

		shopId = getBackSessionShopId().toString();

		AdminGoods GoodsClassIn = new AdminGoods();
		if(!goodsClassId.equals("")){
			GoodsClassIn.setGoodsClassId(Integer.parseInt(goodsClassId));
		}
		
		List<AdminGoods> reList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsClassSelect", GoodsClassIn);
		
		request.put("oneSelectList", reList);
		
		return "goodsSpec";
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一弹出页面查询
	 */
	public String goodsSpecSelect() {

		shopId = getBackSessionShopId().toString();
		
		AdminGoods GoodsClassIn = new AdminGoods();
		GoodsClassIn.setShopId(Integer.parseInt(shopId));
		GoodsClassIn.setGoodsClassTwoId(Integer.valueOf(goodsClassTwoId).intValue());
		if (!goodsId.equals("")) {
			GoodsClassIn.setGoodsId(Integer.parseInt(goodsId));
		}
		
		List<AdminGoods> reList = (List<AdminGoods>) goodsService.selectGoodsClass("AdminGoods.goodsSpecSelect", GoodsClassIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("selectList", reList);
		
		renderJSON(returnMap);
		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一新建保存
	 */
	public String save() {
		
		boolean success = true;
		String err_msg = "";
		
		if (goodsImgId.equals("")) {
			
			//logger.error(e.getMessage());
			success = false;
			err_msg = "请重新上传图片";
		} else {
			
			try {
				AdminGoods saveIn = new AdminGoods();
				saveIn.setShopId(getBackSessionShopId());
				saveIn.setUserId(getBackSessionUserId());
				saveIn.setGoodsNm(goodsNm);
				saveIn.setGoodsClassTwoId(Integer.parseInt(goodsClassTwoId));
				saveIn.setGoodsClassThreeId(Integer.parseInt(goodsClassThreeId));
				saveIn.setSpecNm(specNm);
				saveIn.setUnitTxt(unitTxt);
				saveIn.setIsReal(Integer.parseInt(isReal));
				saveIn.setSeoTag(seoTag);
				saveIn.setGoodsWeight(Integer.parseInt(goodsWeight));
				saveIn.setGoodsImgId(Integer.parseInt(goodsImgId));
			
				goodsService.insertDomain("AdminGoods.goodssave", saveIn);
				
			} catch (Exception e) {
				
				//logger.error(e.getMessage());
				success = false;
				err_msg = e.getMessage();
			}
		}
		
		/*Map<String, Object> returnMap = new HashMap<String, Object>();		
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		
		renderJSON(returnMap);*/
		
		JSONObject jo = new JSONObject();
		jo.put("success", success);
		jo.put("err_msg", err_msg);
		
  		renderHtml(jo.toString());
  		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一修改保存
	 */
	public String modify() {
		
		boolean success = true;
		String err_msg = "";
		
		if (goodsImgId.equals("")) {
			
			//logger.error(e.getMessage());
			success = false;
			err_msg = "请重新上传图片";
		} else {
			
				try {
								
					AdminGoods saveIn = new AdminGoods();
					saveIn.setShopId(getBackSessionShopId());
					saveIn.setUserId(getBackSessionUserId());
					saveIn.setGoodsId(Integer.parseInt(goodsId));
					saveIn.setGoodsNm(goodsNm);
					saveIn.setGoodsClassTwoId(Integer.parseInt(goodsClassTwoId));
					saveIn.setGoodsClassThreeId(Integer.parseInt(goodsClassThreeId));
					saveIn.setSpecNm(specNm);
					saveIn.setUnitTxt(unitTxt);
					saveIn.setIsReal(Integer.parseInt(isReal));
					saveIn.setSeoTag(seoTag);
					saveIn.setGoodsWeight(Integer.parseInt(goodsWeight));
					saveIn.setGoodsImgId(Integer.parseInt(goodsImgId));
					
					goodsService.insertDomain("AdminGoods.goodsModify", saveIn);
					
				} catch (Exception e) {
					
					//logger.error(e.getMessage());
					success = false;
					err_msg = e.getMessage();
				}
		}
		
		/*Map<String, Object> returnMap = new HashMap<String, Object>();		
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		
		renderJSON(returnMap);*/
		
		JSONObject jo = new JSONObject();
		jo.put("success", success);
		jo.put("err_msg", err_msg);
		
  		renderHtml(jo.toString());
  		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一删除
	 */
	public String hzm_AjaxGoodsDelete() {	

		boolean success = true;
		String err_msg = "";

		try {
						
			AdminGoods goods = new AdminGoods();
			goods.setShopId(getBackSessionShopId());
			goods.setUserId(getBackSessionUserId());
			goods.setGoodsId(Integer.parseInt(goodsId));
			
			goodsService.insertDomain("AdminGoods.goodsDelete", goods);
			
		} catch (Exception e) {
			//logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();		
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);
		return NONE;
	}
	 
 
	public String goodsList() {

		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("FILE_ID", null);
		parmsMap.put("FILE_NM", null);
		parmsMap.put("FILE_TYPE", null);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		parmsMap.put("USER_ID", null);
		

		List<Map<String, Object>> data = commonService.selectList("AdminGoods.SHOP_FILE_MST_LIST_SELECT",parmsMap);
//		ListUtil.printListMap(data);
		renderJSON(data);
		
		
		return NONE;
	}
	public String goodsListNew() {
//		System.out.println(this.jsonStr);
//		renderJSON(this.jsonStr);
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("FILE_ID", null);
		parmsMap.put("FILE_NM", null);
		parmsMap.put("FILE_TYPE", 1);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		parmsMap.put("USER_ID", null);
		parmsMap.put("FILE_GROUP", 1);
		
		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.SHOP_FILE_MST_LIST_SELECT",parmsMap);
//		ListUtil.printListMap(list);
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
			System.out.println("totalCount=" + totalCount);
		}
		
		
		
		renderJSON(page);
		
		return NONE;
	}
	
	public String linkList() {
		System.out.println();
		
		String serachTitle = getRequest().getParameter("serachTitle");
		String serachLinkType = getRequest().getParameter("serachLinkType");
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);

		
		
		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
			System.out.println("totalCount=" + totalCount);
		}
		
		renderJSON(page);

		return NONE;
	}
	
	/**
	 * 进入商品上架页面
	 * @return
	 */
	public String preDisplayCreate() throws Exception {
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		request.put("goodTransportCombo", commonService.selectList("AdminGoods.TRANSPORT_SHEET_SELECT" , paramsMap));
		
		paramsMap.put("VOUCHER_TYPE", 2);
		request.put("voucherAbleCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		paramsMap.put("VOUCHER_TYPE", 3);
		request.put("discountPolicyCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		
		
		paramsMap.put("AREA_PARENT_ID", null);
		paramsMap.put("AREA_LEVL", 1);
		request.put("provinceCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		return "preDisplayCreate";
	}
	/**
	 * 进入商品上架修改页面
	 * @return
	 */
	public String preDispalyModify() throws Exception {
		
		Integer displayId = IntegerUtils.valueOf(getRequest().getParameter("displayId"));
		System.out.println("displayId=======" + displayId);
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("SGC_PARENT_ID", null);
		
		
		Map<String, Object> displayMaster = commonService.select("GoodsDisplay.GOODS_DISPLAY_MODIFY_SELECT" , paramsMap);
		MapUtil.convertClob2String(displayMaster);
//		MapUtil.printOrderedMap(displayMaster);
		request.put("displayMaster", displayMaster);
		
		
		Date  reserveEndDt = (Date)displayMaster.get("RESERVE_END_DT");
		request.put("reserveEndDate", DateUtil.toStrDate(reserveEndDt));
		request.put("reserveEndTime", DateUtil.getCurHour(reserveEndDt));
		
		
		
		ImgItem mainImg = new ImgItem();
		mainImg.setTempId(1);
		mainImg.setId((Integer)displayMaster.get("GOODS_LIST_IMG"));
		mainImg.setTitle((String)displayMaster.get("GOODS_LIST_IMG_NM"));
		mainImg.setAttachment_url((String)displayMaster.get("GOODS_LIST_IMG_URL"));
		mainImg.setLinkUrl("");
		request.put("goodsListImg", JSONObject.fromObject(mainImg));
		
		String tagName = (String)displayMaster.get("TAG_NM");
		if(StringUtils.isNotEmpty(tagName)){
			request.put("tagIdSplit", Arrays.asList(tagName.split(",")));
		}
		
		List<ImgItem> slideImgs = new ArrayList<ImgItem>();
		Integer slideImgId1 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID1"));
		Integer slideImgId2 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID2"));
		Integer slideImgId3 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID3"));
		Integer slideImgId4 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID4"));
		Integer slideImgId5 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID5"));
		
		if(slideImgId1 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(1);
			slideImg.setId(slideImgId1);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM1"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL1"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId2 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(2);
			slideImg.setId(slideImgId2);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM2"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL2"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId3 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(3);
			slideImg.setId(slideImgId3);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM3"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL3"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId4 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(4);
			slideImg.setId(slideImgId4);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM4"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL4"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId5 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(5);
			slideImg.setId(slideImgId5);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM5"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL5"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		 
		
		request.put("slideImgs", slideImgs);
		request.put("slideImgsJson", JSONArray.fromObject(slideImgs));
		
		List<Map<String, Object>> dispalyPriceList = commonService.selectList("GoodsDisplay.GOODS_DISPLAY_PRICE_MODIFY_SELECT" , paramsMap);
// 		ListUtil.printListMap(dispalyPriceList);
		request.put("dispalyPriceList", dispalyPriceList);
		
		for (Map<String, Object> item : dispalyPriceList) {
			Object price = item.get("PRICE_ORG");
			System.out.println("<<<<<<<<<<<<<<<<<<<<");
			System.out.println(price.getClass());
			System.out.println("<<<<<<<<<<<<<<<<<<<<");
		}
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		paramsMap.put("SGC_PARENT_ID", (Integer)displayMaster.get("SGC_ID_LV1"));
		request.put("goodClassLevel2", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		paramsMap.put("VOUCHER_TYPE", 2);
		request.put("voucherAbleCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		paramsMap.put("VOUCHER_TYPE", 3);
		request.put("discountPolicyCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		
		
		paramsMap.put("AREA_PARENT_ID", null);
		paramsMap.put("AREA_LEVL", 1);
		request.put("provinceCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		paramsMap.put("AREA_PARENT_ID", (Integer)displayMaster.get("STOCK_AREA_ID_LV1"));
		paramsMap.put("AREA_LEVL", 2);
		request.put("cityCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		paramsMap.clear();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", (Integer)displayMaster.get("GC_ID"));
		paramsMap.put("SPEC_ID", null);
		paramsMap.put("SPEC_TYPE", 1);
		paramsMap.put("USER_ID", getBackSessionUserId());
		request.put("goodsSpecBigCombo", commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		request.put("goodTransportCombo", commonService.selectList("AdminGoods.TRANSPORT_SHEET_SELECT" , paramsMap));
		
		
		Map<String,Object> spec = dispalyPriceList.get(0);
		Integer bigSpecId1 = (Integer) spec.get("SPEC_ID_1");
		Integer bigSpecId2 = (Integer) spec.get("SPEC_ID_2");
		
		paramsMap.clear();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", (Integer)displayMaster.get("GC_ID"));
		paramsMap.put("SPEC_TYPE", 2);
		paramsMap.put("USER_ID", getBackSessionUserId());
		if(bigSpecId1 != null){
			paramsMap.put("SPEC_ID", bigSpecId1);
			request.put("bigSpecId1", bigSpecId1);
			request.put("goodsSpecSmall1Combo", commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
			
			Set<Integer> set = new HashSet<Integer>();
			for (Map<String, Object> item : dispalyPriceList) {
				set.add((Integer) item.get("SPEC_VALUE_ID_1"));
			}
			request.put("smallSpecIds1", set);
		}
		if(bigSpecId2 != null){
			paramsMap.put("SPEC_ID", bigSpecId2);
			request.put("bigSpecId2", bigSpecId2);
			request.put("goodsSpecSmall2Combo", commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
			
			Set<Integer> set = new HashSet<Integer>();
			for (Map<String, Object> item : dispalyPriceList) {
				set.add((Integer) item.get("SPEC_VALUE_ID_2"));
			}
			request.put("smallSpecIds2", set);
		}
		
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		List<Map<String,Object>> pageHeaderAndItem = commonService.selectList("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
		if(!pageHeaderAndItem.isEmpty()){
			Map<String,Object> header = pageHeaderAndItem.get(0);
			PageHeader pageHeader = new PageHeader();
			
			pageHeader.setShopId((Integer)header.get("SHOP_ID"));
			pageHeader.setPageId((Integer)header.get("PAGE_ID"));
			pageHeader.setPageType((Integer)header.get("PAGE_TYPE"));
			pageHeader.setDisplayId((Integer)header.get("DISPLAY_ID"));
			
			for (Map<String, Object> item : pageHeaderAndItem) {
			
				PageItem pageItem = new PageItem();
				
				pageItem.setShopId((Integer)item.get("SHOP_ID"));
				pageItem.setPageId((Integer)item.get("PAGE_ID"));
				pageItem.setItemId((Integer)item.get("ITEM_ID"));
				pageItem.setSort((Integer)item.get("SORT"));
				pageItem.setTmplNo((String)item.get("TMPL_NO"));
				
				paramsMap.clear();
				paramsMap.put("SHOP_ID", getBackSessionShopId());
				paramsMap.put("DISPLAY_ID", displayId);
				paramsMap.put("PAGE_ID", pageItem.getPageId());
				paramsMap.put("ITEM_ID", pageItem.getItemId());
				paramsMap.put("USER_ID", getBackSessionUserId());
				
				List<Map<String,Object>> pageDtls = commonService.selectList("Template.DYNAMIC_PAGE_DTL_MODIFY_SELECT" , paramsMap);
				if (TmplType.TYPE_01.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImgItem img = new ImgItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setAttachment_url((String)dtlItem.get("VAL01"));
						img.setTitle((String)dtlItem.get("VAL02"));
						img.setLinkUrl((String)dtlItem.get("VAL03"));
						
						typeImgs.add(img);
						
						PageDtl pageDtl = new PageDtl();
						pageDtl.setVal01((String)dtlItem.get("VAL01"));
						pageDtl.setVal02((String)dtlItem.get("VAL02"));
						pageDtl.setVal03((String)dtlItem.get("VAL03"));
						pageItem.getDetails().add(pageDtl);
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_05.getNum().equals(pageItem.getTmplNo())) {
					 PageDtl pageDtl = new PageDtl();
					 Map<String,Object> dtlMap = pageDtls.get(0);
					 
					 pageDtl.setVal01((String)dtlMap.get("VAL01"));
					 pageDtl.setVal02((String)dtlMap.get("VAL02"));
					 pageDtl.setVal03((String)dtlMap.get("VAL03"));
					 
					 pageItem.getDetails().add(pageDtl);
				}else if (TmplType.TYPE_12.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImgItem img = new ImgItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setAttachment_url((String)dtlItem.get("VAL01"));
						img.setTitle((String)dtlItem.get("VAL02"));
						img.setLinkUrl((String)dtlItem.get("VAL03"));
						
						typeImgs.add(img);
						
						PageDtl pageDtl = new PageDtl();
						pageDtl.setVal01((String)dtlItem.get("VAL01"));
						pageDtl.setVal02((String)dtlItem.get("VAL02"));
						pageDtl.setVal03((String)dtlItem.get("VAL03"));
						pageItem.getDetails().add(pageDtl);
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_13.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL01"));
							img.setTitle((String)dtlItem.get("VAL02"));
							img.setLinkUrl((String)dtlItem.get("VAL03"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL01"));
							pageDtl.setVal02((String)dtlItem.get("VAL02"));
							pageDtl.setVal03((String)dtlItem.get("VAL03"));
							pageDtl.setVal04((String)dtlItem.get("VAL04"));
							pageDtl.setVal05((String)dtlItem.get("VAL09"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL05"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL05"));
							img.setTitle((String)dtlItem.get("VAL06"));
							img.setLinkUrl((String)dtlItem.get("VAL07"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL05"));
							pageDtl.setVal02((String)dtlItem.get("VAL06"));
							pageDtl.setVal03((String)dtlItem.get("VAL07"));
							pageDtl.setVal04((String)dtlItem.get("VAL08"));
							pageDtl.setVal05((String)dtlItem.get("VAL10"));
							pageItem.getDetails().add(pageDtl);
						}
						
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_18.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL01"));
							img.setTitle((String)dtlItem.get("VAL02"));
							img.setLinkUrl((String)dtlItem.get("VAL03"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL01"));
							pageDtl.setVal02((String)dtlItem.get("VAL02"));
							pageDtl.setVal03((String)dtlItem.get("VAL03"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL04"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL04"));
							img.setTitle((String)dtlItem.get("VAL05"));
							img.setLinkUrl((String)dtlItem.get("VAL06"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL04"));
							pageDtl.setVal02((String)dtlItem.get("VAL05"));
							pageDtl.setVal03((String)dtlItem.get("VAL06"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL07"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL07"));
							img.setTitle((String)dtlItem.get("VAL08"));
							img.setLinkUrl((String)dtlItem.get("VAL09"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL07"));
							pageDtl.setVal02((String)dtlItem.get("VAL08"));
							pageDtl.setVal03((String)dtlItem.get("VAL09"));
							pageItem.getDetails().add(pageDtl);
						}
						
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_20.getNum().equals(pageItem.getTmplNo())) {
					 PageDtl pageDtl = new PageDtl();
					 Map<String,Object> dtlMap = pageDtls.get(0);
					 
					 pageDtl.setVal01((String)dtlMap.get("VAL01"));
					 pageDtl.setVal02((String)dtlMap.get("VAL02"));
					 pageDtl.setVal03((String)dtlMap.get("VAL03"));
					 
					 pageItem.getDetails().add(pageDtl);
				}else if (TmplType.TYPE_52.getNum().equals(pageItem.getTmplNo())) {
					List<Map<String,Object>> typeImgs = new ArrayList<Map<String,Object>>();
					for (Map<String, Object> dtlItem : pageDtls) {
						Map<String,Object> img = new HashMap<String,Object>();
						
						img.put("tempId", Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.put("id", IntegerUtils.valueOf((String)dtlItem.get("VAL02")));//displayId
						img.put("pageName", (String)dtlItem.get("VAL03"));
						img.put("imgFileUrl", (String)dtlItem.get("VAL04"));
						img.put("imgFileId", (String)dtlItem.get("VAL05"));
						img.put("linkUrl", (String)dtlItem.get("VAL06"));
						img.put("pageId", (String)dtlItem.get("VAL07"));
						
						typeImgs.add(img);
						
						PageDtl pageDtl = new PageDtl();
						pageDtl.setVal01((String)dtlItem.get("VAL01"));
						pageDtl.setVal02((String)dtlItem.get("VAL02"));
						pageDtl.setVal03((String)dtlItem.get("VAL03"));
						pageDtl.setVal04((String)dtlItem.get("VAL04"));
						pageDtl.setVal05((String)dtlItem.get("VAL05"));
						pageDtl.setVal06((String)dtlItem.get("VAL06"));
						pageDtl.setVal07((String)dtlItem.get("VAL07"));
						pageItem.getDetails().add(pageDtl);
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_99.getNum().equals(pageItem.getTmplNo())) {
					 PageDtl pageDtl = new PageDtl();
					 Map<String,Object> dtlMap = pageDtls.get(0);
					 MapUtil.convertClob2String(dtlMap);
					 
					 pageDtl.setVal01((String)dtlMap.get("TXT01"));
					 
					 pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
			}
			
			request.put("pageHeader", pageHeader);
			
		}
		
		return "preDispalyModify";
	}
	
	/**
	 * 
	 * 商品上架复制页面
	 * @return
	 * @throws Exception
	 */
	public String preDispalyCopy() throws Exception {
		
		Integer displayId = IntegerUtils.valueOf(getRequest().getParameter("displayId"));
		System.out.println("displayId=======" + displayId);
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("SGC_PARENT_ID", null);
		
		
		Map<String, Object> displayMaster = commonService.select("GoodsDisplay.GOODS_DISPLAY_MODIFY_SELECT" , paramsMap);
		MapUtil.convertClob2String(displayMaster);
//		MapUtil.printOrderedMap(displayMaster);
		request.put("displayMaster", displayMaster);
		
		
		
		
		Date  reserveEndDt = (Date)displayMaster.get("RESERVE_END_DT");
		request.put("reserveEndDate", DateUtil.toStrDate(reserveEndDt));
		request.put("reserveEndTime", DateUtil.getCurHour(reserveEndDt));
		
		
		
		ImgItem mainImg = new ImgItem();
		mainImg.setTempId(1);
		mainImg.setId((Integer)displayMaster.get("GOODS_LIST_IMG"));
		mainImg.setTitle((String)displayMaster.get("GOODS_LIST_IMG_NM"));
		mainImg.setAttachment_url((String)displayMaster.get("GOODS_LIST_IMG_URL"));
		mainImg.setLinkUrl("");
		request.put("goodsListImg", JSONObject.fromObject(mainImg));
		
		String tagName = (String)displayMaster.get("TAG_NM");
		if(StringUtils.isNotEmpty(tagName)){
			request.put("tagIdSplit", Arrays.asList(tagName.split(",")));
		}
		
		List<ImgItem> slideImgs = new ArrayList<ImgItem>();
		Integer slideImgId1 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID1"));
		Integer slideImgId2 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID2"));
		Integer slideImgId3 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID3"));
		Integer slideImgId4 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID4"));
		Integer slideImgId5 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID5"));
		
		if(slideImgId1 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(1);
			slideImg.setId(slideImgId1);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM1"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL1"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId2 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(2);
			slideImg.setId(slideImgId2);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM2"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL2"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId3 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(3);
			slideImg.setId(slideImgId3);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM3"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL3"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId4 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(4);
			slideImg.setId(slideImgId4);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM4"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL4"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId5 != null){
			ImgItem slideImg = new ImgItem();
			slideImg.setTempId(5);
			slideImg.setId(slideImgId5);
			slideImg.setTitle((String)displayMaster.get("SLIDE_IMG_NM5"));
			slideImg.setAttachment_url((String)displayMaster.get("SLIDE_IMG_URL5"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		
		
		request.put("slideImgs", slideImgs);
		request.put("slideImgsJson", JSONArray.fromObject(slideImgs));
		
		List<Map<String, Object>> dispalyPriceList = commonService.selectList("GoodsDisplay.GOODS_DISPLAY_PRICE_MODIFY_SELECT" , paramsMap);
// 		ListUtil.printListMap(dispalyPriceList);
		request.put("dispalyPriceList", dispalyPriceList);
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		paramsMap.put("SGC_PARENT_ID", (Integer)displayMaster.get("SGC_ID_LV1"));
		request.put("goodClassLevel2", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		paramsMap.put("VOUCHER_TYPE", 2);
		request.put("voucherAbleCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		paramsMap.put("VOUCHER_TYPE", 3);
		request.put("discountPolicyCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		
		
		paramsMap.put("AREA_PARENT_ID", null);
		paramsMap.put("AREA_LEVL", 1);
		request.put("provinceCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		paramsMap.put("AREA_PARENT_ID", (Integer)displayMaster.get("STOCK_AREA_ID_LV1"));
		paramsMap.put("AREA_LEVL", 2);
		request.put("cityCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		paramsMap.clear();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", (Integer)displayMaster.get("GC_ID"));
		paramsMap.put("SPEC_ID", null);
		paramsMap.put("SPEC_TYPE", 1);
		paramsMap.put("USER_ID", getBackSessionUserId());
		request.put("goodsSpecBigCombo", commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		request.put("goodTransportCombo", commonService.selectList("AdminGoods.TRANSPORT_SHEET_SELECT" , paramsMap));
		
		
		Map<String,Object> spec = dispalyPriceList.get(0);
		Integer bigSpecId1 = (Integer) spec.get("SPEC_ID_1");
		Integer bigSpecId2 = (Integer) spec.get("SPEC_ID_2");
		
		paramsMap.clear();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", (Integer)displayMaster.get("GC_ID"));
		paramsMap.put("SPEC_TYPE", 2);
		paramsMap.put("USER_ID", getBackSessionUserId());
		if(bigSpecId1 != null){
			paramsMap.put("SPEC_ID", bigSpecId1);
			request.put("bigSpecId1", bigSpecId1);
			request.put("goodsSpecSmall1Combo", commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
			
			Set<Integer> set = new HashSet<Integer>();
			for (Map<String, Object> item : dispalyPriceList) {
				set.add((Integer) item.get("SPEC_VALUE_ID_1"));
			}
			request.put("smallSpecIds1", set);
		}
		if(bigSpecId2 != null){
			paramsMap.put("SPEC_ID", bigSpecId2);
			request.put("bigSpecId2", bigSpecId2);
			request.put("goodsSpecSmall2Combo", commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
			
			Set<Integer> set = new HashSet<Integer>();
			for (Map<String, Object> item : dispalyPriceList) {
				set.add((Integer) item.get("SPEC_VALUE_ID_2"));
			}
			request.put("smallSpecIds2", set);
		}
		
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		List<Map<String,Object>> pageHeaderAndItem = commonService.selectList("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
		if(!pageHeaderAndItem.isEmpty()){
			Map<String,Object> header = pageHeaderAndItem.get(0);
			PageHeader pageHeader = new PageHeader();
			
			pageHeader.setShopId((Integer)header.get("SHOP_ID"));
			pageHeader.setPageId((Integer)header.get("PAGE_ID"));
			pageHeader.setPageType((Integer)header.get("PAGE_TYPE"));
			pageHeader.setDisplayId((Integer)header.get("DISPLAY_ID"));
			
			for (Map<String, Object> item : pageHeaderAndItem) {
				
				PageItem pageItem = new PageItem();
				
				pageItem.setShopId((Integer)item.get("SHOP_ID"));
				pageItem.setPageId((Integer)item.get("PAGE_ID"));
				pageItem.setItemId((Integer)item.get("ITEM_ID"));
				pageItem.setSort((Integer)item.get("SORT"));
				pageItem.setTmplNo((String)item.get("TMPL_NO"));
				
				paramsMap.clear();
				paramsMap.put("SHOP_ID", getBackSessionShopId());
				paramsMap.put("DISPLAY_ID", displayId);
				paramsMap.put("PAGE_ID", pageItem.getPageId());
				paramsMap.put("ITEM_ID", pageItem.getItemId());
				paramsMap.put("USER_ID", getBackSessionUserId());
				
				List<Map<String,Object>> pageDtls = commonService.selectList("Template.DYNAMIC_PAGE_DTL_MODIFY_SELECT" , paramsMap);
				if (TmplType.TYPE_01.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImgItem img = new ImgItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setAttachment_url((String)dtlItem.get("VAL01"));
						img.setTitle((String)dtlItem.get("VAL02"));
						img.setLinkUrl((String)dtlItem.get("VAL03"));
						
						typeImgs.add(img);
						
						PageDtl pageDtl = new PageDtl();
						pageDtl.setVal01((String)dtlItem.get("VAL01"));
						pageDtl.setVal02((String)dtlItem.get("VAL02"));
						pageDtl.setVal03((String)dtlItem.get("VAL03"));
						pageItem.getDetails().add(pageDtl);
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_05.getNum().equals(pageItem.getTmplNo())) {
					PageDtl pageDtl = new PageDtl();
					Map<String,Object> dtlMap = pageDtls.get(0);
					
					pageDtl.setVal01((String)dtlMap.get("VAL01"));
					pageDtl.setVal02((String)dtlMap.get("VAL02"));
					pageDtl.setVal03((String)dtlMap.get("VAL03"));
					
					pageItem.getDetails().add(pageDtl);
				}else if (TmplType.TYPE_12.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImgItem img = new ImgItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setAttachment_url((String)dtlItem.get("VAL01"));
						img.setTitle((String)dtlItem.get("VAL02"));
						img.setLinkUrl((String)dtlItem.get("VAL03"));
						
						typeImgs.add(img);
						
						PageDtl pageDtl = new PageDtl();
						pageDtl.setVal01((String)dtlItem.get("VAL01"));
						pageDtl.setVal02((String)dtlItem.get("VAL02"));
						pageDtl.setVal03((String)dtlItem.get("VAL03"));
						pageItem.getDetails().add(pageDtl);
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_13.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL01"));
							img.setTitle((String)dtlItem.get("VAL02"));
							img.setLinkUrl((String)dtlItem.get("VAL03"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL01"));
							pageDtl.setVal02((String)dtlItem.get("VAL02"));
							pageDtl.setVal03((String)dtlItem.get("VAL03"));
							pageDtl.setVal04((String)dtlItem.get("VAL04"));
							pageDtl.setVal05((String)dtlItem.get("VAL09"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL05"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL05"));
							img.setTitle((String)dtlItem.get("VAL06"));
							img.setLinkUrl((String)dtlItem.get("VAL07"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL05"));
							pageDtl.setVal02((String)dtlItem.get("VAL06"));
							pageDtl.setVal03((String)dtlItem.get("VAL07"));
							pageDtl.setVal04((String)dtlItem.get("VAL08"));
							pageDtl.setVal05((String)dtlItem.get("VAL10"));
							pageItem.getDetails().add(pageDtl);
						}
						
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_18.getNum().equals(pageItem.getTmplNo())) {
					List<ImgItem> typeImgs = new ArrayList<ImgItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL01"));
							img.setTitle((String)dtlItem.get("VAL02"));
							img.setLinkUrl((String)dtlItem.get("VAL03"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL01"));
							pageDtl.setVal02((String)dtlItem.get("VAL02"));
							pageDtl.setVal03((String)dtlItem.get("VAL03"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL04"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL04"));
							img.setTitle((String)dtlItem.get("VAL05"));
							img.setLinkUrl((String)dtlItem.get("VAL06"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL04"));
							pageDtl.setVal02((String)dtlItem.get("VAL05"));
							pageDtl.setVal03((String)dtlItem.get("VAL06"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL07"))){
							ImgItem img = new ImgItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setAttachment_url((String)dtlItem.get("VAL07"));
							img.setTitle((String)dtlItem.get("VAL08"));
							img.setLinkUrl((String)dtlItem.get("VAL09"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL07"));
							pageDtl.setVal02((String)dtlItem.get("VAL08"));
							pageDtl.setVal03((String)dtlItem.get("VAL09"));
							pageItem.getDetails().add(pageDtl);
						}
						
					}
					
					pageItem.setShowJson(JSONArray.fromObject(typeImgs).toString());
				}else if (TmplType.TYPE_20.getNum().equals(pageItem.getTmplNo())) {
					PageDtl pageDtl = new PageDtl();
					Map<String,Object> dtlMap = pageDtls.get(0);
					
					pageDtl.setVal01((String)dtlMap.get("VAL01"));
					pageDtl.setVal02((String)dtlMap.get("VAL02"));
					pageDtl.setVal03((String)dtlMap.get("VAL03"));
					
					pageItem.getDetails().add(pageDtl);
				}else if (TmplType.TYPE_99.getNum().equals(pageItem.getTmplNo())) {
					PageDtl pageDtl = new PageDtl();
					Map<String,Object> dtlMap = pageDtls.get(0);
					MapUtil.convertClob2String(dtlMap);
					
					pageDtl.setVal01((String)dtlMap.get("TXT01"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
			}
			
			request.put("pageHeader", pageHeader);
			
		}
		
		return "preDispalyCopy";
	}
	
	public String getGoodsPublishList(){
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GOODS_ID",  IntegerUtils.valueOf(getRequest().getParameter("goodsId")));
		paramsMap.put("GOODS_NM", getRequest().getParameter("goodsNm"));
		paramsMap.put("GC_ID_LV1", IntegerUtils.valueOf(getRequest().getParameter("gcIdLv1")));
		paramsMap.put("GC_ID_LV2", IntegerUtils.valueOf(getRequest().getParameter("gcIdLv2")));
		paramsMap.put("PAGE_CURR", pageCurr);
		paramsMap.put("PAGE_UINT", pageUnit);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("USER_ID", null);
		
		PageData page = new PageData();
		List<Map<String,Object>> list = commonService.selectList("AdminGoods.GOODS_LIST_SELECT" , paramsMap);
		
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
			System.out.println("totalCount=" + totalCount);
		}
		
		
		renderJSON(page);
		
		
		
		return NONE;
	}
	
	
	
	public String hzm_GetCityCombo() {
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("AREA_PARENT_ID", getRequest().getParameter("province_id"));
		paramsMap.put("AREA_LEVL", 2);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		return NONE;
	}
	
	public String getGoodsLevel2() {
		System.out.println("getGoodsLevel2");
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", getRequest().getParameter("goodsLevel1"));
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		return NONE;
	}
	public String getShopSpecLevel1() {
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", getRequest().getParameter("gc_id"));
		paramsMap.put("SPEC_ID", null);
		paramsMap.put("SPEC_TYPE", 1);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		
		return NONE;
	}
	public String getShopSpecLevel2() {
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", getRequest().getParameter("gc_id"));
		paramsMap.put("SPEC_ID", getRequest().getParameter("spec_id"));
		paramsMap.put("SPEC_TYPE", 2);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		
		return NONE;
	}


	public String ueditor() {
		return "ueditor";
	}

	/**
	 * 商品上架-添加保存
	 * @return
	 */
	public String displayCreate()  {

		System.out.println("jsonStr=" + jsonStr);
		Integer shopId = getBackSessionShopId();
		Integer createdId = 1;
		
		JSONObject json = JSONObject.fromObject(jsonStr);
		
		GoodsDisplayInsert goodsDisplayInsert = new GoodsDisplayInsert();
		List<GoodsDispalyPriceInsert> priceList = new ArrayList<GoodsDispalyPriceInsert>();
		
		
		goodsDisplayInsert.setShopId(shopId);
		goodsDisplayInsert.setGoodsId(JsonUtil.getInt(json, "goodsId"));
		goodsDisplayInsert.setDisplayId(null);
		goodsDisplayInsert.setIsUsed(JsonUtil.getInt(json, "isUsed"));
		goodsDisplayInsert.setReserve(JsonUtil.getInt(json, "reserve"));
		goodsDisplayInsert.setReserveEndDt(DateUtil.convert2Date(JsonUtil.getString(json, "reserveEndDate"), JsonUtil.getInt(json, "reserveEndTime")));
		goodsDisplayInsert.setStockAreaId(JsonUtil.getInt(json, "stockAreaId"));
		goodsDisplayInsert.setTransSheetId(IntegerUtils.valueOf(JsonUtil.getString(json, "transSheetId"),0));
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(JsonUtil.getString(json, "voucherUse"),null));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(JsonUtil.getString(json, "discountId"),null));
		
		
		goodsDisplayInsert.setStartDt(DateUtil.parseDate(json.getString("startDt") + " 00:00:00"));
		goodsDisplayInsert.setEndDt(DateUtil.parseDate(json.getString("endDt") + " 23:59:59"));
		goodsDisplayInsert.setStartDesc(json.getString("startDesc"));
		goodsDisplayInsert.setEventDesc(json.getString("eventDesc"));
		
		goodsDisplayInsert.setGoodsDtlSlideImg1(JsonUtil.getInt(json, "goodsDtlSlideImg1"));
		goodsDisplayInsert.setGoodsDtlSlideImg2(JsonUtil.getInt(json, "goodsDtlSlideImg2"));
		goodsDisplayInsert.setGoodsDtlSlideImg3(JsonUtil.getInt(json, "goodsDtlSlideImg3"));
		goodsDisplayInsert.setGoodsDtlSlideImg4(JsonUtil.getInt(json, "goodsDtlSlideImg4"));
		goodsDisplayInsert.setGoodsDtlSlideImg5(JsonUtil.getInt(json, "goodsDtlSlideImg5"));
	 
		goodsDisplayInsert.setGoodsListImg(JsonUtil.getInt(json, "goodsListImg"));
		goodsDisplayInsert.setDescTitle(JsonUtil.getString(json, "descTitle"));
		goodsDisplayInsert.setDescDetail(JsonUtil.getString(json, "descDetail"));
		goodsDisplayInsert.setSgcIdSplit(JsonUtil.getString(json, "sgcIdSplit"));
		goodsDisplayInsert.setGcId(JsonUtil.getInt(json, "gcId"));
		goodsDisplayInsert.setTagIdSplit(JsonUtil.getString(json, "tagIdSplit"));
		
		GoodsDispalyPriceInsert goodsDispalyPriceInsert = null;
		JSONArray stocks = json.getJSONArray("stocks");
		for (int i = 0; i < stocks.size(); i++) {
			JSONObject obj = stocks.getJSONObject(i);
			
			goodsDispalyPriceInsert  = new GoodsDispalyPriceInsert();
			
			goodsDispalyPriceInsert.setShopId(goodsDisplayInsert.getShopId());
			goodsDispalyPriceInsert.setGoodsId(goodsDisplayInsert.getGoodsId());
			goodsDispalyPriceInsert.setDisplayId(null);
			goodsDispalyPriceInsert.setPriceOptionId(null);
			goodsDispalyPriceInsert.setGcId(goodsDisplayInsert.getGcId());
			
			String[] ids = obj.getString("id").split("\\|");
			if(ids.length == 1){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
			}else if(ids.length == 2){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
				goodsDispalyPriceInsert.setSpecId2(IntegerUtils.valueOf(ids[1].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId2(IntegerUtils.valueOf(ids[1].split("-")[1]));
			}
			
			goodsDispalyPriceInsert.setPriceOrg(obj.getDouble("price"));
			goodsDispalyPriceInsert.setPriceUnitSales(obj.getDouble("unit"));
			goodsDispalyPriceInsert.setStockIn(obj.getInt("stock"));
			
			
			priceList.add(goodsDispalyPriceInsert);
		}
	 
		JSONArray tpls =  json.getJSONArray("tpls");

		PageHeader pageHeader = new PageHeader();
		pageHeader.setShopId(shopId);
		pageHeader.setCreatedId(createdId);
		pageHeader.setPageType(3);
		pageHeader.setSkinType(1);

		for (int i = 0; i < tpls.size(); i++) {
			JSONObject obj = tpls.getJSONObject(i);
			PageItem pageItem = new PageItem();

			pageItem.setShopId(shopId);
			pageItem.setCreatedId(createdId);
			pageItem.setSort(i + 1);

			String type = obj.getString("type");
			pageItem.setTmplNo(TmplType.getNumByType(type));

			if (TmplType.TYPE_01.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);

					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(JsonUtil.getString(dtl, "attachment_url"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "title"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				
				pageDtl.setVal01(JsonUtil.getString(obj, "goods_group"));
				pageDtl.setVal02(JsonUtil.getString(obj, "size"));
				pageDtl.setVal03(JsonUtil.getString(obj, "goods_number_type"));

				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);

					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(JsonUtil.getString(dtl, "attachment_url"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "title"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				String leftWidth = obj.getString("leftWidht");

				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth);
				pageDtl.setVal05(defalutAttachmentUrl);
				pageDtl.setVal06(defalutTitle);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal08(String.valueOf(100 - Integer.parseInt(leftWidth)));
				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "attachment_url"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "title"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal05(JsonUtil.getString(dtl, "attachment_url"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "title"));
						pageDtl.setVal07(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");

				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutAttachmentUrl);
				pageDtl.setVal05(defalutTitle);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutAttachmentUrl);
				pageDtl.setVal08(defalutTitle);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "attachment_url"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "title"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(JsonUtil.getString(dtl, "attachment_url"));
						pageDtl.setVal05(JsonUtil.getString(dtl, "title"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal07(JsonUtil.getString(dtl, "attachment_url"));
						pageDtl.setVal08(JsonUtil.getString(dtl, "title"));
						pageDtl.setVal09(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(JsonUtil.getString(obj, "name"));
				pageDtl.setVal02(JsonUtil.getString(obj, "linkType"));
				pageDtl.setVal03(JsonUtil.getString(obj, "link"));
   
				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("size"));
					pageDtl.setVal02(dtl.getString("id"));
					pageDtl.setVal03(dtl.getString("pageName"));
					pageDtl.setVal04(dtl.getString("imgFileUrl"));
					pageDtl.setVal05(dtl.getString("imgFileId"));
					pageDtl.setVal06(dtl.getString("linkUrl"));
					pageDtl.setVal07(dtl.getString("pageId"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item 52=====" + items);
				
			}else if (TmplType.TYPE_99.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setTxt01(obj.getString("content"));
				System.out.println(pageDtl.getTxt01());
				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			}

		}

		try {
			
			Map<String,Object> pmap = new HashMap<String,Object>();
			pmap.put("goodsDisplayInsert", goodsDisplayInsert);
			pmap.put("priceList", priceList);
			pmap.put("pageHeader", pageHeader);
			//templateServcie.createGoodsDtlTemplate(pageHeader);
			goodsDisplayService.createGoodsDisplay(pmap);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", true);
			renderJSON(map);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", false);
			map.put("msg", e.getMessage());
			renderJSON(map);
		}
	

		 
		return NONE;
	}
	
	/**
	 * 商品上架-修改保存
	 * @return
	 * @throws Exception
	 */
	public String displayModify() throws Exception {
		
		System.out.println("jsonStr=" + jsonStr);
		Integer shopId = getBackSessionShopId();
		Integer createdId = 1;
		
		JSONObject json = JSONObject.fromObject(jsonStr);
		
		GoodsDisplayInsert goodsDisplayInsert = new GoodsDisplayInsert();
		List<GoodsDispalyPriceInsert> priceList = new ArrayList<GoodsDispalyPriceInsert>();
		
		
		goodsDisplayInsert.setShopId(shopId);
		goodsDisplayInsert.setGoodsId(JsonUtil.getInt(json, "goodsId"));
		goodsDisplayInsert.setDisplayId(JsonUtil.getInt(json, "displayId"));
		goodsDisplayInsert.setIsUsed(JsonUtil.getInt(json, "isUsed"));
		goodsDisplayInsert.setReserve(JsonUtil.getInt(json, "reserve"));
		goodsDisplayInsert.setReserveEndDt(DateUtil.convert2Date(JsonUtil.getString(json, "reserveEndDate"), JsonUtil.getInt(json, "reserveEndTime")));
		goodsDisplayInsert.setStockAreaId(JsonUtil.getInt(json, "stockAreaId"));
		goodsDisplayInsert.setTransSheetId(IntegerUtils.valueOf(JsonUtil.getString(json, "transSheetId"),0));
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(JsonUtil.getString(json, "voucherUse"),null));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(JsonUtil.getString(json, "discountId"),null));
		
		goodsDisplayInsert.setStartDt(DateUtil.parseDate(JsonUtil.getString(json, "startDt") + " 00:00:00"));
		goodsDisplayInsert.setEndDt(DateUtil.parseDate(JsonUtil.getString(json, "endDt") + " 23:59:59"));
		goodsDisplayInsert.setStartDesc(JsonUtil.getString(json, "startDesc"));
		goodsDisplayInsert.setEventDesc(JsonUtil.getString(json, "eventDesc"));
		try {
			goodsDisplayInsert.setGoodsDtlSlideImg1(JsonUtil.getInt(json, "goodsDtlSlideImg1"));
			goodsDisplayInsert.setGoodsDtlSlideImg2(JsonUtil.getInt(json, "goodsDtlSlideImg2"));
			goodsDisplayInsert.setGoodsDtlSlideImg3(JsonUtil.getInt(json, "goodsDtlSlideImg3"));
			goodsDisplayInsert.setGoodsDtlSlideImg4(JsonUtil.getInt(json, "goodsDtlSlideImg4"));
			goodsDisplayInsert.setGoodsDtlSlideImg5(JsonUtil.getInt(json, "goodsDtlSlideImg5"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		goodsDisplayInsert.setGoodsListImg(JsonUtil.getInt(json, "goodsListImg"));
		goodsDisplayInsert.setDescTitle(JsonUtil.getString(json, "descTitle"));
		goodsDisplayInsert.setDescDetail(JsonUtil.getString(json, "descDetail"));
		goodsDisplayInsert.setSgcIdSplit(JsonUtil.getString(json, "sgcIdSplit"));
		goodsDisplayInsert.setGcId(JsonUtil.getInt(json, "gcId"));
		goodsDisplayInsert.setTagIdSplit(JsonUtil.getString(json, "tagIdSplit"));
		
//				, @PAGE_ID 					INT				= NULL	-- Dynamic Page ID
		
		
		GoodsDispalyPriceInsert goodsDispalyPriceInsert = null;
		JSONArray stocks = JsonUtil.getJSONArray(json, "stocks");
		for (int i = 0; i < stocks.size(); i++) {
			JSONObject obj = stocks.getJSONObject(i);
			
			goodsDispalyPriceInsert  = new GoodsDispalyPriceInsert();
			
			goodsDispalyPriceInsert.setShopId(goodsDisplayInsert.getShopId());
			goodsDispalyPriceInsert.setGoodsId(goodsDisplayInsert.getGoodsId());
			goodsDispalyPriceInsert.setDisplayId(goodsDisplayInsert.getDisplayId());
			goodsDispalyPriceInsert.setPriceOptionId(obj.getInt("optionId"));
			goodsDispalyPriceInsert.setGcId(goodsDisplayInsert.getGcId());
			
			String[] ids = obj.getString("id").split("\\|");
			if(ids.length == 1){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
			}else if(ids.length == 2){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
				goodsDispalyPriceInsert.setSpecId2(IntegerUtils.valueOf(ids[1].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId2(IntegerUtils.valueOf(ids[1].split("-")[1]));
			}
			
			goodsDispalyPriceInsert.setPriceOrg(obj.getDouble("price"));
			goodsDispalyPriceInsert.setPriceUnitSales(obj.getDouble("unit"));
			goodsDispalyPriceInsert.setStockIn(obj.getInt("stock"));
			
			
			priceList.add(goodsDispalyPriceInsert);
		}
		
		JSONArray tpls =  json.getJSONArray("tpls");
		
		PageHeader pageHeader = new PageHeader();
		pageHeader.setShopId(shopId);
		pageHeader.setPageId(JsonUtil.getInt(json, "pageId"));
		pageHeader.setCreatedId(createdId);
		pageHeader.setPageType(3);
		pageHeader.setSkinType(1);
		pageHeader.setDisplayId(goodsDisplayInsert.getDisplayId());
		
		for (int i = 0; i < tpls.size(); i++) {
			JSONObject obj = tpls.getJSONObject(i);
			PageItem pageItem = new PageItem();
			
			pageItem.setShopId(shopId);
			pageItem.setCreatedId(createdId);
			pageItem.setSort(i + 1);
			
			String type = obj.getString("type");
			pageItem.setTmplNo(TmplType.getNumByType(type));
			
			if (TmplType.TYPE_01.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(dtl.getString("attachment_url"));
					pageDtl.setVal02(dtl.getString("title"));
					pageDtl.setVal03(dtl.getString("linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(obj.getString("goods_group"));
				pageDtl.setVal02(obj.getString("size"));
				pageDtl.setVal03(obj.getString("goods_number_type"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(dtl.getString("attachment_url"));
					pageDtl.setVal02(dtl.getString("title"));
					pageDtl.setVal03(dtl.getString("linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				String leftWidth = obj.getString("leftWidht");
				
				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth);
				pageDtl.setVal05(defalutAttachmentUrl);
				pageDtl.setVal06(defalutTitle);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				pageDtl.setVal08(String.valueOf(100 - Integer.parseInt(leftWidth)));
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(dtl.getString("attachment_url"));
						pageDtl.setVal02(dtl.getString("title"));
						pageDtl.setVal03(dtl.getString("linkUrl"));
					} else {
						pageDtl.setVal05(dtl.getString("attachment_url"));
						pageDtl.setVal06(dtl.getString("title"));
						pageDtl.setVal07(dtl.getString("linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				
				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutAttachmentUrl);
				pageDtl.setVal05(defalutTitle);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutAttachmentUrl);
				pageDtl.setVal08(defalutTitle);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(dtl.getString("attachment_url"));
						pageDtl.setVal02(dtl.getString("title"));
						pageDtl.setVal03(dtl.getString("linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(dtl.getString("attachment_url"));
						pageDtl.setVal05(dtl.getString("title"));
						pageDtl.setVal06(dtl.getString("linkUrl"));
					} else {
						pageDtl.setVal07(dtl.getString("attachment_url"));
						pageDtl.setVal08(dtl.getString("title"));
						pageDtl.setVal09(dtl.getString("linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(obj.getString("name"));
				pageDtl.setVal02(obj.getString("linkType"));
				pageDtl.setVal03(obj.getString("link"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("size"));
					pageDtl.setVal02(dtl.getString("id"));
					pageDtl.setVal03(dtl.getString("pageName"));
					pageDtl.setVal04(dtl.getString("imgFileUrl"));
					pageDtl.setVal05(dtl.getString("imgFileId"));
					pageDtl.setVal06(dtl.getString("linkUrl"));
					pageDtl.setVal07(dtl.getString("pageId"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item 52=====" + items);
				
			} else if (TmplType.TYPE_99.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setTxt01(obj.getString("content"));
				System.out.println(pageDtl.getTxt01());
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			}
			
		}
		if (!pageHeader.getItems().isEmpty()) {
			try {
				
				Map<String,Object> pmap = new HashMap<String,Object>();
				pmap.put("goodsDisplayInsert", goodsDisplayInsert);
				pmap.put("priceList", priceList);
				pmap.put("pageHeader", pageHeader);
				//templateServcie.createGoodsDtlTemplate(pageHeader);
				goodsDisplayService.modifyGoodsDisplay(pmap);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", true);
				renderJSON(map);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", false);
				map.put("msg", e.getMessage());
				renderJSON(map);
			}
		}else{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", false);
			map.put("msg", "无Template");
			renderJSON(map);
		}
		
		
		return NONE;
	}
	/**
	 * 商品复制上架-存
	 * @return
	 * @throws Exception
	 */
	public String displayCopy() throws Exception {
		
		System.out.println("jsonStr=" + jsonStr);
		Integer shopId = getBackSessionShopId();
		Integer createdId = 1;
		
		JSONObject json = JSONObject.fromObject(jsonStr);
		
		GoodsDisplayInsert goodsDisplayInsert = new GoodsDisplayInsert();
		List<GoodsDispalyPriceInsert> priceList = new ArrayList<GoodsDispalyPriceInsert>();
		
		goodsDisplayInsert.setShopId(shopId);
		goodsDisplayInsert.setGoodsId(JsonUtil.getInt(json, "goodsId"));
//		goodsDisplayInsert.setDisplayId(JsonUtil.getInt(json, "displayId"));
		goodsDisplayInsert.setIsUsed(JsonUtil.getInt(json, "isUsed"));
		goodsDisplayInsert.setReserve(JsonUtil.getInt(json, "reserve"));
		goodsDisplayInsert.setReserveEndDt(DateUtil.convert2Date(JsonUtil.getString(json, "reserveEndDate"), JsonUtil.getInt(json, "reserveEndTime")));
		goodsDisplayInsert.setStockAreaId(JsonUtil.getInt(json, "stockAreaId"));
		goodsDisplayInsert.setTransSheetId(IntegerUtils.valueOf(JsonUtil.getString(json, "transSheetId"),0));
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(JsonUtil.getString(json, "voucherUse"),null));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(JsonUtil.getString(json, "discountId"),null));
		
		goodsDisplayInsert.setStartDt(DateUtil.parseDate(JsonUtil.getString(json, "startDt") + " 00:00:00"));
		goodsDisplayInsert.setEndDt(DateUtil.parseDate(JsonUtil.getString(json, "endDt") + " 23:59:59"));
		goodsDisplayInsert.setStartDesc(JsonUtil.getString(json, "startDesc"));
		goodsDisplayInsert.setEventDesc(JsonUtil.getString(json, "eventDesc"));
		try {
			goodsDisplayInsert.setGoodsDtlSlideImg1(JsonUtil.getInt(json, "goodsDtlSlideImg1"));
			goodsDisplayInsert.setGoodsDtlSlideImg2(JsonUtil.getInt(json, "goodsDtlSlideImg2"));
			goodsDisplayInsert.setGoodsDtlSlideImg3(JsonUtil.getInt(json, "goodsDtlSlideImg3"));
			goodsDisplayInsert.setGoodsDtlSlideImg4(JsonUtil.getInt(json, "goodsDtlSlideImg4"));
			goodsDisplayInsert.setGoodsDtlSlideImg5(JsonUtil.getInt(json, "goodsDtlSlideImg5"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		goodsDisplayInsert.setGoodsListImg(JsonUtil.getInt(json, "goodsListImg"));
		goodsDisplayInsert.setDescTitle(JsonUtil.getString(json, "descTitle"));
		goodsDisplayInsert.setDescDetail(JsonUtil.getString(json, "descDetail"));
		goodsDisplayInsert.setSgcIdSplit(JsonUtil.getString(json, "sgcIdSplit"));
		goodsDisplayInsert.setGcId(JsonUtil.getInt(json, "gcId"));
		goodsDisplayInsert.setTagIdSplit(JsonUtil.getString(json, "tagIdSplit"));
		
//				, @PAGE_ID 					INT				= NULL	-- Dynamic Page ID
		
		GoodsDispalyPriceInsert goodsDispalyPriceInsert = null;
		JSONArray stocks = JsonUtil.getJSONArray(json, "stocks");
		for (int i = 0; i < stocks.size(); i++) {
			JSONObject obj = stocks.getJSONObject(i);
			
			goodsDispalyPriceInsert  = new GoodsDispalyPriceInsert();
			
			goodsDispalyPriceInsert.setShopId(goodsDisplayInsert.getShopId());
			goodsDispalyPriceInsert.setGoodsId(goodsDisplayInsert.getGoodsId());
			goodsDispalyPriceInsert.setDisplayId(goodsDisplayInsert.getDisplayId());
			goodsDispalyPriceInsert.setPriceOptionId(obj.getInt("optionId"));
			goodsDispalyPriceInsert.setGcId(goodsDisplayInsert.getGcId());
			
			String[] ids = obj.getString("id").split("\\|");
			if(ids.length == 1){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
			}else if(ids.length == 2){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
				goodsDispalyPriceInsert.setSpecId2(IntegerUtils.valueOf(ids[1].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId2(IntegerUtils.valueOf(ids[1].split("-")[1]));
			}
			
			goodsDispalyPriceInsert.setPriceOrg(obj.getDouble("price"));
			goodsDispalyPriceInsert.setPriceUnitSales(obj.getDouble("unit"));
			goodsDispalyPriceInsert.setStockIn(obj.getInt("stock"));
			
			priceList.add(goodsDispalyPriceInsert);
		}
		
		JSONArray tpls =  json.getJSONArray("tpls");
		
		PageHeader pageHeader = new PageHeader();
		
		pageHeader.setShopId(shopId);
		pageHeader.setPageId(JsonUtil.getInt(json, "pageId"));
		pageHeader.setCreatedId(createdId);
		pageHeader.setPageType(3);
		pageHeader.setSkinType(1);
		pageHeader.setDisplayId(goodsDisplayInsert.getDisplayId());
		
		for (int i = 0; i < tpls.size(); i++) {
			JSONObject obj = tpls.getJSONObject(i);
			PageItem pageItem = new PageItem();
			
			pageItem.setShopId(shopId);
			pageItem.setCreatedId(createdId);
			pageItem.setSort(i + 1);
			
			String type = obj.getString("type");
			pageItem.setTmplNo(TmplType.getNumByType(type));
			
			if (TmplType.TYPE_01.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(dtl.getString("attachment_url"));
					pageDtl.setVal02(dtl.getString("title"));
					pageDtl.setVal03(dtl.getString("linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(obj.getString("goods_group"));
				pageDtl.setVal02(obj.getString("size"));
				pageDtl.setVal03(obj.getString("goods_number_type"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(dtl.getString("attachment_url"));
					pageDtl.setVal02(dtl.getString("title"));
					pageDtl.setVal03(dtl.getString("linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				String leftWidth = obj.getString("leftWidht");
				
				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth);
				pageDtl.setVal05(defalutAttachmentUrl);
				pageDtl.setVal06(defalutTitle);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				pageDtl.setVal08(String.valueOf(100 - Integer.parseInt(leftWidth)));
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(dtl.getString("attachment_url"));
						pageDtl.setVal02(dtl.getString("title"));
						pageDtl.setVal03(dtl.getString("linkUrl"));
					} else {
						pageDtl.setVal05(dtl.getString("attachment_url"));
						pageDtl.setVal06(dtl.getString("title"));
						pageDtl.setVal07(dtl.getString("linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				
				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutAttachmentUrl);
				pageDtl.setVal05(defalutTitle);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutAttachmentUrl);
				pageDtl.setVal08(defalutTitle);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(dtl.getString("attachment_url"));
						pageDtl.setVal02(dtl.getString("title"));
						pageDtl.setVal03(dtl.getString("linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(dtl.getString("attachment_url"));
						pageDtl.setVal05(dtl.getString("title"));
						pageDtl.setVal06(dtl.getString("linkUrl"));
					} else {
						pageDtl.setVal07(dtl.getString("attachment_url"));
						pageDtl.setVal08(dtl.getString("title"));
						pageDtl.setVal09(dtl.getString("linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(obj.getString("name"));
				pageDtl.setVal02(obj.getString("linkType"));
				pageDtl.setVal03(obj.getString("link"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("size"));
					pageDtl.setVal02(dtl.getString("id"));
					pageDtl.setVal03(dtl.getString("pageName"));
					pageDtl.setVal04(dtl.getString("imgFileUrl"));
					pageDtl.setVal05(dtl.getString("imgFileId"));
					pageDtl.setVal06(dtl.getString("linkUrl"));
					pageDtl.setVal07(dtl.getString("pageId"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item 52=====" + items);
				
			}else if (TmplType.TYPE_99.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setTxt01(obj.getString("content"));
				System.out.println(pageDtl.getTxt01());
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			}
			
		}

		try {
			Map<String,Object> pmap = new HashMap<String,Object>();
			pmap.put("goodsDisplayInsert", goodsDisplayInsert);
			pmap.put("priceList", priceList);
			pmap.put("pageHeader", pageHeader);
			//templateServcie.createGoodsDtlTemplate(pageHeader);
			goodsDisplayService.createDisplayCopy(pmap);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", true);
			renderJSON(map);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", false);
			map.put("msg", e.getMessage());
			renderJSON(map);
		}
		
		return NONE;
	}

	/**
	 * 上架预览
	 * @return
	 * @throws Exception
	 */
	public String hzm_DisplayPreview() throws Exception {

		logger.debug("jsonStr=" + jsonStr);
		
		Integer shopId = getBackSessionShopId();
		Integer createdId = 1;
		
		JSONObject json = JSONObject.fromObject(jsonStr);
		
		GoodsDisplayInsert goodsDisplayInsert = new GoodsDisplayInsert();
		List<GoodsDispalyPriceInsert> priceList = new ArrayList<GoodsDispalyPriceInsert>();
		
		goodsDisplayInsert.setShopId(shopId);
		goodsDisplayInsert.setGoodsId(json.getInt("goodsId"));
		goodsDisplayInsert.setDisplayId(null);
		goodsDisplayInsert.setIsUsed(json.getInt("isUsed"));
		goodsDisplayInsert.setStockAreaId(json.getInt("stockAreaId"));
		goodsDisplayInsert.setTransSheetId(IntegerUtils.valueOf(json.getString("transSheetId"),0));
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(json.getString("voucherUse"),null));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(json.getString("discountId"),null));
		
		goodsDisplayInsert.setStartDt(DateUtil.parseDate(json.getString("startDt") + " 00:00:00"));
		goodsDisplayInsert.setEndDt(DateUtil.parseDate(json.getString("endDt") + " 23:59:59"));
		goodsDisplayInsert.setStartDesc(json.getString("startDesc"));
		goodsDisplayInsert.setEventDesc(json.getString("eventDesc"));
		try {
			goodsDisplayInsert.setGoodsDtlSlideImg1(json.getInt("goodsDtlSlideImg1"));
			goodsDisplayInsert.setGoodsDtlSlideImg2(json.getInt("goodsDtlSlideImg2"));
			goodsDisplayInsert.setGoodsDtlSlideImg3(json.getInt("goodsDtlSlideImg3"));
			goodsDisplayInsert.setGoodsDtlSlideImg4(json.getInt("goodsDtlSlideImg4"));
			goodsDisplayInsert.setGoodsDtlSlideImg5(json.getInt("goodsDtlSlideImg5"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			goodsDisplayInsert.setGoodsDtlSlideImgUrl1(json.getString("goodsDtlSlideImgUrl1"));
			goodsDisplayInsert.setGoodsDtlSlideImgUrl2(json.getString("goodsDtlSlideImgUrl2"));
			goodsDisplayInsert.setGoodsDtlSlideImgUrl3(json.getString("goodsDtlSlideImgUrl3"));
			goodsDisplayInsert.setGoodsDtlSlideImgUrl4(json.getString("goodsDtlSlideImgUrl4"));
			goodsDisplayInsert.setGoodsDtlSlideImgUrl5(json.getString("goodsDtlSlideImgUrl5"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		goodsDisplayInsert.setGoodsListImg(json.getInt("goodsListImg"));
		goodsDisplayInsert.setDescTitle(json.getString("descTitle"));
		goodsDisplayInsert.setDescDetail(json.getString("descDetail"));
		goodsDisplayInsert.setSgcIdSplit(json.getString("sgcIdSplit"));
		goodsDisplayInsert.setGcId(json.getInt("gcId"));
		goodsDisplayInsert.setTagIdSplit(json.getString("tagIdSplit"));
		
		GoodsDispalyPriceInsert goodsDispalyPriceInsert = null;
		JSONArray stocks = json.getJSONArray("stocks");
		for (int i = 0; i < stocks.size(); i++) {
			JSONObject obj = stocks.getJSONObject(i);
			
			goodsDispalyPriceInsert  = new GoodsDispalyPriceInsert();
			
			goodsDispalyPriceInsert.setShopId(goodsDisplayInsert.getShopId());
			goodsDispalyPriceInsert.setGoodsId(goodsDisplayInsert.getGoodsId());
			goodsDispalyPriceInsert.setDisplayId(null);
			goodsDispalyPriceInsert.setPriceOptionId(null);
			goodsDispalyPriceInsert.setGcId(goodsDisplayInsert.getGcId());
			
			String[] ids = obj.getString("id").split("\\|");
			if(ids.length == 1){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
			}else if(ids.length == 2){
				goodsDispalyPriceInsert.setSpecId1(IntegerUtils.valueOf(ids[0].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId1(IntegerUtils.valueOf(ids[0].split("-")[1]));
				goodsDispalyPriceInsert.setSpecId2(IntegerUtils.valueOf(ids[1].split("-")[0]));
				goodsDispalyPriceInsert.setSpecValueId2(IntegerUtils.valueOf(ids[1].split("-")[1]));
			}
			
			goodsDispalyPriceInsert.setPriceOrg(obj.getDouble("price"));
			goodsDispalyPriceInsert.setPriceUnitSales(obj.getDouble("unit"));
			goodsDispalyPriceInsert.setStockIn(obj.getInt("stock"));
			goodsDispalyPriceInsert.setSumPayQty(json.getInt("sumPayQty"));
			goodsDispalyPriceInsert.setSumFvortQty(json.getInt("sumFvortQty"));
			
			priceList.add(goodsDispalyPriceInsert);
		}
	 
		JSONArray tpls =  json.getJSONArray("tpls");

		PageHeader pageHeader = new PageHeader();
		pageHeader.setShopId(shopId);
		pageHeader.setCreatedId(createdId);
		pageHeader.setPageType(3);
		pageHeader.setSkinType(1);

		for (int i = 0; i < tpls.size(); i++) {
			JSONObject obj = tpls.getJSONObject(i);
			PageItem pageItem = new PageItem();

			pageItem.setShopId(shopId);
			pageItem.setCreatedId(createdId);
			pageItem.setSort(i + 1);

			String type = obj.getString("type");
			pageItem.setTmplNo(TmplType.getNumByType(type));

			if (TmplType.TYPE_01.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);

					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(dtl.getString("attachment_url"));
					pageDtl.setVal02(dtl.getString("title"));
					pageDtl.setVal03(dtl.getString("linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(obj.getString("goods_group"));
				pageDtl.setVal02(obj.getString("size"));
				pageDtl.setVal03(obj.getString("goods_number_type"));

				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);

					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(dtl.getString("attachment_url"));
					pageDtl.setVal02(dtl.getString("title"));
					pageDtl.setVal03(dtl.getString("linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				String leftWidth = obj.getString("leftWidht");

				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth);
				pageDtl.setVal05(defalutAttachmentUrl);
				pageDtl.setVal06(defalutTitle);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal08(String.valueOf(100 - Integer.parseInt(leftWidth)));
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(dtl.getString("attachment_url"));
						pageDtl.setVal02(dtl.getString("title"));
						pageDtl.setVal03(dtl.getString("linkUrl"));
					} else {
						pageDtl.setVal05(dtl.getString("attachment_url"));
						pageDtl.setVal06(dtl.getString("title"));
						pageDtl.setVal07(dtl.getString("linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");

				String defalutAttachmentUrl = "http://www.baidu.com";
				String defalutTitle = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutAttachmentUrl);
				pageDtl.setVal02(defalutTitle);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutAttachmentUrl);
				pageDtl.setVal05(defalutTitle);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutAttachmentUrl);
				pageDtl.setVal08(defalutTitle);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(dtl.getString("attachment_url"));
						pageDtl.setVal02(dtl.getString("title"));
						pageDtl.setVal03(dtl.getString("linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(dtl.getString("attachment_url"));
						pageDtl.setVal05(dtl.getString("title"));
						pageDtl.setVal06(dtl.getString("linkUrl"));
					} else {
						pageDtl.setVal07(dtl.getString("attachment_url"));
						pageDtl.setVal08(dtl.getString("title"));
						pageDtl.setVal09(dtl.getString("linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(obj.getString("name"));
				pageDtl.setVal02(obj.getString("linkType"));
				pageDtl.setVal03(obj.getString("link"));
   
				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("size"));
					pageDtl.setVal02(dtl.getString("id"));
					pageDtl.setVal03(dtl.getString("pageName"));
					pageDtl.setVal04(dtl.getString("imgFileUrl"));
					pageDtl.setVal05(dtl.getString("imgFileId"));
					pageDtl.setVal06(dtl.getString("linkUrl"));
					pageDtl.setVal07(dtl.getString("pageId"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item 52=====" + items);
				
			}else if (TmplType.TYPE_99.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setTxt01(obj.getString("content"));
				System.out.println(pageDtl.getTxt01());
				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			}

		}
		if (!pageHeader.getItems().isEmpty()) {
			try {
				
				Map<String,Object> pmap = new HashMap<String,Object>();
				pmap.put("goodsDisplayInsert", goodsDisplayInsert);
				pmap.put("priceList", priceList);
				pmap.put("pageHeader", pageHeader);
				Integer pageId = templateServcie.createTemplatePage(pageHeader);
				
				Map<String, Object> searchMap = new HashMap<String, Object>();
				searchMap.put("SHOP_ID", shopId);
				searchMap.put("PAGE_ID", pageId);
				searchMap.put("PAGE_TYPE", 3);
				searchMap.put("SKIN_TYPE", null);
				List<Map<String, Object>> imageList = commonService.selectList("Detail.getGoodsImageList", searchMap);
				
				ListUtil.convertClob2String(imageList );
				
				request.put("goodsDisplayInsert", goodsDisplayInsert);
				request.put("goodsDispalyPriceInsert", goodsDispalyPriceInsert);
				request.put("priceList", priceList);
				request.put("imageList", imageList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
			sessionSkin = mainService.getSessionSkinByShopId(getBackSessionShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		
		String skinType = sessionSkin.getSkinTypeShop().toString();
		String strReturn = "hzm_DisplayPreview";

		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "hzm_DisplayPreview";
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "hzm_DisplayPreview2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "hzm_DisplayPreview3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "hzm_DisplayPreview4";
		}
		else {
			strReturn = "hzm_DisplayPreview";
		}
		
		return strReturn;
		
	}
	
	
	public String hzm_AddShopGoodsClass() throws Exception{
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", null);
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		return "hzm_AddShopGoodsClass";
	}
	public String saveShopGoodsClass() throws Exception{
		 
		String goodslevel1 		=  getRequest().getParameter("goodslevel1");
		String goodslevel1text 	= getRequest().getParameter("goodslevel1text");
		String goodslevel2text 	= getRequest().getParameter("goodslevel2text");
		String goodsClassType 	= getRequest().getParameter("goodsClassType");
		
		System.out.println(getRequest().getParameter("goodslevel1"));
		System.out.println(getRequest().getParameter("goodslevel1text"));
		System.out.println(getRequest().getParameter("goodslevel2text"));
		System.out.println(getRequest().getParameter("goodsClassType"));
		///
		
		shopId = getBackSessionShopId().toString();

		try {
			 
			AdminGoods saveIn = new AdminGoods();
			saveIn.setShopId(Integer.parseInt(shopId));
			if(!StringUtils.isEmpty(goodslevel1)){
				saveIn.setShopGoodsOneId(Integer.parseInt(goodslevel1));
			}else{
				saveIn.setShopGoodsOneNm(goodslevel1text); 
			}
			saveIn.setShopGoodsTwoNm(goodslevel2text);
			saveIn.setShopGoodsType(Integer.parseInt(goodsClassType));

			saveIn = goodsService.saveGoodsClass(saveIn);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", true);
			returnMap.put("data", saveIn);

			renderJSON(returnMap);
			
		} catch (Exception e) {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", false);
			returnMap.put("errorMsg", e.getMessage());

			renderJSON(returnMap);
		}
		return NONE;
	}
	public String saveShopGoodsSpec() throws Exception{
		
		System.out.println(getRequest().getParameter("gcId"));
		System.out.println(getRequest().getParameter("goodslevel1"));
		System.out.println(getRequest().getParameter("goodslevel1text"));
		System.out.println(getRequest().getParameter("goodslevel2text"));
		
		return NONE;
	}
	public String addShopGoodsSpec() throws Exception{
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", getRequest().getParameter("gc_id"));
		paramsMap.put("SPEC_ID", null);
		paramsMap.put("SPEC_TYPE", 1);
		paramsMap.put("USER_ID", null);
		
		request.put("bigSpecCombo", commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		request.put("gcId", getRequest().getParameter("gc_id"));
		return "addShopGoodsSpec";
	}


 
	
	public String hzm_GetGoodsLevel1() throws Exception {
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("currentValue", getRequest().getParameter("goodsLevel1"));
		
		returnMap.put("list", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		renderJSON(returnMap);
		
		return NONE;
	}
	
	
	public String demo() {

		System.out.println("goodsCreate");
		return "demo";
	}

	public String bpopup() {

		System.out.println("bpopup");
		return "bpopup";
	}

	public String getJsonStr() {
		return jsonStr;
	}

	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}
	
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getGoodsClassId() {
		return goodsClassId;
	}

	public void setGoodsClassId(String goodsClassId) {
		this.goodsClassId = goodsClassId;
	}

	public String getGoodsNm() {
		return goodsNm;
	}

	public void setGoodsNm(String goodsNm) {
		this.goodsNm = goodsNm;
	}

	public String getGoodsClassTwoId() {
		return goodsClassTwoId;
	}

	public void setGoodsClassTwoId(String goodsClassTwoId) {
		this.goodsClassTwoId = goodsClassTwoId;
	}

	public String getGoodsClassThreeId() {
		return goodsClassThreeId;
	}

	public void setGoodsClassThreeId(String goodsClassThreeId) {
		this.goodsClassThreeId = goodsClassThreeId;
	}

	public String getIsReal() {
		return isReal;
	}

	public void setIsReal(String isReal) {
		this.isReal = isReal;
	}

	public String getSeoTag() {
		return seoTag;
	}

	public void setSeoTag(String seoTag) {
		this.seoTag = seoTag;
	}

	public String getSpecNm() {
		return specNm;
	}

	public void setSpecNm(String specNm) {
		this.specNm = specNm;
	}

	public String getUnitTxt() {
		return unitTxt;
	}

	public void setUnitTxt(String unitTxt) {
		this.unitTxt = unitTxt;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public File getLogo_input() {
		return logo_input;
	}

	public void setLogo_input(File logo_input) {
		this.logo_input = logo_input;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public void setServletContext(ServletContext context) {
		this.context=context;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsWeight() {
		return goodsWeight;
	}

	public void setGoodsWeight(String goodsWeight) {
		this.goodsWeight = goodsWeight;
	}

	public String getGoodsImgId() {
		return goodsImgId;
	}

	public void setGoodsImgId(String goodsImgId) {
		this.goodsImgId = goodsImgId;
	}
}
