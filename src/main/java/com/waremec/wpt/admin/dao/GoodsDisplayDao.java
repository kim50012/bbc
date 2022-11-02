package com.waremec.wpt.admin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.dispaly.GoodsDispalyPriceInsert;
import com.waremec.wpt.admin.domain.dispaly.GoodsDisplayInsert;

@Repository
@SuppressWarnings("unchecked")
public class GoodsDisplayDao extends CommonDao {

	public Integer insertGoodsDisplay(GoodsDisplayInsert goodsDisplayInsert)  {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("GoodsDisplay.insertGoodsDisplay", goodsDisplayInsert);
		
		
		Integer displayId = (Integer)result.get("OUT_DISPLAY_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return displayId;
		 
	}
	
	public void modifyGoodsDisplay(GoodsDisplayInsert goodsDisplayInsert) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("GoodsDisplay.modifyGoodsDisplay", goodsDisplayInsert);
		
		Integer displayId = (Integer)result.get("OUT_DISPLAY_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
	}

	
	public Integer insertGoodsDispalyPrice(GoodsDispalyPriceInsert goodsDispalyPriceInsert) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("GoodsDisplay.insertGoodsDispalyPrice", goodsDispalyPriceInsert);
		
		Integer displayId = (Integer)result.get("OUT_DISPLAY_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return displayId;
		
	}

	public void modifyGoodsDispalyPrice(GoodsDispalyPriceInsert goodsDispalyPriceInsert) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("GoodsDisplay.modifyGoodsDispalyPrice", goodsDispalyPriceInsert);
		
		Integer displayId = (Integer)result.get("OUT_DISPLAY_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
	}

	 
}
