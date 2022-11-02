package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminWxCustMenu;



@Repository
@SuppressWarnings("unchecked")
public class WxCustMenuDao extends CommonDao {

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminWxCustMenu
	 * @return:		AdminWxCustMenu
	 * @exception:	微信自定义菜单一查询
	 */ 
	public AdminWxCustMenu selectDomain(String sqlId, AdminWxCustMenu searchMap) {
		return (AdminWxCustMenu)getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminWxCustMenu
	 * @return:		List<AdminWxCustMenu>
	 * @exception:	微信自定义菜单一查询-LIST
	 */ 
	public List<AdminWxCustMenu> selectList(String sqlId, AdminWxCustMenu searchMap) {
		return (List<AdminWxCustMenu>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminWxCustMenu
	 * @exception:	微信自定义菜单一保存
	 */ 
	public void insertDomain(String sqlId, AdminWxCustMenu paramIn) {
		getSqlMapClientTemplate().insert(sqlId, paramIn);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--
	 * @exception:	微信自定义菜单一修改
	 */ 
	public void updateDomain(String sqlId, AdminWxCustMenu paramIn) {
		getSqlMapClientTemplate().update(sqlId, paramIn);
	}

	/** 
	*
	* @param custMenu
	*/
	public void inserMenu(AdminWxCustMenu custMenu) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("AdminWxCustMenu.insertMenu", custMenu);
		
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		if(!SUCCESS.equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
	}

	/** 
	*
	* @param custMenu
	*/
	public void updateMenuName(AdminWxCustMenu custMenu) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("AdminWxCustMenu.updateMenuName", custMenu);
		
	}

	/** 
	*
	* @param custMenu
	* @return
	*/
	public AdminWxCustMenu selectMenuById(AdminWxCustMenu custMenu) {
		// TODO Auto-generated method stub
		return (AdminWxCustMenu)getSqlMapClientTemplate().queryForObject("AdminWxCustMenu.selectMenuById", custMenu);
	}
	
}
