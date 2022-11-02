package com.waremec.framework.web.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * resoliwan
 */
@SuppressWarnings("serial")
public class StringEllipsisTag extends TagSupport {

    private final Log log = LogFactory.getLog(this.getClass());

    private String value;

    private Integer length;

    private String suffix = "...";

    private final StringBuffer destStr = new StringBuffer();

    @Override
    public int doStartTag() throws JspTagException {
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspTagException {
        destStr.setLength(0);
        addCutedStr2Dest();
        addPostFix2DestIfIsNotNull();
           
        try {
			pageContext.getOut().print(destStr.toString());
		} catch (IOException ex) {
			// TODO Auto-generated catch block
			 throw new JspTagException("StringEllipsisTag : " + ex.getMessage());
		}

        return EVAL_PAGE;
    }

    private void addCutedStr2Dest() {
        length = getLengthByStrSizte();
        destStr.append(value.substring(0, length));
    }

    private Integer getLengthByStrSizte() {
        return value.length() <= length ? value.length() : length;
    }

    private void addPostFix2DestIfIsNotNull() {
        if (value.length() > length) {
            destStr.append(suffix);
        }
    }
    
    public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

    
 
}
