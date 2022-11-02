package com.waremec.wpt.front.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;

@Controller("notFoundAction")
@Scope(ScopeType.prototype)
public class NotFoundAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Override
	public String execute() throws Exception {
		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<error404<<<<<<<<<<<<<<<<<<<<<<<");
		// TODO Auto-generated method stub
		return "error404";
	}
	 
}
