package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.service.TemplateServcie;
import com.waremec.wpt.admin.dao.GoodsDisplayDao;
import com.waremec.wpt.admin.domain.dispaly.GoodsDispalyPriceInsert;
import com.waremec.wpt.admin.domain.dispaly.GoodsDisplayInsert;
 
@Service
public class GoodsDisplayServcie extends CommonServiceImpl implements CommonService{
 
	@Resource
	private GoodsDisplayDao goodsDisplayDao;
	 
	@Resource
	private TemplateServcie templateServcie;
	
	public void createGoodsDisplay(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		GoodsDisplayInsert goodsDisplayInsert =	(GoodsDisplayInsert) map.get("goodsDisplayInsert");
		List<GoodsDispalyPriceInsert> priceList =	(List<GoodsDispalyPriceInsert>) map.get("priceList");
		PageHeader pageHeader =	(PageHeader) map.get("pageHeader");
		
		Integer displayId = goodsDisplayDao.insertGoodsDisplay(goodsDisplayInsert);
		for (GoodsDispalyPriceInsert item : priceList) {
			item.setDisplayId(displayId);
			goodsDisplayDao.insertGoodsDispalyPrice(item);
		}
		
		if(!pageHeader.getItems().isEmpty()){
			pageHeader.setDisplayId(displayId);
			templateServcie.createTemplatePage(pageHeader);
		}
		
	}
	
	public void modifyGoodsDisplay(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		GoodsDisplayInsert goodsDisplayInsert =	(GoodsDisplayInsert) map.get("goodsDisplayInsert");
		List<GoodsDispalyPriceInsert> priceList =	(List<GoodsDispalyPriceInsert>) map.get("priceList");
		PageHeader pageHeader =	(PageHeader) map.get("pageHeader");
		
		goodsDisplayDao.modifyGoodsDisplay(goodsDisplayInsert);
		for (GoodsDispalyPriceInsert item : priceList) {
			goodsDisplayDao.modifyGoodsDispalyPrice(item);
		}
		
		pageHeader.setDisplayId(goodsDisplayInsert.getDisplayId());
		templateServcie.modifyTemplatePage(pageHeader);
	}

	public void createDisplayCopy(Map<String, Object>  map) throws Exception {
		
		// TODO Auto-generated method stub
				GoodsDisplayInsert goodsDisplayInsert =	(GoodsDisplayInsert) map.get("goodsDisplayInsert");
				List<GoodsDispalyPriceInsert> priceList =	(List<GoodsDispalyPriceInsert>) map.get("priceList");
				PageHeader pageHeader =	(PageHeader) map.get("pageHeader");
				
				Integer displayId = goodsDisplayDao.insertGoodsDisplay(goodsDisplayInsert);
				for (GoodsDispalyPriceInsert item : priceList) {
					item.setDisplayId(displayId);
					goodsDisplayDao.insertGoodsDispalyPrice(item);
				}
				
				if(!pageHeader.getItems().isEmpty()){
					pageHeader.setDisplayId(displayId);
					templateServcie.createTemplatePage(pageHeader);
				}
				
		
	}

}
