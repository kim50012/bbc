package com.waremec.wpt.front.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.Counter;
import com.waremec.wpt.front.domain.PageUrlType;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.CounterService;

@Controller("counterAction")
@Scope(ScopeType.prototype)
public class CounterAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	 
	private String shopId;
	private String custSysId;
	private String pageTp;
	private String pageId;
	private String goodsId;
	private String displayId;
	private String aiIP;
	private String aiDevice;
 

	@Resource
	protected CounterService counterService;
	
	public String counter() {
		
		SessionMember sessionMember = getSessionMember();
	  
		Integer shopId = null;
		Integer custSysId = null;
		SessionSkin skin = getSessionSkin();
		if(skin != null){
			shopId = skin.getShopId();
		}
		if(sessionMember!= null){
			custSysId = sessionMember.getCustSysId();
		}
		
		Counter counter= new Counter();
		
		try {
			counter.setShopId(shopId);
			counter.setCustSysId(custSysId);
			counter.setPageTp(IntegerUtils.valueOf(pageTp, null));
			counter.setPageId(IntegerUtils.valueOf(pageId,null));
			counter.setGoodsId(IntegerUtils.valueOf(goodsId, null));
			counter.setDisplayId(IntegerUtils.valueOf(displayId, null));
			counter.setAiIP(getRequest().getRemoteAddr());
			counter.setAiDevice(getDeviceType(getRequest().getHeader("User-Agent")));
			counter.setOpenid(getSessionOpenid());
		//	System.out.println(getRequest().getHeader("User-Agent"));
		 counterService.saveCounter(counter); 
			getPageType();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return NONE;
	}
	
	public Integer getPageType(){
		
		ServletContext servletContext =  getRequest().getServletContext();
		List<PageUrlType>  list = (List<PageUrlType> )servletContext.getAttribute("counterType");
		for (PageUrlType pageUrlType : list) {
			System.out.println("pageUrlTyp==="  + pageUrlType.getPageUrl());
		}
	 
		
		return 1;
	}
	
	
	public String getDeviceType(String userAgent){
		
		if(userAgent.contains("iPhone")){
			return "IPHONE";
		}else if(userAgent.contains("Android")){
			return "ANDROID";
		}else if(userAgent.contains("Windows Phone")){
			return "WINPHONE";
		}
		
		return "N/A";
		
	}
	

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}

	public String getPageTp() {
		return pageTp;
	}

	public void setPageTp(String pageTp) {
		this.pageTp = pageTp;
	}

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getDisplayId() {
		return displayId;
	}

	public void setDisplayId(String displayId) {
		this.displayId = displayId;
	}

	public String getAiIP() {
		return aiIP;
	}

	public void setAiIP(String aiIP) {
		this.aiIP = aiIP;
	}

	public String getAiDevice() {
		return aiDevice;
	}

	public void setAiDevice(String aiDevice) {
		this.aiDevice = aiDevice;
	}
	   
	
	

	
}
