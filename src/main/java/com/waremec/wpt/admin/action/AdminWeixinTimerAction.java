package com.waremec.wpt.admin.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;


@Controller("adminWeixinTimerAction")
@Scope(ScopeType.prototype)
public class AdminWeixinTimerAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	//存储店铺的ID
	private String shopId="";
	//存储用户的ID
	private String userId="";
	//店铺发送信息的ID 
	private String messageId="";
	//发送类型
	private String msgGroup="";
	//店铺发送信息标题
	private String msgTitle="";
	//发送类型 （1：IMG  2：Music 3：Movie 4：素材）
	private String sendFileType="";
	//发送的文件的ID
	private String materialFileId="";
	//封面图片ID
	private String coverPageId="";
	//店铺商品的URL地址
	private String shopGoodsUrl="";
	//发送信息内容
	private String sendMsgBody="";
	// 发送类型  1--直接发送 2--定时发送
	private String sendType="";
	//选择客户的类型
	private String sendTypeId="";
	//存储定时发送时间
	private String sendTime="";
	//存储操作模式，I插入数据U修改 D删除
	private String jobType="";
	//客户id
	private String custSysId="";
	//客户等级
	private String gradeId="";

	public String timeToSend(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		try{
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", shopId);
			map.put("userId", userId);
			map.put("messageId", StringUtil.emptyToNull(messageId));
			msgGroup="PERIOD";
			map.put("msgGroup", msgGroup);
			map.put("pageCurr",pageCurr);
			map.put("pageUnit", pageUnit);
			List<Map<String,Object>> list=commonService.selectList("AdminWeixinTimer.selectTimeToSendList",map);
			request.put("list", list);
			if(!list.isEmpty()){
				int totalCount = (Integer)list.get(0).get("TOTAL_CNT");
				request.put("totalCount", totalCount);
				request.put("pageCurr", pageCurr);
				request.put("pageUnit", pageUnit);
				int totalPageCount=totalCount/pageUnit+(totalCount%pageUnit==0?0:1);
				request.put("totalPageCount", totalPageCount);
			}
			Map<String,Object> map1=new HashMap<String,Object>();
			map1.put("shopId", shopId);
			List<Map<String,Object>> gradeList=commonService.selectList("AdminWeixinTimer.selectCustGrade", map1);
			request.put("gradeList", gradeList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "timeToSend";
	}
	//新建保存
	public String saveTimeToSend(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		//判断操作成功与否的标志字段
		String ret="";
		/*保存自动回复的设置信息*/
		try{
			Map<String,Object> map=new HashMap<String,Object>();
			Date date=new Date();
			msgTitle=new String(msgTitle.getBytes("ISO-8859-1"),"UTF-8");
			shopGoodsUrl=new String(shopGoodsUrl.getBytes("ISO-8859-1"),"UTF-8");
			sendMsgBody=new String(sendMsgBody.getBytes("ISO-8859-1"),"UTF-8");
			map.put("shopId", StringUtil.emptyToNull(shopId));
			map.put("userId", userId);
			map.put("jobType", jobType);
			map.put("messageId", StringUtil.emptyToNull(messageId));
			map.put("msgTitle", StringUtil.emptyToNull(msgTitle));
			map.put("sendFileType", StringUtil.emptyToNull(sendFileType));
			map.put("materialFileId", StringUtil.emptyToNull(materialFileId));
			map.put("coverPageId", StringUtil.emptyToNull(coverPageId));
			map.put("shopGoodsUrl", StringUtil.emptyToNull(shopGoodsUrl));
			map.put("sendMsgBody", StringUtil.emptyToNull(sendMsgBody));
			map.put("sendType", 2);
			map.put("sendTypeId", StringUtil.emptyToNull(sendTypeId));
			map.put("sendTime", StringUtil.emptyToNull(sendTime));
			map.put("custSysId",StringUtil.emptyToNull(custSysId));
			map.put("gradeId", StringUtil.emptyToNull(gradeId));
			if(jobType.equals("I")){
				map.put("createdId", userId);
				map.put("modifiedId", null);
				map.put("createdDate", date);
				map.put("modifiedDate", null);
			}
			if(jobType.equals("U")||jobType.equals("D")){
				map.put("createdId", null);
				map.put("modifiedId", userId);
				map.put("createdDate", null);
				map.put("modifiedDate", date);
			}
			Map<String,Object> mapFlag=commonService.select("AdminWeixinTimer.saveTimeToSend", map);
			String flag=(String) mapFlag.get("OUT_ERR_MSG");
			if(flag=="S" || "S".equals(flag)){
				ret="success";
			}else{
				ret="fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	//获取自动回复的修改信息
	public String getTimeToSendUpdateMessage(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("shopId", shopId);
		map.put("userId", userId);
		msgGroup="PERIOD";
		map.put("msgGroup", msgGroup);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("AdminWeixinTimer.selectUpdate",map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		renderJSON(returnMap);
		return NONE;
	}
	//打开该定时发送的预览信息
	public String timeToSendPreview(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("shopId", shopId);
		map.put("userId", userId);
		msgGroup="PERIOD";
		map.put("msgGroup", msgGroup);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("AdminWeixinTimer.selectTimeToSendList",map);
		request.put("list", list);
		return "timeToSendPreview";
	}
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getMsgGroup() {
		return msgGroup;
	}

	public void setMsgGroup(String msgGroup) {
		this.msgGroup = msgGroup;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getSendFileType() {
		return sendFileType;
	}
	public void setSendFileType(String sendFileType) {
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
	public String getSendTypeId() {
		return sendTypeId;
	}
	public void setSendTypeId(String sendTypeId) {
		this.sendTypeId = sendTypeId;
	}
	public String getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
}
