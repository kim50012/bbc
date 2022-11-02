package com.waremec.wpt.admin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;



@Repository
@SuppressWarnings("unchecked")
public class BlogDao extends CommonDao {

	public Map<String, Object> saveBlogGroup(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Blog.saveBlogGroup", map);
		
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
	 
		if(OUT_ERR_MSG.equals("S")){
			result.put("OUT_BG_NM", map.get("BG_NM"));
 			result.put("success", true);
		}else{
			result.put("errorMsg", result.get("OUT_ERR_MSG"));
 			result.put("success", false);
		}
		
		return result;
	}

	public Integer createBlog(Map<String, Object> map) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Blog.createBlog", map);
		
		Integer blogId = (Integer )result.get("OUT_BLOG_ID");
		String OUT_ERR_MSG = (String )result.get("OUT_ERR_MSG");
		
		if(blogId ==0  ){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return blogId;
	}

	public void modifyBlog(Map<String, Object> map) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Blog.modifyBlog", map);
		
		Integer blogId = (Integer )result.get("OUT_BLOG_ID");
		String OUT_ERR_MSG = (String )result.get("OUT_ERR_MSG");
		
		if(blogId ==0  ){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
	}
 
	
}
