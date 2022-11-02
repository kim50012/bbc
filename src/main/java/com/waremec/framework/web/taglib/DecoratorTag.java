package com.waremec.framework.web.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class DecoratorTag extends TagSupport {

    private static final long serialVersionUID = 1L;
    
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int doEndTag() throws JspException {
        pageContext.getRequest().setAttribute("decorator", this.name);

        return super.doEndTag();
    }
}
