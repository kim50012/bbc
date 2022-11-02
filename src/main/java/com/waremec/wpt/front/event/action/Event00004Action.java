/**   
* @Title: Event00004Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年5月26日 下午4:40:12 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00004Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:40:12 
 *  
 */
@Controller("event00004Action")
@Scope(ScopeType.prototype)
public class Event00004Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;
	
	
	private String eventStartDate = "20150525000000"; 
	private String eventEndDate   = "20150526235959";  
	
	
	public String index() {

		jsSdkStting();
		eventInit();
		
		Integer eventStatus = getEventStatus(eventStartDate, eventEndDate);
		
		request.put(EVENT_STATUS, getEventStatus(eventStartDate, eventEndDate));

		return "index";
	}

}
