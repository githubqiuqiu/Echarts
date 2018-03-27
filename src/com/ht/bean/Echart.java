package com.ht.bean;

import java.util.Arrays;

public class Echart {
	private String xaxis;
	private Integer yaxis;
	public String getXaxis() {
		return xaxis;
	}
	public void setXaxis(String xaxis) {
		this.xaxis = xaxis;
	}
	public Integer getYaxis() {
		return yaxis;
	}
	public void setYaxis(Integer yaxis) {
		this.yaxis = yaxis;
	}
	@Override
	public String toString() {
		return "Echart [xaxis=" + xaxis + ", yaxis=" + yaxis + "]";
	}
	public Echart(String xaxis, Integer yaxis) {
		super();
		this.xaxis = xaxis;
		this.yaxis = yaxis;
	}
	public Echart() {
		super();
	}
	
	
}
