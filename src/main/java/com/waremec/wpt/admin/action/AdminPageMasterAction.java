package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.domain.AdminOrders;

@Controller("adminPageMasterAction")
@Scope(ScopeType.prototype)
public class AdminPageMasterAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	//存储店铺ID
	private String shopId="";
	//存储用户的Id
	private String userId="";
	private String pageNm="";
	private String pageGroup="";
	private String jobType="";
	private String pageTp="";
	private String pageUrl="";
	private String isDelete="";
	private String createdDt="";
	private String pageGroup2="";
	
	public String pageList() {
		userId = getBackSessionUserId();
		// list
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNm",  StringUtil.emptyToNull(pageNm));
		map.put("pageGroup",  StringUtil.emptyToNull(pageGroup));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String, Object>> list = commonService.selectList("PageManage.list", map);
		request.put("list", list);	
		//查询出所有的PAGE_GROUP
		List<Map<String, Object>> allPageGroup = commonService.selectList("PageManage.PAGE_GROUP_LIST", map);
		request.put("allPageGroup", allPageGroup);	
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		return "pageList";
	}
	public String pageListFragment() {
		userId = getBackSessionUserId();
		// list
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNm",  StringUtil.emptyToNull(pageNm));
		map.put("pageGroup",  StringUtil.emptyToNull(pageGroup));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String, Object>> list = commonService.selectList("PageManage.list", map);
		request.put("list", list);	
		//查询出所有的PAGE_GROUP
		List<Map<String, Object>> allPageGroup = commonService.selectList("PageManage.PAGE_GROUP_LIST", map);
		request.put("allPageGroup", allPageGroup);	
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		return "pageListFragment";
	}
	
	//保存
	public String save() {
		boolean success = true;
		String err_msg = "";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("jobType", jobType);
			map.put("pageTp", StringUtil.emptyToNull(pageTp));
			map.put("pageNm", StringUtil.emptyToNull(pageNm));
			map.put("pageUrl", StringUtil.emptyToNull(pageUrl));
			map.put("isDelete", StringUtil.emptyToNull(isDelete));
			map.put("createdDt", StringUtil.emptyToNull(createdDt));
			map.put("pageGroup", StringUtil.emptyToNull(pageGroup));
			map.put("pageGroup2", StringUtil.emptyToNull(pageGroup2));
			
			Map<String, Object> save=commonService.select("PageManage.save", map);

		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);
		return NONE;
	}
	//删除
	public String delete() {
		boolean success = true;
		String err_msg = "";
		try{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("jobType", jobType);
		map.put("pageTp", pageTp);
		map.put("isDelete", isDelete);
		commonService.select("PageManage.save",map);
		}catch(Exception e){
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
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
	public String getPageNm() {
		return pageNm;
	}
	public void setPageNm(String pageNm) {
		this.pageNm = pageNm;
	}
	public String getPageGroup() {
		return pageGroup;
	}
	public void setPageGroup(String pageGroup) {
		this.pageGroup = pageGroup;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getPageTp() {
		return pageTp;
	}
	public void setPageTp(String pageTp) {
		this.pageTp = pageTp;
	}
	public String getPageUrl() {
		return pageUrl;
	}
	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getPageGroup2() {
		return pageGroup2;
	}
	public void setPageGroup2(String pageGroup2) {
		this.pageGroup2 = pageGroup2;
	}
	
}
