package com.waremec.wpt.admin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.service.TemplateServcie;
import com.waremec.wpt.admin.dao.BlogDao;
@Service
public class BlogService extends CommonServiceImpl implements CommonService{
	@Resource
	private BlogDao blogDao;
	
	@Resource
	private TemplateServcie templateServcie;
	
	 
	public Map<String, Object> saveBlogGroup(Map<String,Object> map) {
		
		return blogDao.saveBlogGroup(map);
	}

	public Integer createBlog(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		try {
			PageHeader pageHeader =	(PageHeader) map.get("pageHeader");
			
			Integer blogId = blogDao.createBlog(map);
			
			pageHeader.setDisplayId(blogId);
			templateServcie.createTemplatePage(pageHeader);
			
			return blogId;
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception(e.getMessage());
		}
		
	}

	public void modifyBlog(Map<String, Object> map)  throws Exception{
		// TODO Auto-generated method stub
		try {
			PageHeader pageHeader =	(PageHeader) map.get("pageHeader");
			
			blogDao.modifyBlog(map);
			
			templateServcie.modifyTemplatePage(pageHeader);
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new Exception(e.getMessage());
		}
	}
	
	
}

