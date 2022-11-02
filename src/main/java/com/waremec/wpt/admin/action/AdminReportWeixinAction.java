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
@Controller("adminReportWeixinAction")
@Scope(ScopeType.prototype)
public class AdminReportWeixinAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String shopId="";
	//存储用户的Id
	private String userId="";
	private String beginDate="";
	private String endDate="";
	private String title="";
	private String msgId="";
	private String wxMsgId="";
	/**
	 * 修改ID的action方法
	 * @return
	 */
	public String newsInterfaceModifyId(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("msgId", msgId);
		map.put("wxMsgId", wxMsgId);
		Map<String,Object> mapResult=commonService.select("NewsInterfaceList.updateNewsInterfaceId", map);
		String ret="success";
		if(mapResult.isEmpty()){
			ret="fail";
		}else{
			String outMsgId=(String) mapResult.get("OUT_ERR_MSG");
			if("S".equals(outMsgId) || outMsgId=="S"){
				ret="success";
			}else{
				ret="fail";
			}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String newsInterfaceListFrament(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			map.put("shopId",shopId);
			map.put("title", StringUtil.emptyToNull(title));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("pageCurr",pageCurr);
			map.put("pageUnit", pageUnit);
		}catch(Exception e){
			e.printStackTrace();
		}
		List<Map<String,Object>> list=commonService.selectList("NewsInterfaceList.getNewsInterfaceList", map);
		request.put("list", list);
		request.put("beginDate", beginDate);
		request.put("endDate",endDate );
		request.put("title",title );
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		return "newsInterfaceListFrament";
	}
	//打开图文消息接口页面
	public String newsInterfaceList(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			map.put("shopId",shopId);
			map.put("title", StringUtil.emptyToNull(title));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("pageCurr",pageCurr);
			map.put("pageUnit", pageUnit);
		}catch(Exception e){
			e.printStackTrace();
		}
		List<Map<String,Object>> list=commonService.selectList("NewsInterfaceList.getNewsInterfaceList", map);
		request.put("list", list);
		request.put("beginDate", beginDate);
		request.put("endDate",endDate );
		request.put("title",title );
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		return "newsInterfaceList";
	}
	/**
	 * 打开选择修改图文消息接口Id的页面
	 * @return
	 */
	public String updateNewsInterface(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("NewsInterfaceList.updateNewsInterface", map);
		request.put("list", list);
		int pageUnitCount=0;//(Integer) mapCount.get("COUNT_NUM");
		if(!list.isEmpty()){
			pageUnitCount=(Integer) list.get(0).get("TOTAL_CNT");
		}
		int pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
		request.put("pageCount", pageCount);
		request.put("pageCurr",pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUnitCount", pageUnitCount);
		return "updateNewsInterface";
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getWxMsgId() {
		return wxMsgId;
	}
	public void setWxMsgId(String wxMsgId) {
		this.wxMsgId = wxMsgId;
	}
}
