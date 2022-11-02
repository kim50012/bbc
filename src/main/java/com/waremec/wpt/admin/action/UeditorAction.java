package com.waremec.wpt.admin.action;

import java.io.UnsupportedEncodingException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;

@Controller("ueditorAction")
@Scope(ScopeType.prototype)
public class UeditorAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	public String controller() throws UnsupportedEncodingException {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>");
		return "controller";
	}

}
