package com.waremec.framework.web.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MessageTag extends SimpleTagSupport {

	private String info;// 标签的属性
	private int num;// 标签的属性

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		System.out.println("setInfo..." + info);
		this.info = info;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		System.out.println("setNum:" + num);
		this.num = num;
	}
	
	public MessageTag() {
		System.out.println("constructor...");
	}

	@Override
	public void doTag() throws JspException, IOException {
		System.out.println("doTag...");
		PageContext pc = (PageContext) getJspContext();
		JspWriter out = pc.getOut();
		for (int i = 0; i < num; i++) {
			out.println(info + "<br/>");
		}
	}
}
