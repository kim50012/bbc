/**   
* @Title: Event00017Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年9月11日 下午1:05:02 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.domain.user.SessionMember;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00017Action
 * @Description  
 * @author taebem 
 * @date 2015年9月11日 下午1:05:02 
 *  
 */
@Controller("event00017Action")
@Scope(ScopeType.prototype)
public class Event00017Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	
	public String appDownload(){
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		int loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		request.put("loginFlag", loginFlag);
		return "appDownload";
	}
}
