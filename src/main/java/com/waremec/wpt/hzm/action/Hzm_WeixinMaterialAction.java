package com.waremec.wpt.hzm.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.JsonUtil;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.utils.DateUtils;
import com.waremec.weixin.utils.PropertiesUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.domain.NewsItem;
import com.waremec.wpt.admin.service.MassService;
import com.waremec.wpt.admin.service.MaterialService;
import com.waremec.wpt.admin.service.ShopService;
@Controller("hzmWeixinMaterialAction")
@Scope(ScopeType.prototype)
public class Hzm_WeixinMaterialAction extends BaseAction implements ServletContextAware{
	private static final long serialVersionUID = 1L;
	 
	private String conformMethod = "chooseFunc";
	private String clsoeMethod = "closeFunc";
	private String dahannews="";
	
	private Integer newType;
	//	--以时间为条件查询的开始时间
	private String beginDate="";
	//	--以时间为条件查询的结束时间
	private String endDate="";
	//SHOP_ID	[文件] 店铺ID	INT
	private String shopId="";
	//FILE_ID	[文件] 文件 ID	INT
	private String fileId="";
	//FILE_NM	[文件] 文件名称	NVARCHAR
	private String fileName="";
	//FILE_SYS_NM	[文件] 文件系统名称	NVARCHAR
	private String fileSysname="";
	//FILE_TYPE	[文件] 文件类型 1图片 2声音 3视频	TINYINT
	private String fileType="";
	//FILE_SIZE	[文件] 大小	INT
	private String fileSize="";
	//FULL_URL	[文件] URL	NVARCHAR
	private String fullURL="";
	//IS_USE	[文件] 0:停用 1:使用	TINYINT
	private String isUseNum="";
	//MODIFIED_ID	NULL	NVARCHAR
	private String modifiedUserId="";
	//CREATED_ID	NULL	NVARCHAR
	private String createdUserId="";
	//存储用户的ID
	private String userId="";
	//存储文件
	private File fileEntity;
	//存储店铺标志图片的名字
    private String logoFileName="";
    private String nickName="";
    private String jobType="";
    private String openId="";
    //存储ServletContext
    private ServletContext context=null;
    
    private int fileGroup = 1;
   
    private String jsonStr;
    private int type ;
    
    private String display;
    
    @Resource
	private WeixinService weixinService;
	@Resource
	private ShopService shopService;
	@Resource
	private MaterialService materialService;
	@Resource
	private MassService massServcie;
	
	
	public String hzm_NewsMaterialWindow(){
		return "hzm_NewsMaterialWindow";
	}
	public String hzm_NewsMaterialWindowFragment(){
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("MTITLE", getRequest().getParameter("title"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("MSG_ID", null);
		paramsMap.put("PAGE_CURR", pageCurr);
		paramsMap.put("PAGE_UINT", pageUnit);
		
		List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , paramsMap);
		
		ListUtil.convertClob2String(newsList);
//		ListUtil.printListMap(newsList);

		for (int i = 0; i < newsList.size(); i++) {
			Integer  itemCnt = (Integer)newsList.get(i).get("ITEM_CNT");
			if(itemCnt > 1){
				paramsMap.clear();
				paramsMap.put("SHOP_ID",  getBackSessionShopId());
				paramsMap.put("MTITLE", null);
				paramsMap.put("USER_ID", getBackSessionUserId());
				paramsMap.put("MSG_ID", (Integer)newsList.get(i).get("MSG_ID"));
				
				List<Map<String, Object>> sublist =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , paramsMap);
				ListUtil.convertClob2String(sublist);

//				ListUtil.printListMap(sublist);
				newsList.get(i).put("sublist", sublist);
			}
		}
		
		PageData page = new PageData();
		if (!newsList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(newsList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , newsList);
		}
		
		request.put("page", page);
		return "hzm_NewsMaterialWindowFragment";
	}
	
	
	public String fileList() {
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("MTITLE", getRequest().getParameter("fileName"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("MSG_ID", null);
		paramsMap.put("newType",newType);
		paramsMap.put("beginDate",StringUtil.emptyToNull(beginDate));
		paramsMap.put("endDate", StringUtil.emptyToNull(endDate));
		paramsMap.put("PAGE_CURR", pageCurr);
		paramsMap.put("PAGE_UINT", pageUnit);
		
		List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_DAHAN_NEWS_ITEM" , paramsMap);
		
		ListUtil.convertClob2String(newsList);
//		ListUtil.printListMap(newsList);

		for (int i = 0; i < newsList.size(); i++) {
			Integer  itemCnt = (Integer)newsList.get(i).get("ITEM_CNT");
			if(itemCnt > 1){
				paramsMap.clear();
				paramsMap.put("SHOP_ID",  getBackSessionShopId());
				paramsMap.put("MTITLE", null);
				paramsMap.put("USER_ID", getBackSessionUserId());
				paramsMap.put("MSG_ID", (Integer)newsList.get(i).get("MSG_ID"));
				
				List<Map<String, Object>> sublist =  commonService.selectList("Material.SHOP_DAHAN_NEWS_ITEM" , paramsMap);
				ListUtil.convertClob2String(sublist);

//				ListUtil.printListMap(sublist);
				newsList.get(i).put("sublist", sublist);
			}
		}
		
		PageData page = new PageData();
		if (!newsList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(newsList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , newsList);
		}
		request.put("page", page);
		paramsMap.clear();
		paramsMap.put("shopId",  getBackSessionShopId());
		paramsMap.put("tbName", "SHOP_WX_NEWS_ITEM");
		paramsMap.put("fdName", "NEWS_TYPE");
		paramsMap.put("isDelete",0);
		paramsMap.put("cdId",null);
		request.put("list", commonService.selectList("Material.CM_CODE_CONTROL_SELECT", paramsMap));
		return "fileList";
	}
	
	public String fileListFragment() {
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("MTITLE", getRequest().getParameter("fileName"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("MSG_ID", null);
		paramsMap.put("newType",newType);
		paramsMap.put("beginDate",StringUtil.emptyToNull(beginDate));
		paramsMap.put("endDate", StringUtil.emptyToNull(endDate));
		paramsMap.put("PAGE_CURR", pageCurr);
		paramsMap.put("PAGE_UINT", pageUnit);
		
		List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_DAHAN_NEWS_ITEM" , paramsMap);
		
		ListUtil.convertClob2String(newsList);
//		ListUtil.printListMap(newsList);

		for (int i = 0; i < newsList.size(); i++) {
			Integer  itemCnt = (Integer)newsList.get(i).get("ITEM_CNT");
			if(itemCnt > 1){
				paramsMap.clear();
				paramsMap.put("SHOP_ID",  getBackSessionShopId());
				paramsMap.put("MTITLE", null);
				paramsMap.put("USER_ID", getBackSessionUserId());
				paramsMap.put("MSG_ID", (Integer)newsList.get(i).get("MSG_ID"));
				
				List<Map<String, Object>> sublist =  commonService.selectList("Material.SHOP_DAHAN_NEWS_ITEM" , paramsMap);
				ListUtil.convertClob2String(sublist);

//				ListUtil.printListMap(sublist);
				newsList.get(i).put("sublist", sublist);
			}
		}
		
		PageData page = new PageData();
		if (!newsList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(newsList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , newsList);
		}
		
		request.put("page", page);
		paramsMap.clear();
		paramsMap.put("shopId",  getBackSessionShopId());
		paramsMap.put("tbName", "SHOP_WX_NEWS_ITEM");
		paramsMap.put("fdName", "NEWS_TYPE");
		paramsMap.put("isDelete",0);
		paramsMap.put("cdId",null);
		request.put("list", commonService.selectList("Material.CM_CODE_CONTROL_SELECT", paramsMap));
		return "fileListFragment";
	}
	
	
	
	public String hzm_NewsfeedList(){
		return "hzm_NewsfeedList";
	}
	public String hzm_NewsfeedListFragment(){
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("MTITLE", getRequest().getParameter("title"));
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("MSG_ID", null);
		paramsMap.put("PAGE_CURR", pageCurr);
		paramsMap.put("PAGE_UINT", pageUnit);
		
		List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , paramsMap);
		
		ListUtil.convertClob2String(newsList);
		
		for (int i = 0; i < newsList.size(); i++) {
			Integer  itemCnt = (Integer)newsList.get(i).get("ITEM_CNT");
			if(itemCnt > 1){
				paramsMap.clear();
				paramsMap.put("SHOP_ID",  getBackSessionShopId());
				paramsMap.put("MTITLE", null);
				paramsMap.put("USER_ID", getBackSessionUserId());
				paramsMap.put("MSG_ID", (Integer)newsList.get(i).get("MSG_ID"));
				
				List<Map<String, Object>> sublist =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , paramsMap);
				ListUtil.convertClob2String(sublist);
				newsList.get(i).put("sublist", sublist);
			}
		}
		
		PageData page = new PageData();
		if (!newsList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(newsList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , newsList);
		}
		
		request.put("page", page);
		
		return "hzm_NewsfeedListFragment";
	}
	
	
	public String hzm_AddNewsMaterial(){
		
		return "hzm_AddNewsMaterial";
	}
	/**
	 * 打开图文类型管理页面
	 * @return
	 */
	public String hzm_NewsFeedControl(){
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("shopId",  getBackSessionShopId());
		paramsMap.put("tbName", "SHOP_WX_NEWS_ITEM");
		paramsMap.put("fdName", "NEWS_TYPE");
		paramsMap.put("isDelete",null);
		paramsMap.put("cdId",null);
		request.put("list", commonService.selectList("Material.CM_CODE_CONTROL_SELECT", paramsMap));
		return "hzm_NewsFeedControl";
	}
	public String hzm_GetNewsFeedList(){
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("shopId",  getBackSessionShopId());
		paramsMap.put("tbName", "SHOP_WX_NEWS_ITEM");
		paramsMap.put("fdName", "NEWS_TYPE");
		paramsMap.put("isDelete",0);
		paramsMap.put("cdId",null);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commonService.selectList("Material.CM_CODE_CONTROL_SELECT", paramsMap));
		renderJSON(map);
		return NONE;
	}
	/**
	 * 修改，操作，新建图文类型
	 * @return
	 */
	public String hzm_SaveNewsFeedControl(){
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("shopId",  getBackSessionShopId());
		paramsMap.put("tbName", "SHOP_WX_NEWS_ITEM");
		paramsMap.put("fdName", "NEWS_TYPE");
		paramsMap.put("jobType", jobType);
		paramsMap.put("cdId", StringUtil.emptyToNull(getRequest().getParameter("cdId")));
		paramsMap.put("cdVal", StringUtil.emptyToNull(getRequest().getParameter("cdVal")));
		paramsMap.put("cdDesc", shopId);
		paramsMap.put("isDelete", StringUtil.emptyToNull(getRequest().getParameter("isDelete")));
		Map<String,Object> map=commonService.select("Material.CM_CODE_UPDATE",paramsMap);
		renderJSON(map);
		return NONE;
	}
	public String hzm_MaterialManageListFragment(){
		try{
			userId=getBackSessionUserId();
			shopId = getBackSessionShopId().toString();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", StringUtil.emptyToNull(shopId));
			map.put("fileName", StringUtil.emptyToNull(fileName));
			map.put("beginDate",StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("fileType", StringUtil.emptyToNull(fileType));
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			map.put("fileId", null);
			map.put("fileGroup", 2);
			List<Map<String,Object>> list=commonService.selectList("MaterialManage.selectShopFileList", map);
			request.put("list", list);
			request.put("fileName", fileName);
			request.put("endDate", endDate);
			request.put("beginDate", beginDate);
			request.put("fileType", fileType);
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr,pageUnit, totalCount , list);
			}
			request.put("page", page);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "hzm_MaterialManageListFragment";
	}
	public String hzm_ModifyNewsMaterial(){
		
		Integer msgId = IntegerUtils.valueOf(getRequest().getParameter("msgId"));
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("MTITLE", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("MSG_ID", msgId);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		try {
			List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , paramsMap);
			ListUtil.convertClob2String(newsList);
			request.put("newsList", newsList);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		request.put("msgId", msgId);
		
		//获取预览用户列表
		paramsMap.clear();
		paramsMap.put("SHOP_ID",  getBackSessionShopId() + "");
		
		List<Map<String, Object>> userList =  commonService.selectList("Material.WX_NEWS_PREVIEW_USER_SELECT" , paramsMap);
		paramsMap.clear();
		paramsMap.put("shopId",  getBackSessionShopId());
		paramsMap.put("tbName", "SHOP_WX_NEWS_ITEM");
		paramsMap.put("fdName", "NEWS_TYPE");
		paramsMap.put("isDelete",0);
		paramsMap.put("cdId",null);
		request.put("list", commonService.selectList("Material.CM_CODE_CONTROL_SELECT", paramsMap));
		request.put("userList", userList);
		return "hzm_ModifyNewsMaterial";
	}
	
	public String hzm_ShowImageWindow(){
		
		pageUnit = 50 ;
		
		System.out.println("fileGroup====" + this.fileGroup);
		System.out.println("type====" + type);
		System.out.println("pageCurr====" + pageCurr);
		System.out.println("pageUnit====" + pageUnit);
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("PAGE_CURR", pageCurr);
		paramsMap.put("PAGE_UINT", pageUnit);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("FILE_GROUP", fileGroup);
		if(StringUtils.isNotEmpty(fileName)){
			paramsMap.put("FILE_NM", fileName);
		}
		
		PageData page = new PageData();
		List<Map<String, Object>> list =  commonService.selectList("Material.selectImageMaterial" , paramsMap);
		///ListUtil.printListMap(list);
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		 
		}
		
		request.put("page", page);
		return "hzm_ShowImageWindow";
	}
	
	
	public String addNews(){
		
		System.out.println("jsonStr=" + jsonStr);
		
		List<NewsItem> newsItemList = new ArrayList<NewsItem>();
		try {
			
			
			Integer shopId = getBackSessionShopId();
			String userId = getBackSessionUserId();
			
			
			JSONArray jsonArray = JSONArray.fromObject(jsonStr);
			
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				
				NewsItem newsItem = new NewsItem();
				
				//newsItem.setId(JsonUtil.getInt(item, "id"));
				newsItem.setNewsType(JsonUtil.getInt(item, "newsType"));
				newsItem.setTitle(JsonUtil.getString(item, "title"));
				newsItem.setAuthor(JsonUtil.getString(item, "author"));
				newsItem.setContentSourceUrl(JsonUtil.getString(item, "contentSourceUrl"));
				newsItem.setFileId(JsonUtil.getInt(item, "fileId"));
				newsItem.setShowCoverPic(JsonUtil.getInt(item, "showCoverPic"));
				newsItem.setContent(JsonUtil.getString(item, "content"));
				newsItem.setDigest(JsonUtil.getString(item, "digest"));
				newsItem.setListImgId(JsonUtil.getInt(item, "listImgId"));
				
				newsItem.setShopId(shopId);
				newsItem.setUserId(userId);
				
				newsItemList.add(newsItem);
			}
			
			Map<String,Object> pmap = new HashMap<String,Object>();
			pmap.put("SHOP_ID", shopId);
			pmap.put("MSG_ID", null);
			pmap.put("MSG_NM", null);
			pmap.put("USER_ID", userId);
			pmap.put("JOB_TYPE", "I");
			
			pmap.put("newsItemList", newsItemList);
			
			
			Integer msgId = materialService.addNewsMaterial(pmap);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", true);
			map.put("msgId", msgId);
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
	
	
	public String hzm_ModifyNews(){
		
		System.out.println("jsonStr=" + jsonStr);
		
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		
		List<NewsItem> newsItemList = new ArrayList<NewsItem>();
		try {
			
			Integer msgId = JsonUtil.getInt(jsonObject, "msgId");
			Integer shopId = getBackSessionShopId();
			String userId = getBackSessionUserId();
			
			JSONArray jsonArray = jsonObject.getJSONArray("newslist");
			
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				
				NewsItem newsItem = new NewsItem();
				
				newsItem.setNewsId(JsonUtil.getInt(item, "newsId"));
				newsItem.setNewsType(JsonUtil.getInt(item, "newsType"));
				newsItem.setTitle(JsonUtil.getString(item, "title"));
				newsItem.setAuthor(JsonUtil.getString(item, "author"));
				newsItem.setContentSourceUrl(JsonUtil.getString(item, "contentSourceUrl"));
				newsItem.setFileId(JsonUtil.getInt(item, "fileId"));
				newsItem.setShowCoverPic(JsonUtil.getInt(item, "showCoverPic"));
				newsItem.setContent(JsonUtil.getString(item, "content"));
				newsItem.setDigest(JsonUtil.getString(item, "digest"));
				newsItem.setListImgId(JsonUtil.getInt(item, "listImgId"));
				newsItem.setShopId(shopId);
				newsItem.setUserId(userId);
				
				newsItemList.add(newsItem);
			}
			
			Map<String,Object> pmap = new HashMap<String,Object>();
			pmap.put("SHOP_ID", shopId);
			pmap.put("MSG_ID", msgId);
			pmap.put("MSG_NM", null);
			pmap.put("USER_ID", userId);
			pmap.put("newsItemList", newsItemList);
			
			materialService.modifyNewsMaterial(pmap);
			
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
	
	
public String hzm_PreviewNews(){
		
		System.out.println("jsonStr=" + jsonStr);
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		List<NewsItem> newsItemList = new ArrayList<NewsItem>();
		String token = weixinService.getAccessToken(getBackSessionShopId());
		try {
			Integer msgId = JsonUtil.getInt(jsonObject, "msgId");
			Integer shopId = getBackSessionShopId();
			String userId = getBackSessionUserId();
			String openid = JsonUtil.getString(jsonObject, "openid");
			
			JSONArray jsonArray = jsonObject.getJSONArray("newslist");
			String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject item = jsonArray.getJSONObject(i);
				
				NewsItem newsItem = new NewsItem();
				newsItem.setNewsId(JsonUtil.getInt(item, "newsId"));
				newsItem.setNewsType(JsonUtil.getInt(item, "newsType"));
				newsItem.setTitle(JsonUtil.getString(item, "title"));
				newsItem.setAuthor(JsonUtil.getString(item, "author"));
				newsItem.setContentSourceUrl(JsonUtil.getString(item, "contentSourceUrl"));
				newsItem.setFileId(JsonUtil.getInt(item, "fileId"));
				newsItem.setShowCoverPic(JsonUtil.getInt(item, "showCoverPic"));
				newsItem.setDigest(JsonUtil.getString(item, "digest"));
				newsItem.setListImgId(JsonUtil.getInt(item, "listImgId"));
				newsItem.setShopId(shopId);
				newsItem.setUserId(userId);
				String strCon = StringUtil.getImgSrc(JsonUtil.getString(item, "content"),token,uploadBaseDir);
				newsItem.setContent(strCon);
				newsItemList.add(newsItem);
			}
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("SHOP_ID", shopId);
			map.put("MSG_ID", msgId);
			map.put("MSG_NM", null);
			map.put("USER_ID", userId);
			map.put("newsItemList", newsItemList);
			
			materialService.modifyNewsMaterial(map);
			
			//此处调用预览接口
			map.clear();
			map.put("SHOP_ID",  getBackSessionShopId());
			map.put("USER_ID", getBackSessionUserId());
			map.put("MSG_ID", msgId);
			
			List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , map);
			ListUtil.convertClob2String(newsList);
			
			massServcie.previewMassMessage(getBackSessionShopId(), openid, newsList);
			//此处调用预览接口 end
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", true);
			renderJSON(returnMap);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", false);
			returnMap.put("msg", e.getMessage());
			renderJSON(returnMap);
		}
		
		return NONE;
	}
	
	public String hzm_GetNewsMaterialById(){
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("MTITLE", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("MSG_ID", IntegerUtils.valueOf(getRequest().getParameter("msgId")));
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		try {
			List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , paramsMap);
			ListUtil.convertClob2String(newsList);
//			ListUtil.printListMap(newsList);
			returnMap.put("success", true);
			returnMap.put("data", newsList);
		} catch (Exception e) {
			// TODO: handle exception
			returnMap.put("success", false);
			returnMap.put("msg", e.getMessage());
		}
		renderJSON(returnMap);
		return NONE;
	}
	
	
	public String hzm_MaterialManage(){
		try{
			userId=getBackSessionUserId();
			shopId = getBackSessionShopId().toString();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", StringUtil.emptyToNull(shopId));
			map.put("fileName", StringUtil.emptyToNull(fileName));
			map.put("beginDate",StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("fileType", StringUtil.emptyToNull(fileType));
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			map.put("fileId", null);
			map.put("fileGroup", 2);
			List<Map<String,Object>> list=commonService.selectList("MaterialManage.selectShopFileList", map);
			request.put("list", list);
			request.put("fileName", fileName);
			request.put("endDate", endDate);
			request.put("beginDate", beginDate);
			request.put("fileType", fileType);
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr,pageUnit, totalCount , list);
			}
			request.put("page", page);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "hzm_MaterialManage";
	}
	
	public String hzm_SaveFile(){
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		
		UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity, logoFileName, UploadFileUtil.UPLOAD_SHOP);
		
      	String isUseNum="1";
		AdminShopFileMst adminShopFileMst=new AdminShopFileMst();
		adminShopFileMst.setJobType("I");
		adminShopFileMst.setFileName(result.getOriginalFilename());
		adminShopFileMst.setFileSize(result.getFileSize() + "");
		adminShopFileMst.setFileSysname(result.getDestinationFilename());
		adminShopFileMst.setFileType(fileType);
		adminShopFileMst.setIsUseNum(isUseNum);
		adminShopFileMst.setFullURL(result.getFileUrl());
		adminShopFileMst.setCreatedUserId(userId);
		adminShopFileMst.setModifiedUserId(userId);
		adminShopFileMst.setShopId(shopId);
		adminShopFileMst.setFileGroup(fileGroup);
		
		
        try {
        	
        	if(fileGroup == 2){
    			String  token = weixinService.getAccessToken(Integer.valueOf(shopId));
    			String type = "";
    			if(fileType.equals("1")){
    				type = "image";
    			}else if(fileType.equals("2")){
    				type = "voice";
    			}else if(fileType.equals("3")){
    				type = "video";
    			}

    			MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, type, result.getRealPath());
    			
    			adminShopFileMst.setMediaId(mediaReturn.getMedia_id());
    			adminShopFileMst.setMediaUpDt(DateUtils.secondsToDate(mediaReturn.getCreated_at()));
    			
    		}
        	
			String fileId=shopService.saveShopFileMst("MaterialManage.saveShopFileMst",adminShopFileMst);
			JSONObject jo = new JSONObject();
			jo.put("fileId", fileId);
			jo.put("resultLogoImg", "上传文件成功");
	  		renderHtml(jo.toString());
	  		return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			JSONObject jo = new JSONObject();
			jo.put("resultLogoImg", e.getMessage());
	  		renderHtml(jo.toString());
			return NONE;
		}  
	}
	public String hzm_DeleteShopFile(){
		String ret="success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("fileId", fileId);
		map.put("modifiedId", userId);
		map.put("isUse", "0");
		try {
			shopService.updateObject("MaterialManage.deleteShopFile", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String hzm_UpdateShopFile(){
		String ret="success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		try {
			Map<String,Object> map=new HashMap<String,Object>();
			fileName=new String(fileName.getBytes("ISO-8859-1"),"UTF-8");
			map.put("shopId",shopId);
			map.put("fileId", fileId);
			map.put("modifiedId", userId);
			map.put("fileName", fileName);
			shopService.updateObject("MaterialManage.updateShopFile", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	public String hzm_SelectCust(){
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		try{
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", StringUtil.emptyToNull(shopId));
			nickName=new String(nickName.getBytes("ISO-8859-1"),"UTF-8");
			map.put("nickName", StringUtil.emptyToNull(nickName));
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", 32);
			List<Map<String,Object>> list=commonService.selectList("MaterialManage.selectCustList", map);
			request.put("list", list);
			if(!list.isEmpty()){
				int pageUnitCount=(Integer) list.get(0).get("COUNT_NUM");
				int pageCount=pageUnitCount/32+(pageUnitCount%32==0?0:1);
				request.put("pageUnitCount", pageUnitCount);
				request.put("pageCount", pageCount);
				request.put("pageCurr", pageCurr);
			}else{
				request.put("pageUnitCount", 0);
				request.put("pageCount", 1);
				request.put("pageCurr", pageCurr);
			}
			request.put("nickName", nickName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "hzm_SelectCust";
	}
	
	public String hzm_GetCustWxList(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("SHOP_ID",  getBackSessionShopId() + "");
		List<Map<String, Object>> list =  commonService.selectList("Material.WX_NEWS_PREVIEW_USER_SELECT",map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		renderJSON(returnMap);
		return NONE;
	}
	public String hzm_InsertCmCode(){
		String ret="success";
		try{
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId",  getBackSessionShopId() + "");
			map.put("jobType", "I");
			map.put("openId", openId);
			Map<String,Object> mapResult=commonService.select("MaterialManage.insertCmCode", map);
			if(mapResult.isEmpty()){
				ret="fail";
			}else{
				String str=(String) mapResult.get("OUT_ERR_MSG");
				if(str=="S" || "S".equals(str)){
					ret="success";
				}else{
					ret="fail";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	//
	public String doExcel() throws UnsupportedEncodingException {
		String ret = "";
		try {
			Map<String,Object> paramsMap = new HashMap<String,Object>();
			paramsMap.put("SHOP_ID",  getBackSessionShopId());
			paramsMap.put("MTITLE", getRequest().getParameter("fileName"));
			paramsMap.put("USER_ID", getBackSessionUserId());
			paramsMap.put("MSG_ID", null);
			paramsMap.put("newType",newType);
			paramsMap.put("beginDate",StringUtil.emptyToNull(beginDate));
			paramsMap.put("endDate", StringUtil.emptyToNull(endDate));
			paramsMap.put("PAGE_CURR", pageCurr);
			paramsMap.put("PAGE_UINT", pageUnit);
			
			List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_DAHAN_NEWS_ITEM" , paramsMap);
			
			ListUtil.convertClob2String(newsList);
			for (int i = 0; i < newsList.size(); i++) {
				Integer  itemCnt = (Integer)newsList.get(i).get("ITEM_CNT");
				if(itemCnt > 1){
					paramsMap.clear();
					paramsMap.put("SHOP_ID",  getBackSessionShopId());
					paramsMap.put("MTITLE", null);
					paramsMap.put("USER_ID", getBackSessionUserId());
					paramsMap.put("MSG_ID", (Integer)newsList.get(i).get("MSG_ID"));
					
					List<Map<String, Object>> sublist =  commonService.selectList("Material.SHOP_DAHAN_NEWS_ITEM" , paramsMap);
					ListUtil.convertClob2String(sublist);
					newsList.get(i).put("sublist", sublist);
				}
			}
			if (newsList.isEmpty()) {}
				List<String> bt=new ArrayList<String>();
				bt.add("消息ID");						
				bt.add(" 类型");				
				bt.add("标题");		
				bt.add("日期");		
				bt.add("阅读量");		
				bt.add("喜欢人数");			
				bt.add("分享人数");	
				
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.reset();
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode("群发消息统计", "UTF-8") + ".xls");
			// 创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);
			sheet.mergeCells(0, 0, 6, 0);
			// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
			// 生成一个单元格样式控制对象
			WritableCellFormat titleFormate = new WritableCellFormat(bold);
			// 单元格中的内容水平方向居中
			titleFormate.setAlignment(jxl.format.Alignment.LEFT);
			// 单元格的内容垂直方向居中
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			// 设置第一行合并单元格的文本
			Label title = new Label(0, 0, "群发消息统计", titleFormate);
			sheet.setRowView(0, 600, false);
			sheet.addCell(title);
			int row = 1;
			int col = 0;
			String[] titles =bt.toArray(new String[bt.size()]);
			for (int i = 0; i < titles.length; i++) {
				// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
				sheet.addCell(new Label(col++, row, titles[i]));
			}		
		    row = 2;
		    col = 0;

			for (int i = 0 ; i < newsList.size(); i++) {
				sheet.setColumnView(row, 15); 
				Integer  itemCnt = (Integer)newsList.get(i).get("ITEM_CNT");
				if(itemCnt <=1){
					sheet.addCell(new Label(col++, row, newsList.get(i).get("NEWS_ID").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, newsList.get(i).get("NEWS_TYPE").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, newsList.get(i).get("MTITLE").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, newsList.get(i).get("CREATED_DT").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, newsList.get(i).get("READ_CNT").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, newsList.get(i).get("LIKE_CNT").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, newsList.get(i).get("SHARE_CNT").toString(), titleFormate));
				}else{
					@SuppressWarnings("unchecked")
					List<Map<String, Object>> sub=	(List<Map<String, Object>>)newsList.get(i).get("sublist");
					for(int j=0;j<sub.size();j++){
						sheet.addCell(new Label(col++, row, sub.get(i).get("NEWS_ID").toString(), titleFormate));
						sheet.addCell(new Label(col++, row, sub.get(i).get("NEWS_TYPE").toString(), titleFormate));
						sheet.addCell(new Label(col++, row, sub.get(i).get("MTITLE").toString(), titleFormate));
						sheet.addCell(new Label(col++, row, sub.get(i).get("CREATED_DT").toString(), titleFormate));
						sheet.addCell(new Label(col++, row, sub.get(i).get("READ_CNT").toString(), titleFormate));
						sheet.addCell(new Label(col++, row, sub.get(i).get("LIKE_CNT").toString(), titleFormate));
						sheet.addCell(new Label(col++, row, sub.get(i).get("SHARE_CNT").toString(), titleFormate));
					}
				}
				

				row++;
				col = 0;
			}
			// 把创建的内容写入到输出流中，并关闭输出流
			workbook.write();
			workbook.close();
			os.close();

		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String newMaterialManage(){
		return "newMaterialManage";
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSysname() {
		return fileSysname;
	}
	public void setFileSysname(String fileSysname) {
		this.fileSysname = fileSysname;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFullURL() {
		return fullURL;
	}
	public void setFullURL(String fullURL) {
		this.fullURL = fullURL;
	}
	public String getIsUseNum() {
		return isUseNum;
	}
	public void setIsUseNum(String isUseNum) {
		this.isUseNum = isUseNum;
	}
	public String getModifiedUserId() {
		return modifiedUserId;
	}
	public void setModifiedUserId(String modifiedUserId) {
		this.modifiedUserId = modifiedUserId;
	}
	public String getCreatedUserId() {
		return createdUserId;
	}
	public void setCreatedUserId(String createdUserId) {
		this.createdUserId = createdUserId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLogoFileName() {
		return logoFileName;
	}
	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}
	@Override
	public void setServletContext(ServletContext context) {
		this.context=context;
		
	}
	public File getFileEntity() {
		return fileEntity;
	}
	public void setFileEntity(File fileEntity) {
		this.fileEntity = fileEntity;
	}
	public int getFileGroup() {
		return fileGroup;
	}
	public void setFileGroup(int fileGroup) {
		this.fileGroup = fileGroup;
	}


	public String getJsonStr() {
		return jsonStr;
	}


	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getConformMethod() {
		return conformMethod;
	}
	public void setConformMethod(String conformMethod) {
		this.conformMethod = conformMethod;
	}
	public String getClsoeMethod() {
		return clsoeMethod;
	}
	public void setClsoeMethod(String clsoeMethod) {
		this.clsoeMethod = clsoeMethod;
	}
	public String getDahannews() {
		return dahannews;
	}
	public void setDahannews(String dahannews) {
		this.dahannews = dahannews;
	}
	public Integer getNewType() {
		return newType;
	}
	public void setNewType(Integer newType) {
		this.newType = newType;
	}


	
}

