package com.waremec.framework.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

@Controller("labelAction")
@Scope(ScopeType.prototype)
public class LabelAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	public String reloadLabel(){
		return "reloadLabel";
	}

	
	public String showLabel(){
		return "showLabel";
	}
}
