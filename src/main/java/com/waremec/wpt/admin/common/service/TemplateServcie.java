package com.waremec.wpt.admin.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;
import com.waremec.wpt.admin.dao.TemplateDao;

@Service
public class TemplateServcie extends CommonServiceImpl implements CommonService{

	@Resource
	private TemplateDao templateDao;

	public Integer createTemplatePage(PageHeader pageHeader) throws Exception {
		// TODO Auto-generated method stub
		
		Integer pageId = createPageHeader(pageHeader); 
		
		List<PageItem> pageItems = pageHeader.getItems();
		for (PageItem pageItem : pageItems) {
			pageItem.setPageId(pageId);
			
			Integer itemId = createPageItem(pageItem); 
			
			List<PageDtl> details = pageItem.getDetails();
			for (int i = 0; i < details.size(); i++) {
				details.get(i).setPageId(pageId);
				details.get(i).setItemId(itemId);
				int dtlId = createPageTel(details.get(i));
				details.get(i).setDtlId(dtlId);
			}
		}
		return pageId;
	}
	
	public void modifyTemplatePage(PageHeader pageHeader)  throws Exception{
		Integer pageId = modifyPageHeader(pageHeader); 
		
		List<PageItem> pageItems = pageHeader.getItems();
		for (PageItem pageItem : pageItems) {
			pageItem.setPageId(pageId);
			
			Integer itemId = modifyPageItem(pageItem); 
			
			List<PageDtl> details = pageItem.getDetails();
			for (int i = 0; i < details.size(); i++) {
				details.get(i).setPageId(pageId);
				details.get(i).setItemId(itemId);
				modifyPageTel(details.get(i));
			}
		}
		
	}
	
	public Integer createPageHeader(PageHeader pageHeder) throws Exception {
		return templateDao.createPageHeader(pageHeder);
	}
	
	public Integer createPageItem(PageItem pageItem) throws Exception {
		return templateDao.createPageItem(pageItem);
	}
	
	public Integer createPageTel(PageDtl pageTel) throws Exception {
		return templateDao.createPageTel(pageTel);
	}
	
	public Integer modifyPageHeader(PageHeader pageHeder) throws Exception {
		return templateDao.modifyPageHeader(pageHeder);
	}
	
	public Integer modifyPageItem(PageItem pageItem) throws Exception {
		return templateDao.modifyPageItem(pageItem);
	}
	
	public Integer modifyPageTel(PageDtl pageTel) throws Exception {
		return templateDao.modifyPageTel(pageTel);
	}

	
	 
}
