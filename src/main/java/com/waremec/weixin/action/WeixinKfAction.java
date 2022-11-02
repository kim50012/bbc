package com.waremec.weixin.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;


/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinKfAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:04:55 
*  
*/
@Controller("wixinKfAction")
@Scope(ScopeType.prototype)
public class WeixinKfAction extends WeixinBaseAction{
 

	public String plugin1(){
		return "plugin1";
	}
	
	
	public String ivrplugin(){
		return "ivrplugin";
	}
	public String custplugin(){
		return "custplugin";
	}
}
