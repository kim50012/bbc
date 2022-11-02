package com.waremec.wpt.front.domain;

import java.util.HashSet;
import java.util.Set;

public class GoodsSpec {

	private Integer specId;
	private String specNm;

	private Set<GoodsSpecValue> specValues = new HashSet<GoodsSpecValue>();

	public Integer getSpecId() {
		return specId;
	}

	public void setSpecId(Integer specId) {
		this.specId = specId;
	}

	public String getSpecNm() {
		return specNm;
	}

	public void setSpecNm(String specNm) {
		this.specNm = specNm;
	}

	public Set<GoodsSpecValue> getSpecValues() {
		return specValues;
	}

	public void setSpecValues(Set<GoodsSpecValue> specValues) {
		this.specValues = specValues;
	}

	@Override
	public String toString() {
		
		String sub = "";
		
		for (GoodsSpecValue item : specValues) {  
			sub += item + "\n";
		} 
		return "GoodsSpec [specId=" + specId + ", specNm=" + specNm + ""
				+ ""
				+ ", \nspecValues=" + sub + "]";
	}
	
	

}
