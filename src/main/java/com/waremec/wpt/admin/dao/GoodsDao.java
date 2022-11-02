package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminGoods;

@Repository
@SuppressWarnings("unchecked")
public class GoodsDao extends CommonDao {

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	public List<AdminGoods> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		return (List<AdminGoods>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	public List<AdminGoods> selectshopGoodsClassDomain(String sqlId, AdminGoods searchMap) {
		return (List<AdminGoods>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	店铺商品分类一保存
	 */ 
	public void insertDomain(String sqlId, AdminGoods paramIn) {
		getSqlMapClientTemplate().insert(sqlId, paramIn);
	}
	
	public AdminGoods saveGoodsClass(AdminGoods adminGoods) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String , Object>)getSqlMapClientTemplate().queryForObject("AdminGoods.saveGoodsClass", adminGoods);
		 
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if("S".equals(OUT_ERR_MSG)){
			Integer sgcId = (Integer)result.get("OUT_SGC_ID");
			String sgcNm = (String)result.get("OUT_SGC_NM");
			Integer sgcId2 = (Integer)result.get("OUT_SGC_ID2");
			String sgcNm2 = (String)result.get("OUT_SGC_NM2");
			
			AdminGoods goods = new AdminGoods();
			goods.setShopGoodsOneId(sgcId);
			goods.setShopGoodsOneNm(sgcNm);
			if(sgcId2!=null){
				goods.setShopGoodsTwoId(sgcId2);
			}
			if(sgcNm2!=null){
				goods.setShopGoodsTwoNm(sgcNm2);
			}
			return goods;
			 
			
		}else{
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	public List<AdminGoods> selectGoodsClass(String sqlId, AdminGoods searchMap) {
		return (List<AdminGoods>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	public int selectCount(String sqlId, AdminGoods searchMap) {
		return (Integer) getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}

	public Map<String, Object> addSpecLevelOne(Map<String, Object> paramsMap) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("AdminGoods.SPEC_INSERT", paramsMap);
 		int specId =  (Integer)result.get("SPEC_ID");
 		if(specId > 0){
 			result.put("SPEC_NM", paramsMap.get("SPEC_NM"));
 			result.put("success", true);
 		}else{
 			result.put("errorMsg", result.get("OUT_ERR_MSG"));
 			result.put("success", false);
 		}
		return result;
	}
	
	public Map<String, Object> addSpecLevelTwo(Map<String, Object> paramsMap) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("AdminGoods.SPEC_VALUE_INSERT", paramsMap);
//		return (Integer)result.get("OUT_PAGE_ID");
		int specValueId =  (Integer)result.get("SPEC_VALUE_ID");
 		if(specValueId > 0){
 			result.put("SPEC_VALUE_NM", paramsMap.get("SPEC_VALUE_NM"));
 			result.put("success", true);
 		}else{
 			result.put("errorMsg", result.get("OUT_ERR_MSG"));
 			result.put("success", false);
 		}
		return result;
	}
	
	
}
