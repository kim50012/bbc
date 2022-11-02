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
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.JsonUtil;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.RandomUtils;
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


@Controller("customEditorAction")
@Scope(ScopeType.prototype)
public class CustomEditorAction extends BaseAction {

	
	private String jsonStr = "";

	@Resource
	private TemplateServcie templateServcie;
	
	public String createEditor() {

	System.out.println("jsonStr=" + jsonStr);
	Integer shopId = getBackSessionShopId();
	Integer createdId = 1;
	
	JSONObject json = JSONObject.fromObject(jsonStr);
	
 
	JSONArray tpls =  json.getJSONArray("tpls");
	Integer pageType = JsonUtil.getInt(json, "pageType") ;

	PageHeader pageHeader = new PageHeader();
	pageHeader.setShopId(shopId);
	pageHeader.setCreatedId(createdId);
	pageHeader.setPageType(pageType);
	pageHeader.setSkinType(1);
	pageHeader.setPageNm(JsonUtil.getString(json, "pageNm"));

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
//			System.out.println(pageDtl.getTxt01());
			pageItem.getDetails().add(pageDtl);

			pageHeader.getItems().add(pageItem);
		}
	 }
	if (!pageHeader.getItems().isEmpty()) {
		try {
			
			Map<String,Object> pmap = new HashMap<String,Object>();
			pmap.put("pageHeader", pageHeader);
			templateServcie.createTemplatePage(pageHeader);
			
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
		map.put("err_msg", "无Template");
		renderJSON(map);
	}

	 
	return NONE;
}
	public String modifyEditor() {
		
		System.out.println("jsonStr=" + jsonStr);
		Integer shopId = getBackSessionShopId();
		Integer createdId = 1;
		
		JSONObject json = JSONObject.fromObject(jsonStr);
		Integer pageId = JsonUtil.getInt(json, "pageId");
		Integer pageType = JsonUtil.getInt(json, "pageType") ;
		
		JSONArray tpls =  json.getJSONArray("tpls");
		
		PageHeader pageHeader = new PageHeader();
		pageHeader.setShopId(shopId);
		pageHeader.setCreatedId(createdId);
		pageHeader.setPageId(pageId);
		pageHeader.setPageType(pageType);
		pageHeader.setSkinType(1);
		pageHeader.setPageNm(JsonUtil.getString(json, "pageNm"));
		
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
				pmap.put("pageHeader", pageHeader);
				templateServcie.modifyTemplatePage(pageHeader);
				
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
			map.put("err_msg", "无Template");
			renderJSON(map);
		}
		
		
		return NONE;
	}

	public String getJsonStr() {
		return jsonStr;
	}

	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}
	
	
}
