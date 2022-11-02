package com.waremec.wpt.hzm.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.Hzm_StopPageType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;
import com.waremec.wpt.admin.common.service.TemplateServcie;
import com.waremec.wpt.admin.domain.TmplType;
import com.waremec.wpt.admin.domain.dispaly.ImageItem;
import com.waremec.wpt.admin.domain.dispaly.ImgItem;
import com.waremec.wpt.admin.service.AdminUserService;
import com.waremec.wpt.admin.service.GoodsDisplayServcie;
import com.waremec.wpt.admin.service.GoodsServcie;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

@Controller("hzmShopManageAction")
@Scope(ScopeType.prototype)
public class Hzm_ShopManageAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private String goodsClassId ="";
	
	private String goodsNm ="";
	private String goodsClassTwoId = "";
	private String goodsClassThreeId = "";
	private String specNm = "";
	private String unitTxt = "";
	private String isReal = "";
	private String seoTag = "";
	private String jobType="";
	
	private String imgUrl="";
	private String url="";
	private String name="";
	private String navigationId="";
	private String pageNum="";
	private String isUse="";
	
	private File logo_input;
    private String logoFileName = "";
    private String userId = "";
    private String goodsId = "";
	private String skinType;
    private String pageId = "";
	private String serachLinkType="";
	private String serachTitle="";
	private String imgUrlAll="";
	private String goodsUrlAll="";
	private String pageName="";
	private String itemId="";
	private String positionType="";
	/*=====分页start=====*/
	//用于存储选取的第几页
	//用于存储实际每页多少条数据
	private String pageEntity="";
	/*=====分页end=====*/
	//blog管理页面的信息
	private String blogGroupId="";
	private String blogId="";
	private String orderBy="";
	private String blogTitle="";
	
	private String jsonStr = "";
	private String backColor = "";
	private String wordColor = "";
	
	private String serachTitle1="";
	private String serachLinkType1="";
	
	private String pageType;
	private String title;
	private String link;
	private String option;
	//查询当前使用页
	private String pageFlag="";
	
	@Resource
	private AdminUserService adminUserService;

	@Resource
	private TemplateServcie templateServcie;
	
	@Resource
	private GoodsDisplayServcie goodsDisplayService;
	
	@Resource
	private GoodsServcie goodsService;

	@Resource
	private MainService mainService;

	/**
	 * 微杂志管理
	 * @return String
	 * @author naRan
	 */
	public String hzm_WebzineList() {
		int shopId = getBackSessionShopId();

		String serachTitle = getRequest().getParameter("goodsNm");
		serachLinkType = "5";
		if(serachTitle==null || serachTitle==""){
			serachTitle="";
		}
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		
		//查找当前使用的杂志页面
		if(list.size() > 0){
			//查询店铺正在使用的页面
			Map<String, Object> queryMap = new HashMap<String, Object>();
			queryMap.put("SHOP_ID", shopId);
			queryMap.put("SET_ID", Hzm_StopPageType.MAGAZINE);
			
			List<Map<String, Object>> magList = commonService.selectList("AdminGoods.SHOP_SETTING_SELECT",queryMap);
			
			if(magList != null){
				String pageId = magList.get(0).get("VAL_INT").toString();
				for (int i = 0; i < list.size(); i++) {
					System.out.println(list.get(i).get("PAGE_ID"));
					if(pageId.equals(list.get(i).get("PAGE_ID").toString())){
						list.get(i).put("isUse", "1");
					}else{
						list.get(i).put("isUse", "0");
						
					}
				}
			}
		}
		
		request.put("WebzineList", list);
		request.put("goodsNm", serachTitle);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		return "hzm_WebzineList";
	}
	
	
	/**
	 * 检查使用页情况
	 * @param shopId
	 * @param setId
	 * @param pageFlag
	 * @return
	 */
	public String queryHzmPageFlag(){
		int shopId = getBackSessionShopId();
		String req = null;
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		if(pageFlag.equals("M")){
			parmsMap.put("SET_ID", Hzm_StopPageType.MAGAZINE);
		}else if(pageFlag.equals("H")){
			parmsMap.put("SET_ID", Hzm_StopPageType.HZM_HOME);
		}
		
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.SHOP_SETTING_SELECT",parmsMap);
		
		if(!list.isEmpty()){
			req = pageFlag;
//			pageId = String.valueOf(list.get(0).get("VAL_INT"));
//			req = Hzm_StopPageType.MAGAZINE;
			request.put("pageId", String.valueOf(list.get(0).get("VAL_INT")));
			request.put("pageFlag", "redirect");
		}
		return req;
	}
//	public String queryHzmWebzine(){
//		int shopId = getBackSessionShopId();
//		String req = null;
//		Map<String, Object> parmsMap = new HashMap<String, Object>();
//		parmsMap.put("SHOP_ID", shopId);
//		parmsMap.put("SET_ID", Hzm_StopPageType.MAGAZINE);
//		
//		List<Map<String, Object>> list = commonService.selectList("AdminGoods.SHOP_SETTING_SELECT",parmsMap);
//		
//		if(!list.isEmpty()){
//			req = "hzm_WebzineById";
//			request.put("pageId", String.valueOf(list.get(0).get("VAL_INT")));
//		}
//		return req;
//	}
	
	
	public String hzm_WebzineListFragment() {
		String serachTitle = getRequest().getParameter("goodsNm");
		serachLinkType = "5";
		if(serachTitle==null || serachTitle==""){
			serachTitle="";
		}
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		request.put("list", list);
		request.put("goodsNm", serachTitle);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		return "hzm_WebzineListFragment";
	}
	//自定义页面模块
	public String userDefinePageList() {

		String serachLinkType = "4";
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		request.put("list", list);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);

		return "userDefinePageList";
	}
	
	//自定义页面模块分页
	public String userDefinePageFragment() {

		String serachLinkType = "4";
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		request.put("list", list);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);

		return "userDefinePageFragment";
	}
	
	//店铺主页分页
	public String hzm_ShopMainPageFragment() {
		String serachLinkType = "6";
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		
		List<Map<String, Object>> pageList = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		request.put("pageList", pageList);

		PageData page = new PageData();
		if (!pageList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(pageList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , pageList);
		}
		
		request.put("page", page);
		
		return "hzm_ShopMainPageFragment";
	}
	public String hzm_AddWebzineList(){
		return "hzm_AddWebzineList";
	}
	public String publicControlSet(){
		String serachTitle = getRequest().getParameter("goodsNm");
		serachLinkType = "7";
		if(serachTitle==null || serachTitle==""){
			serachTitle="";
		}
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		request.put("list", list);
		request.put("goodsNm", serachTitle);
		PageData page = new PageData();
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			request.put("pageCurr", pageCurr);
			request.put("pageUnit", pageUnit);
			request.put("totalCount",totalCount);
			int pageCount=totalCount/pageUnit+(totalCount%pageUnit==0?0:1);
			request.put("pageCount", pageCount);
			if(pageCurr==1){
				request.put("first",list.get(0).get("SORT_NO"));
			}
			if(pageCurr==pageCount){
				request.put("last", list.get(list.size()-1).get("SORT_NO"));
			}
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		request.put("page", page);
		return "publicControlSet";
	}
	public String publicControlSetListFragment(){
		String serachTitle = getRequest().getParameter("goodsNm");
		serachLinkType = "7";
		if(serachTitle==null || serachTitle==""){
			serachTitle="";
		}
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		request.put("list", list);
		request.put("goodsNm", serachTitle);
		PageData page = new PageData();
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			request.put("pageCurr", pageCurr);
			request.put("pageUnit", pageUnit);
			request.put("totalCount",totalCount);
			int pageCount=totalCount/pageUnit+(totalCount%pageUnit==0?0:1);
			request.put("pageCount", pageCount);
			if(pageCurr==1){
				request.put("first",list.get(0).get("SORT_NO"));
			}
			if(pageCurr==pageCount){
				request.put("last", list.get(list.size()-1).get("SORT_NO"));
			}
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		request.put("page", page);
		return "publicControlSetListFragment";
	}
	public String updatePublicControlSet(){
		userId=getBackSessionUserId();
		String ret="success";
		try{
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("shopId",getBackSessionShopId());//Integer.valueOf(shopId)
			map.put("pageId", pageId);
			map.put("option", option);
			map.put("jobType", jobType);
			map.put("pageName", null);
			map.put("linkType", null);
			map.put("userId", userId);
			commonService.select("AdminGoods.updatePublicControlSet",map);
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	//blog管理的删除操作
	public String hzm_deleteShopBlog(){
		String ret="success";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",getBackSessionShopId());
		map.put("blogId", StringUtil.emptyToNull(blogId));
		map.put("jobType", "D");
		map.put("userId",  getBackSessionUserId());
		map.put("isDelete", 1);
		Map<String,Object> mapResult=commonService.select("MyFile.deleteShopBlog", map);
		Integer blogId=(Integer) mapResult.get("OUT_BLOG_ID");
		if(blogId==null || blogId==0){
			ret="false";
		}
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("result",ret);
		renderJSON(result);
		return NONE;
	}
	//日志管理
	public String hzm_BlogControl(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",getBackSessionShopId());
		map.put("blogGroupId", StringUtil.emptyToNull(blogGroupId));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("orderBy",StringUtil.emptyToNull(orderBy));
		map.put("blogId", StringUtil.emptyToNull(blogId));
		map.put("blogTitle", StringUtil.emptyToNull(blogTitle));
		List<Map<String,Object>> list=commonService.selectList("MyFile.selectBlogList", map);
		//selectBlogList
		request.put("list", list);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);

		request.put("blogTitle", blogTitle);
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("shopId", getBackSessionShopId());
		request.put("groupList", commonService.selectList("Blog.selectShopBlogList", paramsMap));
		request.put("blogGroupId", blogGroupId);
		return "hzm_BlogControl";
	}
	//日志管理分页
	public String hzm_BlogControlFragment(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",getBackSessionShopId());
		map.put("blogGroupId", StringUtil.emptyToNull(blogGroupId));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("orderBy",StringUtil.emptyToNull(orderBy));
		map.put("blogId", StringUtil.emptyToNull(blogId));
		map.put("blogTitle", StringUtil.emptyToNull(blogTitle));
		List<Map<String,Object>> list=commonService.selectList("MyFile.selectBlogList", map);
		//selectBlogList
		request.put("list", list);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);

		return "hzm_BlogControlFragment";
	}
	//公共信息设置的修改
	public String publicControlUpdate(){
		Integer displayId=null;
		Integer pageId = IntegerUtils.valueOf(getRequest().getParameter("pageId"));
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID", pageId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		Map<String,Object> pageHeaderAndItem = commonService.select("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
		paramsMap.clear();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID",pageId);
		paramsMap.put("ITEM_ID", pageHeaderAndItem.get("ITEM_ID"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		List<Map<String,Object>> pageDtls = commonService.selectList("Template.DYNAMIC_PAGE_DTL_MODIFY_SELECT" , paramsMap);
		request.put("pageDtls", pageDtls);
		request.put("pageHeaderAndItem", pageHeaderAndItem);
		return "publicControlUpdate";
	}
	public String addPublicControlSet(){
		return "addPublicControlSet";
	}
	//获取该商铺所有的图片
	public String getShopImgList(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",  getBackSessionShopId().toString());
		map.put("fileName", null);
		map.put("beginDate",null);
		map.put("endDate",null);
		map.put("fileType",1);
		map.put("pageCurr", pageCurr);
		map.put("pageUint", pageUnit);
		map.put("fileId", null);
		map.put("fileGroup", 1);
		List<Map<String,Object>> list=commonService.selectList("MyFile.selectShopFileList", map);
		Map<String,Object> mapCount=commonService.select("MyFile.selectShopFileCount",map);
		int pageUnitCount=(Integer) mapCount.get("COUNT_NUM");
		int pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
		Map<String,Object> mapResult=new HashMap<String,Object>();
		mapResult.put("pageCount", pageCount);
		mapResult.put("pageCurr",pageCurr);
		mapResult.put("pageUnit", pageUnit);
		mapResult.put("pageUnitCount", pageUnitCount);
		mapResult.put("list", list);
		renderJSON(mapResult);
		return NONE;
	}
	//获取店铺的地址链接
	public String getShopGoodsUrlList(){
		pageUnit=10;
		try {
			serachTitle=new String(serachTitle.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId().toString());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", StringUtil.emptyToNull(serachTitle));
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		Map<String,Object> mapResult=new HashMap<String,Object>();
		if(!list.isEmpty()){
			int pageUnitCount = (Integer)list.get(0).get("TOTAL_CNT");
			int pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
			mapResult.put("pageCount", pageCount);
			mapResult.put("pageCurr",pageCurr);
			mapResult.put("pageUnit", pageUnit);
			mapResult.put("pageUnitCount", pageUnitCount);
		}
		mapResult.put("list", list);
		mapResult.put("serachTitle",serachTitle);
		mapResult.put("serachLinkType", serachLinkType);
		renderJSON(mapResult);
		return NONE;
	}
	//存储公共管理设置
	public String savePublicControlSet(){
		String ret="success";
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId().toString());
		parmsMap.put("USER_ID", getBackSessionUserId().toString());
		String [] imgUrl=imgUrlAll.split(",");
		String [] goodsUrl=goodsUrlAll.split(",");
		for(int i=0;i<imgUrl.length;i++){
			parmsMap.put("IMG_SRC"+(i+1),imgUrl[i]);
			parmsMap.put("LINK_URL"+(i+1), goodsUrl[i]);
		}
		for(int j=imgUrl.length+1;j<=6;j++){
			parmsMap.put("IMG_SRC"+j,null);
			parmsMap.put("LINK_URL"+j,null);
		}
		parmsMap.put("PAGE_NAME", pageName);
		parmsMap.put("positionType",positionType);
		Map<String,Object> map=commonService.select("MyFile.savePublicControlSet", parmsMap);
		Integer pageId=(Integer) map.get("PAGE_ID");
		if(pageId==0 || pageId==null){
			ret="fail";
		}
		Map<String,Object> mapResult=new HashMap<String,Object>();
		mapResult.put("result",ret);
		renderJSON(mapResult);
		return NONE;
	}
	//存储微杂志
	public String saveWebzine(){
		String ret="success";
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId().toString());
		parmsMap.put("USER_ID", getBackSessionUserId().toString());
		String [] imgUrl=imgUrlAll.split(",");
		String [] goodsUrl=goodsUrlAll.split(",");
		for(int i=0;i<imgUrl.length;i++){
			parmsMap.put("IMG_SRC"+(i+1),imgUrl[i]);
			parmsMap.put("LINK_URL"+(i+1), goodsUrl[i]);
		}
		for(int j=imgUrl.length+1;j<=6;j++){
			parmsMap.put("IMG_SRC"+j,null);
			parmsMap.put("LINK_URL"+j,null);
		}
		parmsMap.put("PAGE_NAME", pageName);
		Map<String,Object> map=commonService.select("MyFile.saveWebzine", parmsMap);
		Integer pageId=(Integer) map.get("PAGE_ID");
		if(pageId==0 || pageId==null){
			ret="fail";
		}
		Map<String,Object> mapResult=new HashMap<String,Object>();
		mapResult.put("result",ret);
		renderJSON(mapResult);
		return NONE;
	}
	/**
	 * 保存微杂志的同时更新该店铺的微杂志首页
	 * @return
	 */
	public String hzm_UpdateSaveWebzine(){
		String shopId = getBackSessionShopId().toString();
		String ret="";
//		String MSG = "S";
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("USER_ID", getBackSessionUserId().toString());
		parmsMap.put("IMG_SRC",imgUrlAll);
		parmsMap.put("LINK_URL", goodsUrlAll);
		parmsMap.put("pageId", pageId);
		parmsMap.put("itemId", itemId);
		parmsMap.put("PAGE_NAME", pageName);
		parmsMap.put("positionType",StringUtil.emptyToNull(positionType));
		Map<String,Object> map=commonService.select("MyFile.saveUpdateWebzine", parmsMap);
		Integer pageId=(Integer) map.get("OUT_PAGE_ID");
		if(pageId==0 || pageId==null){
			ret="fail";
		}else{
			//更新店铺使用页
			Map<String, Object> queryMap = new HashMap<String, Object>();
			queryMap.put("SHOP_ID", shopId);
			queryMap.put("SET_ID", Hzm_StopPageType.MAGAZINE);
			queryMap.put("VAL_INT", pageId);
			List<Map<String, Object>> magList = commonService.selectList("AdminGoods.SHOP_SETTING_INSERT",queryMap);
			if(magList != null){
				if("S".equals(magList.get(0).get("OUT_ERR_MSG").toString())){
					ret = "success";
				}else{
					ret = magList.toString();
				}
			}
		}
		Map<String,Object> mapResult=new HashMap<String,Object>();
		mapResult.put("result",ret);
		renderJSON(mapResult);
		return NONE;
	}
	//打开修改微杂志、页面名字
	public String hzm_UpdateWebzineList(){
		Integer displayId=null;
		Integer pageId = IntegerUtils.valueOf(getRequest().getParameter("pageId"));
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID", pageId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		Map<String,Object> pageHeaderAndItem = commonService.select("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
		paramsMap.clear();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID",pageId);
		paramsMap.put("ITEM_ID", pageHeaderAndItem.get("ITEM_ID"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		List<Map<String,Object>> pageDtls = commonService.selectList("Template.DYNAMIC_PAGE_DTL_MODIFY_SELECT" , paramsMap);
		request.put("pageDtls", pageDtls);
		request.put("pageHeaderAndItem", pageHeaderAndItem);
		return "hzm_UpdateWebzineList";
	}
	
	
	public String hzm_UpdateWebzineListById(){
		Integer displayId=null;
		String pageId = String.valueOf(request.get("pageId"));
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID", pageId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		Map<String,Object> pageHeaderAndItem = commonService.select("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
		paramsMap.clear();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID",pageId);
		paramsMap.put("ITEM_ID", pageHeaderAndItem.get("ITEM_ID"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		List<Map<String,Object>> pageDtls = commonService.selectList("Template.DYNAMIC_PAGE_DTL_MODIFY_SELECT" , paramsMap);
		request.put("pageDtls", pageDtls);
		request.put("pageHeaderAndItem", pageHeaderAndItem);
		return "hzm_UpdateWebzineListById";
	}
	public String userDefinePageView() {

		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", getBackSessionShopId().toString());
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassGrade1List",searchMap);
		request.put("classList", classList);
		//品牌
		List<Map<String, Object>> brandList = commonService.selectList("Main.getBrandList",searchMap);
		request.put("brandList", brandList);

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		//if(sessionSkin == null){
			sessionSkin = mainService.getSessionSkinByShopId(getBackSessionShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		//}

		skinType = sessionSkin.getSkinTypeShop().toString();

		searchMap.clear();
		searchMap.put("SHOP_ID", getBackSessionShopId().toString());
		searchMap.put("PAGE_ID", pageId);
		searchMap.put("PAGE_TYPE", "4");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> userDefinePageData = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("userDefinePageData", userDefinePageData);
		
//		ListUtil.printListMap(classList);
//		ListUtil.printListMap(brandList);
//		ListUtil.printListMap(userDefinePageData);
		
		String strReturn = "userDefinePageView";

		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "userDefinePageView";
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "userDefinePageView2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "userDefinePageView3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "userDefinePageView4";
		}
		else {
			strReturn = "userDefinePageView5";
		}
		
		return strReturn;
	}
	
	public String getGoodsList(){
		
		
		System.out.println();
		
		String serachTitle = getRequest().getParameter("goodsNm");
		if(serachLinkType=="" || serachLinkType==null){
			serachLinkType = "5";
		}
		
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

	public String getUserDefinePageList(){
		
		
		System.out.println();
		
		String serachTitle = getRequest().getParameter("goodsNm");
		String serachLinkType = "4";
		
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

	public String getShopMainPageList(){
		
		
		System.out.println();
		
		String serachTitle = getRequest().getParameter("goodsNm");
		String serachLinkType = "6";
		
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

	public String shopMainPageView() {

		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", getBackSessionShopId().toString());
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassGrade1List",searchMap);
		request.put("classList", classList);
		//品牌
		List<Map<String, Object>> brandList = commonService.selectList("Main.getBrandList",searchMap);
		request.put("brandList", brandList);

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		//if(sessionSkin == null){
			sessionSkin = mainService.getSessionSkinByShopId(getBackSessionShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		//}

		skinType = sessionSkin.getSkinTypeShop().toString();

		searchMap.clear();
		searchMap.put("SHOP_ID", getBackSessionShopId().toString());
		searchMap.put("PAGE_ID", pageId);
		searchMap.put("PAGE_TYPE", "1");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> shopMainPageData = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("shopMainPageData", shopMainPageData);
		
//		ListUtil.printListMap(classList);
//		ListUtil.printListMap(brandList);
//		ListUtil.printListMap(shopMainPageData);
		
		String strReturn = "shopMainPageView";

		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "shopMainPageView";
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "shopMainPageView2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "shopMainPageView3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "shopMainPageView4";
		}
		else {
			strReturn = "shopMainPageView5";
		}
		
		return strReturn;
	}

	public String hzm_AddCustomPageEditor() {
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", null);
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		request.put("goodTransportCombo", commonService.selectList("AdminGoods.TRANSPORT_SHEET_SELECT" , paramsMap));
		
		paramsMap.put("VOUCHER_TYPE", 2);
		request.put("voucherAbleCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		paramsMap.put("VOUCHER_TYPE", 3);
		request.put("discountPolicyCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		
		
		paramsMap.put("AREA_PARENT_ID", null);
		paramsMap.put("AREA_LEVL", 1);
		request.put("provinceCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		return "hzm_AddCustomPageEditor";
	}

public String hzm_ModifyCustomPageEditor() {
		Integer pageId = null;
		if(pageFlag.equals("H")){
			pageId = IntegerUtils.valueOf(request.get("pageId"));
		}else{
			pageId = IntegerUtils.valueOf(getRequest().getParameter("pageId"));
			
		}
		Integer displayId = null;
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID", pageId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		List<Map<String,Object>> pageHeaderAndItem = commonService.selectList("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
		if(!pageHeaderAndItem.isEmpty()){
			Map<String,Object> header = pageHeaderAndItem.get(0);
			PageHeader pageHeader = new PageHeader();
			
			pageHeader.setShopId((Integer)header.get("SHOP_ID"));
			pageHeader.setPageId((Integer)header.get("PAGE_ID"));
			pageHeader.setPageType((Integer)header.get("PAGE_TYPE"));
			pageHeader.setDisplayId((Integer)header.get("DISPLAY_ID"));
			pageHeader.setPageNm((String) header.get("PAGE_NM"));
			 
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
		
		return "hzm_ModifyCustomPageEditor";
	}

	public String addUserDefinePageEditor() {
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", null);
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		request.put("goodTransportCombo", commonService.selectList("AdminGoods.TRANSPORT_SHEET_SELECT" , paramsMap));
		
		paramsMap.put("VOUCHER_TYPE", 2);
		request.put("voucherAbleCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		paramsMap.put("VOUCHER_TYPE", 3);
		request.put("discountPolicyCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		
		
		paramsMap.put("AREA_PARENT_ID", null);
		paramsMap.put("AREA_LEVL", 1);
		request.put("provinceCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		return "addUserDefinePageEditor";
	}
	
	public String linkList() throws IOException{
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", null);
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		request.put("goodTransportCombo", commonService.selectList("AdminGoods.TRANSPORT_SHEET_SELECT" , paramsMap));
		
		paramsMap.put("VOUCHER_TYPE", 2);
		request.put("voucherAbleCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		paramsMap.put("VOUCHER_TYPE", 3);
		request.put("discountPolicyCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		
		
		paramsMap.put("AREA_PARENT_ID", null);
		paramsMap.put("AREA_LEVL", 1);
		request.put("provinceCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		String serachTitle = serachTitle1;
		String serachLinkType = serachLinkType1;
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		
		if(serachTitle==null||serachTitle.equals("")){
			parmsMap.put("PAGE_NM", null);
		}else{
			parmsMap.put("PAGE_NM", serachTitle);
		}
		
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		
		parmsMap.put("ORDERBY", null);
	
		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_LIST_SELECT",parmsMap);
		
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		request.put("list",list);
		request.put("page", page);
		
		Map<String,Object> map=new HashMap<String,Object> ();
		map.put("SEARCH_TYPE", "PAGE_TYPE_NM");
		List<Map<String,Object>> pageTypeList=commonService.selectList("Template.getShopColorList",map);
		request.put("pageTypeList", pageTypeList);
		return "linkList";
	}
	
	public String linkListFragment() throws IOException{
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("SGC_PARENT_ID", null);
		paramsMap.put("USER_ID", null);
		
		request.put("goodClassLevel1", commonService.selectList("AdminGoods.selectGoodsClassCombo" , paramsMap));
		
		request.put("goodTransportCombo", commonService.selectList("AdminGoods.TRANSPORT_SHEET_SELECT" , paramsMap));
		
		paramsMap.put("VOUCHER_TYPE", 2);
		request.put("voucherAbleCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		paramsMap.put("VOUCHER_TYPE", 3);
		request.put("discountPolicyCombo", commonService.selectList("AdminGoods.VOUCHER_MST_SELECT" , paramsMap));
		
		
		paramsMap.put("AREA_PARENT_ID", null);
		paramsMap.put("AREA_LEVL", 1);
		request.put("provinceCombo", commonService.selectList("AdminGoods.MAP_SELECT" , paramsMap));
		
		String serachTitle = serachTitle1;
		String serachLinkType = serachLinkType1;
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		
		if(serachTitle==null||serachTitle.equals("")){
			parmsMap.put("PAGE_NM", null);
		}else{
			parmsMap.put("PAGE_NM", serachTitle);
		}
		
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		
		parmsMap.put("ORDERBY", null);
	
		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_LIST_SELECT",parmsMap);
		
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		request.put("list",list);
		request.put("page", page);
		
		Map<String,Object> map=new HashMap<String,Object> ();
		map.put("SEARCH_TYPE", "PAGE_TYPE_NM");
		List<Map<String,Object>> pageTypeList=commonService.selectList("Template.getShopColorList",map);
		request.put("pageTypeList", pageTypeList);
		return "linkListFragment";
	}
	


	//添加
	public String linkSave(){
		Integer shopId=getBackSessionShopId();
		Map<String,Object> map=new HashMap<String,Object> ();
		map.put("PAGE_NM", title);
		map.put("PAGE_TYPE", pageType);
		map.put("URL", link);
		map.put("SHOP_ID", shopId);
		map=commonService.select("AdminGoods.linkSave",map);
		map.put("result", map.get("OUT_ERR_MSG").toString());
		renderJSON(map);
		return NONE;
	}
	
	
	public String modifyUserDefinePageEditor() {
		
		Integer pageId = IntegerUtils.valueOf(getRequest().getParameter("pageId"));
		Integer displayId = null;
		System.out.println("pageId=======" + pageId);
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("DISPLAY_ID", displayId);
		paramsMap.put("PAGE_ID", pageId);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		List<Map<String,Object>> pageHeaderAndItem = commonService.selectList("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
		if(!pageHeaderAndItem.isEmpty()){
			Map<String,Object> header = pageHeaderAndItem.get(0);
			PageHeader pageHeader = new PageHeader();
			
			pageHeader.setShopId((Integer)header.get("SHOP_ID"));
			pageHeader.setPageId((Integer)header.get("PAGE_ID"));
			pageHeader.setPageType((Integer)header.get("PAGE_TYPE"));
			pageHeader.setDisplayId((Integer)header.get("DISPLAY_ID"));
			pageHeader.setPageNm((String)header.get("PAGE_NM"));
			
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
		
		return "modifyUserDefinePageEditor";
	}

	public String hzm_DeleteDynamicPage(){
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("shopId", getBackSessionShopId());
		parmsMap.put("pageId", pageId);
		parmsMap.put("pageType", null);
		parmsMap.put("skinType", null);
		parmsMap.put("createdId", getBackSessionUserId());
		parmsMap.put("displayId", null);
		
		List<Map<String, Object>> pageList = commonService.selectList("Template.deletePageHeader",parmsMap);
		
		renderJSON(pageList);
		
		return NONE;
		
	}
	
	public String hzm_UpdateShopMainPageUse() {
		//更新“SHOP_SETTING_INSERT”
		Map<String, Object> setMap = new HashMap<String, Object>();
		setMap.put("SHOP_ID", getBackSessionShopId());
		setMap.put("SET_ID", Hzm_StopPageType.HZM_HOME);
		setMap.put("VAL_INT", pageId);
		commonService.selectList("AdminGoods.SHOP_SETTING_INSERT",setMap);
		
		setMap.clear();
		setMap.put("shopId", getBackSessionShopId());
		setMap.put("pageId", pageId);
		setMap.put("createdId", getBackSessionUserId());
		setMap.put("jobType",jobType);
		List<Map<String, Object>> pageList = commonService.selectList("Template.updatePageShop",setMap);
		renderJSON(pageList);
		return NONE;
	}
	
	public String hzm_ShopNavigation() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", getBackSessionShopId());
		
		List<Map<String, Object>> list = commonService.selectList("Template.SHOP_NAVIGATION_SELECT",map);
		map.put("SEARCH_TYPE", "NAVIGATION_ID");
		List<Map<String, Object>> colorlist = commonService.selectList("Template.getShopColorList",map);
		
		request.put("list", list);
		request.put("colorlist", colorlist);
		
		return "hzm_ShopNavigation";
	}
	
	public String hzm_SaveShopNavigation() {
		String ret = "success";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", getBackSessionShopId());
		map.put("IMG_URL", imgUrl);
		map.put("URL", url);
		map.put("NAME", name);
		map.put("PAGE_NUM", pageNum);
		map.put("JOB_TYPE", "I");
		map.put("BACK_COLOR", backColor);
		map.put("WORD_COLOR", wordColor);
		commonService.insert("Template.SHOP_NAVIGATION_INSERT",map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("result", ret);

		renderJSON(returnMap);

		return NONE;
	}
	public String getJsonStr() {
		return jsonStr;
	}

	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
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

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getSkinType() {
		return skinType;
	}

	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}
	
	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public String getSerachLinkType() {
		return serachLinkType;
	}

	public void setSerachLinkType(String serachLinkType) {
		this.serachLinkType = serachLinkType;
	}

	public String getSerachTitle() {
		return serachTitle;
	}

	public void setSerachTitle(String serachTitle) {
		this.serachTitle = serachTitle;
	}

	public String getImgUrlAll() {
		return imgUrlAll;
	}

	public void setImgUrlAll(String imgUrlAll) {
		this.imgUrlAll = imgUrlAll;
	}

	public String getGoodsUrlAll() {
		return goodsUrlAll;
	}

	public void setGoodsUrlAll(String goodsUrlAll) {
		this.goodsUrlAll = goodsUrlAll;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getPositionType() {
		return positionType;
	}

	public void setPositionType(String positionType) {
		this.positionType = positionType;
	}

	public String getBlogGroupId() {
		return blogGroupId;
	}

	public void setBlogGroupId(String blogGroupId) {
		this.blogGroupId = blogGroupId;
	}

	public String getBlogId() {
		return blogId;
	}

	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNavigationId() {
		return navigationId;
	}

	public void setNavigationId(String navigationId) {
		this.navigationId = navigationId;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	} 

	public String getBackColor() {
		return backColor;
	}

	public void setBackColor(String backColor) {
		this.backColor = backColor;
	}

	public String getWordColor() {
		return wordColor;
	}

	public void setWordColor(String wordColor) {
		this.wordColor = wordColor;
	}

	public String getSerachTitle1() {
		return serachTitle1;
	}

	public void setSerachTitle1(String serachTitle1) {
		this.serachTitle1 = serachTitle1;
	}

	public String getSerachLinkType1() {
		return serachLinkType1;
	}

	public void setSerachLinkType1(String serachLinkType1) {
		this.serachLinkType1 = serachLinkType1;
	}

	public String getPageType() {
		return pageType;
	}

	public void setPageType(String pageType) {
		this.pageType = pageType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getIsUse() {
		return isUse;
	}

	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}


	public String getPageFlag() {
		return pageFlag;
	}


	public void setPageFlag(String pageFlag) {
		this.pageFlag = pageFlag;
	}
	

}
