package com.waremec.wpt.front.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.front.dao.CounterDao;
import com.waremec.wpt.front.domain.Counter;
import com.waremec.wpt.front.domain.PageUrlType;
@Service
public class CounterService extends CommonServiceImpl implements CommonService{
	@Resource
	private CounterDao counterDao;

	public void saveCounter(Counter counter) {
		// TODO Auto-generated method stub
		counterDao.saveCounter(counter);
	}
	public List<PageUrlType> getPageUrlType() {
		// TODO Auto-generated method stub
		return counterDao.getPageUrlType();
	}
	
}
