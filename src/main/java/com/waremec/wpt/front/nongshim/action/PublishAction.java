package com.waremec.wpt.front.nongshim.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.service.SetUpService;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("publishAction")
@Scope(ScopeType.prototype)
public class PublishAction extends WeixinBaseAction{
	private static final long serialVersionUID = 1L;
	
	//存储文件
	private File fileEntity;
	//存储店铺标志图片的名字
    private String logoFileName="";
    //公告id
    private String bbsId="";
    //标题
    private String title="";
    //内容
    private String body="";
    //图片id1
    private String imgId1="";
    //图片id2
    private String imgId2="";
    //图片id3
    private String imgId3="";
    //图片id4
    private String imgId4="";
    //图片id5
    private String imgId5="";
    //创建时间
    private String createDt="";
    private String jobType="";
    private String bbsSts="";
    private String bbsType="";
    
    //文件id
    private String fileId="";
    //更新时间
    private String modifiedId="";
    private String mediaId="";
    private String media_up_dt="";
		
	public String publish(){
		
		jsSdkStting();
		
		if(bbsType==""||"".equals(bbsType)){
			bbsType="1";
		}
		request.put("bbsType", bbsType);
		return "publish";
	}
	
	public String imgUpload(){
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int shopId=sessionSkin.getShopId();
		int custSysId = sessionMember.getCustSysId();
		try{
			String ret = "SUCCESS";
			JSONObject jo = new JSONObject();
			UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity, logoFileName, UploadFileUtil.UPLOAD_SHOP);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("jobType", "I");
			map.put("fileId", fileId);
			map.put("fileNm", result.getOriginalFilename());
			map.put("fileSysNm", result.getDestinationFilename());
			map.put("fileType", 1);
			map.put("fileSize", result.getFileSize());
			map.put("fullUrl", result.getFileUrl());
			map.put("isUse", 1);
			map.put("modifiedId", modifiedId);
			map.put("createdId", custSysId);
			map.put("fileGroup", 3);
			map.put("mediaId", custSysId);
			map.put("imgWidth", result.getWidth());
			map.put("imgHeight", result.getHeight());
			Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格
			map.put("media_up_dt", dateFormat.format(now));
			Map<String, Object> imgUpload =commonService.select("Publish.imgUpload", map);
			jo.put("result", ret);
			jo.put("imgUpload", imgUpload);
	  		renderHtml(jo.toJSONString());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return NONE;
	}
	//运费模板创建
	public String save(){
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int shopId=sessionSkin.getShopId();

		int custSysId = sessionMember.getCustSysId();

		String ret = "success";
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("bbsType",bbsType);
			map.put("bbsId", bbsId);
			map.put("bbsParentId", 0);
			map.put("title", title);
			map.put("body", body);
			map.put("imgId1", imgId1);
			map.put("imgId2", imgId2);
			map.put("imgId3", imgId3);
			map.put("imgId4", imgId4);			
			map.put("imgId5", imgId5);
			map.put("createId", custSysId);
			map.put("createDt", createDt);
			map.put("bbsSts", bbsSts);
			map.put("jobType", "I");
			
			Map<String, Object> save =commonService.select("Publish.save", map);
		}catch(Exception e){
			e.printStackTrace();
			ret="file";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);

		return NONE;
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

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getImgId1() {
		return imgId1;
	}

	public void setImgId1(String imgId1) {
		this.imgId1 = imgId1;
	}

	public String getImgId2() {
		return imgId2;
	}

	public void setImgId2(String imgId2) {
		this.imgId2 = imgId2;
	}

	public String getImgId3() {
		return imgId3;
	}

	public void setImgId3(String imgId3) {
		this.imgId3 = imgId3;
	}

	public String getImgId4() {
		return imgId4;
	}

	public void setImgId4(String imgId4) {
		this.imgId4 = imgId4;
	}

	public String getImgId5() {
		return imgId5;
	}

	public void setImgId5(String imgId5) {
		this.imgId5 = imgId5;
	}

	public String getCreateDt() {
		return createDt;
	}

	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getModifiedId() {
		return modifiedId;
	}

	public void setModifiedId(String modifiedId) {
		this.modifiedId = modifiedId;
	}

	public String getMediaId() {
		return mediaId;
	}

	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}

	public String getMedia_up_dt() {
		return media_up_dt;
	}

	public void setMedia_up_dt(String media_up_dt) {
		this.media_up_dt = media_up_dt;
	}

	public String getBbsSts() {
		return bbsSts;
	}

	public void setBbsSts(String bbsSts) {
		this.bbsSts = bbsSts;
	}

	public String getBbsType() {
		return bbsType;
	}

	public void setBbsType(String bbsType) {
		this.bbsType = bbsType;
	}
	
}
