package com.waremec.wpt.admin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.JsonUtil;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;
import com.waremec.wpt.admin.domain.TmplType;
import com.waremec.wpt.admin.domain.dispaly.ImageItem;
import com.waremec.wpt.admin.domain.dispaly.ImgItem;
import com.waremec.wpt.admin.service.BlogService;

@Controller("adminBlogAction")
@Scope(ScopeType.prototype)
public class BlogAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	
	private String jsonStr = "";
	private Integer blogId;
	private String isDelete="";
	private String jobType="";
	//存储店铺ID
	private String shopId="";
	//存储用户的Id
	private String userId="";
	//点赞给积分
	private String likePoint="";
	//评价给积分
	private String replyPoint="";
	//分享给积分
	private String sharePoint="";
	@Resource
	private BlogService blogService;
	
	
	public String blogCreate() throws Exception {
		
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("BG_ID", null);
		paramsMap.put("BG_PARENT_ID", null);
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 1000);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("CUST_SYS_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		request.put("blogGroupList", commonService.selectList("Blog.SHOP_BLOG_GROUP_SELECT", paramsMap));
		
		return "blogCreate";
	}
	
	
	
	/**
	 * 打开日志分类管理页面
	 * @return
	 */
	public String blogClassifyManager(){
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("shopId", getBackSessionShopId());
		request.put("list", commonService.selectList(
				"Blog.selectShopBlogList", paramsMap));
		return "blogClassifyManager";
	}
	/**
	 * 修改日志分类
	 * @return
	 */
	public String updateBlogClassify(){
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("BG_NM", getRequest().getParameter("blogGrupName"));
		parmsMap.put("BG_ID", blogId);
		parmsMap.put("JOB_TYPE", jobType);
		parmsMap.put("IS_DELETE",StringUtil.emptyToNull(isDelete));
		Map<String, Object> resultMap=commonService.select("Blog.updateShopBlogClassifyManager", parmsMap);
//		MapUtil.printMap(resultMap);

		renderJSON(resultMap);
		return NONE;
	}
	
	
	public String preBlogCreate() throws Exception {

		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("BG_ID", null);
		paramsMap.put("BG_PARENT_ID", null);
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 1000);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("CUST_SYS_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());

		request.put("blogGroupList", commonService.selectList(
				"Blog.SHOP_BLOG_GROUP_SELECT", paramsMap));

		return "preBlogCreate";
	}
	public String getBlogManage(){
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("BG_ID", null);
		paramsMap.put("BG_PARENT_ID", null);
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 1000);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("CUST_SYS_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commonService.selectList(
				"Blog.SHOP_BLOG_GROUP_SELECT", paramsMap));
		renderJSON(map);
		return NONE;
	}
	public String preBlogModify() throws Exception {

		System.out.println("blogId=======" + blogId);
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("BLOG_GROUP_ID", null);
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 1);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("CUST_SYS_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("BLOG_ID", blogId);
		
		Map<String, Object> blogMaster = commonService.select("Blog.SHOP_BLOG_LIST_SELECT" , paramsMap);
		MapUtil.convertClob2String(blogMaster);
//		MapUtil.printOrderedMap(blogMaster);
		request.put("blogMaster", blogMaster);
		
		
		ImgItem mainImg = new ImgItem();
		mainImg.setTempId(1);
		mainImg.setId((Integer)blogMaster.get("BLOG_FILE_ID"));
		mainImg.setTitle((String)blogMaster.get("BLOG_TITLE"));
		mainImg.setAttachment_url((String)blogMaster.get("BLOG_FILE_URL"));
		mainImg.setLinkUrl("");
		request.put("blogMainImg", JSONObject.fromObject(mainImg));
		
		//paramsMap.put("DISPLAY_ID", blogId);
		paramsMap.put("PAGE_ID", blogMaster.get("PAGE_ID"));
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
				paramsMap.put("DISPLAY_ID", null);
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
		
		paramsMap.clear();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("BG_ID", null);
		paramsMap.put("BG_PARENT_ID", null);
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 1000);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("CUST_SYS_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());

		request.put("blogGroupList", commonService.selectList(
				"Blog.SHOP_BLOG_GROUP_SELECT", paramsMap));
		
		return "preBlogModify";
	}
	public String blogModify() throws Exception {
		
		System.out.println("blogId=======" + blogId);
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("BLOG_GROUP_ID", null);
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 1);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("CUST_SYS_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("BLOG_ID", blogId);
		
		Map<String, Object> blogMaster = commonService.select("Blog.SHOP_BLOG_LIST_SELECT" , paramsMap);
		MapUtil.convertClob2String(blogMaster);
//		MapUtil.printOrderedMap(blogMaster);
		request.put("blogMaster", blogMaster);
		
		
		ImageItem mainImg = new ImageItem();
		mainImg.setTempId(1);
		mainImg.setFileId((Integer)blogMaster.get("BLOG_FILE_ID"));
		mainImg.setFileNm((String)blogMaster.get("BLOG_TITLE"));
		mainImg.setFileUrl((String)blogMaster.get("BLOG_FILE_URL"));
		mainImg.setLinkUrl("");
		request.put("blogMainImg", JSONObject.fromObject(mainImg));
		
		//paramsMap.put("DISPLAY_ID", blogId);
		paramsMap.put("PAGE_ID", blogMaster.get("PAGE_ID"));
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
				paramsMap.put("DISPLAY_ID", null);
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
		paramsMap.clear();
		paramsMap.put("SHOP_ID", getBackSessionShopId());
		paramsMap.put("BG_ID", null);
		paramsMap.put("BG_PARENT_ID", null);
		paramsMap.put("PAGE_CURR", 1);
		paramsMap.put("PAGE_UINT", 1000);
		paramsMap.put("ORDERBY", null);
		paramsMap.put("CUST_SYS_ID", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		
		request.put("blogGroupList", commonService.selectList("Blog.SHOP_BLOG_GROUP_SELECT", paramsMap));
		
		
		return "blogModify";
	}

	public String blogImageList() {
		// System.out.println(this.jsonStr);
		// renderJSON(this.jsonStr);

		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("FILE_ID", null);
		parmsMap.put("FILE_NM", null);
		parmsMap.put("FILE_TYPE", 1);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", null);
		parmsMap.put("USER_ID", null);
		parmsMap.put("FILE_GROUP", 3);

		PageData page = new PageData();
		List<Map<String, Object>> list = commonService.selectList(
				"Blog.SHOP_FILE_MST_LIST_SELECT", parmsMap);

		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, list);
			System.out.println("totalCount=" + totalCount);
		}

		renderJSON(page);

		return NONE;
	}

	public String saveBlogGroup() {
		// System.out.println(this.jsonStr);
		// renderJSON(this.jsonStr);

		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", getBackSessionShopId());
		parmsMap.put("BG_NM", getRequest().getParameter("blogGrupName"));

		Map<String, Object> resultMap = blogService.saveBlogGroup(parmsMap);

//		MapUtil.printMap(resultMap);

		renderJSON(resultMap);

		return NONE;
	}
	
	public String createBlog(){
		
		System.out.println("jsonStr=" + jsonStr);
		Integer shopId = getBackSessionShopId();
		Integer createdId = 1;
		
		JSONObject json = JSONObject.fromObject(jsonStr);
		
		Map<String,Object> saveMap = new HashMap<String,Object>();
		
		saveMap.put("SHOP_ID", getBackSessionShopId());
		saveMap.put("BLOG_GROUP_ID",JsonUtil.getInt(json,"blogGroup"));
		saveMap.put("BLOG_TITLE",  JsonUtil.getString(json,"blogTitle"));
		saveMap.put("BLOG_DETAIL", JsonUtil.getString(json,"blogDetail"));
		saveMap.put("BLOG_FILE_ID", JsonUtil.getInt(json,"mainImgId"));
		saveMap.put("USER_ID", getBackSessionUserId());
		
		
		JSONArray tpls =  json.getJSONArray("tpls");

		PageHeader pageHeader = new PageHeader();
		pageHeader.setShopId(shopId);
		pageHeader.setCreatedId(createdId);
		pageHeader.setPageType(7);
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
//				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
//				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				
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
				
				saveMap.put("pageHeader", pageHeader);
				//templateServcie.createGoodsDtlTemplate(pageHeader);
				blogService.createBlog(saveMap);
				
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
	
	public String modifyBlog(){
		
		System.out.println("jsonStr=" + jsonStr);
		Integer shopId = getBackSessionShopId();
		Integer createdId = 1;
		
		JSONObject json = JSONObject.fromObject(jsonStr);
		
		blogId = json.getInt("blogId");
		
		Map<String,Object> saveMap = new HashMap<String,Object>();
		
		saveMap.put("SHOP_ID", getBackSessionShopId());
		saveMap.put("BLOG_ID", blogId);
		saveMap.put("BLOG_GROUP_ID",JsonUtil.getInt(json,"blogGroup"));
		saveMap.put("BLOG_TITLE", JsonUtil.getString(json,"blogTitle"));
		saveMap.put("BLOG_DETAIL", JsonUtil.getString(json,"blogDetail"));
		saveMap.put("BLOG_FILE_ID", JsonUtil.getInt(json,"mainImgId"));
		saveMap.put("USER_ID", getBackSessionUserId());
		
		
		
		JSONArray tpls =  json.getJSONArray("tpls");

		PageHeader pageHeader = new PageHeader();
		pageHeader.setShopId(shopId);
		try {
			
			pageHeader.setPageId(json.getInt("pageId"));
		} catch (Exception e) {
			// TODO: handle exception
			System.err.print("pageid is nullllllllllllllllllllllllllllllllllllllllllllll");
		}
		pageHeader.setCreatedId(createdId);
		pageHeader.setPageType(7);
		pageHeader.setSkinType(1);
		pageHeader.setDisplayId(blogId);
		
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
//				pageDtl.setVal09(JsonUtil.getString(obj, "imgLeftName"));
//				pageDtl.setVal10(JsonUtil.getString(obj, "imgRightName"));
				
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
				
				saveMap.put("pageHeader", pageHeader);
				//templateServcie.createGoodsDtlTemplate(pageHeader);
				blogService.modifyBlog(saveMap);
				
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
	//打开积分设定弹窗
	public  String showPointPoupe() {
		shopId = getBackSessionShopId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		Map<String, Object> show =commonService.select("Blog.showPointPoupe", map);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("show", show);
		renderJSON(returnMap);

		return NONE;
	}
	
	//积分设定
	public  String pointSave() {
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		String ret = "success";
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("userId", userId);
			map.put("likePoint", likePoint);
			map.put("replyPoint", replyPoint);
			map.put("sharePoint", sharePoint);
			Map<String, Object> save =commonService.select("Blog.pointSave", map);
			if(save.size()==0){
				ret="fail";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);

		return NONE;
	}
	
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLikePoint() {
		return likePoint;
	}
	public void setLikePoint(String likePoint) {
		this.likePoint = likePoint;
	}
	public String getReplyPoint() {
		return replyPoint;
	}
	public void setReplyPoint(String replyPoint) {
		this.replyPoint = replyPoint;
	}
	public String getSharePoint() {
		return sharePoint;
	}
	public void setSharePoint(String sharePoint) {
		this.sharePoint = sharePoint;
	}
	public String getJsonStr() {
		return jsonStr;
	}

	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

}
