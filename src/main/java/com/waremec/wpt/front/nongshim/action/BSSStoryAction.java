package com.waremec.wpt.front.nongshim.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinBaseAction;
@Controller("bSSStoryAction")
@Scope(ScopeType.prototype)
public class BSSStoryAction extends WeixinBaseAction {
	
	private static final long serialVersionUID = 1L;
	
	public String bSSStory(){
		
		jsSdkStting();
		
		return "bSSStory";
	}
}
