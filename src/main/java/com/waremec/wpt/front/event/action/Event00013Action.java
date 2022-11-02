/**   
* @Title: Event00013Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年9月11日 下午1:04:15 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.domain.user.SessionMember;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00013Action
 * @Description  
 * @author taebem 
 * @date 2015年9月11日 下午1:04:15 
 *  
 */
@Controller("event00013Action")
@Scope(ScopeType.prototype)
public class Event00013Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	private String shopId="";
	public String getPacket(){
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		int loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		request.put("loginFlag", loginFlag);
		return "getPacket";
	}
	public String checkLogin(){
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		int loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		request.put("loginFlag", loginFlag);
		return "checkLogin";
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
}
