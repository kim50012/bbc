package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.common.domain.Combo;
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;

@Repository
public class TemplateDao extends CommonDao {
	public List<Combo> findList(Map<String, Object> map) {
		return (List<Combo>) this.getSqlMapClientTemplate().queryForList("Combo.findList", map);
	}

	public Integer createPageHeader(PageHeader pageHeder) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Template.createPageHeader", pageHeder);
		return (Integer)result.get("OUT_PAGE_ID");
	}
	
	public Integer modifyPageHeader(PageHeader pageHeder) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Template.modifyPageHeader", pageHeder);
		return (Integer)result.get("OUT_PAGE_ID");
	}

	public Integer createPageItem(PageItem pageItem) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Template.createPageItem", pageItem);
		return (Integer)result.get("OUT_ITEM_ID");
	}
	

	public Integer modifyPageItem(PageItem pageItem) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Template.modifyPageItem", pageItem);
		return (Integer)result.get("OUT_ITEM_ID");
	}

	public Integer createPageTel(PageDtl pageTel) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Template.createPageTel", pageTel);

		return (Integer)result.get("OUT_DTL_ID");
	}


	public Integer modifyPageTel(PageDtl pageTel) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Template.modifyPageTel", pageTel);

		return (Integer)result.get("OUT_DTL_ID");
	}
}
