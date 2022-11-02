package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.TimeToSendDao;

@Service
public class TimeToSendService extends CommonServiceImpl implements CommonService{
	@Resource
	private TimeToSendDao timeToSendDao;
	
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 定时发送内容查询
	 */
	public List<Map<String,Object>> selectContant(String string,
			Map<String,Object> searchMap) {
		try{
			return timeToSendDao.selectContant(string, searchMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	

}

