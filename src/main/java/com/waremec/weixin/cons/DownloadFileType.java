/**   
* @Title: DownloadFileType.java 
* @Package com.waremec.weixin.cons 
* @Description:  
* @author taebem
* @date 2015年6月2日 下午12:41:52 
* @version V1.0   
*/
package com.waremec.weixin.cons;


/** 
 * @Package com.waremec.weixin.cons 
 * @FileName DownloadFileType
 * @Description  
 * @author taebem 
 * @date 2015年6月2日 下午12:41:52 
 *  
 */
public enum DownloadFileType {

	IMAGE(1),VOICE(2),VIDEO(3);
	
	int type;
	
	private DownloadFileType(int type) {
		this.type = type;
	}

	public int getType() {
		return type;
	}
	
	public static DownloadFileType get(int type) {
		for (DownloadFileType c : DownloadFileType.values()) {
			if (c.getType() == type) {
				return c;
			}
		}
		return null;
	}
	public static DownloadFileType get(DownloadFileType type) {
		for (DownloadFileType c : DownloadFileType.values()) {
			if (c.getType() == type.getType()) {
				return c;
			}
		}
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println(DownloadFileType.IMAGE);
	}
	
}
