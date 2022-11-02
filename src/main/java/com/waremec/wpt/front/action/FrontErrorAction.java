package com.waremec.wpt.front.action;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;


@Controller("frontErrorAction")
@Scope(ScopeType.prototype)
public class FrontErrorAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	public String timeout(){
		return "timeout";
	}
	
	public String follow(){
		System.err.print("follow>>>>>>>>>>>>>>>>>>>>>>");
		return "follow";
	}
}
