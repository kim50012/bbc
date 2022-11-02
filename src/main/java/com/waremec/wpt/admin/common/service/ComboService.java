package com.waremec.wpt.admin.common.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.common.domain.Combo;
import com.waremec.wpt.admin.dao.ComboDao;

@Service
public class ComboService extends CommonServiceImpl implements CommonService{

	@Resource
	private ComboDao  comboDao;
	
	public List<Combo> getList(Map<String, Object> map){
		return comboDao.findList(map);
	}
	public List<Combo> getShopGoodsClassLevelOneCombo(Integer shopId){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("comboType",ComboType.SHOP_GOODS_CLASS_LEVEL_ONE);
		map.put("shopId", shopId);
		return getList(map);
	}
	
	
	public List<Combo> getSheetListCombo(Integer shopId){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("comboType",ComboType.SHEET_LIST_COMBO);
		map.put("shopId", shopId);
		return getList(map);
	}
	
	public List<Combo> getCompanyCombo(){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("comboType",ComboType.CORP_COMBO);
		return getList(map);
	}
	public List<Combo> getShopListByCompanyCombo(Integer corpId){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("comboType",ComboType.SHOP_LIST_BY_CORP_COMBO);
		map.put("paramsI1", corpId);
		return getList(map);
	}
	
	
	public List<Combo> getList(Integer shopId,Integer comboType){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("comboType",comboType);
		map.put("shopId", shopId);
		return getList(map);
	}
	
}
