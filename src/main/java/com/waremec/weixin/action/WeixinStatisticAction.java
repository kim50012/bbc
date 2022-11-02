/**   
* @Title: WeixinStatisticAction.java 
* @Package com.waremec.weixin.action 
* @Description:  
* @author taebem
* @date 2015年6月24日 下午2:49:29 
* @version V1.0   
*/
package com.waremec.weixin.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.AppInfo;

/** 
 * @Package com.waremec.weixin.action 
 * @FileName WeixinStatisticAction
 * @Description  
 * @author taebem 
 * @date 2015年6月24日 下午2:49:29 
 *  
 */
@Controller("weixinStatisticAction")
 @Scope(ScopeType.prototype)
public class WeixinStatisticAction extends WeixinBaseAction {

	public String sync(){
		
	try {
		String type  = getRequest().getParameter("type");
		Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		String begin_date =  getRequest().getParameter("startDate");  
		String end_date =  getRequest().getParameter("endDate");  
		
		if(shopId != null){
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			
			switch (type) {
			case "101":
				weixinStatisticService.syncUserSummary(appInfo, begin_date, end_date);
				break;
			case "102":
				weixinStatisticService.syncUserCumulate(appInfo, begin_date, end_date);
				break;
			case "201":
				weixinStatisticService.syncArticleSummary(appInfo, begin_date, end_date);
				break;
			case "202":
				weixinStatisticService.syncArticleTotal(appInfo, begin_date, end_date);
				break;
			case "203":
				weixinStatisticService.syncUserRead(appInfo, begin_date, end_date);
				break;
			case "204":
				weixinStatisticService.syncUserReadHour(appInfo, begin_date, end_date);
				break;
			case "205":
				weixinStatisticService.syncUserShare(appInfo, begin_date, end_date);
				break;
			case "206":
				weixinStatisticService.syncUserShareHour(appInfo, begin_date, end_date);
				break;
			case "301":
				weixinStatisticService.syncUpstreamMsg(appInfo, begin_date, end_date);
				break;
			case "302":
				weixinStatisticService.syncUpstreamMsgHour(appInfo, begin_date, end_date);
				break;
			case "303":
				weixinStatisticService.syncUpstreamMsgWeek(appInfo, begin_date, end_date);
				break;
			case "304":
				weixinStatisticService.syncUpstreamMsgMonth(appInfo, begin_date, end_date);
				break;
			case "305":
				weixinStatisticService.syncUpstreamMsgDist(appInfo, begin_date, end_date);
				break;
			case "306":
				weixinStatisticService.syncUpstreamMsgDistWeek(appInfo, begin_date, end_date);
				break;
			case "307":
				weixinStatisticService.syncUpstreamMsgDistMonth(appInfo, begin_date, end_date);
				break;
			case "401":
				weixinStatisticService.syncInterfaceSummary(appInfo, begin_date, end_date);
				break;
			case "402":
				weixinStatisticService.syncInterfaceSummaryHour(appInfo, begin_date, end_date);
				break;
			default:
				break;
			}
			
			
		}
		request.put("success", true);
	} catch (Exception e) {
		// TODO: handle exception
		request.put("success", false);
		request.put("err_msg", e.getMessage());
		
	} 	
		
	   System.out.println("========================");
	   
		return "sync";
	}
	public String index(){
	 
		List<AppInfo> appInfoList = weixinService.selectAllAppInfoList();
		request.put("appInfoList", appInfoList);
		
		return "index";
	}
	
}
