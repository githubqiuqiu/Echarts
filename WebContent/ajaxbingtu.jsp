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
	        	               
	        	            ]
	        	        }
	        	    ],
	        	    //显示类别
	        	    legend: {
	                    orient: 'vertical',
	                    x: 'left',
	                   
	                    data: []
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
	        	    	x:'500px',
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
		            
		            //把数据显示出来
		            label: {
		                normal: {
		                    formatter: '{b}：{c} ({d}%) ',

		                    }
		                }
		               
	        	};
	   
	        var categories=[]; //类别数组（实际用来盛放X轴坐标值）    
	        var datas=[];    //销量数组（实际用来盛放Y坐标值）
	        
	        var names = [];    //类别数组（用于存放饼图的类别）
	        var brower = [];
	        
	        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
	        
	        $.ajax({
	      		 async:true,
	      	 	 cache:true,
	      	 	 url:'${pageContext.request.contextPath}/test/test2',
	      	 	 type:'post',
	      	 	
	      	 	 dataType:'json',
	      	 	 success:function(result){
	      	 		
	      	 		for (var i = 0; i < result.list.length; i++) {
	      	 		 names.push(result.list[i].xaxis);    //挨个取出类别并填入类别数组 
	                 brower.push({
	                     name: result.list[i].xaxis,
	                     value: result.list[i].yaxis
	                 });
						
					}
	      
      	 		//加载为图标时隐藏loading
       	        myChart.hideLoading(); 
      	 		
       	   		//使用刚指定的配置项和数据显示图表。
      	        myChart.setOption(option);
	      			
	      	 	 myChart.setOption({//加载数据图表      
	      	 		 //类别
	                 legend: {                    
	                     data: names
	                 },
	                 //数据
	                 series: [{                    
	                     data: brower
	                 }]
	             });
	      	 	
	      	 	 		 
	      	 },
	      	 
	      	 error:function(XMLHttpRequest,textStatus){
	      	 		 alert("错误");
	      	 	 }
	      	 	 
	      	});
		}
	
	
	</script>
</head>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 600px;height:400px;"></div>
</body>
</html>