package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminTransportDtl;
import com.waremec.wpt.admin.domain.AdminTransportSheet;

@Repository
@SuppressWarnings("unchecked")
public class AdminTransportSheetDao extends CommonDao{
	/**
	 * @author chenzheng
	 * @param List<AdminTransportSheet>
	 * @param adminTransportSheet
	 * @return 运费模板的集合
	 */

	public List<AdminTransportSheet> selectTransportSheet(String sqlId,
			AdminTransportSheet adminTransportSheet) {
		return  getSqlMapClientTemplate().queryForList(sqlId, adminTransportSheet);
	}
	/**
	 * @author chenzheng
	 * @param void
	 * @param adminTransportSheet
	 * @return 运费模板的创建
	 */

	public void insertTransportSheet(String sqlId, AdminTransportSheet saveIn) {
		
		 getSqlMapClientTemplate().insert(sqlId,saveIn);
	}
	/**
	 * @author chenzheng
	 * @param List<AdminMap>
	 * @param adminTransportSheet
	 * @return 配送区域的集合
	 */

	public List<AdminMap> selectMap(String sqlId,
			AdminMap adminMap) {
		return  getSqlMapClientTemplate().queryForList(sqlId, adminMap);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminTransportSheet
	 * @return 查询总条数
	 */
	public int selectCount(String string,
			AdminTransportSheet adminTransportSheet) {
		return (Integer) getSqlMapClientTemplate().queryForObject(string,adminTransportSheet);
	}
	/**
	 * @author chenzheng
	 * @param AdminTransportSheet
	 * @param adminTransportSheet
	 * @return 根据id查找运费模板
	 */

	public AdminTransportSheet selectTransportSheetById(String sqlId,
			AdminTransportSheet adminTransportSheet) {
		return  (AdminTransportSheet) getSqlMapClientTemplate().queryForObject(sqlId,adminTransportSheet);
	}
	/**
	 * @author chenzheng
	 * @param void
	 * @param adminTransportSheet
	 * @return 运费模板的修改
	 */

	public void updateTransportSheet(String sqlId, AdminTransportSheet updateIn) {
		
		 getSqlMapClientTemplate().update(sqlId,updateIn);
	}
	/**
	 * @author chenzheng
	 * @param void
	 * @param adminTransportSheet
	 * @return 运费模板的删除
	 */

	public void deleteTransportSheet(String sqlId, AdminTransportSheet delete) {
		
		 getSqlMapClientTemplate().update(sqlId,delete);
	}
	/**
	 * @author chenzheng
	 * @param List<AdminTransportDtl>
	 * @param AdminTransportDtl
	 * @return 运费模板的集合
	 */

	public List<AdminTransportDtl> selectTransportDtl(String sqlId,
			AdminTransportDtl adminTransportDtl) {
		return  getSqlMapClientTemplate().queryForList(sqlId, adminTransportDtl);
	}
	/**
	 * @author chenzheng
	 * @param AdminTransportDtl
	 * @return 根据运费模板id查找运费
	 */

	public AdminTransportDtl selectFee(String sqlId,
			AdminTransportDtl adminTransportDtl) {
		return  (AdminTransportDtl) getSqlMapClientTemplate().queryForObject(sqlId,adminTransportDtl);
	}
	/**
	 * @author chenzheng
	 * @param Map<String,Object>
	 * @return 根据运费模板id查找省
	 */

	public Map<String,Object> selectSheng(String sqlId,
			Map<String,Object> searchMap) {
		return  (Map<String,Object>) getSqlMapClientTemplate().queryForObject(sqlId,searchMap);
	}
}
