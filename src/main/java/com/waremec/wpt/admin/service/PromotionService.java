package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.PromotionDao;
import com.waremec.wpt.admin.domain.AdminPromotion;

@Service
public class PromotionService extends CommonServiceImpl implements CommonService{

	@Resource
	private PromotionDao promotionDao;

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一级分类查询
	 */ 
	public List<AdminPromotion> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		try {
			return promotionDao.selectshopGoodsClassMap(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一级分类查询
	 */
	public List<AdminPromotion> selectProList(String sqlId, AdminPromotion searchMap) {
		try {
			return promotionDao.selectProList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	店铺商品分类一保存
	 */
	public void insertDomain(String sqlId, AdminPromotion paramIn) {
		try {
			promotionDao.insertDomain(sqlId, paramIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品登记一级分类查询
	 */ 
	public List<AdminPromotion> selectGoodsClass(String sqlId, AdminPromotion searchMap) {
		try {
			return promotionDao.selectGoodsClass(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	} 
	public int selectCount(String sqlId, AdminPromotion searchMap) {
		try {
			return promotionDao.selectCount(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
