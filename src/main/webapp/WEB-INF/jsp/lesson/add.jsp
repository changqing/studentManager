<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
  <head>
    <title>添加课程信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.css" />
	<script type="text/javascript" src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<style type="text/css">
		body {background-color: #f5f5f5;font-size: 16px;}
		#vLocation {height: 20px;padding: 10px 15px;list-style: none;background-color: #f1f1f1;font-size: 13px;}
		#infoDiv {width: 100%;}
		#infoTable {width: 40%;margin: 20px 0 0 25%;font-size: 16px;}
		.leftTD {width: 130px;height: 40px;text-align: right;font-family: 微软雅黑,宋体, 'Arial Narrow', HELVETICA;}
		.rightTD {height: 40px;padding-left: 20px;text-align: left;/* font-family: 微软雅黑,宋体, 'Arial Narrow', HELVETICA;font-weight: bold; */color: #08c;}
		.rightTD input {width: 150px;height: 24px;}
		#subBtn {display: inline-block;width: 80px;margin-left: 30px;}
		h4 {margin: 20px 15px;color: #777;}
		textarea {overflow:hidden}
	</style>
  </head>
  <body>
	<div id="vLocation">
		当前位置&nbsp;：课程管理&nbsp;&nbsp;<span class="divider">/</span>&nbsp;&nbsp;<a href="javascript:void(0)">添加课程</a>
	</div>
	<div id="infoDiv">
		<form id="saveForm" action="${pageContext.request.contextPath}/lesson/save" method="post">
			<input type="hidden" name="tid" value="${loginUser.id }"/>
			<input type="hidden" name="tname" value="${loginUser.truename }"/>
			<table id="infoTable">
				<tr>
					<td class="leftTD">课程名称</td>
					<td class="rightTD"><input type="text" id="" name="name" required="required"/></td>
				</tr>
				<tr>
					<td class="leftTD">学时</td>
					<td class="rightTD"><input type="number" id="" name="xueshi" required="required"/></td>
				</tr>
				<tr>
					<td class="leftTD">教室</td>
					<td class="rightTD"><input type="text" id="" name="address" required="required"/></td>
				</tr>
				<tr>
					<td class="leftTD">时间</td>
					<td class="rightTD"><input type="text" id="" name="time" required="required"/></td>
				</tr>
				<tr>
					<td class="leftTD"></td>
					<td class="rightTD"><input type="submit" value="提交"/></td>
				</tr>
			</table>
		</form>
	</div>
  </body>
</html>
