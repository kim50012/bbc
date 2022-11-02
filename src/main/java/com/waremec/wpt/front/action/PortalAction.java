package com.waremec.wpt.front.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;

@Controller("portalAction")
@Scope(ScopeType.prototype)
public class PortalAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	 
	
	

	@Override
	public String execute() throws Exception {
		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<PortalAction<<<<<<<<<<<<<<<<<<<<<<<<<");
		// TODO Auto-generated method stub
		return super.execute();
	}
	public String index() {
	 
		System.out.println("--------------");
		request.put("selectedId", 1);
		return INDEX;
	}
	public String example() {
		request.put("selectedId", 2);
		return "example";
	}
	public String facilitator() {
		request.put("selectedId", 3);
		return "facilitator";
	}
	public String aboutUs() {
		request.put("selectedId", 4);
		return "aboutUs";
	}
	public String newActive() {
		request.put("selectedId", 5);
		return "newActive";
	}
	public String sprogRead() {
		request.put("selectedId", 6);
		return "sprogRead";
	}
}
