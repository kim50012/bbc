/**   
* @Title: SSGAction.java 
* @Package com.waremec.wpt.front.action 
* @Description:  
* @author taebem
* @date 2015年8月26日 上午10:52:56 
* @version V1.0   
*/
package com.waremec.weixin.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinBaseAction;

/** 
 * @Package com.waremec.wpt.front.action 
 * @FileName SSGAction
 * @Description  
 * @author taebem 
 * @date 2015年8月26日 上午10:52:56 
 *  
 */
@Controller("outerSiteAction")
@Scope(ScopeType.prototype)
public class OuterSiteAction  extends WeixinBaseAction{

	public String to(){
		
		return "to";
	}
	
}
