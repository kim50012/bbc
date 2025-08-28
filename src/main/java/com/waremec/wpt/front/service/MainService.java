package com.waremec.wpt.front.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.front.dao.MainDao;

@Service
public class MainService extends CommonServiceImpl implements CommonService{
	@Resource
	private MainDao mainDao;
	
}
