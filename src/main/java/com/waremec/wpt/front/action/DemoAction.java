package com.waremec.wpt.front.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;

@Controller("demoAction")
@Scope(ScopeType.prototype)
public class DemoAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	 
	public String index() {

		System.out.println("--------------");
		return INDEX;
	}

	public String demo() {

		System.out.println("--------------");
		return "demo";
	}

}
