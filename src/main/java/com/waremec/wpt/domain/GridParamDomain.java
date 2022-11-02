package com.waremec.wpt.domain;

public class GridParamDomain {
	
	private String field;
    private String dir;
    private int skip;
    private int take;
    
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public int getSkip() {
		return skip;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}
	public int getTake() {
		return take;
	}
	public void setTake(int take) {
		this.take = take;
	}
    
}
