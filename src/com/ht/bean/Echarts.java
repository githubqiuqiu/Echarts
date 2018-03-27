package com.ht.bean;

import java.util.Arrays;

public class Echarts {
	private String name;
	private Integer[] value;
	

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer[] getValue() {
		return value;
	}
	public void setValue(Integer[] value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "Echarts [name=" + name + ", value=" + Arrays.toString(value) + "]";
	}
	public Echarts(String name, Integer[] value) {
		super();
		this.name = name;
		this.value = value;
	}
	public Echarts() {
		super();
	}
	
}
