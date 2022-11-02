/**   
* @Title: Menu.java 
* @Package com.waremec.wpt.admin.domain 
* @Description:  
* @author taebem
* @date 2015年6月29日 下午2:03:24 
* @version V1.0   
*/
package com.waremec.wpt.admin.domain;

import java.util.List;

/** 
 * @Package com.waremec.wpt.admin.domain 
 * @FileName Menu
 * @Description  
 * @author taebem 
 * @date 2015年6月29日 下午2:03:24 
 *  
 */
public class Menu {
	
	private Integer id; //id
	private Integer menuId; //菜单ID
	private String menuNm; //菜单名
	private Integer menuPid; //菜单parent节点ID
	private String menuIcon; //菜单图标
	private Integer menuLevel; //菜单级数
	private String menuUrl; //菜单链接地址
	private Integer leaf; //1:没有子菜单 0：拥有子菜单	
	private Integer orderBy; //排序
	private Integer activeSts; //状态
 
	private List<Menu> submenus;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	public Integer getMenuPid() {
		return menuPid;
	}

	public void setMenuPid(Integer menuPid) {
		this.menuPid = menuPid;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public Integer getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(Integer menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	 

	public Integer getLeaf() {
		return leaf;
	}

	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}

	public Integer getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}

	public Integer getActiveSts() {
		return activeSts;
	}

	public void setActiveSts(Integer activeSts) {
		this.activeSts = activeSts;
	}

	public List<Menu> getSubmenus() {
		return submenus;
	}

	public void setSubmenus(List<Menu> submenus) {
		this.submenus = submenus;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", menuId=" + menuId + ", menuNm=" + menuNm + ", menuPid=" + menuPid + ", menuIcon=" + menuIcon + ", menuLevel=" + menuLevel
				+ ", menuUrl=" + menuUrl + ", leaf=" + leaf + ", orderBy=" + orderBy + ", activeSts=" + activeSts + ", submenus=" + submenus + "]";
	}

 
	
	
}
