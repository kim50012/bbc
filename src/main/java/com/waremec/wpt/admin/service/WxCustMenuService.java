package com.waremec.wpt.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.service.WeixinMenuService;
import com.waremec.wpt.admin.dao.WxCustMenuDao;
import com.waremec.wpt.admin.domain.AdminWxCustMenu;



@Service
public class WxCustMenuService extends CommonServiceImpl implements CommonService{

	@Resource
	private WxCustMenuDao wxCustMenuDao;
	
	@Resource
	private WeixinMenuService weiXinMenuService;

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminWxCustMenu
	 * @return:		AdminWxCustMenu
	 * @exception:	微信自定义菜单---查询
	 */ 
	public AdminWxCustMenu selectDomain(String sqlId, AdminWxCustMenu searchMap) {
		try {
			return wxCustMenuDao.selectDomain(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminWxCustMenu
	 * @return:		List<AdminWxCustMenu>
	 * @exception:	微信自定义菜单-查询-LIST
	 */
	public List<AdminWxCustMenu> selectList(String sqlId, AdminWxCustMenu searchMap) {
		try {
			return wxCustMenuDao.selectList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminWxCustMenu
	 * @exception:	微信自定义菜单一保存
	 */
	public void insertDomain(String sqlId, AdminWxCustMenu paramIn) throws Exception{
	 
			wxCustMenuDao.insertDomain(sqlId, paramIn);
			if (sqlId.equals("AdminWxCustMenu.publish")) {
				weiXinMenuService.uploadMenus(paramIn.getSHOP_ID_IN());
			}
		 
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminWxCustMenu
	 * @exception:	微信自定义菜单一更新
	 */
	public void updateDomain(String sqlId, AdminWxCustMenu paramIn) {
		try {
			wxCustMenuDao.updateDomain(sqlId, paramIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 
	*
	* @param custMenu
	*/
	public void addMenu(AdminWxCustMenu custMenu) {
		// TODO Auto-generated method stub
		wxCustMenuDao.inserMenu(custMenu);
	}

	/** 
	*
	* @param custMenu
	*/
	public void modifyMenuName(AdminWxCustMenu custMenu) {
		// TODO Auto-generated method stub
		wxCustMenuDao.updateMenuName(custMenu);
	}

	/** 
	*
	* @param custMenu
	* @return
	*/
	public AdminWxCustMenu getMenuById(AdminWxCustMenu custMenu) {
		// TODO Auto-generated method stub
		return wxCustMenuDao.selectMenuById(custMenu);
	}
}
