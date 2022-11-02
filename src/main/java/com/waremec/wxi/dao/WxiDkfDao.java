package com.waremec.wxi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.waremec.wxi.domain.DKFAcountDomain;
import com.waremec.wxi.domain.GroupDomain;

@Repository
@SuppressWarnings("deprecation")
public class WxiDkfDao extends SqlMapClientDaoSupport {
	
	 
	
	 
	 
	public Integer keywordInsert(int shopId,String keywordGroup,String keyword,String newsPicType,String arsTitle,String arsImage,String arsContent,String arsUrl,String keywordType){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("keywordGroup", keywordGroup);
		map.put("keyword", keyword);
		map.put("newsPicType", newsPicType);
		map.put("arsTitle", arsTitle);
		map.put("arsImage",arsImage);
		map.put("arsContent", arsContent);
		map.put("arsUrl", arsUrl);
		map.put("keywordType", keywordType);
		
		return (Integer) getSqlMapClientTemplate().queryForObject("wxi.saveKeyword",map);
	}
	public Integer keywordUpdate(int shopId,String keywordGroup,String keyword,String newsPicType,String arsTitle,String arsImage,String arsContent,String arsUrl,String keywordType,String keyWordBefore){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("keywordGroup", keywordGroup);
		map.put("keyword", keyword);
		map.put("newsPicType", newsPicType);
		map.put("arsTitle", arsTitle);
		map.put("arsImage",arsImage);
		map.put("arsContent", arsContent);
		map.put("arsUrl", arsUrl);
		map.put("keywordType", keywordType);
		map.put("keyWordBefore", keyWordBefore);
		return (Integer) getSqlMapClientTemplate().queryForObject("wxi.updateKeyword",map);
	}
	public List<GroupDomain> keywordGroupList(int shopId){
		
		return getSqlMapClientTemplate().queryForList("wxi.keywordGroupList",shopId);
	}
	
	public List<DKFAcountDomain> keywordList(int shopId){
		
		return getSqlMapClientTemplate().queryForList("wxi.keywordList",shopId);
	}
	
	public Integer removeKeyword(String keywordIndex,int shopId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keywordIndex", keywordIndex);
		map.put("shopId", shopId);
		return (Integer) getSqlMapClientTemplate().queryForObject("wxi.removeKeyword",map);
	}
}
