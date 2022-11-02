/**   
* @Title: Event00018Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年9月11日 下午1:05:14 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00018Action
 * @Description  
 * @author taebem 
 * @date 2015年9月11日 下午1:05:14 
 *  
 */
@Controller("event00018Action")
@Scope(ScopeType.prototype)
public class Event00018Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
}
