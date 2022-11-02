package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminPoint;
@Repository
public class PointDao extends CommonDao {

	/**
	 * @author WANGBIN
	 * @param string  
	 * @param adminPoint
	 * @return 积分ID
	 */
	public String savePoint(String string, AdminPoint adminPoint) {
		Map<String,Object> map=(Map<String, Object>) getSqlMapClientTemplate().queryForObject(string, adminPoint);
		return  map.get("OUT_POINT_ID")+"";
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminPoint
	 * @return 积分规则的集合。
	 */
	public List<AdminPoint> selectPointList(String string,
			AdminPoint adminPoint) {
		return  getSqlMapClientTemplate().queryForList(string, adminPoint);
	}
	public AdminPoint selectPoint(String string,
			AdminPoint adminPoint) {
		return (AdminPoint) getSqlMapClientTemplate().queryForObject(string, adminPoint);
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminPoint
	 * @return 返回修改的积分规则的ID
	 */
	public String updatePoint(String string, AdminPoint adminPoint) {
		Map<String,Object> map=(Map<String, Object>)getSqlMapClientTemplate().queryForObject(string,adminPoint);
		return  map.get("OUT_POINT_ID")+"";
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminPoint
	 * 	删除积分规则。
	 */
	public void deletePoint(String string, AdminPoint adminPoint) {
		getSqlMapClientTemplate().update(string, adminPoint);
	}

}
