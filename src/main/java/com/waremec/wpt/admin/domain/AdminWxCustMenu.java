package com.waremec.wpt.admin.domain;

import java.util.ArrayList;
import java.util.List;

public class AdminWxCustMenu {

	/*----------[微信自定义菜单]入参in----------*/

	/* 店铺ID */
	private Integer SHOP_ID_IN = null;

	/* 上级菜单分类 */
	private Integer MENU_PARENT_ID_IN = null;

	/* 用户 */
	private String USER_ID_IN = null;

	/* 一级菜单ID */
	private Integer MENU_ID_IN = null;

	/* 一级菜单名称 */
	private String MENU_NM_IN = null;

	/* 二级菜单ID */
	private Integer MENU_ID2_IN = null;

	/* 二级菜单名称 */
	private String MENU_NM2_IN = null;

	/* 验证 */
	private Integer SEARCH_TYPE_IN = 1;

	/* 修改操作区分 */
	private String OPTION_TYPE_IN;

	/* 菜单操作类型 */
	private String MENU_OP_TYPE_IN;

	/* 菜单操作id */
	private int MENU_OP_ID_IN;

	/* 菜单操作click的标题 */
	private String MENU_OP_TITLE_IN;

	/* 菜单操作内容 */
	private String MENU_OP_COM_IN;

	/* 菜单移动 */
	private String MENU_OPTION_IN;

	
	/*----------[微信自定义菜单]出参out----------*/
	/* 菜单ID */
	private String MENU_ID = "";

	/* 菜单昵称 */
	private String MENU_NM = "";

	/* 菜单操作内容 */
	private String MENU_OP_TYPE;

	/* 菜单操作内容 */
	private String MENU_OP_ID;

	/* 菜单操作内容 */
	private String MENU_OP_TITLE;

	/* 菜单操作内容 */
	private String MENU_OP_COM;

	List<AdminWxCustMenu> subList = new ArrayList<AdminWxCustMenu>();

	/* 存储subList的长度。 */
	private String subListSize = "";

	public Integer getSHOP_ID_IN() {
		return SHOP_ID_IN;
	}

	public void setSHOP_ID_IN(Integer sHOP_ID_IN) {
		SHOP_ID_IN = sHOP_ID_IN;
	}

	public Integer getMENU_PARENT_ID_IN() {
		return MENU_PARENT_ID_IN;
	}

	public void setMENU_PARENT_ID_IN(Integer mENU_PARENT_ID_IN) {
		MENU_PARENT_ID_IN = mENU_PARENT_ID_IN;
	}

	public String getUSER_ID_IN() {
		return USER_ID_IN;
	}

	public void setUSER_ID_IN(String uSER_ID_IN) {
		USER_ID_IN = uSER_ID_IN;
	}

	public Integer getMENU_ID_IN() {
		return MENU_ID_IN;
	}

	public void setMENU_ID_IN(Integer mENU_ID_IN) {
		MENU_ID_IN = mENU_ID_IN;
	}

	public String getMENU_NM_IN() {
		return MENU_NM_IN;
	}

	public void setMENU_NM_IN(String mENU_NM_IN) {
		MENU_NM_IN = mENU_NM_IN;
	}

	public Integer getMENU_ID2_IN() {
		return MENU_ID2_IN;
	}

	public void setMENU_ID2_IN(Integer mENU_ID2_IN) {
		MENU_ID2_IN = mENU_ID2_IN;
	}

	public String getMENU_NM2_IN() {
		return MENU_NM2_IN;
	}

	public void setMENU_NM2_IN(String mENU_NM2_IN) {
		MENU_NM2_IN = mENU_NM2_IN;
	}

	public Integer getSEARCH_TYPE_IN() {
		return SEARCH_TYPE_IN;
	}

	public void setSEARCH_TYPE_IN(Integer sEARCH_TYPE_IN) {
		SEARCH_TYPE_IN = sEARCH_TYPE_IN;
	}

	public String getMENU_ID() {
		return MENU_ID;
	}

	public void setMENU_ID(String mENU_ID) {
		MENU_ID = mENU_ID;
	}

	public String getMENU_NM() {
		return MENU_NM;
	}

	public void setMENU_NM(String mENU_NM) {
		MENU_NM = mENU_NM;
	}

	public List<AdminWxCustMenu> getSubList() {
		return subList;
	}

	public void setSubList(List<AdminWxCustMenu> subList) {
		this.subList = subList;
	}

	public String getSubListSize() {
		return subListSize;
	}

	public void setSubListSize(String subListSize) {
		this.subListSize = subListSize;
	}

	public String getOPTION_TYPE_IN() {
		return OPTION_TYPE_IN;
	}

	public void setOPTION_TYPE_IN(String oPTION_TYPE_IN) {
		OPTION_TYPE_IN = oPTION_TYPE_IN;
	}

	public String getMENU_OP_TYPE_IN() {
		return MENU_OP_TYPE_IN;
	}

	public void setMENU_OP_TYPE_IN(String mENU_OP_TYPE_IN) {
		MENU_OP_TYPE_IN = mENU_OP_TYPE_IN;
	}

	public String getMENU_OP_COM_IN() {
		return MENU_OP_COM_IN;
	}

	public void setMENU_OP_COM_IN(String mENU_OP_COM_IN) {
		MENU_OP_COM_IN = mENU_OP_COM_IN;
	}

	public int getMENU_OP_ID_IN() {
		return MENU_OP_ID_IN;
	}

	public void setMENU_OP_ID_IN(int mENU_OP_ID_IN) {
		MENU_OP_ID_IN = mENU_OP_ID_IN;
	}

	public String getMENU_OP_COM() {
		return MENU_OP_COM;
	}

	public void setMENU_OP_COM(String mENU_OP_COM) {
		MENU_OP_COM = mENU_OP_COM;
	}

	public String getMENU_OP_TYPE() {
		return MENU_OP_TYPE;
	}

	public void setMENU_OP_TYPE(String mENU_OP_TYPE) {
		MENU_OP_TYPE = mENU_OP_TYPE;
	}

	public String getMENU_OP_ID() {
		return MENU_OP_ID;
	}

	public void setMENU_OP_ID(String mENU_OP_ID) {
		MENU_OP_ID = mENU_OP_ID;
	}

	public String getMENU_OP_TITLE_IN() {
		return MENU_OP_TITLE_IN;
	}

	public void setMENU_OP_TITLE_IN(String mENU_OP_TITLE_IN) {
		MENU_OP_TITLE_IN = mENU_OP_TITLE_IN;
	}

	public String getMENU_OP_TITLE() {
		return MENU_OP_TITLE;
	}

	public void setMENU_OP_TITLE(String mENU_OP_TITLE) {
		MENU_OP_TITLE = mENU_OP_TITLE;
	}

	public String getMENU_OPTION_IN() {
		return MENU_OPTION_IN;
	}

	public void setMENU_OPTION_IN(String mENU_OPTION_IN) {
		MENU_OPTION_IN = mENU_OPTION_IN;
	}
}
