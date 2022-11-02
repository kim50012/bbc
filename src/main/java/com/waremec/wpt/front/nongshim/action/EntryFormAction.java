package com.waremec.wpt.front.nongshim.action;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.service.TransportService;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

@Controller("entryFormAction")
@Scope(ScopeType.prototype)
public class EntryFormAction extends WeixinBaseAction {
	private static final long serialVersionUID = 1L;
	 
	private String skinType;
	
	private int loginFlag;
	private String shopId;
	private String eventId;
	private String custNm;
	private String birthday;	    
	private String adrProvinceId; 
	private String adrCityId; 		
	private String adrDetail; 		
	private String adrZip;        
	private String mobileNo;
	private String email;
	private String subject;
	private String reason;
	private String imgId;


	@Resource
	protected MainService mainService;
	private TransportService transportService;
	
	public String saveEntryForm(){
		
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		shopId = sessionSkin.getShopId().toString();
		int intCustSysId = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
		}

		String ret="success";
		try{
			Map<String,Object> map=new HashMap<String, Object>();
			//reason=new String(reason.getBytes("ISO-8859-1"),"UTF-8");
			map.put("shopId", shopId);
			map.put("custSysId",intCustSysId);
			map.put("eventId", eventId);
			map.put("custNm",custNm);
			map.put("birthday", birthday);
			map.put("adrProvinceId",adrProvinceId);
			map.put("adrCityId", adrCityId);
			map.put("adrDetail", adrDetail);
			map.put("adrZip", adrZip);
			map.put("mobileNo",mobileNo);
			map.put("email",email);
			map.put("subject",subject);
			map.put("reason",reason);
			map.put("imgId",imgId);
			
			Map<String,Object> mapResult = commonService.select("EntryForm.saveEntryForm", map);
			
			String outErr = (String) mapResult.get("OUT_ERR_MSG");
			if(outErr.equals("E")){
				ret = "fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	public String entryForm() {
		
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		//SessionSkin sessionSkin = getSessionSkin();
		
		//int intCustSysId = 0;
		loginFlag = 0;
		String imgUrl = "";	
		if (sessionMember != null) {
			//intCustSysId = sessionMember.getCustSysId();
			imgUrl = sessionMember.getCustImgUrl();
			loginFlag = 1;
		}
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		request.put("thisYear",year);
		request.put("loginFlag",loginFlag);
		request.put("eventId",eventId);
		request.put("custImgUrl",imgUrl);

		return "entryForm";
	}
	
	public String checkShi(){
		Map<String,Object> mapSel = new HashMap<String,Object>();
		mapSel.put("areaParentId",adrProvinceId);
		mapSel.put("areaLevl","3");
		List<Map<String,Object>> map =transportService.selectList("AdminTransportSheet.mapSelect", mapSel);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", map);
		renderJSON(returnMap);

		return NONE;
	}


	public String getSkinType() {
		return skinType;
	}
	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}
	public int getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	public String getCustNm() {
		return custNm;
	}
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAdrProvinceId() {
		return adrProvinceId;
	}
	public void setAdrProvinceId(String adrProvinceId) {
		this.adrProvinceId = adrProvinceId;
	}
	public String getAdrCityId() {
		return adrCityId;
	}
	public void setAdrCityId(String adrCityId) {
		this.adrCityId = adrCityId;
	}
	public String getAdrDetail() {
		return adrDetail;
	}
	public void setAdrDetail(String adrDetail) {
		this.adrDetail = adrDetail;
	}
	public String getAdrZip() {
		return adrZip;
	}
	public void setAdrZip(String adrZip) {
		this.adrZip = adrZip;
	}
	public TransportService getTransportService() {
		return transportService;
	}
	public void setTransportService(TransportService transportService) {
		this.transportService = transportService;
	}
	
	
}
