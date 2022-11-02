package com.waremec.framework.web.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MaskTag extends BodyTagSupport {

	private final Log logger = LogFactory.getLog(this.getClass());

	private static final long serialVersionUID = 7000973688512676544L;

	private String pattern;

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	@Override
	public int doAfterBody() throws JspException {
		try {
			JspWriter out = getPreviousOut();
			BodyContent body = getBodyContent();
			String value = body.getString();

//			logger.info("value===" + value);
			
			if (StringUtils.isNotBlank(value) && StringUtils.isNotBlank(pattern)) {
				String tmpStr = "";
				char[] valueChar = value.toCharArray();
				char[] patternChar = pattern.toCharArray();

				if ((valueChar != null) && (valueChar.length > 0) && (patternChar != null) && (patternChar.length > 0)) {
					int i = 0;
					int k = 0;

					while (k < patternChar.length) {
						if (patternChar[k] == '#') {
							if (i < valueChar.length) {
								tmpStr += valueChar[i];
								i++;
							}

							k++;
						} else {
							while ((k < patternChar.length) && (patternChar[k] != '#')) {
								tmpStr += patternChar[k];
								k++;
							}
						}
					}
				}

				out.print(tmpStr);
			}
		} catch (Exception ex) {
			throw new JspTagException("MaskTag : " + ex.getMessage());
		}

		return SKIP_BODY;
	}
}
