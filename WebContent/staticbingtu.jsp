<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- 引入jquery 文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  	<!-- 引入 ECharts 文件 -->
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			 showtable();
		});
		
		//显示图表
		function showtable(){
			// 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('main'));
			
	        option = {
	        	    series : [
	        	        {
	        	            name: '访问来源',
	        	            type: 'pie',
	        	            radius: '55%',
	        	            //加上roseType: 'angle',  就是南丁格尔图
	        	            //roseType: 'angle',
	        	            data:[
	        	            	 {value:235, name:'视频广告'},
	        	                 {value:274, name:'联盟广告'},
	        	                 {value:310, name:'邮件营销'},
	        	                 {value:335, name:'直接访问'},
	        	                 {value:400, name:'搜索引擎'}
	        	            ]
	        	        }
	        	    ],
	        	    //显示类别
	        	    legend: {
	                    orient: 'vertical',
	                    x: 'left',
	                    data: ["视频广告","联盟广告","邮件营销","直接访问","搜索引擎"]
	                },
	                //显示百分百
	                tooltip: {
	                    trigger: 'item',
	                    formatter: "{a} <br/>{b} : {c} ({d}%)"
	                }, 
	                //设置阴影
	        	    itemStyle: {
	        	        normal: {
	        	            // 阴影的大小
	        	            shadowBlur: 200,
	        	            // 阴影水平方向上的偏移
	        	            shadowOffsetX: 0,
	        	            // 阴影垂直方向上的偏移
	        	            shadowOffsetY: 0,
	        	            // 阴影颜色
	        	            shadowColor: 'rgba(0, 0, 0, 0.5)'
	        	        }
	        	    }, 
	        	    //保存为图片
	        	    toolbox: {
	        	        feature: {
	        	            saveAsImage: {}
	        	        }
	        	    },
	        	    
	        	    //图表标题
	        	    title: {
	        	    	//水平位置
	        	    	x: 'center',
		                text: 'ECharts 饼图'
		            },
	        	        
	        	};
	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		}
	
	
	</script>
	
</head>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 600px;height:400px;"></div>
</body>
</html>