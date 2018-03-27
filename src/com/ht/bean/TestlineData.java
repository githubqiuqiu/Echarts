package com.ht.bean;

import java.util.Arrays;
import java.util.List;

public class TestlineData {
	private String [] xcontent;
	private List<Echarts> list;
	public String[] getXcontent() {
		return xcontent;
	}
	public void setXcontent(String[] xcontent) {
		this.xcontent = xcontent;
	}
	public List<Echarts> getList() {
		return list;
	}
	public void setList(List<Echarts> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "TestlineData [xcontent=" + Arrays.toString(xcontent) + ", list=" + list + "]";
	}
	public TestlineData(String[] xcontent, List<Echarts> list) {
		super();
		this.xcontent = xcontent;
		this.list = list;
	}
	public TestlineData() {
		super();
	}
	
	
}
