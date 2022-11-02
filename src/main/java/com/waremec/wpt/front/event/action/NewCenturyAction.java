package com.waremec.wpt.front.event.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.domain.user.SessionMember;

@Controller("newCenturyAction")
@Scope(ScopeType.prototype)
public class NewCenturyAction  extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	
	private int custSysId;
	private String openId;
	private int shopId;
	private int loginFlag;
	
	public String newCentury(){
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		loginFlag = 0;
		if (sessionMember != null) {
			custSysId = sessionMember.getCustSysId();
			openId = sessionMember.getOpenid();
			shopId = sessionMember.getShopId();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", shopId);
			map.put("openId", openId);
			map.put("letterId", 7);
			commonService.select("Event.SHOP_WX_LETTER_USER_INSERT", map);
			
			map.put("CUST_SYS_ID", custSysId);
			map.put("SHOP_ID", shopId);
	    	Map<String,Object> custMap = commonService.select("BBS.getCustDetail",map);
	    	if(custMap!=null){
	    		loginFlag =Integer.valueOf(custMap.get("WX_IF_IS_SUBSCRIBE").toString());
	    	}
		}
		request.put("loginFlag", loginFlag);
		return "newCentury";
	}
	public int getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(int custSysId) {
		this.custSysId = custSysId;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public int getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}
}