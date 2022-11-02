package com.waremec.wpt.front.nongshim.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;

@Controller("indexNongshimAction")
@Scope(ScopeType.prototype)
public class IndexNongshimAction extends WeixinBaseAction {
	
	private static final long serialVersionUID = 1L;
	
	public String indexNongshim(){
		
		jsSdkStting();
		
		return "indexNongshim";
	}
}
