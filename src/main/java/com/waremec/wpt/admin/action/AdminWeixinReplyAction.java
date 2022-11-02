package com.waremec.wpt.admin.action;

import java.util.Date;
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
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.common.service.ComboService;
import com.waremec.wpt.admin.common.service.ComboType;

@Controller("adminWeixinReplyAction")
@Scope(ScopeType.prototype)
public class AdminWeixinReplyAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	// 存储店铺的ID
	private Integer shopId;
	// 存储用户的ID
	private String userId = "";
	// 店铺发送信息的ID
	private Integer messageId  ;
	// 店铺发送信息标题
	private String msgTitle = "";
	// 发送类型 （1：文字 2：IMG  3：Music 4：Movie 5：素材）
	private Integer sendFileType;
	// 发送的文件的ID
	private String materialFileId = "";
	// 封面图片ID
	private String coverPageId = "";
	// 店铺商品的URL地址
	private String shopGoodsUrl = "";
	// 发送信息内容
	private String sendMsgBody = "";
	// 发送类型 1--直接发送 2--定时发送
	private String sendType = "";
	// 存储定时发送时间
	private String sendTime = "";
	// 存储操作模式，I插入数据U修改 D删除
	private String jobType = "";
	// 存储自动回复的关键字
	private String keyWord = "";
	@Resource
	private ComboService comboService;
	/*wangbin add START*/
	public String linkTypePage(){
		
		Integer shopId = getBackSessionShopId();
		
		String serachTitle = StringUtils.trimToNull(getRequest().getParameter("serachTitle"));
		Integer serachLinkType = IntegerUtils.valueOf(getRequest().getParameter("serachLinkType"),2);
	 
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("LINK_TYPE", serachLinkType);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
//		parmsMap.put("USER_ID", getBackSessionUserId());
		parmsMap.put("USER_ID", null);
		
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		
		request.put("serachLinkType", serachLinkType);
		request.put("list", list);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		if(serachLinkType > 90){
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.MATERIAL_TYPE_COMBO));
		}else{
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.LINK_TYPE_COMBO));
		}
		
		return "linkTypePage";
	}
	public String linkTypePageFragment(){
		
		Integer shopId = getBackSessionShopId();
		
		String serachTitle = StringUtils.trimToNull(getRequest().getParameter("serachTitle"));
		Integer serachLinkType = IntegerUtils.valueOf(getRequest().getParameter("serachLinkType"),2);
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("LINK_TYPE", serachLinkType);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
//		parmsMap.put("USER_ID", getBackSessionUserId());
		parmsMap.put("USER_ID", null);
		
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		
		request.put("list", list);
		request.put("serachLinkType", serachLinkType);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		return "linkTypePageFragment";
	}
	
	
	public String previewNewsMaterial(){
		
		Integer msgId = IntegerUtils.valueOf(getRequest().getParameter("msgId"));
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID",  getBackSessionShopId());
		paramsMap.put("MTITLE", null);
		paramsMap.put("USER_ID", getBackSessionUserId());
		paramsMap.put("MSG_ID", msgId);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		try {
			List<Map<String, Object>> newsList =  commonService.selectList("Material.SHOP_WX_NEWS_ITEM_SELECT" , paramsMap);
			ListUtil.convertClob2String(newsList);
//			ListUtil.printListMap(newsList);
			request.put("newsList", newsList);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return "previewNewsMaterial";
	}
	
	/*wangbin add END*/
	
	
	
	/** 
	* 跳转到自动回复页面
	* @return
	*/
	public String auto() {
		shopId = getBackSessionShopId();
		userId = getBackSessionUserId();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("shopId", shopId);
			map.put("userId", userId);
			map.put("keyWord", StringUtil.emptyToNull(keyWord));
			map.put("messageId", messageId);
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("sendFileType", sendFileType);
			
			List<Map<String, Object>> list = commonService.selectList("Reply.selectReplyList", map);
			
			request.put("list", list);
			request.put("keyWord", keyWord);
			request.put("sendFileType", sendFileType);
			
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}

			request.put("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "auto";
	}
	 
	/** 
	* 获取回复页面-表格分页数据
	* @return
	*/
	public String autoFragment() {
		shopId = getBackSessionShopId();
		userId = getBackSessionUserId();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("userId", userId);
			map.put("keyWord", StringUtil.emptyToNull(keyWord));
			map.put("messageId", messageId);
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("sendFileType", sendFileType);
			List<Map<String, Object>> list = commonService.selectList("Reply.selectReplyList", map);
			request.put("list", list);
			request.put("keyWord", keyWord);
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}

			request.put("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "autoFragment";
	}
 
	
	/** 
	* 跳转到 新建或修改自动回复信息页面
	* @return
	*/
	public String editAuto() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("shopId", getBackSessionShopId());
		map.put("userId", getBackSessionUserId());
		map.put("keyWord", null);
		map.put("messageId", messageId);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		
		if(messageId == null){
			Map<String,Object> initMap = new HashMap<String,Object>();
			initMap.put("SEND_FILE_TYPE", 1);
			request.put("initMap", initMap);
		}else{
			List<Map<String, Object>> replyList = commonService.selectList("Reply.selectReplyList", map);
			request.put("replyList", replyList);
		}
		
		return "editAuto";
	}

	/** 
	* 跳转到 新建或修改关注回复信息页面
	* @return
	*/
	public String subscribe(){
		
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("shopId", getBackSessionShopId());
		map.put("userId", getBackSessionUserId());
		map.put("keyWord","关注");
		map.put("messageId", messageId);
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		
		List<Map<String,Object>> replyList = commonService.selectList("Reply.selectReplyList",map);
		
		request.put("replyList", replyList);
		
		if(!replyList.isEmpty()){
			messageId = (Integer)replyList.get(0).get("MESSAGE_ID");
		}else{
			Map<String,Object> initMap = new HashMap<String,Object>();
			initMap.put("SEND_FILE_TYPE", 1);
			request.put("initMap", initMap);
		}
		
		return "subscribe";
	}
	
	/** 
	*
	* 保存自动回复，关注回复信息
	* @return
	*/
	public String saveKeyword() {
		
		boolean success = true;
		String err_msg = "";
		
		userId =  getBackSessionUserId();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			if(jobType == null || "".equals(jobType) || jobType.isEmpty()){
				if(messageId == null){
					jobType = "I";
				}else{
					jobType = "U";
				}
			}
			
			map.put("shopId",  getBackSessionShopId());
			map.put("userId", userId);
			map.put("jobType", jobType);
			map.put("messageId", IntegerUtils.valueOf(messageId));
			map.put("msgTitle", msgTitle);
			map.put("sendFileType", sendFileType);
			map.put("materialFileId", StringUtils.trimToNull(materialFileId));
			map.put("coverPageId", StringUtils.trimToNull(coverPageId));
			map.put("shopGoodsUrl", StringUtils.trimToNull(shopGoodsUrl));
			map.put("sendMsgBody", StringUtils.trimToNull(sendMsgBody));
			map.put("sendType", 1);
			map.put("keyWord", keyWord);
			map.put("createdId", userId);
			map.put("modifiedId", userId);
			
			Map<String, Object> mapFlag = commonService.select("Reply.saveKeyword", map);
			
			String OUT_ERR_MSG = (String) mapFlag.get("OUT_ERR_MSG");
			if (!"S".equals(OUT_ERR_MSG)) {
				throw new Exception(OUT_ERR_MSG);  
			}  
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
	//////////////////////

	// 打开该自动回复的预览信息
	public String preview() {
		shopId = getBackSessionShopId();
		userId = getBackSessionUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("keyWord", StringUtil.emptyToNull(keyWord));
		map.put("messageId", messageId);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String, Object>> list = commonService.selectList("Reply.selectReplyList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String ret = "success";
		if (list.isEmpty()) {
			ret = "fail";
		} else {
			returnMap.put("map", list.get(0));
		}
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	

	/** 
	* 删除自动回复
	* @return
	*/
	public String delete() {
		
		shopId = getBackSessionShopId();
		userId = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("userId", userId);
			map.put("jobType", "D");
			map.put("messageId", messageId);
			map.put("modifiedId", userId);
			Map<String, Object> mapFlag = commonService.select("Reply.saveKeyword", map);
			String OUT_ERR_MSG = (String) mapFlag.get("OUT_ERR_MSG");
			if(!"S".equals(OUT_ERR_MSG)){
				throw new Exception(OUT_ERR_MSG);
			}
				 
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);
		return NONE;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		try {
			this.messageId = messageId;
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public Integer getSendFileType() {
		return sendFileType;
	}

	public void setSendFileType(Integer sendFileType) {
		this.sendFileType = sendFileType;
	}

	public String getMaterialFileId() {
		return materialFileId;
	}

	public void setMaterialFileId(String materialFileId) {
		this.materialFileId = materialFileId;
	}

	public String getCoverPageId() {
		return coverPageId;
	}

	public void setCoverPageId(String coverPageId) {
		this.coverPageId = coverPageId;
	}

	public String getShopGoodsUrl() {
		return shopGoodsUrl;
	}

	public void setShopGoodsUrl(String shopGoodsUrl) {
		this.shopGoodsUrl = shopGoodsUrl;
	}

	public String getSendMsgBody() {
		return sendMsgBody;
	}

	public void setSendMsgBody(String sendMsgBody) {
		this.sendMsgBody = sendMsgBody;
	}

	public String getSendType() {
		return sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

}
