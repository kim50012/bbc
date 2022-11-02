package com.waremec.wpt.admin.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;

@Controller("adminReportOrderAction")
@Scope(ScopeType.prototype)
public class AdminReportOrderAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	// 存储店铺ID
	private String shopId = "";
	// 存储用户的Id
	private String userId = "";
	private String startDate = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date((new Date()).getTime() - 1000 * 60 * 60 * 24 * 6));
	private String endDate = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date());

	public String summary() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("jobType", "A");
		List<Map<String, Object>> list = commonService.selectList("OrderBaseCount.selectOrderCountList", map);
		request.put("list", list);
		Map<String, Object> mapOne = commonService.select("OrderBaseCount.selectAllCount", map);
		request.put("startDate", startDate);
		request.put("mapOne", mapOne);
		request.put("endDate", endDate);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, list);

		}
		request.put("page", page);
		
		return "summary";
	}

	public String summaryFragment() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("jobType", "A");
		List<Map<String, Object>> list = commonService.selectList("OrderBaseCount.selectOrderCountList", map);
		request.put("list", list);
		Map<String, Object> mapOne = commonService.select("OrderBaseCount.selectAllCount", map);
		request.put("startDate", startDate);
		request.put("mapOne", mapOne);
		request.put("endDate", endDate);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr, pageUnit, totalCount, list);

		}
		request.put("page", page);
		return "summaryFragment";
	}

	public String getPageMessage() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("jobType", "A");
		List<Map<String, Object>> list = commonService.selectList("OrderBaseCount.selectOrderCountList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int totalPageCount = 0;
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			totalPageCount = totalCount / pageUnit + (totalCount % pageUnit == 0 ? 0 : 1);
		}
		returnMap.put("list", list);
		returnMap.put("totalPageCount", totalPageCount);
		renderJSON(returnMap);
		return NONE;
	}

	public String getSevenMsg() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String, Object>> list = commonService.selectList("OrderBaseCount.selectOrderCountList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
