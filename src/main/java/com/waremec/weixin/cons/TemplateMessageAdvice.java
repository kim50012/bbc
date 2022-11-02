/**   
* @Title: TemplateShort.java 
* @Package com.waremec.weixin.cons 
* @Description:  
* @author taebem
* @date 2015年5月12日 上午9:02:38 
* @version V1.0   
*/
package com.waremec.weixin.cons;


/** 
 * @Package com.waremec.weixin.cons 
 * @FileName TemplateShort
 * @Description  
 * @author taebem 
 * @date 2015年5月12日 上午9:02:38 
 *  
 */
public enum TemplateMessageAdvice {
	NEW_USER_MSG("TM00001",1,"新会员加入通知","","",""),
	ADD_USER_MSG("TM00002",2,"成员加入通知","","",""),
	GAME_RESULT_MSG("TM00003",3,"比赛结果通知","","",""),
	ORDER_NOT_PAY_MSG("TM00004",4,"下单成功未支付通知","","",""),
	TEMP_MSG_05("TM00005",5,"服务状态提醒","","",""),
	TEMP_MSG_06("TM00006",6,"6","","",""),
	TEMP_MSG_07("TM00007",7,"7","","",""),
	TEMP_MSG_08("TM00008",8,"8","","",""),
	TEMP_MSG_09("TM00009",9,"9","","","")
	;
	private String id;
	private int type;
	private String title;
	private String url;
	private String first;
	private String remark;

	
	/**
	 * 创建一个新的实例 TemplateShortId.
	 *
	 * @param id
	 * @param type
	 * @param title
	 * @param url
	 * @param first
	 * @param remark
	 */
	 
	private TemplateMessageAdvice(String id,Integer type, String title, String url, String first, String remark) {
		this.id = id;
		this.type = type;
		this.title = title;
		this.url = url;
		this.first = first;
		this.remark = remark;
	}

	/*public static String getDesc(String id) {
		for (TemplateMessageID c : TemplateMessageID.values()) {
			if (c.getId().equals(id)) {
				return c.desc;
			}
		}
		return "";
	}*/
	
	public String getTitle() {
		return title;
	}

	public int getType() {
		return type;
	}

	public String getId() {
		return id;
	}

	public String getUrl() {
		return url;
	}
	
	
	public String getFirst() {
		return first;
	}

	public String getRemark() {
		return remark;
	}

	public static void main(String[] args) {
		TemplateMessageAdvice id = TemplateMessageAdvice.NEW_USER_MSG;
		System.out.println(id.getId()); 
	}
	 
	
	
	
}
