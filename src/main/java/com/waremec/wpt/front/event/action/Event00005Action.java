/**   
* @Title: Event00005Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年5月26日 下午4:41:46 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00005Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:41:46 
 *  
 */
@Controller("event00005Action")
@Scope(ScopeType.prototype)
public class Event00005Action  extends EventBaseAction {

	private static final long serialVersionUID = 1L;

}