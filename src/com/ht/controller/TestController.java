package com.ht.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ht.bean.Echart;
import com.ht.bean.Echarts;
import com.ht.bean.TestlineData;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/test1")
	@ResponseBody
	public Object test1() {
		String [] categories = {"衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"};
		Integer [] data= {5, 20, 36, 10, 10,30};
		
		List<Echart> list=new ArrayList<>();
		for (int i = 0; i < categories.length; i++) {
			list.add(new Echart(categories[i],data[i]));
		}
		return list;
	}
	
	@RequestMapping("/test2")
	@ResponseBody
	public Object test2() {
		List<Echart> list=new ArrayList<>();
		list.add(new Echart("视频广告",234));
		list.add(new Echart("联盟广告",456));
		list.add(new Echart("邮件营销",678));
		list.add(new Echart("直接访问",789));
		list.add(new Echart("百度广告",123));
		
		
		Map map=new HashMap<>();
		
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping("/test3")
	@ResponseBody
	public Object test3() {
		Integer[] data1 = {120, 132, 101, 134, 90, 230, 210};  
	    Integer[] data2 = {20, 232, 11, 144, 90, 30, 90};  
	    Integer[] data3 = {180, 120, 161, 84, 60, 230, 10};  
	    Integer[] data4 = {120, 220, 200, 54, 190, 230, 150};  
	    Integer[] data5 = {200, 120, 111, 184, 20, 30, 90}; 
	    
	    String[] xcontent = {"周一","周二","周三","周四","周五","周六","周日"}; 
	    
	    Echarts e1=new Echarts("邮件营销",data1);
	    Echarts e2=new Echarts("联盟广告",data2);
	    Echarts e3=new Echarts("视频广告",data3);
	    Echarts e4=new Echarts("直接访问",data4);
	    Echarts e5=new Echarts("搜索引擎",data5);
	    
	    List<Echarts> list=new ArrayList<>();
	    list.add(e1);
	    list.add(e2);
	    list.add(e3);
	    list.add(e4);
	    list.add(e5);
	    
	    TestlineData tld = new TestlineData();  
        tld.setXcontent(xcontent);  
        tld.setList(list);  
        return tld;  
	}
	
	
}
