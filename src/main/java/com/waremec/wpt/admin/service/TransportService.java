package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.AdminTransportSheetDao;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminTransportDtl;
import com.waremec.wpt.admin.domain.AdminTransportSheet;

@Service
public class TransportService extends CommonServiceImpl implements CommonService{
	@Resource
	private AdminTransportSheetDao adminTransportSheetDao;
	/**
	 * @author:		chenzheng
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminTransportSheet
	 * @return:		List<AdminTransportSheet>
	 * @exception:	店铺运费模板查询
	 */
	public List<AdminTransportSheet> selectTransportSheet(String sqlId,
			AdminTransportSheet adminTransportSheet) {
		try {
			return adminTransportSheetDao.selectTransportSheet(sqlId, adminTransportSheet);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		chenzheng
	 * @param:		sqlId,searchMap--AdminTransportSheet	
	 * @return:		void
	 * @exception:	运费模板--保存
	 */
	public void insertTransportSheet(String sqlId, AdminTransportSheet saveIn) {
		try {
			adminTransportSheetDao.insertTransportSheet(sqlId, saveIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * @author:		chenzheng
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminMap
	 * @return:		List<AdminTransportSheet>
	 * @exception:	运费配送区域查询
	 */
	public List<AdminMap> selectMap(String sqlId,
			AdminMap adminMap) {
		try {
			return adminTransportSheetDao.selectMap(sqlId, adminMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminTransportSheet
	 * @return 查询总条数
	 */
	public int selectCount(String string,
			AdminTransportSheet adminTransportSheet) {
		try{
			return adminTransportSheetDao.selectCount(string, adminTransportSheet);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * @author:		chenzheng
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminTransportSheet
	 * @return:		AdminTransportSheet
	 * @exception:	根据id查找运费模板
	 */
	public AdminTransportSheet selectTransportSheetById(String sqlId,
			AdminTransportSheet adminTransportSheet) {
		try {
			return adminTransportSheetDao.selectTransportSheetById(sqlId, adminTransportSheet);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		chenzheng
	 * @param:		sqlId,searchMap--AdminTransportSheet	
	 * @return:		void
	 * @exception:	运费模板--修改
	 */
	public void updateTransportSheet(String sqlId, AdminTransportSheet updateIn) {
		try {
			adminTransportSheetDao.updateTransportSheet(sqlId, updateIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * @author:		chenzheng
	 * @param:		sqlId,searchMap--AdminTransportSheet	
	 * @return:		void
	 * @exception:	运费模板--删除
	 */
	public void deleteTransportSheet(String sqlId, AdminTransportSheet delete) {
		try {
			adminTransportSheetDao.deleteTransportSheet(sqlId, delete);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * @author:		chenzheng
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminTransportDtl
	 * @return:		List<AdminTransportDtl>
	 * @exception:	店铺运费模板查询
	 */
	public List<AdminTransportDtl> selectTransportDtl(String sqlId,
			AdminTransportDtl adminTransportDtl) {
		try {
			return adminTransportSheetDao.selectTransportDtl(sqlId, adminTransportDtl);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		chenzheng
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminTransportDtl
	 * @return:		AdminTransportDtl
	 * @exception:	根据运费模板id查找运费
	 */
	public AdminTransportDtl selectFee(String sqlId,
			AdminTransportDtl adminTransportDtl) {
		try {
			return adminTransportSheetDao.selectFee(sqlId, adminTransportDtl);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		chenzheng
	 * @version:	v1.0
	 * @param:		Map<String,Object>
	 * @return:		AdminTransportDtl
	 * @exception:	根据运费模板id查找fromAreaId
	 */
	public Map<String,Object> selectSheng(String sqlId,
			Map<String,Object> searchMap) {
		try {
			return adminTransportSheetDao.selectSheng(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
