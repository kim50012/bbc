package com.waremec.framework.web.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@SuppressWarnings("serial")
public class LineBreakToBrTag extends BodyTagSupport {

    @SuppressWarnings("unused")
    private final Log log = LogFactory.getLog(this.getClass());

    /*
     * private Integer length;
     * private String postFix = "...";
     * public void setLength(Integer length) {
     * this.length = length;
     * }
     * public void setPostFix(String postFix) {
     * this.postFix = postFix;
     * }
     */

    @Override
    public int doAfterBody() throws JspException {

        try {
            JspWriter out = getPreviousOut();
            BodyContent body = getBodyContent();
            String value = body.getString();

            out.print(replaceLineBrearToBr(value));
        }
        catch (Exception e) {
            throw new JspTagException(e);
        }

        return SKIP_BODY;
    }

    private String replaceLineBrearToBr(String string) {
        return StringUtils.replace(StringUtils.replace(string, "\r\n", "<br/>"), "\n", "<br/>");
    }
}
