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

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.utils.DateUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.wpt.admin.common.service.ComboService;
import com.waremec.wpt.admin.common.service.ComboType;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.service.ShopService;

/**
 * @Package com.waremec.wpt.admin.action	
 * @FileName AdminFileAction
 * @Description
 * @author taebem
 * @date 2015年7月29日 下午4:31:41
 * 
 */
@Controller("adminFileAction")
@Scope(ScopeType.prototype)
public class AdminFileAction extends BaseAction {

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
			map.put("fileName", StringUtil.emptyToNull(fileName));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("fileType", fileType);
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			map.put("fileId", null);
			map.put("fileGroup", 1);
			List<Map<String, Object>> list = commonService.selectList("MyFile.selectShopFileList", map);
			
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
			map.put("fileName", StringUtil.emptyToNull(fileName));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("fileType", fileType);
			map.put("pageCurr", pageCurr);
			map.put("pageUint", pageUnit);
			map.put("fileId", null);
			map.put("fileGroup", 1);
			List<Map<String, Object>> list = commonService.selectList("MyFile.selectShopFileList", map);
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
	
	/**
	 * 保存文件，图片，视频等
	 * 
	 * @return
	 * @throws Exception
	 */
	public String uploadFile() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();

		UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity, logoFileName, UploadFileUtil.UPLOAD_SHOP);

		AdminShopFileMst adminShopFileMst = new AdminShopFileMst();
		adminShopFileMst.setJobType("I");
		adminShopFileMst.setFileName(result.getOriginalFilename());
		adminShopFileMst.setFileSize(result.getFileSize() + "");
		adminShopFileMst.setFileSysname(result.getDestinationFilename());
		adminShopFileMst.setFileType(fileType + "");
		adminShopFileMst.setIsUseNum("1");
		adminShopFileMst.setFullURL(result.getFileUrl());
		adminShopFileMst.setCreatedUserId(userId);
		adminShopFileMst.setModifiedUserId(userId);
		adminShopFileMst.setShopId(shopId + "");
		adminShopFileMst.setFileGroup(fileGroup);

		try {

			if (fileGroup == 2) {
				String token = weixinService.getAccessToken(Integer.valueOf(shopId));
				String type = "";
				if (fileType.equals("1")) {
					type = "image";
				} else if (fileType.equals("2")) {
					type = "voice";
				} else if (fileType.equals("3")) {
					type = "video";
				}

				MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, type, result.getRealPath());

				adminShopFileMst.setMediaId(mediaReturn.getMedia_id());
				adminShopFileMst.setMediaUpDt(DateUtils.secondsToDate(mediaReturn.getCreated_at()));

			}

			String fileId = shopService.saveShopFileMst("Shop.saveShopFileMst", adminShopFileMst);
			JSONObject jo = new JSONObject();
			jo.put("fileId", fileId);
			jo.put("resultLogoImg", "上传文件成功");
			renderHtml(jo.toJSONString());
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			JSONObject jo = new JSONObject();
			jo.put("resultLogoImg", e.getMessage());
			renderHtml(jo.toJSONString());
			return NONE;
		}
	}

	/**
	 * 删除文件的操作。
	 * 
	 * @return
	 */
	public String deleteFile() {
		String ret = "success";
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("fileId", fileId);
		map.put("modifiedId", userId);
		map.put("isUse", "0");
		try {
			shopService.updateObject("MyFile.deleteShopFile", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * 修改文件名称的操作。
	 * 
	 * @return
	 */
	public String fileRename() {
		String ret = "success";
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("fileId", fileId);
			map.put("modifiedId", userId);
			map.put("fileName", fileName);
			shopService.updateObject("MyFile.updateShopFile", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	public String picture() {
		pageUnit = 50;
		return "picture";
	}
	
	public String pictureFragment() {
		pageUnit = 50;
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("shopId", getBackSessionShopId());
		queryMap.put("fileName", StringUtils.trimToNull(fileName));
		queryMap.put("fileType", 1);
		queryMap.put("pageCurr", pageCurr);
		queryMap.put("pageUint", pageUnit);
		queryMap.put("fileId", null);
		queryMap.put("fileGroup", fileGroup);
		List<Map<String, Object>> pictureList = commonService.selectList("MyFile.selectShopFileList", queryMap);
		
		PageData page = new PageData();
		if (!pictureList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(pictureList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, pictureList);
		}
		
		request.put("page", page);
		
		return "pictureFragment";
	}
	
	
	public String music() {
		return "music";
	}
	public String musicFragment() {
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("shopId", getBackSessionShopId());
		queryMap.put("fileName", StringUtils.trimToNull(fileName));
		queryMap.put("fileType", 2);
		queryMap.put("pageCurr", pageCurr);
		queryMap.put("pageUint", pageUnit);
		queryMap.put("fileId", null);
		queryMap.put("fileGroup", fileGroup);
		List<Map<String, Object>> pictureList = commonService.selectList("MyFile.selectShopFileList", queryMap);
		
		PageData page = new PageData();
		if (!pictureList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(pictureList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, pictureList);
		}
		
		request.put("page", page);
		
		return "musicFragment";
	}
	public String video() {
		return "video";
	}
	public String videoFragment() {
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("shopId", getBackSessionShopId());
		queryMap.put("fileName", StringUtils.trimToNull(fileName));
		queryMap.put("fileType", 3);
		queryMap.put("pageCurr", pageCurr);
		queryMap.put("pageUint", pageUnit);
		queryMap.put("fileId", null);
		queryMap.put("fileGroup", fileGroup);
		List<Map<String, Object>> pictureList = commonService.selectList("MyFile.selectShopFileList", queryMap);
		
		PageData page = new PageData();
		if (!pictureList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(pictureList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, pictureList);
		}
		
		request.put("page", page);
		
		return "videoFragment";
	}
	
	
	
	public String link(){
		
		Integer shopId = getBackSessionShopId();
		
		String serachTitle = StringUtils.trimToNull(getRequest().getParameter("serachTitle"));
		Integer serachLinkType = IntegerUtils.valueOf(getRequest().getParameter("serachLinkType"),2);
	 
		if(serachLinkType > 90){
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.MATERIAL_TYPE_COMBO));
		}else{
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.LINK_TYPE_COMBO));
		}
		
		request.put("serachTitle", serachTitle);
		request.put("serachLinkType", serachLinkType);
		
		return "link";
	}
	
	public String linkFragment(){
		
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
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		 
		return "linkFragment";
	}
	
	
	public String linkImage(){
		
		pageUnit = 50;
		
		Integer shopId = getBackSessionShopId();
		
		String serachTitle = StringUtils.trimToNull(getRequest().getParameter("serachTitle"));
		Integer serachLinkType = IntegerUtils.valueOf(getRequest().getParameter("serachLinkType"),2);
	 
		if(serachLinkType > 90){
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.MATERIAL_TYPE_COMBO));
		}else{
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.LINK_TYPE_COMBO));
		}
		
		request.put("serachTitle", serachTitle);
		request.put("serachLinkType", serachLinkType);
		
		return "linkImage";
	}	
	
	public String linkImageFragment(){
		
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
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		 
		return "linkImageFragment";
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
