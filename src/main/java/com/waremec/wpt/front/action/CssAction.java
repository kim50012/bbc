package com.waremec.wpt.front.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;

@Controller("cssAction")
@Scope(ScopeType.prototype)
public class CssAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	public String skin() {
		return "skin";
	}
	public String skin1() {
		return "skin1";
	}
	public String skin2() {
		return "skin2";
	}
	public String skin3() {
		return "skin3";
	}
	public String skin4() {
		return "skin4";
	}
	public String skin5() {
		return "skin5";
	}
	public String skin6() {
		return "skin6";
	}
	public String skin7() {
		return "skin7";
	}
	public String skin8() {
		return "skin8";
	}
	public String skin9() {
		return "skin9";
	}
	public String skin10() {
		return "skin10";
	}

}
