/**   
 * @Title: AdminFileAction.java 
 * @Package com.waremec.wpt.admin.action 
 * @Description:  
 * @author taebem
 * @date 2015年7月29日 下午4:31:41 
 * @version V1.0   
 */
package com.waremec.wpt.admin.action;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.service.WeixinService;
import com.waremec.wpt.admin.common.service.ComboService;
import com.waremec.wpt.admin.service.ShopService;

/**
 * @Package com.waremec.wpt.admin.action	
 * @FileName AdminFileAction
 * @Description
 * @author taebem
 * @date 2015年7月29日 下午4:31:41
 * 
 */
@Controller("adminDhhkAction")
@Scope(ScopeType.prototype)
public class AdminDhhkAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private Integer max = 0;
	private String conformMethod = "choosePicture";
	private String clsoeMethod = "closeWindow";
	
	private Integer fileGroup = 1;
	private String fileName = "";
	
	
	private String beginDate;// --以时间为条件查询的开始时间
	private String endDate;// --以时间为条件查询的结束时间
	private Integer shopId;// SHOP_ID [文件] 店铺ID INT
	private Integer fileId;// FILE_ID [文件] 文件 ID INT
	private String fileSysname;// FILE_SYS_NM [文件] 文件系统名称 NVARCHAR
	private Integer fileType;// FILE_TYPE [文件] 文件类型 1图片 2声音 3视频 TINYINT
	private Integer fileSize;// FILE_SIZE [文件] 大小 INT
	private String fullURL;// FULL_URL [文件] URL NVARCHAR
	private String userId;// 存储用户的ID
	private File fileEntity;// 存储文件
	private String logoFileName;// 存储店铺标志图片的名字
	
	@Resource
	private ComboService comboService;
	@Resource
	private WeixinService weixinService;
	@Resource
	private ShopService shopService;
	
	/**
	 * 打开我的文件页面
	 * 
	 * @return
	 */
	public String fileList() {
		try {
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("newType", fileType);
			map.put("newTitle", StringUtil.emptyToNull(fileName));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			List<Map<String, Object>> list = commonService.selectList("DaHan.selectShopDhNewsList", map);
			
			request.put("fileName", fileName);
			request.put("endDate", endDate);
			request.put("beginDate", beginDate);
			request.put("fileType", fileType);
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}
			request.put("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fileList";
	}

	public String fileListFragment() {
		try {
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("newType", fileType);
			map.put("newTitle", StringUtil.emptyToNull(fileName));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			List<Map<String, Object>> list = commonService.selectList("DaHan.selectShopDhNewsList", map);
			
			request.put("fileName", fileName);
			request.put("endDate", endDate);
			request.put("beginDate", beginDate);
			request.put("fileType", fileType);
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}
			request.put("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fileListFragment";
	}
	
	
	public String updateNewsList(){
		shopId = getBackSessionShopId();
		Integer newsId = IntegerUtils.valueOf(getRequest().getParameter("newsId"));
		Integer msgId = IntegerUtils.valueOf(getRequest().getParameter("msgId"));
		Integer upDel =null;
		if(getRequest().getParameter("upDel")!=null){
			upDel= IntegerUtils.valueOf(getRequest().getParameter("upDel"));
		}
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("shopId", shopId);
		parmsMap.put("newsId", newsId);
		parmsMap.put("msgId", msgId);
		parmsMap.put("upDel", upDel);
		Map<String, Object> resultMap = commonService.select("DaHan.updateShopDhNewsDel",parmsMap);
		
		String type = (String)resultMap.get("OUT_SUC");
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		if(type.trim().equalsIgnoreCase("S")){
			rtnMap.put("success", true);
		}else{
			rtnMap.put("success", false);
		}
		renderJSON(rtnMap);
		return NONE;
	}
	


	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setFileGroup(Integer fileGroup) {
		this.fileGroup = fileGroup;
	}

	public Integer getFileGroup() {
		return fileGroup;
	}

	public Integer getMax() {
		return max;
	}

	public void setMax(Integer max) {
		this.max = max;
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

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getFileId() {
		return fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public String getFileSysname() {
		return fileSysname;
	}

	public void setFileSysname(String fileSysname) {
		this.fileSysname = fileSysname;
	}

	public Integer getFileType() {
		return fileType;
	}

	public void setFileType(Integer fileType) {
		this.fileType = fileType;
	}

	public Integer getFileSize() {
		return fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	public String getFullURL() {
		return fullURL;
	}

	public void setFullURL(String fullURL) {
		this.fullURL = fullURL;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public File getFileEntity() {
		return fileEntity;
	}

	public void setFileEntity(File fileEntity) {
		this.fileEntity = fileEntity;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}
	
}
