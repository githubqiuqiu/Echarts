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
			
			 // 基于准备好的dom，初始化echarts实例
	        var myChart = echarts.init(document.getElementById('main'));

	        // 指定图表的配置项和数据
	        var option = {
	          color: ['#3398DB'],
	        	
        	  tooltip : {
        	        trigger: 'axis',
        	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
        	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        	        }
        	    },
        	    
        	    grid: {
        	        left: '3%',
        	        right: '4%',
        	        bottom: '3%',
        	        containLabel: true
        	    },
	        	
	            title: {
	                text: 'ECharts 柱状图'
	            },
	            
	            //保存为图片
        	    toolbox: {
        	        feature: {
        	            saveAsImage: {}
        	        }
        	    },
	           
	            //此处的data值要和下面 series 里面的name值一样  不然图表顶部不会显示标题
	            legend: {
	                data:['销量']
	            },
	            
	            xAxis : [
	                {
	                    type : 'category',
	                    data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
	                    axisTick: {
	                        alignWithLabel: true
	                    }
	                }
	            ],
	            yAxis : [
	                {
	                    type : 'value'
	                }
	            ],
	            series : [
	                {
	                    name:'销量',
	                    type:'bar',
	                    barWidth: '60%',
	                    data:[10, 52, 200, 334, 390, 330, 220]
	                }
	            ]
	        };
	        
	        
	        //加载图标时显示loading
	        myChart.showLoading();
	        
	        // 使用刚指定的配置项和数据显示图表。
	        myChart.setOption(option);
	        
	        //加载为图标时隐藏loading
	        myChart.hideLoading();

		});
	
	   
    </script>

</head>
<body>
这是a.jsp<br><br>
 <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 600px;height:400px;"></div>
</body>
</html>