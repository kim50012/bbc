/**   
* @Title: Event00006Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年5月26日 下午4:42:04 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00006Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:42:04 
 *  
 */
@Controller("event00006Action")
@Scope(ScopeType.prototype)
public class Event00006Action  extends EventBaseAction {

	private static final long serialVersionUID = 1L;

}