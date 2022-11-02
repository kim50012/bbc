/**   
 * @Title: AdminWeixinDkfAction.java 
 * @Package com.waremec.wpt.admin.action 
 * @Description:  
 * @author taebem
 * @date 2015年9月23日 上午11:01:53 
 * @version V1.0   
 */
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
import com.waremec.weixin.action.WeixinBaseAction;

/**
 * @Package com.waremec.wpt.admin.action
 * @FileName AdminWeixinDkfAction
 * @Description
 * @author taebem
 * @date 2015年9月23日 上午11:01:53
 * 
 */
@Controller("adminWeixinDkfAction")
@Scope(ScopeType.prototype)
public class AdminWeixinDkfAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
	
	public String dkfList(){
		return "dkfList";
	}
	public String dkfListFragment(){
		
		Integer shopId = getBackSessionShopId();
		String kf_id = getRequest().getParameter("kf_id");
		String kf_nick = getRequest().getParameter("kf_nick");
		String kf_account = getRequest().getParameter("kf_account");
		 
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("KF_ID", kf_id);
		map.put("KF_NICK", kf_nick);
		map.put("KF_ACCOUNT", kf_account);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		
		List<Map<String,Object>> dkfList = commonService.selectList("WeixinCustom.WX_DKF_USER_SELECT", map);
		
		//分页
		PageData page = new PageData();
		if (!dkfList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(dkfList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , dkfList);
		}
		
		request.put("page", page);
		
		
		return "dkfListFragment";
	}
	
	public String dkfAdd(){
		Integer shopId = getBackSessionShopId();
		String wechatNo = weixinService.getWechatNoByShopId(shopId);
		
		logger.info("wechatNo==" + wechatNo);
		request.put("wechatNo", wechatNo);
		
		return "dkfAdd";
	}
}
