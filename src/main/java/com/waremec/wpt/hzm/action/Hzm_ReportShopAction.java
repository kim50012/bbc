package com.waremec.wpt.hzm.action;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.framework.utilities.StringUtil;

@Controller("hzmReportShopAction")
@Scope(ScopeType.prototype)
public class Hzm_ReportShopAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private Integer shopId ;
	private String userId="";
	private String startDate=(new SimpleDateFormat("yyyy-MM-dd")).format(new Date((new Date()).getTime() - 1000 * 60 * 60 * 24 * 6));
	private String endDate=(new SimpleDateFormat("yyyy-MM-dd")).format(new Date());
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	
	 */
	public String hzm_List() {
		Map<String,Object> map=new HashMap<String,Object>();
		shopId = getBackSessionShopId();
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("shopId", shopId);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("jobType", "A");
		Map<String,Object> countMap=commonService.select("GoodsCurrent.selectCountCurrent", map);
		Map<String,Object> userMap=commonService.select("GoodsCurrent.selectShopMessage", map);
		List<Map<String,Object>> list=commonService.selectList("GoodsCurrent.selectOrderBaseCount", map);
		request.put("countMap", countMap);
		request.put("userMap", userMap);

		PageData page = new PageData();
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		return "hzm_List";
	}
	
	public String hzm_ListFragment() {
		Map<String,Object> map=new HashMap<String,Object>();
		shopId = getBackSessionShopId();
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("shopId", shopId);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("jobType", "A");
		Map<String,Object> countMap=commonService.select("GoodsCurrent.selectCountCurrent", map);
		Map<String,Object> userMap=commonService.select("GoodsCurrent.selectShopMessage", map);
		List<Map<String,Object>> list=commonService.selectList("GoodsCurrent.selectOrderBaseCount", map);
		request.put("countMap", countMap);
		request.put("userMap", userMap);

		PageData page = new PageData();
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		 
		}
		
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		return "hzm_ListFragment";
	}
	
	//获取分页的信息
	public String getPageMessage(){
		Map<String,Object> map=new HashMap<String,Object>();
		shopId = getBackSessionShopId();
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("shopId", shopId);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("GoodsCurrent.selectOrderBaseCount", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int totalPageCount=0;
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
			totalPageCount=totalCount/pageUnit+(totalCount%pageUnit==0?0:1);
		}
		returnMap.put("list", list);
		returnMap.put("totalPageCount", totalPageCount);
		renderJSON(returnMap);
		return NONE;
	}
	//获取趋势图所需要的信息
	public String hzm_GetSevenMsg() throws ParseException{
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		
		if (StringUtils.isBlank(startDate)) {
			try {
				startDate = DateUtil.getAddDay(DateUtil.DEFAULT_DATE, -30).substring(0, 10);
			} catch (ParseException e) {
			}
			endDate = DateUtil.today();
		}
		
				
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("jobType", "S");
		List<Map<String,Object>> list=commonService.selectList("GoodsCurrent.selectCountCurrent", map);
		
		//查询出两个时间段中的所有日期
		Calendar startCalendar = Calendar.getInstance();
        Calendar endCalendar = Calendar.getInstance();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date data = df.parse(startDate);
        Calendar cal=Calendar.getInstance();
        cal.setTime(data);
        cal.add(Calendar.DATE, -1);  //减1天
        Date start =cal.getTime();
        startCalendar.setTime(start);
        Date end = df.parse(endDate);
        endCalendar.setTime(end);
        ArrayList<String> arr = new ArrayList<String>();
        while(true){
            startCalendar.add(Calendar.DAY_OF_MONTH, 1);
            if(startCalendar.getTimeInMillis() <= endCalendar.getTimeInMillis()){//TODO 转数组或是集合
            	arr.add(df.format(startCalendar.getTime()));
        }else{
            break;
        }
       }
		
        
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("arr", arr);
		renderJSON(returnMap);
		
		
		return NONE;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
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
