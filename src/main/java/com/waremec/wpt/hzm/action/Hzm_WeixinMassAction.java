package com.waremec.wpt.hzm.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.weixin.domain.mass.MassReturn;
import com.waremec.wpt.admin.service.MassService;

/**
 * 
 * @author zhengtaifan 群发功能相关功能
 *
 */
@Controller("hzmWeixinMassAction")
@Scope(ScopeType.prototype)
public class Hzm_WeixinMassAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private String conformMethod = "chooseFunc";
	private String clsoeMethod = "closeWindow";
	
	@Resource
	private MassService massServcie;
	
	public String hzm_MassMain(){
		
		Integer sendType = 1;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId",  getBackSessionShopId());
		
		List<Map<String, Object>> gradeList = commonService.selectList("SendMsgAll.selectCustGrade", map);
		request.put("gradeList", gradeList);
		
		
		List<Map<String, Object>> targetList = new ArrayList<Map<String, Object>>();
		String custSysIds =  getRequest().getParameter("custSysIds");
		if(StringUtils.isNotBlank(custSysIds)){
			
			sendType = 3;
			
			String custNickNames = getRequest().getParameter("custNickNames");
			System.out.println("custNickNames==" + custNickNames);
			try {
				custNickNames = new String(custNickNames.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("custNickNames2==" + custNickNames);
			
			String[] ids = custSysIds.split(",");
			String[] names = custNickNames.split(",");
			
			
			for (int i = 0; i < ids.length; i++) {
				Map<String, Object> target = new HashMap<String, Object>();
				String id = ids[i];
				String custNickName = names[i];
				target.put("custNickName", custNickName);
				target.put("custSysId", id);
				targetList.add(target);
			}
		}
		
		request.put("sendType", sendType);
		request.put("targetList", targetList);
		
		return "hzm_MassMain";
	}
	

	/**
	 * 保存群发的设置信息
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String hzm_Send()  {
		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Integer msgId 	 = Integer.valueOf(getRequest().getParameter("msgId"));
			Integer sendType = Integer.valueOf(getRequest().getParameter("sendType"));
			
			map.put("SHOP_ID", getBackSessionShopId());
			map.put("MSG_ID", msgId);
			map.put("SEND_TYPE", sendType);
			if(sendType == 2){
				Integer gradeId = IntegerUtils.valueOf(getRequest().getParameter("gradeId"));
				map.put("GRADE_ID", gradeId);
			}
			if(sendType == 3){
				String custSysIds =  getRequest().getParameter("custSysIds");
				map.put("SPL_CUST_SYS_ID", custSysIds);
			}
			 
			massServcie.saveSendTarget(map);
			
			List<String> touser = new ArrayList<String>();  
			
			List<Map<String, Object>> userlist2 = commonService.selectList("Mass.SHOP_WX_NEWS_CUST_SELECT", map);
			if(userlist2.isEmpty()){
				throw new Exception("发送对象列表为空!");
			}
			for (Map<String, Object> item : userlist2) {
				touser.add((String)item.get("OPENID"));
			}
			
			map.clear();
			map.put("SHOP_ID",  getBackSessionShopId());
			map.put("USER_ID", getBackSessionUserId());
			map.put("MSG_ID", msgId);
			
			List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , map);
			ListUtil.convertClob2String(newsList);
			
			MassReturn massReturn = massServcie.sendMassMessage(getBackSessionShopId(), sendType == 1, touser, newsList);
//			MassReturn massReturn = massServcie.sendTextMassMessage(getBackSessionShopId(), sendType == 1, touser, content);
			
			map.clear();
			map.put("SHOP_ID",  getBackSessionShopId());
			map.put("MSG_ID", msgId);
			map.put("WX_MSG_ID", massReturn.getMsg_id());
			map.put("WX_MSG_DATA_ID", massReturn.getMsg_data_id());
			map.put("SEND_STS", 1);
		 
			massServcie.saveSendResult(map);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", true);
			renderJSON(returnMap);
		}  catch (Exception e) {
			
			map.clear();
			map.put("SHOP_ID",  getBackSessionShopId());
			map.put("MSG_ID", null);
			map.put("WX_MSG_ID", e.getMessage());
			map.put("SEND_STS", 2);
		 
			massServcie.saveSendResult(map);
		 
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
			renderJSON(returnMap);
		}
		
		return NONE;
	}

	public String hzm_CustPopup() {
		return "hzm_CustPopup";
	}
	public String hzm_CustPopupFragment() {
		String custName = getRequest().getParameter("custName");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", getBackSessionShopId());
		map.put("nickName", custName);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		
		List<Map<String, Object>> list = commonService.selectList("SendMsgAll.selectCustList", map);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("COUNT_NUM"));
			page = new PageData(pageCurr, pageUnit, totalCount, list);
		}
		
		request.put("page", page);
		
		return "hzm_CustPopupFragment";
	}

	public String getConformMethod() {
		return conformMethod;
	}

	public void setConformMethod(String conformMethod) {
		this.conformMethod = conformMethod;
	}

	public String getClsoeMethod() {
		return clsoeMethod;
	}

	public void setClsoeMethod(String clsoeMethod) {
		this.clsoeMethod = clsoeMethod;
	}
	
	
}
