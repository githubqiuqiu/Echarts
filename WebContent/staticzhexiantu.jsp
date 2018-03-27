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
		
		function showtable(){
			// 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('main'));
	        option = {
	        	    title: {
	        	        text: '折线图堆叠'
	        	    },
	        	    tooltip: {
	        	        trigger: 'axis'
	        	    },
	        	    legend: {
	        	        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
	        	    },
	        	    grid: {
	        	        left: '3%',
	        	        right: '4%',
	        	        bottom: '3%',
	        	        containLabel: true
	        	    },
	        	    toolbox: {
	        	        feature: {
	        	            saveAsImage: {}
	        	        }
	        	    },
	        	    xAxis: {
	        	        type: 'category',
	        	        boundaryGap: false,
	        	        data: ['周一','周二','周三','周四','周五','周六','周日']
	        	    },
	        	    yAxis: {
	        	        type: 'value'
	        	    },
	        	    series: [
	        	        {
	        	            name:'邮件营销',
	        	            type:'line',
	        	            stack: '总量',
	        	            data:[120, 132, 101, 134, 90, 230, 210]
	        	        },
	        	        {
	        	            name:'联盟广告',
	        	            type:'line',
	        	            stack: '总量',
	        	            data:[220, 182, 191, 234, 290, 330, 310]
	        	        },
	        	        {
	        	            name:'视频广告',
	        	            type:'line',
	        	            //stack写'总量'  就是累加  ''就为正常
	        	            stack: '',
	        	            data:[150, 232, 201, 154, 190, 330, 410]
	        	        },
	        	        {
	        	            name:'直接访问',
	        	            type:'line',
	        	            stack: '',
	        	            data:[320, 332, 301, 334, 390, 330, 320]
	        	        },
	        	        {
	        	            name:'搜索引擎',
	        	            type:'line',
	        	            stack: '',
	        	            data:[820, 932, 901, 934, 1290, 1330, 1320]
	        	        }
	        	    ]
	        	};

				
	     // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
		}
	
	
	</script>
	
</head>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 800px;height:600px;"></div>
</body>
</html>