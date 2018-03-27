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
	        	   
	        	    tooltip: {
	        	        trigger: 'axis'
	        	    },
	        	    //类别
	        	    legend: {
	        	    	 x:'right',
	        	        data:[]
	        	    },
	        	    
	        	    grid: {
	        	        left: '3%',
	        	        right: '4%',
	        	        bottom: '3%',
	        	        containLabel: true
	        	    },
	        	    
	        	    //保存为图片
	        	    toolbox: {
	        	    	y:'15px',
	        	        feature: {
	        	            saveAsImage: {}
	        	        }
	        	    },
	        	  	//图表标题
	        	    title: {
	        	    	
		                text: 'ECharts 折线图'
		            },
		            //横坐标
	        	    xAxis: {
	        	        type: 'category',
	        	        boundaryGap: false,
	        	        data: []
	        	    },
	        	    //纵坐标
	        	    yAxis: {
	        	        type: 'value'
	        	    },
	        	    //值
	        	    series: [{
	        	     
	        	    } ]
	        	};
	        
	        
	        myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
	      
	        $.ajax({
	      		 async:true,
	      	 	 cache:true,
	      	 	 url:'${pageContext.request.contextPath}/test/test3',
	      	 	 type:'post',
	      	 	
	      	 	 dataType:'json',
	      	 	 success:function(jsons){
	      	 	
	      	 	 //alert(jsons.xcontent);
	      	 	 //alert(jsons.list.length);
	      	 	 //alert(jsons.list[0].name);
	      	 	 //alert(jsons.xcontent.length)
	      	 	 
	      	 	 var item=function(){
	      	 		 return{
	      	 			 name:'',
	      	 			 type:'line',
	      	 			 stack:'',
	      	 			 data:[]
	      	 		 }
	      	 	 }
	      	 	 
	      	 	
	      	 	 var legends = [];// 准备存放图例数据  
	             var Series = []; // 准备存放图表数据  
	          
	             for(var i=0;i < jsons.list.length;i++){  
	            	 var it = new item();  
	            	 it.name=jsons.list[i].name;
	            	 it.data=jsons.list[i].value;
	            	 
	            	 legends.push(jsons.list[i].name);// 将每一项的图例名称也放到图例的数组中
	            	 Series.push(it);// 将item放在series中 
	             }  
	             
	             
	            //设置类别到折线图 
	            option.legend.data = legends;
	            
	            //设置横坐标到折线图
	            option.xAxis.data = jsons.xcontent;
	            
	            //设置显示的值到折线图
	            option.series = Series;
	            
	           //加载为图标时隐藏loading
       	        myChart.hideLoading(); 
	           
	           // 重新加载图表  
	      	 	myChart.setOption(option);
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