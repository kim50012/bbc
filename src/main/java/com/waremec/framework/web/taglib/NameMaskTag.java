package com.waremec.framework.web.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class NameMaskTag extends BodyTagSupport {
	private static final long serialVersionUID = 5436815524215889757L;

	@Override
	public int doAfterBody() throws JspException {
		try {
			JspWriter out = getPreviousOut();
			BodyContent body = getBodyContent();
			String value = body.getString();

			String tmpStr = "";
			char[] valueChar = value.toCharArray();
			int valueLength = valueChar.length;

			if ((valueChar != null) && (valueChar.length > 0)) {
				for (int i = 0; i < valueLength; i++) { 
					if (i == 0 || i == (valueLength - 1)) {
						tmpStr += valueChar[i];
					} else {
						tmpStr += "*";
					}
				}
			}
			out.print(tmpStr);
		} catch (Exception ex) {
			throw new JspTagException("NameMaskTag : " + ex.getMessage());
		}

		return SKIP_BODY;
	}
}
