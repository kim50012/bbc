package com.waremec.wpt.admin.domain;

import java.util.Date;

/**
 * 店铺图片信息实体类
 * @author Administrator
 *
 */
public class AdminShopFileMst {
	//判断存储过程的操作状态   I 插入  U 修改  D 删除
	private String jobType="";
	//SHOP_ID	[文件] 店铺ID	INT
	private String shopId="";
	
	//COMP_ID	[文件] PMS系统公司ID	INT
	private String compId="";
	
	//FILE_ID	[文件] 文件 ID	INT
	private String fileId="";
	//FILE_NM	[文件] 文件名称	NVARCHAR
	private String fileName="";
	//FILE_SYS_NM	[文件] 文件系统名称	NVARCHAR
	private String fileSysname="";
	//FILE_TYPE	[文件] 文件类型 1图片 2声音 3视频	TINYINT
	private String fileType="";
	//FILE_SIZE	[文件] 大小	INT
	private String fileSize="";
	//FULL_URL	[文件] URL	NVARCHAR
	private String fullURL="";
	//IS_USE	[文件] 0:停用 1:使用	TINYINT
	private String isUseNum="";
	//MODIFIED_ID	NULL	NVARCHAR
	private String modifiedUserId="";
	//CREATED_ID	NULL	NVARCHAR
	private String createdUserId="";
	//	--以时间为条件查询的开始时间
	private String beginDate="";
	//	--以时间为条件查询的结束时间
	private String endDate="";
	
	private int fileGroup = 1;
	private String mediaId ;
	private Date mediaUpDt ;
	
	
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
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
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFullURL() {
		return fullURL;
	}
	public void setFullURL(String fullURL) {
		this.fullURL = fullURL;
	}
	public String getIsUseNum() {
		return isUseNum;
	}
	public void setIsUseNum(String isUseNum) {
		this.isUseNum = isUseNum;
	}
	public String getModifiedUserId() {
		return modifiedUserId;
	}
	public void setModifiedUserId(String modifiedUserId) {
		this.modifiedUserId = modifiedUserId;
	}
	public String getCreatedUserId() {
		return createdUserId;
	}
	public void setCreatedUserId(String createdUserId) {
		this.createdUserId = createdUserId;
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
	public int getFileGroup() {
		return fileGroup;
	}
	public void setFileGroup(int fileGroup) {
		this.fileGroup = fileGroup;
	}
	public String getMediaId() {
		return mediaId;
	}
	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}
	public Date getMediaUpDt() {
		return mediaUpDt;
	}
	public void setMediaUpDt(Date mediaUpDt) {
		this.mediaUpDt = mediaUpDt;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	
	
}
