package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.framework.utilities.StringUtil;

@Controller("adminI18nAction")
@Scope(ScopeType.prototype)
public class AdminI18nAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	// 存储店铺的ID
	private String shopId = "";
	// 存储用户的ID号
	private String userId = "";
	// LABEL_ID
	private String labelId = "";
	private String pageEntity = "";
	// 中文
	private String label_nm_cn = "";
	// 韩文
	private String label_nm_ko = "";
	// 英文
	private String label_nm_en = "";
	// 类型
	private String statusId = "";
	// 内容
	private String text = "";
	private String ko = "";

	public String i18nList() {
		userId = getBackSessionUserId();
		// 用户信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		Map<String, Object> user = commonService.select("InternationalManage.userSel", map);
		request.put("user", user);
		// 列表查询
		Map<String, Object> map1 = new HashMap<String, Object>();
		try {
			request.put("statusId", statusId);
			request.put("text", text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map1.put("labelId", StringUtil.emptyToNull(labelId));
		map1.put("label_nm_cn", StringUtil.emptyToNull(label_nm_cn));
		map1.put("label_nm_ko", StringUtil.emptyToNull(label_nm_ko));
		
		return "i18nList";
	}
	public String i18nListFragment() {
		userId = getBackSessionUserId();
		// 用户信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		Map<String, Object> user = commonService.select("InternationalManage.userSel", map);
		request.put("user", user);

		// 列表查询
		Map<String, Object> map1 = new HashMap<String, Object>();
		try {
			request.put("statusId", statusId);
			request.put("text", text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map1.put("labelId", StringUtil.emptyToNull(labelId));
		map1.put("label_nm_cn", StringUtil.emptyToNull(label_nm_cn));
		map1.put("label_nm_ko", StringUtil.emptyToNull(label_nm_ko));
		map1.put("pageCurr", pageCurr);
		map1.put("pageUnit", pageUnit);
		List<Map<String, Object>> list = commonService.selectList("InternationalManage.listSel", map1);
		PageData page = new PageData();
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TEMP_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		 
		}
	
		request.put("page", page);

		return "i18nListFragment";
	}

	public String save() {

		String ret = "success";
		// 保存
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			labelId = label_nm_cn;
			map.put("labelId", StringUtil.emptyToNull(labelId));
			map.put("label_nm_cn", StringUtil.emptyToNull(label_nm_cn));
			map.put("label_nm_ko", StringUtil.emptyToNull(label_nm_ko));
			commonService.select("InternationalManage.save", map);
		} catch (Exception e) {
			ret = "fail";
			e.printStackTrace();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		if (returnMap.get("result").equals("success")) {

			LabelUtil.reloadLabel(getServletContext());
		}
		
		renderJSON(returnMap);
		
		return NONE;
	}

	public String update() {
		
		String ret = "success";
		// 保存
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("labelId", StringUtil.emptyToNull(labelId));
			map.put("label_nm_cn", StringUtil.emptyToNull(label_nm_cn));
			map.put("label_nm_ko", StringUtil.emptyToNull(label_nm_ko));
			ko = "Y";
			map.put("ko", StringUtil.emptyToNull(ko));
			commonService.select("InternationalManage.save", map);
		} catch (Exception e) {
			ret = "fail";
			e.printStackTrace();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		if (returnMap.get("result").equals("success")) {

			LabelUtil.reloadLabel(getServletContext());
		}

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

	public String getLabelId() {
		return labelId;
	}

	public void setLabelId(String labelId) {
		this.labelId = labelId;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getLabel_nm_cn() {
		return label_nm_cn;
	}

	public void setLabel_nm_cn(String label_nm_cn) {
		this.label_nm_cn = label_nm_cn;
	}

	public String getLabel_nm_ko() {
		return label_nm_ko;
	}

	public void setLabel_nm_ko(String label_nm_ko) {
		this.label_nm_ko = label_nm_ko;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getLabel_nm_en() {
		return label_nm_en;
	}

	public void setLabel_nm_en(String label_nm_en) {
		this.label_nm_en = label_nm_en;
	}

	public String getKo() {
		return ko;
	}

	public void setKo(String ko) {
		this.ko = ko;
	}

}
