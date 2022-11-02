package com.waremec.wpt.admin.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
@Controller("adminWeixinMassAction")
@Scope(ScopeType.prototype)
public class AdminWeixinMassAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private String conformMethod = "chooseFunc";
	private String clsoeMethod = "closeWindow";
	
	@Resource
	private MassService massServcie;
	
	public String massMain(){
		
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
		
		return "massMain";
	}
	

	/**
	 * 保存群发的设置信息
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String send()  {
		
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
			
			//校验是否是已上传到微信服务器的图片
			boolean checkImgSrc = this.checkImgSrc(newsList);
			Map<String, Object> returnMap = new HashMap<String, Object>();
			
			if(checkImgSrc){
				MassReturn massReturn = massServcie.sendMassMessage(getBackSessionShopId(), sendType == 1, touser, newsList);//我是正式代码
				
				map.clear();
				map.put("SHOP_ID",  getBackSessionShopId());
				map.put("MSG_ID", msgId);
				map.put("WX_MSG_ID", massReturn.getMsg_id());
				map.put("WX_MSG_DATA_ID", massReturn.getMsg_data_id());
				map.put("SEND_STS", 1);
				
				massServcie.saveSendResult(map);
				
				returnMap.put("success", true);
			}else {
				returnMap.put("success", false);
				returnMap.put("err_msg", "有未上传的图片，请先发送预览然后再试");
			}
			
//			MassReturn massReturn = massServcie.sendTextMassMessage(getBackSessionShopId(), sendType == 1, touser, content);//我是之前就注释掉的代码
			
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

	public String custPopup() {
		return "custPopup";
	}
	public String custPopupFragment() {
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
		
		return "custPopupFragment";
	}
	
	/**
	 * 校验是否是已上传到微信服务器的图片
	 * @param con
	 * @param token
	 * @param uploadBaseDir
	 * @return
	 */
	public boolean checkImgSrc(List<Map<String, Object>> newsList){
		boolean flag = true;
		Pattern p=Pattern.compile("<(img|IMG)(.*?)(/>|></img>|>)");
		Pattern p_src = Pattern.compile("( src| SRC)=(\"|\')(.*?)(\"|\')");
		
		for (int i = 0; i < newsList.size(); i++) {
//			Matcher m=p.matcher(newsList.get(i).get("MCONTENTWECHAT").toString());
			Matcher m=p.matcher(String.valueOf(newsList.get(i).get("MCONTENTWECHAT")));
			boolean result_img=m.find();//匹配2223
			if (result_img) {
	            while (result_img) {
	            	String str_img= m.group(2);
	                Matcher m_src = p_src.matcher(str_img);
	                if (m_src.find()) {
	                	if(!m_src.group(3).trim().startsWith("http://mmbiz.")){//此处判断图片是否来自微信 
	                		logger.info("未上传图片URL = " + m_src.group(3).trim());
	                		flag = false;
	                		break;
	                	}
	                	result_img=m.find();
	                }
	            }
			} else {
				flag = false;
			}
	}
		
		return flag;
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