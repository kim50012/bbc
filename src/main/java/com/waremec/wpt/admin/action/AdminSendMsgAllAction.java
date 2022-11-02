package com.waremec.wpt.admin.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.service.MassService;

/**
 * 
 * @author WANGBIN 店铺信息群发功能
 *
 */
@Controller("adminSendMsgAllAction")
@Scope(ScopeType.prototype)
public class AdminSendMsgAllAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private String conformMethod = "chooseFunc";
	private String clsoeMethod = "closeWindow";
	
	
	// 存储店铺的ID
	private Integer shopId;
	// 存储用户的ID
	private String userId = "";
	// 店铺发送信息的ID
	private String messageId = "";
	// 店铺发送信息标题
	private String msgTitle = "";
	// 发送类型 （1：IMG 2：Music 3：Movie 4：素材）
	private String sendFileType = "";
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
	// 存储客户的ID
	private String custSysId = "";
	// 存储客户等级的ID号
	private String gradeId = "";
	// 存储操作模式，I插入数据U修改 D删除
	private String jobType = "";
	// --以时间为条件查询的开始时间
	private String beginDate = "";
	// --以时间为条件查询的结束时间
	private String endDate = "";
	// FILE_ID [文件] 文件 ID INT
	private String fileId = "";
	// FILE_NM [文件] 文件名称 NVARCHAR
	private String fileName = "";
	// FILE_SYS_NM [文件] 文件系统名称 NVARCHAR
	private String fileSysname = "";
	// FILE_TYPE [文件] 文件类型 1图片 2声音 3视频 TINYINT
	private String fileType = "1";
	// 素材名称serachTitle
	private String serachTitle = "";
	// 排序方式
	private String orderBy = "";
	// 查询的链接类型
	private String serachLinkType = "";
	// 用户昵称
	private String custNickName = "";

	private int fileGroup = 1;

	@Resource
	private MassService massServcie;

	public String selectImg() {
		pageUnit = 50;
		try {
			fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("fileName", StringUtil.emptyToNull(fileName));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("fileType", StringUtil.emptyToNull(fileType));
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			map.put("fileId", null);
			map.put("fileGroup", fileGroup);
			List<Map<String, Object>> list = commonService.selectList("MyFile.selectShopFileList", map);
			
			request.put("list", list);
			int pageCount=0;
			Integer totalCnt=0;
			if(!list.isEmpty()){
				totalCnt = (Integer)list.get(0).get("TOTAL_CNT");
				pageCount= totalCnt / pageUnit + (totalCnt % pageUnit == 0 ? 0 : 1);
			}
			request.put("pageCount", pageCount);
			request.put("pageCurr", pageCurr);
			request.put("pageUnit", pageUnit);
			request.put("pageUnitCount", totalCnt);
			request.put("fileName", fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "selectImg";
	}

	public String selectAvi() {
		fileType = "3";
		pageUnit = 10;
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		try {
			fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("fileName", StringUtil.emptyToNull(fileName));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("fileType", StringUtil.emptyToNull(fileType));
			map.put("fileGroup", fileGroup);
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			map.put("fileId", null);
			List<Map<String, Object>> list = commonService.selectList("MyFile.selectShopFileList", map);
			request.put("list", list);
			int pageCount=0;
			Integer totalCnt=0;
			if(!list.isEmpty()){
				totalCnt = (Integer)list.get(0).get("TOTAL_CNT");
				pageCount= totalCnt / pageUnit + (totalCnt % pageUnit == 0 ? 0 : 1);
			}
			request.put("pageCount", pageCount);
			request.put("pageCurr", pageCurr);
			request.put("pageUnit", pageUnit);
			request.put("pageUnitCount", totalCnt);
			request.put("fileName", fileName);
			/*Map<String, Object> mapCount = commonService.select("MyFile.selectShopFileCount", map);
			int pageUnitCount = (Integer) mapCount.get("COUNT_NUM");
			int pageCount = pageUnitCount / pageUnit + (pageUnitCount % pageUnit == 0 ? 0 : 1);
			request.put("pageCount", pageCount);
			request.put("pageCurr", pageCurr);
			request.put("pageUnit", pageUnit);
			request.put("pageUnitCount", pageUnitCount);*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "selectAvi";
	}

	public String selectMusic() {
		fileType = "2";
		pageUnit = 10;
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		try {
			fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId",shopId);
		map.put("fileName", StringUtil.emptyToNull(fileName));
		map.put("beginDate", StringUtil.emptyToNull(beginDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("fileType", StringUtil.emptyToNull(fileType));
		map.put("pageCurr", pageCurr);
		map.put("pageUint", pageUnit);
		map.put("fileId", null);
		map.put("fileGroup", fileGroup);
		List<Map<String, Object>> list = commonService.selectList("MyFile.selectShopFileList", map);
		request.put("list", list);
		int pageCount=0;
		Integer totalCnt=0;
		if(!list.isEmpty()){
			totalCnt = (Integer)list.get(0).get("TOTAL_CNT");
			pageCount= totalCnt / pageUnit + (totalCnt % pageUnit == 0 ? 0 : 1);
		}
		request.put("pageCount", pageCount);
		request.put("pageCurr", pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUnitCount", totalCnt);
		request.put("fileName", fileName);
		return "selectMusic";
	}// AdminGoods.SHOP_FILE_MST_LIST_SELECT

	public String selectMaterial() {
		pageUnit = 10;
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		System.out.println("serachLinkType:"+serachLinkType);
		try {
			serachTitle = new String(serachTitle.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("USER_ID", null);
		parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("ORDERBY", StringUtil.emptyToNull(orderBy));
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT", parmsMap);
		if (!list.isEmpty()) {
			int pageUnitCount = (Integer) list.get(0).get("TOTAL_CNT");
			int pageCount = pageUnitCount / pageUnit + (pageUnitCount % pageUnit == 0 ? 0 : 1);
			request.put("pageCount", pageCount);
			request.put("pageCurr", pageCurr);
			request.put("pageUnit", pageUnit);
			request.put("pageUnitCount", pageUnitCount);
		}
		request.put("list", list);
		request.put("serachTitle", serachTitle);
		request.put("serachLinkType", serachLinkType);
		request.put("orderBy", orderBy);
		return "selectMaterial";
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

	public int getFileGroup() {
		return fileGroup;
	}

	public void setFileGroup(int fileGroup) {
		this.fileGroup = fileGroup;
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
