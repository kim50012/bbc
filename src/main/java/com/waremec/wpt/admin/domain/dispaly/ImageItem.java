/**   
* @Title: ImageItem.java 
* @Package com.waremec.wpt.admin.domain.dispaly 
* @Description:  
* @author taebem
* @date 2015年8月22日 下午11:31:52 
* @version V1.0   
*/
package com.waremec.wpt.admin.domain.dispaly;

/** 
 * @Package com.waremec.wpt.admin.domain.dispaly 
 * @FileName ImageItem
 * @Description  
 * @author taebem 
 * @date 2015年8月22日 下午11:31:52 
 *  
 */
public class ImageItem {
	private Integer tempId;
	private String fileNm;
	private Integer fileId;
	private String fileUrl;
	private String linkUrl;
	public Integer getTempId() {
		return tempId;
	}
	public void setTempId(Integer tempId) {
		this.tempId = tempId;
	}
 
	public Integer getFileId() {
		return fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	
}
