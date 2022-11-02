package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;

@Controller("adminCodeAction")
@Scope(ScopeType.prototype)
public class AdminCodeAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	// 存储店铺ID
	private String shopId = "";
	// 存储用户的Id
	private String userId = "";
	// 字段名
	private String fdNm = "";
	// 内容
	private String cdDesc = "";

	private String tbNm = "";
	private String cdVal = "";
	private String cdId = "";
	private String isDelete = "";

	private String jobType = "";
	private String pageEntity = "";
	private String status = "";

	public String codeList() {
		userId = getBackSessionUserId();
		// 用户信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		Map<String, Object> user = commonService.select("Code.userSel", map);
		request.put("user", user);
		// 查询出所有的字段名
		List<Map<String, Object>> allFdNm = commonService.selectList("Code.FD_NM_LIST", map);
		request.put("allFdNm", allFdNm);
		// list
		Map<String, Object> mapList = new HashMap<String, Object>();
		mapList.put("shopId", null);
		mapList.put("fdNm", StringUtil.emptyToNull(fdNm));
		mapList.put("cdDesc", StringUtil.emptyToNull(cdDesc));
		if(!status.equals("")){
			mapList.put("isDelete", status);
		}
		
		mapList.put("pageCurr", pageCurr);
		mapList.put("pageUnit", pageUnit);
		List<Map<String, Object>> list = commonService.selectList("Code.bbsTypeList", mapList);
		request.put("list", list);
		request.put("fdNm", fdNm);
		request.put("cdDesc", cdDesc);

		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("NUM");
			page = new PageData(pageCurr, pageUnit, totalCount, list);

		}

		request.put("page", page);

		return "codeList";
	}

	public String codeListFragment() {
		userId = getBackSessionUserId();
		// 用户信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		Map<String, Object> user = commonService.select("Code.userSel", map);
		request.put("user", user);
		// 查询出所有的字段名
		List<Map<String, Object>> allFdNm = commonService.selectList("Code.FD_NM_LIST", map);
		request.put("allFdNm", allFdNm);
		// list
		Map<String, Object> mapList = new HashMap<String, Object>();
		mapList.put("shopId", null);
		mapList.put("fdNm", StringUtil.emptyToNull(fdNm));
		mapList.put("cdDesc", StringUtil.emptyToNull(cdDesc));
		if(!status.equals("")){
			mapList.put("isDelete", status);
		}
		mapList.put("pageCurr", pageCurr);
		mapList.put("pageUnit", pageUnit);
		List<Map<String, Object>> list = commonService.selectList("Code.bbsTypeList", mapList);
		request.put("list", list);
		request.put("fdNm", fdNm);
		request.put("cdDesc", cdDesc);

		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("NUM");
			page = new PageData(pageCurr, pageUnit, totalCount, list);

		}

		request.put("page", page);

		return "codeListFragment";
	}

	// 保存
	public String save() {
		String ret = "success";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("jobType", jobType);
			map.put("cdId", StringUtil.emptyToNull(cdId));
			map.put("cdVal", cdVal);
			map.put("tbNm", tbNm);
			map.put("fdNm", fdNm);
			map.put("cdDesc", cdDesc);
			Map<String, Object> save = commonService.select("Code.save", map);
		} catch (Exception e) {
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	// 公告类型删除
	public String delete() {
		String ret = "success";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("jobType", jobType);
			map.put("cdId", cdId);
			map.put("isDelete", isDelete);
			map.put("tbNm", tbNm);
			map.put("fdNm", fdNm);
			commonService.select("Code.save", map);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
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

	public String getFdNm() {
		return fdNm;
	}

	public void setFdNm(String fdNm) {
		this.fdNm = fdNm;
	}

	public String getCdDesc() {
		return cdDesc;
	}

	public void setCdDesc(String cdDesc) {
		this.cdDesc = cdDesc;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getTbNm() {
		return tbNm;
	}

	public void setTbNm(String tbNm) {
		this.tbNm = tbNm;
	}

	public String getCdVal() {
		return cdVal;
	}

	public void setCdVal(String cdVal) {
		this.cdVal = cdVal;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getCdId() {
		return cdId;
	}

	public void setCdId(String cdId) {
		this.cdId = cdId;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
