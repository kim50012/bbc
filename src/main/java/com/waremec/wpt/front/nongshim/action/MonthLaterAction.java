/**   
* @Title: MonthLaterAction.java 
* @Package com.waremec.wpt.front.nongshim.action 
* @Description:  
* @author taebem
* @date 2015年6月11日 下午3:07:40 
* @version V1.0   
*/
package com.waremec.wpt.front.nongshim.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;

/** 
 * @Package com.waremec.wpt.front.nongshim.action 
 * @FileName MonthLaterAction
 * @Description  
 * @author taebem 
 * @date 2015年6月11日 下午3:07:40 
 *  
 */
@Controller("monthLaterAction")
@Scope(ScopeType.prototype)
public class MonthLaterAction extends WeixinBaseAction {
	
	private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private int shopId;
	private String bbsType;
	
	public String participate(){ 
		
		jsSdkStting();
		
		int custSysId=0;
		SessionMember sessMember=getSessionMember();
		Map<String, Object> map = new HashMap<String, Object>();
		int pageCurr = IntegerUtils.valueOf(getRequest().getParameter("pageCurr"),1);
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", pageCurr*5);
		map.put("ORDERBY", null);
//		map.put("BBS_TYPE", 1);
		map.put("BBS_TYPE", 3);
		List<Map<String, Object>> list = commonService.selectList("NewsFeedNongshim.bbsList", map);
		map.put("PARENT_ID", 0);
		List<Map<String, Object>> publishList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		map.put("PAGE_UINT", 99999);
		map.put("PARENT_ID", 1);
		List<Map<String, Object>> replyList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		request.put("list", list);
		request.put("publishList", publishList);
		request.put("replyList", replyList);
		if(publishList.size()>0){
			int totalCount=(Integer)(publishList.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount/5==0?totalCount/5:totalCount/5+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		if(sessMember!=null){
			custSysId=sessMember.getCustSysId();
		}
		request.put("custSysId", custSysId);
		map.put("CUST_SYS_ID", custSysId);
    	Map<String,Object> custMap = commonService.select("BBS.getCustDetail",map);
    	String nickName = "无名氏";
    	if(custMap!=null){
    		nickName = custMap.get("CUST_NICK_NM").toString();
    	}
    	request.put("nickName", nickName);
		return "participate";
	}
	
	public String participate2(){
		
		jsSdkStting();
		
		int custSysId=0;
		SessionMember sessMember=getSessionMember();
		int pageCurr = IntegerUtils.valueOf(getRequest().getParameter("pageCurr"),1);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", pageCurr*5);
		map.put("ORDERBY", null);
//		map.put("BBS_TYPE", 1);
		map.put("BBS_TYPE", 2);
		List<Map<String, Object>> list = commonService.selectList("NewsFeedNongshim.bbsList", map);
		map.put("PARENT_ID", 0);
		List<Map<String, Object>> publishList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		map.put("PAGE_UINT", 99999);
		map.put("PARENT_ID", 1);
		List<Map<String, Object>> replyList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		request.put("list", list);
		request.put("publishList", publishList);
		request.put("replyList", replyList);
		if(publishList.size()>0){
			int totalCount=(Integer)(publishList.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount/5==0?totalCount/5:totalCount/5+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		if(sessMember!=null){
			custSysId=sessMember.getCustSysId();
		}
		request.put("custSysId", custSysId);
		map.put("CUST_SYS_ID", custSysId);
    	Map<String,Object> custMap = commonService.select("BBS.getCustDetail",map);
    	String nickName = "无名氏";
    	if(custMap!=null){
    		nickName = custMap.get("CUST_NICK_NM").toString();
    	}
    	request.put("nickName", nickName);
		return "participate2";
	}
	
	public String getNextPage(){
		
//		SessionMember sessionMember = getSessionMember();
		Map<String, Object> map = new HashMap<String, Object>();
//		int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", pageCurr);
		map.put("PAGE_UINT", pageUnit);
		map.put("ORDERBY", null);
		map.put("PARENT_ID", 0);
		map.put("BBS_TYPE", bbsType);
//		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> list= commonService.selectList("NewsFeedNongshim.bbsList", map);
		
		if(list.size()>0){
			int listSize=list.size();
			int totalCount=(Integer)(list.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount/pageUnit==0?totalCount/pageUnit:totalCount/pageUnit+1;
			if(pageCurr<totalPage){
				renderJSON(list);
			}else if(pageCurr==totalPage){
				int lastPageCount=totalCount%pageUnit;
				if(lastPageCount==1){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==2){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==3){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==4){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}
				
			}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
			}
			request.put("pageCount", totalPage);
		}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
		}
		
		return NONE;
	}
	
	//获取分页的评论内容
	public String getNextPageReply(){
		
//		SessionMember sessionMember = getSessionMember();
		Map<String, Object> map = new HashMap<String, Object>();
//		int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999999);
		map.put("ORDERBY", null);
		map.put("PARENT_ID", 1);
		map.put("BBS_TYPE", bbsType);
//		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> list= commonService.selectList("NewsFeedNongshim.bbsList", map);
		renderJSON(list);
		return NONE;
	}
	
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public String getBbsType() {
		return bbsType;
	}
	public void setBbsType(String bbsType) {
		this.bbsType = bbsType;
	}
}
