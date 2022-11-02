/**   
 * @Title: PagingTag.java 
 * @Package com.waremec.framework.web.taglib 
 * @Description:  
 * @author taebem
 * @date 2015年7月9日 上午8:30:37 
 * @version V1.0   
 */
package com.waremec.framework.web.taglib;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.framework.common.PageData;
import com.waremec.framework.utilities.LabelUtil;

/**
 * @Package com.waremec.framework.web.taglib
 * @FileName PagingTag
 * @Description
 * @author taebem
 * @date 2015年7月9日 上午8:30:37
 * 
 */
public class PagingTag extends SimpleTagSupport {

	private final Log logger = LogFactory.getLog(this.getClass());

	private PageData page;
	private Boolean showSize = true;
	private String method = "showPage";
	private String position = "center";
	
	private String btn1text = "";
	private String btn1bgclass = "bg-orange";
	private String btn1jsclass = "js-conform";
	private String btn1click = "";
	private String btn1icon = "";
	private String btn2text = "";
	private String btn2bgclass = "bg-orange";
	private String btn2jsclass = "js-cancel";
	private String btn2click = "";
	private String btn2icon = "";
	
//	private static final String 
	
	private String getLabel(Map<String,String> label, String key){
		String val = label.get(key);
		if(StringUtils.isBlank(val)){
			val = key;
		}
		return val;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
//		HttpSession session = ((PageContext)this.getJspContext()).getSession();
		HttpServletRequest request = (HttpServletRequest)((PageContext)this.getJspContext()).getRequest();
		Map<String,String> label = LabelUtil.getLabelMap(request.getSession().getServletContext());	
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("<div class='page-navigation-warp clearfix' >");
		
		if(StringUtils.isNotBlank(btn1text) || StringUtils.isNotBlank(btn2text)){
			sb.append("<div class='paging-buttons'>");
			if(StringUtils.isNotBlank(btn1text)){
				if(StringUtils.isNotBlank(btn1click)){
					sb.append("<span class='button " + btn1bgclass + " " + btn1jsclass + "' onclick='" + btn1click + "'>");
				}else{
					sb.append("<span class='button " + btn1bgclass + " " + btn1jsclass + "' >");
				}
				if(StringUtils.isNotBlank(btn1icon)){
					sb.append(	"<span class='button-icon " + btn1icon + "'></span>");
				}
				sb.append(		"<span class='button-name'>" + getLabel(label, btn1text) + "</span>");
				sb.append(	"</span>");
			}
			if(StringUtils.isNotBlank(btn2text)){
				if(StringUtils.isNotBlank(btn2click)){
					sb.append("<span class='button " + btn2bgclass + " " + btn2jsclass + "' onclick='" + btn2click + "'>");
				}else{
					sb.append("<span class='button " + btn2bgclass + " " + btn2jsclass + "' >");
				}
				if(StringUtils.isNotBlank(btn2icon)){
					sb.append(	"<span class='button-icon " + btn2icon + "'></span>");
				}
				sb.append(		"<span class='button-name'>" + getLabel(label, btn2text) + "</span>");
				sb.append(	"</span>");
			}
			
			sb.append("</div>");
		}
		
		
		if(page.getData() != null && !page.getData().isEmpty()){
			if(position.equals("right")){
				sb.append(	"<div class='paging-total-summary-right' >");
			}else{
				sb.append(	"<div class='paging-total-summary' >");
			}
			sb.append(			getLabel(label, "每页"))
			.append(			page.getPageSize())
			.append(			getLabel(label, "条"))
			.append(			", ")
			.append(			getLabel(label, "共"))
			.append(			page.getTotalCount())
			.append(			getLabel(label, "条"))
			.append(		"</div>");
			
			if(position.equals("right")){
				sb.append(	"<div class='page-navigation page-navigation-rigth' >");
			}else{
				sb.append(	"<div class='page-navigation' >");
			}
			
			sb.append(			"<a class='page-navi'>");
			if(page.isFisrtPage()){
				sb.append(			"<span class='page-icon js-page-first page-first-disabled'></span>");
			}else{
				sb.append(			"<span class='page-icon js-page-first page-first' onclick='" + method + "(1," + page.getPageSize() + ");'></span>");
			}
			sb.append(			"</a>")
			.append(			"<a class='page-navi'>");
			if(page.isHasPreviousPage()){
				sb.append(			"<span class='page-icon js-page-preview page-preview' onclick='" + method + "(" +( page.getPageNo() - 1 )+  "," + page.getPageSize() + ");'></span>");
			}else{
				sb.append(			"<span class='page-icon js-page-preview page-preview-disabled'></span>");
			}
			sb.append(			"</a>"); 
			sb.append(			"<select id='currentPage' onchange='" + method + "(this.value," + page.getPageSize() + ");' class='page-select select2 js-current-page'>");
			for(int idx = 1; idx <= page.getTotalPageCount(); idx++){
				if(page.getPageNo() == idx){
					sb.append(		"<option value='" + idx + "' selected='selected'>" + idx + "</option>");
				}else{
					sb.append(		"<option value='" + idx + "'>" + idx + "</option>");
				}
				
			}
			sb.append(			"</select>");
			sb.append(			"<a class='page-navi'>");
			if(page.isHasNextPage()){
				sb.append(			"<span class='page-icon js-page-next page-next' onclick='" + method + "(" +( page.getPageNo() + 1 ) +  "," + page.getPageSize() + ");'></span>");
			}else{
				sb.append(			"<span class='page-icon js-page-next page-next-disabled'></span>");
			}
			sb.append(			"</a>");
			sb.append(			"<a class='page-navi'>");
			if(page.isLastPage()){
				sb.append(			"<span class='page-icon js-page-last page-last-disabled'></span>");
			}else{
				sb.append(			"<span class='page-icon js-page-last page-last' onclick='" + method + "(" + page.getTotalPageCount() +  "," + page.getPageSize() + ");'></span>");
			}
			sb.append(			"</a>");
			if(showSize){
				sb.append(		"<select id='pageUnit' onchange='" + method + "(" + 1 + ",this.value);' class='page-unit select2 js-page-unit' >")
				.append(			"<option value='10' " + (page.getPageSize() == 10 ? "selected='selected'" : "") + ">10</option>")
				.append(			"<option value='20' " + (page.getPageSize() == 20 ? "selected='selected'" : "") + ">20</option>")
				.append(			"<option value='30' " + (page.getPageSize() == 30 ? "selected='selected'" : "") + ">30</option>")
				.append(			"<option value='50' " + (page.getPageSize() == 50 ? "selected='selected'" : "") + ">50</option>")
				.append(		"</select>") 
				.append(		"<span>") 
				.append(		getLabel(label, "条")) 
				.append(		"&nbsp;&nbsp;/&nbsp;&nbsp;") 
				.append(		getLabel(label, "页")) 
				.append(		"</span>"); 
			}
			
			sb.append(		"</div>");
		}else{
			sb.append(		"<div class='paging-no-data'>");
			sb.append(		getLabel(label, "没有数据"));
			sb.append(		"</div>");
		}
			
		
		
		
		
		
		sb.append(	"</div>");
		
		getJspContext().getOut().write(sb.toString()); 
	}

 
	public PageData getPage() {
		return page;
	}

	public void setPage(PageData page) {
		this.page = page;
	}

	public Boolean getShowSize() {
		return showSize;
	}

	public void setShowSize(Boolean showSize) {
		this.showSize = showSize;
	}



	public String getMethod() {
		return method;
	}


	public void setMethod(String method) {
		this.method = method;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	 

	public String getBtn1text() {
		return btn1text;
	}

	public void setBtn1text(String btn1text) {
		this.btn1text = btn1text;
	}

	public String getBtn2text() {
		return btn2text;
	}

	public void setBtn2text(String btn2text) {
		this.btn2text = btn2text;
	}

 

	public String getBtn1bgclass() {
		return btn1bgclass;
	}

	public void setBtn1bgclass(String btn1bgclass) {
		this.btn1bgclass = btn1bgclass;
	}

	public String getBtn2bgclass() {
		return btn2bgclass;
	}

	public void setBtn2bgclass(String btn2bgclass) {
		this.btn2bgclass = btn2bgclass;
	}

	public String getBtn1click() {
		return btn1click;
	}

	public void setBtn1click(String btn1click) {
		this.btn1click = btn1click;
	}

	public String getBtn1icon() {
		return btn1icon;
	}

	public void setBtn1icon(String btn1icon) {
		this.btn1icon = btn1icon;
	}

	 

	public String getBtn2click() {
		return btn2click;
	}

	public void setBtn2click(String btn2click) {
		this.btn2click = btn2click;
	}

	public String getBtn2icon() {
		return btn2icon;
	}

	public void setBtn2icon(String btn2icon) {
		this.btn2icon = btn2icon;
	}

	public String getBtn1jsclass() {
		return btn1jsclass;
	}

	public void setBtn1jsclass(String btn1jsclass) {
		this.btn1jsclass = btn1jsclass;
	}

	public String getBtn2jsclass() {
		return btn2jsclass;
	}

	public void setBtn2jsclass(String btn2jsclass) {
		this.btn2jsclass = btn2jsclass;
	}
	
	
	
	
}
