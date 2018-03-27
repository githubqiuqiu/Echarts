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
        	    color: ['#3398DB'],
        	    //保存为图片
        	    toolbox: {
        	    	x:"500px",
        	        feature: {
        	            saveAsImage: {}
        	        }
        	    },
        	    //图表标题
        	    title: {
	                text: 'ECharts 柱状图'
	            },
	            
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
        	    
        	    //注意此处的data值要和series里面的name值一样
        	    legend: {
        	        data:['销量']
        	    },
        	    xAxis : [
        	        {
        	            type : 'category',
        	            data : [],
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
        	            data:[]
        	        }
        	    ]
        	};
		
        
        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
        
        var categories=[];    //类别数组（实际用来盛放X轴坐标值）
        var datas=[];    //销量数组（实际用来盛放Y坐标值）
        
        $.ajax({
      		 async:true,
      	 	 cache:true,
      	 	 url:'${pageContext.request.contextPath}/test/test1',
      	 	 type:'post',
      	 	
      	 	 dataType:'json',
      	 	 success:function(result){
      	 		
      	 		if(result){
      	 			
      	 		 for(var i=0;i<result.length;i++){       
      	 			categories.push(result[i].xaxis);    //挨个取出类别并填入类别数组
                   }
                  for(var i=0;i<result.length;i++){       
                      datas.push(result[i].yaxis);    //挨个取出销量并填入销量数组
                    }
      	 		}
      	 		
      	 		//加载为图标时隐藏loading
       	        myChart.hideLoading(); 
      	 		
       	   		//使用刚指定的配置项和数据显示图表。
      	        myChart.setOption(option);
       	   
       	   
      	 	   myChart.setOption({
      	         xAxis: {
      	        	data:categories ,
      	         },
      	         series: [{
      	             // 根据名字对应到相应的系列
      	             name: '销量',
      	           data:datas ,
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