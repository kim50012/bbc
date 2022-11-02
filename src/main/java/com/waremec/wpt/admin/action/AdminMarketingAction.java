/**   
* @Title: AdminMarketingAction.java 
* @Package com.waremec.wpt.admin.action 
* @Description:  
* @author taebem
* @date 2015年9月2日 下午2:02:00 
* @version V1.0   
*/
package com.waremec.wpt.admin.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;

/** 
 * @Package com.waremec.wpt.admin.action 
 * @FileName AdminMarketingAction
 * @Description  
 * @author taebem 
 * @date 2015年9月2日 下午2:02:00 
 *  
 */
@Controller("adminMarketingAction")
@Scope(ScopeType.prototype)
public class AdminMarketingAction extends BaseAction {
}
