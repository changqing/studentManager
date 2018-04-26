<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
  <head>
    <title>信息展示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.css" />
	<script type="text/javascript" src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/highcharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/exporting.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/highcharts-zh_CN.js"></script>
	<style type="text/css">
		body {background-color: #f5f5f5;font-size: 16px;}
		#vLocation {height: 20px;padding: 10px 15px;list-style: none;background-color: #f1f1f1;font-size: 13px;}
		#infoDiv {width: 100%;text-align: center;}
		.show {width: 80%;height: 400px;margin: 80px 0 0 6%;display: inline;float: left;}
	</style>
	<script type="text/javascript">
		
		$(function() {
			var name = '${stuLesson.lname}';
			$.post("${pageContext.request.contextPath}/lesson/getData?lid="+'${stuLesson.lid}', "", function(data) {
				console.table(JSON.parse(data));
				var title = name+"成绩统计";
				init(title, JSON.parse(data));
			});
		});
		
		function init(title, data) {
		    $('#xk').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: title
		        },
		        subtitle: {
		            text: '数据来源: 学生信息管理系统'
		        },
		        xAxis: {
		            categories: [''],
		            crosshair: true
		        },
		        credits: {  
		            enabled: false     //不显示LOGO 
		        },
		        yAxis: {
		            min: 0,
		            tickInterval: 1,
		            title: {
		                text: '人数'
		            }
		        },
		        plotOptions: {
                    column:{
                        dataLabels:{
                            enabled:true, // dataLabels设为true
                            style:{
                                color:'#f66'
                            }
                        }
                    }
      			},
		        series: data
		    });
		}
		
	
	</script>
  </head>
  <body>
	<div id="vLocation">
		当前位置：课程管理 / 课程列表  / <a href="javascript:void(0)" style="color: #0088cc;">${stuLesson.lname }成绩统计</a>
	</div>
	<div id="infoDiv">
		<div id="xk" class="show"  style="min-width:400px;height:400px"></div>
	</div>
  </body>
</html>
