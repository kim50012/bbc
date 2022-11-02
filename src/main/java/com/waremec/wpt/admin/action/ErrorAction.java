package com.waremec.wpt.admin.action;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;


@Controller("errorAction")
@Scope(ScopeType.prototype)
public class ErrorAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	public String timeout(){
		return "timeout";
	}
}
