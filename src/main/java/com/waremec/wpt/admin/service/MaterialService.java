package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.MaterialDao;
import com.waremec.wpt.admin.domain.NewsItem;

@Service
public class MaterialService extends CommonServiceImpl implements CommonService{

	@Resource
	private MaterialDao materialDao;

	 
	public Integer addNewsMaterial(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		Integer msgId = materialDao.addNewsMaterial(map);
		
		List<NewsItem> newsItemList = (List<NewsItem>)map.get("newsItemList");
		for (NewsItem item : newsItemList) {
			item.setMsgId(msgId);
			
			materialDao.addNewsMaterialItem(item);
		}
		
		return msgId;
		
	}


	public Integer modifyNewsMaterial(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Integer msgId = (Integer) map.get("MSG_ID");
		msgId = materialDao.modifyNewsMaterial(map);
		
		List<NewsItem> newsItemList = (List<NewsItem>)map.get("newsItemList");
		for (NewsItem item : newsItemList) {
			item.setMsgId(msgId);
			
			materialDao.modifyNewsMaterialItem(item);
		}
		
		return msgId;
	}
	 
}
