/**   
* @Title: Event00021Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.domain.user.SessionMember;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00020Action
 * @Description  
 *  
 */
@Controller("event00037Action")
@Scope(ScopeType.prototype)
public class Event00037Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	
	private String	 cust_nm;
	private String adr_detail;
	private String email;
	private int custSysId;
	private Integer shopId;
	private String openId;
	
	
	/**
	 * 主页
	 */
	public String index() {
		
		jsSdkWithEventSttingNotOpenid();
		eventInit();
		SessionMember sessionMember = getSessionMember();
//		System.out.println("sessionMember===========" + sessionMember);
		boolean isflow = false;
		
		if(sessionMember != null){
			isflow=true;
			request.put("custSysId", sessionMember.getCustSysId());
		}else{
			request.put("custSysId", 000000);
		}
		
		request.put("isflow", isflow);
		return "index";
	}
	
	
	/**
	 * 保存
	 * @return
	 */
	public String uploadWithUserIcon(){
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			
			parmsMap.put("shopId", shopId);
			parmsMap.put("cust_sys_id", custSysId);
			parmsMap.put("event_id", getId());
			parmsMap.put("cust_nm", cust_nm);
			parmsMap.put("adr_detail", adr_detail);
			parmsMap.put("email", email);
			Map<String, Object> resultMap = eventService.select("Event.SHOP_EVENT_ENTRY_USER_INSERT",parmsMap);
			if(resultMap.get("OUT_ERR_MSG").toString().trim().equals("S")){
				
				returnMap.put("success", SUCCESS);
				
			} else if(resultMap.get("OUT_ERR_MSG").toString().trim().equals("E")){
				
				returnMap.put("error", ERROR);
				returnMap.put("err_msg", "保存信息错误..");
				
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
//		System.out.println(returnMap.toString());
		
		renderJSON(returnMap);
		return NONE;
	}

	
	public String getCust_nm() {
		return cust_nm;
	}
	public void setCust_nm(String cust_nm) {
		this.cust_nm = cust_nm;
	}
	public String getAdr_detail() {
		return adr_detail;
	}
	public void setAdr_detail(String adr_detail) {
		this.adr_detail = adr_detail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(int custSysId) {
		this.custSysId = custSysId;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}

	
}
