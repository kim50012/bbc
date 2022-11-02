package com.waremec.wpt.hzm.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;

@Controller("hzmMsgControlAction")
@Scope(ScopeType.prototype)
public class Hzm_MsgControlAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	//存储店铺的ID
	private String shopId="";
	//存储用户的ID
	private String userId="";
	//店铺发送信息的ID 
	private String messageId="";
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
		//存储定时发送时间
		private String sendTime="";
		//存储客户的ID
		private String custSysId="";
		//存储客户等级的ID号
		private String gradeId="";
		//存储操作模式，I插入数据U修改 D删除
		private String jobType="";
		//	--以时间为条件查询的开始时间
		private String beginDate="";
		//	--以时间为条件查询的结束时间
		private String endDate="";
		//FILE_ID	[文件] 文件 ID	INT
		private String fileId="";
		//FILE_NM	[文件] 文件名称	NVARCHAR
		private String fileName="";
		//FILE_SYS_NM	[文件] 文件系统名称	NVARCHAR
		private String fileSysname="";
		//FILE_TYPE	[文件] 文件类型 1图片 2声音 3视频	TINYINT
		private String fileType="1";
		//素材名称serachTitle
		private String serachTitle="";
		//排序方式
		private String orderBy="";
		//查询的链接类型
		private String serachLinkType="";
		//用户昵称
		private String custNickName="";
	public String msgControl(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("msgGroup", "SPAM");
		List<Map<String,Object>> list=commonService.selectList("MsgControl.selectMsgControlList",map);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		request.put("page", page);
		/*List<Map<String,Object>> gradeList=commonService.selectList("SendMsgAll.selectCustGrade", map);
		request.put("gradeList", gradeList);*/
		return "msgControl";
	}
	//保存新建的消息管理信息
	public String saveMsgControl(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		//判断操作成功与否的标志字段
		String ret="";
		try{
			Map<String,Object> map=new HashMap<String,Object>();
			Date date=new Date();
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
			map.put("sendType", StringUtil.emptyToNull(sendType));
			map.put("sendTime", StringUtil.emptyToNull(sendTime));
			map.put("custSysId", StringUtil.emptyToNull(custSysId));
			map.put("gradeId", StringUtil.emptyToNull(gradeId));
			map.put("createdId", userId);
			map.put("modifiedId", null);
			map.put("createdDate", date);
			map.put("modifiedDate", null);
			Map<String,Object> mapFlag=commonService.select("SendMsgAll.saveSendMsgAll", map);
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
	//获取需要修改的信息详情
	public String msgModify(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("msgGroup", "SPAM");
		Map<String,Object> resultMap=commonService.select("MsgControl.selectMsgControlList",map);
		request.put("map", resultMap);
		return "msgModify";
	}
	public String msgControlListFragment(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("msgGroup", "SPAM");
		List<Map<String,Object>> list=commonService.selectList("MsgControl.selectMsgControlList",map);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		request.put("page", page);
		return "msgControlListFragment";
	}
	//打开该信息管理的预览信息
	public String msgControlPreview(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("msgGroup", "SPAM");
		List<Map<String,Object>> list=commonService.selectList("MsgControl.selectMsgControlList",map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String ret="success";
		if(list.isEmpty()){
			ret="fail";
		}else{
			returnMap.put("map", list.get(0));
		}
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	//打开该信息管理的预览信息
	public String hzm_MsgControlPreviewWeixin(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("msgGroup", null);
		List<Map<String,Object>> list=commonService.selectList("MsgControl.selectMsgControlList",map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String ret="success";
		if(list.isEmpty()){
			ret="fail";
		}else{
			returnMap.put("map", list.get(0));
		}
		/*returnMap.put("ret", ret);
		renderJSON(returnMap);*/
		request.put("list", list);
		return "hzm_MsgControlPreviewWeixin";
	}
	//打开新建图文消息页面
	public String msgAdd(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("msgGroup", "SPAM");
		List<Map<String,Object>> gradeList=commonService.selectList("SendMsgAll.selectCustGrade", map);
		request.put("gradeList", gradeList);
		return "msgAdd";
	}
	public String selectCust(){
		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		try {
			custNickName = new String(custNickName.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", 32);
		map.put("nickName", custNickName);
		map.put("custSysId", custSysId);
		List<Map<String, Object>> list = commonService.selectList("SendMsgAll.selectCustList", map);
		request.put("list", list);
		int totalCnt=0;
		int pageCount=0;
		if(!list.isEmpty()){
			totalCnt = (Integer)list.get(0).get("COUNT_NUM");
			pageCount= totalCnt / 32 + (totalCnt % 32 == 0 ? 0 : 1);
		}
		request.put("pageUnitCount", totalCnt);
		request.put("nickName", custNickName);
		request.put("pageCount", pageCount);
		return "selectCust";
		
	}
	public String msgSend(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("messageId", StringUtil.emptyToNull(messageId));
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("msgGroup", "SPAM");
		List<Map<String,Object>> gradeList=commonService.selectList("SendMsgAll.selectCustGrade", map);
		request.put("gradeList", gradeList);
		request.put("messageId", messageId);
		return "msgSend";
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
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSysname() {
		return fileSysname;
	}
	public void setFileSysname(String fileSysname) {
		this.fileSysname = fileSysname;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getSerachTitle() {
		return serachTitle;
	}
	public void setSerachTitle(String serachTitle) {
		this.serachTitle = serachTitle;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getSerachLinkType() {
		return serachLinkType;
	}
	public void setSerachLinkType(String serachLinkType) {
		this.serachLinkType = serachLinkType;
	}
	public String getCustNickName() {
		return custNickName;
	}
	public void setCustNickName(String custNickName) {
		this.custNickName = custNickName;
	}

}
