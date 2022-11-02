package com.waremec.wpt.admin.domain;

public enum TmplType {
	TYPE_01("type-01","01"),
	TYPE_02("type-02","02"),
	TYPE_03("type-03","03"),
	TYPE_04("type-04","04"),
	TYPE_05("type-05","05"),
	TYPE_06("type-06","06"),
	TYPE_07("type-07","07"),
	TYPE_08("type-08","08"),
	TYPE_09("type-09","09"),
	TYPE_10("type-10","10"),
	TYPE_11("type-11","11"),
	TYPE_12("type-12","12"),
	TYPE_13("type-13","13"),
	TYPE_14("type-14","14"),
	TYPE_15("type-15","15"),
	TYPE_16("type-16","16"),
	TYPE_17("type-17","17"),
	TYPE_18("type-18","18"),
	TYPE_19("type-19","19"),
	TYPE_20("type-20","20"),
	TYPE_52("type-52","52"),
	TYPE_99("type-99","99");
	
	private String type;
	private String num;
	 
	private TmplType(String type, String num) {
		this.type = type;
		this.num = num;
	}
	
	public static String getNumByType(String type) {
		for (TmplType item : TmplType.values()) {
			if(type.equals(item.type)){
				return item.num;
			 }
		}
		return "";
	}

	public String getType() {
		return type;
	}

	public String getNum() {
		return num;
	}
 
	
	
}
