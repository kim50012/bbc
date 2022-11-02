/**   
* @Title: Angle.java 
* @Package com.jong.rand 
* @Description:  
* @author taebem
* @date 2015年8月4日 上午12:22:16 
* @version V1.0   
*/
package com.waremec.wpt.front.event.domain;

/** 
 * @Package com.jong.rand 
 * @FileName Angle
 * @Description  
 * @author taebem 
 * @date 2015年8月4日 上午12:22:16 
 *  
 */
public class Angle {

	private Integer point;
	private Integer angle;
	 
	
	
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public Integer getAngle() {
		return angle;
	}
	public void setAngle(Integer angle) {
		this.angle = angle;
	}
	
	@Override
	public String toString() {
		return "Angle [point=" + point + ", angle=" + angle + "]";
	}
	public Angle(Integer point, Integer angle) {
		super();
		this.point = point;
		this.angle = angle;
	}
	public Angle() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
