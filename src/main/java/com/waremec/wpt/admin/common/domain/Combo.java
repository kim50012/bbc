package com.waremec.wpt.admin.common.domain;


import java.io.Serializable;
 
public class Combo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer comboKey  ;
	private String comboValue = "";
	
	public Combo() {
		 this(null,"");
	}
	
	public Combo(Integer comboKey, String comboValue) {
		super();
		this.comboKey = comboKey;
		this.comboValue = comboValue;
		 
	}
	
	public Integer getComboKey() {
		return comboKey;
	}
	public void setComboKey(Integer comboKey) {
		this.comboKey = comboKey;
	}
	public String getComboValue() {
		return comboValue;
	}
	public void setComboValue(String comboValue) {
		this.comboValue = comboValue;
	}

 

}
