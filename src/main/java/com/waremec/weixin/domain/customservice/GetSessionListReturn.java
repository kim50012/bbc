package com.waremec.weixin.domain.customservice;

import java.util.ArrayList;
import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

public class GetSessionListReturn extends WeixinReturn {

	private List<SessionList> sessionlist =  new ArrayList<SessionList>();

	public List<SessionList> getSessionlist() {
		return sessionlist;
	}

	public void setSessionlist(List<SessionList> sessionlist) {
		this.sessionlist = sessionlist;
	}
	
	
}
