package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;

@Controller("loginAction")
@Scope(ScopeType.prototype)
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private String loginid;
	private String loginPassword;
	private String isSaveLoginid;

	 
	public String index() {

		session.clear();
	 
		return INDEX;
	}
	
	public String login() {
		return "login"  ;
	}
	
	
	public String login2() { 
		return "login2"  ;
	}
	 
	public String scheduler() {
		return "scheduler";
	}

	public String loginCheck() {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginid", loginid);
		map.put("loginPassword", loginPassword);

		Map<String, Object> rmap = commonService.select("Login.seleceById", map);

		if (rmap == null || rmap.isEmpty()) {

			Map<String, Object> rturnmap = new HashMap<String, Object>();
			rturnmap.put("type", "E");
			rturnmap.put("message", getLabel("Login error"));

			renderJSON(rturnmap);

		} else {
			Map<String, Object> rturnmap = new HashMap<String, Object>();
			rturnmap.put("type", "S");
			rturnmap.put("message", getLabel("Login successful"));

			renderJSON(rturnmap);
		}

		return NONE;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = DigestUtils.sha512Hex(loginPassword).toUpperCase();
	}

	public String getIsSaveLoginid() {
		return isSaveLoginid;
	}

	public void setIsSaveLoginid(String isSaveLoginid) {
		this.isSaveLoginid = isSaveLoginid;
	}

}
