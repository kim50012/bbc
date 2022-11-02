/**   
* @Title: ShopMenuAuth.java 
* @Package com.waremec.wpt.admin.domain 
* @Description:  
* @author taebem
* @date 2015年8月27日 下午11:56:55 
* @version V1.0   
*/
package com.waremec.wpt.admin.domain;

import java.util.List;

/** 
 * @Package com.waremec.wpt.admin.domain 
 * @FileName ShopMenuAuth
 * @Description  
 * @author taebem 
 * @date 2015年8月27日 下午11:56:55 
 *  
 */
public class ShopMenuAuth {
	private Integer menuId; //菜单ID
	private String menuNm; //菜单名
	private Integer menuPid; //菜单parent节点ID
	private String menuIcon; //菜单图标
	private Integer menuLevel; //菜单级数
	private Integer leaf; //是否为根节点 1:没有子菜单 0：拥有子菜单	
	private Integer auth; //权限 1:有，   0:无
 
	private List<ShopMenuAuth> submenus;

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

	public Integer getLeaf() {
		return leaf;
	}

	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}

	public Integer getAuth() {
		return auth;
	}

	public void setAuth(Integer auth) {
		this.auth = auth;
	}

	public List<ShopMenuAuth> getSubmenus() {
		return submenus;
	}

	public void setSubmenus(List<ShopMenuAuth> submenus) {
		this.submenus = submenus;
	}
	
	
	
	
	/*menuId	menuNm	menuPid	menuIcon	menuLevel	leaf	auth
	100024	订单管理	100003	shopoperation	2	0	1
	100025	商品发布	100003	shopoperation	2	0	1
	100026	商品管理	100003	shopoperation	2	0	1
	100027	物流管理	100003	shopoperation	2	0	1
	100028	收入/提现	100003	shopoperation	2	0	1
	100029	应用/营销	100003	shopoperation	2	0	0
	100118	演讲管理	100003	shopoperation	2	0	0*/
	
}
