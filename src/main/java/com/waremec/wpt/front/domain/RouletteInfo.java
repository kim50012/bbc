/**   
* @Title: RouletteInfo.java 
* @Package com.waremec.wpt.front.domain 
* @Description:  
* @author taebem
* @date 2015年5月13日 下午2:32:22 
* @version V1.0   
*/
package com.waremec.wpt.front.domain;

/** 
 * @Package com.waremec.wpt.front.domain 
 * @FileName RouletteInfo
 * @Description  
 * @author taebem 
 * @date 2015年5月13日 下午2:32:22 
 *  
 */
public class RouletteInfo {

	private Integer eventId;
	private Long prizeId;
	private Integer itemId;
	private Integer eventAngle;
	private Integer chanceCount;
 
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public Long getPrizeId() {
		return prizeId;
	}
	public void setPrizeId(Long prizeId) {
		this.prizeId = prizeId;
	}
	public Integer getEventAngle() {
		return eventAngle;
	}
	public void setEventAngle(Integer eventAngle) {
		this.eventAngle = eventAngle;
	}
	public Integer getChanceCount() {
		return chanceCount;
	}
	public void setChanceCount(Integer chanceCount) {
		this.chanceCount = chanceCount;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	
	
	
}
