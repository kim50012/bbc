/**   
* @Title: AdminDisplayAction.java 
* @Package com.waremec.wpt.admin.goods.action 
* @Description:  
* @author taebem
* @date 2015年7月25日 下午3:21:34 
* @version V1.0   
*/
package com.waremec.wpt.hzm.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
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
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;
import com.waremec.wpt.admin.common.service.TemplateServcie;
import com.waremec.wpt.admin.domain.AdminGoodsDisplay;
import com.waremec.wpt.admin.domain.TmplType;
import com.waremec.wpt.admin.domain.dispaly.GoodsDispalyPriceInsert;
import com.waremec.wpt.admin.domain.dispaly.GoodsDisplayInsert;
import com.waremec.wpt.admin.domain.dispaly.ImageItem;
import com.waremec.wpt.admin.domain.dispaly.ImgItem;
import com.waremec.wpt.admin.service.GoodsDisplayServcie;
import com.waremec.wpt.admin.service.GoodsSellService;
import com.waremec.wpt.admin.service.GoodsServcie;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

/** 
 * @Package com.waremec.wpt.admin.goods.action 
 * @FileName AdminDisplayAction
 * @Description  
 * @author taebem 
 * @date 2015年7月25日 下午3:21:34 
 *  
 */
@Controller("hzmDisplayAction")
@Scope(ScopeType.prototype)
public class Hzm_DisplayAction extends BaseAction{

	private Integer shopId;
	private	Integer displayId ; 	  
	//存储用户ID
	private String userId="";
	//用于存储实际每页多少条数据
	private String pageEntity="";
	//用于存储商品的Id
	private String goodsId="";
	//存储下架备注信息
	private String endDesc="";
	private String reserve="";
	private String option=""; 
	private String jobType="";
	
	private String jsonStr = "";
	
	@Resource
	private GoodsDisplayServcie goodsDisplayService;
	@Resource
	private TemplateServcie templateServcie;
	@Resource
	protected MainService mainService;
	@Resource
	private GoodsSellService goodsSellService;
	
	public String hzm_NormalList() {	
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", null);
		goodsMap.put("TEMP_ID",null);
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", null);
		goodsMap.put("BRAND_ID",null);
		goodsMap.put("CUST_SYS_ID",null);
		goodsMap.put("GOODS_NM", null);
		List<Map<String, Object>> goodsList=commonService.selectList("GoodsDisplay.getGoodsList",goodsMap);
		int pageUnitCount=0;
		for(Map<String,Object> mapGoods:goodsList){
			Date endDate=(Date) mapGoods.get("END_DT");
			pageUnitCount=(Integer) mapGoods.get("TOTAL_COUNT");
			Date date=new Date();
			if(date.before(endDate)){
				mapGoods.put("isDisplay", "1");
			}else{
				mapGoods.put("isDisplay", "0");
			}
		}
		request.put("goodsList", goodsList);
		
		int pageCount=0;
		if(pageEntity.equals("")||pageEntity==null){
			 pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
		}else{
			pageCount=pageUnitCount/Integer.parseInt(pageEntity)+(pageUnitCount%Integer.parseInt(pageEntity)==0?0:1);
		}
		if(!goodsList.isEmpty()){
			if(pageCurr==1){
				request.put("first",goodsList.get(0).get("SORT_NO"));
			}
			if(pageCurr==pageCount){
				request.put("last", goodsList.get(goodsList.size()-1).get("SORT_NO"));
			}
		}
		PageData page = new PageData();
		int totalCount = pageUnitCount;
		page = new PageData(pageCurr,pageUnit, totalCount , goodsList);
		request.put("page", page);
		request.put("pageCount", pageCount);
		request.put("pageCurr",pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUnitCount", pageUnitCount);
		request.put("pageEntity", pageEntity);
		return "hzm_NormalList";
	}
	
	
	public String hzm_NormalListFragment() {	
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);//Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", null);
		goodsMap.put("TEMP_ID",null);
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", null);
		goodsMap.put("BRAND_ID",null);
		goodsMap.put("CUST_SYS_ID",null);
		goodsMap.put("GOODS_NM", null);
		List<Map<String, Object>> goodsList=commonService.selectList("GoodsDisplay.getGoodsList",goodsMap);
		int pageUnitCount=0;
		for(Map<String,Object> mapGoods:goodsList){
			Date endDate=(Date) mapGoods.get("END_DT");
			pageUnitCount=(Integer) mapGoods.get("TOTAL_COUNT");
			Date date=new Date();
			if(date.before(endDate)){
				mapGoods.put("isDisplay", "1");
			}else{
				mapGoods.put("isDisplay", "0");
			}
		}
		request.put("goodsList", goodsList);
		
		int pageCount=0;
		if(pageEntity.equals("")||pageEntity==null){
			 pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
		}else{
			pageCount=pageUnitCount/Integer.parseInt(pageEntity)+(pageUnitCount%Integer.parseInt(pageEntity)==0?0:1);
		}
		if(!goodsList.isEmpty()){
			if(pageCurr==1){
				request.put("first",goodsList.get(0).get("SORT_NO"));
			}
			if(pageCurr==pageCount){
				request.put("last", goodsList.get(goodsList.size()-1).get("SORT_NO"));
			}
		}
		PageData page = new PageData();
		int totalCount = pageUnitCount;
		page = new PageData(pageCurr,pageUnit, totalCount , goodsList);
		request.put("page", page);
		request.put("pageCount", pageCount);
		request.put("pageCurr",pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUnitCount", pageUnitCount);
		request.put("pageEntity", pageEntity);
		
		return "hzm_NormalListFragment";
	}
	
	
	public String presaleList() {	
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID", shopId);//Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", null);
		goodsMap.put("TEMP_ID",null);
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", null);
		goodsMap.put("BRAND_ID",null);
		goodsMap.put("CUST_SYS_ID",null);
		goodsMap.put("GOODS_NM", null);
		List<Map<String, Object>> goodsList=commonService.selectList("GoodsDisplay.getBeforeGoodsList",goodsMap);
		for(Map<String,Object> mapGoods:goodsList){
			Date endDate=(Date) mapGoods.get("END_DT");
			Date date=new Date();
			if(date.before(endDate)){
				mapGoods.put("isDisplay", "1");
			}else{
				mapGoods.put("isDisplay", "0");
			}
		}
		request.put("goodsList", goodsList);
		int pageUnitCount=0;
		int pageCount=0;
		if(!goodsList.isEmpty()){
			pageUnitCount=(Integer) goodsList.get(0).get("TOTAL_COUNT");
			if(pageEntity.equals("")||pageEntity==null){
				 pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
			}else{
				pageCount=pageUnitCount/Integer.parseInt(pageEntity)+(pageUnitCount%Integer.parseInt(pageEntity)==0?0:1);
			}
			if(pageCurr==1){
				Integer maiId=(Integer) goodsList.get(0).get("IS_MAIN");
				if(maiId == 1){
					if(goodsList.size()>1){
						request.put("first",goodsList.get(1).get("SORT_NO"));
					}
				}else{
					request.put("first",goodsList.get(0).get("SORT_NO"));
				}
			}
			if(goodsList.size()>1){
				if(pageCurr==pageCount){
					Integer mainId=(Integer) goodsList.get(goodsList.size()-1).get("IS_MAIN");
					if(mainId==1){
						request.put("last", goodsList.get(goodsList.size()-2).get("SORT_NO"));
					}else{
						request.put("last", goodsList.get(goodsList.size()-1).get("SORT_NO"));
					}
					
				}
			}else{
				request.put("last", goodsList.get(goodsList.size()-1).get("SORT_NO"));
			}
			
		}
		PageData page = new PageData();
		int totalCount = pageUnitCount;
		page = new PageData(pageCurr,pageUnit, totalCount , goodsList);
		request.put("page", page);
		request.put("pageCount", pageCount);
		request.put("pageCurr",pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUnitCount", pageUnitCount);
		request.put("pageEntity", pageEntity);
		return "presaleList";
	}
	/*打开页面*/
	public String presaleListFragment() {	
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String,Object> goodsMap=new HashMap<String, Object>();
		goodsMap.put("SHOP_ID",shopId);//Integer.valueOf(shopId)
		goodsMap.put("IS_REAL", Byte.valueOf("0"));
		goodsMap.put("IS_USED", Byte.valueOf("0"));
		goodsMap.put("PRICE", null);
		goodsMap.put("TODAY", null);
		goodsMap.put("TEMP_ID",null);
		goodsMap.put("SGC_ID", null);
		goodsMap.put("PAGE_CURR", pageCurr);
		goodsMap.put("PAGE_UINT", pageUnit);
		goodsMap.put("ORDERBY", null);
		goodsMap.put("BRAND_ID",null);
		goodsMap.put("CUST_SYS_ID",null);
		goodsMap.put("GOODS_NM", null);
		List<Map<String, Object>> goodsList=commonService.selectList("GoodsDisplay.getBeforeGoodsList",goodsMap);
		for(Map<String,Object> mapGoods:goodsList){
			Date endDate=(Date) mapGoods.get("END_DT");
			Date date=new Date();
			if(date.before(endDate)){
				mapGoods.put("isDisplay", "1");
			}else{
				mapGoods.put("isDisplay", "0");
			}
		}
		request.put("goodsList", goodsList);
		int pageUnitCount=0;
		int pageCount=0;
		if(!goodsList.isEmpty()){
			pageUnitCount=(Integer) goodsList.get(0).get("TOTAL_COUNT");
			if(pageEntity.equals("")||pageEntity==null){
				 pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
			}else{
				pageCount=pageUnitCount/Integer.parseInt(pageEntity)+(pageUnitCount%Integer.parseInt(pageEntity)==0?0:1);
			}
			if(pageCurr==1){
				Integer maiId=(Integer) goodsList.get(0).get("IS_MAIN");
				if(maiId == 1){
					if(goodsList.size()>1){
						request.put("first",goodsList.get(1).get("SORT_NO"));
					}
				}else{
					request.put("first",goodsList.get(0).get("SORT_NO"));
				}
			}
			if(goodsList.size()>1){
				if(pageCurr==pageCount){
					Integer mainId=(Integer) goodsList.get(goodsList.size()-1).get("IS_MAIN");
					if(mainId==1){
						request.put("last", goodsList.get(goodsList.size()-2).get("SORT_NO"));
					}else{
						request.put("last", goodsList.get(goodsList.size()-1).get("SORT_NO"));
					}
					
				}
			}else{
				request.put("last", goodsList.get(goodsList.size()-1).get("SORT_NO"));
			}
			
		}
		PageData page = new PageData();
		int totalCount = pageUnitCount;
		page = new PageData(pageCurr,pageUnit, totalCount , goodsList);
		request.put("page", page);
		request.put("pageCount", pageCount);
		request.put("pageCurr",pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUnitCount", pageUnitCount);
		request.put("pageEntity", pageEntity);
		return "presaleListFragment";
	}
	
	
	public String hzm_UpdateDisplayGoodsPosition(){
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		String ret="success";
		try{
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("SHOP_ID", shopId);//Integer.valueOf(shopId)
			map.put("IS_REAL", Byte.valueOf("0"));
			map.put("IS_USED", Byte.valueOf("0"));
			map.put("PRICE", null);
			map.put("TODAY", null);
			map.put("TEMP_ID",null);
			map.put("SGC_ID", null);
			map.put("ORDERBY", null);
			map.put("BRAND_ID",null);
			map.put("CUST_SYS_ID",null);
			map.put("GOODS_NM", null);
			map.put("displayId", displayId);
			map.put("reserve", reserve);
			map.put("option", option);
			map.put("jobType", jobType);
			commonService.select("GoodsDisplay.updateDisplayGoodsPosition",map);
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	/*修改主页显示商品*/
	public String updateMainGoods(){
		String ret="success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("goodsId", goodsId);
		map.put("displayId", displayId);
		Map<String,Object> mapResult=commonService.select("GoodsDisplay.updateMainGoods", map);
		Integer outDisplayId=(Integer) mapResult.get("OUT_DISPLAY_ID"); 
		if(outDisplayId==0 || outDisplayId==null){
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	
	public String hzm_DisplayCreate(){
		
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
		
		
		return "hzm_DisplayCreate";
	}
	
	
	public String displayListFragment(){
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GOODS_NM", getRequest().getParameter("goodsNm"));
		paramsMap.put("PAGE_CURR", pageCurr);
		paramsMap.put("PAGE_UINT", pageUnit);
		
		List<Map<String,Object>> list = commonService.selectList("AdminGoods.GOODS_LIST_SELECT" , paramsMap);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		
		return "displayListFragment";
	}
	
	
	public String hzm_DisplayModify(){
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("SGC_PARENT_ID", null);
		
		
		Map<String, Object> displayMaster = commonService.select("GoodsDisplay.GOODS_DISPLAY_MODIFY_SELECT" , paramsMap);
		MapUtil.convertClob2String(displayMaster);
		request.put("displayMaster", displayMaster);
		
		Date  reserveEndDt = (Date)displayMaster.get("RESERVE_END_DT");
		request.put("reserveEndDate", DateUtil.toStrDate(reserveEndDt));
		request.put("reserveEndTime", DateUtil.getCurHour(reserveEndDt));
		
		
		ImageItem mainImg = new ImageItem();
		mainImg.setTempId(1);
		mainImg.setFileId((Integer)displayMaster.get("GOODS_LIST_IMG"));
		mainImg.setFileNm((String)displayMaster.get("GOODS_LIST_IMG_NM"));
		mainImg.setFileUrl((String)displayMaster.get("GOODS_LIST_IMG_URL"));
		mainImg.setLinkUrl("");
		request.put("goodsMainImg", JSONObject.fromObject(mainImg));
		
		String tagName = (String)displayMaster.get("TAG_NM");
		if(StringUtils.isNotEmpty(tagName)){
			request.put("tagIdSplit", Arrays.asList(tagName.split(",")));
		}
		
		List<ImageItem> slideImgs = new ArrayList<ImageItem>();
		Integer slideImgId1 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID1"));
		Integer slideImgId2 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID2"));
		Integer slideImgId3 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID3"));
		Integer slideImgId4 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID4"));
		Integer slideImgId5 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID5"));
		
		if(slideImgId1 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(1);
			slideImg.setFileId(slideImgId1);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM1"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL1"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId2 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(2);
			slideImg.setFileId(slideImgId2);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM2"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL2"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId3 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(3);
			slideImg.setFileId(slideImgId3);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM3"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL3"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId4 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(4);
			slideImg.setFileId(slideImgId4);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM4"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL4"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId5 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(5);
			slideImg.setFileId(slideImgId5);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM5"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL5"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		
		request.put("slideImgs", slideImgs);
		request.put("slideImgsJson", JSONArray.fromObject(slideImgs));
		
		List<Map<String, Object>> dispalyPriceList = commonService.selectList("GoodsDisplay.GOODS_DISPLAY_PRICE_MODIFY_SELECT" , paramsMap);
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
		paramsMap.put("GC_ID", displayMaster.get("GC_ID"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImageItem img = new ImageItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileUrl((String)dtlItem.get("VAL01"));
						img.setFileNm((String)dtlItem.get("VAL02"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImageItem img = new ImageItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileUrl((String)dtlItem.get("VAL01"));
						img.setFileNm((String)dtlItem.get("VAL02"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL01"));
							img.setFileNm((String)dtlItem.get("VAL02"));
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
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL05"));
							img.setFileNm((String)dtlItem.get("VAL06"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL01"));
							img.setFileNm((String)dtlItem.get("VAL02"));
							img.setLinkUrl((String)dtlItem.get("VAL03"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL01"));
							pageDtl.setVal02((String)dtlItem.get("VAL02"));
							pageDtl.setVal03((String)dtlItem.get("VAL03"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL04"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL04"));
							img.setFileNm((String)dtlItem.get("VAL05"));
							img.setLinkUrl((String)dtlItem.get("VAL06"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL04"));
							pageDtl.setVal02((String)dtlItem.get("VAL05"));
							pageDtl.setVal03((String)dtlItem.get("VAL06"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL07"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL07"));
							img.setFileNm((String)dtlItem.get("VAL08"));
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
		
		return "hzm_DisplayModify";
	}
	
	public String hzm_DisplayCopy(){
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("SGC_PARENT_ID", null);
		
		
		Map<String, Object> displayMaster = commonService.select("GoodsDisplay.GOODS_DISPLAY_MODIFY_SELECT" , paramsMap);
		MapUtil.convertClob2String(displayMaster);
		request.put("displayMaster", displayMaster);
		
		Date  reserveEndDt = (Date)displayMaster.get("RESERVE_END_DT");
		request.put("reserveEndDate", DateUtil.toStrDate(reserveEndDt));
		request.put("reserveEndTime", DateUtil.getCurHour(reserveEndDt));
		
		
		ImageItem mainImg = new ImageItem();
		mainImg.setTempId(1);
		mainImg.setFileId((Integer)displayMaster.get("GOODS_LIST_IMG"));
		mainImg.setFileNm((String)displayMaster.get("GOODS_LIST_IMG_NM"));
		mainImg.setFileUrl((String)displayMaster.get("GOODS_LIST_IMG_URL"));
		mainImg.setLinkUrl("");
		request.put("goodsMainImg", JSONObject.fromObject(mainImg));
		
		String tagName = (String)displayMaster.get("TAG_NM");
		if(StringUtils.isNotEmpty(tagName)){
			request.put("tagIdSplit", Arrays.asList(tagName.split(",")));
		}
		
		List<ImageItem> slideImgs = new ArrayList<ImageItem>();
		Integer slideImgId1 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID1"));
		Integer slideImgId2 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID2"));
		Integer slideImgId3 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID3"));
		Integer slideImgId4 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID4"));
		Integer slideImgId5 = IntegerUtils.valueOf(displayMaster.get("SLIDE_IMG_ID5"));
		
		if(slideImgId1 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(1);
			slideImg.setFileId(slideImgId1);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM1"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL1"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId2 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(2);
			slideImg.setFileId(slideImgId2);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM2"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL2"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId3 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(3);
			slideImg.setFileId(slideImgId3);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM3"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL3"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId4 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(4);
			slideImg.setFileId(slideImgId4);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM4"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL4"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		if(slideImgId5 != null){
			ImageItem slideImg = new ImageItem();
			slideImg.setTempId(5);
			slideImg.setFileId(slideImgId5);
			slideImg.setFileNm((String)displayMaster.get("SLIDE_IMG_NM5"));
			slideImg.setFileUrl((String)displayMaster.get("SLIDE_IMG_URL5"));
			slideImg.setLinkUrl("");
			slideImgs.add(slideImg);
		}
		
		request.put("slideImgs", slideImgs);
		request.put("slideImgsJson", JSONArray.fromObject(slideImgs));
		
		List<Map<String, Object>> dispalyPriceList = commonService.selectList("GoodsDisplay.GOODS_DISPLAY_PRICE_MODIFY_SELECT" , paramsMap);
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
		paramsMap.put("GC_ID", displayMaster.get("GC_ID"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImageItem img = new ImageItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileUrl((String)dtlItem.get("VAL01"));
						img.setFileNm((String)dtlItem.get("VAL02"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						ImageItem img = new ImageItem();
						img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
						img.setFileUrl((String)dtlItem.get("VAL01"));
						img.setFileNm((String)dtlItem.get("VAL02"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL01"));
							img.setFileNm((String)dtlItem.get("VAL02"));
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
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL05"));
							img.setFileNm((String)dtlItem.get("VAL06"));
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
					List<ImageItem> typeImgs = new ArrayList<ImageItem>();
					for (Map<String, Object> dtlItem : pageDtls) {
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL01"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL01"));
							img.setFileNm((String)dtlItem.get("VAL02"));
							img.setLinkUrl((String)dtlItem.get("VAL03"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL01"));
							pageDtl.setVal02((String)dtlItem.get("VAL02"));
							pageDtl.setVal03((String)dtlItem.get("VAL03"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL04"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL04"));
							img.setFileNm((String)dtlItem.get("VAL05"));
							img.setLinkUrl((String)dtlItem.get("VAL06"));
							typeImgs.add(img);
							
							PageDtl pageDtl = new PageDtl();
							pageDtl.setVal01((String)dtlItem.get("VAL04"));
							pageDtl.setVal02((String)dtlItem.get("VAL05"));
							pageDtl.setVal03((String)dtlItem.get("VAL06"));
							pageItem.getDetails().add(pageDtl);
						}
						
						if(!StringUtils.isEmpty((String)dtlItem.get("VAL07"))){
							ImageItem img = new ImageItem();
							img.setTempId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileId(Integer.valueOf(RandomUtils.generateNumberRandom(6)));
							img.setFileUrl((String)dtlItem.get("VAL07"));
							img.setFileNm((String)dtlItem.get("VAL08"));
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
		
		
		
		return "hzm_DisplayCopy";
	}
	
	public String hzm_DisplayPreview(){


		logger.debug("jsonStr=" + jsonStr);
		
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
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(JsonUtil.getString(json, "voucherUse")));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(JsonUtil.getString(json, "discountId")));

		goodsDisplayInsert.setStartDt(DateUtil.parseDate(json.getString("startDt") + " 00:00:00"));
		goodsDisplayInsert.setEndDt(DateUtil.parseDate(json.getString("endDt") + " 23:59:59"));
		goodsDisplayInsert.setStartDesc(json.getString("startDesc"));
		goodsDisplayInsert.setEventDesc(json.getString("eventDesc"));
		
		goodsDisplayInsert.setGoodsDtlSlideImg1(JsonUtil.getInt(json, "goodsDtlSlideImg1"));
		goodsDisplayInsert.setGoodsDtlSlideImg2(JsonUtil.getInt(json, "goodsDtlSlideImg2"));
		goodsDisplayInsert.setGoodsDtlSlideImg3(JsonUtil.getInt(json, "goodsDtlSlideImg3"));
		goodsDisplayInsert.setGoodsDtlSlideImg4(JsonUtil.getInt(json, "goodsDtlSlideImg4"));
		goodsDisplayInsert.setGoodsDtlSlideImg5(JsonUtil.getInt(json, "goodsDtlSlideImg5"));
		
		
		goodsDisplayInsert.setGoodsDtlSlideImgUrl1(JsonUtil.getString(json, "goodsDtlSlideImgUrl1"));
		goodsDisplayInsert.setGoodsDtlSlideImgUrl2(JsonUtil.getString(json, "goodsDtlSlideImgUrl2"));
		goodsDisplayInsert.setGoodsDtlSlideImgUrl3(JsonUtil.getString(json, "goodsDtlSlideImgUrl3"));
		goodsDisplayInsert.setGoodsDtlSlideImgUrl4(JsonUtil.getString(json, "goodsDtlSlideImgUrl4"));
		goodsDisplayInsert.setGoodsDtlSlideImgUrl5(JsonUtil.getString(json, "goodsDtlSlideImgUrl5"));
	  
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
			goodsDispalyPriceInsert.setDisplayId(goodsDisplayInsert.getDisplayId());
			goodsDispalyPriceInsert.setPriceOptionId(JsonUtil.getInt(obj, "optionId"));
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
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				
				pageDtl.setVal01(JsonUtil.getString(obj, "goodsGroup"));
				pageDtl.setVal02(JsonUtil.getString(obj, "goodsSize"));
				pageDtl.setVal03(JsonUtil.getString(obj, "goodsNumberType"));

				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);

					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				Integer leftWidth = JsonUtil.getInt(obj, "leftWidth");

				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth + "");
				pageDtl.setVal05(defalutFileUrl);
				pageDtl.setVal06(defalutFileNm);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal08(String.valueOf(100 - leftWidth));
				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal07(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");

				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutFileUrl);
				pageDtl.setVal05(defalutFileNm);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutFileUrl);
				pageDtl.setVal08(defalutFileNm);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal07(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal08(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal09(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(JsonUtil.getString(obj, "linkNm"));
				pageDtl.setVal02(JsonUtil.getString(obj, "linkType"));
				pageDtl.setVal03(JsonUtil.getString(obj, "linkUrl"));
   
				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("goodsSize"));
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
//				System.out.println(pageDtl.getTxt01());
				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			}

		
		}
		
		if (!pageHeader.getItems().isEmpty()) {
			try {
				
				Map<String,Object> pmap = new HashMap<String,Object>();
				pmap.put("goodsDisplayInsert", goodsDisplayInsert);
				//pmap.put("goodsDispalyPriceInsert", goodsDispalyPriceInsert);
				pmap.put("priceList", priceList);
				pmap.put("pageHeader", pageHeader);
				Integer pageId = templateServcie.createTemplatePage(pageHeader);
//				goodsDisplayService.createGoodsDisplay(pmap);
				
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
				// TODO Auto-generated catch block
				e.printStackTrace();
				 
			}
		} 

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		//if(sessionSkin == null){
			sessionSkin = mainService.getSessionSkinByShopId(getBackSessionShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		//}	
		
		String skinType = sessionSkin.getSkinTypeShop().toString();
		String strReturn = "displayPreview";

		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "displayPreview";
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "displayPreview2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "displayPreview3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "displayPreview4";
		}
		else {
			strReturn = "displayPreview";
		}
		
		return strReturn;
		//return "displayPreview";
	
	}
	
	public String getCityCombo() {
		 
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("AREA_PARENT_ID", getRequest().getParameter("province_id"));
		paramsMap.put("AREA_LEVL", 2);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		return NONE;
	}
	
	
	public String hzm_GetGoods2edClassCombo() {
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", getRequest().getParameter("sgcId"));
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		return NONE;
	}
	
	public String get1stLevelSpecCombo() {
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", getRequest().getParameter("gc_id"));
		paramsMap.put("SPEC_ID", null);
		paramsMap.put("SPEC_TYPE", 1);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		
		return NONE;
	}
	public String get2edLevelSpecCombo() {
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("GC_ID", getRequest().getParameter("gc_id"));
		paramsMap.put("SPEC_ID", getRequest().getParameter("spec_id"));
		paramsMap.put("SPEC_TYPE", 2);
		paramsMap.put("USER_ID", null);
		
		renderJSON(commonService.selectList("AdminGoods.SHOP_SPEC_SELECT" , paramsMap));
		
		return NONE;
	}
	
	/** 
	*商品上架-添加保存
	*/
	public String createDisplay(){
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
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(JsonUtil.getString(json, "voucherUse")));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(JsonUtil.getString(json, "discountId")));
		
		
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
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				
				pageDtl.setVal01(JsonUtil.getString(obj, "goodsGroup"));
				pageDtl.setVal02(JsonUtil.getString(obj, "goodsSize"));
				pageDtl.setVal03(JsonUtil.getString(obj, "goodsNumberType"));

				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);

					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));

					pageItem.getDetails().add(pageDtl);
				}

				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				Integer leftWidth = JsonUtil.getInt(obj, "leftWidth");

				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth + "");
				pageDtl.setVal05(defalutFileUrl);
				pageDtl.setVal06(defalutFileNm);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal08(String.valueOf(100 - leftWidth));
				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal07(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");

				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";

				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutFileUrl);
				pageDtl.setVal05(defalutFileNm);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutFileUrl);
				pageDtl.setVal08(defalutFileNm);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal07(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal08(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal09(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();

				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(JsonUtil.getString(obj, "linkNm"));
				pageDtl.setVal02(JsonUtil.getString(obj, "linkType"));
				pageDtl.setVal03(JsonUtil.getString(obj, "linkUrl"));
   
				pageItem.getDetails().add(pageDtl);

				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("goodsSize"));
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
//				System.out.println(pageDtl.getTxt01());
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
			map.put("err_msg", e.getMessage());
			renderJSON(map);
		}
		
		return NONE;
	}
	public String hzm_MidifyDisplay(){
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
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(JsonUtil.getString(json, "voucherUse")));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(JsonUtil.getString(json, "discountId")));
		
		
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
			goodsDispalyPriceInsert.setDisplayId(goodsDisplayInsert.getDisplayId());
			goodsDispalyPriceInsert.setPriceOptionId(JsonUtil.getInt(obj, "optionId"));
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
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				
				pageDtl.setVal01(JsonUtil.getString(obj, "goodsGroup"));
				pageDtl.setVal02(JsonUtil.getString(obj, "goodsSize"));
				pageDtl.setVal03(JsonUtil.getString(obj, "goodsNumberType"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				Integer leftWidth = JsonUtil.getInt(obj, "leftWidth");
				
				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth + "");
				pageDtl.setVal05(defalutFileUrl);
				pageDtl.setVal06(defalutFileNm);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal08(String.valueOf(100 - leftWidth));
				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal07(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				
				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutFileUrl);
				pageDtl.setVal05(defalutFileNm);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutFileUrl);
				pageDtl.setVal08(defalutFileNm);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal07(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal08(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal09(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(JsonUtil.getString(obj, "linkNm"));
				pageDtl.setVal02(JsonUtil.getString(obj, "linkType"));
				pageDtl.setVal03(JsonUtil.getString(obj, "linkUrl"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("goodsSize"));
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
				goodsDisplayService.modifyGoodsDisplay(pmap);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", true);
				renderJSON(map);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", false);
				map.put("err_msg", e.getMessage());
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
	public String copyDisplay(){
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
		goodsDisplayInsert.setVoucherUse(IntegerUtils.valueOf(JsonUtil.getString(json, "voucherUse")));
		goodsDisplayInsert.setDiscountId(IntegerUtils.valueOf(JsonUtil.getString(json, "discountId")));
		
		
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
			goodsDispalyPriceInsert.setDisplayId(goodsDisplayInsert.getDisplayId());
			goodsDispalyPriceInsert.setPriceOptionId(JsonUtil.getInt(obj, "optionId"));
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
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_05.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				
				pageDtl.setVal01(JsonUtil.getString(obj, "goodsGroup"));
				pageDtl.setVal02(JsonUtil.getString(obj, "goodsSize"));
				pageDtl.setVal03(JsonUtil.getString(obj, "goodsNumberType"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_12.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
					pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
					pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					
					pageItem.getDetails().add(pageDtl);
				}
				
				pageHeader.getItems().add(pageItem);
				System.out.println("item=====" + items);
			} else if (TmplType.TYPE_13.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				Integer leftWidth = JsonUtil.getInt(obj, "leftWidth");
				
				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(leftWidth + "");
				pageDtl.setVal05(defalutFileUrl);
				pageDtl.setVal06(defalutFileNm);
				pageDtl.setVal07(defalutLinkUrl);
				pageDtl.setVal08(String.valueOf(100 - leftWidth));
				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				
				for (int j = 0; j < items.size() && j < 2; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal07(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_18.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				
				String defalutFileUrl = "http://www.baidu.com";
				String defalutFileNm = " ";
				String defalutLinkUrl = "javascript:void(0)";
				
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(defalutFileUrl);
				pageDtl.setVal02(defalutFileNm);
				pageDtl.setVal03(defalutLinkUrl);
				pageDtl.setVal04(defalutFileUrl);
				pageDtl.setVal05(defalutFileNm);
				pageDtl.setVal06(defalutLinkUrl);
				pageDtl.setVal07(defalutFileUrl);
				pageDtl.setVal08(defalutFileNm);
				pageDtl.setVal09(defalutLinkUrl);
				for (int j = 0; j < items.size() && j < 3; j++) {
					JSONObject dtl = items.getJSONObject(j);
					if (j == 0) {
						pageDtl.setVal01(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal02(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal03(JsonUtil.getString(dtl, "linkUrl"));
					} else if (j == 1) {
						pageDtl.setVal04(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal05(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal06(JsonUtil.getString(dtl, "linkUrl"));
					} else {
						pageDtl.setVal07(JsonUtil.getString(dtl, "fileUrl"));
						pageDtl.setVal08(JsonUtil.getString(dtl, "fileNm"));
						pageDtl.setVal09(JsonUtil.getString(dtl, "linkUrl"));
					}
				}
				pageItem.getDetails().add(pageDtl);
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_20.getType().equals(type)) {
				PageDtl pageDtl = new PageDtl();
				
				pageDtl.setShopId(shopId);
				pageDtl.setCreatedId(createdId);
				pageDtl.setVal01(JsonUtil.getString(obj, "linkNm"));
				pageDtl.setVal02(JsonUtil.getString(obj, "linkType"));
				pageDtl.setVal03(JsonUtil.getString(obj, "linkUrl"));
				
				pageItem.getDetails().add(pageDtl);
				
				pageHeader.getItems().add(pageItem);
			} else if (TmplType.TYPE_52.getType().equals(type)) {
				JSONArray items = obj.getJSONArray("item");
				for (int j = 0; j < items.size(); j++) {
					JSONObject dtl = items.getJSONObject(j);
					
					PageDtl pageDtl = new PageDtl();
					pageDtl.setShopId(shopId);
					pageDtl.setCreatedId(createdId);
					pageDtl.setVal01(obj.getString("goodsSize"));
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
//				System.out.println(pageDtl.getTxt01());
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
				goodsDisplayService.createDisplayCopy(pmap);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", true);
				renderJSON(map);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", false);
				map.put("err_msg", e.getMessage());
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

	
	
	public Integer getDisplayId() {
		return displayId;
	}


	public void setDisplayId(Integer displayId) {
		this.displayId = displayId;
	}


	public String getJsonStr() {
		return jsonStr;
	}

	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}


	public String getOption() {
		return option;
	}


	public void setOption(String option) {
		this.option = option;
	}


	public String getJobType() {
		return jobType;
	}


	public void setJobType(String jobType) {
		this.jobType = jobType;
	}


	public String getGoodsId() {
		return goodsId;
	}


	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}


	public String getEndDesc() {
		return endDesc;
	}


	public void setEndDesc(String endDesc) {
		this.endDesc = endDesc;
	}


	public String getReserve() {
		return reserve;
	}


	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	
	
}
